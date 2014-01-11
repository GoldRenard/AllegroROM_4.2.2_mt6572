// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.applications;

import android.app.*;
import android.app.admin.DevicePolicyManager;
import android.appwidget.AppWidgetManager;
import android.content.*;
import android.content.pm.*;
import android.content.res.Resources;
import android.hardware.usb.IUsbManager;
import android.net.Uri;
import android.os.*;
import android.os.storage.*;
import android.preference.PreferenceActivity;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.format.Formatter;
import android.text.style.BulletSpan;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.internal.telephony.ISms;
import com.android.settings.Utils;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package com.android.settings.applications:
//            ApplicationsState, CanBeOnSdCardChecker

public class InstalledAppDetails extends Fragment
    implements android.view.View.OnClickListener, android.widget.CompoundButton.OnCheckedChangeListener, ApplicationsState.Callbacks
{
    class ClearCacheObserver extends android.content.pm.IPackageDataObserver.Stub
    {

        final InstalledAppDetails this$0;

        public void onRemoveCompleted(String s, boolean flag)
        {
            Message message = mHandler.obtainMessage(3);
            int i;
            if (flag)
                i = 1;
            else
                i = 2;
            message.arg1 = i;
            mHandler.sendMessage(message);
        }

        ClearCacheObserver()
        {
            this$0 = InstalledAppDetails.this;
            super();
        }
    }

    class ClearUserDataObserver extends android.content.pm.IPackageDataObserver.Stub
    {

        final InstalledAppDetails this$0;

        public void onRemoveCompleted(String s, boolean flag)
        {
            int i = 1;
            Message message = mHandler.obtainMessage(i);
            if (!flag)
                i = 2;
            message.arg1 = i;
            mHandler.sendMessage(message);
        }

        ClearUserDataObserver()
        {
            this$0 = InstalledAppDetails.this;
            super();
        }
    }

    static class DisableChanger extends AsyncTask
    {

        final WeakReference mActivity;
        final ApplicationInfo mInfo;
        final PackageManager mPm;
        final int mState;

        protected transient Object doInBackground(Object aobj[])
        {
            mPm.setApplicationEnabledSetting(((PackageItemInfo) (mInfo)).packageName, mState, 0);
            return null;
        }

        DisableChanger(InstalledAppDetails installedappdetails, ApplicationInfo applicationinfo, int i)
        {
            mPm = installedappdetails.mPm;
            mActivity = new WeakReference(installedappdetails);
            mInfo = applicationinfo;
            mState = i;
        }
    }

    public static class MyAlertDialogFragment extends DialogFragment
    {

        public static MyAlertDialogFragment newInstance(int i, int j)
        {
            MyAlertDialogFragment myalertdialogfragment = new MyAlertDialogFragment();
            Bundle bundle = new Bundle();
            bundle.putInt("id", i);
            bundle.putInt("moveError", j);
            myalertdialogfragment.setArguments(bundle);
            return myalertdialogfragment;
        }

        InstalledAppDetails getOwner()
        {
            return (InstalledAppDetails)getTargetFragment();
        }

        public Dialog onCreateDialog(Bundle bundle)
        {
            int i = getArguments().getInt("id");
            int j = getArguments().getInt("moveError");
            switch (i)
            {
            case 9: // '\t'
                return (new android.app.AlertDialog.Builder(getActivity())).setTitle(getActivity().getText(0x7f0b0691)).setIconAttribute(0x1010355).setMessage(getActivity().getText(0x7f0b0692)).setPositiveButton(0x7f0b066b, new android.content.DialogInterface.OnClickListener() {

                    final MyAlertDialogFragment this$0;

                    public void onClick(DialogInterface dialoginterface, int i)
                    {
                        getOwner().uninstallPkg(((PackageItemInfo) (getOwner().mAppEntry.info)).packageName, false, true);
                    }

            
            {
                this$0 = MyAlertDialogFragment.this;
                super();
            }
                }
).setNegativeButton(0x7f0b066c, null).create();

            case 8: // '\b'
                return (new android.app.AlertDialog.Builder(getActivity())).setTitle(getActivity().getText(0x7f0b0693)).setIconAttribute(0x1010355).setMessage(getActivity().getText(0x7f0b0694)).setPositiveButton(0x7f0b066b, new android.content.DialogInterface.OnClickListener() {

                    final MyAlertDialogFragment this$0;

                    public void onClick(DialogInterface dialoginterface, int i)
                    {
                        getOwner().setNotificationsEnabled(false);
                    }

            
            {
                this$0 = MyAlertDialogFragment.this;
                super();
            }
                }
).setNegativeButton(0x7f0b066c, new android.content.DialogInterface.OnClickListener() {

                    final MyAlertDialogFragment this$0;

                    public void onClick(DialogInterface dialoginterface, int i)
                    {
                        getOwner().mNotificationSwitch.setChecked(true);
                    }

            
            {
                this$0 = MyAlertDialogFragment.this;
                super();
            }
                }
).create();

            case 7: // '\007'
                return (new android.app.AlertDialog.Builder(getActivity())).setTitle(getActivity().getText(0x7f0b068f)).setIconAttribute(0x1010355).setMessage(getActivity().getText(0x7f0b0690)).setPositiveButton(0x7f0b066b, new android.content.DialogInterface.OnClickListener() {

                    final MyAlertDialogFragment this$0;

                    public void onClick(DialogInterface dialoginterface, int i)
                    {
                        Log.d("InstalledAppDetails", "disable app dialog ");
                        DisableChanger disablechanger = new DisableChanger(getOwner(), getOwner().mAppEntry.info, 3);
                        Object aobj[] = new Object[1];
                        aobj[0] = (Object)null;
                        disablechanger.execute(aobj);
                    }

            
            {
                this$0 = MyAlertDialogFragment.this;
                super();
            }
                }
).setNegativeButton(0x7f0b066c, null).create();

            case 6: // '\006'
                Activity activity = getActivity();
                Object aobj[] = new Object[1];
                aobj[0] = getOwner().getMoveErrMsg(j);
                String s = activity.getString(0x7f0b068c, aobj);
                Log.d("InstalledAppDetails", (new StringBuilder()).append("move fail message : ").append(s).toString());
                return (new android.app.AlertDialog.Builder(getActivity())).setTitle(getActivity().getText(0x7f0b068b)).setIconAttribute(0x1010355).setMessage(s).setNeutralButton(0x7f0b066b, null).create();

            case 5: // '\005'
                return (new android.app.AlertDialog.Builder(getActivity())).setTitle(getActivity().getText(0x7f0b0689)).setIconAttribute(0x1010355).setMessage(getActivity().getText(0x7f0b068a)).setPositiveButton(0x7f0b066b, new android.content.DialogInterface.OnClickListener() {

                    final MyAlertDialogFragment this$0;

                    public void onClick(DialogInterface dialoginterface, int i)
                    {
                        Log.d("InstalledAppDetails", "force stop pacakage ");
                        getOwner().forceStopPackage(((PackageItemInfo) (getOwner().mAppEntry.info)).packageName);
                    }

            
            {
                this$0 = MyAlertDialogFragment.this;
                super();
            }
                }
).setNegativeButton(0x7f0b066c, null).create();

            case 4: // '\004'
                return (new android.app.AlertDialog.Builder(getActivity())).setTitle(getActivity().getText(0x7f0b0672)).setIconAttribute(0x1010355).setMessage(getActivity().getText(0x7f0b0673)).setNeutralButton(0x7f0b066b, new android.content.DialogInterface.OnClickListener() {

                    final MyAlertDialogFragment this$0;

                    public void onClick(DialogInterface dialoginterface, int i)
                    {
                        getOwner().mClearDataButton.setEnabled(false);
                        Log.d("InstalledAppDetails", "cannot clear data ");
                        getOwner().setIntentAndFinish(false, false);
                    }

            
            {
                this$0 = MyAlertDialogFragment.this;
                super();
            }
                }
).create();

            case 3: // '\003'
                return (new android.app.AlertDialog.Builder(getActivity())).setTitle(getActivity().getText(0x7f0b066d)).setIconAttribute(0x1010355).setMessage(getActivity().getText(0x7f0b066d)).setNeutralButton(getActivity().getText(0x7f0b066b), new android.content.DialogInterface.OnClickListener() {

                    final MyAlertDialogFragment this$0;

                    public void onClick(DialogInterface dialoginterface, int i)
                    {
                        Log.d("InstalledAppDetails", "app not found dialog ");
                        getOwner().setIntentAndFinish(true, true);
                    }

            
            {
                this$0 = MyAlertDialogFragment.this;
                super();
            }
                }
).create();

            case 2: // '\002'
                return (new android.app.AlertDialog.Builder(getActivity())).setTitle(getActivity().getText(0x7f0b0670)).setIconAttribute(0x1010355).setMessage(getActivity().getText(0x7f0b0671)).setPositiveButton(0x7f0b066b, new android.content.DialogInterface.OnClickListener() {

                    final MyAlertDialogFragment this$0;

                    public void onClick(DialogInterface dialoginterface, int i)
                    {
                        Log.d("InstalledAppDetails", "click factory reset to uninstall package ");
                        getOwner().uninstallPkg(((PackageItemInfo) (getOwner().mAppEntry.info)).packageName, false, false);
                    }

            
            {
                this$0 = MyAlertDialogFragment.this;
                super();
            }
                }
).setNegativeButton(0x7f0b066c, null).create();

            case 1: // '\001'
                return (new android.app.AlertDialog.Builder(getActivity())).setTitle(getActivity().getText(0x7f0b0669)).setIconAttribute(0x1010355).setMessage(getActivity().getText(0x7f0b066a)).setPositiveButton(0x7f0b066b, new android.content.DialogInterface.OnClickListener() {

                    final MyAlertDialogFragment this$0;

                    public void onClick(DialogInterface dialoginterface, int i)
                    {
                        Log.d("InstalledAppDetails", "click clear data dialog OK button");
                        getOwner().initiateClearUserData();
                    }

            
            {
                this$0 = MyAlertDialogFragment.this;
                super();
            }
                }
).setNegativeButton(0x7f0b066c, null).create();
            }
            throw new IllegalArgumentException((new StringBuilder()).append("unknown id ").append(i).toString());
        }

    }

    class PackageMoveObserver extends android.content.pm.IPackageMoveObserver.Stub
    {

        final InstalledAppDetails this$0;

        public void packageMoved(String s, int i)
            throws RemoteException
        {
            Message message = mHandler.obtainMessage(4);
            message.arg1 = i;
            mHandler.sendMessage(message);
        }

        PackageMoveObserver()
        {
            this$0 = InstalledAppDetails.this;
            super();
        }
    }

    private static class PremiumSmsSelectionListener
        implements android.widget.AdapterView.OnItemSelectedListener
    {

        private final String mPackageName;
        private final ISms mSmsManager;

        private void setPremiumSmsPermission(String s, int i)
        {
            try
            {
                if (mSmsManager != null)
                    mSmsManager.setPremiumSmsPermission(s, i);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
        }

        public void onItemSelected(AdapterView adapterview, View view, int i, long l)
        {
            if (i >= 0 && i < 3)
            {
                Log.d("InstalledAppDetails", (new StringBuilder()).append("Selected premium SMS policy ").append(i).toString());
                setPremiumSmsPermission(mPackageName, i + 1);
                return;
            } else
            {
                Log.e("InstalledAppDetails", (new StringBuilder()).append("Error: unknown premium SMS policy ").append(i).toString());
                return;
            }
        }

        public void onNothingSelected(AdapterView adapterview)
        {
        }

        PremiumSmsSelectionListener(String s, ISms isms)
        {
            mPackageName = s;
            mSmsManager = isms;
        }
    }


    private static final String ACTION_DYNAMIC_SD_SWAP = "com.mediatek.SD_SWAP";
    public static final String ARG_PACKAGE_NAME = "package";
    private static final int CLEAR_CACHE = 3;
    private static final int CLEAR_USER_DATA = 1;
    private static final int DLG_APP_NOT_FOUND = 3;
    private static final int DLG_BASE = 0;
    private static final int DLG_CANNOT_CLEAR_DATA = 4;
    private static final int DLG_CLEAR_DATA = 1;
    private static final int DLG_DISABLE = 7;
    private static final int DLG_DISABLE_NOTIFICATIONS = 8;
    private static final int DLG_FACTORY_RESET = 2;
    private static final int DLG_FORCE_STOP = 5;
    private static final int DLG_MOVE_FAILED = 6;
    private static final int DLG_SPECIAL_DISABLE = 9;
    private static final int OP_FAILED = 2;
    private static final int OP_SUCCESSFUL = 1;
    private static final int PACKAGE_MOVE = 4;
    public static final int REQUEST_MANAGE_SPACE = 2;
    public static final int REQUEST_UNINSTALL = 1;
    private static final int SIZE_INVALID = -1;
    private static final String TAG = "InstalledAppDetails";
    public static final int UNINSTALL_ALL_USERS_MENU = 1;
    private static final boolean localLOGV;
    private Button mActivitiesButton;
    private ApplicationsState.AppEntry mAppEntry;
    private TextView mAppSize;
    private TextView mAppVersion;
    private AppWidgetManager mAppWidgetManager;
    private CheckBox mAskCompatibilityCB;
    private TextView mCacheSize;
    private CanBeOnSdCardChecker mCanBeOnSdCardChecker;
    private boolean mCanClearData;
    private final BroadcastReceiver mCheckKillProcessesReceiver = new BroadcastReceiver() {

        final InstalledAppDetails this$0;

        public void onReceive(Context context, Intent intent)
        {
            InstalledAppDetails installedappdetails = InstalledAppDetails.this;
            boolean flag;
            if (getResultCode() != 0)
                flag = true;
            else
                flag = false;
            installedappdetails.updateForceStopButton(flag);
        }

            
            {
                this$0 = InstalledAppDetails.this;
                super();
            }
    }
;
    private Button mClearCacheButton;
    private ClearCacheObserver mClearCacheObserver;
    private Button mClearDataButton;
    private ClearUserDataObserver mClearDataObserver;
    private CharSequence mComputingStr;
    private TextView mDataSize;
    private boolean mDisableAfterUninstall;
    private DevicePolicyManager mDpm;
    private BroadcastReceiver mDycSwapReceiver;
    private CheckBox mEnableCompatibilityCB;
    private String mExtStoragePath;
    private TextView mExternalCodeSize;
    private TextView mExternalCodeSizeLabel;
    private TextView mExternalDataSize;
    private TextView mExternalDataSizeLabel;
    private Button mForceStopButton;
    private Handler mHandler;
    private boolean mHaveSizes;
    private boolean mInitialized;
    private Intent mIntent;
    private CharSequence mInvalidSizeStr;
    private long mLastCacheSize;
    private long mLastCodeSize;
    private long mLastDataSize;
    private long mLastExternalCodeSize;
    private long mLastExternalDataSize;
    private long mLastTotalSize;
    private Button mLaunchButton;
    private View mMoreControlButtons;
    private Button mMoveAppButton;
    private boolean mMoveInProgress;
    private CompoundButton mNotificationSwitch;
    private PackageInfo mPackageInfo;
    private PackageMoveObserver mPackageMoveObserver;
    private PackageManager mPm;
    private View mRootView;
    private String mSDcardDescription;
    private View mScreenCompatSection;
    private ApplicationsState.Session mSession;
    private boolean mShowUninstalled;
    private ISms mSmsManager;
    private Button mSpecialDisableButton;
    private ApplicationsState mState;
    StorageEventListener mStorageListener;
    private StorageManager mStorageManager;
    private TextView mTotalSize;
    private Button mUninstallButton;
    private boolean mUpdatedSysApp;
    private IUsbManager mUsbManager;
    private UserManager mUserManager;

    public InstalledAppDetails()
    {
        mMoveInProgress = false;
        mUpdatedSysApp = false;
        mCanClearData = true;
        mHaveSizes = false;
        mLastCodeSize = -1L;
        mLastDataSize = -1L;
        mLastExternalCodeSize = -1L;
        mLastExternalDataSize = -1L;
        mLastCacheSize = -1L;
        mLastTotalSize = -1L;
        mHandler = new Handler() {

            final InstalledAppDetails this$0;

            public void handleMessage(Message message)
            {
                if (getView() == null)
                    return;
                switch (message.what)
                {
                case 4: // '\004'
                    Log.d("InstalledAppDetails", "handle message : package move ");
                    processMoveMsg(message);
                    return;

                case 3: // '\003'
                    Log.d("InstalledAppDetails", "handle message : clear ucache ");
                    mState.requestSize(((PackageItemInfo) (mAppEntry.info)).packageName);
                    return;

                case 1: // '\001'
                    Log.d("InstalledAppDetails", "handle message : clear user data ");
                    processClearMsg(message);
                    return;

                case 2: // '\002'
                default:
                    return;
                }
            }

            
            {
                this$0 = InstalledAppDetails.this;
                super();
            }
        }
;
        mStorageListener = new StorageEventListener() {

            final InstalledAppDetails this$0;

            public void onStorageStateChanged(String s, String s1, String s2)
            {
                Log.i("InstalledAppDetails", (new StringBuilder()).append("Received storage state changed notification that ").append(s).append(" changed state from ").append(s1).append(" to ").append(s2).toString());
                initDataButtons();
            }

            
            {
                this$0 = InstalledAppDetails.this;
                super();
            }
        }
;
        mDycSwapReceiver = new BroadcastReceiver() {

            final InstalledAppDetails this$0;

            public void onReceive(Context context, Intent intent)
            {
                Log.d("InstalledAppDetails", "dynamic swap, update the UI about SD card");
                refeshUi2SD();
            }

            
            {
                this$0 = InstalledAppDetails.this;
                super();
            }
        }
;
    }

    private void checkForceStop()
    {
        if (mDpm.packageHasActiveAdmins(mPackageInfo.packageName))
        {
            Log.d("InstalledAppDetails", "checkForceStop --- mDpm.packageHasActiveAdmins(mPackageInfo.packageName");
            updateForceStopButton(false);
            return;
        }
        if ((0x200000 & mAppEntry.info.flags) == 0)
        {
            Log.d("InstalledAppDetails", "checkForceStop,(mAppEntry.info.flags&ApplicationInfo.FLAG_STOPPED) == 0");
            updateForceStopButton(true);
            return;
        } else
        {
            Log.d("InstalledAppDetails", "checkForceStop --- sendOrderedBroadcast");
            Intent intent = new Intent("android.intent.action.QUERY_PACKAGE_RESTART", Uri.fromParts("package", ((PackageItemInfo) (mAppEntry.info)).packageName, null));
            String as[] = new String[1];
            as[0] = ((PackageItemInfo) (mAppEntry.info)).packageName;
            intent.putExtra("android.intent.extra.PACKAGES", as);
            intent.putExtra("android.intent.extra.UID", mAppEntry.info.uid);
            intent.putExtra("android.intent.extra.user_handle", UserHandle.getUserId(mAppEntry.info.uid));
            getActivity().sendOrderedBroadcast(intent, null, mCheckKillProcessesReceiver, null, 0, null, null);
            return;
        }
    }

    private void forceStopPackage(String s)
    {
        ((ActivityManager)getActivity().getSystemService("activity")).forceStopPackage(s);
        mState.invalidatePackage(s);
        ApplicationsState.AppEntry appentry = mState.getEntry(s);
        if (appentry != null)
            mAppEntry = appentry;
        checkForceStop();
    }

    private CharSequence getMoveErrMsg(int i)
    {
        switch (i)
        {
        case -6: 
            return "";

        case -3: 
            return getActivity().getString(0x7f0b0688);

        case -5: 
            return getActivity().getString(0x7f0b0687);

        case -4: 
            return getActivity().getString(0x7f0b0686);

        case -2: 
            return getActivity().getString(0x7f0b0685);

        case -1: 
            return getActivity().getString(0x7f0b0684);
        }
        return "";
    }

    private int getPremiumSmsPermission(String s)
    {
        int i;
        if (mSmsManager == null)
            break MISSING_BLOCK_LABEL_21;
        i = mSmsManager.getPremiumSmsPermission(s);
        return i;
        RemoteException remoteexception;
        remoteexception;
        return 0;
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

    private String getSizeStr(long l)
    {
        if (l == -1L)
            return mInvalidSizeStr.toString();
        else
            return Formatter.formatFileSize(getActivity(), l);
    }

    private boolean handleDisableable(Button button)
    {
        boolean flag = false;
        List list;
        ArrayList arraylist;
        try
        {
            mPm.getPackageInfo("android", 64);
            Intent intent = new Intent("android.intent.action.MAIN");
            intent.addCategory("android.intent.category.HOME");
            intent.setPackage(((PackageItemInfo) (mAppEntry.info)).packageName);
            list = mPm.queryIntentActivities(intent, 0);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Log.w("InstalledAppDetails", "Unable to get package info", namenotfoundexception);
            return flag;
        }
        flag = false;
        if (list == null)
            break MISSING_BLOCK_LABEL_81;
        if (list.size() > 0)
            break MISSING_BLOCK_LABEL_88;
        if (!isThisASystemPackage())
            break MISSING_BLOCK_LABEL_132;
        Log.d("InstalledAppDetails", (new StringBuilder()).append("core system applications :").append(((PackageItemInfo) (mAppEntry.info)).packageName).toString());
        button.setText(0x7f0b0648);
        return false;
        arraylist = Utils.disableAppList;
        flag = false;
        if (arraylist == null)
            break MISSING_BLOCK_LABEL_210;
        if (!Utils.disableAppList.contains(((PackageItemInfo) (mAppEntry.info)).packageName))
            break MISSING_BLOCK_LABEL_210;
        Log.d("InstalledAppDetails", (new StringBuilder()).append("mDisableAppsList contains :").append(((PackageItemInfo) (mAppEntry.info)).packageName).toString());
        mUninstallButton.setText(0x7f0b0648);
        return false;
        if (!mAppEntry.info.enabled)
            break MISSING_BLOCK_LABEL_286;
        Log.d("InstalledAppDetails", (new StringBuilder()).append("mAppEntry.info.enabled :").append(mAppEntry.info.enabled).append(" packagename: ").append(((PackageItemInfo) (mAppEntry.info)).packageName).toString());
        button.setText(0x7f0b0648);
        return true;
        button.setText(0x7f0b0649);
        flag = true;
        Log.d("InstalledAppDetails", (new StringBuilder()).append("else :").append(((PackageItemInfo) (mAppEntry.info)).packageName).toString());
        return flag;
    }

    private void initDataButtons()
    {
        if ((0x41 & mAppEntry.info.flags) != 1 && !mDpm.packageHasActiveAdmins(mPackageInfo.packageName))
        {
            if (mAppEntry.info.manageSpaceActivityName != null)
            {
                mClearDataButton.setText(0x7f0b065c);
                if (!mStorageManager.getVolumeState(mExtStoragePath).equals("mounted"))
                {
                    Log.d("InstalledAppDetails", "/mnt/sdcard is not mounted.");
                    if ((0x40000 & mAppEntry.info.flags) != 0)
                    {
                        Log.d("InstalledAppDetails", "ApplicationInfo.FLAG_EXTERNAL_STORAGE");
                        mClearDataButton.setEnabled(false);
                        mCanClearData = false;
                    } else
                    {
                        Log.d("InstalledAppDetails", "ApplicationInfo.FLAG_INTERNAL_STORAGE");
                    }
                } else
                {
                    Log.d("InstalledAppDetails", "/mnt/sdcard is mounted.");
                    mClearDataButton.setEnabled(true);
                    mCanClearData = true;
                }
            } else
            {
                mClearDataButton.setText(0x7f0b064a);
            }
            mClearDataButton.setOnClickListener(this);
            return;
        } else
        {
            mClearDataButton.setText(0x7f0b064a);
            mClearDataButton.setEnabled(false);
            mCanClearData = false;
            return;
        }
    }

    private void initMoveButton()
    {
        if (!Environment.isExternalStorageEmulated())
        {
            boolean flag;
            if (mPackageInfo == null && mAppEntry != null)
                flag = true;
            else
                flag = false;
            boolean flag1 = true;
            if (flag)
                mMoveAppButton.setText(0x7f0b0680);
            else
            if ((0x40000 & mAppEntry.info.flags) != 0)
            {
                String s = getResources().getString(0x7f0b0666);
                mMoveAppButton.setText(getResources().getString(0x7f0b011e, new Object[] {
                    s
                }));
                flag1 = false;
            } else
            {
                Button button = mMoveAppButton;
                Resources resources = getResources();
                Object aobj[] = new Object[1];
                aobj[0] = mSDcardDescription;
                button.setText(resources.getString(0x7f0b011e, aobj));
                mCanBeOnSdCardChecker.init();
                if (!mCanBeOnSdCardChecker.check(mAppEntry.info))
                    flag1 = true;
                else
                    flag1 = false;
            }
            if (flag1)
            {
                mMoveAppButton.setEnabled(false);
                return;
            } else
            {
                mMoveAppButton.setOnClickListener(this);
                mMoveAppButton.setEnabled(true);
                return;
            }
        } else
        {
            mMoveAppButton.setVisibility(4);
            return;
        }
    }

    private void initNotificationButton()
    {
        INotificationManager inotificationmanager;
        boolean flag;
        inotificationmanager = android.app.INotificationManager.Stub.asInterface(ServiceManager.getService("notification"));
        flag = true;
        boolean flag1 = inotificationmanager.areNotificationsEnabledForPackage(((PackageItemInfo) (mAppEntry.info)).packageName);
        flag = flag1;
_L2:
        mNotificationSwitch.setChecked(flag);
        if (isThisASystemPackage())
        {
            mNotificationSwitch.setEnabled(false);
            return;
        } else
        {
            mNotificationSwitch.setEnabled(true);
            mNotificationSwitch.setOnCheckedChangeListener(this);
            return;
        }
        RemoteException remoteexception;
        remoteexception;
        if (true) goto _L2; else goto _L1
_L1:
    }

    private void initUninstallButtons()
    {
        boolean flag;
        if ((0x80 & mAppEntry.info.flags) != 0)
            flag = true;
        else
            flag = false;
        mUpdatedSysApp = flag;
        boolean flag1 = true;
        if (mUpdatedSysApp)
        {
            mUninstallButton.setText(0x7f0b064b);
            int i = 1 & mAppEntry.info.flags;
            boolean flag2 = false;
            if (i != 0)
            {
                flag2 = handleDisableable(mSpecialDisableButton);
                mSpecialDisableButton.setOnClickListener(this);
            }
            View view = mMoreControlButtons;
            byte byte0 = 0;
            if (!flag2)
                byte0 = 8;
            view.setVisibility(byte0);
        } else
        {
            mMoreControlButtons.setVisibility(8);
            if ((1 & mAppEntry.info.flags) != 0)
                flag1 = handleDisableable(mUninstallButton);
            else
            if ((0x800000 & mPackageInfo.applicationInfo.flags) == 0 && mUserManager.getUsers().size() >= 2)
            {
                mUninstallButton.setText(0x7f0b0645);
                flag1 = false;
            } else
            {
                mUninstallButton.setText(0x7f0b0645);
            }
        }
        if (mDpm.packageHasActiveAdmins(mPackageInfo.packageName))
            flag1 = false;
        mUninstallButton.setEnabled(flag1);
        if (flag1)
            mUninstallButton.setOnClickListener(this);
    }

    private void initiateClearUserData()
    {
        mClearDataButton.setEnabled(false);
        String s = ((PackageItemInfo) (mAppEntry.info)).packageName;
        Log.i("InstalledAppDetails", (new StringBuilder()).append("Clearing user data for package : ").append(s).toString());
        if (mClearDataObserver == null)
            mClearDataObserver = new ClearUserDataObserver();
        if (!((ActivityManager)getActivity().getSystemService("activity")).clearApplicationUserData(s, mClearDataObserver))
        {
            Log.i("InstalledAppDetails", (new StringBuilder()).append("Couldnt clear application user data for package:").append(s).toString());
            showDialogInner(4, 0);
            return;
        } else
        {
            mClearDataButton.setText(0x7f0b0668);
            return;
        }
    }

    private boolean isThisASystemPackage()
    {
        PackageInfo packageinfo;
        PackageInfo packageinfo1;
        boolean flag;
        Signature asignature[];
        boolean flag1;
        try
        {
            packageinfo = mPm.getPackageInfo("android", 64);
            packageinfo1 = mPackageInfo;
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            return false;
        }
        flag = false;
        if (packageinfo1 == null)
            break MISSING_BLOCK_LABEL_73;
        asignature = mPackageInfo.signatures;
        flag = false;
        if (asignature == null)
            break MISSING_BLOCK_LABEL_73;
        flag1 = packageinfo.signatures[0].equals(mPackageInfo.signatures[0]);
        flag = false;
        if (flag1)
            flag = true;
        return flag;
    }

    private void processClearMsg(Message message)
    {
        int i = message.arg1;
        Log.i("InstalledAppDetails", (new StringBuilder()).append("Cleared user data result:").append(i).toString());
        String s = ((PackageItemInfo) (mAppEntry.info)).packageName;
        mClearDataButton.setText(0x7f0b064a);
        if (i == 1)
        {
            Log.i("InstalledAppDetails", (new StringBuilder()).append("Cleared user data for package : ").append(s).toString());
            mState.requestSize(((PackageItemInfo) (mAppEntry.info)).packageName);
            Intent intent = new Intent("com.mediatek.intent.action.SETTINGS_PACKAGE_DATA_CLEARED");
            intent.putExtra("packageName", s);
            getActivity().sendBroadcast(intent);
        } else
        {
            Log.i("InstalledAppDetails", (new StringBuilder()).append("fail to clear user data for package : ").append(s).toString());
            mClearDataButton.setEnabled(true);
        }
        checkForceStop();
    }

    private void processMoveMsg(Message message)
    {
        int i = message.arg1;
        Log.i("InstalledAppDetails", (new StringBuilder()).append("Moved package result").append(i).toString());
        String s = ((PackageItemInfo) (mAppEntry.info)).packageName;
        mMoveInProgress = false;
        if (i == 1)
        {
            Log.i("InstalledAppDetails", (new StringBuilder()).append("Moved resources for ").append(s).append(" successfully").toString());
            mState.requestSize(((PackageItemInfo) (mAppEntry.info)).packageName);
        } else
        {
            Log.i("InstalledAppDetails", (new StringBuilder()).append("Fail to move resources , result = ").append(i).toString());
            showDialogInner(6, i);
        }
        refreshUi();
    }

    private void refeshUi2SD()
    {
        mSDcardDescription = getSdDesc(mExtStoragePath);
        refreshSizeLabel(mSDcardDescription);
        initMoveButton();
        initDataButtons();
    }

    private void refreshButtons()
    {
        if (!mMoveInProgress)
        {
            initUninstallButtons();
            initDataButtons();
            initMoveButton();
            initNotificationButton();
            return;
        } else
        {
            mMoveAppButton.setText(0x7f0b0683);
            mMoveAppButton.setEnabled(false);
            mUninstallButton.setEnabled(false);
            mSpecialDisableButton.setEnabled(false);
            return;
        }
    }

    private void refreshSizeInfo()
    {
        if (mAppEntry.size != -2L && mAppEntry.size != -1L)
        {
            mHaveSizes = true;
            long l = ((ApplicationsState.SizeInfo) (mAppEntry)).codeSize;
            long l1 = ((ApplicationsState.SizeInfo) (mAppEntry)).dataSize;
            if (Environment.isExternalStorageEmulated())
            {
                l += ((ApplicationsState.SizeInfo) (mAppEntry)).externalCodeSize;
                l1 += ((ApplicationsState.SizeInfo) (mAppEntry)).externalDataSize;
            } else
            {
                if (mLastExternalCodeSize != ((ApplicationsState.SizeInfo) (mAppEntry)).externalCodeSize)
                {
                    mLastExternalCodeSize = ((ApplicationsState.SizeInfo) (mAppEntry)).externalCodeSize;
                    mExternalCodeSize.setText(getSizeStr(((ApplicationsState.SizeInfo) (mAppEntry)).externalCodeSize));
                }
                if (mLastExternalDataSize != ((ApplicationsState.SizeInfo) (mAppEntry)).externalDataSize)
                {
                    mLastExternalDataSize = ((ApplicationsState.SizeInfo) (mAppEntry)).externalDataSize;
                    mExternalDataSize.setText(getSizeStr(((ApplicationsState.SizeInfo) (mAppEntry)).externalDataSize));
                }
            }
            if (mLastCodeSize != l)
            {
                mLastCodeSize = l;
                mAppSize.setText(getSizeStr(l));
            }
            if (mLastDataSize != l1)
            {
                mLastDataSize = l1;
                mDataSize.setText(getSizeStr(l1));
            }
            long l2 = ((ApplicationsState.SizeInfo) (mAppEntry)).cacheSize + ((ApplicationsState.SizeInfo) (mAppEntry)).externalCacheSize;
            if (mLastCacheSize != l2)
            {
                mLastCacheSize = l2;
                mCacheSize.setText(getSizeStr(l2));
            }
            if (mLastTotalSize != mAppEntry.size)
            {
                mLastTotalSize = mAppEntry.size;
                mTotalSize.setText(getSizeStr(mAppEntry.size));
            }
            if (((ApplicationsState.SizeInfo) (mAppEntry)).dataSize + ((ApplicationsState.SizeInfo) (mAppEntry)).externalDataSize > 0L && mCanClearData)
            {
                mClearDataButton.setEnabled(true);
                mClearDataButton.setOnClickListener(this);
            } else
            {
                mClearDataButton.setEnabled(false);
            }
            if (l2 <= 0L)
            {
                mClearCacheButton.setEnabled(false);
                return;
            } else
            {
                mClearCacheButton.setEnabled(true);
                mClearCacheButton.setOnClickListener(this);
                return;
            }
        }
        mLastTotalSize = -1L;
        mLastCacheSize = -1L;
        mLastDataSize = -1L;
        mLastCodeSize = -1L;
        if (!mHaveSizes)
        {
            mAppSize.setText(mComputingStr);
            mDataSize.setText(mComputingStr);
            mCacheSize.setText(mComputingStr);
            mTotalSize.setText(mComputingStr);
        }
        mClearDataButton.setEnabled(false);
        mClearCacheButton.setEnabled(false);
    }

    private void refreshSizeLabel(String s)
    {
        String s1 = getResources().getString(0x7f0b0641).toLowerCase();
        String s2 = getResources().getString(0x7f0b0643).toLowerCase();
        String s3;
        String s4;
        if (s2.getBytes().length - s2.length() > 0)
        {
            s3 = (new StringBuilder()).append(mSDcardDescription).append(s1).toString();
            s4 = (new StringBuilder()).append(mSDcardDescription).append(s2).toString();
        } else
        {
            s3 = (new StringBuilder()).append(mSDcardDescription).append(" ").append(s1).toString();
            s4 = (new StringBuilder()).append(mSDcardDescription).append(" ").append(s2).toString();
        }
        mExternalCodeSizeLabel.setText(s3);
        mExternalDataSizeLabel.setText(s4);
    }

    private boolean refreshUi()
    {
        String s;
        ArrayList arraylist;
        if (mMoveInProgress)
            return true;
        s = retrieveAppEntry();
        if (s == null)
            return false;
        if (mAppEntry == null)
            return false;
        if (mPackageInfo == null)
            return false;
        arraylist = new ArrayList();
        ArrayList arraylist1 = new ArrayList();
        mPm.getPreferredActivities(arraylist1, arraylist, s);
        boolean flag5 = mUsbManager.hasDefaults(s, UserHandle.myUserId());
        boolean flag = flag5;
_L2:
        ArrayList arraylist2;
        boolean flag1 = mAppWidgetManager.hasBindAppWidgetPermission(((PackageItemInfo) (mAppEntry.info)).packageName);
        TextView textview = (TextView)mRootView.findViewById(0x7f0800a2);
        TextView textview1 = (TextView)mRootView.findViewById(0x7f0800a3);
        boolean flag2;
        LinearLayout linearlayout;
        AppSecurityPermissions appsecuritypermissions;
        int j;
        TextView textview2;
        LinearLayout linearlayout1;
        if (arraylist.size() > 0 || flag)
            flag2 = true;
        else
            flag2 = false;
        if (!flag2 && !flag1)
        {
            resetLaunchDefaultsUi(textview, textview1);
        } else
        {
            boolean flag3;
            int i;
            CharSequence charsequence;
            if (flag1 && flag2)
                flag3 = true;
            else
                flag3 = false;
            if (flag1)
                textview.setText(0x7f0b0638);
            else
                textview.setText(0x7f0b0637);
            i = getResources().getDimensionPixelSize(0x7f0d000b);
            charsequence = null;
            if (flag2)
            {
                CharSequence charsequence2 = getText(0x7f0b064c);
                SpannableString spannablestring1 = new SpannableString(charsequence2);
                if (flag3)
                {
                    BulletSpan bulletspan1 = new BulletSpan(i);
                    spannablestring1.setSpan(bulletspan1, 0, charsequence2.length(), 0);
                }
                CharSequence charsequence1;
                BulletSpan bulletspan;
                if (true)
                    charsequence = TextUtils.concat(new CharSequence[] {
                        spannablestring1, "\n"
                    });
                else
                    charsequence = TextUtils.concat(new CharSequence[] {
                        null, "\n", spannablestring1, "\n"
                    });
            }
            if (flag1)
            {
                charsequence1 = getText(0x7f0b064d);
                SpannableString spannablestring = new SpannableString(charsequence1);
                if (flag3)
                {
                    bulletspan = new BulletSpan(i);
                    spannablestring.setSpan(bulletspan, 0, charsequence1.length(), 0);
                }
                if (charsequence == null)
                    charsequence = TextUtils.concat(new CharSequence[] {
                        spannablestring, "\n"
                    });
                else
                    charsequence = TextUtils.concat(new CharSequence[] {
                        charsequence, "\n", spannablestring, "\n"
                    });
            }
            textview1.setText(charsequence);
            mActivitiesButton.setEnabled(true);
            mActivitiesButton.setOnClickListener(this);
        }
        mIntent = mPm.getLaunchIntentForPackage(s);
        if (mIntent != null)
        {
            mIntent.addFlags(0x10000000);
            mIntent.addFlags(0x200000);
            mIntent.setPackage(null);
            mLaunchButton.setEnabled(true);
            mLaunchButton.setOnClickListener(this);
        } else
        {
            mLaunchButton.setEnabled(false);
        }
        ((ActivityManager)getActivity().getSystemService("activity")).getPackageScreenCompatMode(s);
        mScreenCompatSection.setVisibility(8);
        linearlayout = (LinearLayout)mRootView.findViewById(0x7f0800ab);
        appsecuritypermissions = new AppSecurityPermissions(getActivity(), s);
        j = getPremiumSmsPermission(s);
        if (appsecuritypermissions.getPermissionCount() > 0 || j != 0)
            linearlayout.setVisibility(0);
        else
            linearlayout.setVisibility(8);
        textview2 = (TextView)linearlayout.findViewById(0x7f0800ac);
        linearlayout1 = (LinearLayout)linearlayout.findViewById(0x7f0800ad);
        if (j != 0)
        {
            textview2.setVisibility(0);
            linearlayout1.setVisibility(0);
            Spinner spinner = (Spinner)linearlayout.findViewById(0x7f0800ae);
            ArrayAdapter arrayadapter = ArrayAdapter.createFromResource(getActivity(), 0x7f070046, 0x1090008);
            arrayadapter.setDropDownViewResource(0x1090009);
            spinner.setAdapter(arrayadapter);
            spinner.setSelection(j - 1);
            PremiumSmsSelectionListener premiumsmsselectionlistener = new PremiumSmsSelectionListener(s, mSmsManager);
            spinner.setOnItemSelectedListener(premiumsmsselectionlistener);
        } else
        {
            textview2.setVisibility(8);
            linearlayout1.setVisibility(8);
        }
        if (appsecuritypermissions.getPermissionCount() > 0)
        {
            LinearLayout linearlayout2 = (LinearLayout)linearlayout.findViewById(0x7f0800b0);
            linearlayout2.removeAllViews();
            linearlayout2.addView(appsecuritypermissions.getPermissionsView());
            String as[] = mPm.getPackagesForUid(mPackageInfo.applicationInfo.uid);
            if (as != null && as.length > 1)
            {
                arraylist2 = new ArrayList();
                int l = 0;
                do
                {
                    int i1 = as.length;
                    if (l >= i1)
                        break;
                    String s3 = as[l];
                    RemoteException remoteexception;
                    if (!mPackageInfo.packageName.equals(s3))
                        try
                        {
                            arraylist2.add(mPm.getApplicationInfo(s3, 0).loadLabel(mPm));
                        }
                        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception1) { }
                    l++;
                } while (true);
                break MISSING_BLOCK_LABEL_959;
            }
        }
          goto _L1
        remoteexception;
        Log.e("InstalledAppDetails", "mUsbManager.hasDefaults", remoteexception);
        flag = false;
          goto _L2
        int j1 = arraylist2.size();
        if (j1 <= 0) goto _L1; else goto _L3
_L3:
        Resources resources = getActivity().getResources();
        String s2;
        TextView textview3;
        Object aobj1[];
        if (j1 == 1)
            s2 = ((CharSequence)arraylist2.get(0)).toString();
        else
        if (j1 == 2)
        {
            Object aobj3[] = new Object[2];
            aobj3[0] = arraylist2.get(0);
            aobj3[1] = arraylist2.get(1);
            s2 = resources.getString(0x7f0b0676, aobj3);
        } else
        {
            String s1 = ((CharSequence)arraylist2.get(j1 - 2)).toString();
            int k1 = j1 - 3;
            while (k1 >= 0) 
            {
                int l1;
                Object aobj2[];
                if (k1 == 0)
                    l1 = 0x7f0b0678;
                else
                    l1 = 0x7f0b0679;
                aobj2 = new Object[2];
                aobj2[0] = arraylist2.get(k1);
                aobj2[1] = s1;
                s1 = resources.getString(l1, aobj2);
                k1--;
            }
            Object aobj[] = new Object[2];
            aobj[0] = s1;
            aobj[1] = arraylist2.get(j1 - 1);
            s2 = resources.getString(0x7f0b0677, aobj);
        }
_L9:
        textview3 = (TextView)mRootView.findViewById(0x7f0800af);
        aobj1 = new Object[2];
        aobj1[0] = mPackageInfo.applicationInfo.loadLabel(mPm);
        aobj1[1] = s2;
        textview3.setText(resources.getString(0x7f0b0675, aobj1));
_L1:
        checkForceStop();
        setAppLabelAndIcon(mPackageInfo);
        refreshButtons();
        refreshSizeInfo();
        if (mInitialized) goto _L5; else goto _L4
_L4:
        mInitialized = true;
        boolean flag4;
        if ((0x800000 & mAppEntry.info.flags) == 0)
            flag4 = true;
        else
            flag4 = false;
        mShowUninstalled = flag4;
_L7:
        return true;
_L5:
        ApplicationInfo applicationinfo = getActivity().getPackageManager().getApplicationInfo(((PackageItemInfo) (mAppEntry.info)).packageName, 8704);
        if (mShowUninstalled) goto _L7; else goto _L6
_L6:
        int k = applicationinfo.flags;
        return (k & 0x800000) != 0;
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        return false;
        if (true) goto _L9; else goto _L8
_L8:
    }

    private void resetLaunchDefaultsUi(TextView textview, TextView textview1)
    {
        textview.setText(0x7f0b0637);
        textview1.setText(0x7f0b064e);
        mActivitiesButton.setEnabled(false);
    }

    private String retrieveAppEntry()
    {
        Bundle bundle = getArguments();
        String s;
        if (bundle != null)
            s = bundle.getString("package");
        else
            s = null;
        if (s == null)
        {
            Intent intent;
            if (bundle == null)
                intent = getActivity().getIntent();
            else
                intent = (Intent)bundle.getParcelable("intent");
            if (intent != null)
            {
                if (intent.getData() == null)
                {
                    Log.v("InstalledAppDetails", "intent.getData() == null");
                    return null;
                }
                s = intent.getData().getSchemeSpecificPart();
            }
        }
        mAppEntry = mState.getEntry(s);
        if (mAppEntry != null)
        {
            try
            {
                mPackageInfo = mPm.getPackageInfo(((PackageItemInfo) (mAppEntry.info)).packageName, 8768);
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
            {
                Log.e("InstalledAppDetails", (new StringBuilder()).append("Exception when retrieving package:").append(((PackageItemInfo) (mAppEntry.info)).packageName).toString(), namenotfoundexception);
            }
        } else
        {
            Log.w("InstalledAppDetails", "Missing AppEntry; maybe reinstalling?");
            mPackageInfo = null;
        }
        return s;
    }

    private void setAppLabelAndIcon(PackageInfo packageinfo)
    {
        View view = mRootView.findViewById(0x7f08008b);
        view.setPadding(0, view.getPaddingTop(), 0, view.getPaddingBottom());
        ImageView imageview = (ImageView)view.findViewById(0x7f080056);
        mState.ensureIcon(mAppEntry);
        imageview.setImageDrawable(mAppEntry.icon);
        ((TextView)view.findViewById(0x7f0800c8)).setText(mAppEntry.label);
        mAppVersion = (TextView)view.findViewById(0x7f0800ca);
        if (packageinfo != null && packageinfo.versionName != null)
        {
            mAppVersion.setVisibility(0);
            TextView textview = mAppVersion;
            Activity activity = getActivity();
            Object aobj[] = new Object[1];
            aobj[0] = String.valueOf(packageinfo.versionName);
            textview.setText(activity.getString(0x7f0b067f, aobj));
            return;
        } else
        {
            mAppVersion.setVisibility(4);
            return;
        }
    }

    private void setIntentAndFinish(boolean flag, boolean flag1)
    {
        Intent intent = new Intent();
        intent.putExtra("chg", flag1);
        ((PreferenceActivity)getActivity()).finishPreferencePanel(this, -1, intent);
    }

    private void setNotificationsEnabled(boolean flag)
    {
        String s = ((PackageItemInfo) (mAppEntry.info)).packageName;
        INotificationManager inotificationmanager = android.app.INotificationManager.Stub.asInterface(ServiceManager.getService("notification"));
        try
        {
            mNotificationSwitch.isChecked();
            inotificationmanager.setNotificationsEnabledForPackage(s, flag);
            return;
        }
        catch (RemoteException remoteexception)
        {
            CompoundButton compoundbutton = mNotificationSwitch;
            boolean flag1;
            if (!flag)
                flag1 = true;
            else
                flag1 = false;
            compoundbutton.setChecked(flag1);
            return;
        }
    }

    private void showDialogInner(int i, int j)
    {
        MyAlertDialogFragment myalertdialogfragment = MyAlertDialogFragment.newInstance(i, j);
        myalertdialogfragment.setTargetFragment(this, 0);
        myalertdialogfragment.show(getFragmentManager(), (new StringBuilder()).append("dialog ").append(i).toString());
    }

    private void uninstallPkg(String s, boolean flag, boolean flag1)
    {
        Intent intent = new Intent("android.intent.action.UNINSTALL_PACKAGE", Uri.parse((new StringBuilder()).append("package:").append(s).toString()));
        intent.putExtra("android.intent.extra.UNINSTALL_ALL_USERS", flag);
        startActivityForResult(intent, 1);
        mDisableAfterUninstall = flag1;
    }

    private void updateForceStopButton(boolean flag)
    {
        mForceStopButton.setEnabled(flag);
        mForceStopButton.setOnClickListener(this);
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
        super.onActivityResult(i, j, intent);
        if (i == 1)
        {
            if (mDisableAfterUninstall)
            {
                mDisableAfterUninstall = false;
                try
                {
                    if ((0x80 & getActivity().getPackageManager().getApplicationInfo(((PackageItemInfo) (mAppEntry.info)).packageName, 8704).flags) == 0)
                    {
                        DisableChanger disablechanger = new DisableChanger(this, mAppEntry.info, 3);
                        Object aobj[] = new Object[1];
                        aobj[0] = (Object)null;
                        disablechanger.execute(aobj);
                    }
                }
                catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception) { }
            }
            if (!refreshUi())
                setIntentAndFinish(true, true);
        }
    }

    public void onAllSizesComputed()
    {
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        boolean flag1 = true;
        String s = ((PackageItemInfo) (mAppEntry.info)).packageName;
        ActivityManager activitymanager = (ActivityManager)getActivity().getSystemService("activity");
        if (compoundbutton == mAskCompatibilityCB)
        {
            activitymanager.setPackageAskScreenCompat(s, flag);
        } else
        {
            if (compoundbutton == mEnableCompatibilityCB)
            {
                if (!flag)
                    flag1 = false;
                activitymanager.setPackageScreenCompatMode(s, flag1);
                return;
            }
            if (compoundbutton == mNotificationSwitch)
                if (!flag)
                {
                    showDialogInner(8, 0);
                    return;
                } else
                {
                    setNotificationsEnabled(flag1);
                    return;
                }
        }
    }

    public void onClick(View view)
    {
        byte byte0;
        String s;
        byte0 = 2;
        s = ((PackageItemInfo) (mAppEntry.info)).packageName;
        if (view != mUninstallButton) goto _L2; else goto _L1
_L1:
        Log.d("InstalledAppDetails", "click uninstall button");
        if (!mUpdatedSysApp) goto _L4; else goto _L3
_L3:
        showDialogInner(byte0, 0);
_L6:
        return;
_L4:
        if ((1 & mAppEntry.info.flags) != 0)
            if (mAppEntry.info.enabled)
            {
                showDialogInner(7, 0);
                return;
            } else
            {
                DisableChanger disablechanger = new DisableChanger(this, mAppEntry.info, 0);
                Object aobj[] = new Object[1];
                aobj[0] = (Object)null;
                disablechanger.execute(aobj);
                return;
            }
        if ((0x800000 & mAppEntry.info.flags) == 0)
        {
            uninstallPkg(s, true, false);
            return;
        } else
        {
            uninstallPkg(s, false, false);
            return;
        }
_L2:
        if (view == mSpecialDisableButton)
        {
            showDialogInner(9, 0);
            return;
        }
        if (view == mActivitiesButton)
        {
            Log.d("InstalledAppDetails", "click activiies button");
            mPm.clearPackagePreferredActivities(s);
            try
            {
                mUsbManager.clearDefaults(s, UserHandle.myUserId());
            }
            catch (RemoteException remoteexception)
            {
                Log.e("InstalledAppDetails", "mUsbManager.clearDefaults", remoteexception);
            }
            mAppWidgetManager.setBindAppWidgetPermission(s, false);
            resetLaunchDefaultsUi((TextView)mRootView.findViewById(0x7f0800a2), (TextView)mRootView.findViewById(0x7f0800a3));
            return;
        }
        if (view != mClearDataButton)
            break; /* Loop/switch isn't completed */
        Log.d("InstalledAppDetails", "click clear data button");
        if (mAppEntry.info.manageSpaceActivityName != null)
        {
            if (!Utils.isMonkeyRunning())
            {
                Intent intent = new Intent("android.intent.action.VIEW");
                intent.setClassName(((PackageItemInfo) (mAppEntry.info)).packageName, mAppEntry.info.manageSpaceActivityName);
                startActivityForResult(intent, byte0);
                return;
            }
        } else
        {
            showDialogInner(1, 0);
            return;
        }
        if (true) goto _L6; else goto _L5
_L5:
        if (view == mClearCacheButton)
        {
            Log.d("InstalledAppDetails", "click clear cache button");
            if (mClearCacheObserver == null)
                mClearCacheObserver = new ClearCacheObserver();
            mPm.deleteApplicationCacheFiles(s, mClearCacheObserver);
            return;
        }
        if (view == mForceStopButton)
        {
            Log.d("InstalledAppDetails", "click force stop button");
            showDialogInner(5, 0);
            return;
        }
        if (view == mMoveAppButton)
        {
            if (mPackageMoveObserver == null)
                mPackageMoveObserver = new PackageMoveObserver();
            if ((0x40000 & mAppEntry.info.flags) != 0)
                byte0 = 1;
            Log.d("InstalledAppDetails", (new StringBuilder()).append("click move app button , and the move flag is ").append(byte0).toString());
            mMoveInProgress = true;
            refreshButtons();
            mPm.movePackage(((PackageItemInfo) (mAppEntry.info)).packageName, mPackageMoveObserver, byte0);
            return;
        }
        if (view != mLaunchButton) goto _L6; else goto _L7
_L7:
        Log.d("InstalledAppDetails", "click launch button");
        if (mIntent == null) goto _L6; else goto _L8
_L8:
        startActivity(mIntent);
        return;
        ActivityNotFoundException activitynotfoundexception;
        activitynotfoundexception;
        Toast.makeText(getActivity(), 0x7f0b000d, 0).show();
        return;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mState = ApplicationsState.getInstance(getActivity().getApplication());
        mSession = mState.newSession(this);
        mPm = getActivity().getPackageManager();
        mUserManager = (UserManager)getActivity().getSystemService("user");
        mUsbManager = android.hardware.usb.IUsbManager.Stub.asInterface(ServiceManager.getService("usb"));
        mAppWidgetManager = AppWidgetManager.getInstance(getActivity());
        mDpm = (DevicePolicyManager)getActivity().getSystemService("device_policy");
        mSmsManager = com.android.internal.telephony.ISms.Stub.asInterface(ServiceManager.getService("isms"));
        mCanBeOnSdCardChecker = new CanBeOnSdCardChecker();
        mSession.resume();
        retrieveAppEntry();
        setHasOptionsMenu(true);
        mStorageManager = (StorageManager)getActivity().getSystemService("storage");
        mStorageManager.registerListener(mStorageListener);
        mExtStoragePath = Environment.getLegacyExternalStorageDirectory().getPath();
        mSDcardDescription = getSdDesc(mExtStoragePath);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        menu.add(0, 1, 1, 0x7f0b0646).setShowAsAction(0);
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        View view = layoutinflater.inflate(0x7f04003b, viewgroup, false);
        Utils.prepareCustomPreferencesList(viewgroup, view, view, false);
        mRootView = view;
        mComputingStr = getActivity().getText(0x7f0b067c);
        mTotalSize = (TextView)view.findViewById(0x7f080091);
        mAppSize = (TextView)view.findViewById(0x7f080093);
        mDataSize = (TextView)view.findViewById(0x7f080098);
        mExternalCodeSize = (TextView)view.findViewById(0x7f080095);
        mExternalDataSize = (TextView)view.findViewById(0x7f08009a);
        if (Environment.isExternalStorageEmulated())
        {
            ((View)mExternalCodeSize.getParent()).setVisibility(8);
            ((View)mExternalDataSize.getParent()).setVisibility(8);
        }
        mExternalCodeSizeLabel = (TextView)view.findViewById(0x7f080094);
        mExternalDataSizeLabel = (TextView)view.findViewById(0x7f080099);
        refreshSizeLabel(mSDcardDescription);
        View view1 = view.findViewById(0x7f08008c);
        mForceStopButton = (Button)view1.findViewById(0x7f080198);
        mForceStopButton.setText(0x7f0b063f);
        mUninstallButton = (Button)view1.findViewById(0x7f080199);
        mForceStopButton.setEnabled(false);
        mMoreControlButtons = view.findViewById(0x7f08008d);
        mMoreControlButtons.findViewById(0x7f080198).setVisibility(4);
        mSpecialDisableButton = (Button)mMoreControlButtons.findViewById(0x7f080199);
        mMoreControlButtons.setVisibility(8);
        mClearDataButton = (Button)view.findViewById(0x7f08009b);
        mMoveAppButton = (Button)view.findViewById(0x7f08009c);
        mCacheSize = (TextView)view.findViewById(0x7f0800a0);
        mClearCacheButton = (Button)view.findViewById(0x7f0800a1);
        mActivitiesButton = (Button)view.findViewById(0x7f0800a4);
        mScreenCompatSection = view.findViewById(0x7f0800a8);
        mAskCompatibilityCB = (CheckBox)view.findViewById(0x7f0800a9);
        mEnableCompatibilityCB = (CheckBox)view.findViewById(0x7f0800aa);
        mNotificationSwitch = (CompoundButton)view.findViewById(0x7f08008e);
        mLaunchButton = (Button)view.findViewById(0x7f0800a7);
        View view2 = view.findViewById(0x7f0800a5);
        View view3 = view.findViewById(0x7f0800a6);
        mLaunchButton.setVisibility(0);
        view2.setVisibility(0);
        view3.setVisibility(0);
        return view;
    }

    public void onDestroy()
    {
        super.onDestroy();
        if (mStorageManager != null && mStorageListener != null)
            mStorageManager.unregisterListener(mStorageListener);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        if (menuitem.getItemId() == 1)
        {
            uninstallPkg(((PackageItemInfo) (mAppEntry.info)).packageName, true, false);
            return true;
        } else
        {
            return false;
        }
    }

    public void onPackageIconChanged()
    {
    }

    public void onPackageListChanged()
    {
        mSession.resume();
        if (!refreshUi())
            setIntentAndFinish(true, true);
    }

    public void onPackageSizeChanged(String s)
    {
        if (s.equals(((PackageItemInfo) (mAppEntry.info)).packageName))
            refreshSizeInfo();
    }

    public void onPause()
    {
        super.onPause();
        mSession.pause();
    }

    public void onPrepareOptionsMenu(Menu menu)
    {
        boolean flag = true;
        if (mUpdatedSysApp)
            flag = false;
        else
        if (mAppEntry == null)
            flag = false;
        else
        if ((1 & mAppEntry.info.flags) != 0)
            flag = false;
        else
        if (mPackageInfo != null && !mDpm.packageHasActiveAdmins(mPackageInfo.packageName))
        {
            if (UserHandle.myUserId() != 0)
                flag = false;
            else
            if (mUserManager.getUsers().size() < 2)
                flag = false;
        } else
        {
            flag = false;
        }
        menu.findItem(1).setVisible(flag);
    }

    public void onRebuildComplete(ArrayList arraylist)
    {
    }

    public void onResume()
    {
        super.onResume();
        mSession.resume();
        if (!refreshUi())
            setIntentAndFinish(true, true);
    }

    public void onRunningStateChanged(boolean flag)
    {
    }

















}
