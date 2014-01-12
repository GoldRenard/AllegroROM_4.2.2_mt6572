// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.bluetooth.*;
import android.os.ParcelUuid;
import android.util.Log;

// Referenced classes of package com.android.settings.bluetooth:
//            A2dpProfile, HeadsetProfile, LocalBluetoothProfileManager

final class BluetoothDeviceFilter
{
    private static final class AllFilter
        implements Filter
    {

        public boolean matches(BluetoothDevice bluetoothdevice)
        {
            return true;
        }

        private AllFilter()
        {
        }

    }

    private static final class AudioFilter extends ClassUuidFilter
    {

        boolean matches(ParcelUuid aparceluuid[], BluetoothClass bluetoothclass)
        {
label0:
            {
                if (aparceluuid != null)
                {
                    if (BluetoothUuid.containsAnyUuid(aparceluuid, A2dpProfile.SINK_UUIDS) || BluetoothUuid.containsAnyUuid(aparceluuid, HeadsetProfile.UUIDS))
                        break label0;
                } else
                if (bluetoothclass != null)
                {
                    if (bluetoothclass.doesClassMatch(1))
                        break label0;
                    if (bluetoothclass.doesClassMatch(0))
                        return true;
                }
                return false;
            }
            return true;
        }

        private AudioFilter()
        {
        }

    }

    private static final class BIPFilter extends ClassUuidFilter
    {

        boolean matches(ParcelUuid aparceluuid[], BluetoothClass bluetoothclass)
        {
            return aparceluuid != null && BluetoothUuid.containsAnyUuid(aparceluuid, LocalBluetoothProfileManager.BIP_PROFILE_UUIDS) || bluetoothclass != null && bluetoothclass.doesClassMatch(6);
        }

        private BIPFilter()
        {
        }

    }

    private static final class BPPFilter extends ClassUuidFilter
    {

        boolean matches(ParcelUuid aparceluuid[], BluetoothClass bluetoothclass)
        {
            return aparceluuid != null && BluetoothUuid.containsAnyUuid(aparceluuid, LocalBluetoothProfileManager.BPP_PROFILE_UUIDS) || bluetoothclass != null && bluetoothclass.doesClassMatch(6);
        }

        private BPPFilter()
        {
        }

    }

    private static final class BondedDeviceFilter
        implements Filter
    {

        public boolean matches(BluetoothDevice bluetoothdevice)
        {
            return bluetoothdevice.getBondState() == 12;
        }

        private BondedDeviceFilter()
        {
        }

    }

    private static abstract class ClassUuidFilter
        implements Filter
    {

        public boolean matches(BluetoothDevice bluetoothdevice)
        {
            return matches(bluetoothdevice.getUuids(), bluetoothdevice.getBluetoothClass());
        }

        abstract boolean matches(ParcelUuid aparceluuid[], BluetoothClass bluetoothclass);

        private ClassUuidFilter()
        {
        }

    }

    static interface Filter
    {

        public abstract boolean matches(BluetoothDevice bluetoothdevice);
    }

    private static final class HidFilter extends ClassUuidFilter
    {

        boolean matches(ParcelUuid aparceluuid[], BluetoothClass bluetoothclass)
        {
            return aparceluuid != null && BluetoothUuid.containsAnyUuid(aparceluuid, LocalBluetoothProfileManager.HID_PROFILE_UUIDS) || bluetoothclass != null && bluetoothclass.doesClassMatch(3);
        }

        private HidFilter()
        {
        }

    }

    private static final class NapFilter extends ClassUuidFilter
    {

        boolean matches(ParcelUuid aparceluuid[], BluetoothClass bluetoothclass)
        {
            return aparceluuid != null && BluetoothUuid.isUuidPresent(aparceluuid, BluetoothUuid.NAP) || bluetoothclass != null && bluetoothclass.doesClassMatch(5);
        }

        private NapFilter()
        {
        }

    }

    private static final class PanuFilter extends ClassUuidFilter
    {

        boolean matches(ParcelUuid aparceluuid[], BluetoothClass bluetoothclass)
        {
            return aparceluuid != null && BluetoothUuid.isUuidPresent(aparceluuid, BluetoothUuid.PANU) || bluetoothclass != null && bluetoothclass.doesClassMatch(4);
        }

        private PanuFilter()
        {
        }

    }

    private static final class PrxmFilter extends ClassUuidFilter
    {

        boolean matches(ParcelUuid aparceluuid[], BluetoothClass bluetoothclass)
        {
            return aparceluuid != null && BluetoothUuid.containsAnyUuid(aparceluuid, LocalBluetoothProfileManager.PRX_PROFILE_UUIDS);
        }

        private PrxmFilter()
        {
        }

    }

    private static final class TransferFilter extends ClassUuidFilter
    {

        boolean matches(ParcelUuid aparceluuid[], BluetoothClass bluetoothclass)
        {
            return aparceluuid != null && BluetoothUuid.isUuidPresent(aparceluuid, BluetoothUuid.ObexObjectPush) || bluetoothclass != null && bluetoothclass.doesClassMatch(2);
        }

        private TransferFilter()
        {
        }

    }

    private static final class UnbondedDeviceFilter
        implements Filter
    {

        public boolean matches(BluetoothDevice bluetoothdevice)
        {
            return bluetoothdevice.getBondState() != 12;
        }

        private UnbondedDeviceFilter()
        {
        }

    }


    static final Filter ALL_FILTER;
    static final Filter BONDED_DEVICE_FILTER = new BondedDeviceFilter();
    private static final Filter FILTERS[];
    private static final String TAG = "BluetoothDeviceFilter";
    static final Filter UNBONDED_DEVICE_FILTER = new UnbondedDeviceFilter();

    private BluetoothDeviceFilter()
    {
    }

    static Filter getFilter(int i)
    {
        if (i >= 0 && i < FILTERS.length)
        {
            return FILTERS[i];
        } else
        {
            Log.w("BluetoothDeviceFilter", (new StringBuilder()).append("LENGTH=").append(FILTERS.length).toString());
            Log.w("BluetoothDeviceFilter", (new StringBuilder()).append("************ Invalid filter type **********: ").append(i).append(" for device picker").toString());
            return ALL_FILTER;
        }
    }

    static 
    {
        ALL_FILTER = new AllFilter();
        Filter afilter[] = new Filter[9];
        afilter[0] = ALL_FILTER;
        afilter[1] = new AudioFilter();
        afilter[2] = new TransferFilter();
        afilter[3] = new PanuFilter();
        afilter[4] = new NapFilter();
        afilter[5] = new BPPFilter();
        afilter[6] = new BIPFilter();
        afilter[7] = new HidFilter();
        afilter[8] = new PrxmFilter();
        FILTERS = afilter;
    }
}
