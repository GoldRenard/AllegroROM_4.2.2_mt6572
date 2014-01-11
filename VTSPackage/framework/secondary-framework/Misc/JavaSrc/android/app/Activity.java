// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.*;
import android.content.pm.*;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.*;
import android.text.*;
import android.text.method.TextKeyListener;
import android.util.*;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import com.android.internal.app.ActionBarImpl;
import com.android.internal.policy.PolicyManager;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.*;

// Referenced classes of package android.app:
//            FragmentManagerImpl, Dialog, SearchManager, ActivityManagerNative, 
//            ActivityThread, IActivityManager, Instrumentation, PendingIntent, 
//            Fragment, LoaderManagerImpl, Application, TaskStackBuilder, 
//            SuperNotCalledException, FragmentContainer, ActionBar, FragmentManager, 
//            LoaderManager

public class Activity extends ContextThemeWrapper
    implements android.view.LayoutInflater.Factory2, android.view.Window.Callback, android.view.KeyEvent.Callback, android.view.View.OnCreateContextMenuListener, ComponentCallbacks2
{
    private static final class ManagedCursor
    {

        private final Cursor mCursor;
        private boolean mReleased;
        private boolean mUpdated;




/*
        static boolean access$202(ManagedCursor managedcursor, boolean flag)
        {
            managedcursor.mReleased = flag;
            return flag;
        }

*/



/*
        static boolean access$302(ManagedCursor managedcursor, boolean flag)
        {
            managedcursor.mUpdated = flag;
            return flag;
        }

*/

        ManagedCursor(Cursor cursor)
        {
            mCursor = cursor;
            mReleased = false;
            mUpdated = false;
        }
    }

    private static class ManagedDialog
    {

        Bundle mArgs;
        Dialog mDialog;

        private ManagedDialog()
        {
        }

    }

    static final class NonConfigurationInstances
    {

        Object activity;
        HashMap children;
        ArrayList fragments;
        HashMap loaders;

    }


    private static final boolean DEBUG_LIFECYCLE = false;
    public static final int DEFAULT_KEYS_DIALER = 1;
    public static final int DEFAULT_KEYS_DISABLE = 0;
    public static final int DEFAULT_KEYS_SEARCH_GLOBAL = 4;
    public static final int DEFAULT_KEYS_SEARCH_LOCAL = 3;
    public static final int DEFAULT_KEYS_SHORTCUT = 2;
    protected static final int FOCUSED_STATE_SET[] = {
        0x101009c
    };
    static final String FRAGMENTS_TAG = "android:fragments";
    public static final int RESULT_CANCELED = 0;
    public static final int RESULT_FIRST_USER = 1;
    public static final int RESULT_OK = -1;
    private static final String SAVED_DIALOGS_TAG = "android:savedDialogs";
    private static final String SAVED_DIALOG_ARGS_KEY_PREFIX = "android:dialog_args_";
    private static final String SAVED_DIALOG_IDS_KEY = "android:savedDialogIds";
    private static final String SAVED_DIALOG_KEY_PREFIX = "android:dialog_";
    private static final String TAG = "Activity";
    private static final String WINDOW_HIERARCHY_TAG = "android:viewHierarchyState";
    ActionBarImpl mActionBar;
    ActivityInfo mActivityInfo;
    HashMap mAllLoaderManagers;
    private Application mApplication;
    boolean mCalled;
    boolean mChangingConfigurations;
    boolean mCheckedForLoaderManager;
    private ComponentName mComponent;
    int mConfigChangeFlags;
    final FragmentContainer mContainer = new FragmentContainer() {

        final Activity this$0;

        public View findViewById(int i)
        {
            return Activity.this.findViewById(i);
        }

            
            {
                this$0 = Activity.this;
                super();
            }
    }
;
    Configuration mCurrentConfig;
    View mDecor;
    private int mDefaultKeyMode;
    private SpannableStringBuilder mDefaultKeySsb;
    private boolean mDestroyed;
    String mEmbeddedID;
    private boolean mEnableDefaultActionBarUp;
    boolean mFinished;
    final FragmentManagerImpl mFragments = new FragmentManagerImpl();
    final Handler mHandler = new Handler();
    private int mIdent;
    private final Object mInstanceTracker = StrictMode.trackActivity(this);
    private Instrumentation mInstrumentation;
    Intent mIntent;
    NonConfigurationInstances mLastNonConfigurationInstances;
    LoaderManagerImpl mLoaderManager;
    boolean mLoadersStarted;
    ActivityThread mMainThread;
    private final ArrayList mManagedCursors = new ArrayList();
    private SparseArray mManagedDialogs;
    private MenuInflater mMenuInflater;
    Activity mParent;
    int mResultCode;
    Intent mResultData;
    boolean mResumed;
    private SearchManager mSearchManager;
    boolean mStartedActivity;
    private boolean mStopped;
    boolean mTemporaryPause;
    private CharSequence mTitle;
    private int mTitleColor;
    private boolean mTitleReady;
    private IBinder mToken;
    private Thread mUiThread;
    boolean mVisibleFromClient;
    boolean mVisibleFromServer;
    private Window mWindow;
    boolean mWindowAdded;
    private WindowManager mWindowManager;

    public Activity()
    {
        mTemporaryPause = false;
        mChangingConfigurations = false;
        mDecor = null;
        mWindowAdded = false;
        mVisibleFromServer = false;
        mVisibleFromClient = true;
        mActionBar = null;
        mTitleColor = 0;
        mResultCode = 0;
        mResultData = null;
        mTitleReady = false;
        mDefaultKeyMode = 0;
        mDefaultKeySsb = null;
    }

    private Dialog createDialog(Integer integer, Bundle bundle, Bundle bundle1)
    {
        Dialog dialog = onCreateDialog(integer.intValue(), bundle1);
        if (dialog == null)
        {
            return null;
        } else
        {
            dialog.dispatchOnCreate(bundle);
            return dialog;
        }
    }

    private void dumpViewHierarchy(String s, PrintWriter printwriter, View view)
    {
        printwriter.print(s);
        if (view == null)
        {
            printwriter.println("null");
        } else
        {
            printwriter.println(view.toString());
            if (view instanceof ViewGroup)
            {
                ViewGroup viewgroup = (ViewGroup)view;
                int i = viewgroup.getChildCount();
                if (i > 0)
                {
                    String s1 = (new StringBuilder()).append(s).append("  ").toString();
                    for (int j = 0; j < i; j++)
                        dumpViewHierarchy(s1, printwriter, viewgroup.getChildAt(j));

                }
            }
        }
    }

    private void ensureSearchManager()
    {
        if (mSearchManager != null)
        {
            return;
        } else
        {
            mSearchManager = new SearchManager(this, null);
            return;
        }
    }

    private void initActionBar()
    {
        Window window = getWindow();
        window.getDecorView();
        if (!isChild() && window.hasFeature(8) && mActionBar == null)
        {
            mActionBar = new ActionBarImpl(this);
            mActionBar.setDefaultDisplayHomeAsUpEnabled(mEnableDefaultActionBarUp);
            return;
        } else
        {
            return;
        }
    }

    private IllegalArgumentException missingDialog(int i)
    {
        return new IllegalArgumentException((new StringBuilder()).append("no dialog with id ").append(i).append(" was ever ").append("shown via Activity#showDialog").toString());
    }

    private void restoreManagedDialogs(Bundle bundle)
    {
        Bundle bundle1 = bundle.getBundle("android:savedDialogs");
        if (bundle1 != null)
        {
            int ai[] = bundle1.getIntArray("android:savedDialogIds");
            int i = ai.length;
            mManagedDialogs = new SparseArray(i);
            for (int j = 0; j < i; j++)
            {
                Integer integer = Integer.valueOf(ai[j]);
                Bundle bundle2 = bundle1.getBundle(savedDialogKeyFor(integer.intValue()));
                if (bundle2 == null)
                    continue;
                ManagedDialog manageddialog = new ManagedDialog();
                manageddialog.mArgs = bundle1.getBundle(savedDialogArgsKeyFor(integer.intValue()));
                manageddialog.mDialog = createDialog(integer, bundle2, manageddialog.mArgs);
                if (manageddialog.mDialog != null)
                {
                    mManagedDialogs.put(integer.intValue(), manageddialog);
                    onPrepareDialog(integer.intValue(), manageddialog.mDialog, manageddialog.mArgs);
                    manageddialog.mDialog.onRestoreInstanceState(bundle2);
                }
            }

        }
    }

    private void saveManagedDialogs(Bundle bundle)
    {
        if (mManagedDialogs != null)
        {
            int i = mManagedDialogs.size();
            if (i != 0)
            {
                Bundle bundle1 = new Bundle();
                int ai[] = new int[mManagedDialogs.size()];
                for (int j = 0; j < i; j++)
                {
                    int k = mManagedDialogs.keyAt(j);
                    ai[j] = k;
                    ManagedDialog manageddialog = (ManagedDialog)mManagedDialogs.valueAt(j);
                    bundle1.putBundle(savedDialogKeyFor(k), manageddialog.mDialog.onSaveInstanceState());
                    if (manageddialog.mArgs != null)
                        bundle1.putBundle(savedDialogArgsKeyFor(k), manageddialog.mArgs);
                }

                bundle1.putIntArray("android:savedDialogIds", ai);
                bundle.putBundle("android:savedDialogs", bundle1);
                return;
            }
        }
    }

    private static String savedDialogArgsKeyFor(int i)
    {
        return (new StringBuilder()).append("android:dialog_args_").append(i).toString();
    }

    private static String savedDialogKeyFor(int i)
    {
        return (new StringBuilder()).append("android:dialog_").append(i).toString();
    }

    private void startIntentSenderForResultInner(IntentSender intentsender, int i, Intent intent, int j, int k, Activity activity, Bundle bundle)
        throws android.content.IntentSender.SendIntentException
    {
        String s;
        s = null;
        if (intent == null)
            break MISSING_BLOCK_LABEL_22;
        intent.setAllowFds(false);
        s = intent.resolveTypeIfNeeded(getContentResolver());
        int l = ActivityManagerNative.getDefault().startActivityIntentSender(mMainThread.getApplicationThread(), intentsender, intent, s, mToken, activity.mEmbeddedID, i, j, k, bundle);
        if (l != -6)
            break MISSING_BLOCK_LABEL_86;
        try
        {
            throw new android.content.IntentSender.SendIntentException();
        }
        catch (RemoteException remoteexception) { }
_L1:
        if (i >= 0)
            mStartedActivity = true;
        return;
        Instrumentation.checkStartActivityResult(l, null);
          goto _L1
    }

    public void addContentView(View view, android.view.ViewGroup.LayoutParams layoutparams)
    {
        getWindow().addContentView(view, layoutparams);
        initActionBar();
    }

    final void attach(Context context, ActivityThread activitythread, Instrumentation instrumentation, IBinder ibinder, int i, Application application, Intent intent, 
            ActivityInfo activityinfo, CharSequence charsequence, Activity activity, String s, NonConfigurationInstances nonconfigurationinstances, Configuration configuration)
    {
        attachBaseContext(context);
        mFragments.attachActivity(this, mContainer, null);
        mWindow = PolicyManager.makeNewWindow(this);
        mWindow.setCallback(this);
        mWindow.getLayoutInflater().setPrivateFactory(this);
        if (activityinfo.softInputMode != 0)
            mWindow.setSoftInputMode(activityinfo.softInputMode);
        if (activityinfo.uiOptions != 0)
            mWindow.setUiOptions(activityinfo.uiOptions);
        mUiThread = Thread.currentThread();
        mMainThread = activitythread;
        mInstrumentation = instrumentation;
        mToken = ibinder;
        mIdent = i;
        mApplication = application;
        mIntent = intent;
        mComponent = intent.getComponent();
        mActivityInfo = activityinfo;
        mTitle = charsequence;
        mParent = activity;
        mEmbeddedID = s;
        mLastNonConfigurationInstances = nonconfigurationinstances;
        Window window = mWindow;
        WindowManager windowmanager = (WindowManager)context.getSystemService("window");
        IBinder ibinder1 = mToken;
        String s1 = mComponent.flattenToString();
        boolean flag;
        if ((0x200 & activityinfo.flags) != 0)
            flag = true;
        else
            flag = false;
        window.setWindowManager(windowmanager, ibinder1, s1, flag);
        if (mParent != null)
            mWindow.setContainer(mParent.getWindow());
        mWindowManager = mWindow.getWindowManager();
        mCurrentConfig = configuration;
    }

    final void attach(Context context, ActivityThread activitythread, Instrumentation instrumentation, IBinder ibinder, Application application, Intent intent, ActivityInfo activityinfo, 
            CharSequence charsequence, Activity activity, String s, NonConfigurationInstances nonconfigurationinstances, Configuration configuration)
    {
        attach(context, activitythread, instrumentation, ibinder, 0, application, intent, activityinfo, charsequence, activity, s, nonconfigurationinstances, configuration);
    }

    public void closeContextMenu()
    {
        mWindow.closePanel(6);
    }

    public void closeOptionsMenu()
    {
        mWindow.closePanel(0);
    }

    public PendingIntent createPendingResult(int i, Intent intent, int j)
    {
        String s = getPackageName();
        IActivityManager iactivitymanager;
        IBinder ibinder;
        intent.setAllowFds(false);
        iactivitymanager = ActivityManagerNative.getDefault();
        if (mParent != null)
            break MISSING_BLOCK_LABEL_77;
        ibinder = mToken;
_L1:
        android.content.IIntentSender iintentsender = iactivitymanager.getIntentSender(3, s, ibinder, mEmbeddedID, i, new Intent[] {
            intent
        }, null, j, null, UserHandle.myUserId());
        if (iintentsender == null)
            break MISSING_BLOCK_LABEL_89;
        return new PendingIntent(iintentsender);
        ibinder = mParent.mToken;
          goto _L1
        return null;
        RemoteException remoteexception;
        remoteexception;
        return null;
    }

    public final void dismissDialog(int i)
    {
        if (mManagedDialogs == null)
            throw missingDialog(i);
        ManagedDialog manageddialog = (ManagedDialog)mManagedDialogs.get(i);
        if (manageddialog == null)
        {
            throw missingDialog(i);
        } else
        {
            manageddialog.mDialog.dismiss();
            return;
        }
    }

    void dispatchActivityResult(String s, int i, int j, Intent intent)
    {
        mFragments.noteStateNotSaved();
        if (s == null)
        {
            onActivityResult(i, j, intent);
        } else
        {
            Fragment fragment = mFragments.findFragmentByWho(s);
            if (fragment != null)
            {
                fragment.onActivityResult(i, j, intent);
                return;
            }
        }
    }

    public boolean dispatchGenericMotionEvent(MotionEvent motionevent)
    {
        onUserInteraction();
        if (getWindow().superDispatchGenericMotionEvent(motionevent))
            return true;
        else
            return onGenericMotionEvent(motionevent);
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        onUserInteraction();
        Window window = getWindow();
        if (window.superDispatchKeyEvent(keyevent))
            return true;
        View view = mDecor;
        if (view == null)
            view = window.getDecorView();
        android.view.KeyEvent.DispatcherState dispatcherstate;
        if (view != null)
            dispatcherstate = view.getKeyDispatcherState();
        else
            dispatcherstate = null;
        return keyevent.dispatch(this, dispatcherstate, this);
    }

    public boolean dispatchKeyShortcutEvent(KeyEvent keyevent)
    {
        onUserInteraction();
        if (getWindow().superDispatchKeyShortcutEvent(keyevent))
            return true;
        else
            return onKeyShortcut(keyevent.getKeyCode(), keyevent);
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        accessibilityevent.setClassName(getClass().getName());
        accessibilityevent.setPackageName(getPackageName());
        android.view.WindowManager.LayoutParams layoutparams = getWindow().getAttributes();
        boolean flag;
        if (((android.view.ViewGroup.LayoutParams) (layoutparams)).width == -1 && ((android.view.ViewGroup.LayoutParams) (layoutparams)).height == -1)
            flag = true;
        else
            flag = false;
        accessibilityevent.setFullScreen(flag);
        CharSequence charsequence = getTitle();
        if (!TextUtils.isEmpty(charsequence))
            accessibilityevent.getText().add(charsequence);
        return true;
    }

    public boolean dispatchTouchEvent(MotionEvent motionevent)
    {
        if (motionevent.getAction() == 0)
            onUserInteraction();
        if (getWindow().superDispatchTouchEvent(motionevent))
            return true;
        else
            return onTouchEvent(motionevent);
    }

    public boolean dispatchTrackballEvent(MotionEvent motionevent)
    {
        onUserInteraction();
        if (getWindow().superDispatchTrackballEvent(motionevent))
            return true;
        else
            return onTrackballEvent(motionevent);
    }

    public void dump(String s, FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
    {
        dumpInner(s, filedescriptor, printwriter, as);
    }

    void dumpInner(String s, FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
    {
        printwriter.print(s);
        printwriter.print("Local Activity ");
        printwriter.print(Integer.toHexString(System.identityHashCode(this)));
        printwriter.println(" State:");
        String s1 = (new StringBuilder()).append(s).append("  ").toString();
        printwriter.print(s1);
        printwriter.print("mResumed=");
        printwriter.print(mResumed);
        printwriter.print(" mStopped=");
        printwriter.print(mStopped);
        printwriter.print(" mFinished=");
        printwriter.println(mFinished);
        printwriter.print(s1);
        printwriter.print("mLoadersStarted=");
        printwriter.println(mLoadersStarted);
        printwriter.print(s1);
        printwriter.print("mChangingConfigurations=");
        printwriter.println(mChangingConfigurations);
        printwriter.print(s1);
        printwriter.print("mCurrentConfig=");
        printwriter.println(mCurrentConfig);
        if (mLoaderManager != null)
        {
            printwriter.print(s);
            printwriter.print("Loader Manager ");
            printwriter.print(Integer.toHexString(System.identityHashCode(mLoaderManager)));
            printwriter.println(":");
            mLoaderManager.dump((new StringBuilder()).append(s).append("  ").toString(), filedescriptor, printwriter, as);
        }
        mFragments.dump(s, filedescriptor, printwriter, as);
        printwriter.print(s);
        printwriter.println("View Hierarchy:");
        dumpViewHierarchy((new StringBuilder()).append(s).append("  ").toString(), printwriter, getWindow().getDecorView());
    }

    public View findViewById(int i)
    {
        return getWindow().findViewById(i);
    }

    public void finish()
    {
        if (mParent != null)
            break MISSING_BLOCK_LABEL_58;
        this;
        JVM INSTR monitorenter ;
        int i;
        Intent intent;
        i = mResultCode;
        intent = mResultData;
        this;
        JVM INSTR monitorexit ;
        if (intent == null)
            break MISSING_BLOCK_LABEL_30;
        intent.setAllowFds(false);
        if (ActivityManagerNative.getDefault().finishActivity(mToken, i, intent))
            mFinished = true;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        mParent.finishFromChild(this);
        return;
        RemoteException remoteexception;
        remoteexception;
    }

    public void finishActivity(int i)
    {
        if (mParent == null)
        {
            try
            {
                ActivityManagerNative.getDefault().finishSubActivity(mToken, mEmbeddedID, i);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
        } else
        {
            mParent.finishActivityFromChild(this, i);
            return;
        }
    }

    public void finishActivityFromChild(Activity activity, int i)
    {
        try
        {
            ActivityManagerNative.getDefault().finishSubActivity(mToken, activity.mEmbeddedID, i);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void finishAffinity()
    {
        if (mParent != null)
            throw new IllegalStateException("Can not be called from an embedded activity");
        if (mResultCode != 0 || mResultData != null)
            throw new IllegalStateException("Can not be called to deliver a result");
        try
        {
            if (ActivityManagerNative.getDefault().finishActivityAffinity(mToken))
                mFinished = true;
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void finishFromChild(Activity activity)
    {
        finish();
    }

    public ActionBar getActionBar()
    {
        initActionBar();
        return mActionBar;
    }

    public final IBinder getActivityToken()
    {
        if (mParent != null)
            return mParent.getActivityToken();
        else
            return mToken;
    }

    public final Application getApplication()
    {
        return mApplication;
    }

    public ComponentName getCallingActivity()
    {
        ComponentName componentname;
        try
        {
            componentname = ActivityManagerNative.getDefault().getCallingActivity(mToken);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return componentname;
    }

    public String getCallingPackage()
    {
        String s;
        try
        {
            s = ActivityManagerNative.getDefault().getCallingPackage(mToken);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return s;
    }

    public int getChangingConfigurations()
    {
        return mConfigChangeFlags;
    }

    public ComponentName getComponentName()
    {
        return mComponent;
    }

    public View getCurrentFocus()
    {
        if (mWindow != null)
            return mWindow.getCurrentFocus();
        else
            return null;
    }

    public FragmentManager getFragmentManager()
    {
        return mFragments;
    }

    public Intent getIntent()
    {
        return mIntent;
    }

    HashMap getLastNonConfigurationChildInstances()
    {
        if (mLastNonConfigurationInstances != null)
            return mLastNonConfigurationInstances.children;
        else
            return null;
    }

    public Object getLastNonConfigurationInstance()
    {
        if (mLastNonConfigurationInstances != null)
            return mLastNonConfigurationInstances.activity;
        else
            return null;
    }

    public LayoutInflater getLayoutInflater()
    {
        return getWindow().getLayoutInflater();
    }

    public LoaderManager getLoaderManager()
    {
        if (mLoaderManager != null)
        {
            return mLoaderManager;
        } else
        {
            mCheckedForLoaderManager = true;
            mLoaderManager = getLoaderManager(null, mLoadersStarted, true);
            return mLoaderManager;
        }
    }

    LoaderManagerImpl getLoaderManager(String s, boolean flag, boolean flag1)
    {
        if (mAllLoaderManagers == null)
            mAllLoaderManagers = new HashMap();
        LoaderManagerImpl loadermanagerimpl = (LoaderManagerImpl)mAllLoaderManagers.get(s);
        if (loadermanagerimpl == null)
        {
            if (flag1)
            {
                loadermanagerimpl = new LoaderManagerImpl(s, this, flag);
                mAllLoaderManagers.put(s, loadermanagerimpl);
            }
            return loadermanagerimpl;
        } else
        {
            loadermanagerimpl.updateActivity(this);
            return loadermanagerimpl;
        }
    }

    public String getLocalClassName()
    {
        String s = getPackageName();
        String s1 = mComponent.getClassName();
        int i = s.length();
        if (s1.startsWith(s) && s1.length() > i && s1.charAt(i) == '.')
            return s1.substring(i + 1);
        else
            return s1;
    }

    public MenuInflater getMenuInflater()
    {
        if (mMenuInflater == null)
        {
            initActionBar();
            if (mActionBar != null)
                mMenuInflater = new MenuInflater(mActionBar.getThemedContext(), this);
            else
                mMenuInflater = new MenuInflater(this);
        }
        return mMenuInflater;
    }

    public final Activity getParent()
    {
        return mParent;
    }

    public Intent getParentActivityIntent()
    {
        String s;
        ComponentName componentname;
        s = mActivityInfo.parentActivityName;
        if (TextUtils.isEmpty(s))
            return null;
        componentname = new ComponentName(this, s);
        Intent intent1;
label0:
        {
            if (getPackageManager().getActivityInfo(componentname, 0).parentActivityName == null)
            {
                intent1 = Intent.makeMainActivity(componentname);
                break label0;
            }
            Intent intent;
            try
            {
                intent = (new Intent()).setComponent(componentname);
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
            {
                Log.e("Activity", (new StringBuilder()).append("getParentActivityIntent: bad parentActivityName '").append(s).append("' in manifest").toString());
                return null;
            }
            intent1 = intent;
        }
        return intent1;
    }

    public SharedPreferences getPreferences(int i)
    {
        return getSharedPreferences(getLocalClassName(), i);
    }

    public int getRequestedOrientation()
    {
        if (mParent == null)
        {
            int i;
            try
            {
                i = ActivityManagerNative.getDefault().getRequestedOrientation(mToken);
            }
            catch (RemoteException remoteexception)
            {
                return -1;
            }
            return i;
        } else
        {
            return mParent.getRequestedOrientation();
        }
    }

    public Object getSystemService(String s)
    {
        if (getBaseContext() == null)
            throw new IllegalStateException("System services not available to Activities before onCreate()");
        if ("window".equals(s))
            return mWindowManager;
        if ("search".equals(s))
        {
            ensureSearchManager();
            return mSearchManager;
        } else
        {
            return super.getSystemService(s);
        }
    }

    public int getTaskId()
    {
        int i;
        try
        {
            i = ActivityManagerNative.getDefault().getTaskForActivity(mToken, false);
        }
        catch (RemoteException remoteexception)
        {
            return -1;
        }
        return i;
    }

    public final CharSequence getTitle()
    {
        return mTitle;
    }

    public final int getTitleColor()
    {
        return mTitleColor;
    }

    public final int getVolumeControlStream()
    {
        return getWindow().getVolumeControlStream();
    }

    public Window getWindow()
    {
        return mWindow;
    }

    public WindowManager getWindowManager()
    {
        return mWindowManager;
    }

    public boolean hasWindowFocus()
    {
        Window window = getWindow();
        if (window != null)
        {
            View view = window.getDecorView();
            if (view != null)
                return view.hasWindowFocus();
        }
        return false;
    }

    void invalidateFragment(String s)
    {
        if (mAllLoaderManagers != null)
        {
            LoaderManagerImpl loadermanagerimpl = (LoaderManagerImpl)mAllLoaderManagers.get(s);
            if (loadermanagerimpl != null && !loadermanagerimpl.mRetaining)
            {
                loadermanagerimpl.doDestroy();
                mAllLoaderManagers.remove(s);
            }
        }
    }

    public void invalidateOptionsMenu()
    {
        mWindow.invalidatePanelMenu(0);
    }

    public boolean isChangingConfigurations()
    {
        return mChangingConfigurations;
    }

    public final boolean isChild()
    {
        return mParent != null;
    }

    public boolean isDestroyed()
    {
        return mDestroyed;
    }

    public boolean isFinishing()
    {
        return mFinished;
    }

    public boolean isImmersive()
    {
        boolean flag;
        try
        {
            flag = ActivityManagerNative.getDefault().isImmersive(mToken);
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
    }

    public final boolean isResumed()
    {
        return mResumed;
    }

    public boolean isTaskRoot()
    {
        int i;
        try
        {
            i = ActivityManagerNative.getDefault().getTaskForActivity(mToken, true);
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return i >= 0;
    }

    void makeVisible()
    {
        if (!mWindowAdded)
        {
            getWindowManager().addView(mDecor, getWindow().getAttributes());
            mWindowAdded = true;
        }
        mDecor.setVisibility(0);
    }

    public final Cursor managedQuery(Uri uri, String as[], String s, String s1)
    {
        Cursor cursor = getContentResolver().query(uri, as, s, null, s1);
        if (cursor != null)
            startManagingCursor(cursor);
        return cursor;
    }

    public final Cursor managedQuery(Uri uri, String as[], String s, String as1[], String s1)
    {
        Cursor cursor = getContentResolver().query(uri, as, s, as1, s1);
        if (cursor != null)
            startManagingCursor(cursor);
        return cursor;
    }

    public boolean moveTaskToBack(boolean flag)
    {
        boolean flag1;
        try
        {
            flag1 = ActivityManagerNative.getDefault().moveActivityTaskToBack(mToken, flag);
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag1;
    }

    public boolean navigateUpTo(Intent intent)
    {
        Intent intent2;
        if (mParent != null)
            break MISSING_BLOCK_LABEL_108;
        if (intent.getComponent() != null)
            break MISSING_BLOCK_LABEL_52;
        ComponentName componentname = intent.resolveActivity(getPackageManager());
        if (componentname == null)
            return false;
        intent2 = new Intent(intent);
        intent2.setComponent(componentname);
        intent = intent2;
        this;
        JVM INSTR monitorenter ;
        int i;
        Intent intent1;
        i = mResultCode;
        intent1 = mResultData;
        this;
        JVM INSTR monitorexit ;
        if (intent1 != null)
            intent1.setAllowFds(false);
        Exception exception;
        boolean flag;
        try
        {
            flag = ActivityManagerNative.getDefault().navigateUpTo(mToken, intent, i, intent1);
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        return mParent.navigateUpToFromChild(this, intent);
    }

    public boolean navigateUpToFromChild(Activity activity, Intent intent)
    {
        return navigateUpTo(intent);
    }

    public void onActionModeFinished(ActionMode actionmode)
    {
    }

    public void onActionModeStarted(ActionMode actionmode)
    {
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
    }

    protected void onApplyThemeResource(android.content.res.Resources.Theme theme, int i, boolean flag)
    {
        if (mParent == null)
        {
            super.onApplyThemeResource(theme, i, flag);
            return;
        }
        try
        {
            theme.setTo(mParent.getTheme());
        }
        catch (Exception exception) { }
        theme.applyStyle(i, false);
    }

    public void onAttachFragment(Fragment fragment)
    {
    }

    public void onAttachedToWindow()
    {
    }

    public void onBackPressed()
    {
        if (!mFragments.popBackStackImmediate())
            finish();
    }

    protected void onChildTitleChanged(Activity activity, CharSequence charsequence)
    {
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        mCalled = true;
        mFragments.dispatchConfigurationChanged(configuration);
        if (mWindow != null)
            mWindow.onConfigurationChanged(configuration);
        if (mActionBar != null)
            mActionBar.onConfigurationChanged(configuration);
    }

    public void onContentChanged()
    {
    }

    public boolean onContextItemSelected(MenuItem menuitem)
    {
        if (mParent != null)
            return mParent.onContextItemSelected(menuitem);
        else
            return false;
    }

    public void onContextMenuClosed(Menu menu)
    {
        if (mParent != null)
            mParent.onContextMenuClosed(menu);
    }

    protected void onCreate(Bundle bundle)
    {
        if (mLastNonConfigurationInstances != null)
            mAllLoaderManagers = mLastNonConfigurationInstances.loaders;
        if (mActivityInfo.parentActivityName != null)
            if (mActionBar == null)
                mEnableDefaultActionBarUp = true;
            else
                mActionBar.setDefaultDisplayHomeAsUpEnabled(true);
        if (bundle != null)
        {
            android.os.Parcelable parcelable = bundle.getParcelable("android:fragments");
            FragmentManagerImpl fragmentmanagerimpl = mFragments;
            ArrayList arraylist;
            if (mLastNonConfigurationInstances != null)
                arraylist = mLastNonConfigurationInstances.fragments;
            else
                arraylist = null;
            fragmentmanagerimpl.restoreAllState(parcelable, arraylist);
        }
        mFragments.dispatchCreate();
        getApplication().dispatchActivityCreated(this, bundle);
        mCalled = true;
    }

    public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
    {
    }

    public CharSequence onCreateDescription()
    {
        return null;
    }

    protected Dialog onCreateDialog(int i)
    {
        return null;
    }

    protected Dialog onCreateDialog(int i, Bundle bundle)
    {
        return onCreateDialog(i);
    }

    public void onCreateNavigateUpTaskStack(TaskStackBuilder taskstackbuilder)
    {
        taskstackbuilder.addParentStack(this);
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        if (mParent != null)
            return mParent.onCreateOptionsMenu(menu);
        else
            return true;
    }

    public boolean onCreatePanelMenu(int i, Menu menu)
    {
        if (i == 0)
            return onCreateOptionsMenu(menu) | mFragments.dispatchCreateOptionsMenu(menu, getMenuInflater());
        else
            return false;
    }

    public View onCreatePanelView(int i)
    {
        return null;
    }

    public boolean onCreateThumbnail(Bitmap bitmap, Canvas canvas)
    {
        return false;
    }

    public View onCreateView(View view, String s, Context context, AttributeSet attributeset)
    {
        if (!"fragment".equals(s))
            return onCreateView(s, context, attributeset);
        String s1 = attributeset.getAttributeValue(null, "class");
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.Fragment);
        if (s1 == null)
            s1 = typedarray.getString(0);
        int i = typedarray.getResourceId(1, -1);
        String s2 = typedarray.getString(2);
        typedarray.recycle();
        int j = 0;
        if (view != null)
            j = view.getId();
        if (j == -1 && i == -1 && s2 == null)
            throw new IllegalArgumentException((new StringBuilder()).append(attributeset.getPositionDescription()).append(": Must specify unique android:id, android:tag, or have a parent with an id for ").append(s1).toString());
        Fragment fragment = null;
        if (i != -1)
            fragment = mFragments.findFragmentById(i);
        if (fragment == null && s2 != null)
            fragment = mFragments.findFragmentByTag(s2);
        if (fragment == null && j != -1)
            fragment = mFragments.findFragmentById(j);
        if (FragmentManagerImpl.DEBUG)
            Log.v("Activity", (new StringBuilder()).append("onCreateView: id=0x").append(Integer.toHexString(i)).append(" fname=").append(s1).append(" existing=").append(fragment).toString());
        if (fragment == null)
        {
            fragment = Fragment.instantiate(this, s1);
            fragment.mFromLayout = true;
            int k;
            if (i != 0)
                k = i;
            else
                k = j;
            fragment.mFragmentId = k;
            fragment.mContainerId = j;
            fragment.mTag = s2;
            fragment.mInLayout = true;
            fragment.mFragmentManager = mFragments;
            fragment.onInflate(this, attributeset, fragment.mSavedFragmentState);
            mFragments.addFragment(fragment, true);
        } else
        {
            if (fragment.mInLayout)
                throw new IllegalArgumentException((new StringBuilder()).append(attributeset.getPositionDescription()).append(": Duplicate id 0x").append(Integer.toHexString(i)).append(", tag ").append(s2).append(", or parent id 0x").append(Integer.toHexString(j)).append(" with another fragment for ").append(s1).toString());
            fragment.mInLayout = true;
            if (!fragment.mRetaining)
                fragment.onInflate(this, attributeset, fragment.mSavedFragmentState);
            mFragments.moveToState(fragment);
        }
        if (fragment.mView == null)
            throw new IllegalStateException((new StringBuilder()).append("Fragment ").append(s1).append(" did not create a view.").toString());
        if (i != 0)
            fragment.mView.setId(i);
        if (fragment.mView.getTag() == null)
            fragment.mView.setTag(s2);
        return fragment.mView;
    }

    public View onCreateView(String s, Context context, AttributeSet attributeset)
    {
        return null;
    }

    protected void onDestroy()
    {
        mCalled = true;
        if (mManagedDialogs != null)
        {
            int k = mManagedDialogs.size();
            for (int l = 0; l < k; l++)
            {
                ManagedDialog manageddialog = (ManagedDialog)mManagedDialogs.valueAt(l);
                if (manageddialog.mDialog.isShowing())
                    manageddialog.mDialog.dismiss();
            }

            mManagedDialogs = null;
        }
        ArrayList arraylist = mManagedCursors;
        arraylist;
        JVM INSTR monitorenter ;
        int i = mManagedCursors.size();
        int j = 0;
_L2:
        if (j >= i)
            break MISSING_BLOCK_LABEL_131;
        ManagedCursor managedcursor = (ManagedCursor)mManagedCursors.get(j);
        if (managedcursor == null)
            break MISSING_BLOCK_LABEL_168;
        managedcursor.mCursor.close();
        break MISSING_BLOCK_LABEL_168;
        mManagedCursors.clear();
        arraylist;
        JVM INSTR monitorexit ;
        if (mSearchManager != null)
            mSearchManager.stopSearch();
        getApplication().dispatchActivityDestroyed(this);
        return;
        Exception exception;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
        j++;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public void onDetachedFromWindow()
    {
    }

    public boolean onGenericMotionEvent(MotionEvent motionevent)
    {
        return false;
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        boolean flag1;
label0:
        {
label1:
            {
label2:
                {
                    if (i != 4)
                        break label1;
                    if (getApplicationInfo().targetSdkVersion >= 5)
                    {
                        keyevent.startTracking();
                    } else
                    {
                        if (!isResumed())
                            break label2;
                        onBackPressed();
                    }
                    flag1 = true;
                    break label0;
                }
                Log.v("Activity", (new StringBuilder()).append("Tracking Key Down, activity is resumed: ").append(isResumed()).toString());
                return false;
            }
            if (mDefaultKeyMode == 0)
                return false;
            if (mDefaultKeyMode == 2)
                return getWindow().performPanelShortcut(0, i, keyevent, 2);
            boolean flag;
            if (keyevent.getRepeatCount() == 0 && !keyevent.isSystem())
            {
                flag1 = TextKeyListener.getInstance().onKeyDown(null, mDefaultKeySsb, i, keyevent);
                flag = false;
                if (flag1)
                {
                    int j = mDefaultKeySsb.length();
                    flag = false;
                    if (j > 0)
                    {
                        String s = mDefaultKeySsb.toString();
                        flag = true;
                        switch (mDefaultKeyMode)
                        {
                        case 4: // '\004'
                            startSearch(s, false, null, true);
                            break;

                        case 3: // '\003'
                            startSearch(s, false, null, false);
                            break;

                        case 1: // '\001'
                            Intent intent = new Intent("android.intent.action.DIAL", Uri.parse((new StringBuilder()).append("tel:").append(s).toString()));
                            intent.addFlags(0x10000000);
                            startActivity(intent);
                            break;
                        }
                    }
                }
            } else
            {
                flag = true;
                flag1 = false;
            }
            if (flag)
            {
                mDefaultKeySsb.clear();
                mDefaultKeySsb.clearSpans();
                Selection.setSelection(mDefaultKeySsb, 0);
                return flag1;
            }
        }
        return flag1;
    }

    public boolean onKeyLongPress(int i, KeyEvent keyevent)
    {
        return false;
    }

    public boolean onKeyMultiple(int i, int j, KeyEvent keyevent)
    {
        return false;
    }

    public boolean onKeyShortcut(int i, KeyEvent keyevent)
    {
        return false;
    }

    public boolean onKeyUp(int i, KeyEvent keyevent)
    {
label0:
        {
            int j = getApplicationInfo().targetSdkVersion;
            boolean flag = false;
            if (j >= 5)
            {
                flag = false;
                if (i == 4)
                {
                    boolean flag1 = keyevent.isTracking();
                    flag = false;
                    if (flag1)
                    {
                        boolean flag2 = keyevent.isCanceled();
                        flag = false;
                        if (!flag2)
                        {
                            if (!isResumed())
                                break label0;
                            onBackPressed();
                            flag = true;
                        }
                    }
                }
            }
            return flag;
        }
        Log.v("Activity", (new StringBuilder()).append("Tracking Key Up, activity is resumed: ").append(isResumed()).toString());
        return false;
    }

    public void onLowMemory()
    {
        mCalled = true;
        mFragments.dispatchLowMemory();
    }

    public boolean onMenuItemSelected(int i, MenuItem menuitem)
    {
        boolean flag = true;
        switch (i)
        {
        case 6: // '\006'
            Object aobj1[] = new Object[2];
            aobj1[0] = Integer.valueOf(flag);
            aobj1[flag] = menuitem.getTitleCondensed();
            EventLog.writeEvent(50000, aobj1);
            if (!onContextItemSelected(menuitem))
                return mFragments.dispatchContextItemSelected(menuitem);
            break;

        case 0: // '\0'
            Object aobj[] = new Object[2];
            aobj[0] = Integer.valueOf(0);
            aobj[flag] = menuitem.getTitleCondensed();
            EventLog.writeEvent(50000, aobj);
            if (onOptionsItemSelected(menuitem) || mFragments.dispatchOptionsItemSelected(menuitem))
                break;
            if (menuitem.getItemId() == 0x102002c && mActionBar != null && (4 & mActionBar.getDisplayOptions()) != 0)
            {
                if (mParent == null)
                    return onNavigateUp();
                else
                    return mParent.onNavigateUpFromChild(this);
            } else
            {
                return false;
            }

        default:
            flag = false;
            break;
        }
        return flag;
    }

    public boolean onMenuOpened(int i, Menu menu)
    {
label0:
        {
            if (i == 8)
            {
                initActionBar();
                if (mActionBar == null)
                    break label0;
                mActionBar.dispatchMenuVisibilityChanged(true);
            }
            return true;
        }
        Log.e("Activity", "Tried to open action bar menu with no action bar");
        return true;
    }

    public boolean onNavigateUp()
    {
        Intent intent = getParentActivityIntent();
        if (intent != null)
        {
            if (mActivityInfo.taskAffinity == null)
                finish();
            else
            if (shouldUpRecreateTask(intent))
            {
                TaskStackBuilder taskstackbuilder = TaskStackBuilder.create(this);
                onCreateNavigateUpTaskStack(taskstackbuilder);
                onPrepareNavigateUpTaskStack(taskstackbuilder);
                taskstackbuilder.startActivities();
                if (mResultCode == 0 && mResultData == null)
                {
                    finishAffinity();
                } else
                {
                    Log.i("Activity", "onNavigateUp only finishing topmost activity to return a result");
                    finish();
                }
            } else
            {
                navigateUpTo(intent);
            }
            return true;
        } else
        {
            return false;
        }
    }

    public boolean onNavigateUpFromChild(Activity activity)
    {
        return onNavigateUp();
    }

    protected void onNewIntent(Intent intent)
    {
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        if (mParent != null)
            return mParent.onOptionsItemSelected(menuitem);
        else
            return false;
    }

    public void onOptionsMenuClosed(Menu menu)
    {
        if (mParent != null)
            mParent.onOptionsMenuClosed(menu);
    }

    public void onPanelClosed(int i, Menu menu)
    {
        switch (i)
        {
        case 8: // '\b'
            initActionBar();
            mActionBar.dispatchMenuVisibilityChanged(false);
            return;

        case 6: // '\006'
            onContextMenuClosed(menu);
            return;

        case 0: // '\0'
            mFragments.dispatchOptionsMenuClosed(menu);
            onOptionsMenuClosed(menu);
            return;
        }
    }

    protected void onPause()
    {
        getApplication().dispatchActivityPaused(this);
        mCalled = true;
    }

    protected void onPostCreate(Bundle bundle)
    {
        if (!isChild())
        {
            mTitleReady = true;
            onTitleChanged(getTitle(), getTitleColor());
        }
        mCalled = true;
    }

    protected void onPostResume()
    {
        Window window = getWindow();
        if (window != null)
            window.makeActive();
        if (mActionBar != null)
            mActionBar.setShowHideAnimationEnabled(true);
        mCalled = true;
    }

    protected void onPrepareDialog(int i, Dialog dialog)
    {
        dialog.setOwnerActivity(this);
    }

    protected void onPrepareDialog(int i, Dialog dialog, Bundle bundle)
    {
        onPrepareDialog(i, dialog);
    }

    public void onPrepareNavigateUpTaskStack(TaskStackBuilder taskstackbuilder)
    {
    }

    public boolean onPrepareOptionsMenu(Menu menu)
    {
        if (mParent != null)
            return mParent.onPrepareOptionsMenu(menu);
        else
            return true;
    }

    public boolean onPreparePanel(int i, View view, Menu menu)
    {
        if (i == 0 && menu != null)
            return onPrepareOptionsMenu(menu) | mFragments.dispatchPrepareOptionsMenu(menu);
        else
            return true;
    }

    protected void onRestart()
    {
        mCalled = true;
    }

    protected void onRestoreInstanceState(Bundle bundle)
    {
        if (mWindow != null)
        {
            Bundle bundle1 = bundle.getBundle("android:viewHierarchyState");
            if (bundle1 != null)
                mWindow.restoreHierarchyState(bundle1);
        }
    }

    protected void onResume()
    {
        getApplication().dispatchActivityResumed(this);
        mCalled = true;
    }

    HashMap onRetainNonConfigurationChildInstances()
    {
        return null;
    }

    public Object onRetainNonConfigurationInstance()
    {
        return null;
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        bundle.putBundle("android:viewHierarchyState", mWindow.saveHierarchyState());
        android.os.Parcelable parcelable = mFragments.saveAllState();
        if (parcelable != null)
            bundle.putParcelable("android:fragments", parcelable);
        getApplication().dispatchActivitySaveInstanceState(this, bundle);
    }

    public boolean onSearchRequested()
    {
        startSearch(null, false, null, false);
        return true;
    }

    protected void onStart()
    {
        mCalled = true;
        if (!mLoadersStarted)
        {
            mLoadersStarted = true;
            if (mLoaderManager != null)
                mLoaderManager.doStart();
            else
            if (!mCheckedForLoaderManager)
                mLoaderManager = getLoaderManager(null, mLoadersStarted, false);
            mCheckedForLoaderManager = true;
        }
        getApplication().dispatchActivityStarted(this);
    }

    protected void onStop()
    {
        if (mActionBar != null)
            mActionBar.setShowHideAnimationEnabled(false);
        getApplication().dispatchActivityStopped(this);
        mCalled = true;
    }

    protected void onTitleChanged(CharSequence charsequence, int i)
    {
        if (mTitleReady)
        {
            Window window = getWindow();
            if (window != null)
            {
                window.setTitle(charsequence);
                if (i != 0)
                    window.setTitleColor(i);
            }
        }
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (mWindow.shouldCloseOnTouch(this, motionevent))
        {
            finish();
            return true;
        } else
        {
            return false;
        }
    }

    public boolean onTrackballEvent(MotionEvent motionevent)
    {
        return false;
    }

    public void onTrimMemory(int i)
    {
        mCalled = true;
        mFragments.dispatchTrimMemory(i);
    }

    public void onUserInteraction()
    {
    }

    protected void onUserLeaveHint()
    {
    }

    public void onWindowAttributesChanged(android.view.WindowManager.LayoutParams layoutparams)
    {
        if (mParent == null)
        {
            View view = mDecor;
            if (view != null && view.getParent() != null)
                getWindowManager().updateViewLayout(view, layoutparams);
        }
    }

    public void onWindowFocusChanged(boolean flag)
    {
    }

    public ActionMode onWindowStartingActionMode(android.view.ActionMode.Callback callback)
    {
        initActionBar();
        if (mActionBar != null)
            return mActionBar.startActionMode(callback);
        else
            return null;
    }

    public void openContextMenu(View view)
    {
        view.showContextMenu();
    }

    public void openOptionsMenu()
    {
        mWindow.openPanel(0, null);
    }

    public void overridePendingTransition(int i, int j)
    {
        try
        {
            ActivityManagerNative.getDefault().overridePendingTransition(mToken, getPackageName(), i, j);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    final void performCreate(Bundle bundle)
    {
        onCreate(bundle);
        boolean flag = mWindow.getWindowStyle().getBoolean(10, false);
        boolean flag1 = false;
        if (!flag)
            flag1 = true;
        mVisibleFromClient = flag1;
        mFragments.dispatchActivityCreated();
    }

    final void performDestroy()
    {
        mDestroyed = true;
        mWindow.destroy();
        mFragments.dispatchDestroy();
        onDestroy();
        if (mLoaderManager != null)
            mLoaderManager.doDestroy();
    }

    final void performPause()
    {
        mFragments.dispatchPause();
        mCalled = false;
        onPause();
        mResumed = false;
        if (!mCalled && getApplicationInfo().targetSdkVersion >= 9)
        {
            throw new SuperNotCalledException((new StringBuilder()).append("Activity ").append(mComponent.toShortString()).append(" did not call through to super.onPause()").toString());
        } else
        {
            mResumed = false;
            return;
        }
    }

    final void performRestart()
    {
        mFragments.noteStateNotSaved();
        if (!mStopped) goto _L2; else goto _L1
_L1:
        mStopped = false;
        if (mToken != null && mParent == null)
            WindowManagerGlobal.getInstance().setStoppedState(mToken, false);
        ArrayList arraylist = mManagedCursors;
        arraylist;
        JVM INSTR monitorenter ;
        int i = mManagedCursors.size();
        int j = 0;
_L9:
        if (j >= i) goto _L4; else goto _L3
_L3:
        ManagedCursor managedcursor = (ManagedCursor)mManagedCursors.get(j);
        if (!managedcursor.mReleased && !managedcursor.mUpdated) goto _L6; else goto _L5
_L5:
        if (!managedcursor.mCursor.requery() && getApplicationInfo().targetSdkVersion >= 14)
            throw new IllegalStateException((new StringBuilder()).append("trying to requery an already closed cursor  ").append(managedcursor.mCursor).toString());
          goto _L7
        Exception exception;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
_L7:
        managedcursor.mReleased = false;
        managedcursor.mUpdated = false;
          goto _L6
_L4:
        arraylist;
        JVM INSTR monitorexit ;
        mCalled = false;
        mInstrumentation.callActivityOnRestart(this);
        if (!mCalled)
            throw new SuperNotCalledException((new StringBuilder()).append("Activity ").append(mComponent.toShortString()).append(" did not call through to super.onRestart()").toString());
        performStart();
_L2:
        return;
_L6:
        j++;
        if (true) goto _L9; else goto _L8
_L8:
    }

    final void performRestoreInstanceState(Bundle bundle)
    {
        onRestoreInstanceState(bundle);
        restoreManagedDialogs(bundle);
    }

    final void performResume()
    {
        performRestart();
        mFragments.execPendingActions();
        mLastNonConfigurationInstances = null;
        mCalled = false;
        mInstrumentation.callActivityOnResume(this);
        if (!mCalled)
            throw new SuperNotCalledException((new StringBuilder()).append("Activity ").append(mComponent.toShortString()).append(" did not call through to super.onResume()").toString());
        mCalled = false;
        mFragments.dispatchResume();
        mFragments.execPendingActions();
        onPostResume();
        if (!mCalled)
            throw new SuperNotCalledException((new StringBuilder()).append("Activity ").append(mComponent.toShortString()).append(" did not call through to super.onPostResume()").toString());
        else
            return;
    }

    final void performSaveInstanceState(Bundle bundle)
    {
        onSaveInstanceState(bundle);
        saveManagedDialogs(bundle);
    }

    final void performStart()
    {
        mFragments.noteStateNotSaved();
        mCalled = false;
        mFragments.execPendingActions();
        mInstrumentation.callActivityOnStart(this);
        if (!mCalled)
            throw new SuperNotCalledException((new StringBuilder()).append("Activity ").append(mComponent.toShortString()).append(" did not call through to super.onStart()").toString());
        mFragments.dispatchStart();
        if (mAllLoaderManagers != null)
        {
            LoaderManagerImpl aloadermanagerimpl[] = new LoaderManagerImpl[mAllLoaderManagers.size()];
            mAllLoaderManagers.values().toArray(aloadermanagerimpl);
            if (aloadermanagerimpl != null)
            {
                for (int i = 0; i < aloadermanagerimpl.length; i++)
                {
                    LoaderManagerImpl loadermanagerimpl = aloadermanagerimpl[i];
                    loadermanagerimpl.finishRetain();
                    loadermanagerimpl.doReportStart();
                }

            }
        }
    }

    final void performStop()
    {
        if (mLoadersStarted)
        {
            mLoadersStarted = false;
            if (mLoaderManager != null)
                if (!mChangingConfigurations)
                    mLoaderManager.doStop();
                else
                    mLoaderManager.doRetain();
        }
        if (mStopped) goto _L2; else goto _L1
_L1:
        if (mWindow != null)
            mWindow.closeAllPanels();
        if (mToken != null && mParent == null)
            WindowManagerGlobal.getInstance().setStoppedState(mToken, true);
        mFragments.dispatchStop();
        mCalled = false;
        mInstrumentation.callActivityOnStop(this);
        if (!mCalled)
            throw new SuperNotCalledException((new StringBuilder()).append("Activity ").append(mComponent.toShortString()).append(" did not call through to super.onStop()").toString());
        ArrayList arraylist = mManagedCursors;
        arraylist;
        JVM INSTR monitorenter ;
        int i = mManagedCursors.size();
        int j = 0;
_L7:
        if (j >= i) goto _L4; else goto _L3
_L3:
        ManagedCursor managedcursor = (ManagedCursor)mManagedCursors.get(j);
        if (!managedcursor.mReleased)
        {
            managedcursor.mCursor.deactivate();
            managedcursor.mReleased = true;
        }
          goto _L5
_L4:
        arraylist;
        JVM INSTR monitorexit ;
        mStopped = true;
_L2:
        mResumed = false;
        return;
        Exception exception;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
_L5:
        j++;
        if (true) goto _L7; else goto _L6
_L6:
    }

    final void performUserLeaving()
    {
        onUserInteraction();
        onUserLeaveHint();
    }

    public void recreate()
    {
        if (mParent != null)
            throw new IllegalStateException("Can only be called on top-level activity");
        if (Looper.myLooper() != mMainThread.getLooper())
        {
            throw new IllegalStateException("Must be called from main thread");
        } else
        {
            mMainThread.requestRelaunchActivity(mToken, null, null, 0, false, null, false);
            return;
        }
    }

    public void registerForContextMenu(View view)
    {
        view.setOnCreateContextMenuListener(this);
    }

    public final void removeDialog(int i)
    {
        if (mManagedDialogs != null)
        {
            ManagedDialog manageddialog = (ManagedDialog)mManagedDialogs.get(i);
            if (manageddialog != null)
            {
                manageddialog.mDialog.dismiss();
                mManagedDialogs.remove(i);
            }
        }
    }

    public final boolean requestWindowFeature(int i)
    {
        return getWindow().requestFeature(i);
    }

    NonConfigurationInstances retainNonConfigurationInstances()
    {
        Object obj = onRetainNonConfigurationInstance();
        HashMap hashmap = onRetainNonConfigurationChildInstances();
        ArrayList arraylist = mFragments.retainNonConfig();
        HashMap hashmap1 = mAllLoaderManagers;
        boolean flag = false;
        if (hashmap1 != null)
        {
            LoaderManagerImpl aloadermanagerimpl[] = new LoaderManagerImpl[mAllLoaderManagers.size()];
            mAllLoaderManagers.values().toArray(aloadermanagerimpl);
            flag = false;
            if (aloadermanagerimpl != null)
            {
                for (int i = 0; i < aloadermanagerimpl.length; i++)
                {
                    LoaderManagerImpl loadermanagerimpl = aloadermanagerimpl[i];
                    if (loadermanagerimpl.mRetaining)
                    {
                        flag = true;
                    } else
                    {
                        loadermanagerimpl.doDestroy();
                        mAllLoaderManagers.remove(loadermanagerimpl.mWho);
                    }
                }

            }
        }
        if (obj == null && hashmap == null && arraylist == null && !flag)
        {
            return null;
        } else
        {
            NonConfigurationInstances nonconfigurationinstances = new NonConfigurationInstances();
            nonconfigurationinstances.activity = obj;
            nonconfigurationinstances.children = hashmap;
            nonconfigurationinstances.fragments = arraylist;
            nonconfigurationinstances.loaders = mAllLoaderManagers;
            return nonconfigurationinstances;
        }
    }

    public final void runOnUiThread(Runnable runnable)
    {
        if (Thread.currentThread() != mUiThread)
        {
            mHandler.post(runnable);
            return;
        } else
        {
            runnable.run();
            return;
        }
    }

    public void setContentView(int i)
    {
        getWindow().setContentView(i);
        initActionBar();
    }

    public void setContentView(View view)
    {
        getWindow().setContentView(view);
        initActionBar();
    }

    public void setContentView(View view, android.view.ViewGroup.LayoutParams layoutparams)
    {
        getWindow().setContentView(view, layoutparams);
        initActionBar();
    }

    public final void setDefaultKeyMode(int i)
    {
        mDefaultKeyMode = i;
        switch (i)
        {
        case 1: // '\001'
        case 3: // '\003'
        case 4: // '\004'
            mDefaultKeySsb = new SpannableStringBuilder();
            Selection.setSelection(mDefaultKeySsb, 0);
            return;

        case 0: // '\0'
        case 2: // '\002'
            mDefaultKeySsb = null;
            return;
        }
        throw new IllegalArgumentException();
    }

    public final void setFeatureDrawable(int i, Drawable drawable)
    {
        getWindow().setFeatureDrawable(i, drawable);
    }

    public final void setFeatureDrawableAlpha(int i, int j)
    {
        getWindow().setFeatureDrawableAlpha(i, j);
    }

    public final void setFeatureDrawableResource(int i, int j)
    {
        getWindow().setFeatureDrawableResource(i, j);
    }

    public final void setFeatureDrawableUri(int i, Uri uri)
    {
        getWindow().setFeatureDrawableUri(i, uri);
    }

    public void setFinishOnTouchOutside(boolean flag)
    {
        mWindow.setCloseOnTouchOutside(flag);
    }

    public void setImmersive(boolean flag)
    {
        try
        {
            ActivityManagerNative.getDefault().setImmersive(mToken, flag);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void setIntent(Intent intent)
    {
        mIntent = intent;
    }

    final void setParent(Activity activity)
    {
        mParent = activity;
    }

    public void setPersistent(boolean flag)
    {
    }

    public final void setProgress(int i)
    {
        getWindow().setFeatureInt(2, i + 0);
    }

    public final void setProgressBarIndeterminate(boolean flag)
    {
        Window window = getWindow();
        byte byte0;
        if (flag)
            byte0 = -3;
        else
            byte0 = -4;
        window.setFeatureInt(2, byte0);
    }

    public final void setProgressBarIndeterminateVisibility(boolean flag)
    {
        Window window = getWindow();
        byte byte0;
        if (flag)
            byte0 = -1;
        else
            byte0 = -2;
        window.setFeatureInt(5, byte0);
    }

    public final void setProgressBarVisibility(boolean flag)
    {
        Window window = getWindow();
        byte byte0;
        if (flag)
            byte0 = -1;
        else
            byte0 = -2;
        window.setFeatureInt(2, byte0);
    }

    public void setRequestedOrientation(int i)
    {
        if (mParent == null)
        {
            try
            {
                ActivityManagerNative.getDefault().setRequestedOrientation(mToken, i);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
        } else
        {
            mParent.setRequestedOrientation(i);
            return;
        }
    }

    public final void setResult(int i)
    {
        this;
        JVM INSTR monitorenter ;
        mResultCode = i;
        mResultData = null;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public final void setResult(int i, Intent intent)
    {
        this;
        JVM INSTR monitorenter ;
        mResultCode = i;
        mResultData = intent;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public final void setSecondaryProgress(int i)
    {
        getWindow().setFeatureInt(2, i + 20000);
    }

    public void setTitle(int i)
    {
        setTitle(getText(i));
    }

    public void setTitle(CharSequence charsequence)
    {
        mTitle = charsequence;
        onTitleChanged(charsequence, mTitleColor);
        if (mParent != null)
            mParent.onChildTitleChanged(this, charsequence);
    }

    public void setTitleColor(int i)
    {
        mTitleColor = i;
        onTitleChanged(mTitle, i);
    }

    public void setVisible(boolean flag)
    {
label0:
        {
            if (mVisibleFromClient != flag)
            {
                mVisibleFromClient = flag;
                if (mVisibleFromServer)
                {
                    if (!flag)
                        break label0;
                    makeVisible();
                }
            }
            return;
        }
        mDecor.setVisibility(4);
    }

    public final void setVolumeControlStream(int i)
    {
        getWindow().setVolumeControlStream(i);
    }

    public boolean shouldUpRecreateTask(Intent intent)
    {
        PackageManager packagemanager;
        ComponentName componentname;
        packagemanager = getPackageManager();
        componentname = intent.getComponent();
        if (componentname != null)
            break MISSING_BLOCK_LABEL_25;
        componentname = intent.resolveActivity(packagemanager);
        ActivityInfo activityinfo = packagemanager.getActivityInfo(componentname, 0);
        if (activityinfo.taskAffinity == null)
            return false;
        boolean flag = ActivityManagerNative.getDefault().targetTaskAffinityMatchesActivity(mToken, activityinfo.taskAffinity);
        if (!flag)
            return true;
        break MISSING_BLOCK_LABEL_75;
        RemoteException remoteexception;
        remoteexception;
        return false;
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        return false;
    }

    public final void showDialog(int i)
    {
        showDialog(i, null);
    }

    public final boolean showDialog(int i, Bundle bundle)
    {
        if (mManagedDialogs == null)
            mManagedDialogs = new SparseArray();
        ManagedDialog manageddialog = (ManagedDialog)mManagedDialogs.get(i);
        if (manageddialog == null)
        {
            manageddialog = new ManagedDialog();
            manageddialog.mDialog = createDialog(Integer.valueOf(i), null, bundle);
            if (manageddialog.mDialog == null)
                return false;
            mManagedDialogs.put(i, manageddialog);
        }
        manageddialog.mArgs = bundle;
        onPrepareDialog(i, manageddialog.mDialog, bundle);
        manageddialog.mDialog.show();
        return true;
    }

    public ActionMode startActionMode(android.view.ActionMode.Callback callback)
    {
        return mWindow.getDecorView().startActionMode(callback);
    }

    public void startActivities(Intent aintent[])
    {
        startActivities(aintent, null);
    }

    public void startActivities(Intent aintent[], Bundle bundle)
    {
        mInstrumentation.execStartActivities(this, mMainThread.getApplicationThread(), mToken, this, aintent, bundle);
    }

    public void startActivity(Intent intent)
    {
        startActivity(intent, null);
    }

    public void startActivity(Intent intent, Bundle bundle)
    {
        if (bundle != null)
        {
            startActivityForResult(intent, -1, bundle);
            return;
        } else
        {
            startActivityForResult(intent, -1);
            return;
        }
    }

    public void startActivityAsUser(Intent intent, Bundle bundle, UserHandle userhandle)
    {
        if (mParent != null)
            throw new RuntimeException("Called be called from a child");
        Instrumentation.ActivityResult activityresult = mInstrumentation.execStartActivity(this, mMainThread.getApplicationThread(), mToken, this, intent, -1, bundle, userhandle);
        if (activityresult != null)
            mMainThread.sendActivityResult(mToken, mEmbeddedID, -1, activityresult.getResultCode(), activityresult.getResultData());
    }

    public void startActivityAsUser(Intent intent, UserHandle userhandle)
    {
        startActivityAsUser(intent, null, userhandle);
    }

    public void startActivityForResult(Intent intent, int i)
    {
        startActivityForResult(intent, i, null);
    }

    public void startActivityForResult(Intent intent, int i, Bundle bundle)
    {
        if (mParent == null)
        {
            Instrumentation.ActivityResult activityresult = mInstrumentation.execStartActivity(this, mMainThread.getApplicationThread(), mToken, this, intent, i, bundle);
            if (activityresult != null)
                mMainThread.sendActivityResult(mToken, mEmbeddedID, i, activityresult.getResultCode(), activityresult.getResultData());
            if (i >= 0)
                mStartedActivity = true;
            return;
        }
        if (bundle != null)
        {
            mParent.startActivityFromChild(this, intent, i, bundle);
            return;
        } else
        {
            mParent.startActivityFromChild(this, intent, i);
            return;
        }
    }

    public void startActivityFromChild(Activity activity, Intent intent, int i)
    {
        startActivityFromChild(activity, intent, i, null);
    }

    public void startActivityFromChild(Activity activity, Intent intent, int i, Bundle bundle)
    {
        Instrumentation.ActivityResult activityresult = mInstrumentation.execStartActivity(this, mMainThread.getApplicationThread(), mToken, activity, intent, i, bundle);
        if (activityresult != null)
            mMainThread.sendActivityResult(mToken, activity.mEmbeddedID, i, activityresult.getResultCode(), activityresult.getResultData());
    }

    public void startActivityFromFragment(Fragment fragment, Intent intent, int i)
    {
        startActivityFromFragment(fragment, intent, i, null);
    }

    public void startActivityFromFragment(Fragment fragment, Intent intent, int i, Bundle bundle)
    {
        Instrumentation.ActivityResult activityresult = mInstrumentation.execStartActivity(this, mMainThread.getApplicationThread(), mToken, fragment, intent, i, bundle);
        if (activityresult != null)
            mMainThread.sendActivityResult(mToken, fragment.mWho, i, activityresult.getResultCode(), activityresult.getResultData());
    }

    public boolean startActivityIfNeeded(Intent intent, int i)
    {
        return startActivityIfNeeded(intent, i, null);
    }

    public boolean startActivityIfNeeded(Intent intent, int i, Bundle bundle)
    {
        if (mParent != null) goto _L2; else goto _L1
_L1:
        int j = 1;
        int k;
        intent.setAllowFds(false);
        k = ActivityManagerNative.getDefault().startActivity(mMainThread.getApplicationThread(), intent, intent.resolveTypeIfNeeded(getContentResolver()), mToken, mEmbeddedID, i, 1, null, null, bundle);
        j = k;
_L4:
        Instrumentation.checkStartActivityResult(j, intent);
        if (i >= 0)
            mStartedActivity = true;
        return j != 1;
_L2:
        throw new UnsupportedOperationException("startActivityIfNeeded can only be called from a top-level activity");
        RemoteException remoteexception;
        remoteexception;
        if (true) goto _L4; else goto _L3
_L3:
    }

    public void startIntentSender(IntentSender intentsender, Intent intent, int i, int j, int k)
        throws android.content.IntentSender.SendIntentException
    {
        startIntentSender(intentsender, intent, i, j, k, null);
    }

    public void startIntentSender(IntentSender intentsender, Intent intent, int i, int j, int k, Bundle bundle)
        throws android.content.IntentSender.SendIntentException
    {
        if (bundle != null)
        {
            startIntentSenderForResult(intentsender, -1, intent, i, j, k, bundle);
            return;
        } else
        {
            startIntentSenderForResult(intentsender, -1, intent, i, j, k);
            return;
        }
    }

    public void startIntentSenderForResult(IntentSender intentsender, int i, Intent intent, int j, int k, int l)
        throws android.content.IntentSender.SendIntentException
    {
        startIntentSenderForResult(intentsender, i, intent, j, k, l, null);
    }

    public void startIntentSenderForResult(IntentSender intentsender, int i, Intent intent, int j, int k, int l, Bundle bundle)
        throws android.content.IntentSender.SendIntentException
    {
        if (mParent == null)
        {
            startIntentSenderForResultInner(intentsender, i, intent, j, k, this, bundle);
            return;
        }
        if (bundle != null)
        {
            mParent.startIntentSenderFromChild(this, intentsender, i, intent, j, k, l, bundle);
            return;
        } else
        {
            mParent.startIntentSenderFromChild(this, intentsender, i, intent, j, k, l);
            return;
        }
    }

    public void startIntentSenderFromChild(Activity activity, IntentSender intentsender, int i, Intent intent, int j, int k, int l)
        throws android.content.IntentSender.SendIntentException
    {
        startIntentSenderFromChild(activity, intentsender, i, intent, j, k, l, null);
    }

    public void startIntentSenderFromChild(Activity activity, IntentSender intentsender, int i, Intent intent, int j, int k, int l, 
            Bundle bundle)
        throws android.content.IntentSender.SendIntentException
    {
        startIntentSenderForResultInner(intentsender, i, intent, j, k, activity, bundle);
    }

    public void startManagingCursor(Cursor cursor)
    {
        synchronized (mManagedCursors)
        {
            mManagedCursors.add(new ManagedCursor(cursor));
        }
        return;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean startNextMatchingActivity(Intent intent)
    {
        return startNextMatchingActivity(intent, null);
    }

    public boolean startNextMatchingActivity(Intent intent, Bundle bundle)
    {
        if (mParent == null)
        {
            boolean flag;
            try
            {
                intent.setAllowFds(false);
                flag = ActivityManagerNative.getDefault().startNextMatchingActivity(mToken, intent, bundle);
            }
            catch (RemoteException remoteexception)
            {
                return false;
            }
            return flag;
        } else
        {
            throw new UnsupportedOperationException("startNextMatchingActivity can only be called from a top-level activity");
        }
    }

    public void startSearch(String s, boolean flag, Bundle bundle, boolean flag1)
    {
        ensureSearchManager();
        mSearchManager.startSearch(s, flag, getComponentName(), bundle, flag1);
    }

    public void stopManagingCursor(Cursor cursor)
    {
        ArrayList arraylist = mManagedCursors;
        arraylist;
        JVM INSTR monitorenter ;
        int i = mManagedCursors.size();
        int j = 0;
_L2:
        if (j >= i)
            break MISSING_BLOCK_LABEL_55;
        if (((ManagedCursor)mManagedCursors.get(j)).mCursor != cursor)
            break MISSING_BLOCK_LABEL_63;
        mManagedCursors.remove(j);
        arraylist;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
        j++;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public void takeKeyEvents(boolean flag)
    {
        getWindow().takeKeyEvents(flag);
    }

    public void triggerSearch(String s, Bundle bundle)
    {
        ensureSearchManager();
        mSearchManager.triggerSearch(s, getComponentName(), bundle);
    }

    public void unregisterForContextMenu(View view)
    {
        view.setOnCreateContextMenuListener(null);
    }

}
