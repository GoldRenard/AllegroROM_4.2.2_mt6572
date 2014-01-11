// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.app.StatusBarManager;
import android.bluetooth.BluetoothAdapter;
import android.content.*;
import android.media.AudioManager;
import android.os.Handler;
import android.os.storage.StorageManager;
import com.android.systemui.usb.StorageNotification;
import com.mediatek.xlog.Xlog;

public class PhoneStatusBarPolicy
{

    private static final int AM_PM_STYLE = 2;
    private static final int AM_PM_STYLE_GONE = 2;
    private static final int AM_PM_STYLE_NORMAL = 0;
    private static final int AM_PM_STYLE_SMALL = 1;
    private static final int EVENT_BATTERY_CLOSE = 4;
    private static final int INET_CONDITION_THRESHOLD = 50;
    private static final boolean SHOW_SYNC_ICON = false;
    private static final String TAG = "PhoneStatusBarPolicy";
    private static final int sWifiSignalImages[][] = {
        {
            0x7f020222, 0x7f020224, 0x7f020226, 0x7f020228
        }, {
            0x7f020223, 0x7f020225, 0x7f020227, 0x7f020229
        }
    };
    private static final int sWifiTemporarilyNotConnectedImage = 0x7f020221;
    private boolean mBluetoothEnabled;
    private final Context mContext;
    private final Handler mHandler = new Handler();
    private int mInetCondition;
    private BroadcastReceiver mIntentReceiver;
    private boolean mIsWifiConnected;
    private int mLastWifiSignalLevel;
    private final StatusBarManager mService;
    com.android.internal.telephony.IccCardConstants.State mSimState;
    private StorageManager mStorageManager;
    private boolean mVolumeVisible;

    public PhoneStatusBarPolicy(Context context)
    {
        mSimState = com.android.internal.telephony.IccCardConstants.State.READY;
        mBluetoothEnabled = false;
        mLastWifiSignalLevel = -1;
        mIsWifiConnected = false;
        mInetCondition = 0;
        mIntentReceiver = new BroadcastReceiver() {

            final PhoneStatusBarPolicy this$0;

            public void onReceive(Context context1, Intent intent)
            {
label0:
                {
                    String s = intent.getAction();
                    if (s.equals("android.intent.action.ALARM_CHANGED"))
                    {
                        updateAlarm(intent);
                    } else
                    {
                        if (s.equals("android.intent.action.SYNC_STATE_CHANGED"))
                        {
                            updateSyncState(intent);
                            return;
                        }
                        if (s.equals("android.bluetooth.adapter.action.STATE_CHANGED") || s.equals("android.bluetooth.adapter.action.CONNECTION_STATE_CHANGED"))
                            break label0;
                        if (s.equals("android.media.RINGER_MODE_CHANGED"))
                        {
                            updateVolume();
                            return;
                        }
                        if (s.equals("android.intent.action.SIM_STATE_CHANGED"))
                        {
                            updateSimState(intent);
                            return;
                        }
                        if (s.equals("com.android.internal.telephony.cdma.intent.action.TTY_ENABLED_CHANGE"))
                        {
                            updateTTY(intent);
                            return;
                        }
                        if (s.equals("android.intent.action.HEADSET_PLUG"))
                        {
                            updateHeadSet(intent);
                            return;
                        }
                    }
                    return;
                }
                updateBluetooth(intent);
            }

            
            {
                this$0 = PhoneStatusBarPolicy.this;
                super();
            }
        }
;
        mContext = context;
        mService = (StatusBarManager)context.getSystemService("statusbar");
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.ALARM_CHANGED");
        intentfilter.addAction("android.intent.action.SYNC_STATE_CHANGED");
        intentfilter.addAction("android.media.RINGER_MODE_CHANGED");
        intentfilter.addAction("android.bluetooth.adapter.action.STATE_CHANGED");
        intentfilter.addAction("android.bluetooth.adapter.action.CONNECTION_STATE_CHANGED");
        intentfilter.addAction("android.intent.action.SIM_STATE_CHANGED");
        intentfilter.addAction("com.android.internal.telephony.cdma.intent.action.TTY_ENABLED_CHANGE");
        intentfilter.addAction("android.intent.action.HEADSET_PLUG");
        mContext.registerReceiver(mIntentReceiver, intentfilter, null, mHandler);
        mStorageManager = (StorageManager)context.getSystemService("storage");
        mStorageManager.registerListener(new StorageNotification(context));
        mService.setIcon("tty", 0x7f02021d, 0, null);
        mService.setIconVisibility("tty", false);
        mService.setIcon("cdma_eri", 0x7f0201f8, 0, null);
        mService.setIconVisibility("cdma_eri", false);
        BluetoothAdapter bluetoothadapter = BluetoothAdapter.getDefaultAdapter();
        int i = 0x7f02014e;
        if (bluetoothadapter != null)
        {
            boolean flag;
            if (bluetoothadapter.getState() == 12)
                flag = true;
            else
                flag = false;
            mBluetoothEnabled = flag;
            if (bluetoothadapter.getConnectionState() == 2)
                i = 0x7f02014f;
        }
        mService.setIcon("bluetooth", i, 0, null);
        mService.setIconVisibility("bluetooth", mBluetoothEnabled);
        mService.setIcon("alarm_clock", 0x7f02013b, 0, null);
        mService.setIconVisibility("alarm_clock", false);
        mService.setIcon("sync_active", 0x7f02021b, 0, null);
        mService.setIcon("sync_failing", 0x7f02021c, 0, null);
        mService.setIconVisibility("sync_active", false);
        mService.setIconVisibility("sync_failing", false);
        mService.setIcon("volume", 0x7f0201f6, 0, null);
        mService.setIconVisibility("volume", false);
        updateVolume();
        mService.setIcon("headset", 0x7f0201f3, 0, null);
        mService.setIconVisibility("headset", false);
    }

