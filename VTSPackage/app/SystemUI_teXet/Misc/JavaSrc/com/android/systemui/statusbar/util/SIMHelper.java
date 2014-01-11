// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.util;

import android.content.Context;
import android.os.*;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import com.android.internal.telephony.*;
import com.mediatek.telephony.SimInfoManager;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;
import java.util.*;

public class SIMHelper
{

    private static final int MOBILE_ICON_COUNT = 4;
    private static final int SIM_STATUS_COUNT = 9;
    public static final String TAG = "SIMHelper";
    private static int mGeminiSimNum;
    private static ITelephonyRegistry mRegistry = com.android.internal.telephony.ITelephonyRegistry.Stub.asInterface(ServiceManager.getService("telephony.registry"));
    private static ITelephonyRegistry mRegistry2 = com.android.internal.telephony.ITelephonyRegistry.Stub.asInterface(ServiceManager.getService("telephony.registry2"));
    private static TelephonyManagerEx mTMEx = null;
    private static String sBaseband = null;
    private static ITelephony sITelephony;
    private static String sIsOptr = null;
    private static int sMobileIconResIds[];
    private static List sSimInfos;
    private static int sSimStatusViews[];
    private static boolean simInserted[];

    private SIMHelper()
    {
    }

    public static boolean checkSimCardDataConn()
    {
        int i = getSimIndicatorState();
        return i == 6 || i == 7 || i == 8 || i == 5;
    }

    public static boolean checkSimCardDataConnBySlotId(Context context, int i)
    {
        com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = getSIMInfoBySlot(context, i);
        if (siminforecord != null)
        {
            int j = getSimIndicatorStateGemini(siminforecord.mSimSlotId);
            if (j == 6 || j == 7 || j == 8 || j == 5)
                return true;
        }
        return false;
    }

    public static int getDataConnectionIconIdBySlotId(Context context, int i)
    {
        com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = getSIMInfoBySlot(context, i);
        if (siminforecord != null)
        {
            if (sMobileIconResIds == null)
                initMobileIcons();
            if (siminforecord.mColor != -1)
                return sMobileIconResIds[siminforecord.mColor];
        }
        return -1;
    }

    public static TelephonyManagerEx getDefault(Context context)
    {
        if (mTMEx == null)
            mTMEx = new TelephonyManagerEx(context);
        return mTMEx;
    }

    public static long getDefaultSIM(Context context, String s)
    {
        return android.provider.Settings.System.getLong(context.getContentResolver(), s, -1L);
    }

    public static ITelephony getITelephony()
    {
        ITelephony itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        sITelephony = itelephony;
        return itelephony;
    }

    public static int getSIMColorIdBySlot(Context context, int i)
    {
        com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = getSIMInfoBySlot(context, i);
        if (siminforecord == null)
            return -1;
        else
            return siminforecord.mColor;
    }

    public static long getSIMIdBySlot(Context context, int i)
    {
        com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = getSIMInfoBySlot(context, i);
        if (siminforecord == null)
            return 0L;
        else
            return siminforecord.mSimInfoId;
    }

    public static com.mediatek.telephony.SimInfoManager.SimInfoRecord getSIMInfo(Context context, long l)
    {
        if (sSimInfos == null || sSimInfos.size() == 0)
            getSIMInfoList(context);
        for (Iterator iterator = sSimInfos.iterator(); iterator.hasNext();)
        {
            com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = (com.mediatek.telephony.SimInfoManager.SimInfoRecord)iterator.next();
            if (siminforecord.mSimInfoId == l)
                return siminforecord;
        }

        return null;
    }

    public static com.mediatek.telephony.SimInfoManager.SimInfoRecord getSIMInfoBySlot(Context context, int i)
    {
        if (!isSimInserted(i))
            return null;
        if (sSimInfos == null || sSimInfos.size() == 0)
            getSIMInfoList(context);
        if (sSimInfos == null)
            return null;
        for (Iterator iterator = sSimInfos.iterator(); iterator.hasNext();)
        {
            com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = (com.mediatek.telephony.SimInfoManager.SimInfoRecord)iterator.next();
            if (siminforecord.mSimSlotId == i)
                return siminforecord;
        }

        return null;
    }

