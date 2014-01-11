// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.app.*;
import android.app.admin.DevicePolicyManager;
import android.appwidget.*;
import android.content.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.os.*;
import android.util.*;
import android.view.*;
import android.view.animation.AnimationUtils;
import android.widget.FrameLayout;
import com.android.internal.widget.LockPatternUtils;
import java.io.*;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import javax.xml.parsers.*;
import org.apache.http.util.EncodingUtils;
import org.xml.sax.*;
import org.xml.sax.helpers.DefaultHandler;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardViewBase, KeyguardSecurityModel, KeyguardViewStateManager, KeyguardWidgetPager, 
//            CameraWidgetFrame, KeyguardTransportControlView, KeyguardUpdateMonitor, KeyguardMultiUserSelectorView, 
//            KeyguardWidgetFrame, KeyguardUtils, KeyguardSecurityViewFlipper, KeyguardSecurityView, 
//            KeyguardSimPinPukView, KeyguardSelectorView, SlidingChallengeLayout, MultiPaneChallengeLayout, 
//            KeyguardSecurityCallback, ChallengeLayout, KeyguardActivityLauncher, KeyguardUpdateMonitorCallback

public class KeyguardHostView extends KeyguardViewBase
{
    public class ContentHandler extends DefaultHandler
    {

        private String lockClassName;
        private String lockPackName;
        final KeyguardHostView this$0;

        public void characters(char ac[], int i, int j)
            throws SAXException
        {
            characters(ac, i, j);
        }

        public void endDocument()
            throws SAXException
        {
            if (DEBUG_LQ_LOCKVIEW)
                Log.d("KeyguardHostView", "ContentHandler endDocument");
        }

        public void endElement(String s, String s1, String s2)
            throws SAXException
        {
            endElement(s, s1, s2);
        }

        public String getLockClassName()
        {
            return lockClassName;
        }

        public String getLockPackName()
        {
            return lockPackName;
        }

        public void startDocument()
            throws SAXException
        {
            startDocument();
        }

        public void startElement(String s, String s1, String s2, Attributes attributes)
            throws SAXException
        {
            startElement(s, s1, s2, attributes);
            if (DEBUG_LQ_LOCKVIEW)
                Log.d("KeyguardHostView", (new StringBuilder()).append("startElement ln:").append(s1).append(" qn:").append(s2).toString());
            if (s1.equalsIgnoreCase("lockviewfavorite"))
            {
                lockPackName = attributes.getValue("packageName");
                lockClassName = attributes.getValue("className");
                if (DEBUG_LQ_LOCKVIEW)
                    Log.d("KeyguardHostView", (new StringBuilder()).append("startElement ln 2: ").append(lockPackName).append(" class:").append(lockClassName).toString());
            }
        }

        public ContentHandler()
        {
            this$0 = KeyguardHostView.this;
            DefaultHandler();
        }
    }

    static interface OnDismissAction
    {

        public abstract boolean onDismiss();
    }

