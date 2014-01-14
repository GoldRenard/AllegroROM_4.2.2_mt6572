// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl;

import android.app.*;
import android.content.*;
import android.content.pm.UserInfo;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.graphics.drawable.Drawable;
import android.media.AudioManager;
import android.net.ConnectivityManager;
import android.os.*;
import android.service.dreams.IDreamManager;
import android.telephony.*;
import android.util.Log;
import android.util.TypedValue;
import android.view.*;
import android.widget.*;
import com.android.internal.app.AlertController;
import com.android.internal.policy.impl.keyguard.KeyguardUpdateMonitor;
import com.android.internal.telephony.ITelephonyRegistry;
import com.android.internal.telephony.PhoneConstants;
import java.util.*;

// Referenced classes of package com.android.internal.policy.impl:
//            EnableAccessibilityController

class GlobalActions
    implements android.content.DialogInterface.OnDismissListener, android.content.DialogInterface.OnClickListener
{
    private static interface Action
    {

        public abstract View create(Context context, View view, ViewGroup viewgroup, LayoutInflater layoutinflater);

        public abstract boolean isEnabled();

        public abstract boolean onLongPress();

        public abstract void onPress();

        public abstract boolean showBeforeProvisioning();

        public abstract boolean showDuringKeyguard();
    }

    private static final class GlobalActionsDialog extends Dialog
        implements DialogInterface
    {

        private final AlertController mAlert;
        private boolean mCancelOnUp;
        private final Context mContext;
        private EnableAccessibilityController mEnableAccessibilityController;
        private boolean mIntercepted;
        private final int mWindowTouchSlop;

        private static int getDialogTheme(Context context)
        {
            TypedValue typedvalue = new TypedValue();
            context.getTheme().resolveAttribute(0x1010309, typedvalue, true);
            return typedvalue.resourceId;
        }

        public boolean dispatchTouchEvent(MotionEvent motionevent)
        {
            if (mEnableAccessibilityController == null) goto _L2; else goto _L1
_L1:
            int i;
            i = motionevent.getActionMasked();
            if (i == 0)
            {
                View view = getWindow().getDecorView();
                int j = (int)motionevent.getX();
                int k = (int)motionevent.getY();
                if (j < -mWindowTouchSlop || k < -mWindowTouchSlop || j >= view.getWidth() + mWindowTouchSlop || k >= view.getHeight() + mWindowTouchSlop)
                    mCancelOnUp = true;
            }
            if (mIntercepted) goto _L4; else goto _L3
_L3:
            mIntercepted = mEnableAccessibilityController.onInterceptTouchEvent(motionevent);
            if (mIntercepted)
            {
                long l = SystemClock.uptimeMillis();
                motionevent = MotionEvent.obtain(l, l, 3, 0.0F, 0.0F, 0);
                motionevent.setSource(4098);
                mCancelOnUp = true;
            }
            if (i == 1)
            {
                if (mCancelOnUp)
                    cancel();
                mCancelOnUp = false;
                mIntercepted = false;
            }
_L2:
            boolean flag = super.dispatchTouchEvent(motionevent);
_L6:
            return flag;
_L4:
            boolean flag1 = mEnableAccessibilityController.onTouchEvent(motionevent);
            flag = flag1;
            if (i != 1) goto _L6; else goto _L5
_L5:
            if (mCancelOnUp)
                cancel();
            mCancelOnUp = false;
            mIntercepted = false;
            return flag;
            Exception exception;
            exception;
            if (i == 1)
            {
                if (mCancelOnUp)
                    cancel();
                mCancelOnUp = false;
                mIntercepted = false;
            }
            throw exception;
        }

        public ListView getListView()
        {
            return mAlert.getListView();
        }

        protected void onCreate(Bundle bundle)
        {
            super.onCreate(bundle);
            mAlert.installContent();
        }

        public boolean onKeyDown(int i, KeyEvent keyevent)
        {
            if (mAlert.onKeyDown(i, keyevent))
                return true;
            else
                return super.onKeyDown(i, keyevent);
        }

        public boolean onKeyUp(int i, KeyEvent keyevent)
        {
            if (mAlert.onKeyUp(i, keyevent))
                return true;
            else
                return super.onKeyUp(i, keyevent);
        }

        protected void onStart()
        {
            if (EnableAccessibilityController.canEnableAccessibilityViaGesture(mContext))
            {
                mEnableAccessibilityController = new EnableAccessibilityController(mContext);
                super.setCanceledOnTouchOutside(false);
            } else
            {
                mEnableAccessibilityController = null;
                super.setCanceledOnTouchOutside(true);
            }
            super.onStart();
        }

        protected void onStop()
        {
            if (mEnableAccessibilityController != null)
                mEnableAccessibilityController.onDestroy();
            super.onStop();
        }

        public GlobalActionsDialog(Context context, com.android.internal.app.AlertController.AlertParams alertparams)
        {
            super(context, getDialogTheme(context));
            mContext = context;
            mAlert = new AlertController(mContext, this, getWindow());
            mWindowTouchSlop = ViewConfiguration.get(context).getScaledWindowTouchSlop();
            alertparams.apply(mAlert);
        }
    }

    private class MyAdapter extends BaseAdapter
    {

        final GlobalActions this$0;

        public boolean areAllItemsEnabled()
        {
            return false;
        }

        public int getCount()
        {
            int i = 0;
            for (int j = 0; j < mItems.size(); j++)
            {
                Action action = (Action)mItems.get(j);
                if ((!takeScreenshot() || action.showDuringKeyguard()) && (mDeviceProvisioned || action.showBeforeProvisioning()))
                    i++;
            }

            return i;
        }

        public Action getItem(int i)
        {
            int j = 0;
            for (int k = 0; k < mItems.size(); k++)
            {
                Action action = (Action)mItems.get(k);
                if (takeScreenshot() && !action.showDuringKeyguard() || !mDeviceProvisioned && !action.showBeforeProvisioning())
                    continue;
                if (j == i)
                    return action;
                j++;
            }

            throw new IllegalArgumentException((new StringBuilder()).append("position ").append(i).append(" out of range of showable actions").append(", filtered count=").append(getCount()).append(", keyguardshowing=").append(takeScreenshot()).append(", provisioned=").append(mDeviceProvisioned).toString());
        }

        public volatile Object getItem(int i)
        {
            return getItem(i);
        }

        public long getItemId(int i)
        {
            return (long)i;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            return getItem(i).create(mContext, view, viewgroup, LayoutInflater.from(mContext));
        }

        public boolean isEnabled(int i)
        {
            return getItem(i).isEnabled();
        }

        private MyAdapter()
        {
            this$0 = GlobalActions.this;
            super();
        }

    }

    private class SilentModeToggleAction extends ToggleAction
    {

        final GlobalActions this$0;

        void onToggle(boolean flag)
        {
            if (flag)
            {
                mAudioManager.setRingerMode(0);
                return;
            } else
            {
                mAudioManager.setRingerMode(2);
                return;
            }
        }

        public boolean showBeforeProvisioning()
        {
            return false;
        }

        public boolean showDuringKeyguard()
        {
            return true;
        }

        public SilentModeToggleAction()
        {
            this$0 = GlobalActions.this;
            super(0x10802a3, 0x10802a2, 0x10400ea, 0x10400eb, 0x10400ec);
        }
    }

    private static class SilentModeTriStateAction
        implements Action, android.view.View.OnClickListener
    {

        private final int ITEM_IDS[] = {
            0x1020286, 0x1020287, 0x1020288
        };
        private final AudioManager mAudioManager;
        private final Context mContext;
        private final Handler mHandler;

        private int indexToRingerMode(int i)
        {
            return i;
        }

        private int ringerModeToIndex(int i)
        {
            return i;
        }

        public View create(Context context, View view, ViewGroup viewgroup, LayoutInflater layoutinflater)
        {
            View view1 = layoutinflater.inflate(0x1090045, viewgroup, false);
            int i = ringerModeToIndex(mAudioManager.getRingerMode());
            for (int j = 0; j < 3; j++)
            {
                View view2 = view1.findViewById(ITEM_IDS[j]);
                boolean flag;
                if (i == j)
                    flag = true;
                else
                    flag = false;
                view2.setSelected(flag);
                view2.setTag(Integer.valueOf(j));
                view2.setOnClickListener(this);
            }

            return view1;
        }

        public boolean isEnabled()
        {
            return true;
        }

        public void onClick(View view)
        {
            if (!(view.getTag() instanceof Integer))
            {
                return;
            } else
            {
                int i = ((Integer)view.getTag()).intValue();
                mAudioManager.setRingerMode(indexToRingerMode(i));
                mHandler.sendEmptyMessageDelayed(0, 300L);
                return;
            }
        }

        public boolean onLongPress()
        {
            return false;
        }

        public void onPress()
        {
        }

        public boolean showBeforeProvisioning()
        {
            return false;
        }

        public boolean showDuringKeyguard()
        {
            return true;
        }

        void willCreate()
        {
        }

        SilentModeTriStateAction(Context context, AudioManager audiomanager, Handler handler)
        {
            mAudioManager = audiomanager;
            mHandler = handler;
            mContext = context;
        }
    }

    private static abstract class SinglePressAction
        implements Action
    {

        private final Drawable mIcon;
        private final int mIconResId;
        private final CharSequence mMessage;
        private final int mMessageResId;

        public View create(Context context, View view, ViewGroup viewgroup, LayoutInflater layoutinflater)
        {
            View view1 = layoutinflater.inflate(0x1090044, viewgroup, false);
            ImageView imageview = (ImageView)view1.findViewById(0x1020006);
            TextView textview = (TextView)view1.findViewById(0x102000b);
            view1.findViewById(0x1020285).setVisibility(8);
            if (mIcon != null)
            {
                imageview.setImageDrawable(mIcon);
                imageview.setScaleType(android.widget.ImageView.ScaleType.CENTER_CROP);
            } else
            if (mIconResId != 0)
                imageview.setImageDrawable(context.getResources().getDrawable(mIconResId));
            if (mMessage != null)
            {
                textview.setText(mMessage);
                return view1;
            } else
            {
                textview.setText(mMessageResId);
                return view1;
            }
        }

        public boolean isEnabled()
        {
            return true;
        }

        public boolean onLongPress()
        {
            return false;
        }

        public abstract void onPress();

        protected SinglePressAction(int i, int j)
        {
            mIconResId = i;
            mMessageResId = j;
            mMessage = null;
            mIcon = null;
        }

        protected SinglePressAction(int i, Drawable drawable, CharSequence charsequence)
        {
            mIconResId = i;
            mMessageResId = 0;
            mMessage = charsequence;
            mIcon = drawable;
        }

        protected SinglePressAction(int i, CharSequence charsequence)
        {
            mIconResId = i;
            mMessageResId = 0;
            mMessage = charsequence;
            mIcon = null;
        }
    }

    private static abstract class ToggleAction
        implements Action
    {

        protected int mDisabledIconResid;
        protected int mDisabledStatusMessageResId;
        protected int mEnabledIconResId;
        protected int mEnabledStatusMessageResId;
        protected int mMessageResId;
        protected State mState;

        protected void changeStateFromPress(boolean flag)
        {
            State state;
            if (flag)
                state = State.On;
            else
                state = State.Off;
            mState = state;
        }

        public View create(Context context, View view, ViewGroup viewgroup, LayoutInflater layoutinflater)
        {
            willCreate();
            View view1 = layoutinflater.inflate(0x1090044, viewgroup, false);
            ImageView imageview = (ImageView)view1.findViewById(0x1020006);
            TextView textview = (TextView)view1.findViewById(0x102000b);
            TextView textview1 = (TextView)view1.findViewById(0x1020285);
            boolean flag = isEnabled();
            if (textview != null)
            {
                textview.setText(mMessageResId);
                textview.setEnabled(flag);
            }
            boolean flag1;
            if (mState != State.On && mState != State.TurningOn)
                flag1 = false;
            else
                flag1 = true;
            if (imageview != null)
            {
                Resources resources = context.getResources();
                int j;
                if (flag1)
                    j = mEnabledIconResId;
                else
                    j = mDisabledIconResid;
                imageview.setImageDrawable(resources.getDrawable(j));
                imageview.setEnabled(flag);
            }
            if (textview1 != null)
            {
                int i;
                if (flag1)
                    i = mEnabledStatusMessageResId;
                else
                    i = mDisabledStatusMessageResId;
                textview1.setText(i);
                textview1.setVisibility(0);
                textview1.setEnabled(flag);
            }
            view1.setEnabled(flag);
            return view1;
        }

        public boolean isEnabled()
        {
            return !mState.inTransition();
        }

        public boolean onLongPress()
        {
            return false;
        }

        public final void onPress()
        {
            if (mState.inTransition())
            {
                Log.w("GlobalActions", "shouldn't be able to toggle when in transition");
                return;
            }
            boolean flag;
            if (mState != State.On)
                flag = true;
            else
                flag = false;
            onToggle(flag);
            changeStateFromPress(flag);
        }

        abstract void onToggle(boolean flag);

        public void updateState(State state)
        {
            mState = state;
        }

        void willCreate()
        {
        }

        public ToggleAction(int i, int j, int k, int l, int i1)
        {
            mState = State.Off;
            mEnabledIconResId = i;
            mDisabledIconResid = j;
            mMessageResId = k;
            mEnabledStatusMessageResId = l;
            mDisabledStatusMessageResId = i1;
        }
    }

    static final class ToggleAction.State extends Enum
    {

        private static final ToggleAction.State $VALUES[];
        public static final ToggleAction.State Off;
        public static final ToggleAction.State On;
        public static final ToggleAction.State TurningOff;
        public static final ToggleAction.State TurningOn;
        private final boolean inTransition;

        public static ToggleAction.State valueOf(String s)
        {
            return (ToggleAction.State)Enum.valueOf(com/android/internal/policy/impl/GlobalActions$ToggleAction$State, s);
        }

        public static ToggleAction.State[] values()
        {
            return (ToggleAction.State[])$VALUES.clone();
        }

        public boolean inTransition()
        {
            return inTransition;
        }

        static 
        {
            Off = new ToggleAction.State("Off", 0, false);
            TurningOn = new ToggleAction.State("TurningOn", 1, true);
            TurningOff = new ToggleAction.State("TurningOff", 2, true);
            On = new ToggleAction.State("On", 3, false);
            ToggleAction.State astate[] = new ToggleAction.State[4];
            astate[0] = Off;
            astate[1] = TurningOn;
            astate[2] = TurningOff;
            astate[3] = On;
            $VALUES = astate;
        }

        private ToggleAction.State(String s, int i, boolean flag)
        {
            super(s, i);
            inTransition = flag;
        }
    }


    private static final int DIALOG_DISMISS_DELAY = 300;
    private static final int MESSAGE_DISMISS = 0;
    private static final int MESSAGE_REFRESH = 1;
    private static final int MESSAGE_SHOW = 2;
    private static final boolean SHOW_SILENT_TOGGLE = true;
    private static final String TAG = "GlobalActions";
    private static boolean mIsVisable = false;
    private MyAdapter mAdapter;
    private ContentObserver mAirplaneModeObserver;
    private ToggleAction mAirplaneModeOn;
    private ToggleAction.State mAirplaneState;
    private final AudioManager mAudioManager;
    private BroadcastReceiver mBroadcastReceiver;
    private final Context mContext;
    private boolean mDeviceProvisioned;
    private GlobalActionsDialog mDialog;
    private final IDreamManager mDreamManager;
    private Handler mHandler;
    private boolean mHasTelephony;
    private boolean mHasVibrator;
    private boolean mIsWaitingForEcmExit;
    private ArrayList mItems;
    private boolean mKeyguardShowing;
    PhoneStateListener mPhoneStateListener;
    private BroadcastReceiver mRingerModeReceiver;
    private boolean mRingerModeReceiverRegistered;
    ServiceConnection mScreenshotConnection;
    final Object mScreenshotLock;
    final Runnable mScreenshotTimeout;
    private Action mSilentModeAction;
    private final android.view.WindowManagerPolicy.WindowManagerFuncs mWindowManagerFuncs;

    public GlobalActions(Context context, android.view.WindowManagerPolicy.WindowManagerFuncs windowmanagerfuncs)
    {
        mKeyguardShowing = false;
        mDeviceProvisioned = false;
        mAirplaneState = ToggleAction.State.Off;
        mIsWaitingForEcmExit = false;
        mScreenshotLock = new Object();
        mScreenshotConnection = null;
        mScreenshotTimeout = new Runnable() {

            final GlobalActions this$0;

            public void run()
            {
                synchronized (mScreenshotLock)
                {
                    if (mScreenshotConnection != null)
                    {
                        mContext.unbindService(mScreenshotConnection);
                        mScreenshotConnection = null;
                    }
                }
                return;
                exception;
                obj;
                JVM INSTR monitorexit ;
                throw exception;
            }

            
            {
                this$0 = GlobalActions.this;
                super();
            }
        }
;
        mBroadcastReceiver = new BroadcastReceiver() {

            final GlobalActions this$0;

            public void onReceive(Context context1, Intent intent)
            {
                String s = intent.getAction();
                if (!"android.intent.action.CLOSE_SYSTEM_DIALOGS".equals(s) && !"android.intent.action.SCREEN_OFF".equals(s))
                {
                    if ("android.intent.action.EMERGENCY_CALLBACK_MODE_CHANGED".equals(s) && !intent.getBooleanExtra("PHONE_IN_ECM_STATE", false) && mIsWaitingForEcmExit)
                    {
                        mIsWaitingForEcmExit = false;
                        changeAirplaneModeSystemSetting(true);
                        return;
                    }
                } else
                if (!"globalactions".equals(intent.getStringExtra("reason")))
                    mHandler.sendEmptyMessage(0);
            }

            
            {
                this$0 = GlobalActions.this;
                super();
            }
        }
;
        mPhoneStateListener = new PhoneStateListener() {

            final GlobalActions this$0;

            public void onServiceStateChanged(ServiceState servicestate)
            {
                if (!mHasTelephony)
                    return;
                int i = android.provider.Settings.Global.getInt(mContext.getContentResolver(), "airplane_mode_on", 0);
                boolean flag2 = false;
                if (i != 0)
                    flag2 = true;
                Log.v("GlobalActions", (new StringBuilder()).append("Phone State = ").append(servicestate.getState()).append(" gemini = ").append(true).append(" inAirplaneMode ").append(flag2).toString());
                GlobalActions globalactions = GlobalActions.this;
                ToggleAction.State state;
                if (flag2)
                    state = ToggleAction.State.On;
                else
                    state = ToggleAction.State.Off;
                globalactions.mAirplaneState = state;
                mAirplaneModeOn.updateState(mAirplaneState);
                mAdapter.notifyDataSetChanged();
            }

            
            {
                this$0 = GlobalActions.this;
                super();
            }
        }
;
        mRingerModeReceiver = new BroadcastReceiver() {

            final GlobalActions this$0;

            public void onReceive(Context context1, Intent intent)
            {
                if (intent.getAction().equals("android.media.RINGER_MODE_CHANGED"))
                    mHandler.sendEmptyMessage(1);
            }

            
            {
                this$0 = GlobalActions.this;
                super();
            }
        }
;
        mAirplaneModeObserver = new ContentObserver(new Handler()) {

            final GlobalActions this$0;

            public void onChange(boolean flag2)
            {
                onAirplaneModeChanged();
            }

            
            {
                this$0 = GlobalActions.this;
                super(handler);
            }
        }
;
        mRingerModeReceiverRegistered = false;
        mHandler = new Handler() {

            final GlobalActions this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 2: // '\002'
                    handleShow();
                    return;

                case 1: // '\001'
                    refreshSilentMode();
                    mAdapter.notifyDataSetChanged();
                    return;

                case 0: // '\0'
                    if (mDialog != null)
                    {
                        mDialog.dismiss();
                        return;
                    }
                    break;
                }
            }

            
            {
                this$0 = GlobalActions.this;
                super();
            }
        }
