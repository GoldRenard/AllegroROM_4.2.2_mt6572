// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.gemini;

import android.os.Handler;
import android.os.SystemProperties;
import android.telephony.ServiceState;
import android.util.Log;
import com.android.internal.telephony.*;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.internal.telephony.gemini.MTKCallManager;
import junit.framework.Assert;

// Referenced classes of package com.mediatek.phone.gemini:
//            GeminiUtils

public class GeminiRegister
{

    private static final boolean DEBUG = true;
    private static final String TAG = "GeminiRegister";


    public static Connection dial(Object obj, Phone phone, String s, int i)
        throws CallStateException
    {
        Assert.assertNotNull(obj);
        Assert.assertNotNull(phone);
        boolean flag;
        CallStateException callstateexception;
        Connection connection;
        int j;
        if (phone.getPhoneType() == 3)
            flag = true;
        else
            flag = false;
        if (!GeminiUtils.isGeminiSupport() || flag)
            break MISSING_BLOCK_LABEL_62;
        j = i;
        if (!GeminiUtils.isValidSlot(i))
            j = SystemProperties.getInt("persist.radio.default_sim", -1);
        return ((MTKCallManager)obj).dialGemini(phone, s, j);
        connection = ((CallManager)obj).dial(phone, s);
        return connection;
        callstateexception;
        throw new CallStateException((new StringBuilder()).append("cannot dial, numberToDial:").append(s).append(", slotId:").append(i).toString());
    }

    public static int getSlotIdByRegisterEvent(int i, int ai[])
    {
        int j = -1;
        Assert.assertNotNull(ai);
        int k = GeminiUtils.getIndexInArray(i, ai);
        if (k != j)
            j = GeminiUtils.getSlots()[k];
        return j;
    }

    private static void log(String s)
    {
        Log.d("GeminiRegister", s);
    }

    public static int pickBestSlotForEmergencyCall(Phone phone, String s)
    {
        Assert.assertNotNull(phone);
        if (GeminiUtils.isGeminiSupport())
        {
            GeminiPhone geminiphone = (GeminiPhone)phone;
            int ai[] = GeminiUtils.getSlots();
            int i = ai.length;
            boolean aflag[] = new boolean[i];
            for (int j = 0; j < i; j++)
            {
                aflag[j] = geminiphone.isRadioOnGemini(ai[j]);
                int l = geminiphone.getServiceStateGemini(ai[j]).getState();
                if (aflag[j] && l == 0)
                {
                    log((new StringBuilder()).append("pickBestSlotForEmergencyCallm, radio on & in service, slot:").append(ai[j]).toString());
                    return ai[j];
                }
            }

            for (int k = 0; k < i; k++)
                if (aflag[k])
                {
                    log((new StringBuilder()).append("pickBestSlotForEmergencyCallm, radio on, slot:").append(ai[k]).toString());
                    return ai[k];
                }

        }
        log("pickBestSlotForEmergencyCallm, no gemini");
        return GeminiUtils.getDefaultSlot();
    }

