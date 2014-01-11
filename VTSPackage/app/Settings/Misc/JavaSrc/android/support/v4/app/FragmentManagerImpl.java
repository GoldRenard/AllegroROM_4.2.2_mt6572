// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.support.v4.app;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.*;
import android.support.v4.util.DebugUtils;
import android.support.v4.util.LogWriter;
import android.util.Log;
import android.util.SparseArray;
import android.view.*;
import android.view.animation.*;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;

// Referenced classes of package android.support.v4.app:
//            FragmentManager, FragmentActivity, Fragment, BackStackRecord, 
//            LoaderManagerImpl, SuperNotCalledException, NoSaveStateFrameLayout, FragmentContainer, 
//            FragmentManagerState, FragmentState, BackStackState, FragmentTransaction

final class FragmentManagerImpl extends FragmentManager
{

    static final Interpolator ACCELERATE_CUBIC = new AccelerateInterpolator(1.5F);
    static final Interpolator ACCELERATE_QUINT = new AccelerateInterpolator(2.5F);
    static final int ANIM_DUR = 220;
    public static final int ANIM_STYLE_CLOSE_ENTER = 3;
    public static final int ANIM_STYLE_CLOSE_EXIT = 4;
    public static final int ANIM_STYLE_FADE_ENTER = 5;
    public static final int ANIM_STYLE_FADE_EXIT = 6;
    public static final int ANIM_STYLE_OPEN_ENTER = 1;
    public static final int ANIM_STYLE_OPEN_EXIT = 2;
    static boolean DEBUG = false;
    static final Interpolator DECELERATE_CUBIC = new DecelerateInterpolator(1.5F);
    static final Interpolator DECELERATE_QUINT = new DecelerateInterpolator(2.5F);
    static final boolean HONEYCOMB = false;
    static final String TAG = "FragmentManager";
    static final String TARGET_REQUEST_CODE_STATE_TAG = "android:target_req_state";
    static final String TARGET_STATE_TAG = "android:target_state";
    static final String USER_VISIBLE_HINT_TAG = "android:user_visible_hint";
    static final String VIEW_STATE_TAG = "android:view_state";
    ArrayList mActive;
    FragmentActivity mActivity;
    ArrayList mAdded;
    ArrayList mAvailBackStackIndices;
    ArrayList mAvailIndices;
    ArrayList mBackStack;
    ArrayList mBackStackChangeListeners;
    ArrayList mBackStackIndices;
    FragmentContainer mContainer;
    ArrayList mCreatedMenus;
    int mCurState;
    boolean mDestroyed;
    Runnable mExecCommit;
    boolean mExecutingActions;
    boolean mHavePendingDeferredStart;
    boolean mNeedMenuInvalidate;
    String mNoTransactionsBecause;
    Fragment mParent;
    ArrayList mPendingActions;
    SparseArray mStateArray;
    Bundle mStateBundle;
    boolean mStateSaved;
    Runnable mTmpActions[];

    FragmentManagerImpl()
    {
        mCurState = 0;
        mStateBundle = null;
        mStateArray = null;
        mExecCommit = new Runnable() {

            final FragmentManagerImpl this$0;

            public void run()
            {
                execPendingActions();
            }

            
            {
                this$0 = FragmentManagerImpl.this;
                super();
            }
        }
;
    }

    private void checkStateLoss()
    {
        if (mStateSaved)
            throw new IllegalStateException("Can not perform this action after onSaveInstanceState");
        if (mNoTransactionsBecause != null)
            throw new IllegalStateException((new StringBuilder()).append("Can not perform this action inside of ").append(mNoTransactionsBecause).toString());
        else
            return;
    }

    static Animation makeFadeAnimation(Context context, float f, float f1)
    {
        AlphaAnimation alphaanimation = new AlphaAnimation(f, f1);
        alphaanimation.setInterpolator(DECELERATE_CUBIC);
        alphaanimation.setDuration(220L);
        return alphaanimation;
    }

    static Animation makeOpenCloseAnimation(Context context, float f, float f1, float f2, float f3)
    {
        AnimationSet animationset = new AnimationSet(false);
        ScaleAnimation scaleanimation = new ScaleAnimation(f, f1, f, f1, 1, 0.5F, 1, 0.5F);
        scaleanimation.setInterpolator(DECELERATE_QUINT);
        scaleanimation.setDuration(220L);
        animationset.addAnimation(scaleanimation);
        AlphaAnimation alphaanimation = new AlphaAnimation(f2, f3);
        alphaanimation.setInterpolator(DECELERATE_CUBIC);
        alphaanimation.setDuration(220L);
        animationset.addAnimation(alphaanimation);
        return animationset;
    }

    public static int reverseTransit(int i)
    {
        switch (i)
        {
        case 4099: 
            return 4099;

        case 8194: 
            return 4097;

        case 4097: 
            return 8194;
        }
        return 0;
    }

    private void throwException(RuntimeException runtimeexception)
    {
        Log.e("FragmentManager", runtimeexception.getMessage());
        Log.e("FragmentManager", "Activity state:");
        PrintWriter printwriter = new PrintWriter(new LogWriter("FragmentManager"));
        if (mActivity != null)
            try
            {
                mActivity.dump("  ", null, printwriter, new String[0]);
            }
            catch (Exception exception1)
            {
                Log.e("FragmentManager", "Failed dumping state", exception1);
            }
        else
            try
            {
                dump("  ", null, printwriter, new String[0]);
            }
            catch (Exception exception)
            {
                Log.e("FragmentManager", "Failed dumping state", exception);
            }
        throw runtimeexception;
    }

    public static int transitToStyleIndex(int i, boolean flag)
    {
        switch (i)
        {
        case 4099: 
            return !flag ? 6 : 5;

        case 8194: 
            return !flag ? 4 : 3;

        case 4097: 
            return !flag ? 2 : 1;
        }
        return -1;
    }

    void addBackStackState(BackStackRecord backstackrecord)
    {
        if (mBackStack == null)
            mBackStack = new ArrayList();
        mBackStack.add(backstackrecord);
        reportBackStackChanged();
    }

    public void addFragment(Fragment fragment, boolean flag)
    {
        if (mAdded == null)
            mAdded = new ArrayList();
        if (DEBUG)
            Log.v("FragmentManager", (new StringBuilder()).append("add: ").append(fragment).toString());
        makeActive(fragment);
        if (!fragment.mDetached)
        {
            if (mAdded.contains(fragment))
                throw new IllegalStateException((new StringBuilder()).append("Fragment already added: ").append(fragment).toString());
            mAdded.add(fragment);
            fragment.mAdded = true;
            fragment.mRemoving = false;
            if (fragment.mHasMenu && fragment.mMenuVisible)
                mNeedMenuInvalidate = true;
            if (flag)
                moveToState(fragment);
        }
    }

    public void addOnBackStackChangedListener(FragmentManager.OnBackStackChangedListener onbackstackchangedlistener)
    {
        if (mBackStackChangeListeners == null)
            mBackStackChangeListeners = new ArrayList();
        mBackStackChangeListeners.add(onbackstackchangedlistener);
    }

