// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic;

import android.app.*;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.*;
import android.telephony.TelephonyManager;
import android.view.IWindowManager;
import com.android.internal.telephony.PhoneConstants;
import com.mediatek.oobe.WizardActivity;
import com.mediatek.oobe.qsg.QuickStartGuideMain;
import com.mediatek.oobe.utils.Utils;
import com.mediatek.xlog.Xlog;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class MainActivity extends Activity
{
    private class OOBEStepActivityInfo
    {

        private String mActionName;
        private int mActivityId;
        private String mActivityInfo;
        private Intent mIntent;
        final MainActivity this$0;

        public String getActionName()
        {
            return mActionName;
        }

        public int getId()
        {
            return mActivityId;
        }

        public Intent getIntent()
        {
            return mIntent;
        }

        public void parseActivityInfo(String s)
        {
            String as[] = s.split("/");
            if (!as[0].isEmpty())
                mActivityId = Integer.parseInt(as[0]);
            if (!as[1].isEmpty())
                mActionName = as[1];
            mIntent.setAction(mActionName);
        }

        public void startStepActivity()
        {
            Xlog.i("OOBE", (new StringBuilder()).append("OOBEStepActivityInfo.execute(), mActivityId=").append(mActivityId).toString());
            startNextActivity(mIntent, mActivityId);
        }

        public OOBEStepActivityInfo(String s)
        {
            this$0 = MainActivity.this;
            super();
            mActivityId = -1;
            mActivityInfo = s;
            mIntent = new Intent();
            parseActivityInfo(mActivityInfo);
        }
    }


    private static final int BOOT_MODE_ADV_META = 5;
    private static final String BOOT_MODE_INFO_FILE = "/sys/class/BOOT/BOOT/boot/boot_mode";
    private static final int BOOT_MODE_META = 1;
    private static final int BOOT_MODE_NORMAL = 0;
    private static final int BOOT_MODE_STR_LEN = 1;
    private static final int DIALOG_WAITING_SIM = 3001;
    private static final int EVENT_MONITOR_SIM_TIME_OUT = 2001;
    private static final int EVENT_SIM_DETECTING_READY = 2002;
    private static final int QUICK_START_GUIDE_CODE = 4001;
    private static final int REQUEST_CODE_ADVANCED_SETTINGS = 1001;
    private static final String TAG = "OOBE";
    private static final int TIME_MONITOR_SIM = 30000;
    private static String sDeviceInfo;
    private static boolean sIsRunning = false;
    private static boolean sIsTablet = false;
    private int mBootMode;
    private int mCurrentStep;
    private long mEndTime;
    private List mExecutingActivityList;
    private Handler mHandler;
    private boolean mIsFirstRun;
    private boolean mIsGoToNextStep;
    private boolean mIsStepInitiated;
    private int mProgressbarMaxSize;
    private IntentFilter mSIMIntentFilter;
    BroadcastReceiver mSIMStateReceiver;
    private boolean mSimExist;
    private long mStartTime;
    private boolean mStatusBarDisabled;
    private String mStepActivities[] = {
        "1/com.mediatek.oobe.basic.OOBE_LANGUAGE_SETTING", "2/com.mediatek.oobe.basic.DATE_TIME_SETTINGS_WIZARD", "3/com.mediatek.oobe.basic.SIM_MANAGEMENT_SETTINGS_WIZARD", "4/com.mediatek.oobe.basic.DEFAULT_SIM_SETTINGS_WIZARD", "5/com.mediatek.oobe.basic.OOBE_IMPORT_CONTACTS", "6/com.mediatek.oobe.basic.OOBE_INTERNET_CONNECTION", "7/com.mediatek.oobe.basic.WIFI_SETTINGS_WIZARD"
    };
    private TelephonyManager mTelephonyManager;

    public MainActivity()
    {
        mIsStepInitiated = false;
        mStatusBarDisabled = false;
        mBootMode = 0;
        mProgressbarMaxSize = 0;
        mCurrentStep = -1;
        mSimExist = false;
        mIsGoToNextStep = true;
        mHandler = new Handler() {

            final MainActivity this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 2002: 
                    Xlog.v("OOBE", "MainActivity handler SIM initialization finish");
                    mHandler.removeMessages(2001);
                    break;

                case 2001: 
                    Xlog.v("OOBE", "MainActivity handler wait SIM time out");
                    break;

                default:
                    Xlog.v("OOBE", "MainActivity handler unknown message");
                    break;
                }
                Xlog.d("OOBE", (new StringBuilder()).append("sIsRunning=").append(MainActivity.sIsRunning).append(";mIsStepInitiated=").append(mIsStepInitiated).toString());
                if (!MainActivity.sIsRunning)
                {
                    initStep();
                    removeDialog(3001);
                }
            }

            
            {
                this$0 = MainActivity.this;
                super();
            }
        }
