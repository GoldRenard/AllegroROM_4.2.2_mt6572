// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.apn;

import android.app.IntentService;
import android.content.*;
import android.content.res.Resources;
import android.database.SQLException;
import android.net.Uri;
import android.os.RemoteException;
import android.os.ServiceManager;
import com.android.internal.telephony.ITelephony;
import com.android.internal.telephony.PhoneConstants;
import com.android.settings.Utils;
import com.mediatek.settings.ext.IReplaceApnProfileExt;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.mediatek.apn:
//            ApnUtils

public class OmacpApnReceiverService extends IntentService
{

    private static final String ACTION_BROADCAST = "broadcast_receiver";
    private static final String ACTION_OMACP_RESULT = "com.mediatek.omacp.settings.result";
    private static final String APN_APN = "NAP-ADDRESS";
    private static final String APN_AUTH_TYPE = "AUTHTYPE";
    private static final long APN_EXIST = 0L;
    private static final String APN_ID = "APN-ID";
    private static final String APN_MMSC = "MMSC";
    private static final String APN_MMS_PORT = "MMS-PORT";
    private static final String APN_MMS_PROXY = "MMS-PROXY";
    private static final String APN_NAME = "NAP-NAME";
    private static final String APN_NAP_ID = "NAPID";
    private static final long APN_NO_UPDATE = -1L;
    private static final String APN_PASSWORD = "AUTHSECRET";
    private static final String APN_PORT = "PORTNBR";
    private static final String APN_PROXY = "PXADDR";
    private static final String APN_PROXY_ID = "PROXY-ID";
    private static final String APN_SERVER = "SERVER";
    private static final String APN_SETTING_INTENT = "apn_setting_intent";
    private static final String APN_TYPE = "APN-TYPE";
    private static final String APN_USERNAME = "AUTHNAME";
    private static final String APP_ID = "appId";
    private static final String APP_ID_APN = "apn";
    private static final String MMS_TYPE = "mms";
    private static final String NAP_AUTH_INFO = "NAPAUTHINFO";
    private static final String PORT = "PORT";
    private static final String TAG = "OmacpApnReceiverService";
    private static int sAuthType = -1;
    private static Context sCONTEXT;
    private String mApn;
    private String mApnId;
    private String mAuthType;
    private ArrayList mIntentList;
    private boolean mIsMmsApn;
    private String mMcc;
    private String mMmsPort;
    private String mMmsProxy;
    private String mMmsc;
    private String mMnc;
    private String mName;
    private String mNapId;
    private String mNumeric;
    private String mPassword;
    private String mPort;
    private Uri mPreferedUri;
    private String mProxy;
    private String mProxyId;
    private IReplaceApnProfileExt mReplaceApnExt;
    private boolean mResult;
    private String mServer;
    private int mSimId;
    private ITelephony mTelephonyService;
    private String mType;
    private Uri mUri;
    private String mUserName;

    public OmacpApnReceiverService()
    {
        super("OmacpApnReceiverService");
        mIsMmsApn = false;
        mResult = true;
    }

