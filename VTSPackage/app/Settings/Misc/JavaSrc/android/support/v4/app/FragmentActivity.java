// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.support.v4.app;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.*;
import android.os.*;
import android.util.AttributeSet;
import android.util.Log;
import android.view.*;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.*;

// Referenced classes of package android.support.v4.app:
//            FragmentManagerImpl, LoaderManagerImpl, Fragment, ActivityCompatHoneycomb, 
//            FragmentContainer, FragmentManager, LoaderManager

public class FragmentActivity extends Activity
{
    static class FragmentTag
    {

        public static final int Fragment[] = {
            0x1010003, 0x10100d0, 0x10100d1
        };
        public static final int Fragment_id = 1;
        public static final int Fragment_name = 0;
        public static final int Fragment_tag = 2;


    }

    static final class NonConfigurationInstances
    {

        Object activity;
        HashMap children;
        Object custom;
        ArrayList fragments;
        HashMap loaders;

    }


    static final String FRAGMENTS_TAG = "android:support:fragments";
    private static final int HONEYCOMB = 11;
    static final int MSG_REALLY_STOPPED = 1;
    static final int MSG_RESUME_PENDING = 2;
    private static final String TAG = "FragmentActivity";
    HashMap mAllLoaderManagers;
    boolean mCheckedForLoaderManager;
    final FragmentContainer mContainer = new FragmentContainer() {

        final FragmentActivity this$0;

        public View findViewById(int i)
        {
            return FragmentActivity.this.findViewById(i);
        }

            
            {
                this$0 = FragmentActivity.this;
                super();
            }
    }
;
    boolean mCreated;
    final FragmentManagerImpl mFragments = new FragmentManagerImpl();
    final Handler mHandler = new Handler() {

        final FragmentActivity this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 2: // '\002'
                onResumeFragments();
                mFragments.execPendingActions();
                return;

            case 1: // '\001'
                if (mStopped)
                {
                    doReallyStop(false);
                    return;
                }
                break;

            default:
                super.handleMessage(message);
                break;
            }
        }

            
            {
                this$0 = FragmentActivity.this;
                super();
            }
    }
