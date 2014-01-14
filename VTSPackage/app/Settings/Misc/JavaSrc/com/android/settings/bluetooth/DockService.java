// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.app.*;
import android.bluetooth.BluetoothDevice;
import android.content.*;
import android.content.res.Resources;
import android.os.*;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.*;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import java.util.*;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothAdapter, LocalBluetoothProfile, CachedBluetoothDevice, LocalBluetoothPreferences, 
//            CachedBluetoothDeviceManager, DockEventReceiver, LocalBluetoothProfileManager, LocalBluetoothManager

public final class DockService extends Service
    implements LocalBluetoothProfileManager.ServiceListener
{
    private final class ServiceHandler extends Handler
    {

        final DockService this$0;

        public void handleMessage(Message message)
        {
            processMessage(message);
        }

        private ServiceHandler(Looper looper)
        {
            this$0 = DockService.this;
            super(looper);
        }

    }


    static final boolean DEBUG = false;
    private static final long DISABLE_BT_GRACE_PERIOD = 2000L;
    private static final int INVALID_STARTID = -100;
    private static final String KEY_CONNECT_RETRY_COUNT = "connect_retry_count";
    private static final String KEY_DISABLE_BT = "disable_bt";
    private static final String KEY_DISABLE_BT_WHEN_UNDOCKED = "disable_bt_when_undock";
    private static final int MAX_CONNECT_RETRY = 6;
    private static final int MSG_TYPE_DISABLE_BT = 555;
    private static final int MSG_TYPE_DOCKED = 222;
    private static final int MSG_TYPE_SHOW_UI = 111;
    private static final int MSG_TYPE_UNDOCKED_PERMANENT = 444;
    private static final int MSG_TYPE_UNDOCKED_TEMPORARY = 333;
    private static final String SHARED_PREFERENCES_NAME = "dock_settings";
    private static final String TAG = "DockService";
    private static final long UNDOCKED_GRACE_PERIOD = 1000L;
    private CheckBox mAudioMediaCheckbox;
    private final android.widget.CompoundButton.OnCheckedChangeListener mCheckedChangeListener = new android.widget.CompoundButton.OnCheckedChangeListener() {

        final DockService this$0;

        public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
        {
            if (mDevice != null)
            {
                LocalBluetoothPreferences.saveDockAutoConnectSetting(DockService.this, mDevice.getAddress(), flag);
                return;
            }
            android.content.ContentResolver contentresolver = getContentResolver();
            int i;
            if (flag)
                i = 1;
            else
                i = 0;
            android.provider.Settings.Global.putInt(contentresolver, "dock_audio_media_enabled", i);
        }

            
            {
                this$0 = DockService.this;
                super();
            }
    }
;
    private boolean mCheckedItems[];
    private final android.content.DialogInterface.OnClickListener mClickListener = new android.content.DialogInterface.OnClickListener() {

        final DockService this$0;

        public void onClick(DialogInterface dialoginterface, int i)
        {
            boolean flag = true;
            if (i == -1)
                if (mDevice != null)
                {
                    if (!LocalBluetoothPreferences.hasDockAutoConnectSetting(DockService.this, mDevice.getAddress()))
                        LocalBluetoothPreferences.saveDockAutoConnectSetting(DockService.this, mDevice.getAddress(), flag);
                    applyBtSettings(mDevice, mStartIdAssociatedWithDialog);
                } else
                if (mAudioMediaCheckbox != null)
                {
                    android.content.ContentResolver contentresolver = getContentResolver();
                    if (!mAudioMediaCheckbox.isChecked())
                        flag = false;
                    android.provider.Settings.Global.putInt(contentresolver, "dock_audio_media_enabled", flag);
                    return;
                }
        }

            
            {
                this$0 = DockService.this;
                super();
            }
    }
;
    private BluetoothDevice mDevice;
    private CachedBluetoothDeviceManager mDeviceManager;
    private AlertDialog mDialog;
    private final android.content.DialogInterface.OnDismissListener mDismissListener = new android.content.DialogInterface.OnDismissListener() {

        final DockService this$0;

        public void onDismiss(DialogInterface dialoginterface)
        {
            if (mPendingDevice == null)
                DockEventReceiver.finishStartingService(DockService.this, mStartIdAssociatedWithDialog);
            stopForeground(true);
        }

            
            {
                this$0 = DockService.this;
                super();
            }
    }
;
    private LocalBluetoothAdapter mLocalAdapter;
    private final android.content.DialogInterface.OnMultiChoiceClickListener mMultiClickListener = new android.content.DialogInterface.OnMultiChoiceClickListener() {

        final DockService this$0;

        public void onClick(DialogInterface dialoginterface, int i, boolean flag)
        {
            mCheckedItems[i] = flag;
        }

            
            {
                this$0 = DockService.this;
                super();
            }
    }
;
    private BluetoothDevice mPendingDevice;
    private int mPendingStartId;
    private int mPendingTurnOffStartId;
    private int mPendingTurnOnStartId;
    private LocalBluetoothProfileManager mProfileManager;
    private LocalBluetoothProfile mProfiles[];
    private Runnable mRunnable;
    private volatile ServiceHandler mServiceHandler;
    private volatile Looper mServiceLooper;
    private int mStartIdAssociatedWithDialog;

    public DockService()
    {
        mPendingTurnOnStartId = -100;
        mPendingTurnOffStartId = -100;
    }

    private void applyBtSettings(BluetoothDevice bluetoothdevice, int i)
    {
        this;
        JVM INSTR monitorenter ;
        if (bluetoothdevice == null) goto _L2; else goto _L1
_L1:
        if (mProfiles == null || mCheckedItems == null) goto _L2; else goto _L3
_L3:
        LocalBluetoothAdapter localbluetoothadapter = mLocalAdapter;
        if (localbluetoothadapter != null) goto _L4; else goto _L2
_L2:
        this;
        JVM INSTR monitorexit ;
        return;
_L4:
        boolean aflag[];
        int j;
        aflag = mCheckedItems;
        j = aflag.length;
        int k = 0;
_L9:
        if (k >= j) goto _L6; else goto _L5
_L5:
        int l;
        if (!aflag[k])
            continue; /* Loop/switch isn't completed */
        l = mLocalAdapter.getBluetoothState();
        mLocalAdapter.enable();
        if (l == 12)
            continue; /* Loop/switch isn't completed */
        if (mPendingDevice != null && mPendingDevice.equals(mDevice)) goto _L2; else goto _L7
_L7:
        mPendingDevice = bluetoothdevice;
        mPendingStartId = i;
        if (l == 11) goto _L2; else goto _L8
_L8:
        getPrefs().edit().putBoolean("disable_bt_when_undock", true).apply();
          goto _L2
        Exception exception;
        exception;
        throw exception;
          goto _L9
_L6:
        mPendingDevice = null;
        boolean flag = false;
        CachedBluetoothDevice cachedbluetoothdevice = getCachedBluetoothDevice(bluetoothdevice);
        int i1 = 0;
_L14:
        if (i1 >= mProfiles.length) goto _L11; else goto _L10
_L10:
        LocalBluetoothProfile localbluetoothprofile = mProfiles[i1];
        if (!mCheckedItems[i1]) goto _L13; else goto _L12
_L12:
        flag = true;
_L16:
        localbluetoothprofile.setPreferred(bluetoothdevice, mCheckedItems[i1]);
        i1++;
          goto _L14
_L13:
        if (mCheckedItems[i1] || localbluetoothprofile.getConnectionStatus(cachedbluetoothdevice.getDevice()) != 2) goto _L16; else goto _L15
_L15:
        cachedbluetoothdevice.disconnect(mProfiles[i1]);
          goto _L16
_L11:
        if (!flag) goto _L2; else goto _L17
_L17:
        cachedbluetoothdevice.connect(false);
          goto _L2
    }

    private void connectIfEnabled(BluetoothDevice bluetoothdevice)
    {
        this;
        JVM INSTR monitorenter ;
        CachedBluetoothDevice cachedbluetoothdevice = getCachedBluetoothDevice(bluetoothdevice);
        Iterator iterator = cachedbluetoothdevice.getConnectableProfiles().iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            if (((LocalBluetoothProfile)iterator.next()).getPreferred(bluetoothdevice) != 1000)
                continue;
            cachedbluetoothdevice.connect(false);
            break;
        } while (true);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    private void createDialog(BluetoothDevice bluetoothdevice, int i, int j)
    {
        if (mDialog != null)
        {
            mDialog.dismiss();
            mDialog = null;
        }
        mDevice = bluetoothdevice;
        switch (i)
        {
        case 1: // '\001'
        case 2: // '\002'
        case 3: // '\003'
        case 4: // '\004'
            startForeground(0, new Notification());
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
            LayoutInflater layoutinflater = (LayoutInflater)getSystemService("layout_inflater");
            mAudioMediaCheckbox = null;
            View view;
            if (bluetoothdevice != null)
            {
                boolean flag1;
                if (!LocalBluetoothPreferences.hasDockAutoConnectSetting(this, bluetoothdevice.getAddress()))
                    flag1 = true;
                else
                    flag1 = false;
                CharSequence acharsequence[] = initBtSettings(bluetoothdevice, i, flag1);
                builder.setTitle(getString(0x7f0b040d));
                builder.setMultiChoiceItems(acharsequence, mCheckedItems, mMultiClickListener);
                view = layoutinflater.inflate(0x7f040080, null);
                CheckBox checkbox = (CheckBox)view.findViewById(0x7f08015c);
                boolean flag2;
                if (!flag1 && !LocalBluetoothPreferences.getDockAutoConnectSetting(this, bluetoothdevice.getAddress()))
                    flag2 = false;
                else
                    flag2 = true;
                checkbox.setChecked(flag2);
                checkbox.setOnCheckedChangeListener(mCheckedChangeListener);
            } else
            {
                builder.setTitle(getString(0x7f0b040d));
                view = layoutinflater.inflate(0x7f040036, null);
                mAudioMediaCheckbox = (CheckBox)view.findViewById(0x7f080081);
                boolean flag;
                if (android.provider.Settings.Global.getInt(getContentResolver(), "dock_audio_media_enabled", 0) == 1)
                    flag = true;
                else
                    flag = false;
                mAudioMediaCheckbox.setChecked(flag);
                mAudioMediaCheckbox.setOnCheckedChangeListener(mCheckedChangeListener);
            }
            float f = getResources().getDisplayMetrics().density;
            builder.setView(view, (int)(14F * f), 0, (int)(14F * f), 0);
            builder.setPositiveButton(getString(0x104000a), mClickListener);
            mStartIdAssociatedWithDialog = j;
            mDialog = builder.create();
            mDialog.getWindow().setType(2009);
            mDialog.setOnDismissListener(mDismissListener);
            mDialog.show();
            return;
        }
    }

    private CachedBluetoothDevice getCachedBluetoothDevice(BluetoothDevice bluetoothdevice)
    {
        CachedBluetoothDevice cachedbluetoothdevice = mDeviceManager.findDevice(bluetoothdevice);
        if (cachedbluetoothdevice == null)
            cachedbluetoothdevice = mDeviceManager.addDevice(mLocalAdapter, mProfileManager, bluetoothdevice);
        return cachedbluetoothdevice;
    }

    private SharedPreferences getPrefs()
    {
        return getSharedPreferences("dock_settings", 0);
    }

    private void handleBluetoothStateOn(int i)
    {
        if (mPendingDevice != null)
        {
            if (mPendingDevice.equals(mDevice))
                applyBtSettings(mPendingDevice, mPendingStartId);
            mPendingDevice = null;
            DockEventReceiver.finishStartingService(this, mPendingStartId);
        } else
        {
            SharedPreferences sharedpreferences = getPrefs();
            Intent intent = registerReceiver(null, new IntentFilter("android.intent.action.DOCK_EVENT"));
            if (intent != null)
                if (intent.getIntExtra("android.intent.extra.DOCK_STATE", 0) != 0)
                {
                    BluetoothDevice bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                    if (bluetoothdevice != null)
                        connectIfEnabled(bluetoothdevice);
                } else
                if (sharedpreferences.getBoolean("disable_bt", false) && mLocalAdapter.disable())
                {
                    mPendingTurnOffStartId = i;
                    sharedpreferences.edit().remove("disable_bt").apply();
                    return;
                }
        }
        if (mPendingTurnOnStartId != -100)
        {
            DockEventReceiver.finishStartingService(this, mPendingTurnOnStartId);
            mPendingTurnOnStartId = -100;
        }
        DockEventReceiver.finishStartingService(this, i);
    }

    private void handleBtStateChange(Intent intent, int i)
    {
        int j = intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0x80000000);
        this;
        JVM INSTR monitorenter ;
        if (j != 12) goto _L2; else goto _L1
_L1:
        handleBluetoothStateOn(i);
_L5:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (j != 13) goto _L4; else goto _L3
_L3:
        getPrefs().edit().remove("disable_bt_when_undock").apply();
        DockEventReceiver.finishStartingService(this, i);
          goto _L5
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
_L4:
        if (j != 10) goto _L5; else goto _L6
_L6:
label0:
        {
            if (mPendingTurnOffStartId != -100)
            {
                DockEventReceiver.finishStartingService(this, mPendingTurnOffStartId);
                getPrefs().edit().remove("disable_bt").apply();
                mPendingTurnOffStartId = -100;
            }
            if (mPendingDevice == null)
                break label0;
            mLocalAdapter.enable();
            mPendingTurnOnStartId = i;
        }
          goto _L5
        DockEventReceiver.finishStartingService(this, i);
          goto _L5
    }

    private void handleDocked(BluetoothDevice bluetoothdevice, int i, int j)
    {
        this;
        JVM INSTR monitorenter ;
        if (bluetoothdevice == null)
            break MISSING_BLOCK_LABEL_37;
        if (!LocalBluetoothPreferences.getDockAutoConnectSetting(this, bluetoothdevice.getAddress()))
            break MISSING_BLOCK_LABEL_37;
        initBtSettings(bluetoothdevice, i, false);
        applyBtSettings(mDevice, j);
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
        createDialog(bluetoothdevice, i, j);
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

    private void handleUndocked(BluetoothDevice bluetoothdevice)
    {
        this;
        JVM INSTR monitorenter ;
        mRunnable = null;
        mProfileManager.removeServiceListener(this);
        if (mDialog != null)
        {
            mDialog.dismiss();
            mDialog = null;
        }
        mDevice = null;
        mPendingDevice = null;
        if (bluetoothdevice == null)
            break MISSING_BLOCK_LABEL_56;
        getCachedBluetoothDevice(bluetoothdevice).disconnect();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    private void handleUnexpectedDisconnect(BluetoothDevice bluetoothdevice, LocalBluetoothProfile localbluetoothprofile, int i)
    {
        this;
        JVM INSTR monitorenter ;
        if (bluetoothdevice == null)
            break MISSING_BLOCK_LABEL_77;
        Intent intent = registerReceiver(null, new IntentFilter("android.intent.action.DOCK_EVENT"));
        if (intent == null)
            break MISSING_BLOCK_LABEL_77;
        BluetoothDevice bluetoothdevice1;
        if (intent.getIntExtra("android.intent.extra.DOCK_STATE", 0) == 0)
            break MISSING_BLOCK_LABEL_77;
        bluetoothdevice1 = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
        if (bluetoothdevice1 == null)
            break MISSING_BLOCK_LABEL_77;
        if (bluetoothdevice1.equals(bluetoothdevice))
            getCachedBluetoothDevice(bluetoothdevice1).connectProfile(localbluetoothprofile);
        DockEventReceiver.finishStartingService(this, i);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    private CharSequence[] initBtSettings(BluetoothDevice bluetoothdevice, int i, boolean flag)
    {
label0:
        {
            byte byte0;
            switch (i)
            {
            default:
                break label0;

            case 2: // '\002'
                byte0 = 2;
                break;

            case 1: // '\001'
            case 3: // '\003'
            case 4: // '\004'
                byte0 = 1;
                break;
            }
            mProfiles = new LocalBluetoothProfile[byte0];
            mCheckedItems = new boolean[byte0];
            CharSequence acharsequence[] = new CharSequence[byte0];
            switch (i)
            {
            case 2: // '\002'
                acharsequence[0] = getString(0x7f0b040e);
                acharsequence[1] = getString(0x7f0b040f);
                mProfiles[0] = mProfileManager.getHeadsetProfile();
                mProfiles[1] = mProfileManager.getA2dpProfile();
                if (flag)
                {
                    mCheckedItems[0] = true;
                    mCheckedItems[1] = true;
                    return acharsequence;
                } else
                {
                    mCheckedItems[0] = mProfiles[0].isPreferred(bluetoothdevice);
                    mCheckedItems[1] = mProfiles[1].isPreferred(bluetoothdevice);
                    return acharsequence;
                }

            case 1: // '\001'
            case 3: // '\003'
            case 4: // '\004'
                acharsequence[0] = getString(0x7f0b040f);
                mProfiles[0] = mProfileManager.getA2dpProfile();
                if (flag)
                {
                    mCheckedItems[0] = false;
                    return acharsequence;
                } else
                {
                    mCheckedItems[0] = mProfiles[0].isPreferred(bluetoothdevice);
                    return acharsequence;
                }
            }
            return acharsequence;
        }
        return null;
    }

    private boolean msgTypeDisableBluetooth(int i)
    {
        SharedPreferences sharedpreferences = getPrefs();
        if (mLocalAdapter.disable())
        {
            sharedpreferences.edit().remove("disable_bt_when_undock").apply();
            return false;
        } else
        {
            sharedpreferences.edit().putBoolean("disable_bt", true).apply();
            mPendingTurnOffStartId = i;
            return true;
        }
    }

    private boolean msgTypeDocked(final BluetoothDevice d, final int state, final int startId)
    {
        mServiceHandler.removeMessages(444);
        mServiceHandler.removeMessages(555);
        getPrefs().edit().remove("disable_bt").apply();
        if (d != null)
        {
            if (!d.equals(mDevice))
            {
                if (mDevice != null)
                    handleUndocked(mDevice);
                mDevice = d;
                mProfileManager.addServiceListener(this);
                if (mProfileManager.isManagerReady())
                {
                    handleDocked(d, state, startId);
                    mProfileManager.removeServiceListener(this);
                } else
                {
                    mRunnable = new Runnable() {

                        final DockService this$0;
                        final BluetoothDevice val$d;
                        final int val$startId;
                        final int val$state;

                        public void run()
                        {
                            handleDocked(d, state, startId);
                        }

            
            {
                this$0 = DockService.this;
                d = bluetoothdevice;
                state = i;
                startId = j;
                super();
            }
                    }
;
                    return true;
                }
            }
        } else
        if (android.provider.Settings.Global.getInt(getContentResolver(), "dock_audio_media_enabled", -1) == -1 && state == 3)
        {
            handleDocked(null, state, startId);
            return true;
        }
        return false;
    }

    private boolean msgTypeUndockedPermanent(BluetoothDevice bluetoothdevice, int i)
    {
label0:
        {
            handleUndocked(bluetoothdevice);
            if (bluetoothdevice != null)
            {
                SharedPreferences sharedpreferences = getPrefs();
                if (sharedpreferences.getBoolean("disable_bt_when_undock", false))
                {
                    if (!hasOtherConnectedDevices(bluetoothdevice))
                        break label0;
                    sharedpreferences.edit().remove("disable_bt_when_undock").apply();
                }
            }
            return false;
        }
        Message message = mServiceHandler.obtainMessage(555, 0, i, null);
        mServiceHandler.sendMessageDelayed(message, 2000L);
        return true;
    }

    private void msgTypeUndockedTemporary(BluetoothDevice bluetoothdevice, int i, int j)
    {
        Message message = mServiceHandler.obtainMessage(444, i, j, bluetoothdevice);
        mServiceHandler.sendMessageDelayed(message, 1000L);
    }

    private Message parseIntent(Intent intent)
    {
label0:
        {
            BluetoothDevice bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            int i = intent.getIntExtra("android.intent.extra.DOCK_STATE", -1234);
            char c;
            switch (i)
            {
            default:
                break label0;

            case 1: // '\001'
            case 2: // '\002'
            case 4: // '\004'
                if (bluetoothdevice == null)
                {
                    Log.w("DockService", "device is null");
                    return null;
                }
                // fall through

            case 3: // '\003'
                if ("com.android.settings.bluetooth.action.DOCK_SHOW_UI".equals(intent.getAction()))
                {
                    if (bluetoothdevice == null)
                    {
                        Log.w("DockService", "device is null");
                        return null;
                    }
                    c = 'o';
                } else
                {
                    c = '\336';
                }
                break;

            case 0: // '\0'
                c = '\u014D';
                break;
            }
            return mServiceHandler.obtainMessage(c, i, 0, bluetoothdevice);
        }
        return null;
    }

    private void processMessage(Message message)
    {
        this;
        JVM INSTR monitorenter ;
        int i;
        int j;
        int k;
        Object obj;
        i = message.what;
        j = message.arg1;
        k = message.arg2;
        obj = message.obj;
        BluetoothDevice bluetoothdevice = null;
        if (obj == null) goto _L2; else goto _L1
_L1:
        bluetoothdevice = (BluetoothDevice)message.obj;
          goto _L2
_L4:
        boolean flag;
        if (mDialog != null || mPendingDevice != null || i == 333 || flag)
            break MISSING_BLOCK_LABEL_77;
        DockEventReceiver.finishStartingService(this, k);
        this;
        JVM INSTR monitorexit ;
        return;
_L5:
        flag = false;
        if (bluetoothdevice == null) goto _L4; else goto _L3
_L3:
        createDialog(bluetoothdevice, j, k);
        flag = false;
          goto _L4
        Exception exception;
        exception;
        throw exception;
_L6:
        flag = msgTypeDocked(bluetoothdevice, j, k);
          goto _L4
_L8:
        flag = msgTypeUndockedPermanent(bluetoothdevice, k);
          goto _L4
_L7:
        msgTypeUndockedTemporary(bluetoothdevice, j, k);
        flag = false;
          goto _L4
_L9:
        boolean flag1 = msgTypeDisableBluetooth(k);
        flag = flag1;
          goto _L4
_L2:
        flag = false;
        i;
        JVM INSTR lookupswitch 5: default 45
    //                   111: 80
    //                   222: 109
    //                   333: 137
    //                   444: 124
    //                   555: 153;
           goto _L4 _L5 _L6 _L7 _L8 _L9
    }

    boolean hasOtherConnectedDevices(BluetoothDevice bluetoothdevice)
    {
        this;
        JVM INSTR monitorenter ;
        Collection collection;
        Set set;
        collection = mDeviceManager.getCachedDevicesCopy();
        set = mLocalAdapter.getBondedDevices();
        boolean flag = false;
        if (set == null) goto _L2; else goto _L1
_L1:
        flag = false;
        if (collection == null) goto _L2; else goto _L3
_L3:
        boolean flag1 = set.isEmpty();
        flag = false;
        if (!flag1) goto _L4; else goto _L2
_L2:
        this;
        JVM INSTR monitorexit ;
        return flag;
_L4:
        Iterator iterator = collection.iterator();
_L6:
        boolean flag2 = iterator.hasNext();
        flag = false;
        if (!flag2)
            continue; /* Loop/switch isn't completed */
        CachedBluetoothDevice cachedbluetoothdevice;
        BluetoothDevice bluetoothdevice1;
        cachedbluetoothdevice = (CachedBluetoothDevice)iterator.next();
        bluetoothdevice1 = cachedbluetoothdevice.getDevice();
        if (bluetoothdevice1.equals(bluetoothdevice) || !set.contains(bluetoothdevice1)) goto _L6; else goto _L5
_L5:
        boolean flag3 = cachedbluetoothdevice.isConnected();
        if (!flag3) goto _L6; else goto _L7
_L7:
        flag = true;
        if (true) goto _L2; else goto _L8
_L8:
        Exception exception;
        exception;
        throw exception;
    }

    public IBinder onBind(Intent intent)
    {
        return null;
    }

    public void onCreate()
    {
        LocalBluetoothManager localbluetoothmanager = LocalBluetoothManager.getInstance(this);
        if (localbluetoothmanager == null)
        {
            Log.e("DockService", "Can't get LocalBluetoothManager: exiting");
            return;
        }
        mLocalAdapter = localbluetoothmanager.getBluetoothAdapter();
        mDeviceManager = localbluetoothmanager.getCachedDeviceManager();
        mProfileManager = localbluetoothmanager.getProfileManager();
        if (mProfileManager == null)
        {
            Log.e("DockService", "Can't get LocalBluetoothProfileManager: exiting");
            return;
        } else
        {
            HandlerThread handlerthread = new HandlerThread("DockService");
            handlerthread.start();
            mServiceLooper = handlerthread.getLooper();
            mServiceHandler = new ServiceHandler(mServiceLooper);
            return;
        }
    }

    public void onDestroy()
    {
        mRunnable = null;
        if (mDialog != null)
        {
            mDialog.dismiss();
            mDialog = null;
        }
        if (mProfileManager != null)
            mProfileManager.removeServiceListener(this);
        if (mServiceLooper != null)
            mServiceLooper.quit();
        mLocalAdapter = null;
        mDeviceManager = null;
        mProfileManager = null;
        mServiceLooper = null;
        mServiceHandler = null;
    }

    public void onServiceConnected()
    {
        this;
        JVM INSTR monitorenter ;
        if (mRunnable != null)
        {
            mRunnable.run();
            mRunnable = null;
            mProfileManager.removeServiceListener(this);
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void onServiceDisconnected()
    {
    }

    public int onStartCommand(Intent intent, int i, int j)
    {
        SharedPreferences sharedpreferences;
label0:
        {
            if (intent == null)
            {
                DockEventReceiver.finishStartingService(this, j);
            } else
            {
                if ("android.bluetooth.adapter.action.STATE_CHANGED".equals(intent.getAction()))
                {
                    handleBtStateChange(intent, j);
                    return 2;
                }
                sharedpreferences = getPrefs();
                if ("android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED".equals(intent.getAction()))
                {
                    BluetoothDevice bluetoothdevice1 = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                    int l = sharedpreferences.getInt("connect_retry_count", 0);
                    if (l < 6)
                    {
                        sharedpreferences.edit().putInt("connect_retry_count", l + 1).apply();
                        handleUnexpectedDisconnect(bluetoothdevice1, mProfileManager.getHeadsetProfile(), j);
                        return 2;
                    }
                } else
                {
                    if (!"android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED".equals(intent.getAction()))
                        break label0;
                    BluetoothDevice bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                    int k = sharedpreferences.getInt("connect_retry_count", 0);
                    if (k < 6)
                    {
                        sharedpreferences.edit().putInt("connect_retry_count", k + 1).apply();
                        handleUnexpectedDisconnect(bluetoothdevice, mProfileManager.getA2dpProfile(), j);
                        return 2;
                    }
                }
            }
            return 2;
        }
        Message message = parseIntent(intent);
        if (message == null)
        {
            DockEventReceiver.finishStartingService(this, j);
            return 2;
        }
        if (message.what == 222)
            sharedpreferences.edit().remove("connect_retry_count").apply();
        message.arg2 = j;
        processMessage(message);
        return 2;
    }








}
