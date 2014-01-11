// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.fuelgauge;

import android.app.Activity;
import android.content.*;
import android.content.pm.UserInfo;
import android.content.res.Resources;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.os.*;
import android.preference.*;
import android.text.TextUtils;
import android.util.Log;
import android.util.SparseArray;
import android.view.*;
import com.android.internal.app.IBatteryStats;
import com.android.internal.os.BatteryStatsImpl;
import com.android.internal.os.PowerProfile;
import com.android.settings.HelpUtils;
import com.android.settings.Utils;
import com.android.settings.users.UserUtils;
import java.io.*;
import java.util.*;

// Referenced classes of package com.android.settings.fuelgauge:
//            BatterySipper, BatteryHistoryPreference, PowerGaugePreference, BatteryHistoryDetail, 
//            PowerUsageDetail

public class PowerUsageSummary extends PreferenceFragment
    implements Runnable
{
    private class GetPowerSavingStatusTask extends AsyncTask
    {

        private static final int EXEC_COMMAND_FAIL = 1;
        private static final int EXEC_COMMAND_SUCCESS = 0;
        private static final String POWER_SAVING_MODE_FILE = "/etc/.tp/thermal.conf";
        int mResult;
        private String mResultString;
        final PowerUsageSummary this$0;

        protected transient Integer doInBackground(String as[])
        {
            BufferedReader bufferedreader;
            Log.d("PowerUsageSummary", "GetPowerSavingStatusTask doInBackground");
            bufferedreader = null;
            Process process;
            BufferedReader bufferedreader1;
            process = Runtime.getRuntime().exec(as[0]);
            bufferedreader1 = new BufferedReader(new InputStreamReader(process.getInputStream()));
            if (process.waitFor() == 0) goto _L2; else goto _L1
_L1:
            Log.d("PowerUsageSummary", (new StringBuilder()).append("exit value = ").append(process.exitValue()).toString());
            mResult = 1;
_L3:
            IOException ioexception;
            InterruptedException interruptedexception;
            if (bufferedreader1 != null)
                try
                {
                    bufferedreader1.close();
                }
                catch (IOException ioexception3)
                {
                    Log.w("PowerUsageSummary", (new StringBuilder()).append("close reader in finally block exception: ").append(ioexception3.getMessage()).toString());
                }
_L4:
            Log.d("PowerUsageSummary", (new StringBuilder()).append("result is ").append(mResultString).toString());
            return Integer.valueOf(mResult);
_L2:
            mResultString = bufferedreader1.readLine();
            mResult = 0;
              goto _L3
            interruptedexception;
            Log.i("PowerUsageSummary", (new StringBuilder()).append("exe shell command InterruptedException: ").append(interruptedexception.getMessage()).toString());
            mResult = 1;
              goto _L3
            ioexception;
            bufferedreader = bufferedreader1;
_L7:
            Log.i("PowerUsageSummary", (new StringBuilder()).append("exe shell command IOException: ").append(ioexception.getMessage()).toString());
            mResult = 1;
            if (bufferedreader != null)
                try
                {
                    bufferedreader.close();
                }
                catch (IOException ioexception2)
                {
                    Log.w("PowerUsageSummary", (new StringBuilder()).append("close reader in finally block exception: ").append(ioexception2.getMessage()).toString());
                }
              goto _L4
            Exception exception;
            exception;
_L6:
            if (bufferedreader != null)
                try
                {
                    bufferedreader.close();
                }
                catch (IOException ioexception1)
                {
                    Log.w("PowerUsageSummary", (new StringBuilder()).append("close reader in finally block exception: ").append(ioexception1.getMessage()).toString());
                }
            throw exception;
            exception;
            bufferedreader = bufferedreader1;
            if (true) goto _L6; else goto _L5
_L5:
            ioexception;
            bufferedreader = null;
              goto _L7
        }

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((String[])aobj);
        }

        protected void onPostExecute(Integer integer)
        {
label0:
            {
                if (integer.intValue() == 0)
                {
                    if (!"/etc/.tp/thermal.conf".equals(mResultString))
                        break label0;
                    mHandler.sendEmptyMessage(2);
                }
                return;
            }
            mHandler.sendEmptyMessage(3);
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((Integer)obj);
        }

        private GetPowerSavingStatusTask()
        {
            this$0 = PowerUsageSummary.this;
            super();
            mResult = 1;
        }
    }

    private class PowerSavingTASK extends AsyncTask
    {

        final PowerUsageSummary this$0;

        protected transient Integer doInBackground(String as[])
        {
            try
            {
                Log.d("PowerUsageSummary", "PowerSavingTASK doInBackground");
                int i = Runtime.getRuntime().exec(as[0]).waitFor();
                Log.d("PowerUsageSummary", (new StringBuilder()).append("PowerSavingTASK command result is ").append(i).toString());
            }
            catch (IOException ioexception)
            {
                Log.d("PowerUsageSummary", (new StringBuilder()).append("PowerSavingTASK IOException").append(ioexception).toString());
            }
            catch (InterruptedException interruptedexception)
            {
                Log.d("PowerUsageSummary", (new StringBuilder()).append("PowerSavingTASK InterruptedException").append(interruptedexception).toString());
            }
            return Integer.valueOf(0);
        }

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((String[])aobj);
        }

        private PowerSavingTASK()
        {
            this$0 = PowerUsageSummary.this;
            super();
        }

    }


    private static final String ACTION_BATTERY_PERCENTAGE_SWITCH = "mediatek.intent.action.BATTERY_PERCENTAGE_SWITCH";
    private static final String CAT_POWER_SAVING_STATUS_COMMAND = "cat /data/.tp.settings";
    private static final boolean DEBUG = false;
    private static final String DISABLE_POWER_SAVING_COMMAND = "/system/bin/thermal_manager /etc/.tp/thermal.off.conf";
    private static final String ENABLE_POWER_SAVING_COMMAND = "/system/bin/thermal_manager /etc/.tp/thermal.conf";
    private static final int H_CHECK_POWER_SAVING_MESSAGE = 2;
    private static final int H_UNCHECK_POWER_SAVING_MESSAGE = 3;
    private static final String KEY_APP_LIST = "app_list";
    private static final String KEY_BATTERY_STATUS = "battery_status";
    private static final String KEY_CPU_DTM = "cpu_dtm";
    private static final int MAX_ITEMS_TO_LIST = 10;
    private static final int MENU_HELP = 3;
    private static final int MENU_STATS_REFRESH = 2;
    private static final int MENU_STATS_TYPE = 1;
    private static final int MIN_POWER_THRESHOLD = 5;
    static final int MSG_UPDATE_NAME_ICON = 1;
    private static final String TAG = "PowerUsageSummary";
    private static BatteryStatsImpl sStatsXfer;
    private boolean mAbort;
    private PreferenceGroup mAppListGroup;
    private long mAppWifiRunning;
    IBatteryStats mBatteryInfo;
    private BroadcastReceiver mBatteryInfoReceiver;
    private Preference mBatteryStatusPref;
    private double mBluetoothPower;
    private final List mBluetoothSippers = new ArrayList();
    Handler mHandler;
    private double mMaxPower;
    private PowerProfile mPowerProfile;
    private ArrayList mRequestQueue;
    private Thread mRequestThread;
    BatteryStatsImpl mStats;
    private long mStatsPeriod;
    private int mStatsType;
    private double mTotalPower;
    UserManager mUm;
    private final List mUsageList = new ArrayList();
    private final SparseArray mUserPower = new SparseArray();
    private final SparseArray mUserSippers = new SparseArray();
    private double mWifiPower;
    private final List mWifiSippers = new ArrayList();

    public PowerUsageSummary()
    {
        mStatsType = 0;
        mStatsPeriod = 0L;
        mMaxPower = 1.0D;
        mRequestQueue = new ArrayList();
        mBatteryInfoReceiver = new BroadcastReceiver() {

            final PowerUsageSummary this$0;

            public void onReceive(Context context, Intent intent)
            {
                if ("android.intent.action.BATTERY_CHANGED".equals(intent.getAction()))
                {
                    Log.i("PowerUsageSummary", "ACTION_BATTERY_CHANGED");
                    String s = Utils.getBatteryPercentage(intent);
                    String s1 = Utils.getBatteryStatus(getResources(), intent);
                    String s2 = context.getResources().getString(0x7f0b0750, new Object[] {
                        s, s1
                    });
                    mBatteryStatusPref.setTitle(s2);
                }
            }

            
            {
                this$0 = PowerUsageSummary.this;
                super();
            }
        }
;
        mHandler = new Handler() {

            final PowerUsageSummary this$0;

            public void handleMessage(Message message)
            {
                Log.d("PowerUsageSummary", (new StringBuilder()).append("handle message ").append(message.what).toString());
                switch (message.what)
                {
                default:
                    break;

                case 3: // '\003'
                    ((CheckBoxPreference)findPreference("cpu_dtm")).setChecked(false);
                    break;

                case 2: // '\002'
                    ((CheckBoxPreference)findPreference("cpu_dtm")).setChecked(true);
                    break;

                case 1: // '\001'
                    BatterySipper batterysipper = (BatterySipper)message.obj;
                    PowerGaugePreference powergaugepreference = (PowerGaugePreference)findPreference(Integer.toString(batterysipper.uidObj.getUid()));
                    if (powergaugepreference != null)
                    {
                        powergaugepreference.setIcon(batterysipper.icon);
                        powergaugepreference.setTitle(batterysipper.name);
                    }
                    break;
                }
                super.handleMessage(message);
            }

            
            {
                this$0 = PowerUsageSummary.this;
                super();
            }
        }
;
    }

    private void addBluetoothUsage(long l)
    {
        long l1 = mStats.getBluetoothOnTime(l, mStatsType) / 1000L;
        double d = ((double)l1 * mPowerProfile.getAveragePower("bluetooth.on")) / 1000D + ((double)mStats.getBluetoothPingCount() * mPowerProfile.getAveragePower("bluetooth.at")) / 1000D;
        aggregateSippers(addEntry(getActivity().getString(0x7f0b0767), PowerUsageDetail.DrainType.BLUETOOTH, l1, 0x7f02007b, d + mBluetoothPower), mBluetoothSippers, "Bluetooth");
    }

    private BatterySipper addEntry(String s, PowerUsageDetail.DrainType draintype, long l, int i, double d)
    {
        if (d > mMaxPower)
            mMaxPower = d;
        mTotalPower = d + mTotalPower;
        BatterySipper batterysipper = new BatterySipper(getActivity(), mRequestQueue, mHandler, s, draintype, i, null, new double[] {
            d
        });
        batterysipper.usageTime = l;
        batterysipper.iconId = i;
        mUsageList.add(batterysipper);
        return batterysipper;
    }

    private void addIdleUsage(long l)
    {
        long l1 = (l - mStats.getScreenOnTime(l, mStatsType)) / 1000L;
        double d = ((double)l1 * mPowerProfile.getAveragePower("cpu.idle")) / 1000D;
        addEntry(getActivity().getString(0x7f0b076a), PowerUsageDetail.DrainType.IDLE, l1, 0x7f02008a, d);
    }

    private void addNotAvailableMessage()
    {
        Preference preference = new Preference(getActivity());
        preference.setTitle(0x7f0b074f);
        mAppListGroup.addPreference(preference);
    }

    private void addPhoneUsage(long l)
    {
        long l1 = mStats.getPhoneOnTime(l, mStatsType) / 1000L;
        double d = (mPowerProfile.getAveragePower("radio.active") * (double)l1) / 1000D;
        addEntry(getActivity().getString(0x7f0b0769), PowerUsageDetail.DrainType.PHONE, l1, 0x7f020093, d);
    }

    private void addRadioUsage(long l)
    {
        double d = 0.0D;
        long l1 = 0L;
        for (int i = 0; i < 6; i++)
        {
            long l2 = mStats.getPhoneSignalStrengthTime(i, l, mStatsType) / 1000L;
            d += (double)(l2 / 1000L) * mPowerProfile.getAveragePower("radio.on", i);
            l1 += l2;
        }

        double d1 = d + (double)(mStats.getPhoneSignalScanningTime(l, mStatsType) / 1000L / 1000L) * mPowerProfile.getAveragePower("radio.scanning");
        BatterySipper batterysipper = addEntry(getActivity().getString(0x7f0b0768), PowerUsageDetail.DrainType.CELL, l1, 0x7f02007e, d1);
        if (l1 != 0L)
            batterysipper.noCoveragePercent = (100D * (double)(mStats.getPhoneSignalStrengthTime(0, l, mStatsType) / 1000L)) / (double)l1;
    }

    private void addScreenUsage(long l)
    {
        long l1 = mStats.getScreenOnTime(l, mStatsType) / 1000L;
        double d = 0.0D + (double)l1 * mPowerProfile.getAveragePower("screen.on");
        double d1 = mPowerProfile.getAveragePower("screen.full");
        for (int i = 0; i < 5; i++)
            d += ((d1 * (double)(0.5F + (float)i)) / 5D) * (double)(mStats.getScreenBrightnessTime(i, l, mStatsType) / 1000L);

        double d2 = d / 1000D;
        addEntry(getActivity().getString(0x7f0b0765), PowerUsageDetail.DrainType.SCREEN, l1, 0x7f020083, d2);
    }

    private void addUserUsage()
    {
        for (int i = 0; i < mUserSippers.size(); i++)
        {
            int j = mUserSippers.keyAt(i);
            List list = (List)mUserSippers.valueAt(i);
            UserInfo userinfo = mUm.getUserInfo(j);
            String s;
            android.graphics.drawable.Drawable drawable;
            if (userinfo != null)
            {
                drawable = UserUtils.getUserIcon(mUm, userinfo, getResources());
                String s1;
                if (userinfo != null)
                    s1 = userinfo.name;
                else
                    s1 = null;
                if (s1 == null)
                    s1 = Integer.toString(userinfo.id);
                s = getActivity().getResources().getString(0x7f0b06a2, new Object[] {
                    s1
                });
            } else
            {
                s = getActivity().getResources().getString(0x7f0b06a3);
                drawable = null;
            }
            double d = ((Double)mUserPower.get(j)).doubleValue();
            BatterySipper batterysipper = addEntry(s, PowerUsageDetail.DrainType.USER, 0L, 0, d);
            batterysipper.icon = drawable;
            aggregateSippers(batterysipper, list, "User");
        }

    }

    private void addWiFiUsage(long l)
    {
        long l1 = mStats.getWifiOnTime(l, mStatsType) / 1000L;
        long l2 = mStats.getGlobalWifiRunningTime(l, mStatsType) / 1000L - mAppWifiRunning;
        if (l2 < 0L)
            l2 = 0L;
        double d = ((double)(0L * l1) * mPowerProfile.getAveragePower("wifi.on") + (double)l2 * mPowerProfile.getAveragePower("wifi.on")) / 1000D;
        aggregateSippers(addEntry(getActivity().getString(0x7f0b0766), PowerUsageDetail.DrainType.WIFI, l2, 0x7f020094, d + mWifiPower), mWifiSippers, "WIFI");
    }

    private void aggregateSippers(BatterySipper batterysipper, List list, String s)
    {
        for (int i = 0; i < list.size(); i++)
        {
            BatterySipper batterysipper1 = (BatterySipper)list.get(i);
            batterysipper.cpuTime = batterysipper.cpuTime + batterysipper1.cpuTime;
            batterysipper.gpsTime = batterysipper.gpsTime + batterysipper1.gpsTime;
            batterysipper.wifiRunningTime = batterysipper.wifiRunningTime + batterysipper1.wifiRunningTime;
            batterysipper.cpuFgTime = batterysipper.cpuFgTime + batterysipper1.cpuFgTime;
            batterysipper.wakeLockTime = batterysipper.wakeLockTime + batterysipper1.wakeLockTime;
            batterysipper.tcpBytesReceived = batterysipper.tcpBytesReceived + batterysipper1.tcpBytesReceived;
            batterysipper.tcpBytesSent = batterysipper.tcpBytesSent + batterysipper1.tcpBytesSent;
        }

    }

    private double getAverageDataCost()
    {
        double d = mPowerProfile.getAveragePower("wifi.active") / 3600D;
        double d1 = mPowerProfile.getAveragePower("radio.active") / 3600D;
        long l = mStats.getMobileTcpBytesReceived(mStatsType) + mStats.getMobileTcpBytesSent(mStatsType);
        long l1 = (mStats.getTotalTcpBytesReceived(mStatsType) + mStats.getTotalTcpBytesSent(mStatsType)) - l;
        long l2 = mStats.getRadioDataUptime() / 1000L;
        long l3;
        if (l2 != 0L)
            l3 = (1000L * (8L * l)) / l2;
        else
            l3 = 0x30d40L;
        double d2 = d1 / (double)(l3 / 8L);
        double d3 = d / 125000D;
        if (l1 + l != 0L)
            return (d2 * (double)l + d3 * (double)l1) / (double)(l + l1);
        else
            return 0.0D;
    }

    private void load()
    {
        try
        {
            byte abyte0[] = mBatteryInfo.getStatistics();
            Parcel parcel = Parcel.obtain();
            parcel.unmarshall(abyte0, 0, abyte0.length);
            parcel.setDataPosition(0);
            mStats = (BatteryStatsImpl)BatteryStatsImpl.CREATOR.createFromParcel(parcel);
            mStats.distributeWorkLocked(0);
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.e("PowerUsageSummary", "RemoteException:", remoteexception);
        }
    }

    private void processAppUsage()
    {
        SensorManager sensormanager = (SensorManager)getActivity().getSystemService("sensor");
        int i = mStatsType;
        int j = mPowerProfile.getNumSpeedSteps();
        double ad[] = new double[j];
        long al[] = new long[j];
        for (int k = 0; k < j; k++)
            ad[k] = mPowerProfile.getAveragePower("cpu.active", k);

        double d = getAverageDataCost();
        long l = mStats.computeBatteryRealtime(1000L * SystemClock.elapsedRealtime(), i);
        long l1 = 0L;
        BatterySipper batterysipper = null;
        mStatsPeriod = l;
        SparseArray sparsearray = mStats.getUidStats();
        int i1 = sparsearray.size();
        for (int j1 = 0; j1 < i1; j1++)
        {
            android.os.BatteryStats.Uid uid;
            double d8;
            boolean flag;
            int i2;
label0:
            {
                uid = (android.os.BatteryStats.Uid)sparsearray.valueAt(j1);
                double d3 = 0.0D;
                double d4 = 0.0D;
                Map map = uid.getProcessStats();
                long l4 = 0L;
                long l5 = 0L;
                long l6 = 0L;
                long l7 = 0L;
                int k1 = map.size();
                String s = null;
                if (k1 > 0)
                {
                    Iterator iterator2 = map.entrySet().iterator();
                    do
                    {
                        if (!iterator2.hasNext())
                            break;
                        java.util.Map.Entry entry = (java.util.Map.Entry)iterator2.next();
                        android.os.BatteryStats.Uid.Proc proc = (android.os.BatteryStats.Uid.Proc)entry.getValue();
                        long l13 = proc.getUserTime(i);
                        long l14 = proc.getSystemTime(i);
                        l5 += 10L * proc.getForegroundTime(i);
                        long l15 = 10L * (l13 + l14);
                        int i3 = 0;
                        for (int j3 = 0; j3 < j; j3++)
                        {
                            al[j3] = proc.getTimeAtCpuSpeedStep(j3, i);
                            i3 = (int)((long)i3 + al[j3]);
                        }

                        if (i3 == 0)
                            i3 = 1;
                        double d10 = 0.0D;
                        for (int k3 = 0; k3 < j; k3++)
                            d10 += ((double)al[k3] / (double)i3) * (double)l15 * ad[k3];

                        l4 += l15;
                        d3 += d10;
                        if (s != null && !s.startsWith("*"))
                        {
                            if (d4 < d10 && !((String)entry.getKey()).startsWith("*"))
                            {
                                d4 = d10;
                                s = (String)entry.getKey();
                            }
                        } else
                        {
                            d4 = d10;
                            s = (String)entry.getKey();
                        }
                    } while (true);
                }
                if (l5 > l4)
                    l4 = l5;
                double d5 = d3 / 1000D;
                Iterator iterator = uid.getWakelockStats().entrySet().iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    android.os.BatteryStats.Timer timer = ((android.os.BatteryStats.Uid.Wakelock)((java.util.Map.Entry)iterator.next()).getValue()).getWakeTime(0);
                    if (timer != null)
                        l6 += timer.getTotalTimeLocked(l, i);
                } while (true);
                long l8 = l6 / 1000L;
                l1 += l8;
                double d6 = d5 + ((double)l8 * mPowerProfile.getAveragePower("cpu.awake")) / 1000D;
                long l9 = uid.getTcpBytesReceived(mStatsType);
                long l10 = uid.getTcpBytesSent(mStatsType);
                double d7 = d6 + d * (double)(l9 + l10);
                long l11 = uid.getWifiRunningTime(l, i) / 1000L;
                mAppWifiRunning = l11 + mAppWifiRunning;
                d8 = d7 + ((double)l11 * mPowerProfile.getAveragePower("wifi.on")) / 1000D + ((double)(uid.getWifiScanTime(l, i) / 1000L) * mPowerProfile.getAveragePower("wifi.scan")) / 1000D;
                for (Iterator iterator1 = uid.getSensorStats().entrySet().iterator(); iterator1.hasNext();)
                {
                    android.os.BatteryStats.Uid.Sensor sensor = (android.os.BatteryStats.Uid.Sensor)((java.util.Map.Entry)iterator1.next()).getValue();
                    int k2 = sensor.getHandle();
                    long l12 = sensor.getSensorTime().getTotalTimeLocked(l, i) / 1000L;
                    double d9 = 0.0D;
                    switch (k2)
                    {
                    case -10000: 
                        d9 = mPowerProfile.getAveragePower("gps.on");
                        l7 = l12;
                        break;

                    default:
                        Sensor sensor1 = sensormanager.getDefaultSensor(k2);
                        if (sensor1 != null)
                            d9 = sensor1.getPower();
                        break;
                    }
                    d8 += (d9 * (double)l12) / 1000D;
                }

                flag = false;
                i2 = UserHandle.getUserId(uid.getUid());
                if (d8 == 0.0D)
                {
                    int j2 = uid.getUid();
                    flag = false;
                    if (j2 != 0)
                        break label0;
                }
                BatterySipper batterysipper1 = new BatterySipper(getActivity(), mRequestQueue, mHandler, s, PowerUsageDetail.DrainType.APP, 0, uid, new double[] {
                    d8
                });
                batterysipper1.cpuTime = l4;
                batterysipper1.gpsTime = l7;
                batterysipper1.wifiRunningTime = l11;
                batterysipper1.cpuFgTime = l5;
                batterysipper1.wakeLockTime = l8;
                batterysipper1.tcpBytesReceived = l9;
                batterysipper1.tcpBytesSent = l10;
                if (uid.getUid() == 1010)
                    mWifiSippers.add(batterysipper1);
                else
                if (uid.getUid() == 2000)
                {
                    mBluetoothSippers.add(batterysipper1);
                    flag = false;
                } else
                if (i2 != UserHandle.myUserId() && UserHandle.getAppId(uid.getUid()) >= 10000)
                {
                    flag = true;
                    Object obj = (List)mUserSippers.get(i2);
                    if (obj == null)
                    {
                        obj = new ArrayList();
                        mUserSippers.put(i2, obj);
                    }
                    ((List) (obj)).add(batterysipper1);
                } else
                {
                    mUsageList.add(batterysipper1);
                    flag = false;
                }
                if (uid.getUid() == 0)
                    batterysipper = batterysipper1;
            }
            if (d8 == 0.0D)
                continue;
            if (uid.getUid() == 1010)
            {
                mWifiPower = d8 + mWifiPower;
                continue;
            }
            if (uid.getUid() == 2000)
            {
                mBluetoothPower = d8 + mBluetoothPower;
                continue;
            }
            if (flag)
            {
                Double double1 = (Double)mUserPower.get(i2);
                Double double2;
                if (double1 == null)
                    double2 = Double.valueOf(d8);
                else
                    double2 = Double.valueOf(d8 + double1.doubleValue());
                mUserPower.put(i2, double2);
                continue;
            }
            if (d8 > mMaxPower)
                mMaxPower = d8;
            mTotalPower = d8 + mTotalPower;
        }

        if (batterysipper != null)
        {
            long l2 = mStats.computeBatteryUptime(1000L * SystemClock.uptimeMillis(), i) / 1000L - (l1 + mStats.getScreenOnTime(SystemClock.elapsedRealtime(), i) / 1000L);
            if (l2 > 0L)
            {
                double d1 = ((double)l2 * mPowerProfile.getAveragePower("cpu.awake")) / 1000D;
                long l3 = l2 + batterysipper.wakeLockTime;
                batterysipper.wakeLockTime = l3;
                double d2 = d1 + batterysipper.value;
                batterysipper.value = d2;
                double ad1[] = batterysipper.values;
                ad1[0] = d1 + ad1[0];
                if (batterysipper.value > mMaxPower)
                    mMaxPower = batterysipper.value;
                mTotalPower = d1 + mTotalPower;
            }
        }
    }

    private void processMiscUsage()
    {
        int i = mStatsType;
        long l = 1000L * SystemClock.elapsedRealtime();
        long l1 = mStats.computeBatteryRealtime(l, i);
        addUserUsage();
        addPhoneUsage(l1);
        addScreenUsage(l1);
        addWiFiUsage(l1);
        addBluetoothUsage(l1);
        addIdleUsage(l1);
        if (!Utils.isWifiOnly(getActivity()))
            addRadioUsage(l1);
    }

    private void refreshStats()
    {
        if (mStats == null)
            load();
        mMaxPower = 0.0D;
        mTotalPower = 0.0D;
        mWifiPower = 0.0D;
        mBluetoothPower = 0.0D;
        mAppWifiRunning = 0L;
        mAppListGroup.removeAll();
        mUsageList.clear();
        mWifiSippers.clear();
        mBluetoothSippers.clear();
        mUserSippers.clear();
        mUserPower.clear();
        mAppListGroup.setOrderingAsAdded(false);
        CheckBoxPreference checkboxpreference = new CheckBoxPreference(getActivity());
        checkboxpreference.setTitle(getString(0x7f0b014c));
        checkboxpreference.setOrder(-3);
        boolean flag;
        BatteryHistoryPreference batteryhistorypreference;
        Iterator iterator;
        if (android.provider.Settings.Secure.getInt(getActivity().getContentResolver(), "battery_percentage", 0) != 0)
            flag = true;
        else
            flag = false;
        checkboxpreference.setChecked(flag);
        mAppListGroup;
        mBatteryStatusPref.setOrder(-2);
        mAppListGroup.addPreference(mBatteryStatusPref);
        batteryhistorypreference = new BatteryHistoryPreference(getActivity(), mStats);
        batteryhistorypreference.setOrder(-1);
        mAppListGroup.addPreference(batteryhistorypreference);
        processAppUsage();
        processMiscUsage();
        Collections.sort(mUsageList);
        iterator = mUsageList.iterator();
label0:
        do
        {
            BatterySipper batterysipper;
            double d;
            do
            {
                do
                {
                    if (!iterator.hasNext())
                        break label0;
                    batterysipper = (BatterySipper)iterator.next();
                } while (batterysipper.getSortValue() < 5D);
                d = 100D * (batterysipper.getSortValue() / mTotalPower);
            } while (d < 1.0D);
            PowerGaugePreference powergaugepreference = new PowerGaugePreference(getActivity(), batterysipper.getIcon(), batterysipper);
            double d1 = (100D * batterysipper.getSortValue()) / mMaxPower;
            batterysipper.percent = d;
            powergaugepreference.setTitle(batterysipper.name);
            powergaugepreference.setOrder(0x7fffffff - (int)batterysipper.getSortValue());
            powergaugepreference.setPercent(d1, d);
            if (batterysipper.uidObj != null)
                powergaugepreference.setKey(Integer.toString(batterysipper.uidObj.getUid()));
            mAppListGroup.addPreference(powergaugepreference);
        } while (mAppListGroup.getPreferenceCount() <= 11);
        synchronized (mRequestQueue)
        {
            if (!mRequestQueue.isEmpty())
            {
                if (mRequestThread == null)
                {
                    mRequestThread = new Thread(this, "BatteryUsage Icon Loader");
                    mRequestThread.setPriority(1);
                    mRequestThread.start();
                }
                mRequestQueue.notify();
            }
        }
        return;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        if (bundle != null)
            mStats = sStatsXfer;
        addPreferencesFromResource(0x7f050022);
        mBatteryInfo = com.android.internal.app.IBatteryStats.Stub.asInterface(ServiceManager.getService("batteryinfo"));
        mUm = (UserManager)getActivity().getSystemService("user");
        mAppListGroup = (PreferenceGroup)findPreference("app_list");
        mBatteryStatusPref = mAppListGroup.findPreference("battery_status");
        mPowerProfile = new PowerProfile(getActivity());
        setHasOptionsMenu(true);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        menu.add(0, 2, 0, 0x7f0b0790).setIcon(0x7f02006d).setAlphabeticShortcut('r').setShowAsAction(5);
        String s = getResources().getString(0x7f0b092f);
        if (!TextUtils.isEmpty(s))
        {
            MenuItem menuitem = menu.add(0, 3, 0, 0x7f0b0928);
            HelpUtils.prepareHelpMenuItem(getActivity(), menuitem, s);
        }
    }

    public void onDestroy()
    {
        super.onDestroy();
        if (getActivity().isChangingConfigurations())
            sStatsXfer = mStats;
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 2: // '\002'
            mStats = null;
            refreshStats();
            return true;

        case 1: // '\001'
            if (mStatsType == 0)
                mStatsType = 3;
            else
                mStatsType = 0;
            refreshStats();
            return true;
        }
        return false;
    }

    public void onPause()
    {
        synchronized (mRequestQueue)
        {
            mAbort = true;
        }
        mHandler.removeMessages(1);
        getActivity().unregisterReceiver(mBatteryInfoReceiver);
        super.onPause();
        return;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference instanceof CheckBoxPreference)
        {
            if ("cpu_dtm".equals(preference.getKey()))
            {
                String s;
                if (((CheckBoxPreference)preference).isChecked())
                    s = "/system/bin/thermal_manager /etc/.tp/thermal.conf";
                else
                    s = "/system/bin/thermal_manager /etc/.tp/thermal.off.conf";
                Log.d("PowerUsageSummary", (new StringBuilder()).append("onPreferenceTreeClick : command is ").append(s).toString());
                (new PowerSavingTASK()).execute(new String[] {
                    s
                });
            } else
            {
                Log.d("PowerUsageSummary", "click battery percentage checkbox");
                int i;
                if (((CheckBoxPreference)preference).isChecked())
                    i = 1;
                else
                    i = 0;
                Log.d("PowerUsageSummary", (new StringBuilder()).append("state: ").append(i).toString());
                android.provider.Settings.Secure.putInt(getActivity().getContentResolver(), "battery_percentage", i);
                Intent intent = new Intent("mediatek.intent.action.BATTERY_PERCENTAGE_SWITCH");
                intent.putExtra("state", i);
                Log.d("PowerUsageSummary", "sendBroadcast battery percentage switch");
                getActivity().sendBroadcast(intent);
            }
            return super.onPreferenceTreeClick(preferencescreen, preference);
        }
        if (preference instanceof BatteryHistoryPreference)
        {
            Parcel parcel = Parcel.obtain();
            mStats.writeToParcelWithoutUids(parcel, 0);
            byte abyte0[] = parcel.marshall();
            Bundle bundle1 = new Bundle();
            bundle1.putByteArray("stats", abyte0);
            ((PreferenceActivity)getActivity()).startPreferencePanel(com/android/settings/fuelgauge/BatteryHistoryDetail.getName(), bundle1, 0x7f0b0760, null, null, 0);
            return super.onPreferenceTreeClick(preferencescreen, preference);
        }
        if (!(preference instanceof PowerGaugePreference))
            return false;
        BatterySipper batterysipper = ((PowerGaugePreference)preference).getInfo();
        Bundle bundle = new Bundle();
        bundle.putString("title", batterysipper.name);
        bundle.putInt("percent", (int)Math.ceil((100D * batterysipper.getSortValue()) / mTotalPower));
        bundle.putInt("gauge", (int)Math.ceil((100D * batterysipper.getSortValue()) / mMaxPower));
        bundle.putLong("duration", mStatsPeriod);
        bundle.putString("iconPackage", batterysipper.defaultPackageName);
        bundle.putInt("iconId", batterysipper.iconId);
        bundle.putDouble("noCoverage", batterysipper.noCoveragePercent);
        if (batterysipper.uidObj != null)
            bundle.putInt("uid", batterysipper.uidObj.getUid());
        bundle.putSerializable("drainType", batterysipper.drainType);
        static class _cls3
        {

            static final int $SwitchMap$com$android$settings$fuelgauge$PowerUsageDetail$DrainType[];

            static 
            {
                $SwitchMap$com$android$settings$fuelgauge$PowerUsageDetail$DrainType = new int[PowerUsageDetail.DrainType.values().length];
                try
                {
                    $SwitchMap$com$android$settings$fuelgauge$PowerUsageDetail$DrainType[PowerUsageDetail.DrainType.APP.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$com$android$settings$fuelgauge$PowerUsageDetail$DrainType[PowerUsageDetail.DrainType.USER.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1) { }
                try
                {
                    $SwitchMap$com$android$settings$fuelgauge$PowerUsageDetail$DrainType[PowerUsageDetail.DrainType.CELL.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror2) { }
                try
                {
                    $SwitchMap$com$android$settings$fuelgauge$PowerUsageDetail$DrainType[PowerUsageDetail.DrainType.WIFI.ordinal()] = 4;
                }
                catch (NoSuchFieldError nosuchfielderror3) { }
                try
                {
                    $SwitchMap$com$android$settings$fuelgauge$PowerUsageDetail$DrainType[PowerUsageDetail.DrainType.BLUETOOTH.ordinal()] = 5;
                }
                catch (NoSuchFieldError nosuchfielderror4)
                {
                    return;
                }
            }
        }

        int ai[];
        double ad[];
        switch (_cls3..SwitchMap.com.android.settings.fuelgauge.PowerUsageDetail.DrainType[batterysipper.drainType.ordinal()])
        {
        case 5: // '\005'
            ai = new int[6];
            ai[0] = 0x7f0b0775;
            ai[1] = 0x7f0b076b;
            ai[2] = 0x7f0b076c;
            ai[3] = 0x7f0b076d;
            ai[4] = 0x7f0b0771;
            ai[5] = 0x7f0b0772;
            ad = new double[6];
            ad[0] = batterysipper.usageTime;
            ad[1] = batterysipper.cpuTime;
            ad[2] = batterysipper.cpuFgTime;
            ad[3] = batterysipper.wakeLockTime;
            ad[4] = batterysipper.tcpBytesSent;
            ad[5] = batterysipper.tcpBytesReceived;
            break;

        case 4: // '\004'
            ai = new int[6];
            ai[0] = 0x7f0b076f;
            ai[1] = 0x7f0b076b;
            ai[2] = 0x7f0b076c;
            ai[3] = 0x7f0b076d;
            ai[4] = 0x7f0b0771;
            ai[5] = 0x7f0b0772;
            ad = new double[6];
            ad[0] = batterysipper.usageTime;
            ad[1] = batterysipper.cpuTime;
            ad[2] = batterysipper.cpuFgTime;
            ad[3] = batterysipper.wakeLockTime;
            ad[4] = batterysipper.tcpBytesSent;
            ad[5] = batterysipper.tcpBytesReceived;
            break;

        case 3: // '\003'
            ai = new int[2];
            ai[0] = 0x7f0b0775;
            ai[1] = 0x7f0b0776;
            ad = new double[2];
            ad[0] = batterysipper.usageTime;
            ad[1] = batterysipper.noCoveragePercent;
            break;

        case 1: // '\001'
        case 2: // '\002'
            android.os.BatteryStats.Uid uid = batterysipper.uidObj;
            ai = new int[9];
            ai[0] = 0x7f0b076b;
            ai[1] = 0x7f0b076c;
            ai[2] = 0x7f0b076d;
            ai[3] = 0x7f0b076e;
            ai[4] = 0x7f0b076f;
            ai[5] = 0x7f0b0771;
            ai[6] = 0x7f0b0772;
            ai[7] = 0x7f0b0773;
            ai[8] = 0x7f0b0774;
            ad = new double[9];
            ad[0] = batterysipper.cpuTime;
            ad[1] = batterysipper.cpuFgTime;
            ad[2] = batterysipper.wakeLockTime;
            ad[3] = batterysipper.gpsTime;
            ad[4] = batterysipper.wifiRunningTime;
            ad[5] = batterysipper.tcpBytesSent;
            ad[6] = batterysipper.tcpBytesReceived;
            ad[7] = 0.0D;
            ad[8] = 0.0D;
            if (batterysipper.drainType == PowerUsageDetail.DrainType.APP)
            {
                StringWriter stringwriter = new StringWriter();
                PrintWriter printwriter = new PrintWriter(stringwriter);
                mStats.dumpLocked(printwriter, "", mStatsType, uid.getUid());
                bundle.putString("report_details", stringwriter.toString());
                StringWriter stringwriter1 = new StringWriter();
                PrintWriter printwriter1 = new PrintWriter(stringwriter1);
                mStats.dumpCheckinLocked(printwriter1, mStatsType, uid.getUid());
                bundle.putString("report_checkin_details", stringwriter1.toString());
            }
            break;

        default:
            ai = new int[1];
            ai[0] = 0x7f0b0775;
            ad = new double[1];
            ad[0] = batterysipper.usageTime;
            break;
        }
        bundle.putIntArray("types", ai);
        bundle.putDoubleArray("values", ad);
        ((PreferenceActivity)getActivity()).startPreferencePanel(com/android/settings/fuelgauge/PowerUsageDetail.getName(), bundle, 0x7f0b0761, null, null, 0);
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    public void onResume()
    {
        super.onResume();
        mAbort = false;
        getActivity().registerReceiver(mBatteryInfoReceiver, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
        refreshStats();
    }

    public void run()
    {
_L2:
label0:
        {
            synchronized (mRequestQueue)
            {
                if (!mRequestQueue.isEmpty() && !mAbort)
                    break label0;
                mRequestThread = null;
            }
            return;
        }
        BatterySipper batterysipper = (BatterySipper)mRequestQueue.remove(0);
        arraylist;
        JVM INSTR monitorexit ;
        batterysipper.getNameIcon();
        if (true) goto _L2; else goto _L1
_L1:
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }

}