    private final void updateAlarm(Intent intent)
    {
        boolean flag = intent.getBooleanExtra("alarmSet", false);
        mService.setIconVisibility("alarm_clock", flag);
    }

    private final void updateBluetooth(Intent intent)
    {
label0:
        {
            int i = 0x7f02014e;
            String s = null;
            String s1 = intent.getAction();
            if (s1.equals("android.bluetooth.adapter.action.STATE_CHANGED"))
            {
                boolean flag;
                if (intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0x80000000) == 12)
                    flag = true;
                else
                    flag = false;
                mBluetoothEnabled = flag;
            } else
            {
                if (!s1.equals("android.bluetooth.adapter.action.CONNECTION_STATE_CHANGED"))
                    break label0;
                if (intent.getIntExtra("android.bluetooth.adapter.extra.CONNECTION_STATE", 0) == 2)
                {
                    i = 0x7f02014f;
                    s = mContext.getString(0x7f0b0078);
                } else
                {
                    s = mContext.getString(0x7f0b0079);
                }
            }
            mService.setIcon("bluetooth", i, 0, s);
            mService.setIconVisibility("bluetooth", mBluetoothEnabled);
        }
    }

    private final void updateHeadSet(Intent intent)
    {
        int i = intent.getIntExtra("state", -1);
        int j = intent.getIntExtra("microphone", -1);
        Xlog.d("PhoneStatusBarPolicy", (new StringBuilder()).append("updateHeadSet, state=").append(i).append(", mic=").append(j).append(".").toString());
        if (i != -1 && j != -1)
        {
            if (i == 1)
            {
                if (j == 1)
                {
                    mService.setIcon("headset", 0x7f0201f3, 0, null);
                    mService.setIconVisibility("headset", true);
                    return;
                } else
                {
                    mService.setIcon("headset", 0x7f0201f4, 0, null);
                    mService.setIconVisibility("headset", true);
                    return;
                }
            } else
            {
                mService.setIconVisibility("headset", false);
                return;
            }
        } else
        {
            return;
        }
    }

    private final void updateSimState(Intent intent)
    {
        String s = intent.getStringExtra("ss");
        if ("ABSENT".equals(s))
        {
            mSimState = com.android.internal.telephony.IccCardConstants.State.ABSENT;
            return;
        }
        if ("READY".equals(s))
        {
            mSimState = com.android.internal.telephony.IccCardConstants.State.READY;
            return;
        }
        if ("LOCKED".equals(s))
        {
            String s1 = intent.getStringExtra("reason");
            if ("PIN".equals(s1))
            {
                mSimState = com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED;
                return;
            }
            if ("PUK".equals(s1))
            {
                mSimState = com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED;
                return;
            } else
            {
                mSimState = com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED;
                return;
            }
        } else
        {
            mSimState = com.android.internal.telephony.IccCardConstants.State.UNKNOWN;
            return;
        }
    }

    private final void updateSyncState(Intent intent)
    {
    }

    private final void updateTTY(Intent intent)
    {
        intent.getAction();
        if (intent.getBooleanExtra("ttyEnabled", false))
        {
            mService.setIcon("tty", 0x7f02021d, 0, mContext.getString(0x7f0b00a3));
            mService.setIconVisibility("tty", true);
            return;
        } else
        {
            mService.setIconVisibility("tty", false);
            return;
        }
    }

    private final void updateVolume()
    {
        int i = ((AudioManager)mContext.getSystemService("audio")).getRingerMode();
        boolean flag;
        if (i != 0 && i != 1)
            flag = false;
        else
            flag = true;
        int j;
        String s;
        if (i == 1)
        {
            j = 0x7f0201f7;
            s = mContext.getString(0x7f0b00a4);
        } else
        {
            j = 0x7f0201f6;
            s = mContext.getString(0x7f0b00a5);
        }
        if (flag)
            mService.setIcon("volume", j, 0, s);
        if (flag != mVolumeVisible)
        {
            mService.setIconVisibility("volume", flag);
            mVolumeVisible = flag;
        }
    }








}