    private void extractAPN(Intent intent, Context context)
    {
        mName = intent.getStringExtra("NAP-NAME");
        if (mName == null || mName.length() < 1)
            mName = context.getResources().getString(0x7f0b0807);
        mApn = intent.getStringExtra("NAP-ADDRESS");
        mProxy = intent.getStringExtra("PXADDR");
        getPort(intent);
        getNapAuthInfo(intent);
        mServer = intent.getStringExtra("SERVER");
        mMmsc = intent.getStringExtra("MMSC");
        mMmsProxy = intent.getStringExtra("MMS-PROXY");
        mMmsPort = intent.getStringExtra("MMS-PORT");
        mType = intent.getStringExtra("APN-TYPE");
        mApnId = intent.getStringExtra("APN-ID");
        mNapId = intent.getStringExtra("NAPID");
        mProxyId = intent.getStringExtra("PROXY-ID");
        mIsMmsApn = "mms".equalsIgnoreCase(mType);
        Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("extractAPN: mName: ").append(mName).append(" | mApn: ").append(mApn).append(" | mProxy: ").append(mProxy).append(" | mServer: ").append(mServer).append(" | mMmsc: ").append(mMmsc).append(" | mMmsProxy: ").append(mMmsProxy).append(" | mMmsPort: ").append(mMmsPort).append(" | mType: ").append(mType).append(" | mApnId: ").append(mApnId).append(" | mNapId: ").append(mNapId).append(" | mMmsPort: ").append(mMmsPort).append(" | mProxyId: ").append(mProxyId).append(" | mIsMmsApn: ").append(mIsMmsApn).toString());
    }

    private void getNapAuthInfo(Intent intent)
    {
label0:
        {
            mUserName = null;
            mPassword = null;
            mAuthType = null;
            sAuthType = -1;
            ArrayList arraylist = (ArrayList)intent.getExtra("NAPAUTHINFO");
            if (arraylist != null && arraylist.size() > 0)
            {
                HashMap hashmap = (HashMap)arraylist.get(0);
                mUserName = (String)hashmap.get("AUTHNAME");
                mPassword = (String)hashmap.get("AUTHSECRET");
                mAuthType = (String)hashmap.get("AUTHTYPE");
                if (mAuthType != null)
                {
                    if (!"PAP".equalsIgnoreCase(mAuthType))
                        break label0;
                    sAuthType = 1;
                }
            }
            return;
        }
        if ("CHAP".equalsIgnoreCase(mAuthType))
        {
            sAuthType = 2;
            return;
        } else
        {
            sAuthType = 3;
            return;
        }
    }

    private void getPort(Intent intent)
    {
        mPort = null;
        ArrayList arraylist = (ArrayList)intent.getExtra("PORT");
        if (arraylist != null && arraylist.size() > 0)
            mPort = (String)((HashMap)arraylist.get(0)).get("PORTNBR");
    }

    private boolean initState(Intent intent)
    {
        mSimId = intent.getIntExtra("simId", -2);
        Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("GEMINI_SIM_ID_KEY = ").append(mSimId).toString());
        mNumeric = ApnUtils.NUMERIC_LIST[mSimId];
        mPreferedUri = ApnUtils.PREFERRED_URI_LIST[mSimId];
        Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("initState: mSimId: ").append(mSimId).append(" | mNumeric: ").append(mNumeric).append(" | mPreferedUri: ").append(mPreferedUri).toString());
        return verifyMccMnc(mNumeric);
    }

    public static void processBroadcastIntent(Context context, Intent intent)
    {
        sCONTEXT = context;
        Intent intent1 = new Intent(context, com/mediatek/apn/OmacpApnReceiverService);
        intent1.setAction("broadcast_receiver");
        intent1.putExtra("android.intent.extra.INTENT", intent);
        Xlog.d("OmacpApnReceiverService", "startService");
        context.startService(intent1);
    }

    private void sendFeedback(Context context)
    {
        Intent intent = new Intent();
        intent.setAction("com.mediatek.omacp.settings.result");
        intent.putExtra("appId", "apn");
        intent.putExtra("result", mResult);
        context.sendBroadcast(intent);
    }

    private boolean setCurrentApn(Context context, long l, Uri uri)
    {
        int i = 0;
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("apn_id", Long.valueOf(l));
        ContentResolver contentresolver = context.getContentResolver();
        try
        {
            i = contentresolver.update(uri, contentvalues, null, null);
            Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("update preferred uri ,row = ").append(i).toString());
        }
        catch (SQLException sqlexception)
        {
            Xlog.d("OmacpApnReceiverService", "SetCurrentApn SQLException happened!");
        }
        return i > 0;
    }

    private void updateApn(Context context, Uri uri, String s, String s1, String s2, ContentValues contentvalues, String s3, 
            Uri uri1, int i)
    {
        long l1;
        ContentValues contentvalues1;
        long l = mReplaceApnExt.replaceApn(context, uri, s, s1, s2, contentvalues, s3);
        Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("replace number = ").append(l).toString());
        l1 = l;
        if (l != -1L)
            break MISSING_BLOCK_LABEL_167;
        contentvalues1 = addMVNOItem(contentvalues, i);
        Uri uri2 = context.getContentResolver().insert(uri, contentvalues1);
        if (uri2 != null)
            try
            {
                Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("uri = ").append(uri2).toString());
                if (uri2.getPathSegments().size() == 2)
                {
                    l1 = Long.parseLong(uri2.getLastPathSegment());
                    Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("insert row id = ").append(l1).toString());
                }
            }
            catch (SQLException sqlexception)
            {
                Xlog.d("OmacpApnReceiverService", "insert SQLException happened!");
                mResult = false;
            }
        Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("insert number = ").append(l1).toString());
        if (mIsMmsApn)
        {
            if (l1 == -1L)
            {
                mResult = false;
                Xlog.d("OmacpApnReceiverService", "mms ,insertNum is APN_NO_UPDATE ,mResult = false");
            }
        } else
        {
            if (l1 == -1L)
            {
                mResult = false;
                Xlog.d("OmacpApnReceiverService", "not mms ,insertNum is APN_NO_UPDATE ,mResult = false");
                return;
            }
            if (l1 == 0L)
            {
                mResult = true;
                Xlog.d("OmacpApnReceiverService", "not mms ,  insertNum is APN_EXIST ,mResult = true");
                return;
            }
            if (i == mSimId)
            {
                mResult = setCurrentApn(context, l1, uri1);
                Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("set current apn result , mResult = ").append(mResult).toString());
                return;
            }
        }
        return;
    }

    private void validateProfile(ContentValues contentvalues)
    {
        contentvalues.put(ApnUtils.PROJECTION[1], mName);
        contentvalues.put(ApnUtils.PROJECTION[2], ApnUtils.checkNotSet(mApn));
        contentvalues.put(ApnUtils.PROJECTION[3], ApnUtils.checkNotSet(mProxy));
        contentvalues.put(ApnUtils.PROJECTION[4], ApnUtils.checkNotSet(mPort));
        contentvalues.put(ApnUtils.PROJECTION[5], ApnUtils.checkNotSet(mUserName));
        contentvalues.put(ApnUtils.PROJECTION[6], ApnUtils.checkNotSet(mServer));
        contentvalues.put(ApnUtils.PROJECTION[7], ApnUtils.checkNotSet(mPassword));
        contentvalues.put(ApnUtils.PROJECTION[8], ApnUtils.checkNotSet(mMmsc));
        contentvalues.put(ApnUtils.PROJECTION[9], mMcc);
        contentvalues.put(ApnUtils.PROJECTION[10], mMnc);
        contentvalues.put(ApnUtils.PROJECTION[12], ApnUtils.checkNotSet(mMmsProxy));
        contentvalues.put(ApnUtils.PROJECTION[13], ApnUtils.checkNotSet(mMmsPort));
        contentvalues.put(ApnUtils.PROJECTION[14], Integer.valueOf(sAuthType));
        contentvalues.put(ApnUtils.PROJECTION[15], ApnUtils.checkNotSet(mType));
        contentvalues.put(ApnUtils.PROJECTION[16], Integer.valueOf(2));
        contentvalues.put(ApnUtils.PROJECTION[17], ApnUtils.checkNotSet(mApnId));
        contentvalues.put(ApnUtils.PROJECTION[18], ApnUtils.checkNotSet(mNapId));
        contentvalues.put(ApnUtils.PROJECTION[19], ApnUtils.checkNotSet(mProxyId));
        contentvalues.put(ApnUtils.PROJECTION[11], mNumeric);
    }

    private boolean verifyMccMnc(String s)
    {
        if (mNumeric != null && mNumeric.length() > 4)
        {
            String s1 = mNumeric.substring(0, 3);
            String s2 = mNumeric.substring(3);
            mMcc = s1;
            mMnc = s2;
            Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("mcc&mnc is right , mMcc = ").append(mMcc).append(" mMnc = ").append(mMnc).toString());
        } else
        {
            mResult = false;
            Xlog.d("OmacpApnReceiverService", "mcc&mnc is wrong , set mResult = false");
        }
        return mResult;
    }

    ContentValues addMVNOItem(ContentValues contentvalues, int i)
    {
        boolean flag1 = mTelephonyService.isIccCardProviderAsMvnoGemini(i);
        boolean flag = flag1;
_L2:
        String s2;
        Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("isMVNO = ").append(flag).toString());
        if (!flag)
            break MISSING_BLOCK_LABEL_187;
        RemoteException remoteexception;
        String s;
        String s1;
        try
        {
            s = mTelephonyService.getSpNameInEfSpnGemini(i);
            s1 = mTelephonyService.isOperatorMvnoForImsiGemini(i);
            s2 = mTelephonyService.isOperatorMvnoForEfPnnGemini(i);
            Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("spn = ").append(s).toString());
            Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("imsi = ").append(s1).toString());
            Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("pnn = ").append(s2).toString());
        }
        catch (RemoteException remoteexception1)
        {
            Xlog.d("OmacpApnReceiverService", "RemoteException");
            return contentvalues;
        }
        if (s1 == null)
            break; /* Loop/switch isn't completed */
        if (s1.isEmpty())
            break; /* Loop/switch isn't completed */
        contentvalues.put("imsi", s1);
        return contentvalues;
        remoteexception;
        Xlog.d("OmacpApnReceiverService", "RemoteException");
        flag = false;
        if (true) goto _L2; else goto _L1
