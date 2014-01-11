// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth;


public class BluetoothProfile
{

    public static final int BT_PROFILE_RANGE = 0xf4240;
    public static final int BT_PROFILE_START = 0;
    public static final int ID_A2DP = 1;
    public static final int ID_AVRCP = 2;
    public static final int ID_BIP = 3;
    public static final int ID_BPP = 4;
    public static final int ID_CHN = 5;
    public static final int ID_COMMON = 0;
    public static final int ID_END = 21;
    public static final int ID_FTP = 6;
    public static final int ID_GAP = 7;
    public static final int ID_GOEP = 8;
    public static final int ID_HFG = 9;
    public static final int ID_HID = 10;
    public static final int ID_MAP = 11;
    public static final int ID_OPP = 12;
    public static final int ID_PAN = 16;
    public static final int ID_PBAP = 13;
    public static final int ID_PRXM = 17;
    public static final int ID_PRXR = 18;
    public static final int ID_SIMAP = 14;
    public static final int ID_SPP = 15;
    public static final int ID_TIMEC = 19;
    public static final int ID_TIMES = 20;
    public static final int PROFILE_START[];


    public static int getProfileStart(int i)
    {
        return PROFILE_START[i];
    }

    static 
    {
        PROFILE_START = new int[21];
        for (int i = 0; i < 21; i++)
            PROFILE_START[i] = 0 + 0xf4240 * i;

    }
}
