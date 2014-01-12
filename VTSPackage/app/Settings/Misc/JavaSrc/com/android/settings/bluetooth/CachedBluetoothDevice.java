// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import java.util.*;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothProfile, LocalBluetoothAdapter, LocalBluetoothProfileManager, PbapServerProfile, 
//            PanProfile

final class CachedBluetoothDevice
    implements Comparable
{
    public static interface Callback
    {

        public abstract void onDeviceAttributesChanged();
    }


    private static final boolean DEBUG = false;
    private static final long MAX_UUID_DELAY_FOR_AUTO_CONNECT = 5000L;
    static final int PHONEBOOK_ACCESS_ALLOWED = 1;
    static final int PHONEBOOK_ACCESS_REJECTED = 2;
    static final int PHONEBOOK_ACCESS_UNKNOWN = 0;
    private static final String PHONEBOOK_PREFS_NAME = "bluetooth_phonebook_permission";
    private static final String TAG = "CachedBluetoothDevice";
    private BluetoothClass mBtClass;
    private final Collection mCallbacks = new ArrayList();
    private boolean mConnectAfterPairing;
    private long mConnectAttempted;
    private final Context mContext;
    private final BluetoothDevice mDevice;
    private boolean mIsConnectingErrorPossible;
    private final LocalBluetoothAdapter mLocalAdapter;
    private boolean mLocalNapRoleConnected;
    private String mName;
    private int mPhonebookPermissionChoice;
    private HashMap mProfileConnectionState;
    private final LocalBluetoothProfileManager mProfileManager;
    private final List mProfiles = new ArrayList();
    private final List mRemovedProfiles = new ArrayList();
    private short mRssi;
    private boolean mVisible;

    CachedBluetoothDevice(Context context, LocalBluetoothAdapter localbluetoothadapter, LocalBluetoothProfileManager localbluetoothprofilemanager, BluetoothDevice bluetoothdevice)
    {
        mContext = context;
        mLocalAdapter = localbluetoothadapter;
        mProfileManager = localbluetoothprofilemanager;
        mDevice = bluetoothdevice;
        mProfileConnectionState = new HashMap();
        fillData();
    }

    private void connectAutoConnectableProfiles()
    {
        if (ensurePaired())
        {
            mIsConnectingErrorPossible = true;
            Iterator iterator = mProfiles.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                LocalBluetoothProfile localbluetoothprofile = (LocalBluetoothProfile)iterator.next();
                if (localbluetoothprofile.isAutoConnectable())
                {
                    localbluetoothprofile.setPreferred(mDevice, true);
                    connectInt(localbluetoothprofile);
                }
            } while (true);
        }
    }

    private void connectWithoutResettingTimer(boolean flag)
    {
        if (mProfiles.isEmpty())
        {
            Log.d("CachedBluetoothDevice", "No profiles. Maybe we will connect later");
        } else
        {
            mIsConnectingErrorPossible = true;
            int i = 0;
            Iterator iterator = mProfiles.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                LocalBluetoothProfile localbluetoothprofile = (LocalBluetoothProfile)iterator.next();
                if ((flag ? localbluetoothprofile.isConnectable() : localbluetoothprofile.isAutoConnectable()) && localbluetoothprofile.isPreferred(mDevice))
                {
                    i++;
                    connectInt(localbluetoothprofile);
                }
            } while (true);
            if (i == 0)
            {
                connectAutoConnectableProfiles();
                return;
            }
        }
    }

    private String describe(LocalBluetoothProfile localbluetoothprofile)
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append("Address:").append(mDevice);
        if (localbluetoothprofile != null)
            stringbuilder.append(" Profile:").append(localbluetoothprofile);
        return stringbuilder.toString();
    }

    private void dispatchAttributesChanged()
    {
        Collection collection = mCallbacks;
        collection;
        JVM INSTR monitorenter ;
        for (Iterator iterator = mCallbacks.iterator(); iterator.hasNext(); ((Callback)iterator.next()).onDeviceAttributesChanged());
        break MISSING_BLOCK_LABEL_48;
        Exception exception;
        exception;
        collection;
        JVM INSTR monitorexit ;
        throw exception;
        collection;
        JVM INSTR monitorexit ;
    }

    private boolean ensurePaired()
    {
        if (getBondState() == 10)
        {
            startPairing();
            return false;
        } else
        {
            return true;
        }
    }

    private void fetchBtClass()
    {
        Log.d("CachedBluetoothDevice", "fetchClass");
        mBtClass = mDevice.getBluetoothClass();
        if (mBtClass == null)
        {
            Log.d("CachedBluetoothDevice", "mBtClass is null");
            return;
        } else
        {
            int i = mBtClass.getMajorDeviceClass();
            Log.d("CachedBluetoothDevice", (new StringBuilder()).append("mBtClass is ").append(i).toString());
            return;
        }
    }

    private void fetchName()
    {
        Log.d("CachedBluetoothDevice", "fetchName");
        mName = mDevice.getAliasName();
        Log.d("CachedBluetoothDevice", (new StringBuilder()).append("AlaisName ").append(mName).toString());
        if (TextUtils.isEmpty(mName))
            mName = mDevice.getAddress();
        Log.d("CachedBluetoothDevice", (new StringBuilder()).append("Return Name ").append(mName).toString());
    }

    private void fetchPhonebookPermissionChoice()
    {
        mPhonebookPermissionChoice = mContext.getSharedPreferences("bluetooth_phonebook_permission", 0).getInt(mDevice.getAddress(), 0);
    }

    private void fillData()
    {
        fetchName();
        fetchBtClass();
        updateProfiles();
        fetchPhonebookPermissionChoice();
        mVisible = false;
        dispatchAttributesChanged();
    }

    private boolean updateProfiles()
    {
        android.os.ParcelUuid aparceluuid[] = mDevice.getUuids();
        if (aparceluuid == null)
        {
            Log.d("CachedBluetoothDevice", "Bluetooth device get uuid is null");
            return false;
        }
        android.os.ParcelUuid aparceluuid1[] = mLocalAdapter.getUuids();
        if (aparceluuid1 == null)
        {
            Log.d("CachedBluetoothDevice", "Bluetooth Adapter get uuid is null");
            return false;
        } else
        {
            mProfileManager.updateProfiles(aparceluuid, aparceluuid1, mProfiles, mRemovedProfiles, mLocalNapRoleConnected);
            return true;
        }
    }

    public void clearProfileConnectionState()
    {
        Log.d("CachedBluetoothDevice", (new StringBuilder()).append(" Clearing all connection state for dev:").append(mDevice.getName()).toString());
        LocalBluetoothProfile localbluetoothprofile;
        for (Iterator iterator = getProfiles().iterator(); iterator.hasNext(); mProfileConnectionState.put(localbluetoothprofile, Integer.valueOf(0)))
            localbluetoothprofile = (LocalBluetoothProfile)iterator.next();

    }

    public int compareTo(CachedBluetoothDevice cachedbluetoothdevice)
    {
        int i = 1;
        int j;
        if (cachedbluetoothdevice.isConnected())
            j = i;
        else
            j = 0;
        int k;
        if (isConnected())
            k = i;
        else
            k = 0;
        int l = j - k;
        if (l != 0)
            return l;
        int i1;
        if (cachedbluetoothdevice.getBondState() == 12)
            i1 = i;
        else
            i1 = 0;
        int j1;
        if (getBondState() == 12)
            j1 = i;
        else
            j1 = 0;
        int k1 = i1 - j1;
        if (k1 != 0)
            return k1;
        int l1;
        if (cachedbluetoothdevice.mVisible)
            l1 = i;
        else
            l1 = 0;
        if (!mVisible)
            i = 0;
        int i2 = l1 - i;
        if (i2 != 0)
            return i2;
        int j2 = cachedbluetoothdevice.mRssi - mRssi;
        if (j2 != 0)
            return j2;
        else
            return mName.compareTo(cachedbluetoothdevice.mName);
    }

    public volatile int compareTo(Object obj)
    {
        return compareTo((CachedBluetoothDevice)obj);
    }

    void connect(boolean flag)
    {
        if (!ensurePaired())
        {
            return;
        } else
        {
            mConnectAttempted = SystemClock.elapsedRealtime();
            connectWithoutResettingTimer(flag);
            return;
        }
    }

    void connectInt(LocalBluetoothProfile localbluetoothprofile)
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag = ensurePaired();
        if (flag) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (!localbluetoothprofile.connect(mDevice))
            break MISSING_BLOCK_LABEL_65;
        Log.d("CachedBluetoothDevice", (new StringBuilder()).append("Command sent successfully:CONNECT ").append(describe(localbluetoothprofile)).toString());
          goto _L1
        Exception exception;
        exception;
        throw exception;
        Log.i("CachedBluetoothDevice", (new StringBuilder()).append("Failed to connect ").append(localbluetoothprofile.toString()).append(" to ").append(mName).toString());
          goto _L1
    }

    void connectProfile(LocalBluetoothProfile localbluetoothprofile)
    {
        mConnectAttempted = SystemClock.elapsedRealtime();
        mIsConnectingErrorPossible = true;
        connectInt(localbluetoothprofile);
        refresh();
    }

    void disconnect()
    {
        for (Iterator iterator = mProfiles.iterator(); iterator.hasNext(); disconnect((LocalBluetoothProfile)iterator.next()));
        PbapServerProfile pbapserverprofile = mProfileManager.getPbapProfile();
        if (pbapserverprofile.getConnectionStatus(mDevice) == 2)
            pbapserverprofile.disconnect(mDevice);
    }

    void disconnect(LocalBluetoothProfile localbluetoothprofile)
    {
        if (localbluetoothprofile.disconnect(mDevice))
            Log.d("CachedBluetoothDevice", (new StringBuilder()).append("Command sent successfully:DISCONNECT ").append(describe(localbluetoothprofile)).toString());
    }

    public boolean equals(Object obj)
    {
        if (obj != null && (obj instanceof CachedBluetoothDevice))
            return mDevice.equals(((CachedBluetoothDevice)obj).mDevice);
        else
            return false;
    }

    int getBondState()
    {
        return mDevice.getBondState();
    }

    BluetoothClass getBtClass()
    {
        return mBtClass;
    }

    List getConnectableProfiles()
    {
        Log.d("CachedBluetoothDevice", (new StringBuilder()).append("mprofile size :").append(mProfiles.size()).toString());
        ArrayList arraylist = new ArrayList();
        Iterator iterator = mProfiles.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            LocalBluetoothProfile localbluetoothprofile = (LocalBluetoothProfile)iterator.next();
            if (localbluetoothprofile.isConnectable())
                arraylist.add(localbluetoothprofile);
        } while (true);
        Log.d("CachedBluetoothDevice", (new StringBuilder()).append("Conectable profile size :").append(arraylist.size()).toString());
        return arraylist;
    }

    BluetoothDevice getDevice()
    {
        return mDevice;
    }

    String getName()
    {
        return mName;
    }

    int getPhonebookPermissionChoice()
    {
        return mPhonebookPermissionChoice;
    }

    int getProfileConnectionState(LocalBluetoothProfile localbluetoothprofile)
    {
        if (mProfileConnectionState == null || mProfileConnectionState.get(localbluetoothprofile) == null)
        {
            int i = localbluetoothprofile.getConnectionStatus(mDevice);
            mProfileConnectionState.put(localbluetoothprofile, Integer.valueOf(i));
            Log.d("CachedBluetoothDevice", (new StringBuilder()).append("getProfileConnectionState from binder call, state is ").append(i).toString());
        }
        Log.d("CachedBluetoothDevice", (new StringBuilder()).append("return the profile state from map ").append(mProfileConnectionState.get(localbluetoothprofile)).toString());
        return ((Integer)mProfileConnectionState.get(localbluetoothprofile)).intValue();
    }

    List getProfiles()
    {
        return Collections.unmodifiableList(mProfiles);
    }

    List getRemovedProfiles()
    {
        return mRemovedProfiles;
    }

    public int hashCode()
    {
        return mDevice.getAddress().hashCode();
    }

    boolean isBusy()
    {
label0:
        {
            for (Iterator iterator = mProfiles.iterator(); iterator.hasNext();)
            {
                int i = getProfileConnectionState((LocalBluetoothProfile)iterator.next());
                if (i == 1 || i == 3)
                    break label0;
            }

            if (getBondState() != 11)
                return false;
        }
        return true;
    }

    boolean isConnected()
    {
        for (Iterator iterator = mProfiles.iterator(); iterator.hasNext();)
            if (getProfileConnectionState((LocalBluetoothProfile)iterator.next()) == 2)
                return true;

        return false;
    }

    boolean isConnectedProfile(LocalBluetoothProfile localbluetoothprofile)
    {
        return getProfileConnectionState(localbluetoothprofile) == 2;
    }

    boolean isUserInitiatedPairing()
    {
        return mConnectAfterPairing;
    }

    boolean isVisible()
    {
        return mVisible;
    }

    void onBondingDockConnect()
    {
        connect(false);
    }

    void onBondingStateChanged(int i)
    {
        if (i == 10)
        {
            mProfiles.clear();
            mConnectAfterPairing = false;
            setPhonebookPermissionChoice(0);
        }
        Log.d("CachedBluetoothDevice", "onBondingStateChanged : refresh");
        refresh();
        if (i == 12)
        {
            Log.d("CachedBluetoothDevice", "Bond state changed to bonded");
            if (mProfileManager != null)
            {
                android.os.ParcelUuid aparceluuid[] = mLocalAdapter.getUuids();
                Log.d("CachedBluetoothDevice", (new StringBuilder()).append("getLocalAdapterUuid").append(aparceluuid).toString());
                if (aparceluuid != null)
                {
                    Log.d("CachedBluetoothDevice", "update LocalBluetoothProfileManager");
                    mProfileManager.updateLocalProfiles(aparceluuid);
                }
            }
            if (mDevice.isBluetoothDock())
                onBondingDockConnect();
            else
            if (mConnectAfterPairing)
                connect(false);
            mConnectAfterPairing = false;
        }
    }

    void onProfileStateChanged(LocalBluetoothProfile localbluetoothprofile, int i)
    {
        Log.d("CachedBluetoothDevice", (new StringBuilder()).append("onProfileStateChanged: profile ").append(localbluetoothprofile).append(" newProfileState ").append(i).toString());
        if (mLocalAdapter.getBluetoothState() == 13)
        {
            Log.d("CachedBluetoothDevice", " BT Turninig Off...Profile conn state change ignored...");
            return;
        }
        mProfileConnectionState.put(localbluetoothprofile, Integer.valueOf(i));
        if (i == 2)
        {
            if (!mProfiles.contains(localbluetoothprofile))
            {
                mRemovedProfiles.remove(localbluetoothprofile);
                mProfiles.add(localbluetoothprofile);
                if ((localbluetoothprofile instanceof PanProfile) && ((PanProfile)localbluetoothprofile).isLocalRoleNap(mDevice))
                    mLocalNapRoleConnected = true;
            }
        } else
        if (mLocalNapRoleConnected && (localbluetoothprofile instanceof PanProfile) && ((PanProfile)localbluetoothprofile).isLocalRoleNap(mDevice) && i == 0)
        {
            Log.d("CachedBluetoothDevice", "Removing PanProfile from device after NAP disconnect");
            mProfiles.remove(localbluetoothprofile);
            mRemovedProfiles.add(localbluetoothprofile);
            mLocalNapRoleConnected = false;
        }
        Log.d("CachedBluetoothDevice", "refresh");
        refresh();
    }

    void onUuidChanged()
    {
        updateProfiles();
        if (!mProfiles.isEmpty() && 5000L + mConnectAttempted > SystemClock.elapsedRealtime())
            connectWithoutResettingTimer(false);
        dispatchAttributesChanged();
    }

    void refresh()
    {
        dispatchAttributesChanged();
    }

    void refreshBtClass()
    {
        fetchBtClass();
        dispatchAttributesChanged();
    }

    void refreshName()
    {
        fetchName();
        dispatchAttributesChanged();
    }

    void registerCallback(Callback callback)
    {
        synchronized (mCallbacks)
        {
            mCallbacks.add(callback);
        }
        return;
        exception;
        collection;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void setBtClass(BluetoothClass bluetoothclass)
    {
        if (bluetoothclass != null && mBtClass != bluetoothclass)
        {
            mBtClass = bluetoothclass;
            dispatchAttributesChanged();
        }
    }

    void setName(String s)
    {
        if (!mName.equals(s))
        {
            if (TextUtils.isEmpty(s))
            {
                mName = mDevice.getAddress();
            } else
            {
                mName = s;
                mDevice.setAlias(s);
            }
            dispatchAttributesChanged();
        }
    }

    void setPhonebookPermissionChoice(int i)
    {
        android.content.SharedPreferences.Editor editor = mContext.getSharedPreferences("bluetooth_phonebook_permission", 0).edit();
        if (i == 0)
            editor.remove(mDevice.getAddress());
        else
            editor.putInt(mDevice.getAddress(), i);
        editor.commit();
        mPhonebookPermissionChoice = i;
    }

    void setRssi(short word0)
    {
        if (mRssi != word0)
        {
            mRssi = word0;
            dispatchAttributesChanged();
        }
    }

    void setVisible(boolean flag)
    {
        if (mVisible != flag)
        {
            mVisible = flag;
            dispatchAttributesChanged();
        }
    }

    boolean startPairing()
    {
        if (mLocalAdapter.isDiscovering())
            mLocalAdapter.cancelDiscovery();
        if (!mDevice.createBond())
        {
            return false;
        } else
        {
            mConnectAfterPairing = true;
            return true;
        }
    }

    public String toString()
    {
        return mDevice.toString();
    }

    void unpair()
    {
        int i = getBondState();
        if (i == 11)
            mDevice.cancelBondProcess();
        if (i != 10)
        {
            BluetoothDevice bluetoothdevice = mDevice;
            if (bluetoothdevice != null && bluetoothdevice.removeBond())
                Log.d("CachedBluetoothDevice", (new StringBuilder()).append("Command sent successfully:REMOVE_BOND ").append(describe(null)).toString());
        }
    }

    void unregisterCallback(Callback callback)
    {
        synchronized (mCallbacks)
        {
            mCallbacks.remove(callback);
        }
        return;
        exception;
        collection;
        JVM INSTR monitorexit ;
        throw exception;
    }
}