    static class SavedState extends android.view.View.BaseSavedState
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public SavedState createFromParcel(Parcel parcel)
            {
                return new SavedState(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public SavedState[] newArray(int i)
            {
                return new SavedState[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
;
        int appWidgetToShow;
        int transportState;

        public void writeToParcel(Parcel parcel, int i)
        {
            writeToParcel(parcel, i);
            parcel.writeInt(transportState);
            parcel.writeInt(appWidgetToShow);
        }


        private SavedState(Parcel parcel)
        {
            BaseSavedState(parcel);
            appWidgetToShow = 0;
            transportState = parcel.readInt();
            appWidgetToShow = parcel.readInt();
        }


        SavedState(Parcelable parcelable)
        {
            BaseSavedState(parcelable);
            appWidgetToShow = 0;
        }
    }

    static interface TransportCallback
    {

        public abstract void onListenerAttached();

        public abstract void onListenerDetached();

        public abstract void onPlayStateChanged();
    }

    static interface UserSwitcherCallback
    {

        public abstract void hideSecurityView(int i);

        public abstract void showSecurityView();

        public abstract void showUnlockHint();

        public abstract void userActivity();
    }


    static final int APPWIDGET_HOST_ID = 0x4b455947;
    public static boolean DEBUG = false;
    private static final String ENABLE_MENU_KEY_FILE = "/data/local/enable_menu_key";
    private static boolean IS_Tablet = false;
    private static final String LQ_LOCKVIEW_CONFIG_FILE = (new StringBuilder()).append(Environment.getRootDirectory()).append("/yunlan_lockview_config.xml").toString();
    private static final String TAG = "KeyguardHostView";
    private static final String TAG_LOCK_NAME_CONFIG = "lockviewfavorite";
    private boolean DEBUG_LQ_LOCKVIEW;
    private final int MAX_WIDGETS;
    private final KeyguardActivityLauncher mActivityLauncher;
    private KeyguardWidgetPager mAppWidgetContainer;
    private AppWidgetHost mAppWidgetHost;
    private AppWidgetManager mAppWidgetManager;
    private int mAppWidgetToShow;
    private KeyguardSecurityCallback mCallback = new KeyguardSecurityCallback() ;
    private boolean mCameraDisabled;
    private final CameraWidgetFrame.Callbacks mCameraWidgetCallbacks;
    private boolean mCheckAppWidgetConsistencyOnBootCompleted;
    private boolean mCleanupAppWidgetsOnBootCompleted;
    private KeyguardSecurityView mCurrentKeyguardSecurityView;
    private KeyguardSecurityModel.SecurityMode mCurrentSecuritySelection;
    private int mDisabledFeatures;
    protected OnDismissAction mDismissAction;
    private boolean mEnableFallback;
    protected int mFailedAttempts;
    private boolean mIsVerifyUnlockOnly;
    private boolean mKeyaugerLayerVisibility;
    private KeyguardSelectorView mKeyguardSelectorView;
    private String mLQLockClassName;
    public View mLQLockView;
    private String mLQLockViewPKName;
    private boolean mLaunchingCamera;
    private LockPatternUtils mLockPatternUtils;
    private MultiPaneChallengeLayout mMultiPaneChallengeLayout;
    private KeyguardSecurityCallback mNullCallback = new KeyguardSecurityCallback() {

        final KeyguardHostView this$0;

        public void dismiss(boolean flag1)
        {
        }

        public int getFailedAttempts()
        {
            return 0;
        }

        public boolean hasOnDismissAction()
        {
            return false;
        }

        public boolean isVerifyUnlockOnly()
        {
            return false;
        }

        public void reportFailedUnlockAttempt()
        {
        }

        public void reportSuccessfulUnlockAttempt()
        {
        }

        public void setOnDismissAction(OnDismissAction ondismissaction)
        {
        }

        public void showBackupSecurity()
        {
        }

        public void updateClipChildren(boolean flag1)
        {
        }

        public void updateKeyguardLayerVisibility(boolean flag1)
        {
        }

        public void userActivity(long l)
        {
        }

            
            {
                this$0 = KeyguardHostView.this;
                Object();
            }
    }
;
    private android.widget.RemoteViews.OnClickHandler mOnClickHandler = new android.widget.RemoteViews.OnClickHandler() {

        final KeyguardHostView this$0;

        public boolean onClickHandler(final View view, final PendingIntent pendingIntent, Intent intent)
        {
            if (pendingIntent.isActivity())
            {
                setOnDismissAction(intent. new OnDismissAction() {

                    final _cls4 this$1;
                    final Intent val$fillInIntent;
                    final PendingIntent val$pendingIntent;
                    final View val$view;

                    public boolean onDismiss()
                    {
                        try
                        {
                            Context context = view.getContext();
                            ActivityOptions activityoptions = ActivityOptions.makeScaleUpAnimation(view, 0, 0, view.getMeasuredWidth(), view.getMeasuredHeight());
                            context.startIntentSender(pendingIntent.getIntentSender(), fillInIntent, 0x10000000, 0x10000000, 0, activityoptions.toBundle());
                        }
                        catch (android.content.IntentSender.SendIntentException sendintentexception)
                        {
                            Log.e("KeyguardHostView", "Cannot send pending intent: ", sendintentexception);
                            return false;
                        }
                        catch (Exception exception)
                        {
                            Log.e("KeyguardHostView", "Cannot send pending intent due to unknown exception: ", exception);
                            return false;
                        }
                        return false;
                    }

            
            {
                this$1 = final__pcls4;
                view = view1;
                pendingIntent = pendingintent;
                fillInIntent = Intent.this;
                Object();
            }
                }
);
                if (mViewStateManager.isChallengeShowing())
                {
                    mViewStateManager.showBouncer(true);
                    return true;
                } else
                {
                    dismiss();
                    return true;
                }
            } else
            {
                return onClickHandler(view, pendingIntent, intent);
            }
        }

            
            {
                this$0 = KeyguardHostView.this;
                OnClickHandler();
            }
    }
;
    private boolean mSafeModeEnabled;
    private boolean mScreenOn;
    private KeyguardSecurityModel mSecurityModel;
    private KeyguardSecurityViewFlipper mSecurityViewContainer;
    protected boolean mShowSecurityWhenReturn;
    private SlidingChallengeLayout mSlidingChallengeLayout;
    private View mStatusWidget;
    Runnable mSwitchPageRunnable = new Runnable() {

        final KeyguardHostView this$0;

        public void run()
        {
            showAppropriateWidgetPage();
        }

            
            {
                this$0 = KeyguardHostView.this;
                Object();
            }
    }
;
    private Rect mTempRect;
    private KeyguardTransportControlView mTransportControl;
    private KeyguardUpdateMonitorCallback mUpdateMonitorCallbacks = new KeyguardUpdateMonitorCallback() {

        final KeyguardHostView this$0;

        public void onBootCompleted()
        {
            if (mCheckAppWidgetConsistencyOnBootCompleted)
            {
                checkAppWidgetConsistency();
                mSwitchPageRunnable.run();
                mCheckAppWidgetConsistencyOnBootCompleted = false;
            }
            if (mCleanupAppWidgetsOnBootCompleted)
            {
                cleanupAppWidgetIds();
                mCleanupAppWidgetsOnBootCompleted = false;
            }
        }

            
            {
                this$0 = KeyguardHostView.this;
                KeyguardUpdateMonitorCallback();
            }
    }
;
    private int mUserId;
    private boolean mUserSetupCompleted;
    private KeyguardViewStateManager mViewStateManager;
    private KeyguardWidgetPager.Callbacks mWidgetCallbacks = new KeyguardWidgetPager.Callbacks() {

        final KeyguardHostView this$0;

        public void onAddView(View view)
        {
            if (!shouldEnableAddWidget())
                mAppWidgetContainer.setAddWidgetEnabled(false);
        }

        public void onRemoveView(View view, boolean flag1)
        {
            if (flag1)
            {
                int i = ((KeyguardWidgetFrame)view).getContentAppWidgetId();
                if (i != 0 && i != -2)
                    mAppWidgetHost.deleteAppWidgetId(i);
            }
        }

        public void onRemoveViewAnimationCompleted()
        {
            if (shouldEnableAddWidget())
                mAppWidgetContainer.setAddWidgetEnabled(true);
        }

        public void onUserActivityTimeoutChanged()
        {
            KeyguardHostView.this.onUserActivityTimeoutChanged();
        }

        public void userActivity()
        {
            KeyguardHostView.this.userActivity();
        }

            
            {
                this$0 = KeyguardHostView.this;
                Object();
            }
    }
;

    public KeyguardHostView(Context context)
    {
        KeyguardHostView(context, null);
    }

    public KeyguardHostView(Context context, AttributeSet attributeset)
    {
        boolean flag = true;
        KeyguardViewBase(context, attributeset);
        MAX_WIDGETS = 5;
        mCurrentSecuritySelection = KeyguardSecurityModel.SecurityMode.Invalid;
        mCheckAppWidgetConsistencyOnBootCompleted = false;
        mCleanupAppWidgetsOnBootCompleted = false;
        mTempRect = new Rect();
        mLaunchingCamera = false;
        DEBUG_LQ_LOCKVIEW = flag;
        mLQLockView = null;
        mCameraWidgetCallbacks = new CameraWidgetFrame.Callbacks() {

            final KeyguardHostView this$0;

            private void setSliderHandleAlpha(float f)
            {
                SlidingChallengeLayout slidingchallengelayout = (SlidingChallengeLayout)findViewById(0x10202b9);
                if (slidingchallengelayout != null)
                    slidingchallengelayout.setHandleAlpha(f);
            }

            public void onCameraLaunchedSuccessfully()
            {
                if (mAppWidgetContainer.isCameraPage(mAppWidgetContainer.getCurrentPage()))
                    mAppWidgetContainer.scrollLeft();
                setSliderHandleAlpha(1.0F);
                mShowSecurityWhenReturn = true;
                mLaunchingCamera = false;
            }

            public void onCameraLaunchedUnsuccessfully()
            {
                setSliderHandleAlpha(1.0F);
                mLaunchingCamera = false;
            }

            public void onLaunchingCamera()
            {
                setSliderHandleAlpha(0.0F);
                mLaunchingCamera = true;
            }

            
            {
                this$0 = KeyguardHostView.this;
                Object();
            }
        }
;
        mActivityLauncher = new KeyguardActivityLauncher() ;
        mLockPatternUtils = new LockPatternUtils(context);
        mUserId = mLockPatternUtils.getCurrentUser();
        mAppWidgetHost = new AppWidgetHost(context, 0x4b455947, mOnClickHandler, Looper.myLooper());
        mAppWidgetHost.setUserId(mUserId);
        cleanupAppWidgetIds();
        mAppWidgetManager = AppWidgetManager.getInstance(mContext);
        mSecurityModel = new KeyguardSecurityModel(context);
        mViewStateManager = new KeyguardViewStateManager(this);
        DevicePolicyManager devicepolicymanager = (DevicePolicyManager)mContext.getSystemService("device_policy");
        if (devicepolicymanager != null)
        {
            mDisabledFeatures = getDisabledFeatures(devicepolicymanager);
            mCameraDisabled = devicepolicymanager.getCameraDisabled(null);
        }
        mSafeModeEnabled = LockPatternUtils.isSafeModeEnabled();
        if (android.provider.Settings.Secure.getIntForUser(mContext.getContentResolver(), "user_setup_complete", 0, -2) == 0)
            flag = false;
        mUserSetupCompleted = flag;
        if (mSafeModeEnabled)
            Log.v("KeyguardHostView", "Keyguard widgets disabled by safe mode");
        if ((1 & mDisabledFeatures) != 0)
            Log.v("KeyguardHostView", "Keyguard widgets disabled by DPM");
        if ((2 & mDisabledFeatures) != 0)
            Log.v("KeyguardHostView", "Keyguard secure camera disabled by DPM");
        if (SystemProperties.get("ro.rgk.sm611.style").equals("samsun"))
            getLQLockViewName();
    }

    private void addDefaultStatusWidget(int i)
    {
        mStatusWidget = LayoutInflater.from(mContext).inflate(0x1090076, null, true);
        mAppWidgetContainer.addWidget(mStatusWidget, i);
    }

    private void addDefaultWidgets()
    {
        LayoutInflater layoutinflater = LayoutInflater.from(mContext);
        layoutinflater.inflate(0x1090078, this, true);
        if (!mSafeModeEnabled && !widgetsDisabledByDpm())
        {
            View view = layoutinflater.inflate(0x1090052, this, false);
            mAppWidgetContainer.addWidget(view, 0);
            view.findViewById(0x10202a9).setOnClickListener(new android.view.View.OnClickListener() {

                final KeyguardHostView this$0;

                public void onClick(View view1)
                {
                    mActivityLauncher.launchWidgetPicker(0);
                }

            
            {
                this$0 = KeyguardHostView.this;
                Object();
            }
            }
);
        }
        if (!mSafeModeEnabled && !cameraDisabledByDpm() && mUserSetupCompleted && mContext.getResources().getBoolean(0x1110000))
        {
            CameraWidgetFrame camerawidgetframe = CameraWidgetFrame.create(mContext, mCameraWidgetCallbacks, mActivityLauncher);
            if (camerawidgetframe != null)
                mAppWidgetContainer.addWidget(camerawidgetframe);
        }
        enableUserSelectorIfNecessary();
        initializeTransportControl();
    }

    private void addTransportToWidgetPager()
    {
        if (getWidgetPosition(0x102030f) == -1)
        {
            removeView(mTransportControl);
            int i = -1 + mAppWidgetContainer.getChildCount();
            int j = 0;
            if (i >= 0)
                if (mAppWidgetContainer.isCameraPage(i))
                    j = i;
                else
                    j = i + 1;
            mAppWidgetContainer.addWidget(mTransportControl, j);
            mTransportControl.setVisibility(0);
        }
    }

    private boolean addWidget(int i, int j, boolean flag)
    {
        android.appwidget.AppWidgetProviderInfo appwidgetproviderinfo = mAppWidgetManager.getAppWidgetInfo(i);
        if (appwidgetproviderinfo != null)
        {
            addWidget(getAppWidgetHost().createView(mContext, i, appwidgetproviderinfo), j);
            return true;
        }
        if (flag)
        {
            Log.w("KeyguardHostView", (new StringBuilder()).append("AppWidgetInfo for app widget id ").append(i).append(" was null, deleting").toString());
            mAppWidgetHost.deleteAppWidgetId(i);
            mLockPatternUtils.removeAppWidget(i);
        }
        return false;
    }

    private void addWidgetsFromSettings()
    {
        if (!mSafeModeEnabled && !widgetsDisabledByDpm())
        {
            int i = getInsertPageIndex();
            int ai[] = mLockPatternUtils.getAppWidgets();
            if (ai == null)
            {
                Log.d("KeyguardHostView", "Problem reading widgets");
                return;
            }
            for (int j = -1 + ai.length; j >= 0; j--)
                if (ai[j] == -2)
                    addDefaultStatusWidget(i);
                else
                    addWidget(ai[j], i, true);

        }
    }

    private int allocateIdForDefaultAppWidget()
    {
        Resources resources = getContext().getResources();
        ComponentName componentname = new ComponentName(resources.getString(0x104001b), resources.getString(0x104001c));
        int i = mAppWidgetHost.allocateAppWidgetId();
        try
        {
            mAppWidgetManager.bindAppWidgetId(i, componentname);
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            Log.e("KeyguardHostView", (new StringBuilder()).append("Error when trying to bind default AppWidget: ").append(illegalargumentexception).toString());
            mAppWidgetHost.deleteAppWidgetId(i);
            return 0;
        }
        return i;
    }

    private boolean cameraDisabledByDpm()
    {
        return mCameraDisabled || (2 & mDisabledFeatures) != 0;
    }

    private void cleanupAppWidgetIds()
    {
        if (!KeyguardUpdateMonitor.getInstance(mContext).hasBootCompleted())
        {
            mCleanupAppWidgetsOnBootCompleted = true;
        } else
        {
            int ai[] = mLockPatternUtils.getAppWidgets();
            int ai1[] = mAppWidgetHost.getAppWidgetIds();
            for (int i = 0; i < ai1.length; i++)
            {
                int j = ai1[i];
                if (!contains(ai, j))
                {
                    Log.d("KeyguardHostView", (new StringBuilder()).append("Found a appWidgetId that's not being used by keyguard, deleting id ").append(j).toString());
                    mAppWidgetHost.deleteAppWidgetId(j);
                }
            }

        }
    }

    private static boolean contains(int ai[], int i)
    {
        int j = ai.length;
        for (int k = 0; k < j; k++)
            if (ai[k] == i)
                return true;

        return false;
    }

    private void enableUserSelectorIfNecessary()
    {
        if (UserManager.supportsMultipleUsers())
        {
            UserManager usermanager = (UserManager)mContext.getSystemService("user");
            if (usermanager == null)
            {
                Throwable throwable3 = new Throwable();
                throwable3.fillInStackTrace();
                Log.e("KeyguardHostView", "user service is null.", throwable3);
                return;
            }
            List list = usermanager.getUsers(true);
            if (list == null)
            {
                Throwable throwable2 = new Throwable();
                throwable2.fillInStackTrace();
                Log.e("KeyguardHostView", "list of users is null.", throwable2);
                return;
            }
            View view = findViewById(0x10202bd);
            if (view == null)
            {
                Throwable throwable1 = new Throwable();
                throwable1.fillInStackTrace();
                Log.e("KeyguardHostView", "can't find user_selector in layout.", throwable1);
                return;
            }
            if (list.size() > 1)
            {
                if (view instanceof KeyguardMultiUserSelectorView)
                {
                    KeyguardMultiUserSelectorView keyguardmultiuserselectorview = (KeyguardMultiUserSelectorView)view;
                    keyguardmultiuserselectorview.setVisibility(0);
                    keyguardmultiuserselectorview.addUsers(list);
                    keyguardmultiuserselectorview.setCallback(new UserSwitcherCallback() {

                        final KeyguardHostView this$0;

                        public void hideSecurityView(int i)
                        {
                            mSecurityViewContainer.animate().alpha(0.0F).setDuration(i);
                        }

                        public void showSecurityView()
                        {
                            mSecurityViewContainer.setAlpha(1.0F);
                        }

                        public void showUnlockHint()
                        {
                            if (mKeyguardSelectorView != null)
                                mKeyguardSelectorView.showUsabilityHint();
                        }

                        public void userActivity()
                        {
                            if (mViewMediatorCallback != null)
                                mViewMediatorCallback.userActivity();
                        }

            
            {
                this$0 = KeyguardHostView.this;
                Object();
            }
                    }
);
                    return;
                }
                Throwable throwable = new Throwable();
                throwable.fillInStackTrace();
                if (view == null)
                {
                    Log.e("KeyguardHostView", "could not find the user_selector.", throwable);
                    return;
                } else
                {
                    Log.e("KeyguardHostView", "user_selector is the wrong type.", throwable);
                    return;
                }
            }
        }
    }

    private CameraWidgetFrame findCameraPage()
    {
        for (int i = -1 + mAppWidgetContainer.getChildCount(); i >= 0; i--)
            if (mAppWidgetContainer.isCameraPage(i))
                return (CameraWidgetFrame)mAppWidgetContainer.getChildAt(i);

        return null;
    }

    private AppWidgetHost getAppWidgetHost()
    {
        return mAppWidgetHost;
    }

    private int getAppropriateWidgetPage(boolean flag)
    {
        if (mAppWidgetToShow != 0)
        {
            int j = mAppWidgetContainer.getChildCount();
            for (int k = 0; k < j; k++)
                if (mAppWidgetContainer.getWidgetPageAt(k).getContentAppWidgetId() == mAppWidgetToShow)
                    return k;

            mAppWidgetToShow = 0;
        }
        if (flag)
        {
            if (DEBUG)
                Log.d("KeyguardHostView", "Music playing, show transport");
            return mAppWidgetContainer.getWidgetPageIndex(mTransportControl);
        }
        int i = -1 + mAppWidgetContainer.getChildCount();
        if (mAppWidgetContainer.isCameraPage(i))
            i--;
        if (DEBUG)
            Log.d("KeyguardHostView", (new StringBuilder()).append("Show right-most page ").append(i).toString());
        return i;
    }

    private int getDisabledFeatures(DevicePolicyManager devicepolicymanager)
    {
        int i;
        if (KeyguardUtils.isMediatekLCASupport())
        {
            if (DEBUG)
                KeyguardUtils.xlogD("KeyguardHostView", "[LCA] Disable keyguard widget/camera.");
            i = 0x7fffffff;
        } else
        {
            i = 0;
            if (devicepolicymanager != null)
                return devicepolicymanager.getKeyguardDisabledFeatures(null, mLockPatternUtils.getCurrentUser());
        }
        return i;
    }

    private int getInsertPageIndex()
    {
        View view = mAppWidgetContainer.findViewById(0x10202a8);
        int i = mAppWidgetContainer.indexOfChild(view);
        if (i < 0)
            return 0;
        else
            return i + 1;
    }

    private void getLQLockViewName()
    {
        if (DEBUG_LQ_LOCKVIEW)
            Log.d("KeyguardHostView", "getLQLockViewName-------------1");
        ContentHandler contenthandler = new ContentHandler();
        boolean flag = getXMLFile(LQ_LOCKVIEW_CONFIG_FILE, contenthandler);
        mLQLockViewPKName = null;
        mLQLockClassName = null;
        if (flag)
        {
            mLQLockViewPKName = contenthandler.getLockPackName();
            mLQLockClassName = contenthandler.getLockClassName();
            if (DEBUG_LQ_LOCKVIEW)
                Log.d("KeyguardHostView", (new StringBuilder()).append("getLQLockViewName-------------1").append(mLQLockViewPKName).append(" ").append(mLQLockClassName).toString());
        }
        if (DEBUG_LQ_LOCKVIEW)
            Log.d("KeyguardHostView", (new StringBuilder()).append("getLQLockViewName-------------2").append(mLQLockViewPKName).append(" ").append(mLQLockClassName).toString());
    }

    private int getLayoutIdFor(KeyguardSecurityModel.SecurityMode securitymode)
    {
        int i = 0x2070010;
        static class _cls12
        {

            static final int $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode[];

            static 
            {
                $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode = new int[KeyguardSecurityModel.SecurityMode.values().length];
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode[KeyguardSecurityModel.SecurityMode.Pattern.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode[KeyguardSecurityModel.SecurityMode.PIN.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode[KeyguardSecurityModel.SecurityMode.Password.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror2) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode[KeyguardSecurityModel.SecurityMode.Account.ordinal()] = 4;
                }
                catch (NoSuchFieldError nosuchfielderror3) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode[KeyguardSecurityModel.SecurityMode.Biometric.ordinal()] = 5;
                }
                catch (NoSuchFieldError nosuchfielderror4) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode[KeyguardSecurityModel.SecurityMode.Voice.ordinal()] = 6;
                }
                catch (NoSuchFieldError nosuchfielderror5) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode[KeyguardSecurityModel.SecurityMode.SimPinPukMe1.ordinal()] = 7;
                }
                catch (NoSuchFieldError nosuchfielderror6) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode[KeyguardSecurityModel.SecurityMode.SimPinPukMe2.ordinal()] = 8;
                }
                catch (NoSuchFieldError nosuchfielderror7) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode[KeyguardSecurityModel.SecurityMode.SimPinPukMe3.ordinal()] = 9;
                }
                catch (NoSuchFieldError nosuchfielderror8) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode[KeyguardSecurityModel.SecurityMode.SimPinPukMe4.ordinal()] = 10;
                }
                catch (NoSuchFieldError nosuchfielderror9) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode[KeyguardSecurityModel.SecurityMode.None.ordinal()] = 11;
                }
                catch (NoSuchFieldError nosuchfielderror10) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode[KeyguardSecurityModel.SecurityMode.AlarmBoot.ordinal()] = 12;
                }
                catch (NoSuchFieldError nosuchfielderror11)
                {
                    return;
                }
            }
        }

        switch (_cls12..SwitchMap.com.android.internal.policy.impl.keyguard.KeyguardSecurityModel.SecurityMode[securitymode.ordinal()])
        {
        case 6: // '\006'
            return 0x10900ef;

        case 12: // '\f'
            return 0x2070017;

        case 4: // '\004'
            return 0x1090051;

        case 5: // '\005'
            return 0x1090055;

        case 3: // '\003'
            return 0x109005f;

        case 2: // '\002'
            return 0x1090061;

        case 1: // '\001'
            return 0x1090060;

        case 11: // '\013'
            return 0x1090070;

        default:
            i = 0;
            // fall through

        case 7: // '\007'
        case 8: // '\b'
        case 9: // '\t'
        case 10: // '\n'
            return i;
        }
    }

    private KeyguardSecurityView getSecurityView(KeyguardSecurityModel.SecurityMode securitymode)
    {
        int i = getSecurityViewIdForMode(securitymode);
        int j = mSecurityViewContainer.getChildCount();
        int k = 0;
        do
        {
label0:
            {
                KeyguardSecurityView keyguardsecurityview = null;
                if (k < j)
                {
                    if (mSecurityViewContainer.getChildAt(k).getId() != i)
                        break label0;
                    keyguardsecurityview = (KeyguardSecurityView)mSecurityViewContainer.getChildAt(k);
                }
                int l = getLayoutIdFor(securitymode);
                if (keyguardsecurityview == null && l != 0)
                {
                    LayoutInflater layoutinflater = LayoutInflater.from(mContext);
                    if (DEBUG)
                        Log.v("KeyguardHostView", (new StringBuilder()).append("inflating id = ").append(l).toString());
                    View view = layoutinflater.inflate(l, mSecurityViewContainer, false);
                    keyguardsecurityview = (KeyguardSecurityView)view;
                    if (keyguardsecurityview instanceof KeyguardSimPinPukView)
                    {
                        KeyguardSimPinPukView keyguardsimpinpukview1 = (KeyguardSimPinPukView)keyguardsecurityview;
                        if (securitymode == KeyguardSecurityModel.SecurityMode.SimPinPukMe1)
                            keyguardsimpinpukview1.setSimId(0);
                        else
                        if (securitymode == KeyguardSecurityModel.SecurityMode.SimPinPukMe2)
                            keyguardsimpinpukview1.setSimId(1);
                        else
                        if (securitymode == KeyguardSecurityModel.SecurityMode.SimPinPukMe3)
                            keyguardsimpinpukview1.setSimId(2);
                        else
                        if (securitymode == KeyguardSecurityModel.SecurityMode.SimPinPukMe4)
                            keyguardsimpinpukview1.setSimId(3);
                    }
                    mSecurityViewContainer.addView(view);
                    updateSecurityView(view);
                } else
                if (keyguardsecurityview != null && (keyguardsecurityview instanceof KeyguardSimPinPukView) && securitymode != mCurrentSecuritySelection)
                {
                    Log.i("KeyguardHostView", "getSecurityView, here, we will refresh the layout");
                    KeyguardSimPinPukView keyguardsimpinpukview = (KeyguardSimPinPukView)keyguardsecurityview;
                    if (securitymode == KeyguardSecurityModel.SecurityMode.SimPinPukMe1)
                        keyguardsimpinpukview.setSimId(0);
                    else
                    if (securitymode == KeyguardSecurityModel.SecurityMode.SimPinPukMe2)
                        keyguardsimpinpukview.setSimId(1);
                    else
                    if (securitymode == KeyguardSecurityModel.SecurityMode.SimPinPukMe3)
                        keyguardsimpinpukview.setSimId(2);
                    else
                    if (securitymode == KeyguardSecurityModel.SecurityMode.SimPinPukMe4)
                        keyguardsimpinpukview.setSimId(3);
                }
                if (keyguardsecurityview instanceof KeyguardSelectorView)
                {
                    KeyguardSelectorView keyguardselectorview = (KeyguardSelectorView)keyguardsecurityview;
                    keyguardselectorview.setCarrierArea(keyguardselectorview.findViewById(0x10202b1));
                }
                return keyguardsecurityview;
            }
            k++;
        } while (true);
    }

    private int getSecurityViewIdForMode(KeyguardSecurityModel.SecurityMode securitymode)
    {
        int i = 0x2100035;
        switch (_cls12..SwitchMap.com.android.internal.policy.impl.keyguard.KeyguardSecurityModel.SecurityMode[securitymode.ordinal()])
        {
        case 6: // '\006'
            return 0x10203be;

        case 12: // '\f'
            return 0x210005a;

        case 4: // '\004'
            return 0x10202a4;

        case 5: // '\005'
            return 0x10202ac;

        case 3: // '\003'
            return 0x10202c0;

        case 2: // '\002'
            return 0x10202c5;

        case 1: // '\001'
            return 0x10202c3;

        case 11: // '\013'
            return 0x10202fe;

        default:
            i = 0;
            // fall through

        case 7: // '\007'
        case 8: // '\b'
        case 9: // '\t'
        case 10: // '\n'
            return i;
        }
    }

    private int getWidgetPosition(int i)
    {
        if (mAppWidgetContainer != null)
        {
            int j = mAppWidgetContainer.getChildCount();
            for (int k = 0; k < j; k++)
                if (mAppWidgetContainer.getWidgetPageAt(k).getContent().getId() == i)
                    return k;

            return -1;
        } else
        {
            return -1;
        }
    }

    private String getXMLFile(String s)
    {
        String s1 = null;
        try
        {
            FileInputStream fileinputstream = new FileInputStream(s);
            byte abyte0[] = new byte[fileinputstream.available()];
            int i = fileinputstream.read(abyte0);
            if (DEBUG_LQ_LOCKVIEW)
                Log.d("KeyguardHostView", (new StringBuilder()).append("getXMLFile read:").append(i).toString());
            s1 = EncodingUtils.getString(abyte0, "UTF-8");
            fileinputstream.close();
        }
        catch (Exception exception)
        {
            exception.printStackTrace();
            return s1;
        }
        return s1;
    }

    private boolean getXMLFile(String s, ContentHandler contenthandler)
    {
        SAXParserFactory saxparserfactory = SAXParserFactory.newInstance();
        XMLReader xmlreader;
        String s1;
        boolean flag;
        try
        {
            xmlreader = saxparserfactory.newSAXParser().getXMLReader();
            xmlreader.setContentHandler(contenthandler);
            s1 = getXMLFile(s);
        }
        catch (SAXException saxexception)
        {
            saxexception.printStackTrace();
            return false;
        }
        catch (ParserConfigurationException parserconfigurationexception)
        {
            parserconfigurationexception.printStackTrace();
            return false;
        }
        catch (IOException ioexception)
        {
            ioexception.printStackTrace();
            return false;
        }
        flag = false;
        if (s1 == null)
            break MISSING_BLOCK_LABEL_62;
        xmlreader.parse(new InputSource(new StringReader(s1)));
        flag = true;
        return flag;
    }

    private void initializeTransportControl()
    {
        mTransportControl = (KeyguardTransportControlView)findViewById(0x102030f);
        mTransportControl.setVisibility(8);
        if (mTransportControl != null)
            mTransportControl.setKeyguardCallback(new TransportCallback() {

                final KeyguardHostView this$0;

                public void onListenerAttached()
                {
                    mTransportControl.post(mSwitchPageRunnable);
                }

                public void onListenerDetached()
                {
                    if (removeTransportFromWidgetPager())
                        mTransportControl.post(mSwitchPageRunnable);
                }

                public void onPlayStateChanged()
                {
                    mTransportControl.post(mSwitchPageRunnable);
                }

            
            {
                this$0 = KeyguardHostView.this;
                Object();
            }
            }
);
    }

    private boolean isLockScreenPriorSimPin(KeyguardSecurityModel.SecurityMode securitymode)
    {
        boolean flag;
label0:
        {
            KeyguardUtils.xlogD("KeyguardHostView", (new StringBuilder()).append("isLockScreenPriorSimPin enter mode=").append(securitymode).toString());
            if (securitymode != KeyguardSecurityModel.SecurityMode.SimPinPukMe1 && securitymode != KeyguardSecurityModel.SecurityMode.SimPinPukMe2 && securitymode != KeyguardSecurityModel.SecurityMode.SimPinPukMe3)
            {
                KeyguardSecurityModel.SecurityMode securitymode1 = KeyguardSecurityModel.SecurityMode.SimPinPukMe4;
                flag = false;
                if (securitymode != securitymode1)
                    break label0;
            }
            flag = true;
        }
        KeyguardSecurityView keyguardsecurityview = getSecurityView(mCurrentSecuritySelection);
        KeyguardUtils.xlogD("KeyguardHostView", "isLockScreenPriorSimPin return");
        return flag && (keyguardsecurityview instanceof KeyguardSelectorView);
    }

    private boolean isSecure()
    {
        KeyguardSecurityModel.SecurityMode securitymode = mSecurityModel.getSecurityMode();
        switch (_cls12..SwitchMap.com.android.internal.policy.impl.keyguard.KeyguardSecurityModel.SecurityMode[securitymode.ordinal()])
        {
        case 11: // '\013'
            return false;

        case 4: // '\004'
        case 7: // '\007'
        case 8: // '\b'
        case 9: // '\t'
        case 10: // '\n'
            return true;

        case 2: // '\002'
        case 3: // '\003'
            return mLockPatternUtils.isLockPasswordEnabled();

        case 1: // '\001'
            return mLockPatternUtils.isLockPatternEnabled();

        case 5: // '\005'
        case 6: // '\006'
        default:
            throw new IllegalStateException((new StringBuilder()).append("Unknown security mode ").append(securitymode).toString());
        }
    }

    private int numWidgets()
    {
        int i = mAppWidgetContainer.getChildCount();
        int j = 0;
        for (int k = 0; k < i; k++)
            if (mAppWidgetContainer.isWidgetPage(k))
                j++;

        return j;
    }

    private boolean removeTransportFromWidgetPager()
    {
        int i = getWidgetPosition(0x102030f);
        boolean flag = false;
        if (i != -1)
        {
            mAppWidgetContainer.removeWidget(mTransportControl);
            addView(mTransportControl);
            mTransportControl.setVisibility(8);
            mViewStateManager.setTransportState(0);
            flag = true;
        }
        return flag;
    }

    private void reportFailedUnlockAttempt()
    {
        KeyguardUpdateMonitor keyguardupdatemonitor = KeyguardUpdateMonitor.getInstance(mContext);
        int i = 1 + keyguardupdatemonitor.getFailedUnlockAttempts();
        if (DEBUG)
            Log.d("KeyguardHostView", (new StringBuilder()).append("reportFailedPatternAttempt: #").append(i).toString());
        boolean flag;
        if (mSecurityModel.getSecurityMode() == KeyguardSecurityModel.SecurityMode.Pattern)
            flag = true;
        else
            flag = false;
        int j = mLockPatternUtils.getDevicePolicyManager().getMaximumFailedPasswordsForWipe(null, mLockPatternUtils.getCurrentUser());
        int k;
        if (j > 0)
            k = j - i;
        else
            k = 0x7fffffff;
        boolean flag1 = false;
        if (k < 5)
        {
            if (k > 0)
            {
                showAlmostAtWipeDialog(i, k);
            } else
            {
                Slog.i("KeyguardHostView", "Too many unlock attempts; device will be wiped!");
                showWipeDialog(i);
                flag1 = false;
            }
        } else
        {
            if (i % 5 == 0)
                flag1 = true;
            else
                flag1 = false;
            if (flag && mEnableFallback)
                if (i == 15)
                {
                    showAlmostAtAccountLoginDialog();
                    flag1 = false;
                } else
                if (i >= 20)
                {
                    mLockPatternUtils.setPermanentlyLocked(true);
                    showSecurityScreen(KeyguardSecurityModel.SecurityMode.Account);
                    flag1 = false;
                }
        }
        keyguardupdatemonitor.reportFailedUnlockAttempt();
        mLockPatternUtils.reportFailedPasswordAttempt();
        if (flag1)
            showTimeoutDialog();
    }

    private void requestClipChildren(boolean flag)
    {
    }

    private boolean shouldEnableAddWidget()
    {
        return numWidgets() < 5 && mUserSetupCompleted;
    }

    private boolean shouldEnableMenuKey()
    {
        boolean flag = getResources().getBoolean(0x1110025);
        boolean flag1 = ActivityManager.isRunningInTestHarness();
        boolean flag2 = (new File("/data/local/enable_menu_key")).exists();
        return !flag || flag1 || flag2;
    }

    private void showAlmostAtAccountLoginDialog()
    {
        Context context = mContext;
        Object aobj[] = new Object[3];
        aobj[0] = Integer.valueOf(15);
        aobj[1] = Integer.valueOf(5);
        aobj[2] = Integer.valueOf(30);
        showDialog(null, context.getString(0x1040542, aobj));
    }

    private void showAlmostAtWipeDialog(int i, int j)
    {
        Context context = mContext;
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(i);
        aobj[1] = Integer.valueOf(j);
        showDialog(null, context.getString(0x1040540, aobj));
    }

    private void showAppropriateWidgetPage()
    {
        int i = mViewStateManager.getTransportState();
        boolean flag;
        if (!mTransportControl.isMusicPlaying() && i != 2)
            flag = false;
        else
            flag = true;
        if (flag)
        {
            mViewStateManager.setTransportState(2);
            addTransportToWidgetPager();
        } else
        if (i == 2)
            mViewStateManager.setTransportState(1);
        int j = getAppropriateWidgetPage(flag);
        mAppWidgetContainer.setCurrentPage(j);
    }

    private void showBackupSecurityScreen()
    {
        if (DEBUG)
            Log.d("KeyguardHostView", "showBackupSecurity()");
        showSecurityScreen(mSecurityModel.getBackupSecurityMode(mCurrentSecuritySelection));
    }

    private void showDialog(String s, String s1)
    {
        AlertDialog alertdialog = (new android.app.AlertDialog.Builder(mContext)).setTitle(s).setMessage(s1).setNeutralButton(0x104000a, null).create();
        if (!(mContext instanceof Activity))
            alertdialog.getWindow().setType(2009);
        alertdialog.show();
    }

    private void showNextSecurityScreenOrFinish(boolean flag, boolean flag1)
    {
        if (DEBUG)
            Log.d("KeyguardHostView", (new StringBuilder()).append("showNextSecurityScreenOrFinish(").append(flag).append(")").toString());
        boolean flag2 = flag1;
        boolean flag3;
        if (KeyguardSecurityModel.SecurityMode.None == mCurrentSecuritySelection)
        {
            KeyguardSecurityModel.SecurityMode securitymode1 = mSecurityModel.getSecurityMode();
            KeyguardSecurityModel.SecurityMode securitymode2 = mSecurityModel.getAlternateFor(securitymode1);
            if (KeyguardSecurityModel.SecurityMode.None == securitymode2)
            {
                flag3 = true;
            } else
            {
                showSecurityScreen(securitymode2);
                flag3 = false;
            }
        } else
        if (flag)
        {
            switch (_cls12..SwitchMap.com.android.internal.policy.impl.keyguard.KeyguardSecurityModel.SecurityMode[mCurrentSecuritySelection.ordinal()])
            {
            case 7: // '\007'
            case 8: // '\b'
            case 9: // '\t'
            case 10: // '\n'
                KeyguardSecurityModel.SecurityMode securitymode = mSecurityModel.getSecurityMode();
                if (securitymode != KeyguardSecurityModel.SecurityMode.None)
                {
                    showSecurityScreen(securitymode);
                    flag3 = false;
                } else
                {
                    flag3 = true;
                }
                break;

            case 1: // '\001'
            case 2: // '\002'
            case 3: // '\003'
            case 4: // '\004'
            case 5: // '\005'
            case 6: // '\006'
                flag3 = true;
                break;

            default:
                Log.v("KeyguardHostView", (new StringBuilder()).append("Bad security screen ").append(mCurrentSecuritySelection).append(", fail safe").toString());
                showPrimarySecurityScreen(false);
                flag3 = false;
                break;
            }
        } else
        {
            showPrimarySecurityScreen(false);
            flag2 = true;
            flag3 = false;
        }
        if (flag3)
        {
            KeyguardUpdateMonitor.getInstance(mContext).setAlternateUnlockEnabled(true);
            OnDismissAction ondismissaction = mDismissAction;
            boolean flag4 = false;
            if (ondismissaction != null)
            {
                flag4 = mDismissAction.onDismiss();
                mDismissAction = null;
            }
            if (mViewMediatorCallback != null)
                if (flag4)
                {
                    mViewMediatorCallback.keyguardDonePending();
                } else
                {
                    mViewMediatorCallback.keyguardDone(true);
                    return;
                }
        } else
        if (flag2)
        {
            mViewStateManager.showBouncer(true);
            return;
        }
    }

    private void showSecurityScreen(KeyguardSecurityModel.SecurityMode securitymode)
    {
        if (DEBUG)
            Log.d("KeyguardHostView", (new StringBuilder()).append("showSecurityScreen(").append(securitymode).append(")").toString());
        if (securitymode == mCurrentSecuritySelection) goto _L2; else goto _L1
_L1:
        KeyguardSecurityView keyguardsecurityview1;
        int i;
        int j;
        int k;
        KeyguardSecurityView keyguardsecurityview = getSecurityView(mCurrentSecuritySelection);
        if (DEBUG)
            KeyguardUtils.xlogD("KeyguardHostView", "showSecurityScreen get oldView");
        keyguardsecurityview1 = getSecurityView(securitymode);
        if (DEBUG)
            KeyguardUtils.xlogD("KeyguardHostView", "showSecurityScreen get newView");
        boolean flag = getResources().getBoolean(0x111000c);
        boolean flag1;
        if (securitymode == KeyguardSecurityModel.SecurityMode.Account)
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if (KeyguardUtils.isGemini())
        {
            if (!flag1 && securitymode != KeyguardSecurityModel.SecurityMode.SimPinPukMe1 && securitymode != KeyguardSecurityModel.SecurityMode.SimPinPukMe2 && securitymode != KeyguardSecurityModel.SecurityMode.SimPinPukMe3 && securitymode != KeyguardSecurityModel.SecurityMode.SimPinPukMe4)
                flag2 = false;
            else
                flag2 = true;
        } else
        if (!flag1 && securitymode != KeyguardSecurityModel.SecurityMode.SimPinPukMe1)
            flag2 = false;
        else
            flag2 = true;
        boolean flag3 = KeyguardUpdateMonitor.getInstance(getContext()).dmIsLocked();
        KeyguardWidgetPager keyguardwidgetpager = mAppWidgetContainer;
        byte byte0;
        if ((!flag2 || !flag) && !flag3 && !KeyguardUpdateMonitor.isAlarmBoot())
            byte0 = 0;
        else
            byte0 = 8;
        keyguardwidgetpager.setVisibility(byte0);
        if (mSlidingChallengeLayout != null)
        {
            SlidingChallengeLayout slidingchallengelayout = mSlidingChallengeLayout;
            boolean flag5;
            if (securitymode == KeyguardSecurityModel.SecurityMode.Account && !flag3)
                flag5 = false;
            else
                flag5 = true;
            slidingchallengelayout.setChallengeInteractive(flag5);
        }
        if (DEBUG)
            KeyguardUtils.xlogD("KeyguardHostView", "showSecurityScreen pause oldView before");
        if (keyguardsecurityview != null)
        {
            keyguardsecurityview.onPause();
            keyguardsecurityview.setKeyguardCallback(mNullCallback);
            if ((keyguardsecurityview instanceof KeyguardSelectorView) && !(keyguardsecurityview1 instanceof KeyguardSelectorView) && mSlidingChallengeLayout != null)
            {
                mKeyaugerLayerVisibility = false;
                updateKeyguardLayerVisibility();
                requestClipChildren(true);
            } else
            if ((keyguardsecurityview instanceof KeyguardSelectorView) && !(keyguardsecurityview1 instanceof KeyguardSelectorView) && mMultiPaneChallengeLayout != null)
            {
                mKeyaugerLayerVisibility = false;
                updateKeyguardLayerVisibility();
            }
        }
        if (DEBUG)
            KeyguardUtils.xlogD("KeyguardHostView", "showSecurityScreen pause oldView finish");
        keyguardsecurityview1.onResume(2);
        keyguardsecurityview1.setKeyguardCallback(mCallback);
        if ((keyguardsecurityview1 instanceof KeyguardSelectorView) && mSlidingChallengeLayout != null)
        {
            mKeyaugerLayerVisibility = true;
            updateKeyguardLayerVisibility();
            KeyguardSelectorView keyguardselectorview1 = (KeyguardSelectorView)keyguardsecurityview1;
            mSlidingChallengeLayout.setTouchRecepientForKeyguardLayer(keyguardselectorview1.getGlowPadView());
            requestClipChildren(false);
        } else
        if ((keyguardsecurityview1 instanceof KeyguardSelectorView) && mMultiPaneChallengeLayout != null)
        {
            mKeyaugerLayerVisibility = true;
            updateKeyguardLayerVisibility();
            KeyguardSelectorView keyguardselectorview = (KeyguardSelectorView)keyguardsecurityview1;
            mMultiPaneChallengeLayout.setTouchRecepientForKeyguardLayer(keyguardselectorview.getGlowPadView());
        }
        if (DEBUG)
            Log.d("KeyguardHostView", "showSecurityScreen update keyguard layer finish");
        boolean flag4 = keyguardsecurityview1.needsInput();
        if (mViewMediatorCallback != null)
            mViewMediatorCallback.setNeedsInput(flag4);
        i = mSecurityViewContainer.getChildCount();
        mSecurityViewContainer.setInAnimation(AnimationUtils.loadAnimation(mContext, 0x10a002b));
        mSecurityViewContainer.setOutAnimation(AnimationUtils.loadAnimation(mContext, 0x10a002c));
        j = getSecurityViewIdForMode(securitymode);
        k = 0;
_L8:
        if (k >= i) goto _L4; else goto _L3
_L3:
        if (mSecurityViewContainer.getChildAt(k).getId() != j) goto _L6; else goto _L5
_L5:
        mSecurityViewContainer.setDisplayedChild(k);
_L4:
        if (securitymode == KeyguardSecurityModel.SecurityMode.None)
            setOnDismissAction(null);
        mCurrentSecuritySelection = securitymode;
        mCurrentKeyguardSecurityView = keyguardsecurityview1;
        if (SystemProperties.get("ro.rgk.sm611.style").equals("samsun"))
            if (keyguardsecurityview1 instanceof KeyguardSelectorView)
            {
                if (mSlidingChallengeLayout != null)
                    mSlidingChallengeLayout.setLockView(mLQLockView, (KeyguardSelectorView)keyguardsecurityview1);
            } else
            if (mSlidingChallengeLayout != null)
                mSlidingChallengeLayout.setLockView(mLQLockView, null);
        if (DEBUG)
        {
            KeyguardUtils.xlogD("KeyguardHostView", (new StringBuilder()).append("showSecurityScreen(").append(securitymode).append(") finish").toString());
            return;
        }
_L2:
        return;
_L6:
        k++;
        if (true) goto _L8; else goto _L7
_L7:
    }

    private void showTimeoutDialog()
    {
        int i = _cls12..SwitchMap.com.android.internal.policy.impl.keyguard.KeyguardSecurityModel.SecurityMode[mSecurityModel.getSecurityMode().ordinal()];
        int j = 0;
        switch (i)
        {
        case 3: // '\003'
            j = 0x104053e;
            break;

        case 2: // '\002'
            j = 0x104053d;
            break;

        case 1: // '\001'
            j = 0x104053f;
            break;
        }
        if (j != 0)
        {
            Context context = mContext;
            Object aobj[] = new Object[2];
            aobj[0] = Integer.valueOf(KeyguardUpdateMonitor.getInstance(mContext).getFailedUnlockAttempts());
            aobj[1] = Integer.valueOf(30);
            showDialog(null, context.getString(j, aobj));
        }
    }

    private void showWipeDialog(int i)
    {
        Context context = mContext;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        showDialog(null, context.getString(0x1040541, aobj));
    }

    private void updateSecurityView(View view)
    {
        if (view instanceof KeyguardSecurityView)
        {
            KeyguardSecurityView keyguardsecurityview = (KeyguardSecurityView)view;
            keyguardsecurityview.setKeyguardCallback(mCallback);
            keyguardsecurityview.setLockPatternUtils(mLockPatternUtils);
            if (mViewStateManager.isBouncing())
            {
                keyguardsecurityview.showBouncer(0);
                return;
            } else
            {
                keyguardsecurityview.hideBouncer(0);
                return;
            }
        } else
        {
            Log.w("KeyguardHostView", (new StringBuilder()).append("View ").append(view).append(" is not a KeyguardSecurityView").toString());
            return;
        }
    }

    private void updateSecurityViews()
    {
        int i = mSecurityViewContainer.getChildCount();
        for (int j = 0; j < i; j++)
            updateSecurityView(mSecurityViewContainer.getChildAt(j));

    }

    private boolean widgetsDisabledByDpm()
    {
        return (1 & mDisabledFeatures) != 0;
    }

    void addWidget(AppWidgetHostView appwidgethostview, int i)
    {
        mAppWidgetContainer.addWidget(appwidgethostview, i);
    }

    public void checkAppWidgetConsistency()
    {
        if (KeyguardUpdateMonitor.getInstance(mContext).hasBootCompleted()) goto _L2; else goto _L1
_L1:
        mCheckAppWidgetConsistencyOnBootCompleted = true;
          goto _L3
_L2:
        int i;
        int j;
        i = mAppWidgetContainer.getChildCount();
        j = 0;
_L9:
        boolean flag = false;
        if (j >= i) goto _L5; else goto _L4
_L4:
        if (!mAppWidgetContainer.isWidgetPage(j)) goto _L7; else goto _L6
_L6:
        flag = true;
_L5:
        if (!flag)
        {
            int k = getInsertPageIndex();
            boolean flag1;
            if (!widgetsDisabledByDpm())
                flag1 = true;
            else
                flag1 = false;
            boolean flag2 = mSafeModeEnabled;
            boolean flag3 = false;
            if (!flag2)
                if (flag1)
                {
                    int i1 = allocateIdForDefaultAppWidget();
                    flag3 = false;
                    if (i1 != 0)
                        flag3 = addWidget(i1, k, true);
                } else
                {
                    int l = mLockPatternUtils.getFallbackAppWidgetId();
                    if (l == 0)
                    {
                        l = allocateIdForDefaultAppWidget();
                        if (l != 0)
                            mLockPatternUtils.writeFallbackAppWidgetId(l);
                    }
                    flag3 = false;
                    if (l != 0)
                    {
                        flag3 = addWidget(l, k, false);
                        if (!flag3)
                        {
                            mAppWidgetHost.deleteAppWidgetId(l);
                            mLockPatternUtils.writeFallbackAppWidgetId(0);
                        }
                    }
                }
            if (!flag3)
                addDefaultStatusWidget(k);
            if (!mSafeModeEnabled && flag1)
            {
                mAppWidgetContainer.onAddView(mAppWidgetContainer.getChildAt(k), k);
                return;
            }
        }
_L3:
        return;
_L7:
        j++;
        if (true) goto _L9; else goto _L8
_L8:
    }

    public void cleanUp()
    {
        System.out.println("chengtao--00");
        if (mCurrentKeyguardSecurityView != null)
        {
            mCurrentKeyguardSecurityView.onPause();
            mCurrentKeyguardSecurityView.setKeyguardCallback(mNullCallback);
            if (SystemProperties.get("ro.rgk.sm611.style").equals("samsun") && mSlidingChallengeLayout != null)
            {
                System.out.println("chengtao--11");
                mSlidingChallengeLayout.setKeyguardCallback(mNullCallback);
            }
        }
        if (mAppWidgetContainer != null)
            mAppWidgetContainer.setCallbacks(null);
        if (SystemProperties.get("ro.rgk.sm611.style").equals("samsun") && mLQLockView != null)
        {
            if (DEBUG)
                KeyguardUtils.xlogD("xing", "cleanUp-----------------2");
            ((KeyguardSecurityView)mLQLockView).onPause();
            ((KeyguardSecurityView)mLQLockView).setKeyguardCallback(mNullCallback);
        }
    }

    public void clearAppWidgetToShow()
    {
        mAppWidgetToShow = 0;
    }

    public void dismiss()
    {
        if (KeyguardUpdateMonitor.getInstance(getContext()).dmIsLocked())
        {
            return;
        } else
        {
            showNextSecurityScreenOrFinish(false, true);
            return;
        }
    }

    protected void dispatchDraw(Canvas canvas)
    {
        super.dispatchDraw(canvas);
        if (!mScreenOn && mViewMediatorCallback != null)
            mViewMediatorCallback.keyguardDoneDrawing();
    }

    public View getCurScreen(Context context, Configuration configuration)
    {
        if (DEBUG_LQ_LOCKVIEW)
            Log.d("KeyguardHostView", "getCurScreen ------------1");
        if (mLQLockViewPKName == null || mLQLockClassName == null)
            return null;
        if (DEBUG_LQ_LOCKVIEW)
            Log.d("KeyguardHostView", "getCurScreen ------------2");
        Context context1;
        Class class1;
        Class aclass[];
        View view;
        try
        {
            context1 = context.createPackageContext(mLQLockViewPKName, 3);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Log.d("KeyguardHostView", (new StringBuilder()).append("getCurScreen -------------createPackageContext  ").append(namenotfoundexception.getMessage()).toString());
            namenotfoundexception.printStackTrace();
            return null;
        }
        if (DEBUG_LQ_LOCKVIEW)
            Log.d("KeyguardHostView", "getCurScreen -------------3");
        try
        {
            class1 = Class.forName(mLQLockClassName, true, context1.getClassLoader());
        }
        catch (ClassNotFoundException classnotfoundexception)
        {
            classnotfoundexception.printStackTrace();
            return null;
        }
        if (DEBUG_LQ_LOCKVIEW)
            Log.d("KeyguardHostView", (new StringBuilder()).append("getCurScreen -------------4 --- ").append(class1).toString());
        aclass = (new Class[] {
            android/content/Context, android/content/Context, android/content/res/Configuration, com/android/internal/policy/impl/keyguard/KeyguardSecurityCallback
        });
        if (DEBUG_LQ_LOCKVIEW)
            Log.d("KeyguardHostView", "getCurScreen -------------41");
        try
        {
            Constructor constructor = class1.getConstructor(aclass);
            if (DEBUG_LQ_LOCKVIEW)
                Log.d("KeyguardHostView", "getCurScreen -------------42");
            Object aobj[] = new Object[4];
            aobj[0] = context1;
            aobj[1] = context;
            aobj[2] = configuration;
            aobj[3] = mCallback;
            view = (View)constructor.newInstance(aobj);
        }
        catch (SecurityException securityexception)
        {
            securityexception.printStackTrace();
            Log.d("KeyguardHostView", (new StringBuilder()).append("getCurScreen -------------err1").append(securityexception.getMessage()).toString());
            return null;
        }
        catch (NoSuchMethodException nosuchmethodexception)
        {
            nosuchmethodexception.printStackTrace();
            Log.d("KeyguardHostView", (new StringBuilder()).append("getCurScreen -------------err2").append(nosuchmethodexception.getMessage()).toString());
            return null;
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            illegalargumentexception.printStackTrace();
            Log.d("KeyguardHostView", (new StringBuilder()).append("getCurScreen -------------err3").append(illegalargumentexception.getMessage()).toString());
            return null;
        }
        catch (InstantiationException instantiationexception)
        {
            instantiationexception.printStackTrace();
            Log.d("KeyguardHostView", (new StringBuilder()).append("getCurScreen -------------err4").append(instantiationexception.getMessage()).toString());
            return null;
        }
        catch (IllegalAccessException illegalaccessexception)
        {
            illegalaccessexception.printStackTrace();
            Log.d("KeyguardHostView", "getCurScreen -------------err5");
            return null;
        }
        catch (InvocationTargetException invocationtargetexception)
        {
            invocationtargetexception.printStackTrace();
            Log.d("KeyguardHostView", "getCurScreen -------------err6");
            return null;
        }
        if (DEBUG_LQ_LOCKVIEW)
            Log.d("KeyguardHostView", "getCurScreen------------5");
        return view;
    }

    public long getUserActivityTimeout()
    {
        if (mAppWidgetContainer != null)
            return mAppWidgetContainer.getUserActivityTimeout();
        else
            return -1L;
    }

    public void goToUserSwitcher()
    {
        mAppWidgetContainer.setCurrentPage(getWidgetPosition(0x10202bf));
    }

    public void goToWidget(int i)
    {
        mAppWidgetToShow = i;
        mSwitchPageRunnable.run();
    }

    public boolean handleBackKey()
    {
        if (mCurrentSecuritySelection != KeyguardSecurityModel.SecurityMode.None)
        {
            dismiss();
            return true;
        } else
        {
            return false;
        }
    }

    public boolean handleMenuKey()
    {
        boolean flag = shouldEnableMenuKey();
        boolean flag1 = false;
        if (flag)
        {
            showNextSecurityScreenOrFinish(false, false);
            flag1 = true;
        }
        return flag1;
    }

    protected boolean hasOnDismissAction()
    {
        return mDismissAction != null;
    }

    public void hideLockPadView()
    {
        if (mLQLockView != null)
            mLQLockView.setVisibility(4);
    }

    public boolean isAlarmUnlockScreen()
    {
        return mSecurityModel.getSecurityMode() == KeyguardSecurityModel.SecurityMode.AlarmBoot;
    }

    boolean isMusicPage(int i)
    {
        return i >= 0 && i == getWidgetPosition(0x102030f);
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        mAppWidgetHost.startListeningAsUser(mUserId);
        KeyguardUpdateMonitor.getInstance(mContext).registerCallback(mUpdateMonitorCallbacks);
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        removeCallbacks(mSwitchPageRunnable);
        mAppWidgetHost.stopListeningAsUser(mUserId);
        KeyguardUpdateMonitor.getInstance(mContext).removeCallback(mUpdateMonitorCallbacks);
    }

    protected void onFinishInflate()
    {
        int i = 0x10202b6;
        int j = 0x10202b5;
        int k = 0x10202b4;
        int l = 0x10202b8;
        if (KeyguardUpdateMonitor.isAlarmBoot())
        {
            i = 0x2100057;
            j = 0x2100056;
            k = 0x2100055;
            l = 0x2100059;
        }
        View view = findViewById(j);
        mAppWidgetContainer = (KeyguardWidgetPager)findViewById(i);
        mAppWidgetContainer.setVisibility(0);
        mAppWidgetContainer.setCallbacks(mWidgetCallbacks);
        mAppWidgetContainer.setDeleteDropTarget(view);
        mAppWidgetContainer.setMinScale(0.5F);
        mSlidingChallengeLayout = (SlidingChallengeLayout)findViewById(0x10202b9);
        mMultiPaneChallengeLayout = (MultiPaneChallengeLayout)findViewById(k);
        if (mSlidingChallengeLayout != null)
            mSlidingChallengeLayout.setOnChallengeScrolledListener(mViewStateManager);
        mAppWidgetContainer.setViewStateManager(mViewStateManager);
        mAppWidgetContainer.setLockPatternUtils(mLockPatternUtils);
        Object obj;
        if (mSlidingChallengeLayout != null)
            obj = mSlidingChallengeLayout;
        else
            obj = mMultiPaneChallengeLayout;
        ((ChallengeLayout) (obj)).setOnBouncerStateChangedListener(mViewStateManager);
        mAppWidgetContainer.setBouncerAnimationDuration(((ChallengeLayout) (obj)).getBouncerAnimationDuration());
        mViewStateManager.setPagedView(mAppWidgetContainer);
        mViewStateManager.setChallengeLayout(((ChallengeLayout) (obj)));
        mSecurityViewContainer = (KeyguardSecurityViewFlipper)findViewById(l);
        mKeyguardSelectorView = (KeyguardSelectorView)findViewById(0x10202fe);
        mViewStateManager.setSecurityViewContainer(mSecurityViewContainer);
        if (!(mContext instanceof Activity))
            setSystemUiVisibility(0x400000 | getSystemUiVisibility());
        if (SystemProperties.get("ro.rgk.sm611.style").equals("samsun"))
        {
            try
            {
                Configuration configuration = getResources().getConfiguration();
                mLQLockView = getCurScreen(mContext, configuration);
                Log.d("KeyguardHostView", "createLockScreen---------1");
            }
            catch (Exception exception)
            {
                exception.printStackTrace();
                Log.d("KeyguardHostView", "createLockScreen---------1------Exception");
                mLQLockView = null;
            }
            if (mLQLockView != null)
            {
                android.widget.FrameLayout.LayoutParams layoutparams = new android.widget.FrameLayout.LayoutParams(-1, -1);
                mLQLockView.setLayoutParams(layoutparams);
                ((FrameLayout)findViewById(0x10202ba)).addView(mLQLockView);
                Log.d("KeyguardHostView", "onFinishInflate---------3");
            }
            Log.d("KeyguardHostView", "onFinishInflate---------4");
        }
        addDefaultWidgets();
        addWidgetsFromSettings();
        if (!shouldEnableAddWidget())
            mAppWidgetContainer.setAddWidgetEnabled(false);
        checkAppWidgetConsistency();
        mSwitchPageRunnable.run();
        mViewStateManager.showUsabilityHints();
        showPrimarySecurityScreen(false);
        updateSecurityViews();
    }

    public void onRestoreInstanceState(Parcelable parcelable)
    {
        if (DEBUG)
            Log.d("KeyguardHostView", "onRestoreInstanceState");
        if (!(parcelable instanceof SavedState))
        {
            super.onRestoreInstanceState(parcelable);
            return;
        } else
        {
            SavedState savedstate = (SavedState)parcelable;
            super.onRestoreInstanceState(savedstate.getSuperState());
            mViewStateManager.setTransportState(savedstate.transportState);
            mAppWidgetToShow = savedstate.appWidgetToShow;
            post(mSwitchPageRunnable);
            return;
        }
    }

    public Parcelable onSaveInstanceState()
    {
        if (DEBUG)
            Log.d("KeyguardHostView", "onSaveInstanceState");
        SavedState savedstate = new SavedState(super.onSaveInstanceState());
        savedstate.transportState = mViewStateManager.getTransportState();
        savedstate.appWidgetToShow = mAppWidgetToShow;
        return savedstate;
    }

    public void onScreenTurnedOff()
    {
        if (DEBUG)
        {
            Object aobj[] = new Object[2];
            aobj[0] = Integer.toHexString(hashCode());
            aobj[1] = Long.valueOf(SystemClock.uptimeMillis());
            Log.d("KeyguardHostView", String.format("screen off, instance %s at %s", aobj));
        }
        mScreenOn = false;
        KeyguardUpdateMonitor.getInstance(mContext).setAlternateUnlockEnabled(true);
        clearAppWidgetToShow();
        checkAppWidgetConsistency();
        showPrimarySecurityScreen(true);
        CameraWidgetFrame camerawidgetframe = findCameraPage();
        if (camerawidgetframe != null)
            camerawidgetframe.onScreenTurnedOff();
        if (mSlidingChallengeLayout != null)
            mSlidingChallengeLayout.hideBouncer();
        mSwitchPageRunnable.run();
        if (SystemProperties.get("ro.rgk.sm611.style").equals("samsun") && mLQLockView != null)
        {
            hideLockPadView();
            ((KeyguardSecurityView)mLQLockView).onPause();
        }
        getSecurityView(mCurrentSecuritySelection).onPause();
        clearFocus();
    }

    public void onScreenTurnedOn()
    {
        if (DEBUG)
            Log.d("KeyguardHostView", (new StringBuilder()).append("screen on, instance ").append(Integer.toHexString(hashCode())).toString());
        mScreenOn = true;
        showPrimarySecurityScreen(false);
        getSecurityView(mCurrentSecuritySelection).onResume(1);
        if (SystemProperties.get("ro.rgk.sm611.style").equals("samsun") && mLQLockView != null)
        {
            showLockPadView();
            ((KeyguardSecurityView)mLQLockView).onResume(1);
        }
        mSwitchPageRunnable.run();
        requestLayout();
        if (mViewStateManager != null)
            mViewStateManager.showUsabilityHints();
        requestFocus();
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        boolean flag = super.onTouchEvent(motionevent);
        mTempRect.set(0, 0, 0, 0);
        offsetRectIntoDescendantCoords(mSecurityViewContainer, mTempRect);
        motionevent.offsetLocation(mTempRect.left, mTempRect.top);
        boolean flag1;
        if (!mSecurityViewContainer.dispatchTouchEvent(motionevent) && !flag)
            flag1 = false;
        else
            flag1 = true;
        motionevent.offsetLocation(-mTempRect.left, -mTempRect.top);
        return flag1;
    }

    public void onUserActivityTimeoutChanged()
    {
        if (mViewMediatorCallback != null)
            mViewMediatorCallback.onUserActivityTimeoutChanged();
    }

    public void onWindowFocusChanged(boolean flag)
    {
        super.onWindowFocusChanged(flag);
        if (DEBUG)
        {
            StringBuilder stringbuilder = (new StringBuilder()).append("Window is ");
            String s;
            if (flag)
                s = "focused";
            else
                s = "unfocused";
            Log.d("KeyguardHostView", stringbuilder.append(s).toString());
        }
        if (flag && mShowSecurityWhenReturn)
        {
            SlidingChallengeLayout slidingchallengelayout = (SlidingChallengeLayout)findViewById(0x10202b9);
            if (slidingchallengelayout != null)
            {
                slidingchallengelayout.setHandleAlpha(1.0F);
                slidingchallengelayout.showChallenge(true);
            }
            mShowSecurityWhenReturn = false;
        }
    }

    public void reset()
    {
        boolean flag;
        if (!mScreenOn)
            flag = true;
        else
            flag = false;
        showPrimarySecurityScreen(flag);
        mIsVerifyUnlockOnly = false;
    }

    void setLockPatternUtils(LockPatternUtils lockpatternutils)
    {
        mSecurityModel.setLockPatternUtils(lockpatternutils);
        mLockPatternUtils = lockpatternutils;
        updateSecurityViews();
    }

    protected void setOnDismissAction(OnDismissAction ondismissaction)
    {
        mDismissAction = ondismissaction;
    }

    public void show()
    {
        if (DEBUG)
            Log.d("KeyguardHostView", "show()");
        showPrimarySecurityScreen(false);
    }

    public void showAssistant()
    {
        Intent intent = ((SearchManager)mContext.getSystemService("search")).getAssistIntent(mContext, -2);
        if (intent == null)
        {
            return;
        } else
        {
            ActivityOptions activityoptions = ActivityOptions.makeCustomAnimation(mContext, 0x10a0027, 0x10a0028, getHandler(), null);
            intent.addFlags(0x10000000);
            mActivityLauncher.launchActivityWithAnimation(intent, false, activityoptions.toBundle(), null, null);
            return;
        }
    }

    public void showLockPadView()
    {
        if (mLQLockView != null)
            mLQLockView.setVisibility(0);
    }

    public boolean showNextSecurityScreenIfPresent()
    {
        KeyguardSecurityModel.SecurityMode securitymode = mSecurityModel.getSecurityMode();
        KeyguardSecurityModel.SecurityMode securitymode1 = mSecurityModel.getAlternateFor(securitymode);
        if (KeyguardSecurityModel.SecurityMode.None == securitymode1)
        {
            return false;
        } else
        {
            showSecurityScreen(securitymode1);
            return true;
        }
    }

    void showPrimarySecurityScreen(boolean flag)
    {
        if (DEBUG)
            KeyguardUtils.xlogD("KeyguardHostView", (new StringBuilder()).append("showPrimarySecurityScreen(turningOff=").append(flag).append(") enter").toString());
        KeyguardSecurityModel.SecurityMode securitymode = mSecurityModel.getSecurityMode();
        if (DEBUG)
            KeyguardUtils.xlogD("KeyguardHostView", (new StringBuilder()).append("showPrimarySecurityScreen query securityMode finish securityMode=").append(securitymode).toString());
        if (KeyguardUpdateMonitor.getInstance(mContext).isAlternateUnlockEnabled())
        {
            KeyguardSecurityModel.SecurityMode securitymode1 = mSecurityModel.getAlternateFor(securitymode);
            if (DEBUG)
                KeyguardUtils.xlogD("KeyguardHostView", (new StringBuilder()).append("showPrimarySecurityScreen alternateMode = ").append(securitymode1).toString());
            if (!flag)
                securitymode = securitymode1;
            else
            if (securitymode != securitymode1)
                return;
        }
        if (DEBUG)
            KeyguardUtils.xlogD("KeyguardHostView", "showPrimarySecurityScreen getAlternateFor finish");
        showSecurityScreen(securitymode);
        if (mSlidingChallengeLayout != null)
            if ((mCurrentKeyguardSecurityView instanceof KeyguardSimPinPukView) && !mLaunchingCamera)
            {
                mSlidingChallengeLayout.showChallenge(true);
            } else
            {
                int i = getResources().getDimensionPixelSize(0x20d0037);
                if (mSlidingChallengeLayout.getMaxChallengeTop() > 0 && mSlidingChallengeLayout.getMaxChallengeTop() < i && mAppWidgetContainer != null && mAppWidgetContainer.getVisibility() == 0)
                    mAppWidgetContainer.setStatusWidgetIsCompletelyShown(false);
            }
        if (DEBUG)
            KeyguardUtils.xlogD("KeyguardHostView", (new StringBuilder()).append("showPrimarySecurityScreen(turningOff=").append(flag).append(") exit").toString());
    }

    void updateKeyguardLayerVisibility()
    {
        if (mSlidingChallengeLayout != null)
            mSlidingChallengeLayout.updateKeyguardLayerVisibility(mKeyaugerLayerVisibility);
        else
        if (mMultiPaneChallengeLayout != null)
        {
            mMultiPaneChallengeLayout.updateKeyguardLayerVisibility(mKeyaugerLayerVisibility);
            return;
        }
    }

    public void userActivity()
    {
        if (mViewMediatorCallback != null)
            mViewMediatorCallback.userActivity();
    }

    public void verifyUnlock()
    {
        KeyguardSecurityModel.SecurityMode securitymode;
label0:
        {
            securitymode = mSecurityModel.getSecurityMode();
            if (securitymode == KeyguardSecurityModel.SecurityMode.None)
            {
                if (mViewMediatorCallback != null)
                    mViewMediatorCallback.keyguardDone(true);
            } else
            {
                if (securitymode == KeyguardSecurityModel.SecurityMode.Pattern || securitymode == KeyguardSecurityModel.SecurityMode.PIN || securitymode == KeyguardSecurityModel.SecurityMode.Password)
                    break label0;
                if (mViewMediatorCallback != null)
                {
                    mViewMediatorCallback.keyguardDone(false);
                    return;
                }
            }
            return;
        }
        mIsVerifyUnlockOnly = true;
        showSecurityScreen(securitymode);
    }

    public void wakeWhenReadyTq(int i)
    {
        if (DEBUG)
            Log.d("KeyguardHostView", "onWakeKey");
        if (i == 82 && isSecure())
        {
            if (DEBUG)
                Log.d("KeyguardHostView", "switching screens to unlock screen because wake key was MENU");
            showSecurityScreen(KeyguardSecurityModel.SecurityMode.None);
        } else
        if (DEBUG)
            Log.d("KeyguardHostView", "poking wake lock immediately");
        if (mViewMediatorCallback != null)
            mViewMediatorCallback.wakeUp();
    }

    static 
    {
        DEBUG = true;
        IS_Tablet = "tablet".equals(SystemProperties.get("ro.build.characteristics"));
    }



/*
    static boolean access$002(KeyguardHostView keyguardhostview, boolean flag)
    {
        keyguardhostview.mCheckAppWidgetConsistencyOnBootCompleted = flag;
        return flag;
    }

*/




/*
    static boolean access$102(KeyguardHostView keyguardhostview, boolean flag)
    {
        keyguardhostview.mCleanupAppWidgetsOnBootCompleted = flag;
        return flag;
    }

*/






/*
    static boolean access$1502(KeyguardHostView keyguardhostview, boolean flag)
    {
        keyguardhostview.mKeyaugerLayerVisibility = flag;
        return flag;
    }

*/




/*
    static boolean access$1802(KeyguardHostView keyguardhostview, boolean flag)
    {
        keyguardhostview.mLaunchingCamera = flag;
        return flag;
    }

*/

















}