    public static List getSIMInfoList(Context context)
    {
        if (sSimInfos == null || sSimInfos.size() == 0)
            sSimInfos = getSortedSIMInfoList(context);
        return sSimInfos;
    }

    public static int getSIMStateIcon(int i)
    {
        if (i > -1 && i < 9)
        {
            if (sSimStatusViews == null)
                initStatusIcons();
            return sSimStatusViews[i];
        } else
        {
            return -1;
        }
    }

    public static int getSIMStateIcon(com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord)
    {
        return getSIMStateIcon(getSimIndicatorStateGemini(siminforecord.mSimSlotId));
    }

    public static int getSimIndicatorState()
    {
        int i = -1;
        ITelephony itelephony;
        int j;
        try
        {
            itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        }
        catch (RemoteException remoteexception)
        {
            return i;
        }
        catch (NullPointerException nullpointerexception)
        {
            return i;
        }
        if (itelephony == null)
            break MISSING_BLOCK_LABEL_26;
        j = itelephony.getSimIndicatorState();
        i = j;
        return i;
    }

    public static int getSimIndicatorStateGemini(int i)
    {
        ITelephony itelephony;
        int j;
        try
        {
            itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        }
        catch (RemoteException remoteexception)
        {
            return -1;
        }
        catch (NullPointerException nullpointerexception)
        {
            return -1;
        }
        if (itelephony == null)
            break MISSING_BLOCK_LABEL_71;
        j = itelephony.getSimIndicatorStateGemini(i);
        if (j != 7)
            break MISSING_BLOCK_LABEL_68;
        if (2 == TelephonyManagerEx.getDefault().getDataState(i))
            break MISSING_BLOCK_LABEL_68;
        Xlog.d("SIMHelper", (new StringBuilder()).append("getSimIndicatorStateGemini called, fallback to normal and simId is ").append(i).toString());
        j = 5;
        return j;
        return -1;
    }

    private static List getSortedSIMInfoList(Context context)
    {
        List list = SimInfoManager.getInsertedSimInfoList(context);
        Collections.sort(list, new Comparator() {

            public int compare(com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord, com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord1)
            {
                if (siminforecord.mSimSlotId < siminforecord1.mSimSlotId)
                    return -1;
                return siminforecord.mSimSlotId <= siminforecord1.mSimSlotId ? 0 : 1;
            }

            public volatile int compare(Object obj, Object obj1)
            {
                return compare((com.mediatek.telephony.SimInfoManager.SimInfoRecord)obj, (com.mediatek.telephony.SimInfoManager.SimInfoRecord)obj1);
            }

        }
);
        return list;
    }

    public static void initMobileIcons()
    {
        if (sMobileIconResIds == null)
        {
            sMobileIconResIds = new int[4];
            sMobileIconResIds[0] = 0x7f020067;
            sMobileIconResIds[1] = 0x7f02006c;
            sMobileIconResIds[2] = 0x7f02006a;
            sMobileIconResIds[3] = 0x7f02006d;
        }
    }

    public static void initStatusIcons()
    {
        if (sSimStatusViews == null)
        {
            sSimStatusViews = new int[9];
            sSimStatusViews[1] = 0x2020112;
            sSimStatusViews[2] = 0x20200ff;
            sSimStatusViews[3] = 0x20200f8;
            sSimStatusViews[4] = 0x2020119;
            sSimStatusViews[6] = 0x2020117;
            sSimStatusViews[7] = 0x20200ef;
            sSimStatusViews[8] = 0x2020118;
        }
    }

    public static boolean is3GSupported()
    {
        if (sBaseband == null)
            sBaseband = SystemProperties.get("gsm.baseband.capability");
        return sBaseband == null || sBaseband.length() == 0 || Integer.parseInt(sBaseband) > 3;
    }

    public static boolean isSimInserted(int i)
    {
        if (simInserted == null)
            updateSimInsertedStatus();
        if (simInserted != null)
        {
            if (i <= -1 + simInserted.length)
            {
                Xlog.d("SIMHelper", (new StringBuilder()).append("isSimInserted(").append(i).append("), SimInserted=").append(simInserted[i]).toString());
                return simInserted[i];
            } else
            {
                Xlog.d("SIMHelper", (new StringBuilder()).append("isSimInserted(").append(i).append("), indexOutOfBound, arraysize=").append(simInserted.length).toString());
                return false;
            }
        } else
        {
            Xlog.d("SIMHelper", "isSimInserted, simInserted is null");
            return false;
        }
    }