;
        mSIMStateReceiver = new BroadcastReceiver() {

            private boolean mSlotChecked[] = {
                0, 0, 0, 0
            };
            final MainActivity this$0;

            public void onReceive(Context context, Intent intent)
            {
label0:
                {
                    String s = intent.getAction();
                    Xlog.d("hotswapdbg", (new StringBuilder()).append("MainActivity ").append(s.toString()).toString());
                    if (s != null && s.equals("android.intent.action.SIM_STATE_CHANGED"))
                    {
                        String s1 = intent.getStringExtra("ss");
                        int i = intent.getIntExtra("simId", -1);
                        Xlog.i("OOBE", (new StringBuilder()).append("MainActivity(), monitor SIM state change, new state=").append(s1).append("SIM slotId=").append(i).toString());
                        if (!s1.equals("ABSENT") && !s1.equals("NOT_READY"))
                        {
                            mSlotChecked[i] = true;
                            mSimExist = true;
                            mEndTime = System.currentTimeMillis();
                            Xlog.i("OOBE", (new StringBuilder()).append("detecting SIM card using time ").append((mEndTime - mStartTime) / 1000L).append("s.").toString());
                            mHandler.sendEmptyMessage(2002);
                        } else
                        if (s1.equals("ABSENT"))
                        {
                            mSlotChecked[i] = true;
                            if (PhoneConstants.GEMINI_SIM_NUM < 2)
                                break label0;
                            boolean flag = true;
                            for (int j = 0; j < PhoneConstants.GEMINI_SIM_NUM; j++)
                                if (flag && mSlotChecked[j])
                                    flag = true;
                                else
                                    flag = false;

                            if (flag)
                            {
                                Xlog.i("OOBE", "gemini: checked slots done ");
                                mSimExist = false;
                                mHandler.sendEmptyMessage(2002);
                                return;
                            }
                        }
                    }
                    return;
                }
                Xlog.i("OOBE", " signal card: checked slots done ");
                mSimExist = false;
                mHandler.sendEmptyMessage(2002);
            }

            
            {
                this$0 = MainActivity.this;
                super();
            }
        }
