// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;


public class CdmaPhoneCallState
{
    public static final class PhoneCallState extends Enum
    {

        private static final PhoneCallState $VALUES[];
        public static final PhoneCallState CONF_CALL;
        public static final PhoneCallState IDLE;
        public static final PhoneCallState SINGLE_ACTIVE;
        public static final PhoneCallState THRWAY_ACTIVE;

        public static PhoneCallState valueOf(String s)
        {
            return (PhoneCallState)Enum.valueOf(com/android/phone/CdmaPhoneCallState$PhoneCallState, s);
        }

        public static PhoneCallState[] values()
        {
            return (PhoneCallState[])$VALUES.clone();
        }

        static 
        {
            IDLE = new PhoneCallState("IDLE", 0);
            SINGLE_ACTIVE = new PhoneCallState("SINGLE_ACTIVE", 1);
            THRWAY_ACTIVE = new PhoneCallState("THRWAY_ACTIVE", 2);
            CONF_CALL = new PhoneCallState("CONF_CALL", 3);
            PhoneCallState aphonecallstate[] = new PhoneCallState[4];
            aphonecallstate[0] = IDLE;
            aphonecallstate[1] = SINGLE_ACTIVE;
            aphonecallstate[2] = THRWAY_ACTIVE;
            aphonecallstate[3] = CONF_CALL;
            $VALUES = aphonecallstate;
        }

        private PhoneCallState(String s, int i)
        {
            super(s, i);
        }
    }


    private boolean mAddCallMenuStateAfterCW;
    private PhoneCallState mCurrentCallState;
    private PhoneCallState mPreviousCallState;
    private boolean mThreeWayCallOrigStateDialing;


    public void CdmaPhoneCallStateInit()
    {
        mCurrentCallState = PhoneCallState.IDLE;
        mPreviousCallState = PhoneCallState.IDLE;
        mThreeWayCallOrigStateDialing = false;
        mAddCallMenuStateAfterCW = true;
    }

    public boolean IsThreeWayCallOrigStateDialing()
    {
        return mThreeWayCallOrigStateDialing;
    }

    public boolean getAddCallMenuStateAfterCallWaiting()
    {
        return mAddCallMenuStateAfterCW;
    }

    public PhoneCallState getCurrentCallState()
    {
        return mCurrentCallState;
    }

    public PhoneCallState getPreviousCallState()
    {
        return mPreviousCallState;
    }

    public void resetCdmaPhoneCallState()
    {
        mCurrentCallState = PhoneCallState.IDLE;
        mPreviousCallState = PhoneCallState.IDLE;
        mThreeWayCallOrigStateDialing = false;
        mAddCallMenuStateAfterCW = true;
    }

    public void setAddCallMenuStateAfterCallWaiting(boolean flag)
    {
        mAddCallMenuStateAfterCW = flag;
    }

    public void setCurrentCallState(PhoneCallState phonecallstate)
    {
        mPreviousCallState = mCurrentCallState;
        mCurrentCallState = phonecallstate;
        mThreeWayCallOrigStateDialing = false;
        if (mCurrentCallState == PhoneCallState.SINGLE_ACTIVE && mPreviousCallState == PhoneCallState.IDLE)
            mAddCallMenuStateAfterCW = true;
    }

    public void setThreeWayCallOrigState(boolean flag)
    {
        mThreeWayCallOrigStateDialing = flag;
    }
}
