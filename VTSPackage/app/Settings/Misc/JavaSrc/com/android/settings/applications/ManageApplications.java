// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.applications;

import android.app.*;
import android.content.*;
import android.content.pm.*;
import android.content.res.Resources;
import android.net.NetworkPolicyManager;
import android.os.*;
import android.os.storage.StorageManager;
import android.os.storage.StorageVolume;
import android.preference.PreferenceActivity;
import android.preference.PreferenceFrameLayout;
import android.support.v4.view.*;
import android.text.format.Formatter;
import android.util.Log;
import android.view.*;
import android.view.animation.AnimationUtils;
import android.widget.*;
import com.android.internal.app.IMediaContainerService;
import com.android.settings.Utils;
import com.android.settings.deviceinfo.StorageMeasurement;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package com.android.settings.applications:
//            AppClickListener, InstalledAppDetails, ApplicationsState, RunningProcessesView, 
//            AppViewHolder, LinearColorBar

public class ManageApplications extends Fragment
    implements AppClickListener, android.content.DialogInterface.OnClickListener, android.content.DialogInterface.OnDismissListener
{
    static class ApplicationsAdapter extends BaseAdapter
        implements Filterable, ApplicationsState.Callbacks, android.widget.AbsListView.RecyclerListener
    {

        private final ArrayList mActive = new ArrayList();
        private ArrayList mBaseEntries;
        private final Context mContext;
        CharSequence mCurFilterPrefix;
        private ArrayList mEntries;
        private Filter mFilter;
        private final int mFilterMode;
        private int mLastSortMode;
        private boolean mResumed;
        private final ApplicationsState.Session mSession;
        private final ApplicationsState mState;
        private final TabInfo mTab;
        private boolean mWaitingForData;
        private int mWhichSize;

        ArrayList applyPrefixFilter(CharSequence charsequence, ArrayList arraylist)
        {
            ArrayList arraylist1;
            if (charsequence != null && charsequence.length() != 0)
            {
                String s = ApplicationsState.normalize(charsequence.toString());
                String s1 = (new StringBuilder()).append(" ").append(s).toString();
                arraylist1 = new ArrayList();
                for (int i = 0; i < arraylist.size(); i++)
                {
                    ApplicationsState.AppEntry appentry = (ApplicationsState.AppEntry)arraylist.get(i);
                    String s2 = appentry.getNormalizedLabel();
                    if (s2.startsWith(s) || s2.indexOf(s1) != -1)
                        arraylist1.add(appentry);
                }

            } else
            {
                arraylist1 = arraylist;
            }
            return arraylist1;
        }

        public ApplicationsState.AppEntry getAppEntry(int i)
        {
            return (ApplicationsState.AppEntry)mEntries.get(i);
        }

        public int getCount()
        {
            if (mEntries != null)
                return mEntries.size();
            else
                return 0;
        }

        public Filter getFilter()
        {
            return mFilter;
        }

        public Object getItem(int i)
        {
            return mEntries.get(i);
        }

        public long getItemId(int i)
        {
            return ((ApplicationsState.AppEntry)mEntries.get(i)).id;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            AppViewHolder appviewholder;
            View view1;
            appviewholder = AppViewHolder.createOrRecycle(mTab.mInflater, view);
            view1 = appviewholder.rootView;
            ApplicationsState.AppEntry appentry = (ApplicationsState.AppEntry)mEntries.get(i);
            appentry;
            JVM INSTR monitorenter ;
            appviewholder.entry = appentry;
            if (appentry.label != null)
                appviewholder.appName.setText(appentry.label);
            mState.ensureIcon(appentry);
            if (appentry.icon != null)
                appviewholder.appIcon.setImageDrawable(appentry.icon);
            appviewholder.updateSizeText(mTab.mInvalidSizeStr, mWhichSize);
            if ((0x800000 & appentry.info.flags) != 0) goto _L2; else goto _L1
_L1:
            appviewholder.disabled.setVisibility(0);
            appviewholder.disabled.setText(0x7f0b0664);
_L3:
            CheckBox checkbox;
            int j;
            if (mFilterMode != 2)
                break MISSING_BLOCK_LABEL_279;
            appviewholder.checkBox.setVisibility(0);
            checkbox = appviewholder.checkBox;
            j = 0x40000 & appentry.info.flags;
            boolean flag;
            flag = false;
            if (j != 0)
                flag = true;
            checkbox.setChecked(flag);
_L4:
            appentry;
            JVM INSTR monitorexit ;
            mActive.remove(view1);
            mActive.add(view1);
            return view1;
_L2:
            if (appentry.info.enabled)
                break MISSING_BLOCK_LABEL_266;
            appviewholder.disabled.setVisibility(0);
            appviewholder.disabled.setText(0x7f0b0663);
              goto _L3
            Exception exception;
            exception;
            appentry;
            JVM INSTR monitorexit ;
            throw exception;
            appviewholder.disabled.setVisibility(8);
              goto _L3
            appviewholder.checkBox.setVisibility(8);
              goto _L4
        }

        public void onAllSizesComputed()
        {
            if (mLastSortMode == 5)
                rebuild(false);
            mTab.updateStorageUsage();
        }

        public void onMovedToScrapHeap(View view)
        {
            mActive.remove(view);
        }

        public void onPackageIconChanged()
        {
        }

        public void onPackageListChanged()
        {
            rebuild(false);
        }

        public void onPackageSizeChanged(String s)
        {
            int i = 0;
_L2:
            if (i < mActive.size())
            {
                AppViewHolder appviewholder = (AppViewHolder)((View)mActive.get(i)).getTag();
                if (!((PackageItemInfo) (appviewholder.entry.info)).packageName.equals(s))
                    break MISSING_BLOCK_LABEL_130;
                synchronized (appviewholder.entry)
                {
                    appviewholder.updateSizeText(mTab.mInvalidSizeStr, mWhichSize);
                }
                if (((PackageItemInfo) (appviewholder.entry.info)).packageName.equals(mTab.mOwner.mCurrentPkgName) && mLastSortMode == 5)
                    rebuild(false);
                mTab.updateStorageUsage();
            }
            return;
            exception;
            appentry;
            JVM INSTR monitorexit ;
            throw exception;
            i++;
            if (true) goto _L2; else goto _L1
_L1:
        }

        public void onRebuildComplete(ArrayList arraylist)
        {
            if (mTab.mLoadingContainer.getVisibility() == 0)
            {
                mTab.mLoadingContainer.startAnimation(AnimationUtils.loadAnimation(mContext, 0x10a0001));
                mTab.mListContainer.startAnimation(AnimationUtils.loadAnimation(mContext, 0x10a0000));
            }
            mTab.mListContainer.setVisibility(0);
            mTab.mLoadingContainer.setVisibility(8);
            mWaitingForData = false;
            mBaseEntries = arraylist;
            mEntries = applyPrefixFilter(mCurFilterPrefix, mBaseEntries);
            notifyDataSetChanged();
            mTab.updateStorageUsage();
        }

        public void onRunningStateChanged(boolean flag)
        {
            mTab.mOwner.getActivity().setProgressBarIndeterminateVisibility(flag);
        }

        public void pause()
        {
            if (mResumed)
            {
                mResumed = false;
                mSession.pause();
            }
        }

        public void rebuild(int i)
        {
            if (i == mLastSortMode)
            {
                return;
            } else
            {
                mLastSortMode = i;
                rebuild(true);
                return;
            }
        }

        public void rebuild(boolean flag)
        {
            boolean flag1 = Environment.isExternalStorageEmulated();
            if (flag1)
                mWhichSize = 0;
            else
                mWhichSize = 1;
            ApplicationsState.AppFilter appfilter;
            switch (mFilterMode)
            {
            case 2: // '\002'
                appfilter = ApplicationsState.ON_SD_CARD_FILTER;
                if (!flag1)
                    mWhichSize = 2;
                break;

            case 1: // '\001'
                appfilter = ApplicationsState.THIRD_PARTY_FILTER;
                break;

            default:
                appfilter = null;
                break;
            }
            java.util.Comparator comparator;
            switch (mLastSortMode)
            {
            case 5: // '\005'
                switch (mWhichSize)
                {
                case 2: // '\002'
                    comparator = ApplicationsState.EXTERNAL_SIZE_COMPARATOR;
                    break;

                case 1: // '\001'
                    comparator = ApplicationsState.INTERNAL_SIZE_COMPARATOR;
                    break;

                default:
                    comparator = ApplicationsState.SIZE_COMPARATOR;
                    break;
                }
                break;

            default:
                comparator = ApplicationsState.ALPHA_COMPARATOR;
                break;
            }
            ArrayList arraylist = mSession.rebuild(appfilter, comparator);
            if (arraylist == null && !flag)
                return;
            mBaseEntries = arraylist;
            if (mBaseEntries != null)
                mEntries = applyPrefixFilter(mCurFilterPrefix, mBaseEntries);
            else
                mEntries = null;
            notifyDataSetChanged();
            mTab.updateStorageUsage();
            if (arraylist == null)
            {
                mWaitingForData = true;
                mTab.mListContainer.setVisibility(4);
                mTab.mLoadingContainer.setVisibility(0);
                return;
            } else
            {
                mTab.mListContainer.setVisibility(0);
                mTab.mLoadingContainer.setVisibility(8);
                return;
            }
        }

        public void resume(int i)
        {
            if (!mResumed)
            {
                mResumed = true;
                mSession.resume();
                mLastSortMode = i;
                rebuild(true);
                return;
            } else
            {
                rebuild(i);
                return;
            }
        }



/*
        static ArrayList access$602(ApplicationsAdapter applicationsadapter, ArrayList arraylist)
        {
            applicationsadapter.mEntries = arraylist;
            return arraylist;
        }

*/


        public ApplicationsAdapter(ApplicationsState applicationsstate, TabInfo tabinfo, int i)
        {
            mLastSortMode = -1;
            mWhichSize = 0;
            mFilter = new _cls1();
            mState = applicationsstate;
            mSession = applicationsstate.newSession(this);
            mTab = tabinfo;
            mContext = tabinfo.mOwner.getActivity();
            mFilterMode = i;
        }
    }

    class MyPagerAdapter extends PagerAdapter
        implements android.support.v4.view.ViewPager.OnPageChangeListener
    {

        int mCurPos;
        final ManageApplications this$0;

        public void destroyItem(ViewGroup viewgroup, int i, Object obj)
        {
            viewgroup.removeView((View)obj);
        }

        public int getCount()
        {
            return mTabs.size();
        }

        public CharSequence getPageTitle(int i)
        {
            return ((TabInfo)mTabs.get(i)).mLabel;
        }

        public Object instantiateItem(ViewGroup viewgroup, int i)
        {
            View view = ((TabInfo)mTabs.get(i)).build(mInflater, mContentContainer, mRootView);
            viewgroup.addView(view);
            return view;
        }

        public boolean isViewFromObject(View view, Object obj)
        {
            return view == obj;
        }

        public void onPageScrollStateChanged(int i)
        {
            if (i == 0)
                updateCurrentTab(mCurPos);
        }

        public void onPageScrolled(int i, float f, int j)
        {
        }

        public void onPageSelected(int i)
        {
            mCurPos = i;
        }

        MyPagerAdapter()
        {
            this$0 = ManageApplications.this;
            super();
            mCurPos = 0;
        }
    }

    public static class TabInfo
        implements android.widget.AdapterView.OnItemClickListener
    {

        private long mAppStorage;
        public ApplicationsAdapter mApplications;
        public final ApplicationsState mApplicationsState;
        public final AppClickListener mClickListener;
        private LinearColorBar mColorBar;
        public final CharSequence mComputingSizeStr;
        private IMediaContainerService mContainerService;
        public final int mFilter;
        private long mFreeStorage;
        private TextView mFreeStorageText;
        public LayoutInflater mInflater;
        public final CharSequence mInvalidSizeStr;
        public final CharSequence mLabel;
        private long mLastAppStorage;
        private long mLastFreeStorage;
        private long mLastUsedStorage;
        private View mListContainer;
        public final int mListType;
        private ListView mListView;
        private View mLoadingContainer;
        public final ManageApplications mOwner;
        public View mRootView;
        final Runnable mRunningProcessesAvail = new _cls1();
        private RunningProcessesView mRunningProcessesView;
        private final Bundle mSavedInstanceState;
        private TextView mStorageChartLabel;
        private long mTotalStorage;
        private TextView mUsedStorageText;

        void applyCurrentStorage()
        {
            if (mRootView != null)
                if (mTotalStorage > 0L)
                {
                    mColorBar.setRatios((float)(mTotalStorage - mFreeStorage - mAppStorage) / (float)mTotalStorage, (float)mAppStorage / (float)mTotalStorage, (float)mFreeStorage / (float)mTotalStorage);
                    long l = mTotalStorage - mFreeStorage;
                    if (mLastUsedStorage != l)
                    {
                        mLastUsedStorage = l;
                        String s1 = Formatter.formatShortFileSize(mOwner.getActivity(), l);
                        mUsedStorageText.setText(mOwner.getActivity().getResources().getString(0x7f0b069f, new Object[] {
                            s1
                        }));
                    }
                    if (mLastFreeStorage != mFreeStorage)
                    {
                        mLastFreeStorage = mFreeStorage;
                        String s = Formatter.formatShortFileSize(mOwner.getActivity(), mFreeStorage);
                        mFreeStorageText.setText(mOwner.getActivity().getResources().getString(0x7f0b069e, new Object[] {
                            s
                        }));
                        return;
                    }
                } else
                {
                    mColorBar.setRatios(0.0F, 0.0F, 0.0F);
                    if (mLastUsedStorage != -1L)
                    {
                        mLastUsedStorage = -1L;
                        mUsedStorageText.setText("");
                    }
                    if (mLastFreeStorage != -1L)
                    {
                        mLastFreeStorage = -1L;
                        mFreeStorageText.setText("");
                        return;
                    }
                }
        }

        public View build(LayoutInflater layoutinflater, ViewGroup viewgroup, View view)
        {
            if (mRootView != null)
                return mRootView;
            mInflater = layoutinflater;
            int i;
            if (mListType == 1)
                i = 0x7f040048;
            else
                i = 0x7f040045;
            mRootView = layoutinflater.inflate(i, null);
            mLoadingContainer = mRootView.findViewById(0x7f0800c5);
            mLoadingContainer.setVisibility(0);
            mListContainer = mRootView.findViewById(0x7f0800c0);
            if (mListContainer != null)
            {
                View view1 = mListContainer.findViewById(0x1020004);
                ListView listview = (ListView)mListContainer.findViewById(0x102000a);
                if (view1 != null)
                    listview.setEmptyView(view1);
                listview.setOnItemClickListener(this);
                listview.setSaveEnabled(true);
                listview.setItemsCanFocus(true);
                listview.setTextFilterEnabled(true);
                mListView = listview;
                mApplications = new ApplicationsAdapter(mApplicationsState, this, mFilter);
                mListView.setAdapter(mApplications);
                mListView.setRecyclerListener(mApplications);
                mColorBar = (LinearColorBar)mListContainer.findViewById(0x7f0800c1);
                mStorageChartLabel = (TextView)mListContainer.findViewById(0x7f0800c3);
                mUsedStorageText = (TextView)mListContainer.findViewById(0x7f0800c2);
                mFreeStorageText = (TextView)mListContainer.findViewById(0x7f0800c4);
                Utils.prepareCustomPreferencesList(viewgroup, view, mListView, false);
                if (mFilter == 2)
                    mStorageChartLabel.setText(ManageApplications.sSdDescription);
                else
                    mStorageChartLabel.setText(mOwner.getActivity().getText(0x7f0b0666));
                applyCurrentStorage();
            }
            mRunningProcessesView = (RunningProcessesView)mRootView.findViewById(0x7f0800cc);
            if (mRunningProcessesView != null)
                mRunningProcessesView.doCreate(mSavedInstanceState);
            return mRootView;
        }

        public void detachView()
        {
            if (mRootView != null)
            {
                ViewGroup viewgroup = (ViewGroup)mRootView.getParent();
                if (viewgroup != null)
                    viewgroup.removeView(mRootView);
            }
        }

        void handleRunningProcessesAvail()
        {
            mLoadingContainer.startAnimation(AnimationUtils.loadAnimation(mOwner.getActivity(), 0x10a0001));
            mRunningProcessesView.startAnimation(AnimationUtils.loadAnimation(mOwner.getActivity(), 0x10a0000));
            mRunningProcessesView.setVisibility(0);
            mLoadingContainer.setVisibility(8);
        }

        public void onItemClick(AdapterView adapterview, View view, int i, long l)
        {
            mClickListener.onItemClick(this, adapterview, view, i, l);
        }

        public void pause()
        {
            if (mApplications != null)
                mApplications.pause();
            if (mRunningProcessesView != null)
                mRunningProcessesView.doPause();
        }

        public void resume(int i)
        {
label0:
            {
                if (mApplications != null)
                    mApplications.resume(i);
                if (mRunningProcessesView != null)
                {
                    if (!mRunningProcessesView.doResume(mOwner, mRunningProcessesAvail))
                        break label0;
                    mRunningProcessesView.setVisibility(0);
                    mLoadingContainer.setVisibility(4);
                }
                return;
            }
            mLoadingContainer.setVisibility(0);
        }

        public void setContainerService(IMediaContainerService imediacontainerservice)
        {
            mContainerService = imediacontainerservice;
            updateStorageUsage();
        }

        void updateStorageUsage()
        {
            while (mOwner.getActivity() == null || mApplications == null) 
                return;
            mFreeStorage = 0L;
            mAppStorage = 0L;
            mTotalStorage = 0L;
            if (mFilter == 2)
            {
                if (mContainerService != null)
                    try
                    {
                        long al1[] = mContainerService.getFileSystemStats(Environment.getLegacyExternalStorageDirectory().getPath());
                        mTotalStorage = al1[0];
                        mFreeStorage = al1[1];
                    }
                    catch (RemoteException remoteexception1)
                    {
                        Log.w("ManageApplications", "Problem in container service", remoteexception1);
                    }
                if (mApplications != null)
                {
                    int k = mApplications.getCount();
                    for (int l = 0; l < k; l++)
                    {
                        ApplicationsState.AppEntry appentry1 = mApplications.getAppEntry(l);
                        mAppStorage = mAppStorage + (((ApplicationsState.SizeInfo) (appentry1)).externalCodeSize + ((ApplicationsState.SizeInfo) (appentry1)).externalDataSize + ((ApplicationsState.SizeInfo) (appentry1)).externalCacheSize);
                    }

                }
            } else
            {
                boolean flag;
                if (mContainerService != null)
                    try
                    {
                        long al[] = mContainerService.getFileSystemStats(Environment.getDataDirectory().getPath());
                        mTotalStorage = al[0];
                        mFreeStorage = al[1];
                    }
                    catch (RemoteException remoteexception)
                    {
                        Log.w("ManageApplications", "Problem in container service", remoteexception);
                    }
                flag = Environment.isExternalStorageEmulated();
                if (mApplications != null)
                {
                    int i = mApplications.getCount();
                    for (int j = 0; j < i; j++)
                    {
                        ApplicationsState.AppEntry appentry = mApplications.getAppEntry(j);
                        mAppStorage = mAppStorage + (((ApplicationsState.SizeInfo) (appentry)).codeSize + ((ApplicationsState.SizeInfo) (appentry)).dataSize);
                        if (flag)
                            mAppStorage = mAppStorage + (((ApplicationsState.SizeInfo) (appentry)).externalCodeSize + ((ApplicationsState.SizeInfo) (appentry)).externalDataSize);
                    }

                }
                mFreeStorage = mFreeStorage + mApplicationsState.sumCacheSizes();
            }
            applyCurrentStorage();
        }




        public TabInfo(ManageApplications manageapplications, ApplicationsState applicationsstate, CharSequence charsequence, int i, AppClickListener appclicklistener, Bundle bundle)
        {
            mFreeStorage = 0L;
            mAppStorage = 0L;
            mTotalStorage = 0L;
            mOwner = manageapplications;
            mApplicationsState = applicationsstate;
            mLabel = charsequence;
            mListType = i;
            switch (i)
            {
            case 2: // '\002'
                mFilter = 2;
                break;

            case 0: // '\0'
                mFilter = 1;
                break;

            case 1: // '\001'
            default:
                mFilter = 0;
                break;
            }
            mClickListener = appclicklistener;
            mInvalidSizeStr = manageapplications.getActivity().getText(0x7f0b067d);
            mComputingSizeStr = manageapplications.getActivity().getText(0x7f0b067c);
            mSavedInstanceState = bundle;
        }
    }


    public static final String APP_CHG = "chg";
    static final boolean DEBUG = false;
    private static final String EXTRA_DEFAULT_LIST_TYPE = "defaultListType";
    private static final String EXTRA_RESET_DIALOG = "resetDialog";
    private static final String EXTRA_SHOW_BACKGROUND = "showBackground";
    private static final String EXTRA_SORT_ORDER = "sortOrder";
    public static final int FILTER_APPS_ALL = 0;
    public static final int FILTER_APPS_SDCARD = 2;
    public static final int FILTER_APPS_THIRD_PARTY = 1;
    private static final int INSTALLED_APP_DETAILS = 1;
    static final int LIST_TYPE_ALL = 3;
    static final int LIST_TYPE_DOWNLOADED = 0;
    static final int LIST_TYPE_RUNNING = 1;
    static final int LIST_TYPE_SDCARD = 2;
    private static final int MENU_OPTIONS_BASE = 0;
    public static final int RESET_APP_PREFERENCES = 8;
    public static final int SHOW_BACKGROUND_PROCESSES = 7;
    public static final int SHOW_RUNNING_SERVICES = 6;
    public static final int SIZE_EXTERNAL = 2;
    public static final int SIZE_INTERNAL = 1;
    public static final int SIZE_TOTAL = 0;
    public static final int SORT_ORDER_ALPHA = 4;
    public static final int SORT_ORDER_SIZE = 5;
    static final String TAG = "ManageApplications";
    private static String sSdDescription;
    private boolean mActivityResumed;
    private ApplicationsState mApplicationsState;
    private CharSequence mComputingSizeStr;
    private final ServiceConnection mContainerConnection = new ServiceConnection() {

        final ManageApplications this$0;

        public void onServiceConnected(ComponentName componentname, IBinder ibinder)
        {
            mContainerService = com.android.internal.app.IMediaContainerService.Stub.asInterface(ibinder);
            for (int i = 0; i < mTabs.size(); i++)
                ((TabInfo)mTabs.get(i)).setContainerService(mContainerService);

        }

        public void onServiceDisconnected(ComponentName componentname)
        {
            mContainerService = null;
        }

            
            {
                this$0 = ManageApplications.this;
                super();
            }
    }
;
    private volatile IMediaContainerService mContainerService;
    private ViewGroup mContentContainer;
    TabInfo mCurTab;
    private String mCurrentPkgName;
    private int mDefaultListType;
    private String mExtStoragePath;
    private LayoutInflater mInflater;
    CharSequence mInvalidSizeStr;
    private Menu mOptionsMenu;
    AlertDialog mResetDialog;
    private View mRootView;
    private boolean mShowBackground;
    private int mSortOrder;
    private StorageManager mStorageManager;
    private final ArrayList mTabs = new ArrayList();
    private ViewPager mViewPager;

    public ManageApplications()
    {
        mSortOrder = 4;
        mCurTab = null;
        mShowBackground = false;
        mDefaultListType = -1;
    }

    private String getSdDesc(String s)
    {
        StorageVolume astoragevolume[] = mStorageManager.getVolumeList();
        int i = astoragevolume.length;
        String s1 = "";
        int j = 0;
        do
        {
label0:
            {
                if (j < i)
                {
                    if (!astoragevolume[j].getPath().equals(s))
                        break label0;
                    s1 = astoragevolume[j].getDescription(getActivity());
                }
                return s1;
            }
            s1 = "error";
            j++;
        } while (true);
    }

    private void startApplicationDetailsActivity()
    {
        Bundle bundle = new Bundle();
        bundle.putString("package", mCurrentPkgName);
        ((PreferenceActivity)getActivity()).startPreferencePanel(com/android/settings/applications/InstalledAppDetails.getName(), bundle, 0x7f0b0635, null, this, 1);
    }

    void buildResetDialog()
    {
        if (mResetDialog == null)
        {
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(getActivity());
            builder.setTitle(0x7f0b0659);
            builder.setMessage(0x7f0b065a);
            builder.setPositiveButton(0x7f0b065b, this);
            builder.setNegativeButton(0x7f0b034b, null);
            mResetDialog = builder.show();
            mResetDialog.setOnDismissListener(this);
        }
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
        if (i == 1 && mCurrentPkgName != null)
            mApplicationsState.requestSize(mCurrentPkgName);
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (mResetDialog == dialoginterface)
            (new AsyncTask() {

                final ManageApplications this$0;
                final Handler val$handler;
                final INotificationManager val$nm;
                final NetworkPolicyManager val$npm;
                final PackageManager val$pm;

                protected volatile Object doInBackground(Object aobj[])
                {
                    return doInBackground((Void[])aobj);
                }

                protected transient Void doInBackground(Void avoid[])
                {
                    List list = pm.getInstalledApplications(512);
                    int j = 0;
                    while (j < list.size()) 
                    {
                        ApplicationInfo applicationinfo = (ApplicationInfo)list.get(j);
                        ArrayList arraylist;
                        ArrayList arraylist1;
                        int k;
                        int ai[];
                        int l;
                        int i1;
                        int j1;
                        int k1;
                        try
                        {
                            nm.setNotificationsEnabledForPackage(((PackageItemInfo) (applicationinfo)).packageName, true);
                        }
                        catch (RemoteException remoteexception) { }
                        pm.clearPackagePreferredActivities(((PackageItemInfo) (applicationinfo)).packageName);
                        if (!applicationinfo.enabled && pm.getApplicationEnabledSetting(((PackageItemInfo) (applicationinfo)).packageName) == 3)
                            pm.setApplicationEnabledSetting(((PackageItemInfo) (applicationinfo)).packageName, 0, 1);
                        j++;
                    }
                    arraylist = new ArrayList();
                    arraylist1 = new ArrayList();
                    pm.getPreferredActivities(arraylist, arraylist1, null);
                    for (k = 0; k < arraylist1.size(); k++)
                        pm.clearPackagePreferredActivities(((ComponentName)arraylist1.get(k)).getPackageName());

                    ai = npm.getUidsWithPolicy(1);
                    l = ActivityManager.getCurrentUser();
                    i1 = ai.length;
                    for (j1 = 0; j1 < i1; j1++)
                    {
                        k1 = ai[j1];
                        if (UserHandle.getUserId(k1) == l)
                            npm.setUidPolicy(k1, 0);
                    }

                    handler.post(new Runnable() {

                        final _cls1 this$1;

                        public void run()
                        {
                            if (getActivity() != null && mActivityResumed)
                            {
                                for (int i = 0; i < mTabs.size(); i++)
                                {
                                    TabInfo tabinfo = (TabInfo)mTabs.get(i);
                                    if (tabinfo.mApplications != null)
                                        tabinfo.mApplications.pause();
                                }

                                if (mCurTab != null)
                                    mCurTab.resume(mSortOrder);
                            }
                        }

            
            {
                this$1 = _cls1.this;
                super();
            }
                    }
);
                    return null;
                }

            
            {
                this$0 = ManageApplications.this;
                pm = packagemanager;
                nm = inotificationmanager;
                npm = networkpolicymanager;
                handler = handler1;
                super();
            }
            }
).execute(new Void[0]);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setHasOptionsMenu(true);
        mApplicationsState = ApplicationsState.getInstance(getActivity().getApplication());
        Intent intent = getActivity().getIntent();
        String s = intent.getAction();
        String s1;
        if (getArguments() != null)
            s1 = getArguments().getString("classname");
        else
            s1 = null;
        if (s1 == null)
            s1 = intent.getComponent().getClassName();
        int i;
        if (!s1.equals(com/android/settings/Settings$RunningServicesActivity.getName()) && !s1.endsWith(".RunningServices"))
        {
            if (!s1.equals(com/android/settings/Settings$StorageUseActivity.getName()) && !"android.intent.action.MANAGE_PACKAGE_STORAGE".equals(s) && !s1.endsWith(".StorageUse"))
            {
                boolean flag = "android.settings.MANAGE_ALL_APPLICATIONS_SETTINGS".equals(s);
                i = 0;
                if (flag)
                    i = 3;
            } else
            {
                mSortOrder = 5;
                i = 3;
            }
        } else
        {
            i = 1;
        }
        if (bundle != null)
        {
            mSortOrder = bundle.getInt("sortOrder", mSortOrder);
            int j = bundle.getInt("defaultListType", -1);
            if (j != -1)
                i = j;
            mShowBackground = bundle.getBoolean("showBackground", false);
        }
        mDefaultListType = i;
        Intent intent1 = (new Intent()).setComponent(StorageMeasurement.DEFAULT_CONTAINER_COMPONENT);
        getActivity().bindService(intent1, mContainerConnection, 1);
        mInvalidSizeStr = getActivity().getText(0x7f0b067d);
        mComputingSizeStr = getActivity().getText(0x7f0b067c);
        mStorageManager = (StorageManager)getActivity().getSystemService("storage");
        mExtStoragePath = Environment.getLegacyExternalStorageDirectory().getPath();
        sSdDescription = getSdDesc(mExtStoragePath);
        TabInfo tabinfo = new TabInfo(this, mApplicationsState, getActivity().getString(0x7f0b0660), 0, this, bundle);
        mTabs.add(tabinfo);
        if (!Environment.isExternalStorageEmulated())
        {
            TabInfo tabinfo3 = new TabInfo(this, mApplicationsState, sSdDescription, 2, this, bundle);
            mTabs.add(tabinfo3);
        }
        TabInfo tabinfo1 = new TabInfo(this, mApplicationsState, getActivity().getString(0x7f0b0661), 1, this, bundle);
        mTabs.add(tabinfo1);
        TabInfo tabinfo2 = new TabInfo(this, mApplicationsState, getActivity().getString(0x7f0b065f), 3, this, bundle);
        mTabs.add(tabinfo2);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        mOptionsMenu = menu;
        menu.add(0, 4, 1, 0x7f0b0654).setShowAsAction(0);
        menu.add(0, 5, 2, 0x7f0b0655).setShowAsAction(0);
        menu.add(0, 6, 3, 0x7f0b0656).setShowAsAction(1);
        menu.add(0, 7, 3, 0x7f0b0657).setShowAsAction(1);
        menu.add(0, 8, 4, 0x7f0b0658).setShowAsAction(0);
        updateOptionsMenu();
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        View view;
        mInflater = layoutinflater;
        view = mInflater.inflate(0x7f040046, viewgroup, false);
        mContentContainer = viewgroup;
        mRootView = view;
        mViewPager = (ViewPager)view.findViewById(0x7f0800c6);
        MyPagerAdapter mypageradapter = new MyPagerAdapter();
        mViewPager.setAdapter(mypageradapter);
        mViewPager.setOnPageChangeListener(mypageradapter);
        PagerTabStrip pagertabstrip = (PagerTabStrip)view.findViewById(0x7f0800c7);
        pagertabstrip.setTabIndicatorColorResource(0x1060012);
        int i = getResources().getThemeMainColor();
        if (i != 0)
            pagertabstrip.setTabIndicatorColor(i);
        if (viewgroup instanceof PreferenceFrameLayout)
            ((android.preference.PreferenceFrameLayout.LayoutParams)view.getLayoutParams()).removeBorders = true;
        if (bundle != null && bundle.getBoolean("resetDialog"))
            buildResetDialog();
        if (bundle != null) goto _L2; else goto _L1
_L1:
        int j = 0;
_L7:
        if (j >= mTabs.size()) goto _L2; else goto _L3
_L3:
        if (((TabInfo)mTabs.get(j)).mListType != mDefaultListType) goto _L5; else goto _L4
_L4:
        mViewPager.setCurrentItem(j);
_L2:
        return view;
_L5:
        j++;
        if (true) goto _L7; else goto _L6
_L6:
    }

    public void onDestroy()
    {
        getActivity().unbindService(mContainerConnection);
        ApplicationsState.removeInstance();
        mApplicationsState.exitBackgroundThread();
        super.onDestroy();
    }

    public void onDestroyOptionsMenu()
    {
        mOptionsMenu = null;
    }

    public void onDestroyView()
    {
        super.onDestroyView();
        for (int i = 0; i < mTabs.size(); i++)
            ((TabInfo)mTabs.get(i)).detachView();

    }

    public void onDismiss(DialogInterface dialoginterface)
    {
        if (mResetDialog == dialoginterface)
            mResetDialog = null;
    }

    public void onItemClick(TabInfo tabinfo, AdapterView adapterview, View view, int i, long l)
    {
        if (tabinfo.mApplications != null && tabinfo.mApplications.getCount() > i)
        {
            mCurrentPkgName = ((PackageItemInfo) (tabinfo.mApplications.getAppEntry(i).info)).packageName;
            startApplicationDetailsActivity();
        }
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        boolean flag;
label0:
        {
            int i = menuitem.getItemId();
            if (i != 4 && i != 5)
            {
                if (i == 6)
                {
                    mShowBackground = false;
                    if (mCurTab != null && mCurTab.mRunningProcessesView != null)
                        mCurTab.mRunningProcessesView.mAdapter.setShowBackground(false);
                } else
                if (i == 7)
                {
                    mShowBackground = true;
                    if (mCurTab != null && mCurTab.mRunningProcessesView != null)
                        mCurTab.mRunningProcessesView.mAdapter.setShowBackground(true);
                } else
                {
                    flag = false;
                    if (i != 8)
                        break label0;
                    buildResetDialog();
                }
            } else
            {
                mSortOrder = i;
                if (mCurTab != null && mCurTab.mApplications != null)
                    mCurTab.mApplications.rebuild(mSortOrder);
            }
            updateOptionsMenu();
            flag = true;
        }
        return flag;
    }

    public void onPause()
    {
        super.onPause();
        mActivityResumed = false;
        for (int i = 0; i < mTabs.size(); i++)
            ((TabInfo)mTabs.get(i)).pause();

    }

    public void onPrepareOptionsMenu(Menu menu)
    {
        updateOptionsMenu();
    }

    public void onResume()
    {
        super.onResume();
        mActivityResumed = true;
        updateCurrentTab(mViewPager.getCurrentItem());
        updateOptionsMenu();
    }

    public void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        bundle.putInt("sortOrder", mSortOrder);
        if (mDefaultListType != -1)
            bundle.putInt("defaultListType", mDefaultListType);
        bundle.putBoolean("showBackground", mShowBackground);
        if (mResetDialog != null)
            bundle.putBoolean("resetDialog", true);
    }

    public void onStart()
    {
        super.onStart();
    }

    public void onStop()
    {
        super.onStop();
        if (mResetDialog != null)
        {
            mResetDialog.dismiss();
            mResetDialog = null;
        }
    }

    TabInfo tabForType(int i)
    {
        for (int j = 0; j < mTabs.size(); j++)
        {
            TabInfo tabinfo = (TabInfo)mTabs.get(j);
            if (tabinfo.mListType == i)
                return tabinfo;
        }

        return null;
    }

    public void updateCurrentTab(int i)
    {
        mCurTab = (TabInfo)mTabs.get(i);
        if (mActivityResumed)
        {
            mCurTab.build(mInflater, mContentContainer, mRootView);
            mCurTab.resume(mSortOrder);
        } else
        {
            mCurTab.pause();
        }
        for (int j = 0; j < mTabs.size(); j++)
        {
            TabInfo tabinfo = (TabInfo)mTabs.get(j);
            if (tabinfo != mCurTab)
                tabinfo.pause();
        }

        mCurTab.updateStorageUsage();
        updateOptionsMenu();
        Activity activity = getActivity();
        if (activity != null)
            activity.invalidateOptionsMenu();
    }

    void updateOptionsMenu()
    {
        boolean flag = true;
        if (mOptionsMenu == null)
            return;
        if (mCurTab != null && mCurTab.mListType == flag)
        {
            TabInfo tabinfo = tabForType(flag);
            boolean flag3;
            if (tabinfo != null && tabinfo.mRunningProcessesView != null)
                flag3 = tabinfo.mRunningProcessesView.mAdapter.getShowBackground();
            else
                flag3 = false;
            mOptionsMenu.findItem(4).setVisible(false);
            mOptionsMenu.findItem(5).setVisible(false);
            mOptionsMenu.findItem(6).setVisible(flag3);
            MenuItem menuitem2 = mOptionsMenu.findItem(7);
            if (flag3)
                flag = false;
            menuitem2.setVisible(flag);
            mOptionsMenu.findItem(8).setVisible(false);
            return;
        }
        MenuItem menuitem = mOptionsMenu.findItem(4);
        boolean flag1;
        if (mSortOrder != 4)
            flag1 = flag;
        else
            flag1 = false;
        menuitem.setVisible(flag1);
        MenuItem menuitem1 = mOptionsMenu.findItem(5);
        boolean flag2;
        if (mSortOrder != 5)
            flag2 = flag;
        else
            flag2 = false;
        menuitem1.setVisible(flag2);
        mOptionsMenu.findItem(6).setVisible(false);
        mOptionsMenu.findItem(7).setVisible(false);
        mOptionsMenu.findItem(8).setVisible(flag);
    }








