// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.adp;

import com.mediatek.bluetooth.share.BluetoothShareTask;

public interface OppTaskHandler
{

    public abstract void afterWait()
        throws InterruptedException;

    public abstract boolean beforeWait()
        throws InterruptedException;

    public abstract void onObjectChange(BluetoothShareTask bluetoothsharetask);
}
