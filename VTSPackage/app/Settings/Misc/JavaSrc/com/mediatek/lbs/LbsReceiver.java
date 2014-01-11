// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.lbs;

import android.content.*;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.widget.Toast;
import com.mediatek.common.agps.MtkAgpsManager;
import com.mediatek.common.agps.MtkAgpsProfile;
import com.mediatek.common.epo.MtkEpoClientManager;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;
import java.util.HashMap;

public class LbsReceiver extends BroadcastReceiver
{

    public static final String ACTION_OMA_CP = "com.mediatek.omacp.settings";
    public static final String ACTION_OMA_CP_CAPABILITY = "com.mediatek.omacp.capability";
    public static final String ACTION_OMA_CP_CAPABILITY_FEEDBACK = "com.mediatek.omacp.capability.result";
    public static final String ACTION_OMA_CP_FEEDBACK = "com.mediatek.omacp.settings.result";
    public static final String ACTION_OMA_UP_FEEDBACK = "com.mediatek.omacp.settings.result";
    public static final String APP_ID = "ap0004";
    private static final String EM_ENABLE_KEY = "EM_Indication";
    public static final String EXTRA_APP_ID = "appId";
    private static final String EXTRA_SUPL = "supl";
    private static final String EXTRA_SUPL_PROVIDER_ID = "supl_provider_id";
    private static final String EXTRA_SUPL_SEVER_ADDRESS = "supl_server_addr";
    private static final String EXTRA_SUPL_SEVER_ADDRESS_TYPE = "supl_addr_type";
    private static final String EXTRA_SUPL_SEVER_NAME = "supl_server_name";
    private static final String EXTRA_SUPL_TO_NAPID = "supl_to_napid";
    private static final String PREFERENCE_FILE = "com.android.settings_preferences";
    private static final int SLP_PORT = 7275;
    private static final int SLP_SHOW_TYPE = 2;
    private static final int SLP_TTL = 1;
    private static final String TAG = "Settings/LbsReceiver";
    private static final String UNKNOWN_VALUE = "UNKNOWN_VALUE";
    private MtkAgpsManager mAgpsMgr;
    private Context mContext;
    private String mCurOperatorCodeOne;
    private MtkEpoClientManager mEpoMgr;

    public LbsReceiver()
    {
        mAgpsMgr = null;
        mEpoMgr = null;
    }

    private void dealWithOmaUpdataResult(boolean flag, String s)
    {
        Toast.makeText(mContext, (new StringBuilder()).append("Deal with OMA CP operation: ").append(s).toString(), 1).show();
        log((new StringBuilder()).append("Deal with OMA UP operation: ").append(s).toString());
        Intent intent = new Intent();
        intent.setAction("com.mediatek.omacp.settings.result");
        intent.putExtra("appId", "ap0004");
        intent.putExtra("result", flag);
        mContext.sendBroadcast(intent);
    }

    private void handleAgpsDisableUpdate(Context context, Intent intent)
    {
        boolean flag = intent.getExtras().getBoolean("status", false);
        context.getSharedPreferences("agps_disable", 0).edit().putBoolean("status", flag).putBoolean("changed", true).commit();
    }

    private void handleAgpsOmaProfileUpdate(Context context, Intent intent)
    {
        Bundle bundle = intent.getExtras();
        String s = bundle.getString("name");
        String s1 = bundle.getString("addr");
        String s2 = bundle.getString("backupSlpNameVar");
        int i = bundle.getInt("port");
        int j = bundle.getInt("tls");
        int k = bundle.getInt("showType");
        String s3 = bundle.getString("code");
        String s4 = bundle.getString("addrType");
        String s5 = bundle.getString("providerId");
        String s6 = bundle.getString("defaultApn");
        context.getSharedPreferences("omacp_profile", 0).edit().putString("name", s).putString("addr", s1).putString("backupSlpNameVar", s2).putInt("port", i).putInt("tls", j).putInt("showType", k).putString("code", s3).putString("addrType", s4).putString("providerId", s5).putString("defaultApn", s6).putBoolean("changed", true).commit();
    }

