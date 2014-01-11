// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.applications;

import android.app.*;
import android.content.*;
import android.content.pm.*;
import android.content.res.Resources;
import android.os.*;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.settings.Utils;
import java.io.*;
import java.util.ArrayList;
import java.util.Collections;

// Referenced classes of package com.android.settings.applications:
//            RunningState

public class RunningServiceDetails extends Fragment
    implements RunningState.OnRefreshUiListener
{
    class ActiveDetail
        implements android.view.View.OnClickListener
    {

        RunningProcessesView.ActiveItem mActiveItem;
        View mCategory;
        ComponentName mInstaller;
        Intent mIntent;
        View mLaunch;
        Button mLaunchButton;
        PendingIntent mManageIntent;
        Button mReportButton;
        View mRootView;
        RunningState.ServiceItem mServiceItem;
        Button mStopButton;
        RunningProcessesView.ViewHolder mViewHolder;
        final RunningServiceDetails this$0;

        public void onClick(View view)
        {
            if (view == mLaunchButton)
            {
                try
                {
                    if (mIntent != null)
                    {
                        mIntent.addFlags(0x10000000);
                        mIntent.addFlags(0x200000);
                        mIntent.setPackage(null);
                        startActivity(mIntent);
                    }
                    return;
                }
                catch (ActivityNotFoundException activitynotfoundexception1)
                {
                    Toast.makeText(getActivity(), 0x7f0b000d, 0).show();
                }
                return;
            }
            if (view != mReportButton) goto _L2; else goto _L1
_L1:
            ComponentName componentname;
            FileOutputStream fileoutputstream;
            FileOutputStream fileoutputstream1;
            FileInputStream fileinputstream;
            FileInputStream fileinputstream1;
            ApplicationErrorReport applicationerrorreport = new ApplicationErrorReport();
            applicationerrorreport.type = 5;
            applicationerrorreport.packageName = ((PackageItemInfo) (mServiceItem.mServiceInfo)).packageName;
            applicationerrorreport.installerPackageName = mInstaller.getPackageName();
            applicationerrorreport.processName = mServiceItem.mRunningService.process;
            applicationerrorreport.time = System.currentTimeMillis();
            boolean flag;
            android.app.ApplicationErrorReport.RunningServiceInfo runningserviceinfo;
            File file;
            Intent intent;
            byte abyte0[];
            java.io.FileDescriptor filedescriptor;
            String as[];
            if ((1 & mServiceItem.mServiceInfo.applicationInfo.flags) != 0)
                flag = true;
            else
                flag = false;
            applicationerrorreport.systemApp = flag;
            runningserviceinfo = new android.app.ApplicationErrorReport.RunningServiceInfo();
            if (mActiveItem.mFirstRunTime >= 0L)
                runningserviceinfo.durationMillis = SystemClock.elapsedRealtime() - mActiveItem.mFirstRunTime;
            else
                runningserviceinfo.durationMillis = -1L;
            componentname = new ComponentName(((PackageItemInfo) (mServiceItem.mServiceInfo)).packageName, mServiceItem.mServiceInfo.name);
            file = getActivity().getFileStreamPath("service_dump.txt");
            fileoutputstream = null;
            fileoutputstream1 = new FileOutputStream(file);
            filedescriptor = fileoutputstream1.getFD();
            as = new String[3];
            as[0] = "-a";
            as[1] = "service";
            as[2] = componentname.flattenToString();
            Debug.dumpService("activity", filedescriptor, as);
            if (fileoutputstream1 != null)
                try
                {
                    fileoutputstream1.close();
                }
                catch (IOException ioexception7) { }
_L3:
            fileinputstream = null;
            fileinputstream1 = new FileInputStream(file);
            abyte0 = new byte[(int)file.length()];
            fileinputstream1.read(abyte0);
            runningserviceinfo.serviceDetails = new String(abyte0);
            IOException ioexception;
            Exception exception;
            if (fileinputstream1 != null)
                try
                {
                    fileinputstream1.close();
                }
                catch (IOException ioexception6) { }
_L4:
            file.delete();
            Log.i("RunningServicesDetails", (new StringBuilder()).append("Details: ").append(runningserviceinfo.serviceDetails).toString());
            applicationerrorreport.runningServiceInfo = runningserviceinfo;
            intent = new Intent("android.intent.action.APP_ERROR");
            intent.setComponent(mInstaller);
            intent.putExtra("android.intent.extra.BUG_REPORT", applicationerrorreport);
            intent.addFlags(0x10000000);
            startActivity(intent);
            return;
            ioexception;
_L9:
            Log.w("RunningServicesDetails", (new StringBuilder()).append("Can't dump service: ").append(componentname).toString(), ioexception);
            if (fileoutputstream != null)
                try
                {
                    fileoutputstream.close();
                }
                catch (IOException ioexception2) { }
              goto _L3
            exception;
_L8:
            IOException ioexception3;
            Exception exception1;
            IOException ioexception5;
            ActivityNotFoundException activitynotfoundexception;
            IllegalArgumentException illegalargumentexception;
            android.content.IntentSender.SendIntentException sendintentexception;
            if (fileoutputstream != null)
                try
                {
                    fileoutputstream.close();
                }
                catch (IOException ioexception1) { }
            throw exception;
            ioexception3;
_L7:
            Log.w("RunningServicesDetails", (new StringBuilder()).append("Can't read service dump: ").append(componentname).toString(), ioexception3);
            if (fileinputstream != null)
                try
                {
                    fileinputstream.close();
                }
                // Misplaced declaration of an exception variable
                catch (IOException ioexception5) { }
              goto _L4
            exception1;
_L6:
            if (fileinputstream != null)
                try
                {
                    fileinputstream.close();
                }
                catch (IOException ioexception4) { }
            throw exception1;
_L2:
            if (mManageIntent != null)
            {
                try
                {
                    getActivity().startIntentSender(mManageIntent.getIntentSender(), null, 0x10080000, 0x80000, 0);
                    return;
                }
                // Misplaced declaration of an exception variable
                catch (android.content.IntentSender.SendIntentException sendintentexception)
                {
                    Log.w("RunningServicesDetails", sendintentexception);
                    return;
                }
                // Misplaced declaration of an exception variable
                catch (IllegalArgumentException illegalargumentexception)
                {
                    Log.w("RunningServicesDetails", illegalargumentexception);
                    return;
                }
                // Misplaced declaration of an exception variable
                catch (ActivityNotFoundException activitynotfoundexception)
                {
                    Log.w("RunningServicesDetails", activitynotfoundexception);
                }
                return;
            }
            if (mServiceItem != null)
            {
                stopActiveService(false);
                return;
            }
            if (mActiveItem.mItem.mBackground)
            {
                mAm.killBackgroundProcesses(mActiveItem.mItem.mPackageInfo.packageName);
                finish();
                return;
            } else
            {
                mAm.forceStopPackage(mActiveItem.mItem.mPackageInfo.packageName);
                finish();
                return;
            }
            exception1;
            fileinputstream = fileinputstream1;
            if (true) goto _L6; else goto _L5
_L5:
            ioexception3;
            fileinputstream = fileinputstream1;
              goto _L7
            exception;
            fileoutputstream = fileoutputstream1;
              goto _L8
            ioexception;
            fileoutputstream = fileoutputstream1;
              goto _L9
        }

        void stopActiveService(boolean flag)
        {
            RunningState.ServiceItem serviceitem = mServiceItem;
            if (!flag && (1 & serviceitem.mServiceInfo.applicationInfo.flags) != 0)
            {
                showConfirmStopDialog(serviceitem.mRunningService.service);
                return;
            }
            getActivity().stopService((new Intent()).setComponent(serviceitem.mRunningService.service));
            if (mMergedItem == null)
            {
                mState.updateNow();
                finish();
                return;
            }
            if (!mShowBackground && mMergedItem.mServices.size() <= 1)
            {
                mState.updateNow();
                finish();
                return;
            } else
            {
                mState.updateNow();
                return;
            }
        }

        ActiveDetail()
        {
            this$0 = RunningServiceDetails.this;
            super();
        }
    }

    public static class MyAlertDialogFragment extends DialogFragment
    {

        public static MyAlertDialogFragment newConfirmStop(int i, ComponentName componentname)
        {
            MyAlertDialogFragment myalertdialogfragment = new MyAlertDialogFragment();
            Bundle bundle = new Bundle();
            bundle.putInt("id", i);
            bundle.putParcelable("comp", componentname);
            myalertdialogfragment.setArguments(bundle);
            return myalertdialogfragment;
        }

        RunningServiceDetails getOwner()
        {
            return (RunningServiceDetails)getTargetFragment();
        }

        public Dialog onCreateDialog(Bundle bundle)
        {
            int i = getArguments().getInt("id");
            switch (i)
            {
            case 1: // '\001'
                ComponentName componentname = (ComponentName)getArguments().getParcelable("comp");
                if (getOwner().activeDetailForService(componentname) == null)
                    return null;
                else
                    return (new android.app.AlertDialog.Builder(getActivity())).setTitle(getActivity().getString(0x7f0b06b5)).setIconAttribute(0x1010355).setMessage(getActivity().getString(0x7f0b06b6)).setPositiveButton(0x7f0b066b, componentname. new android.content.DialogInterface.OnClickListener() {

                        final MyAlertDialogFragment this$0;
                        final ComponentName val$comp;

                        public void onClick(DialogInterface dialoginterface, int i)
                        {
                            ActiveDetail activedetail = getOwner().activeDetailForService(comp);
                            if (activedetail != null)
                                activedetail.stopActiveService(true);
                        }

            
            {
                this$0 = final_myalertdialogfragment;
                comp = ComponentName.this;
                super();
            }
                    }
).setNegativeButton(0x7f0b066c, null).create();
            }
            throw new IllegalArgumentException((new StringBuilder()).append("unknown id ").append(i).toString());
        }

    }


    static final int DIALOG_CONFIRM_STOP = 1;
    static final String KEY_BACKGROUND = "background";
    static final String KEY_PROCESS = "process";
    static final String KEY_UID = "uid";
    static final String KEY_USER_ID = "user_id";
    static final String TAG = "RunningServicesDetails";
    final ArrayList mActiveDetails = new ArrayList();
    ViewGroup mAllDetails;
    ActivityManager mAm;
    StringBuilder mBuilder;
    boolean mHaveData;
    LayoutInflater mInflater;
    RunningState.MergedItem mMergedItem;
    int mNumProcesses;
    int mNumServices;
    String mProcessName;
    TextView mProcessesHeader;
    View mRootView;
    TextView mServicesHeader;
    boolean mShowBackground;
    ViewGroup mSnippet;
    RunningProcessesView.ActiveItem mSnippetActiveItem;
    RunningProcessesView.ViewHolder mSnippetViewHolder;
    RunningState mState;
    int mUid;
    int mUserId;

    public RunningServiceDetails()
    {
        mBuilder = new StringBuilder(128);
    }

    private void finish()
    {
        (new Handler()).post(new Runnable() {

            final RunningServiceDetails this$0;

            public void run()
            {
                Activity activity = getActivity();
                if (activity != null)
                    activity.onBackPressed();
            }

            
            {
                this$0 = RunningServiceDetails.this;
                super();
            }
        }
);
    }

    private void showConfirmStopDialog(ComponentName componentname)
    {
        MyAlertDialogFragment myalertdialogfragment = MyAlertDialogFragment.newConfirmStop(1, componentname);
        myalertdialogfragment.setTargetFragment(this, 0);
        myalertdialogfragment.show(getFragmentManager(), "confirmstop");
    }

    ActiveDetail activeDetailForService(ComponentName componentname)
    {
        for (int i = 0; i < mActiveDetails.size(); i++)
        {
            ActiveDetail activedetail = (ActiveDetail)mActiveDetails.get(i);
            if (activedetail.mServiceItem != null && activedetail.mServiceItem.mRunningService != null && componentname.equals(activedetail.mServiceItem.mRunningService.service))
                return activedetail;
        }

        return null;
    }

    void addDetailViews()
    {
        for (int i = -1 + mActiveDetails.size(); i >= 0; i--)
            mAllDetails.removeView(((ActiveDetail)mActiveDetails.get(i)).mRootView);

        mActiveDetails.clear();
        if (mServicesHeader != null)
        {
            mAllDetails.removeView(mServicesHeader);
            mServicesHeader = null;
        }
        if (mProcessesHeader != null)
        {
            mAllDetails.removeView(mProcessesHeader);
            mProcessesHeader = null;
        }
        mNumProcesses = 0;
        mNumServices = 0;
        if (mMergedItem != null)
            if (mMergedItem.mUser != null)
            {
                ArrayList arraylist;
                if (mShowBackground)
                {
                    arraylist = new ArrayList(mMergedItem.mChildren);
                    Collections.sort(arraylist, mState.mBackgroundComparator);
                } else
                {
                    arraylist = mMergedItem.mChildren;
                }
                for (int j = 0; j < arraylist.size(); j++)
                    addDetailsViews((RunningState.MergedItem)arraylist.get(j), true, false);

                for (int k = 0; k < arraylist.size(); k++)
                    addDetailsViews((RunningState.MergedItem)arraylist.get(k), false, true);

            } else
            {
                addDetailsViews(mMergedItem, true, true);
            }
    }

    void addDetailsViews(RunningState.MergedItem mergeditem, boolean flag, boolean flag1)
    {
        if (mergeditem != null)
        {
            if (flag)
            {
                for (int j = 0; j < mergeditem.mServices.size(); j++)
                    addServiceDetailsView((RunningState.ServiceItem)mergeditem.mServices.get(j), mergeditem, true, true);

            }
            if (flag1)
                if (mergeditem.mServices.size() <= 0)
                {
                    boolean flag3;
                    if (((RunningState.BaseItem) (mergeditem)).mUserId != UserHandle.myUserId())
                        flag3 = true;
                    else
                        flag3 = false;
                    addServiceDetailsView(null, mergeditem, false, flag3);
                } else
                {
                    for (int i = -1; i < mergeditem.mOtherProcesses.size(); i++)
                    {
                        RunningState.ProcessItem processitem;
                        if (i < 0)
                            processitem = mergeditem.mProcess;
                        else
                            processitem = (RunningState.ProcessItem)mergeditem.mOtherProcesses.get(i);
                        if (processitem != null && processitem.mPid <= 0)
                            continue;
                        boolean flag2;
                        if (i < 0)
                            flag2 = true;
                        else
                            flag2 = false;
                        addProcessDetailsView(processitem, flag2);
                    }

                }
        }
    }

    void addProcessDetailsView(RunningState.ProcessItem processitem, boolean flag)
    {
        TextView textview;
        addProcessesHeader();
        ActiveDetail activedetail = new ActiveDetail();
        View view = mInflater.inflate(0x7f040084, mAllDetails, false);
        mAllDetails.addView(view);
        activedetail.mRootView = view;
        activedetail.mViewHolder = new RunningProcessesView.ViewHolder(view);
        activedetail.mActiveItem = activedetail.mViewHolder.bind(mState, processitem, mBuilder);
        activedetail.mLaunchButton = (Button)view.findViewById(0x7f0800a7);
        activedetail.mCategory = view.findViewById(0x7f0800a5);
        activedetail.mLaunch = view.findViewById(0x7f0800a6);
        activedetail.mLaunchButton.setVisibility(0);
        activedetail.mCategory.setVisibility(0);
        activedetail.mLaunch.setVisibility(0);
        activedetail.mLaunchButton.setOnClickListener(activedetail);
        activedetail.mIntent = getActivity().getPackageManager().getLaunchIntentForPackage(activedetail.mActiveItem.mItem.mPackageInfo.packageName);
        Button button = activedetail.mLaunchButton;
        boolean flag1;
        if (activedetail.mIntent != null)
            flag1 = true;
        else
            flag1 = false;
        button.setEnabled(flag1);
        textview = (TextView)view.findViewById(0x7f080163);
        if (((RunningState.BaseItem) (processitem)).mUserId != UserHandle.myUserId())
        {
            textview.setVisibility(8);
        } else
        {
label0:
            {
                if (!flag)
                    break label0;
                textview.setText(0x7f0b06b2);
            }
        }
_L4:
        mActiveDetails.add(activedetail);
        return;
        android.app.ActivityManager.RunningAppProcessInfo runningappprocessinfo;
        int i;
        Object obj;
        int j;
        runningappprocessinfo = processitem.mRunningProcessInfo;
        runningappprocessinfo.importanceReasonComponent;
        i = runningappprocessinfo.importanceReasonCode;
        obj = null;
        j = 0;
        i;
        JVM INSTR tableswitch 1 2: default 308
    //                   1 344
    //                   2 408;
           goto _L1 _L2 _L3
_L1:
        if (j != 0 && obj != null)
            textview.setText(getActivity().getString(j, new Object[] {
                obj
            }));
          goto _L4
_L2:
        ComponentName componentname1;
        j = 0x7f0b06b4;
        componentname1 = runningappprocessinfo.importanceReasonComponent;
        obj = null;
        if (componentname1 == null) goto _L1; else goto _L5
_L5:
        CharSequence charsequence1;
        ProviderInfo providerinfo = getActivity().getPackageManager().getProviderInfo(runningappprocessinfo.importanceReasonComponent, 0);
        charsequence1 = RunningState.makeLabel(getActivity().getPackageManager(), providerinfo.name, providerinfo);
        obj = charsequence1;
          goto _L1
_L3:
        ComponentName componentname;
        j = 0x7f0b06b3;
        componentname = runningappprocessinfo.importanceReasonComponent;
        obj = null;
        if (componentname == null) goto _L1; else goto _L6
_L6:
        CharSequence charsequence;
        ServiceInfo serviceinfo = getActivity().getPackageManager().getServiceInfo(runningappprocessinfo.importanceReasonComponent, 0);
        charsequence = RunningState.makeLabel(getActivity().getPackageManager(), serviceinfo.name, serviceinfo);
        obj = charsequence;
          goto _L1
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        obj = null;
          goto _L1
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception1;
        namenotfoundexception1;
        obj = null;
          goto _L1
    }

    void addProcessesHeader()
    {
        if (mNumProcesses == 0)
        {
            mProcessesHeader = (TextView)mInflater.inflate(0x7f040086, mAllDetails, false);
            mProcessesHeader.setText(0x7f0b06ab);
            mAllDetails.addView(mProcessesHeader);
        }
        mNumProcesses = 1 + mNumProcesses;
    }

    void addServiceDetailsView(RunningState.ServiceItem serviceitem, RunningState.MergedItem mergeditem, boolean flag, boolean flag1)
    {
        Object obj;
        ActiveDetail activedetail;
        View view;
        TextView textview;
        Button button;
        Activity activity1;
        int j;
        if (flag)
            addServicesHeader();
        else
        if (((RunningState.BaseItem) (mergeditem)).mUserId != UserHandle.myUserId())
            addProcessesHeader();
        if (serviceitem != null)
            obj = serviceitem;
        else
            obj = mergeditem;
        activedetail = new ActiveDetail();
        view = mInflater.inflate(0x7f040085, mAllDetails, false);
        mAllDetails.addView(view);
        activedetail.mRootView = view;
        activedetail.mServiceItem = serviceitem;
        activedetail.mViewHolder = new RunningProcessesView.ViewHolder(view);
        activedetail.mActiveItem = activedetail.mViewHolder.bind(mState, ((RunningState.BaseItem) (obj)), mBuilder);
        if (!flag1)
            view.findViewById(0x7f080162).setVisibility(8);
        if (serviceitem != null && serviceitem.mRunningService.clientLabel != 0)
            activedetail.mManageIntent = mAm.getRunningServiceControlPanel(serviceitem.mRunningService.service);
        textview = (TextView)view.findViewById(0x7f080163);
        if (serviceitem != null && serviceitem.mServiceInfo.descriptionRes != 0)
            textview.setText(getActivity().getPackageManager().getText(((PackageItemInfo) (serviceitem.mServiceInfo)).packageName, serviceitem.mServiceInfo.descriptionRes, serviceitem.mServiceInfo.applicationInfo));
        else
        if (((RunningState.BaseItem) (mergeditem)).mBackground)
            textview.setText(0x7f0b06b0);
        else
        if (activedetail.mManageIntent != null)
        {
            try
            {
                String s1 = getActivity().getPackageManager().getResourcesForApplication(serviceitem.mRunningService.clientPackage).getString(serviceitem.mRunningService.clientLabel);
                textview.setText(getActivity().getString(0x7f0b06b1, new Object[] {
                    s1
                }));
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception1) { }
        } else
        {
            Activity activity = getActivity();
            int i;
            if (serviceitem != null)
                i = 0x7f0b06ae;
            else
                i = 0x7f0b06af;
            textview.setText(activity.getText(i));
        }
        activedetail.mStopButton = (Button)view.findViewById(0x7f080198);
        activedetail.mStopButton.setOnClickListener(activedetail);
        button = activedetail.mStopButton;
        activity1 = getActivity();
        if (activedetail.mManageIntent != null)
            j = 0x7f0b06ad;
        else
            j = 0x7f0b06ac;
        button.setText(activity1.getText(j));
        activedetail.mReportButton = (Button)view.findViewById(0x7f080199);
        if (flag && ((RunningState.BaseItem) (mergeditem)).mUserId != UserHandle.myUserId())
        {
            textview.setVisibility(8);
            view.findViewById(0x7f08008c).setVisibility(8);
        } else
        {
            Button button1;
            Activity activity3;
            int l;
            if (serviceitem != null && serviceitem.mServiceInfo.descriptionRes != 0)
                textview.setText(getActivity().getPackageManager().getText(((PackageItemInfo) (serviceitem.mServiceInfo)).packageName, serviceitem.mServiceInfo.descriptionRes, serviceitem.mServiceInfo.applicationInfo));
            else
            if (((RunningState.BaseItem) (mergeditem)).mBackground)
                textview.setText(0x7f0b06b0);
            else
            if (activedetail.mManageIntent != null)
            {
                try
                {
                    String s = getActivity().getPackageManager().getResourcesForApplication(serviceitem.mRunningService.clientPackage).getString(serviceitem.mRunningService.clientLabel);
                    textview.setText(getActivity().getString(0x7f0b06b1, new Object[] {
                        s
                    }));
                }
                catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception) { }
            } else
            {
                Activity activity2 = getActivity();
                int k;
                if (serviceitem != null)
                    k = 0x7f0b06ae;
                else
                    k = 0x7f0b06af;
                textview.setText(activity2.getText(k));
            }
            activedetail.mStopButton.setOnClickListener(activedetail);
            button1 = activedetail.mStopButton;
            activity3 = getActivity();
            if (activedetail.mManageIntent != null)
                l = 0x7f0b06ad;
            else
                l = 0x7f0b06ac;
            button1.setText(activity3.getText(l));
            activedetail.mReportButton.setOnClickListener(activedetail);
            activedetail.mReportButton.setText(0x10403dc);
            if (android.provider.Settings.Global.getInt(getActivity().getContentResolver(), "send_action_app_error", 0) != 0 && serviceitem != null)
            {
                activedetail.mInstaller = ApplicationErrorReport.getErrorReportReceiver(getActivity(), ((PackageItemInfo) (serviceitem.mServiceInfo)).packageName, serviceitem.mServiceInfo.applicationInfo.flags);
                Button button2 = activedetail.mReportButton;
                boolean flag2;
                if (activedetail.mInstaller != null)
                    flag2 = true;
                else
                    flag2 = false;
                button2.setEnabled(flag2);
            } else
            {
                activedetail.mReportButton.setEnabled(false);
            }
        }
        mActiveDetails.add(activedetail);
    }

    void addServicesHeader()
    {
        if (mNumServices == 0)
        {
            mServicesHeader = (TextView)mInflater.inflate(0x7f040086, mAllDetails, false);
            mServicesHeader.setText(0x7f0b06aa);
            mAllDetails.addView(mServicesHeader);
        }
        mNumServices = 1 + mNumServices;
    }

    void ensureData()
    {
        if (!mHaveData)
        {
            mHaveData = true;
            mState.resume(this);
            mState.waitForData();
            refreshUi(true);
        }
    }

    boolean findMergedItem()
    {
        ArrayList arraylist;
        RunningState.MergedItem mergeditem;
        if (mShowBackground)
            arraylist = mState.getCurrentBackgroundItems();
        else
            arraylist = mState.getCurrentMergedItems();
        mergeditem = null;
        if (arraylist == null) goto _L2; else goto _L1
_L1:
        int i = 0;
_L7:
        int j;
        j = arraylist.size();
        mergeditem = null;
        if (i >= j) goto _L2; else goto _L3
_L3:
        RunningState.MergedItem mergeditem1 = (RunningState.MergedItem)arraylist.get(i);
        if (((RunningState.BaseItem) (mergeditem1)).mUserId != mUserId || mUid >= 0 && mergeditem1.mProcess != null && mergeditem1.mProcess.mUid != mUid || mProcessName != null && (mergeditem1.mProcess == null || !mProcessName.equals(mergeditem1.mProcess.mProcessName))) goto _L5; else goto _L4
_L4:
        mergeditem = mergeditem1;
_L2:
        if (mMergedItem != mergeditem)
        {
            mMergedItem = mergeditem;
            return true;
        } else
        {
            return false;
        }
_L5:
        i++;
        if (true) goto _L7; else goto _L6
_L6:
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mUid = getArguments().getInt("uid", -1);
        mUserId = getArguments().getInt("user_id", 0);
        mProcessName = getArguments().getString("process", null);
        mShowBackground = getArguments().getBoolean("background", false);
        mAm = (ActivityManager)getActivity().getSystemService("activity");
        mInflater = (LayoutInflater)getActivity().getSystemService("layout_inflater");
        mState = RunningState.getInstance(getActivity());
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        View view = layoutinflater.inflate(0x7f040083, viewgroup, false);
        Utils.prepareCustomPreferencesList(viewgroup, view, view, false);
        mRootView = view;
        mAllDetails = (ViewGroup)view.findViewById(0x7f08008a);
        mSnippet = (ViewGroup)view.findViewById(0x7f080161);
        mSnippetViewHolder = new RunningProcessesView.ViewHolder(mSnippet);
        ensureData();
        return view;
    }

    public void onPause()
    {
        super.onPause();
        mHaveData = false;
        mState.pause();
    }

    public void onRefreshUi(int i)
    {
        if (getActivity() == null)
            return;
        switch (i)
        {
        case 2: // '\002'
            refreshUi(true);
            updateTimes();
            return;

        case 1: // '\001'
            refreshUi(false);
            updateTimes();
            return;

        case 0: // '\0'
            updateTimes();
            return;
        }
    }

    public void onResume()
    {
        super.onResume();
        ensureData();
    }

    void refreshUi(boolean flag)
    {
label0:
        {
            if (findMergedItem())
                flag = true;
            if (flag)
            {
                if (mMergedItem != null)
                {
                    mSnippetActiveItem = mSnippetViewHolder.bind(mState, mMergedItem, mBuilder);
                } else
                {
                    if (mSnippetActiveItem == null)
                        break label0;
                    mSnippetActiveItem.mHolder.size.setText("");
                    mSnippetActiveItem.mHolder.uptime.setText("");
                    mSnippetActiveItem.mHolder.description.setText(0x7f0b06a9);
                }
                addDetailViews();
            }
            return;
        }
        finish();
    }

    void updateTimes()
    {
        if (mSnippetActiveItem != null)
            mSnippetActiveItem.updateTime(getActivity(), mBuilder);
        for (int i = 0; i < mActiveDetails.size(); i++)
            ((ActiveDetail)mActiveDetails.get(i)).mActiveItem.updateTime(getActivity(), mBuilder);

    }


}