;
        mContext = context;
        mWindowManagerFuncs = windowmanagerfuncs;
        mAudioManager = (AudioManager)mContext.getSystemService("audio");
        mDreamManager = android.service.dreams.IDreamManager.Stub.asInterface(ServiceManager.getService("dreams"));
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.CLOSE_SYSTEM_DIALOGS");
        intentfilter.addAction("android.intent.action.SCREEN_OFF");
        intentfilter.addAction("android.intent.action.EMERGENCY_CALLBACK_MODE_CHANGED");
        context.registerReceiver(mBroadcastReceiver, intentfilter);
        (TelephonyManager)context.getSystemService("phone");
        boolean flag;
        boolean flag1;
        Boolean boolean1;
        ITelephonyRegistry itelephonyregistry;
        ITelephonyRegistry itelephonyregistry1;
        ITelephonyRegistry itelephonyregistry2;
        ITelephonyRegistry itelephonyregistry3;
        if (com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone")) != null)
            flag1 = true;
        else
            flag1 = false;
        boolean1 = Boolean.valueOf(flag1);
        itelephonyregistry = com.android.internal.telephony.ITelephonyRegistry.Stub.asInterface(ServiceManager.getService("telephony.registry"));
        if (itelephonyregistry == null) goto _L2; else goto _L1
_L1:
        itelephonyregistry.listen("GlobalActions", mPhoneStateListener.getCallback(), 1, boolean1.booleanValue());
_L11:
        itelephonyregistry1 = com.android.internal.telephony.ITelephonyRegistry.Stub.asInterface(ServiceManager.getService("telephony.registry2"));
        if (itelephonyregistry1 == null) goto _L4; else goto _L3
_L3:
        itelephonyregistry1.listen("GlobalActions", mPhoneStateListener.getCallback(), 1, boolean1.booleanValue());
_L12:
        if (PhoneConstants.GEMINI_SIM_NUM < 3) goto _L6; else goto _L5
_L5:
        itelephonyregistry3 = com.android.internal.telephony.ITelephonyRegistry.Stub.asInterface(ServiceManager.getService("telephony.registry3"));
        if (itelephonyregistry3 == null) goto _L8; else goto _L7
_L7:
        itelephonyregistry3.listen("GlobalActions", mPhoneStateListener.getCallback(), 1, boolean1.booleanValue());
_L6:
        if (PhoneConstants.GEMINI_SIM_NUM < 4) goto _L10; else goto _L9
_L9:
        itelephonyregistry2 = com.android.internal.telephony.ITelephonyRegistry.Stub.asInterface(ServiceManager.getService("telephony.registry4"));
        if (itelephonyregistry2 == null)
            break MISSING_BLOCK_LABEL_526;
        Vibrator vibrator;
        try
        {
            itelephonyregistry2.listen("GlobalActions", mPhoneStateListener.getCallback(), 1, boolean1.booleanValue());
        }
        catch (RemoteException remoteexception)
        {
            Log.e("GlobalActions", "Fail to listen GEMINI state", remoteexception);
        }
_L10:
        mHasTelephony = ((ConnectivityManager)context.getSystemService("connectivity")).isNetworkSupported(0);
        mContext.getContentResolver().registerContentObserver(android.provider.Settings.Global.getUriFor("airplane_mode_on"), true, mAirplaneModeObserver);
        vibrator = (Vibrator)mContext.getSystemService("vibrator");
        if (vibrator != null && vibrator.hasVibrator())
            flag = true;
        else
            flag = false;
        mHasVibrator = flag;
        return;
_L2:
        Log.e("GlobalActions", "The registry is null.");
          goto _L11
_L4:
        Log.e("GlobalActions", "The registry2 is null.");
          goto _L12
_L8:
        Log.e("GlobalActions", "The registry3 is null.");
          goto _L6
        Log.e("GlobalActions", "The registry4 is null.");
          goto _L10
    }

    private void addUsersToMenu(ArrayList arraylist)
    {
        List list = ((UserManager)mContext.getSystemService("user")).getUsers();
        if (list.size() <= 1) goto _L2; else goto _L1
_L1:
        UserInfo userinfo;
        Iterator iterator;
        StringBuilder stringbuilder;
        StringBuilder stringbuilder1;
        UserInfo userinfo2;
        try
        {
            userinfo2 = ActivityManagerNative.getDefault().getCurrentUser();
        }
        catch (RemoteException remoteexception)
        {
            userinfo = null;
            continue; /* Loop/switch isn't completed */
        }
        userinfo = userinfo2;
_L4:
        iterator = list.iterator();
        while (iterator.hasNext()) 
        {
            UserInfo userinfo1 = (UserInfo)iterator.next();
            boolean flag;
            Drawable drawable;
            String s;
            String s1;
            if (userinfo == null)
            {
                if (userinfo1.id == 0)
                    flag = true;
                else
                    flag = false;
            } else
            if (userinfo.id == userinfo1.id)
                flag = true;
            else
                flag = false;
            if (userinfo1.iconPath != null)
                drawable = Drawable.createFromPath(userinfo1.iconPath);
            else
                drawable = null;
            stringbuilder = new StringBuilder();
            if (userinfo1.name != null)
                s = userinfo1.name;
            else
                s = "Primary";
            stringbuilder1 = stringbuilder.append(s);
            if (flag)
                s1 = " \u2714";
            else
                s1 = "";
            arraylist.add(new SinglePressAction(drawable, stringbuilder1.append(s1).toString(), userinfo1) {

                final GlobalActions this$0;
                final UserInfo val$user;

                public void onPress()
                {
                    try
                    {
                        ActivityManagerNative.getDefault().switchUser(user.id);
                        return;
                    }
                    catch (RemoteException remoteexception1)
                    {
                        Log.e("GlobalActions", (new StringBuilder()).append("Couldn't switch user ").append(remoteexception1).toString());
                    }
                }

                public boolean showBeforeProvisioning()
                {
                    return false;
                }

                public boolean showDuringKeyguard()
                {
                    return true;
                }

            
            {
                this$0 = GlobalActions.this;
                user = userinfo;
                super(final_i, drawable, charsequence);
            }
            }
);
        }
_L2:
        return;
        if (true) goto _L4; else goto _L3
_L3:
    }

    private void awakenIfNecessary()
    {
        if (mDreamManager == null)
            break MISSING_BLOCK_LABEL_28;
        if (mDreamManager.isDreaming())
            mDreamManager.awaken();
        return;
        RemoteException remoteexception;
        remoteexception;
    }

    private void changeAirplaneModeSystemSetting(boolean flag)
    {
        ContentResolver contentresolver = mContext.getContentResolver();
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        android.provider.Settings.Global.putInt(contentresolver, "airplane_mode_on", i);
        Intent intent = new Intent("android.intent.action.AIRPLANE_MODE");
        intent.addFlags(0x20000000);
        intent.putExtra("state", flag);
        mContext.sendBroadcastAsUser(intent, UserHandle.ALL);
        Log.v("GlobalActions", (new StringBuilder()).append("Enter the airplane mode ").append(flag).toString());
        if (!mHasTelephony)
        {
            ToggleAction.State state;
            if (flag)
                state = ToggleAction.State.On;
            else
                state = ToggleAction.State.Off;
            mAirplaneState = state;
        }
    }

    private GlobalActionsDialog createDialog()
    {
        if (!mHasVibrator)
            mSilentModeAction = new SilentModeToggleAction();
        else
            mSilentModeAction = new SilentModeTriStateAction(mContext, mAudioManager, mHandler);
        mAirplaneModeOn = new ToggleAction(0x10802da, 0x10802db, 0x10400ed, 0x10400ee, 0x10400ef) {

            final GlobalActions this$0;

            protected void changeStateFromPress(boolean flag)
            {
                if (mHasTelephony && !Boolean.parseBoolean(SystemProperties.get("ril.cdma.inecmmode")))
                {
                    ToggleAction.State state;
                    if (flag)
                        state = ToggleAction.State.TurningOn;
                    else
                        state = ToggleAction.State.TurningOff;
                    super.mState = state;
                    mAirplaneState = super.mState;
                    return;
                } else
                {
                    return;
                }
            }

            public boolean isEnabled()
            {
                if (KeyguardUpdateMonitor.sDualSimSetting == 0)
                {
                    Log.e("GlobalActions", "if user unselect the dual sim mode setting on phone starting, the airplane mode can not be set.");
                    return false;
                } else
                {
                    return super.isEnabled();
                }
            }

            void onToggle(boolean flag)
            {
                if (mHasTelephony && Boolean.parseBoolean(SystemProperties.get("ril.cdma.inecmmode")))
                {
                    mIsWaitingForEcmExit = true;
                    Intent intent = new Intent("android.intent.action.ACTION_SHOW_NOTICE_ECM_BLOCK_OTHERS", null);
                    intent.addFlags(0x10000000);
                    mContext.startActivity(intent);
                    return;
                } else
                {
                    changeAirplaneModeSystemSetting(flag);
                    return;
                }
            }

            public boolean showBeforeProvisioning()
            {
                return false;
            }

            public boolean showDuringKeyguard()
            {
                return true;
            }

            
            {
                this$0 = GlobalActions.this;
                super(i, j, k, l, i1);
            }
        }
;
        onAirplaneModeChanged();
        mItems = new ArrayList();
        mItems.add(new SinglePressAction(0x1080030, 0x10400e6) {

            final GlobalActions this$0;

            public boolean onLongPress()
            {
                mWindowManagerFuncs.rebootSafeMode(true);
                return true;
            }

            public void onPress()
            {
                mWindowManagerFuncs.shutdown(true);
            }

            public boolean showBeforeProvisioning()
            {
                return true;
            }

            public boolean showDuringKeyguard()
            {
                return true;
            }

            
            {
                this$0 = GlobalActions.this;
                super(i, j);
            }
        }
);
        mItems.add(new android.view.View.OnClickListener(0x10802dc, 0x1040554) {

            int mSel;
            final GlobalActions this$0;

            public void onPress()
            {
                mSel = -1;
                AlertDialog alertdialog = (new android.app.AlertDialog.Builder(mContext)).setTitle(0x1040554).setIcon(0x10802dc).setSingleChoiceItems(0x107003a, 0, null).setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

                    final _cls12 this$1;

                    public void onClick(DialogInterface dialoginterface, int i)
                    {
                        mSel = ((AlertDialog)dialoginterface).getListView().getCheckedItemPosition();
                    }

            
            {
                this$1 = _cls12.this;
                super();
            }
                }
).setNegativeButton(0x1040000, null).create();
                alertdialog.setOnDismissListener(new android.content.DialogInterface.OnDismissListener() {

                    final _cls12 this$1;

                    public void onDismiss(DialogInterface dialoginterface)
                    {
                        String s;
                        if (mSel < 0)
                            break MISSING_BLOCK_LABEL_77;
                        s = mContext.getResources().getStringArray(0x1070039)[mSel];
                        if (!s.equals("hotboot"))
                            break MISSING_BLOCK_LABEL_78;
                        Runtime.getRuntime().exec(new String[] {
                            "pkill", "-TERM", "-f", "system_server"
                        });
                        return;
                        ((PowerManager)mContext.getSystemService("power")).reboot(s);
                        return;
                        Exception exception;
                        exception;
                    }

            
            {
                this$1 = _cls12.this;
                super();
            }
                }
);
                alertdialog.getWindow().setType(2009);
                alertdialog.show();
            }

            public boolean showBeforeProvisioning()
            {
                return true;
            }

            public boolean showConditional()
            {
                return true;
            }

            public boolean showDuringKeyguard()
            {
                return true;
            }


            
            {
                this$0 = GlobalActions.this;
                super(i, j);
            }
        }
);
        mItems.add(new SinglePressAction(0x108064b, 0x1040558) {

            final GlobalActions this$0;

            public void onPress()
            {
                takeScreenshot();
            }

            public boolean showBeforeProvisioning()
            {
                return true;
            }

            public boolean showDuringKeyguard()
            {
                return true;
            }

            
            {
                this$0 = GlobalActions.this;
                super(i, j);
            }
        }
);
        mItems.add(mAirplaneModeOn);
        if (android.provider.Settings.Secure.getInt(mContext.getContentResolver(), "bugreport_in_power_menu", 0) != 0)
            mItems.add(new SinglePressAction(0x1080526, 0x10400e7) {

                final GlobalActions this$0;

                public boolean onLongPress()
                {
                    return false;
                }

                public void onPress()
                {
                    android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(mContext);
                    builder.setTitle(0x10400e8);
                    builder.setMessage(0x10400e9);
                    builder.setNegativeButton(0x1040000, null);
                    builder.setPositiveButton(0x10403dc, new android.content.DialogInterface.OnClickListener() {

                        final _cls4 this$1;

                        public void onClick(DialogInterface dialoginterface, int i)
                        {
                            mHandler.postDelayed(new Runnable() {

                                final _cls1 this$2;

                                public void run()
                                {
                                    try
                                    {
                                        ActivityManagerNative.getDefault().requestBugReport();
                                        return;
                                    }
                                    catch (RemoteException remoteexception)
                                    {
                                        return;
                                    }
                                }

            
            {
                this$2 = _cls1.this;
                super();
            }
                            }
, 500L);
                        }

            
            {
                this$1 = _cls4.this;
                super();
            }
                    }
);
                    AlertDialog alertdialog = builder.create();
                    alertdialog.getWindow().setType(2009);
                    alertdialog.show();
                }

                public boolean showBeforeProvisioning()
                {
                    return false;
                }

                public boolean showDuringKeyguard()
                {
                    return true;
                }

            
            {
                this$0 = GlobalActions.this;
                super(i, j);
            }
            }
);
        mItems.add(mSilentModeAction);
        if (SystemProperties.getBoolean("fw.power_user_switcher", false))
            addUsersToMenu(mItems);
        mAdapter = new MyAdapter();
        com.android.internal.app.AlertController.AlertParams alertparams = new com.android.internal.app.AlertController.AlertParams(mContext);
        alertparams.mAdapter = mAdapter;
        alertparams.mOnClickListener = this;
        alertparams.mForceInverseBackground = true;
        GlobalActionsDialog globalactionsdialog = new GlobalActionsDialog(mContext, alertparams);
        globalactionsdialog.setCanceledOnTouchOutside(false);
        globalactionsdialog.getListView().setItemsCanFocus(true);
        globalactionsdialog.getListView().setLongClickable(true);
        globalactionsdialog.getListView().setOnItemLongClickListener(new android.widget.AdapterView.OnItemLongClickListener() {

            final GlobalActions this$0;

            public boolean onItemLongClick(AdapterView adapterview, View view, int i, long l)
            {
                return mAdapter.getItem(i).onLongPress();
            }

            
            {
                this$0 = GlobalActions.this;
                super();
            }
        }
);
        globalactionsdialog.getWindow().setType(2009);
        globalactionsdialog.setOnDismissListener(this);
        return globalactionsdialog;
    }

    private void handleShow()
    {
        awakenIfNecessary();
        mDialog = createDialog();
        prepareDialog();
        android.view.WindowManager.LayoutParams layoutparams = mDialog.getWindow().getAttributes();
        layoutparams.setTitle("GlobalActions");
        mDialog.getWindow().setAttributes(layoutparams);
        mDialog.show();
        mDialog.getWindow().getDecorView().setSystemUiVisibility(0x10000);
    }

    public static boolean isVisable()
    {
        return mIsVisable;
    }

    private void onAirplaneModeChanged()
    {
        int i = 1;
        if (mHasTelephony)
            return;
        if (android.provider.Settings.Global.getInt(mContext.getContentResolver(), "airplane_mode_on", 0) != i)
            i = 0;
        ToggleAction.State state;
        if (i != 0)
            state = ToggleAction.State.On;
        else
            state = ToggleAction.State.Off;
        mAirplaneState = state;
        mAirplaneModeOn.updateState(mAirplaneState);
    }

    private void prepareDialog()
    {
        refreshSilentMode();
        mAirplaneModeOn.updateState(mAirplaneState);
        mAdapter.notifyDataSetChanged();
        mDialog.getWindow().setType(2009);
        Log.d("GlobalActions", "prepareDialog -- registerReceiver mRingerModeReceiver");
        IntentFilter intentfilter = new IntentFilter("android.media.RINGER_MODE_CHANGED");
        mContext.registerReceiver(mRingerModeReceiver, intentfilter);
        mRingerModeReceiverRegistered = true;
    }

    private void refreshSilentMode()
    {
        if (!mHasVibrator)
        {
            boolean flag;
            if (mAudioManager.getRingerMode() != 2)
                flag = true;
            else
                flag = false;
            ToggleAction toggleaction = (ToggleAction)mSilentModeAction;
            ToggleAction.State state;
            if (flag)
                state = ToggleAction.State.On;
            else
                state = ToggleAction.State.Off;
            toggleaction.updateState(state);
        }
    }

    private void takeScreenshot()
    {
label0:
        {
            synchronized (mScreenshotLock)
            {
                if (mScreenshotConnection == null)
                    break label0;
            }
            return;
        }
        ComponentName componentname = new ComponentName("com.android.systemui", "com.android.systemui.screenshot.TakeScreenshotService");
        Intent intent = new Intent();
        intent.setComponent(componentname);
        ServiceConnection serviceconnection = new ServiceConnection() {

            final GlobalActions this$0;

            public void onServiceConnected(ComponentName componentname1, IBinder ibinder)
            {
label0:
                {
                    synchronized (mScreenshotLock)
                    {
                        if (mScreenshotConnection == this)
                            break label0;
                    }
                    return;
                }
                Messenger messenger;
                Message message;
                messenger = new Messenger(ibinder);
                message = Message.obtain(null, 1);
                message.replyTo = new Messenger(mHandler.getLooper(). new Handler(this) {

                    final _cls14 this$1;
                    final ServiceConnection val$myConn;

                    public void handleMessage(Message message)
                    {
                        synchronized (mScreenshotLock)
                        {
                            if (mScreenshotConnection == myConn)
                            {
                                mContext.unbindService(mScreenshotConnection);
                                mScreenshotConnection = null;
                                mHandler.removeCallbacks(mScreenshotTimeout);
                            }
                        }
                        return;
                        exception;
                        obj;
                        JVM INSTR monitorexit ;
                        throw exception;
                    }

            
            {
                this$1 = final__pcls14;
                myConn = serviceconnection;
                super(Looper.this);
            }
                }
);
                message.arg2 = 0;
                message.arg1 = 0;
                try
                {
                    Thread.sleep(1000L);
                }
                catch (InterruptedException interruptedexception) { }
                try
                {
                    messenger.send(message);
                }
                catch (RemoteException remoteexception) { }
                obj1;
                JVM INSTR monitorexit ;
                return;
                exception1;
                obj1;
                JVM INSTR monitorexit ;
                throw exception1;
            }

            public void onServiceDisconnected(ComponentName componentname1)
            {
            }

            
            {
                this$0 = GlobalActions.this;
                super();
            }
        }
;
        if (mContext.bindService(intent, serviceconnection, 1, -2))
        {
            mScreenshotConnection = serviceconnection;
            mHandler.postDelayed(mScreenshotTimeout, 10000L);
        }
        obj;
        JVM INSTR monitorexit ;
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (!(mAdapter.getItem(i) instanceof SilentModeTriStateAction))
            dialoginterface.dismiss();
        mAdapter.getItem(i).onPress();
    }

    public void onDismiss(DialogInterface dialoginterface)
    {
        if (true & mRingerModeReceiverRegistered)
        {
            Log.d("GlobalActions", "onDismiss -- unregisterReceiver mRingerModeReceiver");
            mContext.unregisterReceiver(mRingerModeReceiver);
            mRingerModeReceiverRegistered = false;
        }
        mIsVisable = false;
    }

    public void showDialog(boolean flag, boolean flag1)
    {
        mKeyguardShowing = flag;
        mDeviceProvisioned = flag1;
        if (mDialog != null)
        {
            mDialog.dismiss();
            mDialog = null;
            mHandler.sendEmptyMessage(2);
            return;
        } else
        {
            handleShow();
            return;
        }
    }







/*
    static boolean access$102(GlobalActions globalactions, boolean flag)
    {
        globalactions.mIsWaitingForEcmExit = flag;
        return flag;
    }

*/












/*
    static ToggleAction.State access$402(GlobalActions globalactions, ToggleAction.State state)
    {
        globalactions.mAirplaneState = state;
        return state;
    }

*/





    // Unreferenced inner class com/android/internal/policy/impl/GlobalActions$3

/* anonymous class */
    class _cls3 extends SinglePressAction
    {

        final GlobalActions this$0;

        public void onPress()
        {
            mWindowManagerFuncs.reboot(true);
        }

        public boolean showBeforeProvisioning()
        {
            return true;
        }

        public boolean showDuringKeyguard()
        {
            return true;
        }

            
            {
                this$0 = GlobalActions.this;
                super(i, j);
            }
    }

}
