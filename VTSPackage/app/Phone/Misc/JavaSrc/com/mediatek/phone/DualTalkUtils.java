// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone;

import android.util.Log;
import com.android.internal.telephony.*;
import com.android.internal.telephony.cdma.CDMAPhone;
import com.android.internal.telephony.gsm.GSMPhone;
import com.android.internal.telephony.sip.SipPhone;
import com.android.phone.PhoneGlobals;
import com.android.phone.PhoneUtils;
import java.util.*;

public final class DualTalkUtils
{

    private static final boolean DBG = true;
    private static final DualTalkUtils INSTANCE = new DualTalkUtils();
    private static final String LOG_TAG = "DualTalkUtils";
    private static boolean sIsSupportDualTalk;
    private final ArrayList mActivePhoneList = new ArrayList();
    private CallManager mCM;
    protected HashMap mPhoneStateMap;

    private DualTalkUtils()
    {
        mPhoneStateMap = new HashMap();
        mCM = PhoneGlobals.getInstance().mCM;
    }

    private void dumpActivePhone()
    {
        log("DualTalkUtils dumpActivePhone ******* start *******");
        Phone phone;
        for (Iterator iterator = mActivePhoneList.iterator(); iterator.hasNext(); log((new StringBuilder()).append("Phone = ").append(phone.getPhoneName()).append(" Phone = ").append(phone.toString()).toString()))
            phone = (Phone)iterator.next();

        log("DualTalkUtils dumpActivePhone ******** end  *******");
    }

    public static String generateDtmfparam(char c, boolean flag)
    {
        String s = "SetWarningTone=";
        if (!flag)
            s = "StopWarningTone=";
        if (c >= '0' && c <= '9')
            return (new StringBuilder()).append(s).append(c).toString();
        if (c == '*')
            return (new StringBuilder()).append(s).append("10").toString();
        if (c == '#')
            return (new StringBuilder()).append(s).append("11").toString();
        else
            return (new StringBuilder()).append(s).append("null").toString();
    }

    private List getActivePhoneList()
    {
        ArrayList arraylist = new ArrayList();
        Iterator iterator = mCM.getAllPhones().iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            Phone phone = (Phone)iterator.next();
            if (phone.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
                arraylist.add(phone);
        } while (true);
        return arraylist;
    }

    public static DualTalkUtils getInstance()
    {
        return INSTANCE;
    }

    public static void init()
    {
        sIsSupportDualTalk = false;
    }

    public static boolean isSupportDualTalk()
    {
        return sIsSupportDualTalk;
    }

    private static void log(String s)
    {
        Log.d("DualTalkUtils", s);
    }