;
    LoaderManagerImpl mLoaderManager;
    boolean mLoadersStarted;
    boolean mOptionsMenuInvalidated;
    boolean mReallyStopped;
    boolean mResumed;
    boolean mRetaining;
    boolean mStopped;


    private void dumpViewHierarchy(String s, PrintWriter printwriter, View view)
    {
        printwriter.print(s);
        if (view == null)
        {
            printwriter.println("null");
        } else
        {
            printwriter.println(viewToString(view));
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

    private static String viewToString(View view)
    {
        char c;
        char c1;
        StringBuilder stringbuilder;
        c = 'F';
        c1 = '.';
        stringbuilder = new StringBuilder(128);
        stringbuilder.append(view.getClass().getName());
        stringbuilder.append('{');
        stringbuilder.append(Integer.toHexString(System.identityHashCode(view)));
        stringbuilder.append(' ');
        view.getVisibility();
        JVM INSTR lookupswitch 3: default 92
    //                   0: 497
    //                   4: 507
    //                   8: 517;
           goto _L1 _L2 _L3 _L4
_L1:
        stringbuilder.append(c1);
_L11:
        String s;
        char c2;
        char c3;
        char c4;
        char c5;
        char c6;
        char c7;
        char c8;
        char c9;
        int i;
        Resources resources;
        String s1;
        String s2;
        if (view.isFocusable())
            c2 = c;
        else
            c2 = c1;
        stringbuilder.append(c2);
        if (view.isEnabled())
            c3 = 'E';
        else
            c3 = c1;
        stringbuilder.append(c3);
        if (view.willNotDraw())
            c4 = c1;
        else
            c4 = 'D';
        stringbuilder.append(c4);
        if (view.isHorizontalScrollBarEnabled())
            c5 = 'H';
        else
            c5 = c1;
        stringbuilder.append(c5);
        if (view.isVerticalScrollBarEnabled())
            c6 = 'V';
        else
            c6 = c1;
        stringbuilder.append(c6);
        if (view.isClickable())
            c7 = 'C';
        else
            c7 = c1;
        stringbuilder.append(c7);
        if (view.isLongClickable())
            c8 = 'L';
        else
            c8 = c1;
        stringbuilder.append(c8);
        stringbuilder.append(' ');
        if (!view.isFocused())
            c = c1;
        stringbuilder.append(c);
        if (view.isSelected())
            c9 = 'S';
        else
            c9 = c1;
        stringbuilder.append(c9);
        if (view.isPressed())
            c1 = 'P';
        stringbuilder.append(c1);
        stringbuilder.append(' ');
        stringbuilder.append(view.getLeft());
        stringbuilder.append(',');
        stringbuilder.append(view.getTop());
        stringbuilder.append('-');
        stringbuilder.append(view.getRight());
        stringbuilder.append(',');
        stringbuilder.append(view.getBottom());
        i = view.getId();
        if (i == -1) goto _L6; else goto _L5
_L5:
        stringbuilder.append(" #");
        stringbuilder.append(Integer.toHexString(i));
        resources = view.getResources();
        if (i == 0 || resources == null) goto _L6; else goto _L7
_L7:
        0xff000000 & i;
        JVM INSTR lookupswitch 2: default 416
    //                   16777216: 588
    //                   2130706432: 581;
           goto _L8 _L9 _L10
_L8:
        s = resources.getResourcePackageName(i);
_L12:
        s1 = resources.getResourceTypeName(i);
        s2 = resources.getResourceEntryName(i);
        stringbuilder.append(" ");
        stringbuilder.append(s);
        stringbuilder.append(":");
        stringbuilder.append(s1);
        stringbuilder.append("/");
        stringbuilder.append(s2);
_L6:
        stringbuilder.append("}");
        return stringbuilder.toString();
_L2:
        stringbuilder.append('V');
          goto _L11
_L3:
        stringbuilder.append('I');
          goto _L11
_L4:
        stringbuilder.append('G');
          goto _L11
_L10:
        s = "app";
          goto _L12
_L9:
        s = "android";
          goto _L12
        android.content.res.Resources.NotFoundException notfoundexception;
        notfoundexception;
          goto _L6
    }

    void doReallyStop(boolean flag)
    {
        if (!mReallyStopped)
        {
            mReallyStopped = true;
            mRetaining = flag;
            mHandler.removeMessages(1);
            onReallyStop();
        }
    }

    public void dump(String s, FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
    {
        if (android.os.Build.VERSION.SDK_INT < 11);
        printwriter.print(s);
        printwriter.print("Local FragmentActivity ");
        printwriter.print(Integer.toHexString(System.identityHashCode(this)));
        printwriter.println(" State:");
        String s1 = (new StringBuilder()).append(s).append("  ").toString();
        printwriter.print(s1);
        printwriter.print("mCreated=");
        printwriter.print(mCreated);
        printwriter.print("mResumed=");
        printwriter.print(mResumed);
        printwriter.print(" mStopped=");
        printwriter.print(mStopped);
        printwriter.print(" mReallyStopped=");
        printwriter.println(mReallyStopped);
        printwriter.print(s1);
        printwriter.print("mLoadersStarted=");
        printwriter.println(mLoadersStarted);
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

    public Object getLastCustomNonConfigurationInstance()
    {
        NonConfigurationInstances nonconfigurationinstances = (NonConfigurationInstances)getLastNonConfigurationInstance();
        if (nonconfigurationinstances != null)
            return nonconfigurationinstances.custom;
        else
            return null;
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

    public FragmentManager getSupportFragmentManager()
    {
        return mFragments;
    }

    public LoaderManager getSupportLoaderManager()
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

    void invalidateSupportFragment(String s)
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

    protected void onActivityResult(int i, int j, Intent intent)
    {
        mFragments.noteStateNotSaved();
        int k = i >> 16;
        if (k != 0)
        {
            int l = k - 1;
            if (mFragments.mActive != null && l >= 0 && l < mFragments.mActive.size())
            {
                Fragment fragment = (Fragment)mFragments.mActive.get(l);
                if (fragment == null)
                {
                    Log.w("FragmentActivity", (new StringBuilder()).append("Activity result no fragment exists for index: 0x").append(Integer.toHexString(i)).toString());
                    return;
                } else
                {
                    fragment.onActivityResult(0xffff & i, j, intent);
                    return;
                }
            } else
            {
                Log.w("FragmentActivity", (new StringBuilder()).append("Activity result fragment index out of range: 0x").append(Integer.toHexString(i)).toString());
                return;
            }
        } else
        {
            super.onActivityResult(i, j, intent);
            return;
        }
    }

    public void onAttachFragment(Fragment fragment)
    {
    }

    public void onBackPressed()
    {
        if (!mFragments.popBackStackImmediate())
            finish();
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        mFragments.dispatchConfigurationChanged(configuration);
    }

    protected void onCreate(Bundle bundle)
    {
        mFragments.attachActivity(this, mContainer, null);
        if (getLayoutInflater().getFactory() == null)
            getLayoutInflater().setFactory(this);
        super.onCreate(bundle);
        NonConfigurationInstances nonconfigurationinstances = (NonConfigurationInstances)getLastNonConfigurationInstance();
        if (nonconfigurationinstances != null)
            mAllLoaderManagers = nonconfigurationinstances.loaders;
        if (bundle != null)
        {
            android.os.Parcelable parcelable = bundle.getParcelable("android:support:fragments");
            FragmentManagerImpl fragmentmanagerimpl = mFragments;
            ArrayList arraylist = null;
            if (nonconfigurationinstances != null)
                arraylist = nonconfigurationinstances.fragments;
            fragmentmanagerimpl.restoreAllState(parcelable, arraylist);
        }
        mFragments.dispatchCreate();
    }

    public boolean onCreatePanelMenu(int i, Menu menu)
    {
        if (i == 0)
        {
            boolean flag = super.onCreatePanelMenu(i, menu) | mFragments.dispatchCreateOptionsMenu(menu, getMenuInflater());
            if (android.os.Build.VERSION.SDK_INT >= 11)
                return flag;
            else
                return true;
        } else
        {
            return super.onCreatePanelMenu(i, menu);
        }
    }

    public View onCreateView(String s, Context context, AttributeSet attributeset)
    {
        if (!"fragment".equals(s))
            return super.onCreateView(s, context, attributeset);
        String s1 = attributeset.getAttributeValue(null, "class");
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, FragmentTag.Fragment);
        if (s1 == null)
            s1 = typedarray.getString(0);
        int i = typedarray.getResourceId(1, -1);
        String s2 = typedarray.getString(2);
        typedarray.recycle();
        if (false)
            throw null;
        if (-1 == 0 && i == -1 && s2 == null)
            throw new IllegalArgumentException((new StringBuilder()).append(attributeset.getPositionDescription()).append(": Must specify unique android:id, android:tag, or have a parent with an id for ").append(s1).toString());
        Fragment fragment = null;
        if (i != -1)
            fragment = mFragments.findFragmentById(i);
        if (fragment == null && s2 != null)
            fragment = mFragments.findFragmentByTag(s2);
        if (fragment == null && -1 != 0)
            fragment = mFragments.findFragmentById(0);
        if (FragmentManagerImpl.DEBUG)
            Log.v("FragmentActivity", (new StringBuilder()).append("onCreateView: id=0x").append(Integer.toHexString(i)).append(" fname=").append(s1).append(" existing=").append(fragment).toString());
        if (fragment == null)
        {
            fragment = Fragment.instantiate(this, s1);
            fragment.mFromLayout = true;
            int j;
            if (i != 0)
                j = i;
            else
                j = 0;
            fragment.mFragmentId = j;
            fragment.mContainerId = 0;
            fragment.mTag = s2;
            fragment.mInLayout = true;
            fragment.mFragmentManager = mFragments;
            fragment.onInflate(this, attributeset, fragment.mSavedFragmentState);
            mFragments.addFragment(fragment, true);
        } else
        {
            if (fragment.mInLayout)
                throw new IllegalArgumentException((new StringBuilder()).append(attributeset.getPositionDescription()).append(": Duplicate id 0x").append(Integer.toHexString(i)).append(", tag ").append(s2).append(", or parent id 0x").append(Integer.toHexString(0)).append(" with another fragment for ").append(s1).toString());
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

    protected void onDestroy()
    {
        super.onDestroy();
        doReallyStop(false);
        mFragments.dispatchDestroy();
        if (mLoaderManager != null)
            mLoaderManager.doDestroy();
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        if (android.os.Build.VERSION.SDK_INT < 5 && i == 4 && keyevent.getRepeatCount() == 0)
        {
            onBackPressed();
            return true;
        } else
        {
            return super.onKeyDown(i, keyevent);
        }
    }

    public void onLowMemory()
    {
        super.onLowMemory();
        mFragments.dispatchLowMemory();
    }

    public boolean onMenuItemSelected(int i, MenuItem menuitem)
    {
        if (super.onMenuItemSelected(i, menuitem))
            return true;
        switch (i)
        {
        case 6: // '\006'
            return mFragments.dispatchContextItemSelected(menuitem);

        case 0: // '\0'
            return mFragments.dispatchOptionsItemSelected(menuitem);
        }
        return false;
    }

    protected void onNewIntent(Intent intent)
    {
        super.onNewIntent(intent);
        mFragments.noteStateNotSaved();
    }

    public void onPanelClosed(int i, Menu menu)
    {
        switch (i)
        {
        case 0: // '\0'
            mFragments.dispatchOptionsMenuClosed(menu);
            break;
        }
        super.onPanelClosed(i, menu);
    }

    protected void onPause()
    {
        super.onPause();
        mResumed = false;
        if (mHandler.hasMessages(2))
        {
            mHandler.removeMessages(2);
            onResumeFragments();
        }
        mFragments.dispatchPause();
    }

    protected void onPostResume()
    {
        super.onPostResume();
        mHandler.removeMessages(2);
        onResumeFragments();
        mFragments.execPendingActions();
    }

    public boolean onPreparePanel(int i, View view, Menu menu)
    {
        if (i == 0 && menu != null)
        {
            if (mOptionsMenuInvalidated)
            {
                mOptionsMenuInvalidated = false;
                menu.clear();
                onCreatePanelMenu(i, menu);
            }
            boolean flag = super.onPreparePanel(i, view, menu) | mFragments.dispatchPrepareOptionsMenu(menu);
            boolean flag1 = false;
            if (flag)
            {
                boolean flag2 = menu.hasVisibleItems();
                flag1 = false;
                if (flag2)
                    flag1 = true;
            }
            return flag1;
        } else
        {
            return super.onPreparePanel(i, view, menu);
        }
    }

    void onReallyStop()
    {
        if (mLoadersStarted)
        {
            mLoadersStarted = false;
            if (mLoaderManager != null)
                if (!mRetaining)
                    mLoaderManager.doStop();
                else
                    mLoaderManager.doRetain();
        }
        mFragments.dispatchReallyStop();
    }

    protected void onResume()
    {
        super.onResume();
        mHandler.sendEmptyMessage(2);
        mResumed = true;
        mFragments.execPendingActions();
    }

    protected void onResumeFragments()
    {
        mFragments.dispatchResume();
    }

    public Object onRetainCustomNonConfigurationInstance()
    {
        return null;
    }

    public final Object onRetainNonConfigurationInstance()
    {
        if (mStopped)
            doReallyStop(true);
        Object obj = onRetainCustomNonConfigurationInstance();
        ArrayList arraylist = mFragments.retainNonConfig();
        HashMap hashmap = mAllLoaderManagers;
        boolean flag = false;
        if (hashmap != null)
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
        if (arraylist == null && !flag && obj == null)
        {
            return null;
        } else
        {
            NonConfigurationInstances nonconfigurationinstances = new NonConfigurationInstances();
            nonconfigurationinstances.activity = null;
            nonconfigurationinstances.custom = obj;
            nonconfigurationinstances.children = null;
            nonconfigurationinstances.fragments = arraylist;
            nonconfigurationinstances.loaders = mAllLoaderManagers;
            return nonconfigurationinstances;
        }
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        android.os.Parcelable parcelable = mFragments.saveAllState();
        if (parcelable != null)
            bundle.putParcelable("android:support:fragments", parcelable);
    }

    protected void onStart()
    {
        super.onStart();
        mStopped = false;
        mReallyStopped = false;
        mHandler.removeMessages(1);
        if (!mCreated)
        {
            mCreated = true;
            mFragments.dispatchActivityCreated();
        }
        mFragments.noteStateNotSaved();
        mFragments.execPendingActions();
        if (!mLoadersStarted)
        {
            mLoadersStarted = true;
            if (mLoaderManager != null)
                mLoaderManager.doStart();
            else
            if (!mCheckedForLoaderManager)
            {
                mLoaderManager = getLoaderManager(null, mLoadersStarted, false);
                if (mLoaderManager != null && !mLoaderManager.mStarted)
                    mLoaderManager.doStart();
            }
            mCheckedForLoaderManager = true;
        }
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

    protected void onStop()
    {
        super.onStop();
        mStopped = true;
        mHandler.sendEmptyMessage(1);
        mFragments.dispatchStop();
    }

    public void startActivityForResult(Intent intent, int i)
    {
        if (i != -1 && (0xffff0000 & i) != 0)
        {
            throw new IllegalArgumentException("Can only use lower 16 bits for requestCode");
        } else
        {
            super.startActivityForResult(intent, i);
            return;
        }
    }

    public void startActivityFromFragment(Fragment fragment, Intent intent, int i)
    {
        if (i == -1)
        {
            super.startActivityForResult(intent, -1);
            return;
        }
        if ((0xffff0000 & i) != 0)
        {
            throw new IllegalArgumentException("Can only use lower 16 bits for requestCode");
        } else
        {
            super.startActivityForResult(intent, (1 + fragment.mIndex << 16) + (0xffff & i));
            return;
        }
    }

    public void supportInvalidateOptionsMenu()
    {
        if (android.os.Build.VERSION.SDK_INT >= 11)
        {
            ActivityCompatHoneycomb.invalidateOptionsMenu(this);
            return;
        } else
        {
            mOptionsMenuInvalidated = true;
            return;
        }
    }
}
