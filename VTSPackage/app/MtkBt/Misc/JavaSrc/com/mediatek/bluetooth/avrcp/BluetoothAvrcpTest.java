// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.avrcp;


public class BluetoothAvrcpTest
{


    public native void getCurPlayerAppValueInd(byte byte0, byte abyte0[]);

    public native void getPlayerAppAttrTextInd(byte byte0, byte abyte0[]);

    public native void getPlayerAppValueTextInd(byte byte0, byte byte1, byte abyte0[]);

    public native void listPlayerAppAttributeInd();

    public native void listPlayerAppValueInd(byte byte0);

    public native void setPlayerAppValueInd(byte byte0, byte abyte0[], byte abyte1[]);
}