    private void switchPhoneByNeeded()
    {
        com.android.internal.telephony.PhoneConstants.State state = mCM.getState();
        if (mActivePhoneList.size() >= 2)
            if (state == com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
            {
                Phone phone1 = (Phone)mActivePhoneList.get(1);
                Phone phone2 = (Phone)mActivePhoneList.get(0);
                if (phone1.getForegroundCall().getState().isAlive() && phone1.getBackgroundCall().getState().isAlive())
                {
                    switchCalls();
                    return;
                }
                if (phone2.getForegroundCall().getState() == com.android.internal.telephony.Call.State.IDLE && phone2.getBackgroundCall().getState() == com.android.internal.telephony.Call.State.HOLDING && phone1.getBackgroundCall().getState() == com.android.internal.telephony.Call.State.IDLE && phone1.getForegroundCall().getState() == com.android.internal.telephony.Call.State.ACTIVE)
                {
                    switchCalls();
                    return;
                }
            } else
            if (state == com.android.internal.telephony.PhoneConstants.State.RINGING)
            {
                Phone phone = (Phone)mActivePhoneList.get(1);
                if (((Phone)mActivePhoneList.get(0)).getState() != com.android.internal.telephony.PhoneConstants.State.RINGING && phone.getState() == com.android.internal.telephony.PhoneConstants.State.RINGING)
                {
                    switchCalls();
                    return;
                }
            }
    }

    public boolean canAddCallForDualTalk()
    {
        boolean flag = true;
        if (sIsSupportDualTalk)
        {
            int i = getAllNoIdleCalls().size();
            int j = mActivePhoneList.size();
            if (i == 2)
            {
                if (j != 2)
                    flag = false;
                return flag;
            }
            if (i != 3)
                return flag;
        }
        return false;
    }

    public boolean canSplitCallFromConference()
    {
        if (sIsSupportDualTalk && mActivePhoneList.size() >= 2)
        {
            Call call = getActiveFgCall();
            Call call1 = getFirstActiveBgCall();
            if (call.isMultiparty() && call.getState().isAlive() && !call1.getState().isAlive())
                return true;
        }
        return false;
    }

    public Phone getActiveCdmaPhone()
    {
        Iterator iterator = mActivePhoneList.iterator();
        Phone phone;
        do
        {
            boolean flag = iterator.hasNext();
            phone = null;
            if (!flag)
                break;
            Phone phone1 = (Phone)iterator.next();
            if (phone1.getPhoneType() != 2)
                continue;
            phone = phone1;
            break;
        } while (true);
        return phone;
    }

    public Call getActiveFgCall()
    {
        Call call;
        if (isCdmaAndGsmActive())
        {
            Phone phone = getActiveCdmaPhone();
            Phone phone1 = getActiveGsmPhone();
            if (phone1.getForegroundCall().getState().isAlive())
                call = phone1.getForegroundCall();
            else
                call = phone.getForegroundCall();
        } else
        {
            boolean flag = mActivePhoneList.isEmpty();
            call = null;
            if (!flag)
                if (mActivePhoneList.size() >= 2)
                {
                    if (((Phone)mActivePhoneList.get(0)).getRingingCall().isIdle() && ((Phone)mActivePhoneList.get(0)).getForegroundCall().isIdle() && !((Phone)mActivePhoneList.get(0)).getBackgroundCall().isIdle() && ((Phone)mActivePhoneList.get(1)).getForegroundCall().getState() == com.android.internal.telephony.Call.State.ACTIVE)
                        call = ((Phone)mActivePhoneList.get(1)).getForegroundCall();
                    else
                        call = ((Phone)mActivePhoneList.get(0)).getForegroundCall();
                } else
                {
                    call = ((Phone)mActivePhoneList.get(0)).getForegroundCall();
                }
        }
        if (call == null)
            call = mCM.getActiveFgCall();
        return call;
    }

    public Phone getActiveGsmPhone()
    {
        Iterator iterator = mActivePhoneList.iterator();
        Phone phone;
        do
        {
            boolean flag = iterator.hasNext();
            phone = null;
            if (!flag)
                break;
            Phone phone1 = (Phone)iterator.next();
            if (phone1.getPhoneType() != 1 && phone1.getPhoneType() != 3)
                continue;
            phone = phone1;
            break;
        } while (true);
        return phone;
    }

    public List getAllActiveCalls()
    {
        ArrayList arraylist = new ArrayList();
        Iterator iterator = mActivePhoneList.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            Call call = ((Phone)iterator.next()).getForegroundCall();
            if (call.getState().isAlive())
                arraylist.add(call);
        } while (true);
        return arraylist;
    }