_L1:
        if (s == null)
            break MISSING_BLOCK_LABEL_242;
        if (s.isEmpty())
            break MISSING_BLOCK_LABEL_242;
        contentvalues.put("spn", s);
        return contentvalues;
        contentvalues.put("pnn", s2);
        return contentvalues;
    }

    protected void onHandleIntent(Intent intent)
    {
        String s = intent.getAction();
        Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("get action = ").append(s).toString());
        if (!"broadcast_receiver".equals(s))
            return;
        mReplaceApnExt = Utils.getReplaceApnPlugin(sCONTEXT);
        Context _tmp = sCONTEXT;
        mTelephonyService = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        mIntentList = ((Intent)intent.getParcelableExtra("android.intent.extra.INTENT")).getParcelableArrayListExtra("apn_setting_intent");
        if (mIntentList == null)
        {
            mResult = false;
            sendFeedback(sCONTEXT);
            Xlog.e("OmacpApnReceiverService", "mIntentList == null");
            return;
        }
        int i = mIntentList.size();
        Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("apn list size is ").append(i).toString());
        if (i <= 0)
        {
            mResult = false;
            sendFeedback(sCONTEXT);
            Xlog.e("OmacpApnReceiverService", "Intent list size is wrong");
            return;
        }
        if (!initState((Intent)mIntentList.get(0)))
        {
            sendFeedback(sCONTEXT);
            Xlog.e("OmacpApnReceiverService", "Can not get MCC+MNC");
            return;
        }
        Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("PhoneConstants.GEMINI_SIM_NUM ").append(PhoneConstants.GEMINI_SIM_NUM).toString());
        for (int j = 0; mResult && j < PhoneConstants.GEMINI_SIM_NUM; j++)
        {
            mUri = ApnUtils.URI_LIST[j];
            Xlog.d("OmacpApnReceiverService", (new StringBuilder()).append("slotId = ").append(j).append(" mUri = ").append(mUri).append(" mNumeric = ").append(mNumeric).append(" mPreferedUri = ").append(mPreferedUri).toString());
            for (int k = 0; mResult && k < i; k++)
            {
                extractAPN((Intent)mIntentList.get(k), sCONTEXT);
                ContentValues contentvalues = new ContentValues();
                validateProfile(contentvalues);
                updateApn(sCONTEXT, mUri, mApn, mApnId, mName, contentvalues, mNumeric, mPreferedUri, j);
            }

        }

        sendFeedback(sCONTEXT);
    }

}
