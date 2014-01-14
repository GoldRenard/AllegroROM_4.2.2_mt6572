// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.app.*;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.*;
import android.telephony.TelephonyManager;
import android.text.TextWatcher;
import android.text.method.DigitsKeyListener;
import android.util.AttributeSet;
import android.util.Log;
import android.view.*;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.TextView;
import com.android.internal.telephony.ITelephony;
import com.mediatek.common.telephony.ITelephonyEx;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardAbsKeyInputView, KeyguardSecurityView, KeyguardUtils, KeyguardUpdateMonitor, 
//            SecurityMessageDisplay, KeyguardSecurityCallback, KeyguardUpdateMonitorCallback

public class KeyguardSimPinPukView extends KeyguardAbsKeyInputView
    implements KeyguardSecurityView, android.widget.TextView.OnEditorActionListener, TextWatcher
{
    private abstract class CheckSimMe extends Thread
    {

        private final String mPasswd;
        private int mResult;
        final KeyguardSimPinPukView this$0;

        abstract void onSimMeCheckResponse(int i);

        public void run()
        {
            try
            {
                Log.d("KeyguardSimPinPukView", (new StringBuilder()).append("CheckMe, mSimId =").append(mSimId).toString());
                mResult = com.mediatek.common.telephony.ITelephonyEx.Stub.asInterface(ServiceManager.checkService("phoneEx")).supplyNetworkDepersonalization(mPasswd, mSimId);
                post(new Runnable() {

                    final CheckSimMe this$1;

                    public void run()
                    {
                        onSimMeCheckResponse(mResult);
                    }

            
            {
                this$1 = CheckSimMe.this;
                Object();
            }
                }
);
                return;
            }
            catch (RemoteException remoteexception)
            {
                post(new Runnable() {

                    final CheckSimMe this$1;

                    public void run()
                    {
                        onSimMeCheckResponse(2);
                    }

            
            {
                this$1 = CheckSimMe.this;
                Object();
            }
                }
);
            }
        }


        protected CheckSimMe(String s, int i)
        {
            this$0 = KeyguardSimPinPukView.this;
            Thread();
            mPasswd = s;
        }
    }

    private abstract class CheckSimPinPuk extends Thread
    {

        private final String mPin;
        private final String mPuk;
        private boolean mResult;
        final KeyguardSimPinPukView this$0;

        abstract void onSimCheckResponse(boolean flag);

        public void run()
        {
            Log.d("KeyguardSimPinPukView", (new StringBuilder()).append("CheckSimPin, mSimId =").append(mSimId).toString());
            if (!KeyguardUtils.isGemini()) goto _L2; else goto _L1
_L1:
            if (mUpdateMonitor.getSimState(mSimId) != com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED) goto _L4; else goto _L3
_L3:
            mResult = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.checkService("phone")).supplyPinGemini(mPin, mSimId);
_L6:
            post(new Runnable() {

                final CheckSimPinPuk this$1;

                public void run()
                {
                    onSimCheckResponse(mResult);
                }

            
            {
                this$1 = CheckSimPinPuk.this;
                Object();
            }
            }
);
            return;
_L4:
            if (mUpdateMonitor.getSimState(mSimId) != com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED) goto _L6; else goto _L5
_L5:
            mResult = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.checkService("phone")).supplyPukGemini(mPuk, mPin, mSimId);
              goto _L6
            RemoteException remoteexception;
            remoteexception;
            post(new Runnable() {

                final CheckSimPinPuk this$1;

                public void run()
                {
                    onSimCheckResponse(false);
                }

            
            {
                this$1 = CheckSimPinPuk.this;
                Object();
            }
            }
);
            return;
_L2:
            if (mUpdateMonitor.getSimState(mSimId) != com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED) goto _L8; else goto _L7
_L7:
            mResult = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.checkService("phone")).supplyPin(mPin);
              goto _L6
_L8:
            if (mUpdateMonitor.getSimState(mSimId) != com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED) goto _L6; else goto _L9