    public List getAllNoIdleCalls()
    {
        ArrayList arraylist = new ArrayList();
        Iterator iterator = mActivePhoneList.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            Phone phone = (Phone)iterator.next();
            Call call = phone.getForegroundCall();
            if (call.getState().isAlive())
                arraylist.add(call);
            Call call1 = phone.getBackgroundCall();
            if (call1.getState().isAlive())
                arraylist.add(call1);
        } while (true);
        return arraylist;
    }

    public Call getFirstActiveBgCall()
    {
        Call call;
        if (isCdmaAndGsmActive())
        {
            Phone phone = getActiveCdmaPhone();
            Phone phone1 = getActiveGsmPhone();
            if (phone1.getForegroundCall().getState().isAlive())
            {
                if (phone1.getBackgroundCall().getState().isAlive())
                    call = phone1.getBackgroundCall();
                else
                    return phone.getForegroundCall();
            } else
            {
                return phone1.getBackgroundCall();
            }
        } else
        {
            boolean flag = mActivePhoneList.isEmpty();
            call = null;
            if (!flag)
                return ((Phone)mActivePhoneList.get(0)).getBackgroundCall();
        }
        return call;
    }

    public Call getFirstActiveRingingCall()
    {
        boolean flag = mActivePhoneList.isEmpty();
        Call call = null;
        if (!flag)
            call = ((Phone)mActivePhoneList.get(0)).getRingingCall();
        return call;
    }

    public Phone getFirstPhone()
    {
        if (mActivePhoneList != null && !mActivePhoneList.isEmpty())
            return (Phone)mActivePhoneList.get(0);
        else
            return null;
    }

    public Call getSecondActiveBgCall()
    {
        Phone phone;
label0:
        {
            int i = mActivePhoneList.size();
            Call call = null;
            if (i >= 2)
            {
                phone = (Phone)mActivePhoneList.get(1);
                if (phone.getPhoneType() != 2)
                    break label0;
                call = phone.getForegroundCall();
            }
            return call;
        }
        return phone.getBackgroundCall();
    }

    public Call getSecondActiveRingCall()
    {
        int i = mActivePhoneList.size();
        Call call = null;
        if (i > 1)
            call = ((Phone)mActivePhoneList.get(1)).getRingingCall();
        return call;
    }

    public Call getSecondActivieFgCall()
    {
        int i = mActivePhoneList.size();
        Call call = null;
        if (i > 1)
            call = ((Phone)mActivePhoneList.get(1)).getForegroundCall();
        return call;
    }

    public boolean hasActiveCdmaPhone()
    {
label0:
        {
            if (!sIsSupportDualTalk)
                break label0;
            Iterator iterator = mActivePhoneList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (((Phone)iterator.next()).getPhoneType() != 2);
            return true;
        }
        return false;
    }

    public boolean hasActiveOrHoldBothCdmaAndGsm()
    {
        if (sIsSupportDualTalk && mActivePhoneList.size() >= 2)
        {
            Phone phone = getActiveGsmPhone();
            Phone phone1 = getActiveCdmaPhone();
            if (phone != null && phone1 != null && (phone.getForegroundCall().getState().isAlive() || phone.getBackgroundCall().getState().isAlive()) && phone1.getForegroundCall().getState().isAlive())
                return true;
        }
        return false;
    }

    public boolean hasDualHoldCallsOnly()
    {
        if (mActivePhoneList.size() >= 2 && !isCdmaAndGsmActive() && !((Phone)mActivePhoneList.get(0)).getForegroundCall().getState().isAlive())
        {
            boolean flag;
            if (getFirstActiveBgCall().getState().isAlive() && getSecondActiveBgCall().getState().isAlive())
                flag = true;
            else
                flag = false;
            return flag;
        } else
        {
            return false;
        }
    }

    public boolean hasMultipleRingingCall()
    {
        if (sIsSupportDualTalk && mActivePhoneList.size() >= 2)
        {
            boolean flag;
            if (((Phone)mActivePhoneList.get(0)).getRingingCall().getState().isRinging() && ((Phone)mActivePhoneList.get(1)).getRingingCall().getState().isRinging())
                flag = true;
            else
                flag = false;
            return flag;
        } else
        {
            return false;
        }
    }

    public boolean isAllowedIncomingCall(Call call)
    {
        if (mActivePhoneList.size() < 2)
            return true;
        Phone phone = call.getPhone();
        Iterator iterator = mActivePhoneList.iterator();
        boolean flag1;
        do
        {
            boolean flag = iterator.hasNext();
            flag1 = false;
            if (!flag)
                break;
            if ((Phone)iterator.next() != phone)
                continue;
            flag1 = true;
            break;
        } while (true);
        return flag1;
    }

    public boolean isCdmaAndGsmActive()
    {
label0:
        {
            if (!sIsSupportDualTalk || mActivePhoneList.size() < 2)
                break label0;
            Iterator iterator = mActivePhoneList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (((Phone)iterator.next()).getPhoneType() != 2);
            return true;
        }
        return false;
    }

    public boolean isCdmaCallWaiting(Call call)
    {
        if (!PhoneUtils.hasMultipleConnections(call))
            return false;
        else
            return ((Connection)call.getConnections().get(1)).isIncoming();
    }

    public boolean isDualTalkAnswerCase()
    {
        List list = getAllNoIdleCalls();
        int i = list.size();
        if (i == 1)
        {
            Call call = (Call)list.get(0);
            if (call.getPhone().getPhoneType() == 2 && call.getConnections().size() >= 2)
                i++;
        }
        return i >= 2;
    }

    public boolean isDualTalkMultipleHoldCase()
    {
        return getAllNoIdleCalls().size() > 2;
    }

    public boolean isMultiplePhoneActive()
    {
        if (!sIsSupportDualTalk)
        {
            log("don't support dualtalk!");
            return false;
        }
        if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
        {
            log("CallManager says in idle state!");
            return false;
        }
        List list = mCM.getAllPhones();
        int i = 0;
        for (Iterator iterator = list.iterator(); iterator.hasNext();)
        {
            Phone phone = (Phone)iterator.next();
            if (phone.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
            {
                i++;
                log((new StringBuilder()).append("non IDLE phone = ").append(phone.toString()).toString());
                if (i > 1)
                {
                    log("More than one phone active!");
                    return true;
                }
            }
        }

        log("Strange! no phone active but we go here!");
        return false;
    }

    public boolean isPhoneCallAllowed(int i)
    {
        boolean flag = true;
        if (mActivePhoneList.size() >= 2)
        {
            boolean flag1 = false;
            Iterator iterator = mActivePhoneList.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                Phone phone = (Phone)iterator.next();
                if (phone instanceof SipPhone)
                    log("match the SipPhone, do nothing.");
                else
                if ((phone instanceof GSMPhone) && phone.getMySimId() == i)
                    flag1 = true;
                else
                if (phone instanceof CDMAPhone)
                    log("match the CDMAPhone, do nothing.");
            } while (true);
            if (!flag1)
                flag = false;
        }
        return flag;
    }

    public boolean isPhoneCallAllowed(Phone phone)
    {
        boolean flag = true;
        if (mActivePhoneList.size() >= 2 && mActivePhoneList.get(0) != phone && mActivePhoneList.get(1) != phone)
            flag = false;
        return flag;
    }

    public boolean isRingingWhenOutgoing()
    {
        if (sIsSupportDualTalk && mActivePhoneList.size() >= 2)
            return ((Phone)mActivePhoneList.get(0)).getRingingCall().getState().isRinging() && ((Phone)mActivePhoneList.get(1)).getForegroundCall().getState().isDialing();
        else
            return false;
    }

    public boolean isSupportHoldAndUnhold()
    {
        return sIsSupportDualTalk && mActivePhoneList.size() >= 2 && mCM.getState() == com.android.internal.telephony.PhoneConstants.State.OFFHOOK && getAllNoIdleCalls().size() == 2;
    }

    public void switchCalls()
    {
        log("Enter switchCalls!");
        dumpActivePhone();
        if (mActivePhoneList != null && mActivePhoneList.size() >= 2)
        {
            Phone phone = (Phone)mActivePhoneList.get(0);
            mActivePhoneList.remove(0);
            mActivePhoneList.add(1, phone);
            dumpActivePhone();
            log("Exit switchCalls!");
            return;
        } else
        {
            return;
        }
    }

    public void switchPhoneByNeededForRing(Phone phone)
    {
        if (phone.getRingingCall().isRinging())
        {
            if (mActivePhoneList.isEmpty())
                updateState();
            int i = mActivePhoneList.size();
            if (phone != mActivePhoneList.get(0))
            {
                if (i == 1)
                {
                    mActivePhoneList.add(0, phone);
                    return;
                }
                if (i == 2 && phone == mActivePhoneList.get(1))
                {
                    switchCalls();
                    return;
                }
            }
        }
    }

    public void updateState()
    {
        log("updateState: start!");
        if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
        {
            log("updateState: CM is idle! clear activePhoneList!");
            mActivePhoneList.clear();
            return;
        }
        Iterator iterator = mActivePhoneList.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            Phone phone1 = (Phone)iterator.next();
            if (phone1.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
            {
                log((new StringBuilder()).append("updateState: remove ").append(phone1.getPhoneName()).append(" activePhoneList!").toString());
                iterator.remove();
            }
        } while (true);
        Iterator iterator1 = getActivePhoneList().iterator();
        do
        {
            if (!iterator1.hasNext())
                break;
            Phone phone = (Phone)iterator1.next();
            if (!mActivePhoneList.contains(phone) && mActivePhoneList.size() < 2)
                mActivePhoneList.add(0, phone);
        } while (true);
        if (mActivePhoneList.size() > 1)
            switchPhoneByNeeded();
        dumpActivePhone();
        log("updateState: exit!");
    }

}