    public static boolean isTelephonyDataConnected(Context context)
    {
        TelephonyManager telephonymanager = (TelephonyManager)context.getSystemService("phone");
        if (telephonymanager != null && 2 == telephonymanager.getDataState())
        {
            Xlog.d("SIMHelper", (new StringBuilder()).append("isTelephonyDataConnected called, the data state is ").append(telephonymanager.getDataState()).toString());
            return true;
        } else
        {
            return false;
        }
    }

    public static boolean isTelephonyDataConnectedBySimId(int i)
    {
        if (2 != TelephonyManagerEx.getDefault().getDataState(i))
            break MISSING_BLOCK_LABEL_39;
        Xlog.d("SIMHelper", (new StringBuilder()).append("isTelephonyDataConnectedBySimId called, data is connected and simId is ").append(i).toString());
        return true;
        try
        {
            Xlog.d("SIMHelper", (new StringBuilder()).append("isTelephonyDataConnectedBySimId called, data is not connected and simId is ").append(i).toString());
        }
        catch (NullPointerException nullpointerexception)
        {
            return false;
        }
        return false;
    }

    public static void listen(PhoneStateListener phonestatelistener, int i, int j)
    {
        boolean flag;
        Boolean boolean1;
        if (getITelephony() != null)
            flag = true;
        else
            flag = false;
        try
        {
            boolean1 = Boolean.valueOf(flag);
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        catch (NullPointerException nullpointerexception)
        {
            return;
        }
        if (j != 0)
            break MISSING_BLOCK_LABEL_42;
        mRegistry.listen("SystemUI SIMHelper", phonestatelistener.getCallback(), i, boolean1.booleanValue());
        return;
        if (1 != j)
            break MISSING_BLOCK_LABEL_69;
        mRegistry2.listen("SystemUI SIMHelper", phonestatelistener.getCallback(), i, boolean1.booleanValue());
        return;
        if (2 != j)
            break MISSING_BLOCK_LABEL_109;
        if (PhoneConstants.GEMINI_SIM_NUM >= 3)
        {
            com.android.internal.telephony.ITelephonyRegistry.Stub.asInterface(ServiceManager.getService("telephony.registry3")).listen("SystemUI SIMHelper", phonestatelistener.getCallback(), i, boolean1.booleanValue());
            return;
        }
        if (3 != j)
            break MISSING_BLOCK_LABEL_148;
        if (PhoneConstants.GEMINI_SIM_NUM >= 4)
            com.android.internal.telephony.ITelephonyRegistry.Stub.asInterface(ServiceManager.getService("telephony.registry4")).listen("SystemUI SIMHelper", phonestatelistener.getCallback(), i, boolean1.booleanValue());
    }

    public static void setDefaultSIM(Context context, String s, long l)
    {
        android.provider.Settings.System.putLong(context.getContentResolver(), s, l);
    }

    public static void updateSIMInfos(Context context)
    {
        sSimInfos = null;
        sSimInfos = getSortedSIMInfoList(context);
    }

    public static void updateSimInsertedStatus()
    {
        ITelephony itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.checkService("phone"));
        if (itelephony == null) goto _L2; else goto _L1
_L1:
        if (simInserted == null)
            simInserted = new boolean[mGeminiSimNum];
          goto _L3
_L5:
        int i;
        if (i >= mGeminiSimNum)
            break MISSING_BLOCK_LABEL_100;
        simInserted[i] = itelephony.isSimInsert(i);
        Xlog.d("SIMHelper", (new StringBuilder()).append("updateSimInsertedStatus, simInserted(").append(i).append(") = ").append(simInserted[i]).toString());
        i++;
        continue; /* Loop/switch isn't completed */
        RemoteException remoteexception;
        remoteexception;
        remoteexception.printStackTrace();
        return;
_L2:
        Xlog.d("SIMHelper", "updateSimInsertedStatus, phone is null");
        return;
_L3:
        i = 0;
        if (true) goto _L5; else goto _L4
_L4:
    }

    static 
    {
        mGeminiSimNum = PhoneConstants.GEMINI_SIM_NUM;
    }
}
