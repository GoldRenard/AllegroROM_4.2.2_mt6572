// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.app.AlertDialog;
import android.bluetooth.BluetoothClass;
import android.content.Context;
import android.content.DialogInterface;
import android.preference.Preference;
import android.text.Html;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.widget.ImageView;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.android.settings.bluetooth:
//            CachedBluetoothDevice, Utils, HidProfile, LocalBluetoothProfile, 
//            A2dpProfile, HeadsetProfile

public final class BluetoothDevicePreference extends Preference
    implements CachedBluetoothDevice.Callback, android.view.View.OnClickListener
{

    private static final String TAG = "BluetoothDevicePreference";
    private static int sDimAlpha = 0x80000000;
    private final CachedBluetoothDevice mCachedDevice;
    private AlertDialog mDisconnectDialog;
    private android.view.View.OnClickListener mOnSettingsClickListener;

    public BluetoothDevicePreference(Context context, CachedBluetoothDevice cachedbluetoothdevice)
    {
        super(context);
        if (sDimAlpha == 0x80000000)
        {
            TypedValue typedvalue = new TypedValue();
            context.getTheme().resolveAttribute(0x1010033, typedvalue, true);
            sDimAlpha = (int)(255F * typedvalue.getFloat());
        }
        mCachedDevice = cachedbluetoothdevice;
        if (cachedbluetoothdevice.getBondState() == 12)
            setWidgetLayoutResource(0x7f04005d);
        mCachedDevice.registerCallback(this);
        onDeviceAttributesChanged();
    }

    private void askDisconnect()
    {
        Context context = getContext();
        String s = mCachedDevice.getName();
        if (TextUtils.isEmpty(s))
            s = context.getString(0x7f0b02db);
        String s1 = context.getString(0x7f0b02cf, new Object[] {
            s
        });
        String s2 = context.getString(0x7f0b02ce);
        android.content.DialogInterface.OnClickListener onclicklistener = new android.content.DialogInterface.OnClickListener() {

            final BluetoothDevicePreference this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                mCachedDevice.disconnect();
            }

            
            {
                this$0 = BluetoothDevicePreference.this;
                super();
            }
        }
;
        mDisconnectDialog = Utils.showDisconnectDialog(context, mDisconnectDialog, onclicklistener, s2, Html.fromHtml(s1));
    }

    private int getBtClassDrawable()
    {
        BluetoothClass bluetoothclass = mCachedDevice.getBtClass();
        if (bluetoothclass != null)
        {
            int j = bluetoothclass.getMajorDeviceClass();
            switch (bluetoothclass.getMajorDeviceClass())
            {
            case 1536: 
                return 0x7f020056;

            case 1280: 
                return HidProfile.getHidClassDrawable(bluetoothclass);

            case 512: 
                return 0x7f020052;

            case 256: 
                return 0x7f020058;

            default:
                Log.d("BluetoothDevicePreference", (new StringBuilder()).append("unrecognized device class ").append(j).toString());
                break;
            }
        } else
        {
            Log.d("BluetoothDevicePreference", "mBtClass is null");
        }
        for (Iterator iterator = mCachedDevice.getProfiles().iterator(); iterator.hasNext();)
        {
            int i = ((LocalBluetoothProfile)iterator.next()).getDrawableResource(bluetoothclass);
            if (i != 0)
                return i;
        }

        if (bluetoothclass != null)
        {
            if (bluetoothclass.doesClassMatch(1))
                return 0x7f020054;
            if (bluetoothclass.doesClassMatch(0))
                return 0x7f020055;
        }
        return 0;
    }

    private int getConnectionSummary()
    {
        CachedBluetoothDevice cachedbluetoothdevice;
        boolean flag;
        boolean flag1;
        boolean flag2;
        Iterator iterator;
        cachedbluetoothdevice = mCachedDevice;
        Log.d("BluetoothDevicePreference", "getConnectionSummary");
        flag = false;
        flag1 = false;
        flag2 = false;
        iterator = cachedbluetoothdevice.getProfiles().iterator();
_L6:
        LocalBluetoothProfile localbluetoothprofile;
        int i;
        if (!iterator.hasNext())
            break; /* Loop/switch isn't completed */
        localbluetoothprofile = (LocalBluetoothProfile)iterator.next();
        if (localbluetoothprofile != null)
            Log.d("BluetoothDevicePreference", (new StringBuilder()).append("profile name is ").append(localbluetoothprofile.toString()).toString());
        i = cachedbluetoothdevice.getProfileConnectionState(localbluetoothprofile);
        Log.d("BluetoothDevicePreference", (new StringBuilder()).append("profile connection state is ").append(i).toString());
        i;
        JVM INSTR tableswitch 0 3: default 243
    //                   0 175
    //                   1 169
    //                   2 156
    //                   3 169;
           goto _L1 _L2 _L3 _L4 _L3
_L1:
        continue; /* Loop/switch isn't completed */
_L4:
        Log.d("BluetoothDevicePreference", "profileConnected = true");
        flag = true;
        continue; /* Loop/switch isn't completed */
_L3:
        return Utils.getConnectionStateSummary(i);
_L2:
        if (localbluetoothprofile.isProfileReady() && localbluetoothprofile.isPreferred(cachedbluetoothdevice.getDevice()))
            if (localbluetoothprofile instanceof A2dpProfile)
            {
                Log.d("BluetoothDevicePreference", "a2dpNotConnected = true");
                flag1 = true;
            } else
            if (localbluetoothprofile instanceof HeadsetProfile)
            {
                Log.d("BluetoothDevicePreference", "headsetNotConnected = true");
                flag2 = true;
            }
        if (true) goto _L6; else goto _L5
_L5:
        if (flag)
        {
            if (flag1 && flag2)
                return 0x7f0b02d5;
            if (flag1)
                return 0x7f0b02d4;
            return !flag2 ? 0x7f0b02d2 : 0x7f0b02d3;
        }
        switch (cachedbluetoothdevice.getBondState())
        {
        case 11: // '\013'
            return 0x7f0b02da;
        }
        return 0;
    }

    private void pair()
    {
        if (!mCachedDevice.startPairing())
            Utils.showError(getContext(), mCachedDevice.getName(), 0x7f0b03da);
    }

    public int compareTo(Preference preference)
    {
        if (!(preference instanceof BluetoothDevicePreference))
            return super.compareTo(preference);
        else
            return mCachedDevice.compareTo(((BluetoothDevicePreference)preference).mCachedDevice);
    }

    public volatile int compareTo(Object obj)
    {
        return compareTo((Preference)obj);
    }

    public boolean equals(Object obj)
    {
        if (obj != null && (obj instanceof BluetoothDevicePreference))
            return mCachedDevice.equals(((BluetoothDevicePreference)obj).mCachedDevice);
        else
            return false;
    }

    CachedBluetoothDevice getCachedDevice()
    {
        return mCachedDevice;
    }

    public int hashCode()
    {
        return mCachedDevice.hashCode();
    }

    protected void onBindView(View view)
    {
        if (findPreferenceInHierarchy("bt_checkbox") != null)
            setDependency("bt_checkbox");
        if (mCachedDevice.getBondState() == 12)
        {
            ImageView imageview = (ImageView)view.findViewById(0x7f08000c);
            if (imageview != null)
            {
                imageview.setOnClickListener(this);
                imageview.setTag(mCachedDevice);
                int i;
                if (isEnabled())
                    i = 255;
                else
                    i = sDimAlpha;
                imageview.setAlpha(i);
            }
        }
        super.onBindView(view);
    }

    public void onClick(View view)
    {
        if (mOnSettingsClickListener != null)
            mOnSettingsClickListener.onClick(view);
    }

    void onClicked()
    {
        int i = mCachedDevice.getBondState();
        if (mCachedDevice.isConnected())
        {
            askDisconnect();
        } else
        {
            if (i == 12)
            {
                Log.d("BluetoothDevicePreference", "connect");
                mCachedDevice.connect(true);
                return;
            }
            if (i == 10)
            {
                pair();
                return;
            }
        }
    }

    public void onDeviceAttributesChanged()
    {
        Log.d("BluetoothDevicePreference", (new StringBuilder()).append(mCachedDevice.getName()).append(" onDeviceAttributesChanged").toString());
        setTitle(mCachedDevice.getName());
        int i = getConnectionSummary();
        if (i != 0)
            setSummary(i);
        else
            setSummary(null);
        int j = getBtClassDrawable();
        if (j != 0)
            setIcon(j);
        boolean flag;
        if (!mCachedDevice.isBusy())
            flag = true;
        else
            flag = false;
        setEnabled(flag);
        notifyHierarchyChanged();
    }

    protected void onPrepareForRemoval()
    {
        super.onPrepareForRemoval();
        Log.d("BluetoothDevicePreference", "onPrepareForRemoval");
        mCachedDevice.unregisterCallback(this);
        if (mDisconnectDialog != null)
        {
            Log.d("BluetoothDevicePreference", "dismiss dialog");
            mDisconnectDialog.dismiss();
            mDisconnectDialog = null;
        }
    }

    public void setOnSettingsClickListener(android.view.View.OnClickListener onclicklistener)
    {
        mOnSettingsClickListener = onclicklistener;
    }


}