    public static void registerForCrssSuppServiceNotification(Object obj, Handler handler, int i)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            int ai[] = GeminiUtils.getSlots();
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            for (int j = 0; j < ai.length; j++)
                mtkcallmanager.registerForCrssSuppServiceNotificationGemini(handler, i, null, ai[j]);

        } else
        {
            ((CallManager)obj).registerForCrssSuppServiceNotification(handler, i, null);
        }
    }

    public static void registerForDisconnect(Object obj, Handler handler, int i)
    {
        int ai[] = new int[GeminiUtils.getSlots().length];
        for (int j = 0; j < ai.length; j++)
            ai[j] = i;

        registerForDisconnect(obj, handler, ai);
    }

    public static void registerForDisconnect(Object obj, Handler handler, int ai[])
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            int ai1[] = GeminiUtils.getSlots();
            int i = ai.length;
            int j = ai1.length;
            boolean flag = false;
            if (i >= j)
                flag = true;
            Assert.assertTrue(flag);
            for (int k = 0; k < ai1.length; k++)
                mtkcallmanager.registerForDisconnectGemini(handler, ai[k], null, ai1[k]);

        } else
        {
            ((CallManager)obj).registerForDisconnect(handler, ai[0], null);
        }
    }

    public static void registerForIncomingRing(Object obj, Handler handler, int i)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            int ai[] = GeminiUtils.getSlots();
            for (int j = 0; j < ai.length; j++)
                mtkcallmanager.registerForIncomingRingGemini(handler, i, null, ai[j]);

        } else
        {
            ((CallManager)obj).registerForIncomingRing(handler, i, null);
        }
    }

    public static void registerForMmiComplete(Object obj, Handler handler, int ai[])
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            int ai1[] = GeminiUtils.getSlots();
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            int i = ai.length;
            int j = ai1.length;
            boolean flag = false;
            if (i >= j)
                flag = true;
            Assert.assertTrue(flag);
            for (int k = 0; k < ai1.length; k++)
                mtkcallmanager.registerForMmiCompleteGemini(handler, ai[k], null, ai1[k]);

        } else
        {
            ((CallManager)obj).registerForMmiComplete(handler, ai[0], null);
        }
    }

    public static void registerForMmiInitiate(Object obj, Handler handler, int ai[])
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            int ai1[] = GeminiUtils.getSlots();
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            int i = ai.length;
            int j = ai1.length;
            boolean flag = false;
            if (i >= j)
                flag = true;
            Assert.assertTrue(flag);
            for (int k = 0; k < ai1.length; k++)
                mtkcallmanager.registerForMmiInitiateGemini(handler, ai[k], null, ai1[k]);

        } else
        {
            ((CallManager)obj).registerForMmiInitiate(handler, ai[0], null);
        }
    }

    public static void registerForNetworkLocked(Phone phone, Handler handler, int ai[])
    {
        Assert.assertNotNull(phone);
        int ai1[] = GeminiUtils.getSlots();
        boolean flag;
        if (ai.length >= ai1.length)
            flag = true;
        else
            flag = false;
        Assert.assertTrue(flag);
        for (int i = 0; i < ai1.length; i++)
        {
            IccCard icccard = GeminiUtils.getIccCard(phone, ai1[i]);
            if (icccard != null)
                icccard.registerForNetworkLocked(handler, ai[i], null);
        }

    }

    public static void registerForNewRingingConnection(Object obj, Handler handler, int i)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            int ai[] = GeminiUtils.getSlots();
            for (int j = 0; j < ai.length; j++)
                mtkcallmanager.registerForNewRingingConnectionGemini(handler, i, null, ai[j]);

        } else
        {
            ((CallManager)obj).registerForNewRingingConnection(handler, i, null);
        }
    }

    public static void registerForPostDialCharacter(Object obj, Handler handler, int i)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            int ai[] = GeminiUtils.getSlots();
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            for (int j = 0; j < ai.length; j++)
                mtkcallmanager.registerForPostDialCharacterGemini(handler, i, null, ai[j]);

        } else
        {
            ((CallManager)obj).registerForPostDialCharacter(handler, i, null);
        }
    }

    public static void registerForPreciseCallStateChanged(Object obj, Handler handler, int i)
    {
        registerForPreciseCallStateChanged(obj, handler, i, null);
    }

    public static void registerForPreciseCallStateChanged(Object obj, Handler handler, int i, Object obj1)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            int ai[] = GeminiUtils.getSlots();
            for (int j = 0; j < ai.length; j++)
                mtkcallmanager.registerForPreciseCallStateChangedGemini(handler, i, obj1, ai[j]);

        } else
        {
            ((CallManager)obj).registerForPreciseCallStateChanged(handler, i, obj1);
        }
    }

    public static void registerForRingbackTone(Object obj, Handler handler, int i)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            int ai[] = GeminiUtils.getSlots();
            int j = ai.length;
            for (int k = 0; k < j; k++)
                mtkcallmanager.registerForRingbackToneGemini(handler, i, null, ai[k]);

        } else
        {
            ((CallManager)obj).registerForRingbackTone(handler, i, null);
        }
    }

    public static void registerForServiceStateChanged(Phone phone, Handler handler, int ai[])
    {
        Assert.assertNotNull(phone);
        if (GeminiUtils.isGeminiSupport())
        {
            GeminiPhone geminiphone = (GeminiPhone)phone;
            int ai1[] = GeminiUtils.getSlots();
            int i = ai.length;
            int j = ai1.length;
            boolean flag = false;
            if (i >= j)
                flag = true;
            Assert.assertTrue(flag);
            for (int k = 0; k < ai1.length; k++)
            {
                geminiphone.unregisterForServiceStateChangedGemini(handler, ai1[k]);
                geminiphone.registerForServiceStateChangedGemini(handler, ai[k], null, ai1[k]);
            }

        } else
        {
            phone.unregisterForServiceStateChanged(handler);
            phone.registerForServiceStateChanged(handler, ai[0], null);
        }
    }

    public static void registerForSpeechInfo(Object obj, Handler handler, int i)
    {
        GeminiUtils.getSlots();
        int j = GeminiUtils.getSlotCount();
        int ai[] = new int[j];
        for (int k = 0; k < j; k++)
            ai[k] = i;

        registerForSpeechInfo(obj, handler, ai);
    }

    public static void registerForSpeechInfo(Object obj, Handler handler, int ai[])
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            int ai1[] = GeminiUtils.getSlots();
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            int i = ai.length;
            int j = ai1.length;
            boolean flag = false;
            if (i >= j)
                flag = true;
            Assert.assertTrue(flag);
            for (int k = 0; k < ai1.length; k++)
                mtkcallmanager.registerForSpeechInfoGemini(handler, ai[k], null, ai1[k]);

        } else
        {
            ((CallManager)obj).registerForSpeechInfo(handler, ai[0], null);
        }
    }

    public static void registerForSuppServiceFailed(Object obj, Handler handler, int i)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            int ai[] = GeminiUtils.getSlots();
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            for (int j = 0; j < ai.length; j++)
                mtkcallmanager.registerForSuppServiceFailedGemini(handler, i, null, ai[j]);

        } else
        {
            ((CallManager)obj).registerForSuppServiceFailed(handler, i, null);
        }
    }

    public static void registerForSuppServiceNotification(Object obj, Handler handler, int i)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            int ai[] = GeminiUtils.getSlots();
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            for (int j = 0; j < ai.length; j++)
                mtkcallmanager.registerForSuppServiceNotificationGemini(handler, i, null, ai[j]);

        } else
        {
            ((CallManager)obj).registerForSuppServiceNotification(handler, i, null);
        }
    }

    public static void registerForUnknownConnection(Object obj, Handler handler, int i)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            int ai[] = GeminiUtils.getSlots();
            for (int j = 0; j < ai.length; j++)
                mtkcallmanager.registerForUnknownConnectionGemini(handler, i, null, ai[j]);

        } else
        {
            ((CallManager)obj).registerForUnknownConnection(handler, i, null);
        }
    }

    public static void registerForVtReplaceDisconnect(Object obj, Handler handler, int i)
    {
        Assert.assertNotNull(obj);
    }

    public static void registerForVtRingInfo(Object obj, Handler handler, int i)
    {
        Assert.assertNotNull(obj);
    }

    public static void registerForVtStatusInfo(Object obj, Handler handler, int i)
    {
        Assert.assertNotNull(obj);
    }

    public static void unregisterForCrssSuppServiceNotification(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            int ai[] = GeminiUtils.getSlots();
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            for (int i = 0; i < ai.length; i++)
                mtkcallmanager.unregisterForCrssSuppServiceNotificationGemini(handler, ai[i]);

        } else
        {
            ((CallManager)obj).unregisterForCrssSuppServiceNotification(handler);
        }
    }

    public static void unregisterForDisconnect(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            int ai[] = GeminiUtils.getSlots();
            for (int i = 0; i < ai.length; i++)
                mtkcallmanager.unregisterForDisconnectGemini(handler, ai[i]);

        } else
        {
            ((CallManager)obj).unregisterForDisconnect(handler);
        }
    }

    public static void unregisterForInCallVoicePrivacyOff(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            int ai[] = GeminiUtils.getSlots();
            for (int i = 0; i < ai.length; i++)
                ((MTKCallManager)obj).unregisterForInCallVoicePrivacyOffGemini(handler, ai[i]);

        } else
        {
            ((CallManager)obj).unregisterForInCallVoicePrivacyOff(handler);
        }
    }

    public static void unregisterForInCallVoicePrivacyOn(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            int ai[] = GeminiUtils.getSlots();
            for (int i = 0; i < ai.length; i++)
                ((MTKCallManager)obj).unregisterForInCallVoicePrivacyOnGemini(handler, ai[i]);

        } else
        {
            ((CallManager)obj).unregisterForInCallVoicePrivacyOn(handler);
        }
    }

    public static void unregisterForIncomingRing(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            int ai[] = GeminiUtils.getSlots();
            for (int i = 0; i < ai.length; i++)
                mtkcallmanager.unregisterForIncomingRingGemini(handler, ai[i]);

        } else
        {
            ((CallManager)obj).unregisterForIncomingRing(handler);
        }
    }

    public static void unregisterForMmiComplete(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            int ai[] = GeminiUtils.getSlots();
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            for (int i = 0; i < ai.length; i++)
                mtkcallmanager.unregisterForMmiCompleteGemini(handler, ai[i]);

        } else
        {
            ((CallManager)obj).unregisterForMmiComplete(handler);
        }
    }

    public static void unregisterForMmiInitiate(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            int ai[] = GeminiUtils.getSlots();
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            for (int i = 0; i < ai.length; i++)
                mtkcallmanager.unregisterForMmiInitiateGemini(handler, ai[i]);

        } else
        {
            ((CallManager)obj).unregisterForMmiInitiate(handler);
        }
    }

    public static void unregisterForNewRingingConnection(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            int ai[] = GeminiUtils.getSlots();
            for (int i = 0; i < ai.length; i++)
                mtkcallmanager.unregisterForNewRingingConnectionGemini(handler, ai[i]);

        } else
        {
            ((CallManager)obj).unregisterForNewRingingConnection(handler);
        }
    }

    public static void unregisterForPostDialCharacter(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            int ai[] = GeminiUtils.getSlots();
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            for (int i = 0; i < ai.length; i++)
                mtkcallmanager.unregisterForPostDialCharacterGemini(handler, ai[i]);

        } else
        {
            ((CallManager)obj).unregisterForPostDialCharacter(handler);
        }
    }

    public static void unregisterForPreciseCallStateChanged(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            int ai[] = GeminiUtils.getSlots();
            for (int i = 0; i < ai.length; i++)
                mtkcallmanager.unregisterForPreciseCallStateChangedGemini(handler, ai[i]);

        } else
        {
            ((CallManager)obj).unregisterForPreciseCallStateChanged(handler);
        }
    }

    public static void unregisterForRingbackTone(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            int ai[] = GeminiUtils.getSlots();
            for (int i = 0; i < ai.length; i++)
                mtkcallmanager.unregisterForDisconnectGemini(handler, ai[i]);

        } else
        {
            ((CallManager)obj).unregisterForRingbackTone(handler);
        }
    }

    public static void unregisterForServiceStateChanged(Phone phone, Handler handler, int ai[])
    {
        if (phone != null)
            if (GeminiUtils.isGeminiSupport())
            {
                int ai1[] = GeminiUtils.getSlots();
                boolean flag;
                if (ai.length >= ai1.length)
                    flag = true;
                else
                    flag = false;
                Assert.assertTrue(flag);
                for (int i = 0; i < ai1.length; i++)
                {
                    handler.removeMessages(ai[i]);
                    ((GeminiPhone)phone).unregisterForServiceStateChangedGemini(handler, ai1[i]);
                }

            } else
            {
                phone.unregisterForServiceStateChanged(handler);
            }
        handler.removeMessages(ai[0]);
    }

    public static void unregisterForSpeechInfo(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            int ai[] = GeminiUtils.getSlots();
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            for (int i = 0; i < ai.length; i++)
                mtkcallmanager.unregisterForSpeechInfoGemini(handler, ai[i]);

        } else
        {
            ((CallManager)obj).unregisterForSpeechInfo(handler);
        }
    }

    public static void unregisterForSpeechInfo(Object obj, Handler handler, int i)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            ((MTKCallManager)obj).unregisterForSpeechInfoGemini(handler, i);
            return;
        } else
        {
            ((CallManager)obj).unregisterForSpeechInfo(handler);
            return;
        }
    }

    public static void unregisterForSuppServiceFailed(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            int ai[] = GeminiUtils.getSlots();
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            for (int i = 0; i < ai.length; i++)
                mtkcallmanager.unregisterForSuppServiceFailedGemini(handler, ai[i]);

        } else
        {
            ((CallManager)obj).unregisterForSuppServiceFailed(handler);
        }
    }

    public static void unregisterForSuppServiceNotification(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            int ai[] = GeminiUtils.getSlots();
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            for (int i = 0; i < ai.length; i++)
                mtkcallmanager.unregisterForSuppServiceNotificationGemini(handler, ai[i]);

        } else
        {
            ((CallManager)obj).unregisterForSuppServiceNotification(handler);
        }
    }

    public static void unregisterForUnknownConnection(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
        if (obj instanceof MTKCallManager)
        {
            MTKCallManager mtkcallmanager = (MTKCallManager)obj;
            int ai[] = GeminiUtils.getSlots();
            for (int i = 0; i < ai.length; i++)
                mtkcallmanager.unregisterForUnknownConnectionGemini(handler, ai[i]);

        } else
        {
            ((CallManager)obj).unregisterForUnknownConnection(handler);
        }
    }

    public static void unregisterForVtReplaceDisconnect(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
    }

    public static void unregisterForVtRingInfo(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
    }

    public static void unregisterForVtStatusInfo(Object obj, Handler handler)
    {
        Assert.assertNotNull(obj);
    }
}