;
    }

    private void disableStatusBar(boolean flag)
    {
        Xlog.i("OOBE", (new StringBuilder()).append("disable status bar ").append(flag).toString());
        StatusBarManager statusbarmanager = (StatusBarManager)getSystemService("statusbar");
        if (statusbarmanager != null)
        {
            mStatusBarDisabled = flag;
            int i;
            if (flag)
                i = 0x10000;
            else
                i = 0;
            statusbarmanager.disable(i);
            return;
        } else
        {
            Xlog.d("OOBE", "Fail to get status bar instance");
            return;
        }
    }

    private void finishOOBE()
    {
        int i = android.provider.Settings.System.getInt(getContentResolver(), "oobe_has_run", 0);
        PackageManager packagemanager = getPackageManager();
        ComponentName componentname = new ComponentName(this, com/mediatek/oobe/WizardActivity);
        int j = packagemanager.getComponentEnabledSetting(componentname);
        Xlog.i("OOBE", (new StringBuilder()).append("Finish settigns, if OOBE has been configured once, disable it. oobeHasRun=").append(i).append("wizardDisabledState=").append(j).toString());
        if (i == 0 || j != 2)
        {
            Xlog.i("OOBE", "Here we go, MainActivity.finishOOBE(), set oobe_has_run flag to 1 , start launcher now");
            android.provider.Settings.System.putInt(getContentResolver(), "oobe_has_run", 1);
            if (!sIsTablet)
            {
                Intent intent = new Intent("com.mediatek.oobe.QUICK_START_GUIDE");
                intent.setFlags(0x10000000);
                intent.setFlags(0x800000);
                intent.putExtra("mIsFirstRun", true);
                startActivity(intent);
            } else
            if (mIsFirstRun)
            {
                android.provider.Settings.System.putInt(getContentResolver(), "oobe_display", 0);
                android.provider.Settings.Global.putInt(getContentResolver(), "device_provisioned", 1);
            }
            Xlog.i("OOBE", "Try to disable WizardActivity, MainActivity.finishOOBE() is expected");
            packagemanager.setComponentEnabledSetting(componentname, 2, 1);
            if (mStatusBarDisabled)
                disableStatusBar(false);
        }
        Xlog.d("OOBE", "finishOOBE MainActivity finished");
        setRunning(false);
        mCurrentStep = -1;
        finish();
    }

    private int getBootMode()
    {
        int i;
        FileReader filereader;
        BufferedReader bufferedreader;
        i = -1;
        filereader = null;
        bufferedreader = null;
        FileReader filereader1 = new FileReader("/sys/class/BOOT/BOOT/boot/boot_mode");
        BufferedReader bufferedreader1 = new BufferedReader(filereader1);
        String s = bufferedreader1.readLine();
        if (s == null)
            break MISSING_BLOCK_LABEL_50;
        int j = Integer.parseInt(s);
        i = j;
        if (bufferedreader1 != null)
            try
            {
                bufferedreader1.close();
            }
            catch (IOException ioexception10)
            {
                Xlog.d("OOBE", "br file close error; /sys/class/BOOT/BOOT/boot/boot_mode");
            }
        if (filereader1 != null)
            try
            {
                filereader1.close();
            }
            catch (IOException ioexception9)
            {
                Xlog.d("OOBE", "fr file close error; /sys/class/BOOT/BOOT/boot/boot_mode");
            }
_L1:
        Xlog.d("OOBE", (new StringBuilder()).append("read mode;").append(i).toString());
        return i;
        FileNotFoundException filenotfoundexception2;
        filenotfoundexception2;
_L6:
        Xlog.d("OOBE", "file not found; /sys/class/BOOT/BOOT/boot/boot_mode");
        if (bufferedreader != null)
            try
            {
                bufferedreader.close();
            }
            catch (IOException ioexception3)
            {
                Xlog.d("OOBE", "br file close error; /sys/class/BOOT/BOOT/boot/boot_mode");
            }
        if (filereader != null)
            try
            {
                filereader.close();
            }
            catch (IOException ioexception2)
            {
                Xlog.d("OOBE", "fr file close error; /sys/class/BOOT/BOOT/boot/boot_mode");
            }
          goto _L1
        IOException ioexception4;
        ioexception4;
_L5:
        Xlog.d("OOBE", (new StringBuilder()).append("read file error; ").append(ioexception4).toString());
        if (bufferedreader != null)
            try
            {
                bufferedreader.close();
            }
            catch (IOException ioexception6)
            {
                Xlog.d("OOBE", "br file close error; /sys/class/BOOT/BOOT/boot/boot_mode");
            }
        if (filereader != null)
            try
            {
                filereader.close();
            }
            catch (IOException ioexception5)
            {
                Xlog.d("OOBE", "fr file close error; /sys/class/BOOT/BOOT/boot/boot_mode");
            }
          goto _L1
        NumberFormatException numberformatexception;
        numberformatexception;
_L4:
        Xlog.d("OOBE", (new StringBuilder()).append("NumberFormatException e =").append(numberformatexception).toString());
        if (bufferedreader != null)
            try
            {
                bufferedreader.close();
            }
            catch (IOException ioexception8)
            {
                Xlog.d("OOBE", "br file close error; /sys/class/BOOT/BOOT/boot/boot_mode");
            }
        if (filereader != null)
            try
            {
                filereader.close();
            }
            catch (IOException ioexception7)
            {
                Xlog.d("OOBE", "fr file close error; /sys/class/BOOT/BOOT/boot/boot_mode");
            }
          goto _L1
        Exception exception;
        exception;
_L3:
        if (bufferedreader != null)
            try
            {
                bufferedreader.close();
            }
            catch (IOException ioexception1)
            {
                Xlog.d("OOBE", "br file close error; /sys/class/BOOT/BOOT/boot/boot_mode");
            }
        if (filereader != null)
            try
            {
                filereader.close();
            }
            catch (IOException ioexception)
            {
                Xlog.d("OOBE", "fr file close error; /sys/class/BOOT/BOOT/boot/boot_mode");
            }
        throw exception;
        exception;
        filereader = filereader1;
        bufferedreader = null;
        continue; /* Loop/switch isn't completed */
        exception;
        bufferedreader = bufferedreader1;
        filereader = filereader1;
        if (true) goto _L3; else goto _L2
_L2:
        numberformatexception;
        filereader = filereader1;
        bufferedreader = null;
          goto _L4
        numberformatexception;
        bufferedreader = bufferedreader1;
        filereader = filereader1;
          goto _L4
        ioexception4;
        filereader = filereader1;
        bufferedreader = null;
          goto _L5
        ioexception4;
        bufferedreader = bufferedreader1;
        filereader = filereader1;
          goto _L5
        FileNotFoundException filenotfoundexception1;
        filenotfoundexception1;
        filereader = filereader1;
        bufferedreader = null;
          goto _L6
        FileNotFoundException filenotfoundexception;
        filenotfoundexception;
        bufferedreader = bufferedreader1;
        filereader = filereader1;
          goto _L6
    }

    private void initStep()
    {
        if (mIsStepInitiated)
        {
            Xlog.v("OOBE", "MainActivity have already init step list");
        } else
        {
            mIsStepInitiated = true;
            setActivityList();
            Xlog.i("OOBE", (new StringBuilder()).append("initStep sIsRunning?").append(sIsRunning).toString());
            if (!sIsRunning)
            {
                setRunning(true);
                if (mCurrentStep == -1)
                {
                    nextActivity(true);
                    return;
                }
            }
        }
    }

    private boolean isSimExist()
    {
label0:
        {
            boolean flag4;
label1:
            {
                Xlog.d("OOBE", "MainActivity isSimExist() function");
                mTelephonyManager = (TelephonyManager)getSystemService("phone");
                if (Utils.isGemini())
                {
                    Xlog.d("OOBE", "MainActivity isGemini true");
                    boolean flag8 = mTelephonyManager.hasIccCardGemini(0);
                    boolean flag9 = mTelephonyManager.hasIccCardGemini(1);
                    boolean flag10;
                    if (!flag8 && !flag9)
                        flag10 = false;
                    else
                        flag10 = true;
                    flag4 = flag10;
                    break label1;
                }
                if (PhoneConstants.GEMINI_SIM_NUM == 3)
                {
                    Xlog.d("OOBE", "MainActivity isSimExist, 3 cards");
                    boolean flag5 = mTelephonyManager.hasIccCardGemini(0);
                    boolean flag6 = mTelephonyManager.hasIccCardGemini(1);
                    boolean flag7 = mTelephonyManager.hasIccCardGemini(2);
                    if (!flag5 && !flag6)
                    {
                        flag4 = false;
                        if (!flag7)
                            break label1;
                    }
                    return true;
                }
                if (PhoneConstants.GEMINI_SIM_NUM != 4)
                    break label0;
                Xlog.d("OOBE", "MainActivity isSimExist, 4 cards");
                boolean flag = mTelephonyManager.hasIccCardGemini(0);
                boolean flag1 = mTelephonyManager.hasIccCardGemini(1);
                boolean flag2 = mTelephonyManager.hasIccCardGemini(2);
                boolean flag3 = mTelephonyManager.hasIccCardGemini(3);
                if (!flag && !flag1 && !flag2)
                {
                    flag4 = false;
                    if (!flag3)
                        break label1;
                }
                return true;
            }
            return flag4;
        }
        Xlog.d("OOBE", "MainActivity isGemini false");
        return mTelephonyManager.hasIccCard();
    }

    private boolean isTablet()
    {
        sDeviceInfo = SystemProperties.get("ro.build.characteristics");
        Xlog.d("OOBE", sDeviceInfo);
        if (sDeviceInfo.equals("tablet"))
            sIsTablet = true;
        return sIsTablet;
    }

    public static void setRunning(boolean flag)
    {
        sIsRunning = flag;
    }

    private void startAdvancedSettings()
    {
        Xlog.d("OOBE", "startAdvancedSettings()");
        startActivityForResult(new Intent("com.mediatek.oobe.advanced.AdvanceSettings"), 1001);
        overridePendingTransition(0x7f040002, 0x7f040001);
    }

    protected void nextActivity(boolean flag)
    {
        Xlog.i("OOBE", (new StringBuilder()).append("MainActivity.nextActivity(), next = ").append(flag).append(", mCurrentStep = ").append(mCurrentStep).append("mProgressbarMaxSize =").append(mProgressbarMaxSize).toString());
        mIsGoToNextStep = flag;
        if (flag)
            mCurrentStep = 1 + mCurrentStep;
        else
            mCurrentStep = -1 + mCurrentStep;
        if (mCurrentStep >= mProgressbarMaxSize)
        {
            Xlog.d("OOBE", "start advance activity");
            startAdvancedSettings();
        } else
        {
            Xlog.d("OOBE", (new StringBuilder()).append("MainActivity.nextActivity(), mCurrentStep = ").append(mCurrentStep).append(", mExecutingActivityList size = ").append(mExecutingActivityList.size()).toString());
            if (mCurrentStep >= 0 && mCurrentStep < mExecutingActivityList.size())
            {
                Xlog.i("OOBE", (new StringBuilder()).append("MainActivity.nextActivity(), step index = ").append(mCurrentStep).toString());
                ((OOBEStepActivityInfo)mExecutingActivityList.get(mCurrentStep)).startStepActivity();
                return;
            }
        }
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
label0:
        {
            Xlog.d("OOBE", (new StringBuilder()).append("onActivityResult: requestCode = ").append(i).append(", resultCode = ").append(j).toString());
            if (mCurrentStep == -1 && i == 1)
            {
                mCurrentStep = 0;
                Xlog.d("OOBE", "onActivityResult: mCurrentStep is -1, set to 0");
                if (!sIsRunning)
                    initStep();
                if (mProgressbarMaxSize == 0)
                    break label0;
            }
            if (mCurrentStep == 0 && 21 == j)
            {
                Xlog.d("OOBE", "Finished by first activity");
                finishOOBE();
                return;
            }
            if (21 == j)
            {
                nextActivity(false);
                return;
            }
            if (20 == j)
            {
                nextActivity(true);
                return;
            }
            if (22 == j)
            {
                Xlog.d("OOBE", (new StringBuilder()).append("MainActivity onActivityResult, cur step=").append(mCurrentStep).append(", total step=").append(mProgressbarMaxSize).toString());
                finishOOBE();
                return;
            }
        }
    }

    public void onCreate(Bundle bundle)
    {
        Xlog.i("OOBE", "onCreate OOBE 2.0");
        super.onCreate(bundle);
        mStartTime = System.currentTimeMillis();
        mSimExist = isSimExist();
        Xlog.d("OOBE", (new StringBuilder()).append("MainActivity onCreate mSimExist=").append(mSimExist).toString());
        if (bundle != null)
        {
            mCurrentStep = bundle.getInt("currentStep");
            mProgressbarMaxSize = bundle.getInt("totalSteps");
            Xlog.d("OOBE", (new StringBuilder()).append("restore saved instance state mCurrentStep=").append(mCurrentStep).append("mProgressbarMaxSize=").append(mProgressbarMaxSize).toString());
            setActivityList();
        }
        isTablet();
        boolean flag;
        PackageManager packagemanager;
        ComponentName componentname;
        int j;
        if (!sIsTablet)
        {
            Xlog.i("OOBE", "It's phone anyway");
            int i;
            try
            {
                android.view.IWindowManager.Stub.asInterface(ServiceManager.getService("window")).freezeRotation(0);
                Xlog.i("OOBE", "Can't be rotated");
            }
            catch (RemoteException remoteexception)
            {
                Xlog.i("OOBE", "Still enable to rotate the orientation");
            }
        }
        i = android.provider.Settings.System.getInt(getContentResolver(), "oobe_has_run", 0);
        if (i == 0)
            flag = true;
        else
            flag = false;
        mIsFirstRun = flag;
        if (mIsFirstRun)
        {
            android.provider.Settings.System.putInt(getContentResolver(), "oobe_display", 1);
            android.provider.Settings.Global.putInt(getContentResolver(), "device_provisioned", 0);
        }
        if (i == 0)
            disableStatusBar(true);
        packagemanager = getPackageManager();
        componentname = new ComponentName(this, com/mediatek/oobe/qsg/QuickStartGuideMain);
        j = packagemanager.getComponentEnabledSetting(componentname);
        Xlog.d("OOBE", (new StringBuilder()).append("disable QSG on tablet qsgDisabledState").append(j).toString());
        if (sIsTablet)
        {
            if (j != 2)
            {
                Xlog.d("OOBE", "tablet disable qsg");
                packagemanager.setComponentEnabledSetting(componentname, 2, 1);
            }
        } else
        if (j == 2)
        {
            Xlog.d("OOBE", "phone enable qsg");
            packagemanager.setComponentEnabledSetting(componentname, 0, 1);
        }
        mSIMIntentFilter = new IntentFilter("android.intent.action.SIM_STATE_CHANGED");
        mSIMIntentFilter.addAction("android.intent.action.PHB_STATE_CHANGED");
        mBootMode = getBootMode();
        if (!mSimExist && mIsFirstRun && mBootMode != 5 && !Utils.isWifiOnly(this))
        {
            mHandler.sendEmptyMessageDelayed(2001, 30000L);
            showDialog(3001);
        } else
        {
            mHandler.sendEmptyMessage(2002);
        }
        registerReceiver(mSIMStateReceiver, mSIMIntentFilter);
    }

    protected Dialog onCreateDialog(int i)
    {
        if (i == 3001)
        {
            ProgressDialog progressdialog = new ProgressDialog(this);
            progressdialog.setMessage(getResources().getString(0x7f090062));
            progressdialog.setCancelable(false);
            progressdialog.setIndeterminate(true);
            return progressdialog;
        } else
        {
            return null;
        }
    }

    protected void onDestroy()
    {
        Xlog.i("OOBE", "MainActivity.onDestroy()");
        unregisterReceiver(mSIMStateReceiver);
        if (!mSimExist && mIsFirstRun && mBootMode != 5)
        {
            mHandler.removeMessages(2001);
            removeDialog(3001);
        }
        mIsStepInitiated = false;
        setRunning(false);
        if (mStatusBarDisabled)
            disableStatusBar(false);
        if (!sIsTablet)
        {
            Xlog.i("OOBE", "It's phone anyway, prepare to get out of this");
            try
            {
                android.view.IWindowManager.Stub.asInterface(ServiceManager.getService("window")).thawRotation();
                Xlog.i("OOBE", "Can be rotated again");
            }
            catch (RemoteException remoteexception)
            {
                Xlog.i("OOBE", "Still enable to rotate the orientation");
            }
        }
        super.onDestroy();
    }

    public void onPause()
    {
        super.onPause();
    }

    public void onResume()
    {
        super.onResume();
        Xlog.d("OOBE", (new StringBuilder()).append(" onResume() mIsStepInitiated=").append(mIsStepInitiated).toString());
        Xlog.d("OOBE", (new StringBuilder()).append(" onResume() sIsRunning=").append(sIsRunning).toString());
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        bundle.putInt("currentStep", mCurrentStep);
        Xlog.d("OOBE", (new StringBuilder()).append("mCurrentStep = ").append(mCurrentStep).toString());
        bundle.putInt("totalSteps", mProgressbarMaxSize);
    }

    protected void setActivityList()
    {
        Xlog.d("OOBE", "setActivityList()");
        mExecutingActivityList = new ArrayList();
        mProgressbarMaxSize = 0;
        for (int i = 0; i < mStepActivities.length; i++)
        {
            Xlog.i("OOBE", mStepActivities[i]);
            if (mStepActivities[i].contains("com.mediatek.oobe.basic.SIM_MANAGEMENT_SETTINGS_WIZARD") || mStepActivities[i].contains("com.mediatek.oobe.basic.DEFAULT_SIM_SETTINGS_WIZARD") ? mSimExist && PhoneConstants.GEMINI_SIM_NUM != 1 : mStepActivities[i].contains("com.mediatek.oobe.basic.OOBE_IMPORT_CONTACTS") ? mSimExist : !mStepActivities[i].contains("com.mediatek.oobe.basic.OOBE_INTERNET_CONNECTION") || PhoneConstants.GEMINI_SIM_NUM <= 1 && !Utils.isWifiOnly(this))
            {
                OOBEStepActivityInfo oobestepactivityinfo = new OOBEStepActivityInfo(mStepActivities[i]);
                mExecutingActivityList.add(oobestepactivityinfo);
                mProgressbarMaxSize = 1 + mProgressbarMaxSize;
            }
        }

    }

    public void startNextActivity(Intent intent, int i)
    {
        Xlog.d("OOBE", (new StringBuilder()).append("MainActivity.startNextActivity(), startActivityForResult nRequestCode == ").append(i).append(", mCurrentStep == ").append(mCurrentStep).toString());
        if (i == -1)
        {
            Xlog.w("OOBE", "should not come here, request code == -1, finish it now");
            finish();
            setRunning(false);
            mCurrentStep = -1;
            return;
        }
        Xlog.i("OOBE", (new StringBuilder()).append("MainActivity.startNextActivity(), action=").append(intent.getAction()).append(", ").append("total_step=").append(mProgressbarMaxSize).append(", current_step=").append(1 + mCurrentStep).toString());
        intent.putExtra("oobe_step_total", mProgressbarMaxSize);
        intent.putExtra("oobe_step_index", 1 + mCurrentStep);
        super.startActivityForResult(intent, i);
        if (mIsGoToNextStep)
        {
            overridePendingTransition(0x7f040002, 0x7f040001);
            return;
        } else
        {
            overridePendingTransition(0x7f040000, 0x7f040003);
            return;
        }
    }







/*
    static boolean access$402(MainActivity mainactivity, boolean flag)
    {
        mainactivity.mSimExist = flag;
        return flag;
    }

*/



/*
    static long access$502(MainActivity mainactivity, long l)
    {
        mainactivity.mEndTime = l;
        return l;
    }

*/

}