    public int allocBackStackIndex(BackStackRecord backstackrecord)
    {
        this;
        JVM INSTR monitorenter ;
        int i;
        if (mAvailBackStackIndices != null && mAvailBackStackIndices.size() > 0)
            break MISSING_BLOCK_LABEL_100;
        if (mBackStackIndices == null)
            mBackStackIndices = new ArrayList();
        i = mBackStackIndices.size();
        if (DEBUG)
            Log.v("FragmentManager", (new StringBuilder()).append("Setting back stack index ").append(i).append(" to ").append(backstackrecord).toString());
        mBackStackIndices.add(backstackrecord);
        this;
        JVM INSTR monitorexit ;
        return i;
        int j;
        j = ((Integer)mAvailBackStackIndices.remove(-1 + mAvailBackStackIndices.size())).intValue();
        if (DEBUG)
            Log.v("FragmentManager", (new StringBuilder()).append("Adding back stack index ").append(j).append(" with ").append(backstackrecord).toString());
        mBackStackIndices.set(j, backstackrecord);
        this;
        JVM INSTR monitorexit ;
        return j;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void attachActivity(FragmentActivity fragmentactivity, FragmentContainer fragmentcontainer, Fragment fragment)
    {
        if (mActivity != null)
        {
            throw new IllegalStateException("Already attached");
        } else
        {
            mActivity = fragmentactivity;
            mContainer = fragmentcontainer;
            mParent = fragment;
            return;
        }
    }

    public void attachFragment(Fragment fragment, int i, int j)
    {
        if (DEBUG)
            Log.v("FragmentManager", (new StringBuilder()).append("attach: ").append(fragment).toString());
        if (fragment.mDetached)
        {
            fragment.mDetached = false;
            if (!fragment.mAdded)
            {
                if (mAdded == null)
                    mAdded = new ArrayList();
                if (mAdded.contains(fragment))
                    throw new IllegalStateException((new StringBuilder()).append("Fragment already added: ").append(fragment).toString());
                if (DEBUG)
                    Log.v("FragmentManager", (new StringBuilder()).append("add from attach: ").append(fragment).toString());
                mAdded.add(fragment);
                fragment.mAdded = true;
                if (fragment.mHasMenu && fragment.mMenuVisible)
                    mNeedMenuInvalidate = true;
                moveToState(fragment, mCurState, i, j, false);
            }
        }
    }

    public FragmentTransaction beginTransaction()
    {
        return new BackStackRecord(this);
    }

    public void detachFragment(Fragment fragment, int i, int j)
    {
        if (DEBUG)
            Log.v("FragmentManager", (new StringBuilder()).append("detach: ").append(fragment).toString());
        if (!fragment.mDetached)
        {
            fragment.mDetached = true;
            if (fragment.mAdded)
            {
                if (mAdded != null)
                {
                    if (DEBUG)
                        Log.v("FragmentManager", (new StringBuilder()).append("remove from detach: ").append(fragment).toString());
                    mAdded.remove(fragment);
                }
                if (fragment.mHasMenu && fragment.mMenuVisible)
                    mNeedMenuInvalidate = true;
                fragment.mAdded = false;
                moveToState(fragment, 1, i, j, false);
            }
        }
    }

    public void dispatchActivityCreated()
    {
        mStateSaved = false;
        moveToState(2, false);
    }

    public void dispatchConfigurationChanged(Configuration configuration)
    {
        if (mAdded != null)
        {
            for (int i = 0; i < mAdded.size(); i++)
            {
                Fragment fragment = (Fragment)mAdded.get(i);
                if (fragment != null)
                    fragment.performConfigurationChanged(configuration);
            }

        }
    }

    public boolean dispatchContextItemSelected(MenuItem menuitem)
    {
        if (mAdded != null)
        {
            for (int i = 0; i < mAdded.size(); i++)
            {
                Fragment fragment = (Fragment)mAdded.get(i);
                if (fragment != null && fragment.performContextItemSelected(menuitem))
                    return true;
            }

        }
        return false;
    }

    public void dispatchCreate()
    {
        mStateSaved = false;
        moveToState(1, false);
    }

    public boolean dispatchCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        ArrayList arraylist = mAdded;
        ArrayList arraylist1 = null;
        boolean flag = false;
        if (arraylist != null)
        {
            for (int j = 0; j < mAdded.size(); j++)
            {
                Fragment fragment1 = (Fragment)mAdded.get(j);
                if (fragment1 == null || !fragment1.performCreateOptionsMenu(menu, menuinflater))
                    continue;
                flag = true;
                if (arraylist1 == null)
                    arraylist1 = new ArrayList();
                arraylist1.add(fragment1);
            }

        }
        if (mCreatedMenus != null)
        {
            for (int i = 0; i < mCreatedMenus.size(); i++)
            {
                Fragment fragment = (Fragment)mCreatedMenus.get(i);
                if (arraylist1 == null || !arraylist1.contains(fragment))
                    fragment.onDestroyOptionsMenu();
            }

        }
        mCreatedMenus = arraylist1;
        return flag;
    }

    public void dispatchDestroy()
    {
        mDestroyed = true;
        execPendingActions();
        moveToState(0, false);
        mActivity = null;
        mContainer = null;
        mParent = null;
    }

    public void dispatchDestroyView()
    {
        moveToState(1, false);
    }

    public void dispatchLowMemory()
    {
        if (mAdded != null)
        {
            for (int i = 0; i < mAdded.size(); i++)
            {
                Fragment fragment = (Fragment)mAdded.get(i);
                if (fragment != null)
                    fragment.performLowMemory();
            }

        }
    }

    public boolean dispatchOptionsItemSelected(MenuItem menuitem)
    {
        if (mAdded != null)
        {
            for (int i = 0; i < mAdded.size(); i++)
            {
                Fragment fragment = (Fragment)mAdded.get(i);
                if (fragment != null && fragment.performOptionsItemSelected(menuitem))
                    return true;
            }

        }
        return false;
    }

    public void dispatchOptionsMenuClosed(Menu menu)
    {
        if (mAdded != null)
        {
            for (int i = 0; i < mAdded.size(); i++)
            {
                Fragment fragment = (Fragment)mAdded.get(i);
                if (fragment != null)
                    fragment.performOptionsMenuClosed(menu);
            }

        }
    }

    public void dispatchPause()
    {
        moveToState(4, false);
    }

    public boolean dispatchPrepareOptionsMenu(Menu menu)
    {
        ArrayList arraylist = mAdded;
        boolean flag = false;
        if (arraylist != null)
        {
            for (int i = 0; i < mAdded.size(); i++)
            {
                Fragment fragment = (Fragment)mAdded.get(i);
                if (fragment != null && fragment.performPrepareOptionsMenu(menu))
                    flag = true;
            }

        }
        return flag;
    }

    public void dispatchReallyStop()
    {
        moveToState(2, false);
    }

    public void dispatchResume()
    {
        mStateSaved = false;
        moveToState(5, false);
    }

    public void dispatchStart()
    {
        mStateSaved = false;
        moveToState(4, false);
    }

    public void dispatchStop()
    {
        mStateSaved = true;
        moveToState(3, false);
    }