    private void handleAgpsProfileUpdate(Context context, Intent intent)
    {
        Bundle bundle = intent.getExtras();
        String s = bundle.getString("name");
        String s1 = bundle.getString("addr");
        String s2 = bundle.getString("backupSlpNameVar");
        int i = bundle.getInt("port");
        int j = bundle.getInt("tls");
        int k = bundle.getInt("showType");
        String s3 = bundle.getString("code");
        String s4 = bundle.getString("addrType");
        String s5 = bundle.getString("providerId");
        String s6 = bundle.getString("defaultApn");
        String s7 = bundle.getString("optionApn");
        String s8 = bundle.getString("optionApn2");
        String s9 = bundle.getString("appId");
        context.getSharedPreferences("agps_profile", 0).edit().putString("name", s).putString("addr", s1).putString("backupSlpNameVar", s2).putInt("port", i).putInt("tls", j).putInt("showType", k).putString("code", s3).putString("addrType", s4).putString("providerId", s5).putString("defaultApn", s6).putString("optionApn", s7).putString("optionApn2", s8).putString("appId", s9).putBoolean("changed", true).commit();
    }

    private void handleAgpsStatusUpdate(Context context, Intent intent)
    {
        Bundle bundle = intent.getExtras();
        boolean flag = bundle.getBoolean("status", false);
        int i = bundle.getInt("roaming", 0);
        int j = bundle.getInt("molrPositionType", 0);
        int k = bundle.getInt("niEnable", 1);
        context.getSharedPreferences("agps_status", 0).edit().putBoolean("status", flag).putInt("roaming", i).putInt("molrPositionType", j).putInt("niEnable", k).putBoolean("changed", true).commit();
    }

    private void handleBootCompleted(Context context, Intent intent)
    {
        SharedPreferences sharedpreferences = context.getSharedPreferences("agps_disable", 0);
        boolean flag = sharedpreferences.getBoolean("changed", false);
        boolean flag1 = false;
        if (flag)
            flag1 = sharedpreferences.getBoolean("status", false);
        log((new StringBuilder()).append("disableAfterReboot=").append(flag1).toString());
        SharedPreferences sharedpreferences1 = context.getSharedPreferences("agps_profile", 0);
        if (sharedpreferences1.getBoolean("changed", false))
        {
            MtkAgpsProfile mtkagpsprofile = new MtkAgpsProfile();
            mtkagpsprofile.name = sharedpreferences1.getString("name", null);
            mtkagpsprofile.addr = sharedpreferences1.getString("addr", null);
            mtkagpsprofile.backupSlpNameVar = sharedpreferences1.getString("backupSlpNameVar", null);
            mtkagpsprofile.port = sharedpreferences1.getInt("port", 0);
            mtkagpsprofile.tls = sharedpreferences1.getInt("tls", 0);
            mtkagpsprofile.showType = sharedpreferences1.getInt("showType", 0);
            mtkagpsprofile.code = sharedpreferences1.getString("code", null);
            mtkagpsprofile.addrType = sharedpreferences1.getString("addrType", null);
            mtkagpsprofile.providerId = sharedpreferences1.getString("providerId", null);
            mtkagpsprofile.defaultApn = sharedpreferences1.getString("defaultApn", null);
            mtkagpsprofile.optionApn = sharedpreferences1.getString("optionApn", null);
            mtkagpsprofile.optionApn2 = sharedpreferences1.getString("optionApn2", null);
            mtkagpsprofile.appId = sharedpreferences1.getString("appId", null);
            mAgpsMgr.setProfile(mtkagpsprofile);
        }
        SharedPreferences sharedpreferences2 = context.getSharedPreferences("agps_status", 0);
        if (sharedpreferences2.getBoolean("changed", false))
        {
            if (sharedpreferences2.getBoolean("status", false) && !flag1)
                mAgpsMgr.enable();
            else
                mAgpsMgr.disable();
            int i = sharedpreferences2.getInt("roaming", 0);
            int j = sharedpreferences2.getInt("molrPositionType", 0);
            int k = sharedpreferences2.getInt("niEnable", 0);
            MtkAgpsManager mtkagpsmanager = mAgpsMgr;
            boolean flag4;
            if (i == 0)
                flag4 = false;
            else
                flag4 = true;
            mtkagpsmanager.setRoamingEnable(flag4);
            MtkAgpsManager mtkagpsmanager1 = mAgpsMgr;
            boolean flag5;
            if (j == 0)
                flag5 = true;
            else
                flag5 = false;
            mtkagpsmanager1.setUpEnable(flag5);
            MtkAgpsManager mtkagpsmanager2 = mAgpsMgr;
            boolean flag6;
            if (k == 0)
                flag6 = false;
            else
                flag6 = true;
            mtkagpsmanager2.setNiEnable(flag6);
        } else
        {
            mAgpsMgr.extraCommand("USING_XML", null);
        }
        SharedPreferences sharedpreferences3 = context.getSharedPreferences("epo_status", 0);
        if (sharedpreferences3.getBoolean("changed", false))
        {
            boolean flag2 = sharedpreferences3.getBoolean("status", false);
            boolean flag3 = sharedpreferences3.getBoolean("auto", false);
            log((new StringBuilder()).append("status=").append(flag2).append(" auto=").append(flag3).toString());
            if (flag2)
                mEpoMgr.enable();
            if (flag3)
                mEpoMgr.enableAutoDownload(true);
            return;
        } else
        {
            mEpoMgr.extraCommand("USING_XML", null);
            return;
        }
    }

