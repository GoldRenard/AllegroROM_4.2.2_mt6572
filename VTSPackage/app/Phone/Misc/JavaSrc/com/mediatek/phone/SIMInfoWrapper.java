// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone;

import android.content.*;
import android.os.Handler;
import android.os.RegistrantList;
import android.provider.Telephony;
import android.util.Log;
import java.util.*;

public class SIMInfoWrapper
{

    private static final boolean DBG = true;
    private static final String TAG = "SIMInfoWrapper";
    private static List mAllSimInfoList = null;
    private static List mInsertedSimInfoList = null;
    private static boolean sIsNullResult = false;
    private static SIMInfoWrapper sSIMInfoWrapper;
    private HashMap mAllSimInfoMap;
    private Context mContext;
    private HashMap mInsertedSimInfoMap;
    private boolean mIsNeedToInitSimInfo;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final SIMInfoWrapper this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            SIMInfoWrapper.log((new StringBuilder()).append("onReceive(), action = ").append(s).toString());
            if (s.equals("android.intent.action.SIM_SETTING_INFO_CHANGED") || s.equals("android.intent.action.SIM_NAME_UPDATE") || s.equals("android.intent.action.SIM_INFO_UPDATE"))
                updateSimInfoCache();
        }

            
            {
                this$0 = SIMInfoWrapper.this;
                super();
            }
    }