    public void dump(String s, FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
    {
        String s1 = (new StringBuilder()).append(s).append("    ").toString();
        if (mActive != null)
        {
            int k2 = mActive.size();
            if (k2 > 0)
            {
                printwriter.print(s);
                printwriter.print("Active Fragments in ");
                printwriter.print(Integer.toHexString(System.identityHashCode(this)));
                printwriter.println(":");
                for (int l2 = 0; l2 < k2; l2++)
                {
                    Fragment fragment2 = (Fragment)mActive.get(l2);
                    printwriter.print(s);
                    printwriter.print("  #");
                    printwriter.print(l2);
                    printwriter.print(": ");
                    printwriter.println(fragment2);
                    if (fragment2 != null)
                        fragment2.dump(s1, filedescriptor, printwriter, as);
                }

            }
        }
        if (mAdded != null)
        {
            int i2 = mAdded.size();
            if (i2 > 0)
            {
                printwriter.print(s);
                printwriter.println("Added Fragments:");
                for (int j2 = 0; j2 < i2; j2++)
                {
                    Fragment fragment1 = (Fragment)mAdded.get(j2);
                    printwriter.print(s);
                    printwriter.print("  #");
                    printwriter.print(j2);
                    printwriter.print(": ");
                    printwriter.println(fragment1.toString());
                }

            }
        }
        if (mCreatedMenus != null)
        {
            int k1 = mCreatedMenus.size();
            if (k1 > 0)
            {
                printwriter.print(s);
                printwriter.println("Fragments Created Menus:");
                for (int l1 = 0; l1 < k1; l1++)
                {
                    Fragment fragment = (Fragment)mCreatedMenus.get(l1);
                    printwriter.print(s);
                    printwriter.print("  #");
                    printwriter.print(l1);
                    printwriter.print(": ");
                    printwriter.println(fragment.toString());
                }

            }
        }
        if (mBackStack != null)
        {
            int i1 = mBackStack.size();
            if (i1 > 0)
            {
                printwriter.print(s);
                printwriter.println("Back Stack:");
                for (int j1 = 0; j1 < i1; j1++)
                {
                    BackStackRecord backstackrecord1 = (BackStackRecord)mBackStack.get(j1);
                    printwriter.print(s);
                    printwriter.print("  #");
                    printwriter.print(j1);
                    printwriter.print(": ");
                    printwriter.println(backstackrecord1.toString());
                    backstackrecord1.dump(s1, filedescriptor, printwriter, as);
                }

            }
        }
        this;
        JVM INSTR monitorenter ;
        if (mBackStackIndices == null) goto _L2; else goto _L1
_L1:
        int k = mBackStackIndices.size();
        if (k <= 0) goto _L2; else goto _L3
_L3:
        printwriter.print(s);
        printwriter.println("Back Stack Indices:");
        int l = 0;
_L4:
        if (l >= k)
            break; /* Loop/switch isn't completed */
        BackStackRecord backstackrecord = (BackStackRecord)mBackStackIndices.get(l);
        printwriter.print(s);
        printwriter.print("  #");
        printwriter.print(l);
        printwriter.print(": ");
        printwriter.println(backstackrecord);
        l++;
        if (true) goto _L4; else goto _L2
_L2:
        if (mAvailBackStackIndices != null && mAvailBackStackIndices.size() > 0)
        {
            printwriter.print(s);
            printwriter.print("mAvailBackStackIndices: ");
            printwriter.println(Arrays.toString(mAvailBackStackIndices.toArray()));
        }
        this;
        JVM INSTR monitorexit ;
        if (mPendingActions != null)
        {
            int i = mPendingActions.size();
            if (i > 0)
            {
                printwriter.print(s);
                printwriter.println("Pending Actions:");
                for (int j = 0; j < i; j++)
                {
                    Runnable runnable = (Runnable)mPendingActions.get(j);
                    printwriter.print(s);
                    printwriter.print("  #");
                    printwriter.print(j);
                    printwriter.print(": ");
                    printwriter.println(runnable);
                }

            }
        }
        break MISSING_BLOCK_LABEL_694;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        printwriter.print(s);
        printwriter.println("FragmentManager misc state:");
        printwriter.print(s);
        printwriter.print("  mActivity=");
        printwriter.println(mActivity);
        printwriter.print(s);
        printwriter.print("  mContainer=");
        printwriter.println(mContainer);
        if (mParent != null)
        {
            printwriter.print(s);
            printwriter.print("  mParent=");
            printwriter.println(mParent);
        }
        printwriter.print(s);
        printwriter.print("  mCurState=");
        printwriter.print(mCurState);
        printwriter.print(" mStateSaved=");
        printwriter.print(mStateSaved);
        printwriter.print(" mDestroyed=");
        printwriter.println(mDestroyed);
        if (mNeedMenuInvalidate)
        {
            printwriter.print(s);
            printwriter.print("  mNeedMenuInvalidate=");
            printwriter.println(mNeedMenuInvalidate);
        }
        if (mNoTransactionsBecause != null)
        {
            printwriter.print(s);
            printwriter.print("  mNoTransactionsBecause=");
            printwriter.println(mNoTransactionsBecause);
        }
        if (mAvailIndices != null && mAvailIndices.size() > 0)
        {
            printwriter.print(s);
            printwriter.print("  mAvailIndices: ");
            printwriter.println(Arrays.toString(mAvailIndices.toArray()));
        }
        return;
    }

    public void enqueueAction(Runnable runnable, boolean flag)
    {
        if (!flag)
            checkStateLoss();
        this;
        JVM INSTR monitorenter ;
        if (mActivity == null)
            throw new IllegalStateException("Activity has been destroyed");
        break MISSING_BLOCK_LABEL_33;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        if (mPendingActions == null)
            mPendingActions = new ArrayList();
        mPendingActions.add(runnable);
        if (mPendingActions.size() == 1)
        {
            mActivity.mHandler.removeCallbacks(mExecCommit);
            mActivity.mHandler.post(mExecCommit);
        }
        this;
        JVM INSTR monitorexit ;
    }

    public boolean execPendingActions()
    {
        if (mExecutingActions)
            throw new IllegalStateException("Recursive entry to executePendingTransactions");
        if (Looper.myLooper() != mActivity.mHandler.getLooper())
            throw new IllegalStateException("Must be called from main thread of process");
        boolean flag = false;
_L2:
        this;
        JVM INSTR monitorenter ;
        if (mPendingActions != null && mPendingActions.size() != 0)
            break MISSING_BLOCK_LABEL_136;
        this;
        JVM INSTR monitorexit ;
        boolean flag1;
        if (!mHavePendingDeferredStart)
            break MISSING_BLOCK_LABEL_275;
        flag1 = false;
        for (int i = 0; i < mActive.size(); i++)
        {
            Fragment fragment = (Fragment)mActive.get(i);
            if (fragment != null && fragment.mLoaderManager != null)
                flag1 |= fragment.mLoaderManager.hasRunningLoaders();
        }

        break; /* Loop/switch isn't completed */
        int j;
        j = mPendingActions.size();
        if (mTmpActions == null || mTmpActions.length < j)
            mTmpActions = new Runnable[j];
        mPendingActions.toArray(mTmpActions);
        mPendingActions.clear();
        mActivity.mHandler.removeCallbacks(mExecCommit);
        this;
        JVM INSTR monitorexit ;
        mExecutingActions = true;
        for (int k = 0; k < j; k++)
        {
            mTmpActions[k].run();
            mTmpActions[k] = null;
        }

        break MISSING_BLOCK_LABEL_252;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        mExecutingActions = false;
        flag = true;
        if (true) goto _L2; else goto _L1
_L1:
        if (!flag1)
        {
            mHavePendingDeferredStart = false;
            startPendingDeferredFragments();
        }
        return flag;
    }

    public boolean executePendingTransactions()
    {
        return execPendingActions();
    }

    public Fragment findFragmentById(int i)
    {
label0:
        {
            Fragment fragment;
label1:
            {
                if (mAdded != null)
                {
                    for (int k = -1 + mAdded.size(); k >= 0; k--)
                    {
                        fragment = (Fragment)mAdded.get(k);
                        if (fragment != null && fragment.mFragmentId == i)
                            break label1;
                    }

                }
                if (mActive == null)
                    break label0;
                int j = -1 + mActive.size();
                do
                {
                    if (j < 0)
                        break label0;
                    fragment = (Fragment)mActive.get(j);
                    if (fragment != null && fragment.mFragmentId == i)
                        break;
                    j--;
                } while (true);
            }
            return fragment;
        }
        return null;
    }

    public Fragment findFragmentByTag(String s)
    {
label0:
        {
            Fragment fragment;
label1:
            {
                if (mAdded != null && s != null)
                {
                    for (int j = -1 + mAdded.size(); j >= 0; j--)
                    {
                        fragment = (Fragment)mAdded.get(j);
                        if (fragment != null && s.equals(fragment.mTag))
                            break label1;
                    }

                }
                if (mActive == null || s == null)
                    break label0;
                int i = -1 + mActive.size();
                do
                {
                    if (i < 0)
                        break label0;
                    fragment = (Fragment)mActive.get(i);
                    if (fragment != null && s.equals(fragment.mTag))
                        break;
                    i--;
                } while (true);
            }
            return fragment;
        }
        return null;
    }

    public Fragment findFragmentByWho(String s)
    {
        if (mActive != null && s != null)
        {
            for (int i = -1 + mActive.size(); i >= 0; i--)
            {
                Fragment fragment = (Fragment)mActive.get(i);
                if (fragment == null)
                    continue;
                Fragment fragment1 = fragment.findFragmentByWho(s);
                if (fragment1 != null)
                    return fragment1;
            }

        }
        return null;
    }

    public void freeBackStackIndex(int i)
    {
        this;
        JVM INSTR monitorenter ;
        mBackStackIndices.set(i, null);
        if (mAvailBackStackIndices == null)
            mAvailBackStackIndices = new ArrayList();
        if (DEBUG)
            Log.v("FragmentManager", (new StringBuilder()).append("Freeing back stack index ").append(i).toString());
        mAvailBackStackIndices.add(Integer.valueOf(i));
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public FragmentManager.BackStackEntry getBackStackEntryAt(int i)
    {
        return (FragmentManager.BackStackEntry)mBackStack.get(i);
    }

    public int getBackStackEntryCount()
    {
        if (mBackStack != null)
            return mBackStack.size();
        else
            return 0;
    }

    public Fragment getFragment(Bundle bundle, String s)
    {
        int i = bundle.getInt(s, -1);
        Fragment fragment;
        if (i == -1)
        {
            fragment = null;
        } else
        {
            if (i >= mActive.size())
                throwException(new IllegalStateException((new StringBuilder()).append("Fragement no longer exists for key ").append(s).append(": index ").append(i).toString()));
            fragment = (Fragment)mActive.get(i);
            if (fragment == null)
            {
                throwException(new IllegalStateException((new StringBuilder()).append("Fragement no longer exists for key ").append(s).append(": index ").append(i).toString()));
                return fragment;
            }
        }
        return fragment;
    }

    public void hideFragment(Fragment fragment, int i, int j)
    {
        if (DEBUG)
            Log.v("FragmentManager", (new StringBuilder()).append("hide: ").append(fragment).toString());
        if (!fragment.mHidden)
        {
            fragment.mHidden = true;
            if (fragment.mView != null)
            {
                Animation animation = loadAnimation(fragment, i, true, j);
                if (animation != null)
                    fragment.mView.startAnimation(animation);
                fragment.mView.setVisibility(8);
            }
            if (fragment.mAdded && fragment.mHasMenu && fragment.mMenuVisible)
                mNeedMenuInvalidate = true;
            fragment.onHiddenChanged(true);
        }
    }

    Animation loadAnimation(Fragment fragment, int i, boolean flag, int j)
    {
        Animation animation = fragment.onCreateAnimation(i, flag, fragment.mNextAnim);
        if (animation != null)
            return animation;
        if (fragment.mNextAnim != 0)
        {
            Animation animation1 = AnimationUtils.loadAnimation(mActivity, fragment.mNextAnim);
            if (animation1 != null)
                return animation1;
        }
        if (i == 0)
            return null;
        int k = transitToStyleIndex(i, flag);
        if (k < 0)
            return null;
        switch (k)
        {
        case 6: // '\006'
            return makeFadeAnimation(mActivity, 1.0F, 0.0F);

        case 5: // '\005'
            return makeFadeAnimation(mActivity, 0.0F, 1.0F);

        case 4: // '\004'
            return makeOpenCloseAnimation(mActivity, 1.0F, 1.075F, 1.0F, 0.0F);

        case 3: // '\003'
            return makeOpenCloseAnimation(mActivity, 0.975F, 1.0F, 0.0F, 1.0F);

        case 2: // '\002'
            return makeOpenCloseAnimation(mActivity, 1.0F, 0.975F, 1.0F, 0.0F);

        case 1: // '\001'
            return makeOpenCloseAnimation(mActivity, 1.125F, 1.0F, 0.0F, 1.0F);
        }
        if (j == 0 && mActivity.getWindow() != null)
            j = mActivity.getWindow().getAttributes().windowAnimations;
        if (j == 0)
            return null;
        else
            return null;
    }

    void makeActive(Fragment fragment)
    {
        if (fragment.mIndex < 0)
        {
            if (mAvailIndices != null && mAvailIndices.size() > 0)
            {
                fragment.setIndex(((Integer)mAvailIndices.remove(-1 + mAvailIndices.size())).intValue(), mParent);
                mActive.set(fragment.mIndex, fragment);
            } else
            {
                if (mActive == null)
                    mActive = new ArrayList();
                fragment.setIndex(mActive.size(), mParent);
                mActive.add(fragment);
            }
            if (DEBUG)
            {
                Log.v("FragmentManager", (new StringBuilder()).append("Allocated fragment index ").append(fragment).toString());
                return;
            }
        }
    }

    void makeInactive(Fragment fragment)
    {
        if (fragment.mIndex < 0)
            return;
        if (DEBUG)
            Log.v("FragmentManager", (new StringBuilder()).append("Freeing fragment index ").append(fragment).toString());
        mActive.set(fragment.mIndex, null);
        if (mAvailIndices == null)
            mAvailIndices = new ArrayList();
        mAvailIndices.add(Integer.valueOf(fragment.mIndex));
        mActivity.invalidateSupportFragment(fragment.mWho);
        fragment.initState();
    }

    void moveToState(int i, int j, int k, boolean flag)
    {
        if (mActivity == null && i != 0)
            throw new IllegalStateException("No activity");
        if (flag || mCurState != i)
        {
            mCurState = i;
            if (mActive != null)
            {
                boolean flag1 = false;
                for (int l = 0; l < mActive.size(); l++)
                {
                    Fragment fragment = (Fragment)mActive.get(l);
                    if (fragment == null)
                        continue;
                    moveToState(fragment, i, j, k, false);
                    if (fragment.mLoaderManager != null)
                        flag1 |= fragment.mLoaderManager.hasRunningLoaders();
                }

                if (!flag1)
                    startPendingDeferredFragments();
                if (mNeedMenuInvalidate && mActivity != null && mCurState == 5)
                {
                    mActivity.supportInvalidateOptionsMenu();
                    mNeedMenuInvalidate = false;
                    return;
                }
            }
        }
    }

    void moveToState(int i, boolean flag)
    {
        moveToState(i, 0, 0, flag);
    }

    void moveToState(Fragment fragment)
    {
        moveToState(fragment, mCurState, 0, 0, false);
    }

    void moveToState(final Fragment fragment, int i, int j, int k, boolean flag)
    {
        if ((!fragment.mAdded || fragment.mDetached) && i > 1)
            i = 1;
        if (fragment.mRemoving && i > fragment.mState)
            i = fragment.mState;
        if (fragment.mDeferStart && fragment.mState < 4 && i > 3)
            i = 3;
        if (fragment.mState < i)
        {
            if (fragment.mFromLayout && !fragment.mInLayout)
                return;
            if (fragment.mAnimatingAway != null)
            {
                fragment.mAnimatingAway = null;
                moveToState(fragment, fragment.mStateAfterAnimating, 0, 0, true);
            }
            switch (fragment.mState)
            {
            case 0: // '\0'
                if (DEBUG)
                    Log.v("FragmentManager", (new StringBuilder()).append("moveto CREATED: ").append(fragment).toString());
                if (fragment.mSavedFragmentState != null)
                {
                    fragment.mSavedViewState = fragment.mSavedFragmentState.getSparseParcelableArray("android:view_state");
                    fragment.mTarget = getFragment(fragment.mSavedFragmentState, "android:target_state");
                    if (fragment.mTarget != null)
                        fragment.mTargetRequestCode = fragment.mSavedFragmentState.getInt("android:target_req_state", 0);
                    fragment.mUserVisibleHint = fragment.mSavedFragmentState.getBoolean("android:user_visible_hint", true);
                    if (!fragment.mUserVisibleHint)
                    {
                        fragment.mDeferStart = true;
                        if (i > 3)
                            i = 3;
                    }
                }
                fragment.mActivity = mActivity;
                fragment.mParentFragment = mParent;
                FragmentManagerImpl fragmentmanagerimpl;
                if (mParent != null)
                    fragmentmanagerimpl = mParent.mChildFragmentManager;
                else
                    fragmentmanagerimpl = mActivity.mFragments;
                fragment.mFragmentManager = fragmentmanagerimpl;
                fragment.mCalled = false;
                fragment.onAttach(mActivity);
                if (!fragment.mCalled)
                    throw new SuperNotCalledException((new StringBuilder()).append("Fragment ").append(fragment).append(" did not call through to super.onAttach()").toString());
                if (fragment.mParentFragment == null)
                    mActivity.onAttachFragment(fragment);
                if (!fragment.mRetaining)
                    fragment.performCreate(fragment.mSavedFragmentState);
                fragment.mRetaining = false;
                if (fragment.mFromLayout)
                {
                    fragment.mView = fragment.performCreateView(fragment.getLayoutInflater(fragment.mSavedFragmentState), null, fragment.mSavedFragmentState);
                    if (fragment.mView != null)
                    {
                        fragment.mInnerView = fragment.mView;
                        fragment.mView = NoSaveStateFrameLayout.wrap(fragment.mView);
                        if (fragment.mHidden)
                            fragment.mView.setVisibility(8);
                        fragment.onViewCreated(fragment.mView, fragment.mSavedFragmentState);
                    } else
                    {
                        fragment.mInnerView = null;
                    }
                }
                // fall through

            case 1: // '\001'
                if (i > 1)
                {
                    if (DEBUG)
                        Log.v("FragmentManager", (new StringBuilder()).append("moveto ACTIVITY_CREATED: ").append(fragment).toString());
                    if (!fragment.mFromLayout)
                    {
                        int i1 = fragment.mContainerId;
                        ViewGroup viewgroup = null;
                        if (i1 != 0)
                        {
                            viewgroup = (ViewGroup)mContainer.findViewById(fragment.mContainerId);
                            if (viewgroup == null && !fragment.mRestored)
                                throwException(new IllegalArgumentException((new StringBuilder()).append("No view found for id 0x").append(Integer.toHexString(fragment.mContainerId)).append(" (").append(fragment.getResources().getResourceName(fragment.mContainerId)).append(") for fragment ").append(fragment).toString()));
                        }
                        fragment.mContainer = viewgroup;
                        fragment.mView = fragment.performCreateView(fragment.getLayoutInflater(fragment.mSavedFragmentState), viewgroup, fragment.mSavedFragmentState);
                        if (fragment.mView != null)
                        {
                            fragment.mInnerView = fragment.mView;
                            fragment.mView = NoSaveStateFrameLayout.wrap(fragment.mView);
                            if (viewgroup != null)
                            {
                                Animation animation1 = loadAnimation(fragment, j, true, k);
                                if (animation1 != null)
                                    fragment.mView.startAnimation(animation1);
                                viewgroup.addView(fragment.mView);
                            }
                            if (fragment.mHidden)
                                fragment.mView.setVisibility(8);
                            fragment.onViewCreated(fragment.mView, fragment.mSavedFragmentState);
                        } else
                        {
                            fragment.mInnerView = null;
                        }
                    }
                    fragment.performActivityCreated(fragment.mSavedFragmentState);
                    if (fragment.mView != null)
                        fragment.restoreViewState(fragment.mSavedFragmentState);
                    fragment.mSavedFragmentState = null;
                }
                // fall through

            case 2: // '\002'
            case 3: // '\003'
                if (i > 3)
                {
                    if (DEBUG)
                        Log.v("FragmentManager", (new StringBuilder()).append("moveto STARTED: ").append(fragment).toString());
                    fragment.performStart();
                }
                // fall through

            case 4: // '\004'
                if (i > 4)
                {
                    if (DEBUG)
                        Log.v("FragmentManager", (new StringBuilder()).append("moveto RESUMED: ").append(fragment).toString());
                    fragment.mResumed = true;
                    fragment.performResume();
                    fragment.mSavedFragmentState = null;
                    fragment.mSavedViewState = null;
                }
                break;
            }
        } else
        if (fragment.mState > i)
            switch (fragment.mState)
            {
            default:
                break;

            case 5: // '\005'
                if (i < 5)
                {
                    if (DEBUG)
                        Log.v("FragmentManager", (new StringBuilder()).append("movefrom RESUMED: ").append(fragment).toString());
                    fragment.performPause();
                    fragment.mResumed = false;
                }
                // fall through

            case 4: // '\004'
                if (i < 4)
                {
                    if (DEBUG)
                        Log.v("FragmentManager", (new StringBuilder()).append("movefrom STARTED: ").append(fragment).toString());
                    fragment.performStop();
                }
                // fall through

            case 3: // '\003'
                if (i < 3)
                {
                    if (DEBUG)
                        Log.v("FragmentManager", (new StringBuilder()).append("movefrom STOPPED: ").append(fragment).toString());
                    fragment.performReallyStop();
                }
                // fall through

            case 2: // '\002'
                if (i < 2)
                {
                    if (DEBUG)
                        Log.v("FragmentManager", (new StringBuilder()).append("movefrom ACTIVITY_CREATED: ").append(fragment).toString());
                    if (fragment.mView != null && !mActivity.isFinishing() && fragment.mSavedViewState == null)
                        saveFragmentViewState(fragment);
                    fragment.performDestroyView();
                    if (fragment.mView != null && fragment.mContainer != null)
                    {
                        int l = mCurState;
                        Animation animation = null;
                        if (l > 0)
                        {
                            boolean flag1 = mDestroyed;
                            animation = null;
                            if (!flag1)
                                animation = loadAnimation(fragment, j, false, k);
                        }
                        if (animation != null)
                        {
                            fragment.mAnimatingAway = fragment.mView;
                            fragment.mStateAfterAnimating = i;
                            animation.setAnimationListener(new android.view.animation.Animation.AnimationListener() {

                                final FragmentManagerImpl this$0;
                                final Fragment val$fragment;

                                public void onAnimationEnd(Animation animation2)
                                {
                                    if (fragment.mAnimatingAway != null)
                                    {
                                        fragment.mAnimatingAway = null;
                                        moveToState(fragment, fragment.mStateAfterAnimating, 0, 0, false);
                                    }
                                }

                                public void onAnimationRepeat(Animation animation2)
                                {
                                }

                                public void onAnimationStart(Animation animation2)
                                {
                                }

            
            {
                this$0 = FragmentManagerImpl.this;
                fragment = fragment1;
                super();
            }
                            }
);
                            fragment.mView.startAnimation(animation);
                        }
                        fragment.mContainer.removeView(fragment.mView);
                    }
                    fragment.mContainer = null;
                    fragment.mView = null;
                    fragment.mInnerView = null;
                }
                // fall through

            case 1: // '\001'
                if (i < 1)
                {
                    if (mDestroyed && fragment.mAnimatingAway != null)
                    {
                        View view = fragment.mAnimatingAway;
                        fragment.mAnimatingAway = null;
                        view.clearAnimation();
                    }
                    if (fragment.mAnimatingAway != null)
                    {
                        fragment.mStateAfterAnimating = i;
                        i = 1;
                    } else
                    {
                        if (DEBUG)
                            Log.v("FragmentManager", (new StringBuilder()).append("movefrom CREATED: ").append(fragment).toString());
                        if (!fragment.mRetaining)
                            fragment.performDestroy();
                        fragment.mCalled = false;
                        fragment.onDetach();
                        if (!fragment.mCalled)
                            throw new SuperNotCalledException((new StringBuilder()).append("Fragment ").append(fragment).append(" did not call through to super.onDetach()").toString());
                        if (!flag)
                            if (!fragment.mRetaining)
                            {
                                makeInactive(fragment);
                            } else
                            {
                                fragment.mActivity = null;
                                fragment.mFragmentManager = null;
                            }
                    }
                }
                break;
            }
        fragment.mState = i;
    }

    public void noteStateNotSaved()
    {
        mStateSaved = false;
    }

    public void performPendingDeferredStart(Fragment fragment)
    {
label0:
        {
            if (fragment.mDeferStart)
            {
                if (!mExecutingActions)
                    break label0;
                mHavePendingDeferredStart = true;
            }
            return;
        }
        fragment.mDeferStart = false;
        moveToState(fragment, mCurState, 0, 0, false);
    }

    public void popBackStack()
    {
        enqueueAction(new Runnable() {

            final FragmentManagerImpl this$0;

            public void run()
            {
                popBackStackState(mActivity.mHandler, null, -1, 0);
            }

            
            {
                this$0 = FragmentManagerImpl.this;
                super();
            }
        }
, false);
    }

    public void popBackStack(final int id, final int flags)
    {
        if (id < 0)
        {
            throw new IllegalArgumentException((new StringBuilder()).append("Bad id: ").append(id).toString());
        } else
        {
            enqueueAction(new Runnable() {

                final FragmentManagerImpl this$0;
                final int val$flags;
                final int val$id;

                public void run()
                {
                    popBackStackState(mActivity.mHandler, null, id, flags);
                }

            
            {
                this$0 = FragmentManagerImpl.this;
                id = i;
                flags = j;
                super();
            }
            }
, false);
            return;
        }
    }

    public void popBackStack(final String name, final int flags)
    {
        enqueueAction(new Runnable() {

            final FragmentManagerImpl this$0;
            final int val$flags;
            final String val$name;

            public void run()
            {
                popBackStackState(mActivity.mHandler, name, -1, flags);
            }

            
            {
                this$0 = FragmentManagerImpl.this;
                name = s;
                flags = i;
                super();
            }
        }
, false);
    }

    public boolean popBackStackImmediate()
    {
        checkStateLoss();
        executePendingTransactions();
        return popBackStackState(mActivity.mHandler, null, -1, 0);
    }

    public boolean popBackStackImmediate(int i, int j)
    {
        checkStateLoss();
        executePendingTransactions();
        if (i < 0)
            throw new IllegalArgumentException((new StringBuilder()).append("Bad id: ").append(i).toString());
        else
            return popBackStackState(mActivity.mHandler, null, i, j);
    }

    public boolean popBackStackImmediate(String s, int i)
    {
        checkStateLoss();
        executePendingTransactions();
        return popBackStackState(mActivity.mHandler, s, -1, i);
    }

    boolean popBackStackState(Handler handler, String s, int i, int j)
    {
        if (mBackStack == null) goto _L2; else goto _L1
_L1:
        if (s != null || i >= 0 || (j & 1) != 0) goto _L4; else goto _L3
_L3:
        int k1 = -1 + mBackStack.size();
        if (k1 < 0) goto _L2; else goto _L5
_L5:
        ((BackStackRecord)mBackStack.remove(k1)).popFromBackStack(true);
        reportBackStackChanged();
          goto _L6
_L4:
        int k = -1;
        if (s == null && i < 0) goto _L8; else goto _L7
_L7:
        k = -1 + mBackStack.size();
        do
        {
            if (k < 0)
                break;
            BackStackRecord backstackrecord2 = (BackStackRecord)mBackStack.get(k);
            if (s != null && s.equals(backstackrecord2.getName()) || i >= 0 && i == backstackrecord2.mIndex)
                break;
            k--;
        } while (true);
        if (k < 0) goto _L2; else goto _L9
_L9:
        if ((j & 1) == 0) goto _L8; else goto _L10
_L10:
        k--;
_L15:
        if (k < 0) goto _L8; else goto _L11
_L11:
        BackStackRecord backstackrecord1 = (BackStackRecord)mBackStack.get(k);
        if (s != null && s.equals(backstackrecord1.getName()) || i >= 0 && i == backstackrecord1.mIndex) goto _L12; else goto _L8
_L8:
        if (k == -1 + mBackStack.size()) goto _L2; else goto _L13
_L13:
        ArrayList arraylist = new ArrayList();
        for (int l = -1 + mBackStack.size(); l > k; l--)
            arraylist.add(mBackStack.remove(l));

        int i1 = -1 + arraylist.size();
        for (int j1 = 0; j1 <= i1; j1++)
        {
            if (DEBUG)
                Log.v("FragmentManager", (new StringBuilder()).append("Popping back stack state: ").append(arraylist.get(j1)).toString());
            BackStackRecord backstackrecord = (BackStackRecord)arraylist.get(j1);
            boolean flag;
            if (j1 == i1)
                flag = true;
            else
                flag = false;
            backstackrecord.popFromBackStack(flag);
        }

        reportBackStackChanged();
_L6:
        return true;
_L2:
        return false;
_L12:
        k--;
        if (true) goto _L15; else goto _L14
_L14:
    }

    public void putFragment(Bundle bundle, String s, Fragment fragment)
    {
        if (fragment.mIndex < 0)
            throwException(new IllegalStateException((new StringBuilder()).append("Fragment ").append(fragment).append(" is not currently in the FragmentManager").toString()));
        bundle.putInt(s, fragment.mIndex);
    }

    public void removeFragment(Fragment fragment, int i, int j)
    {
        if (DEBUG)
            Log.v("FragmentManager", (new StringBuilder()).append("remove: ").append(fragment).append(" nesting=").append(fragment.mBackStackNesting).toString());
        boolean flag;
        if (!fragment.isInBackStack())
            flag = true;
        else
            flag = false;
        if (!fragment.mDetached || flag)
        {
            if (mAdded != null)
                mAdded.remove(fragment);
            if (fragment.mHasMenu && fragment.mMenuVisible)
                mNeedMenuInvalidate = true;
            fragment.mAdded = false;
            fragment.mRemoving = true;
            int k;
            if (flag)
                k = 0;
            else
                k = 1;
            moveToState(fragment, k, i, j, false);
        }
    }

    public void removeOnBackStackChangedListener(FragmentManager.OnBackStackChangedListener onbackstackchangedlistener)
    {
        if (mBackStackChangeListeners != null)
            mBackStackChangeListeners.remove(onbackstackchangedlistener);
    }

    void reportBackStackChanged()
    {
        if (mBackStackChangeListeners != null)
        {
            for (int i = 0; i < mBackStackChangeListeners.size(); i++)
                ((FragmentManager.OnBackStackChangedListener)mBackStackChangeListeners.get(i)).onBackStackChanged();

        }
    }

    void restoreAllState(Parcelable parcelable, ArrayList arraylist)
    {
label0:
        {
            if (parcelable != null)
            {
                FragmentManagerState fragmentmanagerstate = (FragmentManagerState)parcelable;
                if (fragmentmanagerstate.mActive != null)
                {
                    if (arraylist != null)
                    {
                        for (int i1 = 0; i1 < arraylist.size(); i1++)
                        {
                            Fragment fragment3 = (Fragment)arraylist.get(i1);
                            if (DEBUG)
                                Log.v("FragmentManager", (new StringBuilder()).append("restoreAllState: re-attaching retained ").append(fragment3).toString());
                            FragmentState fragmentstate1 = fragmentmanagerstate.mActive[fragment3.mIndex];
                            fragmentstate1.mInstance = fragment3;
                            fragment3.mSavedViewState = null;
                            fragment3.mBackStackNesting = 0;
                            fragment3.mInLayout = false;
                            fragment3.mAdded = false;
                            fragment3.mTarget = null;
                            if (fragmentstate1.mSavedFragmentState != null)
                            {
                                fragmentstate1.mSavedFragmentState.setClassLoader(mActivity.getClassLoader());
                                fragment3.mSavedViewState = fragmentstate1.mSavedFragmentState.getSparseParcelableArray("android:view_state");
                            }
                        }

                    }
                    mActive = new ArrayList(fragmentmanagerstate.mActive.length);
                    if (mAvailIndices != null)
                        mAvailIndices.clear();
                    for (int i = 0; i < fragmentmanagerstate.mActive.length; i++)
                    {
                        FragmentState fragmentstate = fragmentmanagerstate.mActive[i];
                        if (fragmentstate != null)
                        {
                            Fragment fragment2 = fragmentstate.instantiate(mActivity, mParent);
                            if (DEBUG)
                                Log.v("FragmentManager", (new StringBuilder()).append("restoreAllState: active #").append(i).append(": ").append(fragment2).toString());
                            mActive.add(fragment2);
                            fragmentstate.mInstance = null;
                            continue;
                        }
                        mActive.add(null);
                        if (mAvailIndices == null)
                            mAvailIndices = new ArrayList();
                        if (DEBUG)
                            Log.v("FragmentManager", (new StringBuilder()).append("restoreAllState: avail #").append(i).toString());
                        mAvailIndices.add(Integer.valueOf(i));
                    }

                    if (arraylist != null)
                    {
                        for (int l = 0; l < arraylist.size(); l++)
                        {
                            Fragment fragment1 = (Fragment)arraylist.get(l);
                            if (fragment1.mTargetIndex < 0)
                                continue;
                            if (fragment1.mTargetIndex < mActive.size())
                            {
                                fragment1.mTarget = (Fragment)mActive.get(fragment1.mTargetIndex);
                            } else
                            {
                                Log.w("FragmentManager", (new StringBuilder()).append("Re-attaching retained fragment ").append(fragment1).append(" target no longer exists: ").append(fragment1.mTargetIndex).toString());
                                fragment1.mTarget = null;
                            }
                        }

                    }
                    if (fragmentmanagerstate.mAdded != null)
                    {
                        mAdded = new ArrayList(fragmentmanagerstate.mAdded.length);
                        for (int k = 0; k < fragmentmanagerstate.mAdded.length; k++)
                        {
                            Fragment fragment = (Fragment)mActive.get(fragmentmanagerstate.mAdded[k]);
                            if (fragment == null)
                                throwException(new IllegalStateException((new StringBuilder()).append("No instantiated fragment for index #").append(fragmentmanagerstate.mAdded[k]).toString()));
                            fragment.mAdded = true;
                            if (DEBUG)
                                Log.v("FragmentManager", (new StringBuilder()).append("restoreAllState: added #").append(k).append(": ").append(fragment).toString());
                            if (mAdded.contains(fragment))
                                throw new IllegalStateException("Already added!");
                            mAdded.add(fragment);
                        }

                    } else
                    {
                        mAdded = null;
                    }
                    if (fragmentmanagerstate.mBackStack == null)
                        break label0;
                    mBackStack = new ArrayList(fragmentmanagerstate.mBackStack.length);
                    for (int j = 0; j < fragmentmanagerstate.mBackStack.length; j++)
                    {
                        BackStackRecord backstackrecord = fragmentmanagerstate.mBackStack[j].instantiate(this);
                        if (DEBUG)
                        {
                            Log.v("FragmentManager", (new StringBuilder()).append("restoreAllState: back stack #").append(j).append(" (index ").append(backstackrecord.mIndex).append("): ").append(backstackrecord).toString());
                            backstackrecord.dump("  ", new PrintWriter(new LogWriter("FragmentManager")), false);
                        }
                        mBackStack.add(backstackrecord);
                        if (backstackrecord.mIndex >= 0)
                            setBackStackIndex(backstackrecord.mIndex, backstackrecord);
                    }

                }
            }
            return;
        }
        mBackStack = null;
    }

    ArrayList retainNonConfig()
    {
        ArrayList arraylist = mActive;
        ArrayList arraylist1 = null;
        if (arraylist != null)
        {
            for (int i = 0; i < mActive.size(); i++)
            {
                Fragment fragment = (Fragment)mActive.get(i);
                if (fragment == null || !fragment.mRetainInstance)
                    continue;
                if (arraylist1 == null)
                    arraylist1 = new ArrayList();
                arraylist1.add(fragment);
                fragment.mRetaining = true;
                int j;
                if (fragment.mTarget != null)
                    j = fragment.mTarget.mIndex;
                else
                    j = -1;
                fragment.mTargetIndex = j;
                if (DEBUG)
                    Log.v("FragmentManager", (new StringBuilder()).append("retainNonConfig: keeping retained ").append(fragment).toString());
            }

        }
        return arraylist1;
    }

    Parcelable saveAllState()
    {
        FragmentState afragmentstate[];
label0:
        {
            execPendingActions();
            if (HONEYCOMB)
                mStateSaved = true;
            if (mActive != null && mActive.size() > 0)
            {
                int i = mActive.size();
                afragmentstate = new FragmentState[i];
                boolean flag = false;
                for (int j = 0; j < i; j++)
                {
                    Fragment fragment = (Fragment)mActive.get(j);
                    if (fragment == null)
                        continue;
                    if (fragment.mIndex < 0)
                        throwException(new IllegalStateException((new StringBuilder()).append("Failure saving state: active ").append(fragment).append(" has cleared index: ").append(fragment.mIndex).toString()));
                    flag = true;
                    FragmentState fragmentstate = new FragmentState(fragment);
                    afragmentstate[j] = fragmentstate;
                    if (fragment.mState > 0 && fragmentstate.mSavedFragmentState == null)
                    {
                        fragmentstate.mSavedFragmentState = saveFragmentBasicState(fragment);
                        if (fragment.mTarget != null)
                        {
                            if (fragment.mTarget.mIndex < 0)
                                throwException(new IllegalStateException((new StringBuilder()).append("Failure saving state: ").append(fragment).append(" has target not in fragment manager: ").append(fragment.mTarget).toString()));
                            if (fragmentstate.mSavedFragmentState == null)
                                fragmentstate.mSavedFragmentState = new Bundle();
                            putFragment(fragmentstate.mSavedFragmentState, "android:target_state", fragment.mTarget);
                            if (fragment.mTargetRequestCode != 0)
                                fragmentstate.mSavedFragmentState.putInt("android:target_req_state", fragment.mTargetRequestCode);
                        }
                    } else
                    {
                        fragmentstate.mSavedFragmentState = fragment.mSavedFragmentState;
                    }
                    if (DEBUG)
                        Log.v("FragmentManager", (new StringBuilder()).append("Saved state of ").append(fragment).append(": ").append(fragmentstate.mSavedFragmentState).toString());
                }

                if (flag)
                    break label0;
                if (DEBUG)
                {
                    Log.v("FragmentManager", "saveAllState: no fragments!");
                    return null;
                }
            }
            return null;
        }
        ArrayList arraylist = mAdded;
        int ai[] = null;
        if (arraylist != null)
        {
            int i1 = mAdded.size();
            ai = null;
            if (i1 > 0)
            {
                ai = new int[i1];
                for (int j1 = 0; j1 < i1; j1++)
                {
                    ai[j1] = ((Fragment)mAdded.get(j1)).mIndex;
                    if (ai[j1] < 0)
                        throwException(new IllegalStateException((new StringBuilder()).append("Failure saving state: active ").append(mAdded.get(j1)).append(" has cleared index: ").append(ai[j1]).toString()));
                    if (DEBUG)
                        Log.v("FragmentManager", (new StringBuilder()).append("saveAllState: adding fragment #").append(j1).append(": ").append(mAdded.get(j1)).toString());
                }

            }
        }
        ArrayList arraylist1 = mBackStack;
        BackStackState abackstackstate[] = null;
        if (arraylist1 != null)
        {
            int k = mBackStack.size();
            abackstackstate = null;
            if (k > 0)
            {
                abackstackstate = new BackStackState[k];
                for (int l = 0; l < k; l++)
                {
                    abackstackstate[l] = new BackStackState(this, (BackStackRecord)mBackStack.get(l));
                    if (DEBUG)
                        Log.v("FragmentManager", (new StringBuilder()).append("saveAllState: adding back stack #").append(l).append(": ").append(mBackStack.get(l)).toString());
                }

            }
        }
        FragmentManagerState fragmentmanagerstate = new FragmentManagerState();
        fragmentmanagerstate.mActive = afragmentstate;
        fragmentmanagerstate.mAdded = ai;
        fragmentmanagerstate.mBackStack = abackstackstate;
        return fragmentmanagerstate;
    }

    Bundle saveFragmentBasicState(Fragment fragment)
    {
        if (mStateBundle == null)
            mStateBundle = new Bundle();
        fragment.performSaveInstanceState(mStateBundle);
        boolean flag = mStateBundle.isEmpty();
        Bundle bundle = null;
        if (!flag)
        {
            bundle = mStateBundle;
            mStateBundle = null;
        }
        if (fragment.mView != null)
            saveFragmentViewState(fragment);
        if (fragment.mSavedViewState != null)
        {
            if (bundle == null)
                bundle = new Bundle();
            bundle.putSparseParcelableArray("android:view_state", fragment.mSavedViewState);
        }
        if (!fragment.mUserVisibleHint)
        {
            if (bundle == null)
                bundle = new Bundle();
            bundle.putBoolean("android:user_visible_hint", fragment.mUserVisibleHint);
        }
        return bundle;
    }

    public Fragment.SavedState saveFragmentInstanceState(Fragment fragment)
    {
        if (fragment.mIndex < 0)
            throwException(new IllegalStateException((new StringBuilder()).append("Fragment ").append(fragment).append(" is not currently in the FragmentManager").toString()));
        int i = fragment.mState;
        Fragment.SavedState savedstate = null;
        if (i > 0)
        {
            Bundle bundle = saveFragmentBasicState(fragment);
            savedstate = null;
            if (bundle != null)
                savedstate = new Fragment.SavedState(bundle);
        }
        return savedstate;
    }

    void saveFragmentViewState(Fragment fragment)
    {
        if (fragment.mInnerView != null)
        {
            if (mStateArray == null)
                mStateArray = new SparseArray();
            else
                mStateArray.clear();
            fragment.mInnerView.saveHierarchyState(mStateArray);
            if (mStateArray.size() > 0)
            {
                fragment.mSavedViewState = mStateArray;
                mStateArray = null;
                return;
            }
        }
    }

    public void setBackStackIndex(int i, BackStackRecord backstackrecord)
    {
        this;
        JVM INSTR monitorenter ;
        int j;
        if (mBackStackIndices == null)
            mBackStackIndices = new ArrayList();
        j = mBackStackIndices.size();
        if (i >= j) goto _L2; else goto _L1
_L1:
        if (DEBUG)
            Log.v("FragmentManager", (new StringBuilder()).append("Setting back stack index ").append(i).append(" to ").append(backstackrecord).toString());
        mBackStackIndices.set(i, backstackrecord);
_L4:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        mBackStackIndices.add(null);
        if (mAvailBackStackIndices == null)
            mAvailBackStackIndices = new ArrayList();
        if (DEBUG)
            Log.v("FragmentManager", (new StringBuilder()).append("Adding available back stack index ").append(j).toString());
        mAvailBackStackIndices.add(Integer.valueOf(j));
        j++;
        if (true) goto _L2; else goto _L3
_L3:
        if (DEBUG)
            Log.v("FragmentManager", (new StringBuilder()).append("Adding back stack index ").append(i).append(" with ").append(backstackrecord).toString());
        mBackStackIndices.add(backstackrecord);
          goto _L4
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void showFragment(Fragment fragment, int i, int j)
    {
        if (DEBUG)
            Log.v("FragmentManager", (new StringBuilder()).append("show: ").append(fragment).toString());
        if (fragment.mHidden)
        {
            fragment.mHidden = false;
            if (fragment.mView != null)
            {
                Animation animation = loadAnimation(fragment, i, true, j);
                if (animation != null)
                    fragment.mView.startAnimation(animation);
                fragment.mView.setVisibility(0);
            }
            if (fragment.mAdded && fragment.mHasMenu && fragment.mMenuVisible)
                mNeedMenuInvalidate = true;
            fragment.onHiddenChanged(false);
        }
    }

    void startPendingDeferredFragments()
    {
        if (mActive != null)
        {
            for (int i = 0; i < mActive.size(); i++)
            {
                Fragment fragment = (Fragment)mActive.get(i);
                if (fragment != null)
                    performPendingDeferredStart(fragment);
            }

        }
    }

    public String toString()
    {
        StringBuilder stringbuilder = new StringBuilder(128);
        stringbuilder.append("FragmentManager{");
        stringbuilder.append(Integer.toHexString(System.identityHashCode(this)));
        stringbuilder.append(" in ");
        if (mParent != null)
            DebugUtils.buildShortClassTag(mParent, stringbuilder);
        else
            DebugUtils.buildShortClassTag(mActivity, stringbuilder);
        stringbuilder.append("}}");
        return stringbuilder.toString();
    }

    static 
    {
        DEBUG = false;
        int i = android.os.Build.VERSION.SDK_INT;
        boolean flag = false;
        if (i >= 11)
            flag = true;
        HONEYCOMB = flag;
    }
}
