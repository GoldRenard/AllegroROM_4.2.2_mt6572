// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.app.Dialog;
import android.app.DialogFragment;
import android.content.DialogInterface;
import android.os.Bundle;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothManager, BluetoothDiscoverableEnabler

public final class BluetoothVisibilityTimeoutFragment extends DialogFragment
    implements android.content.DialogInterface.OnClickListener
{

    private final BluetoothDiscoverableEnabler mDiscoverableEnabler = LocalBluetoothManager.getInstance(getActivity()).getDiscoverableEnabler();


    public void onClick(DialogInterface dialoginterface, int i)
    {
        mDiscoverableEnabler.setDiscoverableTimeout(i);
        dismiss();
    }

    public Dialog onCreateDialog(Bundle bundle)
    {
        return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b02c3).setSingleChoiceItems(0x7f070018, mDiscoverableEnabler.getDiscoverableTimeoutIndex(), this).setNegativeButton(0x1040000, null).create();
    }
}
