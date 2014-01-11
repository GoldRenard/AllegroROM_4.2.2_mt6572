// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.gemini;

import android.content.ContentResolver;
import android.content.Context;
import android.net.Uri;
import android.os.*;
import android.telephony.TelephonyManager;
import android.util.Log;
import com.android.internal.telephony.*;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.internal.telephony.gemini.MTKCallManager;
import com.android.phone.PhoneGlobals;
import com.android.phone.PhoneUtils;
import com.mediatek.phone.GeminiConstants;
import com.mediatek.phone.SIMInfoWrapper;
import com.mediatek.telephony.TelephonyManagerEx;
import java.util.ArrayList;
import java.util.List;
import junit.framework.Assert;

public final class GeminiUtils
{

    private static final boolean DEBUG = true;
    private static final int GET_SIM_RETRY_EMPTY = -1;
    private static final String TAG = "Gemini";
    private static GeminiUtils sInstance = new GeminiUtils();


    public static int get3GCapabilitySIM()
    {
        ITelephony itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        int j;
        try
        {
            int i = itelephony.get3GCapabilitySIM();
            log((new StringBuilder()).append("get3GCapabilitySIM, slot3G").append(i).toString());
            j = itelephony.get3GCapabilitySIM();
        }
        catch (RemoteException remoteexception)
        {
            log((new StringBuilder()).append("get3GCapabilitySIM, ").append(remoteexception.getMessage()).append(", return -1").toString());
            return -1;
        }
        return j;
    }

    public static int getCDMASlot()
    {
        return 1;
    }

    public static CallerInfo getCallerInfo(Context context, String s, int i)
    {
        if (isGeminiSupport() && isValidSlot(i))
            return CallerInfo.getCallerInfoGemini(context, s, i);
        else
            return CallerInfo.getCallerInfo(context, s);
    }

    public static Phone getDefaultPhone()
    {
        if (isGeminiSupport())
            return PhoneGlobals.getInstance().mCMGemini.getDefaultPhoneGemini();
        else
            return PhoneGlobals.getInstance().mCM.getDefaultPhone();
    }

    public static int getDefaultSlot()
    {
        return 0;
    }

    public static IccCard getIccCard(Phone phone, int i)
    {
        Assert.assertNotNull(phone);
        if (isGeminiSupport() && isValidSlot(i))
            return ((GeminiPhone)phone).getIccCardGemini(i);
        else
            return phone.getIccCard();
    }

    public static boolean getIccRecordsLoaded(Phone phone, int i)
    {
        Assert.assertNotNull(phone);
        boolean flag;
        if (isGeminiSupport() && isValidSlot(i))
            flag = ((GeminiPhone)phone).getIccRecordsLoadedGemini(i);
        else
            flag = phone.getIccRecordsLoaded();
        log((new StringBuilder()).append("getIccRecordsLoaded : iccRecordloaded:").append(flag).append(", slotId:").append(i).toString());
        return flag;
    }

    public static int getIndexInArray(int i, int ai[])
    {
        for (int j = 0; j < ai.length; j++)
            if (i == ai[j])
                return j;

        log((new StringBuilder()).append("getIndexInArray failed, value=").append(i).append(", array=").append(ai.toString()).toString());
        return -1;
    }

    private static int getIntSystemProperties(String s, int i)
    {
        return SystemProperties.getInt(s, i);
    }

    public static boolean getMessageWaitingIndicator(Phone phone, int i)
    {
        Assert.assertNotNull(phone);
        boolean flag;
        if (isGeminiSupport() && isValidSlot(i))
            flag = ((GeminiPhone)phone).getMessageWaitingIndicatorGemini(i);
        else
            flag = phone.getMessageWaitingIndicator();
        log((new StringBuilder()).append("getMessageWaitingIndicator, indicator:").append(flag).toString());
        return flag;
    }

