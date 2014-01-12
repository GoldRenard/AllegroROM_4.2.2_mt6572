// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothUuid;
import android.content.Context;
import android.content.Intent;
import android.os.ParcelUuid;
import android.util.Log;
import com.mediatek.bluetooth.BluetoothUuidEx;
import java.util.*;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothAdapter, BluetoothEventManager, LocalBluetoothProfile, HidProfile, 
//            PanProfile, PbapServerProfile, FtpProfile, A2dpProfile, 
//            HeadsetProfile, OppProfile, CachedBluetoothDeviceManager, CachedBluetoothDevice

final class LocalBluetoothProfileManager
{
    private class PanStateChangedHandler extends StateChangedHandler
    {

        final LocalBluetoothProfileManager this$0;

        public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothdevice)
        {
            ((PanProfile)super.mProfile).setLocalRole(bluetoothdevice, intent.getIntExtra("android.bluetooth.pan.extra.LOCAL_ROLE", 0));
            super.onReceive(context, intent, bluetoothdevice);
        }

        PanStateChangedHandler(LocalBluetoothProfile localbluetoothprofile)
        {
            this$0 = LocalBluetoothProfileManager.this;
            super(localbluetoothprofile);
        }
    }

    public static interface ServiceListener
    {

        public abstract void onServiceConnected();

        public abstract void onServiceDisconnected();
    }

    private class StateChangedHandler
        implements BluetoothEventManager.Handler
    {

        final LocalBluetoothProfile mProfile;
        final LocalBluetoothProfileManager this$0;

        public void onReceive(Context context, Intent intent, BluetoothDevice bluetoothdevice)
        {
            CachedBluetoothDevice cachedbluetoothdevice = mDeviceManager.findDevice(bluetoothdevice);
            if (cachedbluetoothdevice == null)
            {
                Log.w("LocalBluetoothProfileManager", (new StringBuilder()).append("StateChangedHandler found new device: ").append(bluetoothdevice).toString());
                cachedbluetoothdevice = mDeviceManager.addDevice(mLocalAdapter, LocalBluetoothProfileManager.this, bluetoothdevice);
            }
            int i = intent.getIntExtra("android.bluetooth.profile.extra.STATE", 0);
            int j = intent.getIntExtra("android.bluetooth.profile.extra.PREVIOUS_STATE", 0);
            if (i == 0 && j == 1)
                Log.i("LocalBluetoothProfileManager", (new StringBuilder()).append("Failed to connect ").append(mProfile).append(" device").toString());
            cachedbluetoothdevice.onProfileStateChanged(mProfile, i);
            cachedbluetoothdevice.refresh();
        }

        StateChangedHandler(LocalBluetoothProfile localbluetoothprofile)
        {
            this$0 = LocalBluetoothProfileManager.this;
            super();
            mProfile = localbluetoothprofile;
        }
    }


    static final ParcelUuid BIP_PROFILE_UUIDS[];
    static final ParcelUuid BPP_PROFILE_UUIDS[];
    static final ParcelUuid HID_PROFILE_UUIDS[];
    static final ParcelUuid PRX_PROFILE_UUIDS[];
    private static final String TAG = "LocalBluetoothProfileManager";
    private static LocalBluetoothProfileManager sInstance;
    private A2dpProfile mA2dpProfile;
    private final Context mContext;
    private final CachedBluetoothDeviceManager mDeviceManager;
    private final BluetoothEventManager mEventManager;
    private FtpProfile mFtpProfile;
    private HeadsetProfile mHeadsetProfile;
    private HidProfile mHidProfile;
    private final LocalBluetoothAdapter mLocalAdapter;
    private OppProfile mOppProfile;
    private PanProfile mPanProfile;
    private PbapServerProfile mPbapProfile;
    private final Map mProfileNameMap = new HashMap();
    private final Collection mServiceListeners = new ArrayList();

    LocalBluetoothProfileManager(Context context, LocalBluetoothAdapter localbluetoothadapter, CachedBluetoothDeviceManager cachedbluetoothdevicemanager, BluetoothEventManager bluetootheventmanager)
    {
        mContext = context;
        mLocalAdapter = localbluetoothadapter;
        mDeviceManager = cachedbluetoothdevicemanager;
        mEventManager = bluetootheventmanager;
        mLocalAdapter.setProfileManager(this);
        mEventManager.setProfileManager(this);
        ParcelUuid aparceluuid[] = localbluetoothadapter.getUuids();
        if (aparceluuid != null)
        {
            Log.d("LocalBluetoothProfileManager", "adapter uuid is not null");
            int i = aparceluuid.length;
            for (int j = 0; j < i; j++)
            {
                ParcelUuid parceluuid = aparceluuid[j];
                Log.v("LocalBluetoothProfileManager", (new StringBuilder()).append("  ").append(parceluuid).toString());
            }

            updateLocalProfiles(aparceluuid);
        }
        Log.d("LocalBluetoothProfileManager", "LocalBluetoothProfileManager construction complete");
    }

    private void addPanProfile(LocalBluetoothProfile localbluetoothprofile, String s, String s1)
    {
        mEventManager.addProfileHandler(s1, new PanStateChangedHandler(localbluetoothprofile));
        mProfileNameMap.put(s, localbluetoothprofile);
    }

    private void addProfile(LocalBluetoothProfile localbluetoothprofile, String s, String s1)
    {
        mEventManager.addProfileHandler(s1, new StateChangedHandler(localbluetoothprofile));
        mProfileNameMap.put(s, localbluetoothprofile);
    }

    void addServiceListener(ServiceListener servicelistener)
    {
        mServiceListeners.add(servicelistener);
    }

    void callServiceConnectedListeners()
    {
        for (Iterator iterator = mServiceListeners.iterator(); iterator.hasNext(); ((ServiceListener)iterator.next()).onServiceConnected());
    }

    void callServiceDisconnectedListeners()
    {
        for (Iterator iterator = mServiceListeners.iterator(); iterator.hasNext(); ((ServiceListener)iterator.next()).onServiceDisconnected());
    }

    A2dpProfile getA2dpProfile()
    {
        return mA2dpProfile;
    }

    HeadsetProfile getHeadsetProfile()
    {
        return mHeadsetProfile;
    }

    PbapServerProfile getPbapProfile()
    {
        return mPbapProfile;
    }

    LocalBluetoothProfile getProfileByName(String s)
    {
        return (LocalBluetoothProfile)mProfileNameMap.get(s);
    }

    public boolean isManagerReady()
    {
        this;
        JVM INSTR monitorenter ;
        HeadsetProfile headsetprofile = mHeadsetProfile;
        if (headsetprofile == null) goto _L2; else goto _L1
_L1:
        boolean flag = headsetprofile.isProfileReady();
        boolean flag1 = flag;
_L4:
        this;
        JVM INSTR monitorexit ;
        return flag1;
_L2:
        A2dpProfile a2dpprofile = mA2dpProfile;
        if (a2dpprofile == null)
            break MISSING_BLOCK_LABEL_53;
        boolean flag2 = a2dpprofile.isProfileReady();
        flag1 = flag2;
        continue; /* Loop/switch isn't completed */
        flag1 = false;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    void removeServiceListener(ServiceListener servicelistener)
    {
        mServiceListeners.remove(servicelistener);
    }

    void setBluetoothStateOn()
    {
        if (mHidProfile == null)
        {
            mHidProfile = new HidProfile(mContext, mLocalAdapter, mDeviceManager, this);
            addProfile(mHidProfile, "HID", "android.bluetooth.input.profile.action.CONNECTION_STATE_CHANGED");
        }
        if (mPanProfile == null)
        {
            mPanProfile = new PanProfile(mContext);
            addPanProfile(mPanProfile, "PAN", "android.bluetooth.pan.profile.action.CONNECTION_STATE_CHANGED");
        }
        if (mPbapProfile == null)
            mPbapProfile = new PbapServerProfile(mContext);
        if (mFtpProfile == null)
        {
            mFtpProfile = new FtpProfile(mContext);
            addProfile(mFtpProfile, "FTP", "android.bluetooth.ftp.action.STATE_CHANGED");
        }
        ParcelUuid aparceluuid[] = mLocalAdapter.getUuids();
        if (aparceluuid != null)
            updateLocalProfiles(aparceluuid);
        mEventManager.readPairedDevices();
    }

    void updateLocalProfiles(ParcelUuid aparceluuid[])
    {
        if (BluetoothUuid.isUuidPresent(aparceluuid, BluetoothUuid.AudioSource))
        {
            if (mA2dpProfile == null)
            {
                Log.d("LocalBluetoothProfileManager", "Adding local A2DP profile");
                mA2dpProfile = new A2dpProfile(mContext, this);
                addProfile(mA2dpProfile, "A2DP", "android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED");
            }
        } else
        if (mA2dpProfile != null)
            Log.w("LocalBluetoothProfileManager", "Warning: A2DP profile was previously added but the UUID is now missing.");
        if (!BluetoothUuid.isUuidPresent(aparceluuid, BluetoothUuid.Handsfree_AG) && !BluetoothUuid.isUuidPresent(aparceluuid, BluetoothUuid.HSP_AG))
        {
            if (mHeadsetProfile != null)
                Log.w("LocalBluetoothProfileManager", "Warning: HEADSET profile was previously added but the UUID is now missing.");
        } else
        if (mHeadsetProfile == null)
        {
            Log.d("LocalBluetoothProfileManager", "Adding local HEADSET profile");
            mHeadsetProfile = new HeadsetProfile(mContext, mLocalAdapter, mDeviceManager, this);
            addProfile(mHeadsetProfile, "HEADSET", "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED");
        }
        if (BluetoothUuid.isUuidPresent(aparceluuid, BluetoothUuid.ObexObjectPush))
        {
            if (mOppProfile == null)
            {
                Log.d("LocalBluetoothProfileManager", "Adding local OPP profile");
                mOppProfile = new OppProfile();
                mProfileNameMap.put("OPP", mOppProfile);
            }
        } else
        if (mOppProfile != null)
            Log.w("LocalBluetoothProfileManager", "Warning: OPP profile was previously added but the UUID is now missing.");
        mEventManager.registerProfileIntentReceiver();
    }

    void updateProfiles(ParcelUuid aparceluuid[], ParcelUuid aparceluuid1[], Collection collection, Collection collection1, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        collection1.clear();
        collection1.addAll(collection);
        collection.clear();
        Log.d("LocalBluetoothProfileManager", "update profiles");
        if (aparceluuid != null) goto _L2; else goto _L1
_L1:
        Log.d("LocalBluetoothProfileManager", "uuid is null");
_L5:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        Log.d("LocalBluetoothProfileManager", "Before update mprofiles, updateLocalProfiles");
        if (aparceluuid1 == null)
            break MISSING_BLOCK_LABEL_67;
        updateLocalProfiles(aparceluuid1);
        if (mHeadsetProfile != null)
        {
            Log.d("LocalBluetoothProfileManager", "mHeadsetProfile is not null");
            if (BluetoothUuid.isUuidPresent(aparceluuid, BluetoothUuid.HSP) || BluetoothUuid.isUuidPresent(aparceluuid, BluetoothUuid.Handsfree))
            {
                collection.add(mHeadsetProfile);
                collection1.remove(mHeadsetProfile);
            }
        }
        if (BluetoothUuid.containsAnyUuid(aparceluuid, A2dpProfile.SINK_UUIDS) && mA2dpProfile != null)
        {
            Log.d("LocalBluetoothProfileManager", "A2dpProfile is not null");
            collection.add(mA2dpProfile);
            collection1.remove(mA2dpProfile);
        }
        if (BluetoothUuid.isUuidPresent(aparceluuid, BluetoothUuid.ObexObjectPush) && mOppProfile != null)
        {
            collection.add(mOppProfile);
            collection1.remove(mOppProfile);
        }
        if (BluetoothUuid.isUuidPresent(aparceluuid, BluetoothUuid.Hid) && mHidProfile != null)
        {
            collection.add(mHidProfile);
            collection1.remove(mHidProfile);
        }
        if (!flag) goto _L4; else goto _L3
_L3:
        Log.d("LocalBluetoothProfileManager", "Valid PAN-NAP connection exists.");
          goto _L4
_L6:
        collection.add(mPanProfile);
        collection1.remove(mPanProfile);
_L7:
        if (BluetoothUuid.containsAnyUuid(aparceluuid, FtpProfile.UUIDS) && mFtpProfile != null)
        {
            collection.add(mFtpProfile);
            collection1.remove(mFtpProfile);
        }
          goto _L5
        Exception exception;
        exception;
        throw exception;
_L4:
        if ((!BluetoothUuid.isUuidPresent(aparceluuid, BluetoothUuid.NAP) || !BluetoothUuid.isUuidPresent(aparceluuid1, BluetoothUuid.PANU) || mPanProfile == null) && !flag) goto _L7; else goto _L6
    }

    static 
    {
        ParcelUuid aparceluuid[] = new ParcelUuid[1];
        aparceluuid[0] = BluetoothUuidEx.BppReceiver;
        BPP_PROFILE_UUIDS = aparceluuid;
        ParcelUuid aparceluuid1[] = new ParcelUuid[1];
        aparceluuid1[0] = BluetoothUuidEx.BipResponder;
        BIP_PROFILE_UUIDS = aparceluuid1;
        ParcelUuid aparceluuid2[] = new ParcelUuid[1];
        aparceluuid2[0] = BluetoothUuid.Hid;
        HID_PROFILE_UUIDS = aparceluuid2;
        ParcelUuid aparceluuid3[] = new ParcelUuid[1];
        aparceluuid3[0] = BluetoothUuidEx.Proximity;
        PRX_PROFILE_UUIDS = aparceluuid3;
    }


}