_L9:
            mResult = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.checkService("phone")).supplyPuk(mPuk, mPin);
              goto _L6
        }


        protected CheckSimPinPuk(String s)
        {
            this$0 = KeyguardSimPinPukView.this;
            Thread();
            mPin = s;
            mPuk = null;
        }

        protected CheckSimPinPuk(String s, int i)
        {
            this$0 = KeyguardSimPinPukView.this;
            Thread();
            mPin = s;
            mPuk = null;
        }

        protected CheckSimPinPuk(String s, String s1, int i)
        {
            this$0 = KeyguardSimPinPukView.this;
            Thread();
            mPin = s1;
            mPuk = s;
        }
    }

    public static class Toast
    {

        static final boolean LOCAL_LOGV = false;
        static final String LOCAL_TAG = "Toast";
        final Context mContext;
        int mGravity;
        final Handler mHandler = new Handler();
        private INotificationManager mService;
        final TN mTN = new TN();
        View mView;
        int mY;

        private INotificationManager getService()
        {
            if (mService != null)
            {
                return mService;
            } else
            {
                mService = android.app.INotificationManager.Stub.asInterface(ServiceManager.getService("notification"));
                return mService;
            }
        }

        public static Toast makeText(Context context, CharSequence charsequence)
        {
            Toast toast = new Toast(context);
            View view = ((LayoutInflater)context.getSystemService("layout_inflater")).inflate(0x10900df, null);
            ((TextView)view.findViewById(0x102000b)).setText(charsequence);
            toast.mView = view;
            return toast;
        }

        public void cancel()
        {
            mTN.hide();
        }

        public void show()
        {
            if (mView == null)
                throw new RuntimeException("setView must have been called");
            INotificationManager inotificationmanager = getService();
            String s = mContext.getPackageName();
            TN tn = mTN;
            try
            {
                inotificationmanager.enqueueToast(s, tn, 0);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
        }

        public Toast(Context context)
        {
            mGravity = 81;
            mContext = context;
            mY = context.getResources().getDimensionPixelSize(0x105000b);
        }
    }

    private class Toast.TN extends android.app.ITransientNotification.Stub
    {

        final Runnable mHide = new _cls2();
        private final android.view.WindowManager.LayoutParams mParams = new LayoutParams();
        final Runnable mShow = new _cls1();
        WindowManagerImpl mWM;
        final Toast this$0;

        public void handleHide()
        {
            if (mView != null)
            {
                if (mView.getParent() != null)
                    mWM.removeView(mView);
                mView = null;
            }
        }

        public void handleShow()
        {
            mWM = (WindowManagerImpl)mContext.getSystemService("window");
            int i = mGravity;
            mParams.gravity = i;
            if ((i & 7) == 7)
                mParams.horizontalWeight = 1.0F;
            if ((i & 0x70) == 112)
                mParams.verticalWeight = 1.0F;
            mParams.y = mY;
            if (mView != null)
            {
                if (mView.getParent() != null)
                    mWM.removeView(mView);
                mWM.addView(mView, mParams);
            }
        }

        public void hide()
        {
            mHandler.post(mHide);
        }

        public void show()
        {
            mHandler.post(mShow);
        }

        Toast.TN()
        {
            this$0 = Toast.this;
            Stub();
            android.view.WindowManager.LayoutParams layoutparams = mParams;
            layoutparams.height = -2;
            layoutparams.width = -2;
            layoutparams.flags = 152;
            layoutparams.format = -3;
            layoutparams.windowAnimations = 0x1030004;
            layoutparams.type = 2009;
            layoutparams.setTitle("Toast");
        }
    }


    private static final int GET_SIM_RETRY_EMPTY = -1;
    private static final int MAX_PIN_LENGTH = 8;
    private static final int MIN_PIN_LENGTH = 4;
    private static final int SIMLOCK_TYPE_PIN_PUK = 1;
    private static final int SIMLOCK_TYPE_SIMMELOCK = 2;
    private static final int SIMPINPUK_WAIT_STATE_CHANGE_TIMEOUT = 6000;
    private static final int STATE_ENTER_FINISH = 4;
    private static final int STATE_ENTER_ME = 5;
    private static final int STATE_ENTER_NEW = 2;
    private static final int STATE_ENTER_PIN = 0;
    private static final int STATE_ENTER_PUK = 1;
    private static final int STATE_REENTER_NEW = 3;
    private static final String TAG = "KeyguardSimPinPukView";
    private static final int VERIFY_INCORRECT_PASSWORD = 1;
    private static final int VERIFY_RESULT_EXCEPTION = 2;
    private static final int VERIFY_RESULT_PASS = 0;
    static final int VERIFY_TYPE_PIN = 501;
    static final int VERIFY_TYPE_PUK = 502;
    static final int VERIFY_TYPE_SIMMELOCK = 503;
    private Runnable mDismissSimPinPukRunnable = new Runnable() {

        final KeyguardSimPinPukView this$0;

        public void run()
        {
            sendVerifyResult(501, false);
            mUpdateMonitor.reportSimUnlocked(mSimId);
        }

            
            {
                this$0 = KeyguardSimPinPukView.this;
                Object();
            }
    }
;
    KeyguardUpdateMonitorCallback mInfoCallback = new KeyguardUpdateMonitorCallback() {

        final KeyguardSimPinPukView this$0;

        public void onLockScreenUpdate(int i)
        {
            KeyguardUtils.xlogD("KeyguardSimPinPukView", (new StringBuilder()).append("onLockScreenUpdate name update, slotId=").append(i).append(", mSimId=").append(mSimId).toString());
            if (KeyguardUtils.isGemini() && mSimId == i)
                getSIMCardName(i);
        }

        public void onPhoneStateChanged(int i)
        {
            if (mSimCardDialog != null && mSimCardDialog.isShowing() && i != 0)
                mSimCardDialog.dismiss();
        }

        public void onSIMInfoChanged(int i)
        {
            KeyguardUtils.xlogD("KeyguardSimPinPukView", (new StringBuilder()).append("onSIMInfoChanged, slotId=").append(i).append(", mSimId=").append(mSimId).toString());
            if (mSimId == i)
                dealwithSIMInfoChanged(i);
        }

        public void onSimStateChanged(com.android.internal.telephony.IccCardConstants.State state)
        {
            KeyguardUtils.xlogD("KeyguardSimPinPukView", (new StringBuilder()).append("onSimStateChanged: ").append(state).toString());
            onSimStateChangedGemini(state, mSimId);
        }

        public void onSimStateChangedGemini(com.android.internal.telephony.IccCardConstants.State state, int i)
        {
            KeyguardUtils.xlogD("KeyguardSimPinPukView", (new StringBuilder()).append("onSimStateChangedGemini: ").append(state).append(", simId=").append(i).toString());
            if (i == mSimId)
            {
                if (mSimUnlockProgressDialog != null)
                    mSimUnlockProgressDialog.hide();
                removeCallbacks(mDismissSimPinPukRunnable);
                if (com.android.internal.telephony.IccCardConstants.State.READY == state)
                {
                    mCallback.dismiss(true);
                } else
                {
                    if (com.android.internal.telephony.IccCardConstants.State.NOT_READY == state)
                    {
                        sendVerifyResult(501, false);
                        mCallback.dismiss(true);
                        return;
                    }
                    if (com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED == state)
                        if (getRetryMeCount(mSimId) == 0)
                        {
                            KeyguardUtils.xlogD("KeyguardSimPinPukView", "onSimStateChangedGemini: ME retrycount is 0, dismiss it");
                            sendVerifyResult(503, false);
                            mUpdateMonitor.setPINDismiss(mSimId, KeyguardUpdateMonitor.SimLockType.SIM_LOCK_ME, true);
                            mCallback.dismiss(true);
                            return;
                        } else
                        {
                            updateSimState();
                            return;
                        }
                    if (com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED == state || com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED == state)
                    {
                        mPinText.setText("");
                        mSecurityMessageDisplay.setMessage(mSb.toString(), true);
                        return;
                    }
                }
            }
        }

            
            {
                this$0 = KeyguardSimPinPukView.this;
                KeyguardUpdateMonitorCallback();
            }
    }
;
    private String mNewPinText;
    private int mPUKRetryCount;
    private TextView mPinText;
    private String mPukText;
    private TextView mSIMCardName;
    private int mSIMCardNamePadding;
    private StringBuffer mSb;
    private AlertDialog mSimCardDialog;
    private volatile boolean mSimCheckInProgress;
    private boolean mSimFirstBoot[];
    public int mSimId;
    private ProgressDialog mSimUnlockProgressDialog;
    private int mUnlockEnterState;
    KeyguardUpdateMonitor mUpdateMonitor;
    private String strLockName[] = {
        " [NP]", " [NSP]", " [SP]", " [CP]", " [SIMP]"
    };

    public KeyguardSimPinPukView(Context context)
    {
        KeyguardSimPinPukView(context, null);
    }

    public KeyguardSimPinPukView(Context context, AttributeSet attributeset)
    {
        KeyguardAbsKeyInputView(context, attributeset);
        mSimUnlockProgressDialog = null;
        mUpdateMonitor = null;
        mSimId = 0;
        mSIMCardName = null;
        mSb = null;
        initMembers();
    }

    private void checkMe()
    {
        checkMe(mSimId);
    }

    private void checkMe(int i)
    {
        getSimUnlockProgressDialog().show();
        if (!mSimCheckInProgress)
        {
            mSimCheckInProgress = true;
            (new CheckSimMe(mPasswordEntry.getText().toString(), mSimId) {

                final KeyguardSimPinPukView this$0;

                void onSimMeCheckResponse(int j)
                {
                    post(j. new Runnable() {

                        final _cls9 this$1;
                        final int val$ret;

                        public void run()
                        {
                            KeyguardUtils.xlogD("KeyguardSimPinPukView", (new StringBuilder()).append("checkMe onSimChangedResponse, ret = ").append(ret).toString());
                            if (ret == 0)
                                postDelayed(mDismissSimPinPukRunnable, 6000L);
                            else
                            if (1 == ret)
                            {
                                mSb.delete(0, mSb.length());
                                minusRetryMeCount(mSimId);
                                if (mSimUnlockProgressDialog != null)
                                    mSimUnlockProgressDialog.hide();
                                if (mUnlockEnterState == 5)
                                {
                                    if (getRetryMeCount(mSimId) == 0)
                                    {
                                        setInputInvalidAlertDialog(
// JavaClassFileOutputException: get_constant: invalid tag

            
            {
                this$1 = final__pcls9;
                ret = I.this;
                Object();
            }
                    }
);
                }

            
            {
                this$0 = KeyguardSimPinPukView.this;
                CheckSimMe(s, i);
            }
            }
).start();
        }
    }

    private void checkPin()
    {
        checkPin(mSimId);
    }

    private void checkPin(int i)
    {
        getSimUnlockProgressDialog().show();
        if (!mSimCheckInProgress)
        {
            mSimCheckInProgress = true;
            (new CheckSimPinPuk(mPasswordEntry.getText().toString(), mSimId) {

                final KeyguardSimPinPukView this$0;

                void onSimCheckResponse(boolean flag)
                {
                    post(flag. new Runnable() {

                        final _cls7 this$1;
                        final boolean val$success;

                        public void run()
                        {
                            KeyguardUtils.xlogD("KeyguardSimPinPukView", (new StringBuilder()).append("checkPin onSimLockChangedResponse, success = ").append(success).toString());
                            if (success)
                            {
                                postDelayed(mDismissSimPinPukRunnable, 6000L);
                            } else
                            {
                                mSb.delete(0, mSb.length());
                                if (mSimUnlockProgressDialog != null)
                                    mSimUnlockProgressDialog.hide();
                                if (mUnlockEnterState == 0)
                                {
                                    mSb.append(mSecurityMessageDisplay.getText(0x2050095));
                                    if (getRetryPinCount(mSimId) == 0)
                                    {
                                        mSb.append(mSecurityMessageDisplay.getText(0x2050011));
                                        mSb.append((new StringBuilder()).append(" ").append(getRetryPuk(mSimId)).toString());
                                        mUnlockEnterState = 1;
                                    } else
                                    {
                                        mSb.append(mSecurityMessageDisplay.getText(0x10402dc));
                                        mSb.append((new StringBuilder()).append(" ").append(getRetryPin(mSimId)).toString());
                                    }
                                    mSecurityMessageDisplay.setMessage(mSb.toString(), true);
                                    mPinText.setText("");
                                } else
                                if (mUnlockEnterState == 1)
                                {
                                    mSb.append(mSecurityMessageDisplay.getText(0x2050095));
                                    if (getRetryPukCount(mSimId) == 0)
                                    {
                                        mSb.append(mSecurityMessageDisplay.getText(0x2050011));
                                        mSb.append((new StringBuilder()).append(" ").append(getRetryPuk(mSimId)).toString());
                                        mUnlockEnterState = 1;
                                    } else
                                    {
                                        mSb.append(mSecurityMessageDisplay.getText(0x10402dc));
                                        mSb.append((new StringBuilder()).append(" ").append(getRetryPin(mSimId)).toString());
                                    }
                                    mSecurityMessageDisplay.setMessage(mSb.toString(), true);
                                    mPinText.setText("");
                                }
                            }
                            mCallback.userActivity(0L);
                            mSimCheckInProgress = false;
                        }

            
            {
                this$1 = final__pcls7;
                success = Z.this;
                Object();
            }
                    }
);
                }

            
            {
                this$0 = KeyguardSimPinPukView.this;
                CheckSimPinPuk(s, i);
            }
            }
).start();
        }
    }

    private void checkPuk()
    {
        checkPuk(mSimId);
    }

    private void checkPuk(int i)
    {
        updatePinEnterScreen();
        if (mUnlockEnterState == 4)
        {
            getSimUnlockProgressDialog().show();
            if (!mSimCheckInProgress)
            {
                mSimCheckInProgress = true;
                (new CheckSimPinPuk(mPukText, mNewPinText, mSimId) {

                    final KeyguardSimPinPukView this$0;

                    void onSimCheckResponse(boolean flag)
                    {
                        post(flag. new Runnable() {

                            final _cls8 this$1;
                            final boolean val$success;

                            public void run()
                            {
                                KeyguardUtils.xlogD("KeyguardSimPinPukView", (new StringBuilder()).append("checkPuk onSimLockChangedResponse, success = ").append(success).toString());
                                if (success)
                                {
                                    postDelayed(mDismissSimPinPukRunnable, 6000L);
                                } else
                                {
                                    mSb.delete(0, mSb.length());
                                    if (mSimUnlockProgressDialog != null)
                                        mSimUnlockProgressDialog.hide();
                                    getSIMCardName(mSimId);
                                    mSb.append(
// JavaClassFileOutputException: get_constant: invalid tag

            
            {
                this$1 = final__pcls8;
                success = Z.this;
                Object();
            }
                        }
);
                    }

            
            {
                this$0 = KeyguardSimPinPukView.this;
                CheckSimPinPuk(s, s1, i);
            }
                }
).start();
                return;
            }
        }
    }

    private void dealWithPinOrPukUnlock()
    {
        if (KeyguardUtils.isGemini())
        {
            if (mUpdateMonitor.getSimState(mSimId) == com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED)
            {
                KeyguardUtils.xlogD("KeyguardSimPinPukView", (new StringBuilder()).append("onClick, check PIN, mSimId=").append(mSimId).toString());
                checkPin(mSimId);
            } else
            {
                if (mUpdateMonitor.getSimState(mSimId) == com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED)
                {
                    KeyguardUtils.xlogD("KeyguardSimPinPukView", (new StringBuilder()).append("onClick, check PUK, mSimId=").append(mSimId).toString());
                    checkPuk(mSimId);
                    return;
                }
                if (mUpdateMonitor.getSimState(mSimId) == com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED)
                {
                    KeyguardUtils.xlogD("KeyguardSimPinPukView", (new StringBuilder()).append("onClick, check ME, mSimId=").append(mSimId).toString());
                    checkMe(mSimId);
                    return;
                } else
                {
                    KeyguardUtils.xlogD("KeyguardSimPinPukView", (new StringBuilder()).append("wrong status, mSimId=").append(mSimId).toString());
                    return;
                }
            }
        } else
        {
            if (mUpdateMonitor.getSimState() == com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED)
            {
                KeyguardUtils.xlogD("KeyguardSimPinPukView", "onClick, check Pin for single SIM");
                checkPin();
                return;
            }
            if (mUpdateMonitor.getSimState() == com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED)
            {
                KeyguardUtils.xlogD("KeyguardSimPinPukView", "onClick, check PUK for single SIM");
                checkPuk();
                return;
            }
            if (mUpdateMonitor.getSimState() == com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED)
            {
                KeyguardUtils.xlogD("KeyguardSimPinPukView", "onClick, check ME for single SIM");
                checkMe();
                return;
            }
        }
    }

    private void dealwithSIMInfoChanged(int i)
    {
        KeyguardUpdateMonitor keyguardupdatemonitor;
        android.graphics.drawable.Drawable drawable;
        String s;
        keyguardupdatemonitor = mUpdateMonitor;
        drawable = null;
        s = null;
        if (keyguardupdatemonitor == null) goto _L2; else goto _L1
_L1:
        boolean flag;
        flag = KeyguardUtils.isGemini();
        drawable = null;
        s = null;
        if (!flag) goto _L2; else goto _L3
_L3:
        TextView textview;
        String s1;
        android.graphics.drawable.Drawable drawable1;
        try
        {
            drawable1 = mUpdateMonitor.getOptrDrawableBySlot(i);
        }
        catch (IndexOutOfBoundsException indexoutofboundsexception)
        {
            KeyguardUtils.xlogW("KeyguardSimPinPukView", (new StringBuilder()).append("getOptrDrawableBySlot exception, slotId=").append(i).toString());
            drawable = null;
            continue; /* Loop/switch isn't completed */
        }
        drawable = drawable1;
_L10:
        s1 = mUpdateMonitor.getOptrNameBySlot(i);
        s = s1;
_L2:
        Log.i("KeyguardSimPinPukView", (new StringBuilder()).append("dealwithSIMInfoChanged, slotId=").append(i).append(", operName=").append(s).toString());
        textview = (TextView)findViewById(0x2100032);
        if (s != null) goto _L5; else goto _L4
_L4:
        KeyguardUtils.xlogI("KeyguardSimPinPukView", (new StringBuilder()).append("SIM").append(mSimId).append(" is first reboot").toString());
        mSimFirstBoot[mSimId] = true;
        setForTextNewCard(mSimId);
        mSIMCardName.setVisibility(8);
_L7:
        return;
        IndexOutOfBoundsException indexoutofboundsexception1;
        indexoutofboundsexception1;
        KeyguardUtils.xlogW("KeyguardSimPinPukView", (new StringBuilder()).append("getOptrNameBySlot exception, slotId=").append(i).toString());
        s = null;
          goto _L2
_L5:
        if (mSimId != i) goto _L7; else goto _L6
_L6:
        KeyguardUtils.xlogD("KeyguardSimPinPukView", "dealwithSIMInfoChanged, we will refresh the SIMinfo");
        StringBuilder stringbuilder = new StringBuilder();
        Context context = mContext;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i + 1);
        textview.setText(stringbuilder.append(context.getString(0x205007e, aobj)).append(" ").toString());
        mSIMCardName.setVisibility(0);
        mSIMCardName.setText(s);
        if (drawable == null) goto _L7; else goto _L8
_L8:
        mSIMCardName.setBackground(drawable);
        mSIMCardName.setPadding(mSIMCardNamePadding, 0, mSIMCardNamePadding, 0);
        return;
        if (true) goto _L10; else goto _L9
_L9:
    }

    private String getRetryMe(int i)
    {
        int j = getRetryMeCount(i);
        StringBuilder stringbuilder = (new StringBuilder()).append("(");
        Context context = mContext;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(j);
        return stringbuilder.append(context.getString(0x205001a, aobj)).append(")").toString();
    }

    private int getRetryMeCount(int i)
    {
        return mUpdateMonitor.getSimMeLeftRetryCount(i);
    }

    private String getRetryPin(int i)
    {
        int j = getRetryPinCount(i);
        switch (j)
        {
        case -1: 
            return " ";
        }
        StringBuilder stringbuilder = (new StringBuilder()).append("(");
        Context context = mContext;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(j);
        return stringbuilder.append(context.getString(0x205001a, aobj)).append(")").toString();
    }

    private int getRetryPinCount(int i)
    {
        if (mSimId == 3)
            return SystemProperties.getInt("gsm.sim.retry.pin1.4", -1);
        if (mSimId == 2)
            return SystemProperties.getInt("gsm.sim.retry.pin1.3", -1);
        if (mSimId == 1)
            return SystemProperties.getInt("gsm.sim.retry.pin1.2", -1);
        else
            return SystemProperties.getInt("gsm.sim.retry.pin1", -1);
    }

    private String getRetryPuk(int i)
    {
        mPUKRetryCount = getRetryPukCount(i);
        switch (mPUKRetryCount)
        {
        case -1: 
            return " ";
        }
        StringBuilder stringbuilder = (new StringBuilder()).append("(");
        Context context = mContext;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(mPUKRetryCount);
        return stringbuilder.append(context.getString(0x205001a, aobj)).append(")").toString();
    }

    private int getRetryPukCount(int i)
    {
        if (mSimId == 3)
            return SystemProperties.getInt("gsm.sim.retry.puk1.4", -1);
        if (mSimId == 2)
            return SystemProperties.getInt("gsm.sim.retry.puk1.3", -1);
        if (mSimId == 1)
            return SystemProperties.getInt("gsm.sim.retry.puk1.2", -1);
        else
            return SystemProperties.getInt("gsm.sim.retry.puk1", -1);
    }

    private void getSIMCardName(int i)
    {
        String s;
        android.graphics.drawable.Drawable drawable;
        String s1;
        android.graphics.drawable.Drawable drawable1;
        try
        {
            drawable1 = mUpdateMonitor.getOptrDrawableBySlot(i);
        }
        catch (IndexOutOfBoundsException indexoutofboundsexception)
        {
            KeyguardUtils.xlogW("KeyguardSimPinPukView", (new StringBuilder()).append("getSIMCardName::getOptrDrawableBySlot exception, slotId=").append(i).toString());
            drawable = null;
            continue; /* Loop/switch isn't completed */
        }
        drawable = drawable1;
_L4:
        if (drawable != null)
        {
            mSIMCardName.setBackground(drawable);
            mSIMCardName.setPadding(mSIMCardNamePadding, 0, mSIMCardNamePadding, 0);
        }
        s1 = mUpdateMonitor.getOptrNameBySlot(i);
        s = s1;
_L2:
        KeyguardUtils.xlogD("KeyguardSimPinPukView", (new StringBuilder()).append("slotId=").append(i).append(", mSimId=").append(mSimId).append(",s=").append(s).toString());
        if (s != null)
        {
            mSIMCardName.setText(s);
            return;
        }
        break; /* Loop/switch isn't completed */
        IndexOutOfBoundsException indexoutofboundsexception1;
        indexoutofboundsexception1;
        KeyguardUtils.xlogW("KeyguardSimPinPukView", (new StringBuilder()).append("getSIMCardName::getOptrNameBySlot exception, slotId=").append(i).toString());
        s = null;
        if (true) goto _L2; else goto _L1
_L1:
        if (mSimFirstBoot[mSimId])
        {
            KeyguardUtils.xlogD("KeyguardSimPinPukView", "getSIMCardName for the first reboot");
            setForTextNewCard(mSimId);
            return;
        }
        KeyguardUtils.xlogD("KeyguardSimPinPukView", "getSIMCardName for seaching SIM card");
        mSIMCardName.setText(0x205009c);
        return;
        if (true) goto _L4; else goto _L3
_L3:
    }

    private Dialog getSimUnlockProgressDialog()
    {
        if (mSimUnlockProgressDialog == null)
        {
            mSimUnlockProgressDialog = new ProgressDialog(mContext);
            mSimUnlockProgressDialog.setMessage(mContext.getString(0x104052f));
            mSimUnlockProgressDialog.setIndeterminate(true);
            mSimUnlockProgressDialog.setCancelable(false);
            if (!(mContext instanceof Activity))
                mSimUnlockProgressDialog.getWindow().setType(2009);
        }
        return mSimUnlockProgressDialog;
    }

    private void initMembers()
    {
        mSb = new StringBuffer();
        mUpdateMonitor = KeyguardUpdateMonitor.getInstance(getContext());
        mSimFirstBoot = new boolean[KeyguardUtils.getNumOfSim()];
        for (int i = 0; i < KeyguardUtils.getNumOfSim(); i++)
            mSimFirstBoot[i] = false;

    }

    private boolean isSimLockDisplay(int i, int j)
    {
label0:
        {
            if (i >= 0)
            {
                Long long1 = Long.valueOf(Long.valueOf(android.provider.Settings.System.getLong(mContext.getContentResolver(), "sim_lock_state_setting", 0L)).longValue() >>> i * 2);
                if (1 == j)
                {
                    if (1L == (1L & long1.longValue()))
                        return true;
                } else
                {
                    if (2 != j)
                        break label0;
                    if (1L == (1L & Long.valueOf(long1.longValue() >>> 1).longValue()))
                        return true;
                }
            }
            return false;
        }
        return true;
    }

    private void minusRetryMeCount(int i)
    {
        mUpdateMonitor.minusSimMeLeftRetryCount(i);
    }

    private void setForTextNewCard(int i)
    {
        TextView textview = (TextView)findViewById(0x2100032);
        StringBuffer stringbuffer = new StringBuffer();
        Context context = mContext;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i + 1);
        stringbuffer.append(context.getString(0x205007e, aobj));
        stringbuffer.append(" ");
        stringbuffer.append(mContext.getText(0x205007f));
        textview.setText(stringbuffer);
    }

    private void setInputInvalidAlertDialog(CharSequence charsequence, boolean flag)
    {
        StringBuilder stringbuilder = new StringBuilder(charsequence);
        if (flag)
        {
            AlertDialog alertdialog = (new Builder(mContext)).setMessage(stringbuilder).setPositiveButton(0x104000a, null).setCancelable(true).create();
            alertdialog.getWindow().setType(2009);
            alertdialog.getWindow().addFlags(2);
            alertdialog.show();
            return;
        } else
        {
            Toast.makeText(mContext, stringbuilder).show();
            return;
        }
    }

    private void setSimLockScreenDone(int i, int j)
    {
        if (i < 0)
            return;
        if (isSimLockDisplay(i, j))
        {
            KeyguardUtils.xlogD("KeyguardSimPinPukView", "setSimLockScreenDone the SimLock display is done");
            return;
        }
        Long long1 = Long.valueOf(android.provider.Settings.System.getLong(mContext.getContentResolver(), "sim_lock_state_setting", 0L));
        Long long2 = Long.valueOf(Long.valueOf(1L).longValue() << i * 2);
        KeyguardUtils.xlogD("KeyguardSimPinPukView", (new StringBuilder()).append("setSimLockScreenDone1 bitset = ").append(long2).toString());
        if (2 == j)
            long2 = Long.valueOf(long2.longValue() << 1);
        KeyguardUtils.xlogD("KeyguardSimPinPukView", (new StringBuilder()).append("setSimLockScreenDone2 bitset = ").append(long2).toString());
        Long long3 = Long.valueOf(long1.longValue() + long2.longValue());
        android.provider.Settings.System.putLong(mContext.getContentResolver(), "sim_lock_state_setting", long3.longValue());
    }

    private void updatePinEnterScreen()
    {
        switch (mUnlockEnterState)
        {
        default:
            break;

        case 3: // '\003'
            if (!mNewPinText.equals(mPinText.getText().toString()))
            {
                mUnlockEnterState = 2;
                mSb.delete(0, mSb.length());
                mSb.append(mContext.getText(0x2050097));
                mSb.append(mContext.getText(0x2050013));
                mSecurityMessageDisplay.setMessage(mSb.toString(), true);
            } else
            {
                mUnlockEnterState = 4;
                mSecurityMessageDisplay.setMessage("", true);
            }
            break;

        case 2: // '\002'
            mNewPinText = mPinText.getText().toString();
            if (validatePin(mNewPinText, false))
            {
                mUnlockEnterState = 3;
                mSb.delete(0, mSb.length());
                mSb.append(mContext.getText(0x2050014));
                mSecurityMessageDisplay.setMessage(mSb.toString(), true);
            } else
            {
                mSecurityMessageDisplay.setMessage(0x2050096, true);
            }
            break;

        case 1: // '\001'
            mPukText = mPinText.getText().toString();
            if (validatePin(mPukText, true))
            {
                mUnlockEnterState = 2;
                mSb.delete(0, mSb.length());
                mSb.append(mContext.getText(0x2050013));
                mSecurityMessageDisplay.setMessage(mSb.toString(), true);
            } else
            {
                mSecurityMessageDisplay.setMessage(0x2050015, true);
            }
            break;
        }
        mPinText.setText("");
        mCallback.userActivity(0L);
    }

    private boolean validatePin(String s, boolean flag)
    {
        byte byte0;
        if (flag)
            byte0 = 8;
        else
            byte0 = 4;
        return s != null && s.length() >= byte0 && s.length() <= 8;
    }

    protected int getPasswordTextViewId()
    {
        return 0x2100037;
    }

    public void hideBouncer(int i)
    {
        mSecurityMessageDisplay.setMessage(mSb.toString(), true);
        hideBouncer(i);
    }

    public void onAttachedToWindow()
    {
        mUpdateMonitor.registerCallback(mInfoCallback);
    }

    public void onDetachedFromWindow()
    {
        onDetachedFromWindow();
        removeCallbacks(mDismissSimPinPukRunnable);
        mUpdateMonitor.removeCallback(mInfoCallback);
    }

    protected void onFinishInflate()
    {
        onFinishInflate();
        View view = findViewById(0x2100044);
        if (view != null)
            view.setOnClickListener(new android.view.View.OnClickListener() {

                final KeyguardSimPinPukView this$0;

                public void onClick(View view2)
                {
                    doHapticKeyClick();
                    verifyPasswordAndUnlock();
                }

            
            {
                this$0 = KeyguardSimPinPukView.this;
                Object();
            }
            }
);
        View view1 = findViewById(0x2100038);
        if (view1 != null)
        {
            view1.setVisibility(0);
            view1.setOnClickListener(new android.view.View.OnClickListener() {

                final KeyguardSimPinPukView this$0;

                public void onClick(View view2)
                {
                    CharSequence charsequence = mPasswordEntry.getText();
                    if (charsequence.length() > 0)
                        mPasswordEntry.setText(charsequence.subSequence(0, -1 + charsequence.length()));
                    doHapticKeyClick();
                }

            
            {
                this$0 = KeyguardSimPinPukView.this;
                Object();
            }
            }
);
            view1.setOnLongClickListener(new android.view.View.OnLongClickListener() {

                final KeyguardSimPinPukView this$0;

                public boolean onLongClick(View view2)
                {
                    mPasswordEntry.setText("");
                    doHapticKeyClick();
                    return true;
                }

            
            {
                this$0 = KeyguardSimPinPukView.this;
                Object();
            }
            }
);
        }
        mPasswordEntry.setKeyListener(DigitsKeyListener.getInstance());
        mPasswordEntry.setInputType(18);
        mPasswordEntry.requestFocus();
        Button button = (Button)findViewById(0x2100042);
        if (button != null)
            button.setOnClickListener(new android.view.View.OnClickListener() );
        button.setText(0x2050094);
        mPinText = (TextView)findViewById(0x2100037);
        mSIMCardName = (TextView)findViewById(0x2100033);
        mSIMCardNamePadding = mContext.getResources().getDimensionPixelSize(0x20d001b);
        mSecurityMessageDisplay.setTimeout(0);
    }

    public void onPause()
    {
    }

    public void onResume(int i)
    {
        if (mSimUnlockProgressDialog != null)
        {
            mSimUnlockProgressDialog.dismiss();
            mSimUnlockProgressDialog = null;
        }
        InputMethodManager inputmethodmanager = (InputMethodManager)mContext.getSystemService("input_method");
        if (inputmethodmanager.isActive())
        {
            Log.i("KeyguardSimPinPukView", "IME is showing, we should hide it");
            inputmethodmanager.hideSoftInputFromWindow(getWindowToken(), 2);
        }
    }

    public void resetState()
    {
        mPasswordEntry.setEnabled(true);
    }

    public void sendVerifyResult(int i, boolean flag)
    {
        KeyguardUtils.xlogD("KeyguardSimPinPukView", (new StringBuilder()).append("sendVerifyResult verifyType = ").append(i).append(" bRet = ").append(flag).toString());
        Intent intent = (new Intent("android.intent.action.CELLCONNSERVICE")).putExtra("start_type", "response");
        if (intent == null)
        {
            KeyguardUtils.xlogE("KeyguardSimPinPukView", "sendVerifyResult new retIntent failed");
            return;
        } else
        {
            intent.putExtra("verfiy_type", i);
            intent.putExtra("verfiy_result", flag);
            mContext.startService(intent);
            return;
        }
    }

    public void setSimId(int i)
    {
        Log.i("KeyguardSimPinPukView", (new StringBuilder()).append("setSimId=").append(i).toString());
        mSimId = i;
        updateSimState();
        if (KeyguardUtils.isGemini())
        {
            if (mSimCardDialog != null)
            {
                if (mSimCardDialog.isShowing())
                    mSimCardDialog.dismiss();
                mSimCardDialog = null;
            }
            if (SystemProperties.get("gsm.siminfo.ready", "false").equals("true"))
            {
                KeyguardUtils.xlogD("KeyguardSimPinPukView", "siminfo already update, we should read value from the siminfoxxxx");
                dealwithSIMInfoChanged(mSimId);
            }
        }
    }

    public void showUsabilityHint()
    {
    }

    public void updateEmergencyCallButtonState(Button button)
    {
        int i = TelephonyManager.getDefault().getCallState();
        TelephonyManager telephonymanager = (TelephonyManager)getContext().getSystemService("phone");
        boolean flag;
        if (telephonymanager != null && telephonymanager.isVoiceCapable())
            flag = true;
        else
            flag = false;
        if (flag)
        {
            int j;
            if (i == 2)
            {
                j = 0x10402ec;
                button.setCompoundDrawablesWithIntrinsicBounds(0x20200ad, 0, 0, 0);
            } else
            {
                j = 0x10402eb;
                button.setCompoundDrawablesWithIntrinsicBounds(0x20200ad, 0, 0, 0);
            }
            button.setText(j);
            return;
        } else
        {
            button.setVisibility(8);
            return;
        }
    }

    public void updateSimState()
    {
        KeyguardUtils.xlogD("KeyguardSimPinPukView", (new StringBuilder()).append("updateSimSate, simId=").append(mSimId).append(", mSimFirstBoot=").append(mSimFirstBoot[mSimId]).toString());
        if (KeyguardUtils.isGemini())
            getSIMCardName(mSimId);
        mSb.delete(0, mSb.length());
        com.android.internal.telephony.IccCardConstants.State state = mUpdateMonitor.getSimState(mSimId);
        if (com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED == state)
        {
            mSb.append(mContext.getText(0x2050011));
            mSb.append((new StringBuilder()).append(" ").append(getRetryPuk(mSimId)).toString());
            mUnlockEnterState = 1;
        } else
        if (com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED == state)
        {
            mSb.append(mContext.getText(0x10402dc));
            mSb.append((new StringBuilder()).append(" ").append(getRetryPin(mSimId)).toString());
            mUnlockEnterState = 0;
        } else
        if (com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED == state)
        {
            int i = mUpdateMonitor.getSimMeCategory(mSimId);
            mSb.append(mContext.getText(0x205007d));
            mSb.append((new StringBuilder()).append(strLockName[i]).append(getRetryMe(mSimId)).toString());
            mUnlockEnterState = 5;
        }
        mPinText.setText("");
        mSecurityMessageDisplay.setMessage(mSb.toString(), true);
    }

    protected void verifyPasswordAndUnlock()
    {
        if (validatePin(mPasswordEntry.getText().toString(), false) || mUpdateMonitor.getSimState(mSimId) != com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED && mUpdateMonitor.getSimState(mSimId) != com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED)
        {
            dealWithPinOrPukUnlock();
            return;
        }
        if (mUpdateMonitor.getSimState(mSimId) == com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED)
            mSecurityMessageDisplay.setMessage(0x1040531, true);
        else
            mSecurityMessageDisplay.setMessage(0x2050096, true);
        mPasswordEntry.setText("");
        mCallback.userActivity(0L);
    }





/*
    static int access$1202(KeyguardSimPinPukView keyguardsimpinpukview, int i)
    {
        keyguardsimpinpukview.mUnlockEnterState = i;
        return i;
    }

*/













/*
    static boolean access$2302(KeyguardSimPinPukView keyguardsimpinpukview, boolean flag)
    {
        keyguardsimpinpukview.mSimCheckInProgress = flag;
        return flag;
    }

*/




















    // Unreferenced inner class com/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$Toast$TN$1

/* anonymous class */
    class Toast.TN._cls1
        implements Runnable
    {

        final Toast.TN this$1;

        public void run()
        {
            handleShow();
        }

            
            {
                this$1 = Toast.TN.this;
                Object();
            }
    }


    // Unreferenced inner class com/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$Toast$TN$2

/* anonymous class */
    class Toast.TN._cls2
        implements Runnable
    {

        final Toast.TN this$1;

        public void run()
        {
            handleHide();
        }

            
            {
                this$1 = Toast.TN.this;
                Object();
            }
    }

}
