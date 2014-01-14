// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.systemui.ext;


public final class NetworkType extends Enum
{

    private static final NetworkType $VALUES[];
    public static final NetworkType Type_1X;
    public static final NetworkType Type_1X3G;
    public static final NetworkType Type_3G;
    public static final NetworkType Type_4G;
    public static final NetworkType Type_E;
    public static final NetworkType Type_G;
    private int mTypeId;

    private NetworkType(String s, int i, int j)
    {
        super(s, i);
        mTypeId = j;
    }

    public static NetworkType valueOf(String s)
    {
        return (NetworkType)Enum.valueOf(com/mediatek/systemui/ext/NetworkType, s);
    }

    public static NetworkType[] values()
    {
        return (NetworkType[])$VALUES.clone();
    }

    public int getTypeId()
    {
        return mTypeId;
    }

    static 
    {
        Type_G = new NetworkType("Type_G", 0, 0);
        Type_3G = new NetworkType("Type_3G", 1, 1);
        Type_1X = new NetworkType("Type_1X", 2, 2);
        Type_1X3G = new NetworkType("Type_1X3G", 3, 3);
        Type_4G = new NetworkType("Type_4G", 4, 4);
        Type_E = new NetworkType("Type_E", 5, 5);
        NetworkType anetworktype[] = new NetworkType[6];
        anetworktype[0] = Type_G;
        anetworktype[1] = Type_3G;
        anetworktype[2] = Type_1X;
        anetworktype[3] = Type_1X3G;
        anetworktype[4] = Type_4G;
        anetworktype[5] = Type_E;
        $VALUES = anetworktype;
    }
}