/*
    static IMediaContainerService access$1402(ManageApplications manageapplications, IMediaContainerService imediacontainerservice)
    {
        manageapplications.mContainerService = imediacontainerservice;
        return imediacontainerservice;
    }

*/




    // Unreferenced inner class com/android/settings/applications/ManageApplications$ApplicationsAdapter$1

/* anonymous class */
    class ApplicationsAdapter._cls1 extends Filter
    {

        final ApplicationsAdapter this$0;

        protected android.widget.Filter.FilterResults performFiltering(CharSequence charsequence)
        {
            ArrayList arraylist = applyPrefixFilter(charsequence, mBaseEntries);
            android.widget.Filter.FilterResults filterresults = new android.widget.Filter.FilterResults();
            filterresults.values = arraylist;
            filterresults.count = arraylist.size();
            return filterresults;
        }

        protected void publishResults(CharSequence charsequence, android.widget.Filter.FilterResults filterresults)
        {
            mCurFilterPrefix = charsequence;
            mEntries = (ArrayList)filterresults.values;
            notifyDataSetChanged();
            mTab.updateStorageUsage();
        }

            
            {
                this$0 = ApplicationsAdapter.this;
                super();
            }
    }


    // Unreferenced inner class com/android/settings/applications/ManageApplications$TabInfo$1

/* anonymous class */
    class TabInfo._cls1
        implements Runnable
    {

        final TabInfo this$0;

        public void run()
        {
            handleRunningProcessesAvail();
        }

            
            {
                this$0 = TabInfo.this;
                super();
            }
    }

}