    private void handleEpoStatusUpdate(Context context, Intent intent)
    {
        Bundle bundle = intent.getExtras();
        boolean flag = bundle.getBoolean("status", false);
        boolean flag1 = bundle.getBoolean("auto", false);
        context.getSharedPreferences("epo_status", 0).edit().putBoolean("status", flag).putBoolean("auto", flag1).putBoolean("changed", true).commit();
    }

    private void handleOmaCpCapability(Context context, Intent intent)
    {
        log("get OMA CP capability broadcast result");
        Intent intent1 = new Intent();
        intent1.setAction("com.mediatek.omacp.capability.result");
        intent1.putExtra("appId", "ap0004");
        intent1.putExtra("supl", true);
        intent1.putExtra("supl_provider_id", false);
        intent1.putExtra("supl_server_name", true);
        intent1.putExtra("supl_to_napid", false);
        intent1.putExtra("supl_server_addr", true);
        intent1.putExtra("supl_addr_type", false);
        log("feedback OMA CP capability information");
        context.sendBroadcast(intent1);
    }

    private void handleOmaCpSetting(Context context, Intent intent)
    {
        log("get the OMA CP broadcast");
        String s = intent.getStringExtra("appId");
        if (s != null && s.equals("ap0004"))
        {
            int i = intent.getIntExtra("simId", 0);
            String s1 = intent.getStringExtra("PROVIDER-ID");
            String s2 = intent.getStringExtra("NAME");
            String s3 = "";
            String s4 = "";
            String s5 = "";
            Bundle bundle = intent.getExtras();
            ArrayList arraylist = (ArrayList)bundle.get("APPADDR");
            if (arraylist != null && !arraylist.isEmpty())
            {
                HashMap hashmap = (HashMap)arraylist.get(0);
                if (hashmap != null)
                {
                    s4 = (String)hashmap.get("ADDR");
                    s5 = (String)hashmap.get("ADDRTYPE");
                }
            }
            if (s4 != null && !s4.equals(""))
            {
                ArrayList arraylist1 = (ArrayList)bundle.get("TO-NAPID");
                if (arraylist1 != null && !arraylist1.isEmpty())
                    s3 = (String)arraylist1.get(0);
                log("current received omacp-pushed supl configuretion is");
                log((new StringBuilder()).append("simId=").append(i).append("providerId=").append(s1).append("slpName=").append(s2).append("defaultApn=").append(s3).toString());
                log((new StringBuilder()).append("address=").append(s4).append("addre type=").append(s5).toString());
                initSIMStatus(true, i);
                String s6 = mCurOperatorCodeOne;
                if (s6 != null && !"".equals(s6))
                {
                    Intent intent1 = new Intent("com.mediatek.agps.OMACP_UPDATED");
                    intent1.putExtra("code", s6);
                    intent1.putExtra("addr", s4);
                    MtkAgpsProfile mtkagpsprofile = new MtkAgpsProfile();
                    mtkagpsprofile.code = s6;
                    mtkagpsprofile.addr = s4;
                    if (s1 != null && !"".equals(s1))
                    {
                        intent1.putExtra("providerId", s1);
                        mtkagpsprofile.providerId = s1;
                    }
                    if (s2 != null && !"".equals(s2))
                    {
                        intent1.putExtra("name", s2);
                        mtkagpsprofile.name = s2;
                        intent1.putExtra("backupSlpNameVar", "");
                        mtkagpsprofile.backupSlpNameVar = "";
                    }
                    if (s3 != null && !"".equals(s3))
                    {
                        intent1.putExtra("defaultApn", s3);
                        mtkagpsprofile.defaultApn = s3;
                    }
                    if (s5 != null && !"".equals(s5))
                    {
                        intent1.putExtra("addrType", s5);
                        mtkagpsprofile.addrType = s5;
                    }
                    intent1.putExtra("port", 7275);
                    mtkagpsprofile.port = 7275;
                    intent1.putExtra("tls", 1);
                    mtkagpsprofile.tls = 1;
                    intent1.putExtra("showType", 2);
                    mtkagpsprofile.showType = 2;
                    mContext.sendBroadcast(intent1);
                    mAgpsMgr.setProfile(mtkagpsprofile);
                    dealWithOmaUpdataResult(true, "OMA CP update successfully finished");
                    return;
                } else
                {
                    dealWithOmaUpdataResult(false, (new StringBuilder()).append("invalide profile code:").append(s6).toString());
                    return;
                }
            } else
            {
                log("invalid oma cp pushed supl address");
                dealWithOmaUpdataResult(false, "invalide oma cp pushed supl address");
                return;
            }
        } else
        {
            log("get the OMA CP broadcast, but it's not for AGPS");
            return;
        }
    }