;
    private HashMap mSimIdSlotIdPairs;
    private RegistrantList mSimInfoUpdateRegistrantList;
    private HashMap mSlotIdSimIdPairs;

    private SIMInfoWrapper()
    {
        mAllSimInfoMap = new HashMap();
        mInsertedSimInfoMap = new HashMap();
        mSlotIdSimIdPairs = new HashMap();
        mSimIdSlotIdPairs = new HashMap();
        mSimInfoUpdateRegistrantList = new RegistrantList();
        mAllSimInfoMap = new HashMap();
        mInsertedSimInfoMap = new HashMap();
        mSlotIdSimIdPairs = new HashMap();
        mSimIdSlotIdPairs = new HashMap();
    }

    private int getCheckedSimId(android.provider.Telephony.SIMInfo siminfo)
    {
        if (siminfo != null && siminfo.mSimId > 0L)
            return (int)siminfo.mSimId;
        StringBuilder stringbuilder = (new StringBuilder()).append("[getCheckedSimId]Wrong simId is ");
        long l;
        if (siminfo == null)
            l = -1L;
        else
            l = siminfo.mSimId;
        log(stringbuilder.append(l).toString());
        return -1;
    }

    public static SIMInfoWrapper getDefault()
    {
        com/mediatek/phone/SIMInfoWrapper;
        JVM INSTR monitorenter ;
        boolean flag = sIsNullResult;
        if (!flag) goto _L2; else goto _L1
_L1:
        SIMInfoWrapper siminfowrapper = null;
_L4:
        com/mediatek/phone/SIMInfoWrapper;
        JVM INSTR monitorexit ;
        return siminfowrapper;
_L2:
        if (sSIMInfoWrapper == null)
            sSIMInfoWrapper = new SIMInfoWrapper();
        if (sSIMInfoWrapper.mIsNeedToInitSimInfo)
        {
            sSIMInfoWrapper.initSimInfo();
            if (mAllSimInfoList != null && mInsertedSimInfoList != null)
            {
                log((new StringBuilder()).append("getDefault() initSimInfo successfully. mAllSimInfoList :").append(mAllSimInfoList).append(" mInsertedSimInfoList :").append(mInsertedSimInfoList).toString());
                sSIMInfoWrapper.mIsNeedToInitSimInfo = false;
            }
        }
        siminfowrapper = sSIMInfoWrapper;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    private void initSimInfo()
    {
        mAllSimInfoList = android.provider.Telephony.SIMInfo.getAllSIMList(mContext);
        mInsertedSimInfoList = android.provider.Telephony.SIMInfo.getInsertedSIMList(mContext);
        if (mAllSimInfoList != null && mInsertedSimInfoList != null)
        {
            Iterator iterator = mAllSimInfoList.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                android.provider.Telephony.SIMInfo siminfo1 = (android.provider.Telephony.SIMInfo)iterator.next();
                int j = getCheckedSimId(siminfo1);
                if (j != -1)
                {
                    mAllSimInfoMap.put(Integer.valueOf(j), siminfo1);
                    mSimIdSlotIdPairs.put(Integer.valueOf(j), Integer.valueOf(siminfo1.mSlot));
                }
            } while (true);
            Iterator iterator1 = mInsertedSimInfoList.iterator();
            do
            {
                if (!iterator1.hasNext())
                    break;
                android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator1.next();
                int i = getCheckedSimId(siminfo);
                if (i != -1)
                {
                    mInsertedSimInfoMap.put(Integer.valueOf(i), siminfo);
                    mSlotIdSimIdPairs.put(Integer.valueOf(siminfo.mSlot), Integer.valueOf(i));
                }
            } while (true);
        } else
        {
            log("[SIMInfoWrapper] mSimInfoList OR mInsertedSimInfoList is null");
        }
    }

    private static void log(String s)
    {
        Log.d("SIMInfoWrapper", s);
    }

    public static void setNull(boolean flag)
    {
        sSIMInfoWrapper = null;
        sIsNullResult = flag;
    }

    public int getAllSimCount()
    {
        if (mAllSimInfoList != null)
            return mAllSimInfoList.size();
        else
            return 0;
    }

    public List getAllSimInfoList()
    {
        return mAllSimInfoList;
    }

    public int getInsertedSimColorById(int i)
    {
        android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)mInsertedSimInfoMap.get(Integer.valueOf(i));
        if (siminfo == null)
            return -1;
        else
            return siminfo.mColor;
    }

    public int getInsertedSimCount()
    {
        if (mInsertedSimInfoList != null)
            return mInsertedSimInfoList.size();
        else
            return 0;
    }

    public String getInsertedSimDisplayNameById(int i)
    {
        android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)mInsertedSimInfoMap.get(Integer.valueOf(i));
        if (siminfo == null)
            return null;
        else
            return siminfo.mDisplayName;
    }

    public android.provider.Telephony.SIMInfo getInsertedSimInfoById(int i)
    {
        return (android.provider.Telephony.SIMInfo)mInsertedSimInfoMap.get(Integer.valueOf(i));
    }

    public List getInsertedSimInfoList()
    {
        return mInsertedSimInfoList;
    }

    public HashMap getInsertedSimInfoMap()
    {
        return mInsertedSimInfoMap;
    }

    public int getInsertedSimSlotById(int i)
    {
        android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)mInsertedSimInfoMap.get(Integer.valueOf(i));
        if (siminfo == null)
            return -1;
        else
            return siminfo.mSlot;
    }

    public int getSimBackgroundDarkResByColorId(int i)
    {
        log((new StringBuilder()).append("getSimBackgroundDarkResByColorId() colorId = ").append(i).toString());
        if (i < 0 || i > 3)
            i = 0;
        return Telephony.SIMBackgroundDarkRes[i];
    }

    public int getSimBackgroundLightResByColorId(int i)
    {
        log((new StringBuilder()).append("getSimBackgroundLightResByColorId() colorId = ").append(i).toString());
        if (i < 0 || i > 3)
            i = 0;
        return Telephony.SIMBackgroundLightRes[i];
    }

    public int getSimBackgroundResByColorId(int i)
    {
        log((new StringBuilder()).append("getSimBackgroundResByColorId() colorId = ").append(i).toString());
        if (i < 0 || i > 3)
            i = 0;
        return Telephony.SIMBackgroundRes[i];
    }

    public int getSimColorById(int i)
    {
        android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)mAllSimInfoMap.get(Integer.valueOf(i));
        if (siminfo == null)
            return -1;
        else
            return siminfo.mColor;
    }

    public String getSimDisplayNameById(int i)
    {
        android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)mAllSimInfoMap.get(Integer.valueOf(i));
        if (siminfo == null)
            return null;
        else
            return siminfo.mDisplayName;
    }

    public String getSimDisplayNameBySlotId(int i)
    {
        return getSimDisplayNameById(getSimIdBySlotId(i));
    }

    public int getSimIdBySlotId(int i)
    {
        Integer integer = (Integer)mSlotIdSimIdPairs.get(Integer.valueOf(i));
        if (integer == null)
            return -1;
        else
            return integer.intValue();
    }

    public android.provider.Telephony.SIMInfo getSimInfoById(int i)
    {
        return (android.provider.Telephony.SIMInfo)mAllSimInfoMap.get(Integer.valueOf(i));
    }

    public android.provider.Telephony.SIMInfo getSimInfoBySlot(int i)
    {
        if (mInsertedSimInfoList != null)
        {
            for (int j = 0; j < mInsertedSimInfoList.size(); j++)
            {
                android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)mInsertedSimInfoList.get(j);
                if (siminfo.mSlot == i)
                    return siminfo;
            }

        }
        return null;
    }

    public List getSimInfoList()
    {
        return mAllSimInfoList;
    }

    public HashMap getSimInfoMap()
    {
        return mAllSimInfoMap;
    }

    public int getSimSlotById(int i)
    {
        android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)mAllSimInfoMap.get(Integer.valueOf(i));
        if (siminfo == null)
            return -1;
        else
            return siminfo.mSlot;
    }

    public int getSlotIdBySimId(int i)
    {
        Integer integer = (Integer)mSimIdSlotIdPairs.get(Integer.valueOf(i));
        if (integer == null)
            return -1;
        else
            return integer.intValue();
    }

    public void init(Context context)
    {
        mContext = context;
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.SIM_SETTING_INFO_CHANGED");
        intentfilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        intentfilter.addAction("android.intent.action.SIM_NAME_UPDATE");
        mContext.registerReceiver(mReceiver, intentfilter);
        mIsNeedToInitSimInfo = true;
    }

    public void registerForSimInfoUpdate(Handler handler, int i, Object obj)
    {
        mSimInfoUpdateRegistrantList.addUnique(handler, i, obj);
    }

    public void release()
    {
        if (mContext != null)
            mContext.unregisterReceiver(mReceiver);
    }

    public void unregisterForSimInfoUpdate(Handler handler)
    {
        mSimInfoUpdateRegistrantList.remove(handler);
    }

    public void updateSimInfoCache()
    {
label0:
        {
label1:
            {
                log("updateSimInfoCache()");
                if (mAllSimInfoList != null)
                {
                    mAllSimInfoList = android.provider.Telephony.SIMInfo.getAllSIMList(mContext);
                    if (mAllSimInfoList == null)
                        break label0;
                    mAllSimInfoMap = new HashMap();
                    mSimIdSlotIdPairs = new HashMap();
                    Iterator iterator1 = mAllSimInfoList.iterator();
                    do
                    {
                        if (!iterator1.hasNext())
                            break;
                        android.provider.Telephony.SIMInfo siminfo1 = (android.provider.Telephony.SIMInfo)iterator1.next();
                        int j = getCheckedSimId(siminfo1);
                        if (j != -1)
                        {
                            mAllSimInfoMap.put(Integer.valueOf(j), siminfo1);
                            mSimIdSlotIdPairs.put(Integer.valueOf(j), Integer.valueOf(siminfo1.mSlot));
                        }
                    } while (true);
                    log("[updateSimInfo] update mAllSimInfoList");
                }
                if (mInsertedSimInfoList != null)
                {
                    mInsertedSimInfoList = android.provider.Telephony.SIMInfo.getInsertedSIMList(mContext);
                    if (mInsertedSimInfoList == null)
                        break label1;
                    mInsertedSimInfoMap = new HashMap();
                    mSlotIdSimIdPairs = new HashMap();
                    Iterator iterator = mInsertedSimInfoList.iterator();
                    do
                    {
                        if (!iterator.hasNext())
                            break;
                        android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
                        int i = getCheckedSimId(siminfo);
                        if (i != -1)
                        {
                            mInsertedSimInfoMap.put(Integer.valueOf(i), siminfo);
                            mSlotIdSimIdPairs.put(Integer.valueOf(siminfo.mSlot), Integer.valueOf(i));
                        }
                    } while (true);
                    log("[updateSimInfo] update mInsertedSimInfoList");
                }
                mSimInfoUpdateRegistrantList.notifyRegistrants();
                return;
            }
            log("[updateSimInfo] updated mInsertedSimInfoList is null");
            return;
        }
        log("[updateSimInfo] updated mAllSimInfoList is null");
    }


}
