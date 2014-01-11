// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.content.Context;
import android.preference.PreferenceFragment;
import android.util.Log;

// Referenced classes of package com.android.settings.bluetooth:
//            CachedBluetoothDeviceManager, BluetoothEventManager, LocalBluetoothProfileManager, LocalBluetoothAdapter, 
//            BluetoothDiscoverableEnabler

public final class LocalBluetoothManager
{

    private static final String TAG = "LocalBluetoothManager";
    private static LocalBluetoothManager sInstance;
    private final CachedBluetoothDeviceManager mCachedDeviceManager;
    private final Context mContext;
    private BluetoothDiscoverableEnabler mDiscoverableEnabler;
    private final BluetoothEventManager mEventManager;
    private PreferenceFragment mForegroundActivity;
    private final LocalBluetoothAdapter mLocalAdapter;
    private final LocalBluetoothProfileManager mProfileManager;

    private LocalBluetoothManager(LocalBluetoothAdapter localbluetoothadapter, Context context)
    {
        mContext = context;
        mLocalAdapter = localbluetoothadapter;
        mCachedDeviceManager = new CachedBluetoothDeviceManager(context);
        mEventManager = new BluetoothEventManager(mLocalAdapter, mCachedDeviceManager, context);
        mProfileManager = new LocalBluetoothProfileManager(context, mLocalAdapter, mCachedDeviceManager, mEventManager);
    }

    public static LocalBluetoothManager getInstance(Context context)
    {
        com/android/settings/bluetooth/LocalBluetoothManager;
        JVM INSTR monitorenter ;
        if (sInstance != null) goto _L2; else goto _L1
_L1:
        LocalBluetoothAdapter localbluetoothadapter = LocalBluetoothAdapter.getInstance();
        if (localbluetoothadapter != null) goto _L4; else goto _L3
_L3:
        LocalBluetoothManager localbluetoothmanager = null;
_L6:
        com/android/settings/bluetooth/LocalBluetoothManager;
        JVM INSTR monitorexit ;
        return localbluetoothmanager;
_L4:
        sInstance = new LocalBluetoothManager(localbluetoothadapter, context.getApplicationContext());
_L2:
        localbluetoothmanager = sInstance;
        if (true) goto _L6; else goto _L5
_L5:
        Exception exception;
        exception;
        throw exception;
    }

    public LocalBluetoothAdapter getBluetoothAdapter()
    {
        return mLocalAdapter;
    }

    CachedBluetoothDeviceManager getCachedDeviceManager()
    {
        return mCachedDeviceManager;
    }

    public Context getContext()
    {
        return mContext;
    }

    public BluetoothDiscoverableEnabler getDiscoverableEnabler()
    {
        return mDiscoverableEnabler;
    }

    BluetoothEventManager getEventManager()
    {
        return mEventManager;
    }

    public PreferenceFragment getForegroundActivity()
    {
        return mForegroundActivity;
    }

    LocalBluetoothProfileManager getProfileManager()
    {
        return mProfileManager;
    }

    boolean isForegroundActivity()
    {
        return mForegroundActivity != null;
    }

    public void setDiscoverableEnabler(BluetoothDiscoverableEnabler bluetoothdiscoverableenabler)
    {
        mDiscoverableEnabler = bluetoothdiscoverableenabler;
    }

    void setForegroundActivity(PreferenceFragment preferencefragment)
    {
        this;
        JVM INSTR monitorenter ;
        if (preferencefragment == null) goto _L2; else goto _L1
_L1:
        Log.d("LocalBluetoothManager", "setting foreground activity to non-null context");
        mForegroundActivity = preferencefragment;
_L4:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (mForegroundActivity == null) goto _L4; else goto _L3
_L3:
        Log.d("LocalBluetoothManager", "setting foreground activity to null");
        mForegroundActivity = null;
          goto _L4
        Exception exception;
        exception;
        throw exception;
    }
}