    private void initSIMStatus(boolean flag, int i)
    {
        mCurOperatorCodeOne = "";
        int j;
        if (flag)
        {
            TelephonyManagerEx telephonymanagerex = TelephonyManagerEx.getDefault();
            j = telephonymanagerex.getSimState(i);
            if (5 == j)
                mCurOperatorCodeOne = telephonymanagerex.getSimOperator(i);
        } else
        {
            TelephonyManager telephonymanager = (TelephonyManager)mContext.getSystemService("phone");
            j = telephonymanager.getSimState();
            if (5 == j)
                mCurOperatorCodeOne = telephonymanager.getSimOperator();
        }
        log((new StringBuilder()).append("sim1 card status is: ").append(j).toString());
        log((new StringBuilder()).append("sim1 operator code is: ").append(mCurOperatorCodeOne).toString());
    }

    private void log(String s)
    {
        Xlog.d("Settings/LbsReceiver", (new StringBuilder()).append(s).append(" ").toString());
    }

    public void onReceive(Context context, Intent intent)
    {
        mContext = context;
        String s = intent.getAction();
        log((new StringBuilder()).append("onReceive action=").append(s).toString());
        mAgpsMgr = (MtkAgpsManager)context.getSystemService("mtk-agps");
        mEpoMgr = (MtkEpoClientManager)context.getSystemService("mtk-epo-client");
        if (s.equals("android.intent.action.BOOT_COMPLETED"))
        {
            handleBootCompleted(context, intent);
        } else
        {
            if (s.equals("com.mediatek.agps.PROFILE_UPDATED"))
            {
                handleAgpsProfileUpdate(context, intent);
                return;
            }
            if (s.equals("com.mediatek.agps.STATUS_UPDATED"))
            {
                handleAgpsStatusUpdate(context, intent);
                return;
            }
            if (s.equals("com.mediatek.agps.DISABLE_UPDATED"))
            {
                handleAgpsDisableUpdate(context, intent);
                return;
            }
            if (s.equals("com.mediatek.agps.OMACP_UPDATED"))
            {
                handleAgpsOmaProfileUpdate(context, intent);
                return;
            }
            if (s.equals("com.mediatek.epo.STATUS_UPDATED"))
            {
                handleEpoStatusUpdate(context, intent);
                return;
            }
            if (s.equals("com.mediatek.omacp.settings"))
            {
                handleOmaCpSetting(context, intent);
                return;
            }
            if (s.equals("com.mediatek.omacp.capability"))
            {
                handleOmaCpCapability(context, intent);
                return;
            }
        }
    }
}