    public static String getNetworkOperatorName()
    {
        String s;
        if (isGeminiSupport())
        {
            GeminiPhone geminiphone = (GeminiPhone)PhoneGlobals.getInstance().phone;
            int ai[] = getSlots();
            int i = 0;
label0:
            do
            {
label1:
                {
                    int j = ai.length;
                    s = null;
                    if (i < j)
                    {
                        if (geminiphone.getStateGemini(ai[i]) == com.android.internal.telephony.PhoneConstants.State.IDLE)
                            break label1;
                        s = getSystemProperties(GeminiConstants.PROPERTY_OPERATOR_ALPHAS[i]);
                        log((new StringBuilder()).append("getNetworkOperatorName operatorName:").append(s).append(", slotId:").append(ai[i]).toString());
                    }
                    if (s == null && PhoneGlobals.getInstance().mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
                    {
                        int k = 0;
                        do
                        {
                            if (k >= ai.length)
                                break;
                            if (geminiphone.getPendingMmiCodesGemini(ai[k]).size() != 0)
                            {
                                s = getSystemProperties(GeminiConstants.PROPERTY_OPERATOR_ALPHAS[k]);
                                log((new StringBuilder()).append("getNetworkOperatorName operatorName:").append(s).append(", slotId:").append(ai[k]).toString());
                                break;
                            }
                            k++;
                        } while (true);
                    }
                    break label0;
                }
                i++;
            } while (true);
        } else
        {
            s = getSystemProperties("gsm.operator.alpha");
        }
        log((new StringBuilder()).append("getNetworkOperatorName operatorName = ").append(s).toString());
        return s;
    }

    public static String getNetworkOperatorName(Call call)
    {
        if (isGeminiSupport() && call != null)
        {
            GeminiPhone _tmp = (GeminiPhone)PhoneGlobals.getInstance().phone;
            android.provider.Telephony.SIMInfo siminfo = PhoneUtils.getSimInfoByCall(call);
            if (siminfo != null && call.getState() != com.android.internal.telephony.Call.State.IDLE)
            {
                int i = getIndexInArray(siminfo.mSlot, getSlots());
                if (i >= 0)
                    return getSystemProperties(GeminiConstants.PROPERTY_OPERATOR_ALPHAS[i]);
            }
        }
        return getNetworkOperatorName();
    }

    public static String getOperatorName(int i)
    {
        String s;
        if (isGeminiSupport() && isValidSlot(i))
        {
            android.provider.Telephony.SIMInfo siminfo = SIMInfoWrapper.getDefault().getSimInfoBySlot(i);
            s = null;
            if (siminfo != null)
            {
                s = siminfo.mDisplayName;
                log((new StringBuilder()).append("getOperatorName, operatorName= ").append(siminfo.mDisplayName).toString());
            }
        } else
        {
            s = getSystemProperties("gsm.operator.alpha");
        }
        log((new StringBuilder()).append("getOperatorName, slotId=").append(i).append(" operatorName=").append(s).toString());
        return s;
    }

    public static List getPendingMmiCodes(Phone phone, int i)
    {
        Assert.assertNotNull(phone);
        Object obj;
        if (isGeminiSupport() && isValidSlot(i))
            obj = ((GeminiPhone)phone).getPendingMmiCodesGemini(i);
        else
            obj = phone.getPendingMmiCodes();
        if (obj == null)
            obj = new ArrayList();
        return ((List) (obj));
    }

    public static void getPhbRecordInfo(Phone phone, Message message, int i)
    {
        Assert.assertNotNull(phone);
        if (isGeminiSupport() && isValidSlot(i))
            ((GeminiPhone)phone).getIccFileHandlerGemini(i).getPhbRecordInfo(message);
        else
            ((PhoneProxy)phone).getIccFileHandler().getPhbRecordInfo(message);
        log((new StringBuilder()).append("getPhbRecordInfo, response:").append(message).append(" slotId:").append(i).toString());
    }

    public static int getPhoneType(Phone phone, int i)
    {
        Assert.assertNotNull(phone);
        int j;
        if (isGeminiSupport() && (phone instanceof GeminiPhone) && isValidSlot(i))
            j = ((GeminiPhone)phone).getPhonebyId(i).getPhoneType();
        else
            j = phone.getPhoneType();
        log((new StringBuilder()).append("getPhoneType, slotId:").append(i).append(", phoneType:").append(j).toString());
        return j;
    }

    public static int getPin2RetryNumber(int i)
    {
        int j = getIndexInArray(i, getSlots());
        int k = -1;
        if (j >= 0)
            k = getIntSystemProperties(GeminiConstants.GSM_SIM_RETRY_PIN2_GEMINI[j], -1);
        return k;
    }

    public static int getPinRetryNumber(int i)
    {
        int j = getIndexInArray(i, getSlots());
        int k = -1;
        if (j >= 0)
            k = getIntSystemProperties(GeminiConstants.GSM_SIM_RETRY_PIN_GEMINI[j], -1);
        return k;
    }

    public static int getPuk2RetryNumber(int i)
    {
        int j = getIndexInArray(i, getSlots());
        int k = -1;
        if (j >= 0)
            k = getIntSystemProperties(GeminiConstants.GSM_SIM_RETRY_PUK2_GEMINI[j], -1);
        return k;
    }

    public static Uri getSimFdnUri(int i)
    {
        int j = getIndexInArray(i, getSlots());
        if (j >= 0)
            return Uri.parse(GeminiConstants.FDN_CONTENT_GEMINI[j]);
        else
            return Uri.parse("content://icc/fdn");
    }

    public static int getSlotByPhoneType(int i)
    {
        if (i == 2) goto _L2; else goto _L1
_L1:
        int l = 0;
        if (i != 1) goto _L3; else goto _L2
_L2:
        TelephonyManager telephonymanager;
        int ai[];
        int j;
        int k;
        telephonymanager = TelephonyManager.getDefault();
        ai = getSlots();
        j = ai.length;
        k = 0;
_L8:
        l = 0;
        if (k >= j) goto _L3; else goto _L4
_L4:
        int i1 = ai[k];
        if (telephonymanager.getPhoneTypeGemini(i1) != i) goto _L6; else goto _L5
_L5:
        l = i1;
_L3:
        log((new StringBuilder()).append("getSlotByPhoneType with phontType = ").append(i).append(" and return slot = ").append(l).toString());
        return l;
_L6:
        k++;
        if (true) goto _L8; else goto _L7
_L7:
    }

    public static final int getSlotCount()
    {
        return GeminiConstants.SLOTS.length;
    }

    public static int getSlotNotIdle(Phone phone)
    {
        Assert.assertNotNull(phone);
        if (phone instanceof GeminiPhone)
        {
            GeminiPhone geminiphone = (GeminiPhone)phone;
            int ai[] = getSlots();
            int i = ai.length;
            for (int j = 0; j < i; j++)
            {
                int k = ai[j];
                if (geminiphone.getStateGemini(k) != com.android.internal.telephony.PhoneConstants.State.IDLE)
                    return k;
            }

        } else
        if (phone.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
            return 0;
        return -1;
    }

    public static int[] getSlots()
    {
        return GeminiConstants.SLOTS;
    }

    public static void getSmscAddress(Phone phone, Message message, int i)
    {
        Assert.assertNotNull(phone);
        log((new StringBuilder()).append("getSmscAddress: slotId=").append(i).toString());
        if (isGeminiSupport() && isValidSlot(i))
        {
            ((GeminiPhone)phone).getSmscAddressGemini(message, i);
            return;
        } else
        {
            phone.getSmscAddress(message);
            return;
        }
    }

    private static String getSystemProperties(String s)
    {
        return SystemProperties.get(s);
    }

    public static String getVTNetworkOperatorName(Call call)
    {
        String s;
        if (isGeminiSupport() && call != null)
        {
            int i = -1;
            android.provider.Telephony.SIMInfo siminfo = PhoneUtils.getSimInfoByCall(call);
            if (call != null && siminfo != null && call.getState() != com.android.internal.telephony.Call.State.IDLE)
                i = siminfo.mSlot;
            int j = getIndexInArray(i, getSlots());
            s = null;
            if (j >= 0)
                s = getSystemProperties(GeminiConstants.PROPERTY_OPERATOR_ALPHAS[j]);
        } else
        {
            s = getSystemProperties("gsm.operator.alpha");
        }
        log((new StringBuilder()).append("getVTNetworkOperatorName, operatorName= ").append(s).toString());
        return s;
    }

    public static String getVoiceMailNumber(int i)
    {
        if (isGeminiSupport() && isValidSlot(i))
            return TelephonyManagerEx.getDefault().getVoiceMailNumber(i);
        else
            return TelephonyManager.getDefault().getVoiceMailNumber();
    }

    public static String getVoiceMailNumber(Phone phone, int i)
    {
        Assert.assertNotNull(phone);
        String s;
        if (isGeminiSupport() && isValidSlot(i))
            s = ((GeminiPhone)phone).getVoiceMailNumberGemini(i);
        else
            s = phone.getVoiceMailNumber();
        log((new StringBuilder()).append("getVoiceMailNumber : vmNumber:").append(s).append(" slotId=").append(i).toString());
        return s;
    }

    public static boolean handlePinMmi(Phone phone, String s, int i)
    {
        Assert.assertNotNull(phone);
        boolean flag;
        if (isGeminiSupport() && isValidSlot(i))
            flag = ((GeminiPhone)phone).handlePinMmiGemini(s, i);
        else
            flag = phone.handlePinMmi(s);
        log((new StringBuilder()).append("handlePinMmi : result:").append(flag).append(" dialString:").append(s).append(", slotId:").append(i).toString());
        return flag;
    }

    public static void hangupAll(Phone phone)
    {
        Assert.assertNotNull(phone);
        GeminiPhone geminiphone;
        int ai[];
        int i;
        if (!isGeminiSupport())
            break MISSING_BLOCK_LABEL_47;
        geminiphone = (GeminiPhone)phone;
        ai = getSlots();
        i = ai.length;
        int j = 0;
        do
        {
            if (j >= i)
                break;
            try
            {
                geminiphone.hangupAllGemini(ai[j]);
            }
            catch (CallStateException callstateexception)
            {
                log("Error, cannot hangup All Calls");
                return;
            }
            j++;
        } while (true);
        break MISSING_BLOCK_LABEL_53;
        phone.hangupAllEx();
    }

    public static boolean hasPendingMmi(Phone phone)
    {
        Assert.assertNotNull(phone);
        int i = 0;
        if (isGeminiSupport())
        {
            GeminiPhone geminiphone = (GeminiPhone)phone;
            int ai[] = getSlots();
            log((new StringBuilder()).append("hasPendingMmi mmiCount slot size:").append(ai.length).toString());
            int j = ai.length;
            for (int k = 0; k < j; k++)
                i += geminiphone.getPendingMmiCodesGemini(ai[k]).size();

        } else
        {
            i = phone.getPendingMmiCodes().size();
        }
        log((new StringBuilder()).append("hasPendingMmi mmiCount=").append(i).toString());
        return i > 0;
    }

    public static boolean isDialing(Phone phone)
    {
        Assert.assertNotNull(phone);
        boolean flag;
        if (isGeminiSupport())
        {
            if (((GeminiPhone)phone).getForegroundCall().getState() == com.android.internal.telephony.Call.State.DIALING)
                flag = true;
            else
                flag = false;
        } else
        if (phone.getForegroundCall().getState() == com.android.internal.telephony.Call.State.DIALING)
            flag = true;
        else
            flag = false;
        log((new StringBuilder()).append("isDialing, isDialing:").append(flag).toString());
        return flag;
    }

    public static boolean isGeminiSupport()
    {
        return GeminiConstants.SOLT_NUM >= 2;
    }

    public static boolean isPhbReady(Phone phone, int i)
    {
        Assert.assertNotNull(phone);
        boolean flag = getIccCard(phone, i).isPhbReady();
        log((new StringBuilder()).append("getIccRecordsLoaded : isPhbReady:").append(flag).append(", slotId:").append(i).toString());
        return flag;
    }

    public static boolean isPhoneBackgroundCallIdle(Phone phone)
    {
        Assert.assertNotNull(phone);
        log((new StringBuilder()).append("isPhoneBackgroundCallIdle :").append(phone.getBackgroundCall().isIdle()).toString());
        return phone.getBackgroundCall().isIdle();
    }

    public static boolean isPhoneForegroundCallIdle(Phone phone)
    {
        Assert.assertNotNull(phone);
        log((new StringBuilder()).append("isPhoneForegroundCallIdle :").append(phone.getForegroundCall().isIdle()).toString());
        return phone.getForegroundCall().isIdle();
    }

    public static boolean isPhoneRingingCallIdle(Phone phone)
    {
        Assert.assertNotNull(phone);
        log((new StringBuilder()).append("isPhoneRingingCallIdle :").append(phone.getRingingCall().isIdle()).toString());
        return phone.getRingingCall().isIdle();
    }

    public static boolean isValidSlot(int i)
    {
        int ai[] = getSlots();
        for (int j = 0; j < ai.length; j++)
            if (ai[j] == i)
                return true;

        return false;
    }

    private static void log(String s)
    {
        Log.d("Gemini", s);
    }

    public static void sendBTSIMProfile(Phone phone, int i, int j, String s, Message message, int k)
    {
        Assert.assertNotNull(phone);
        log((new StringBuilder()).append("sendBTSIMProfile, callback:").append(message).append(", slotId:").append(k).toString());
        if (isGeminiSupport() && isValidSlot(k))
        {
            ((GeminiPhone)phone).sendBTSIMProfileGemini(i, j, s, message, k);
            return;
        } else
        {
            phone.sendBTSIMProfile(i, j, s, message);
            return;
        }
    }

    public static void sendUssdResponse(Phone phone, String s, int i)
    {
        Assert.assertNotNull(phone);
        log((new StringBuilder()).append("sendUssdResponse, text:").append(s).append(", slotId:").append(i).toString());
        if (isGeminiSupport() && isValidSlot(i))
        {
            ((GeminiPhone)phone).sendUssdResponseGemini(s, i);
            return;
        } else
        {
            phone.sendUssdResponse(s);
            return;
        }
    }

    public static void setPreferredNetworkType(Phone phone, int i, Message message, int j)
    {
        Assert.assertNotNull(phone);
        if (isGeminiSupport() && isValidSlot(j))
            ((GeminiPhone)phone).setPreferredNetworkTypeGemini(i, message, j);
        else
            phone.setPreferredNetworkType(i, message);
        log((new StringBuilder()).append("setPreferredNetworkType, modemNetworkMode:").append(i).append(" slotId:").append(j).toString());
    }

    public static void setRadioMode(Phone phone, boolean flag, ContentResolver contentresolver)
    {
        Assert.assertNotNull(phone);
        if (isGeminiSupport())
        {
            int i = 0;
            if (!flag)
            {
                i = 0;
                if (contentresolver != null)
                    i = android.provider.Settings.Global.getInt(contentresolver, "dual_sim_mode_setting", 3);
            }
            ((GeminiPhone)phone).setRadioMode(i);
            log((new StringBuilder()).append("setRadioPower, isRadioOn:").append(flag).append(", dualSimModeSetting:").append(i).toString());
        } else
        {
            boolean flag1;
            if (!flag)
                flag1 = true;
            else
                flag1 = false;
            phone.setRadioPower(flag1);
        }
        log((new StringBuilder()).append("setRadioPower, isRadioOn:").append(flag).toString());
    }

    public static void setRadioPowerOFF(Phone phone)
    {
        Assert.assertNotNull(phone);
        if (isGeminiSupport())
            ((GeminiPhone)phone).setRadioMode(-1);
        else
            phone.setRadioPower(false, true);
        log("setRadioPowerOFF");
    }

    public static void setSmscAddress(Phone phone, String s, Message message, int i)
    {
label0:
        {
            Assert.assertNotNull(phone);
            log((new StringBuilder()).append("setSmscAddress: slotId=").append(i).toString());
            if (isValidSlot(i))
            {
                if (!isGeminiSupport())
                    break label0;
                ((GeminiPhone)phone).setSmscAddressGemini(s, message, i);
            }
            return;
        }
        phone.setSmscAddress(s, message);
    }

    public static CallerInfoAsyncQuery startQueryGemini(int i, Context context, String s, com.android.internal.telephony.CallerInfoAsyncQuery.OnQueryCompleteListener onquerycompletelistener, Object obj, int j, boolean flag)
    {
        if (isGeminiSupport() && !flag)
            return CallerInfoAsyncQuery.startQueryGemini(i, context, s, onquerycompletelistener, obj, j);
        else
            return CallerInfoAsyncQuery.startQuery(i, context, s, onquerycompletelistener, obj);
    }

    public String getGateway(Phone phone, String s, int i)
    {
        Assert.assertNotNull(phone);
        String s1;
        if (isGeminiSupport() && isValidSlot(i))
            s1 = ((GeminiPhone)phone).getGatewayGemini(s, i);
        else
            s1 = phone.getGateway(s);
        log((new StringBuilder()).append("getGateway, gateWay:").append(s1).append(" apnType:").append(s).append(", slotId:").append(i).toString());
        return s1;
    }

    public String getInterfaceName(Phone phone, String s, int i)
    {
        Assert.assertNotNull(phone);
        String s1;
        if (isGeminiSupport() && isValidSlot(i))
            s1 = ((GeminiPhone)phone).getInterfaceNameGemini(s, i);
        else
            s1 = phone.getInterfaceName(s);
        log((new StringBuilder()).append("getGateway, interfaceName:").append(s1).append(" apnType:").append(s).append(", slotId:").append(i).toString());
        return s1;
    }

    public String getIpAddress(Phone phone, String s, int i)
    {
        Assert.assertNotNull(phone);
        String s1;
        if (isGeminiSupport() && isValidSlot(i))
            s1 = ((GeminiPhone)phone).getIpAddressGemini(s, i);
        else
            s1 = phone.getIpAddress(s);
        log((new StringBuilder()).append("getGateway, ipAddr:").append(s1).append(" apnType:").append(s).append(", slotId:").append(i).toString());
        return s1;
    }

}
