// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.systemui.ext;


public final class DataType extends Enum
{

    private static final DataType $VALUES[];
    public static final DataType Type_1X;
    public static final DataType Type_3G;
    public static final DataType Type_3G_PLUS;
    public static final DataType Type_4G;
    public static final DataType Type_E;
    public static final DataType Type_G;
    public static final DataType Type_H;
    public static final DataType Type_H_PLUS;
    private int mTypeId;

    private DataType(String s, int i, int j)
    {
        super(s, i);
        mTypeId = j;
    }

    public static DataType valueOf(String s)
    {
        return (DataType)Enum.valueOf(com/mediatek/systemui/ext/DataType, s);
    }

    public static DataType[] values()
    {
        return (DataType[])$VALUES.clone();
    }

    public int getTypeId()
    {
        return mTypeId;
    }

    static 
    {
        Type_1X = new DataType("Type_1X", 0, 0);
        Type_3G = new DataType("Type_3G", 1, 1);
        Type_4G = new DataType("Type_4G", 2, 2);
        Type_E = new DataType("Type_E", 3, 3);
        Type_G = new DataType("Type_G", 4, 4);
        Type_H = new DataType("Type_H", 5, 5);
        Type_H_PLUS = new DataType("Type_H_PLUS", 6, 6);
        Type_3G_PLUS = new DataType("Type_3G_PLUS", 7, 7);
        DataType adatatype[] = new DataType[8];
        adatatype[0] = Type_1X;
        adatatype[1] = Type_3G;
        adatatype[2] = Type_4G;
        adatatype[3] = Type_E;
        adatatype[4] = Type_G;
        adatatype[5] = Type_H;
        adatatype[6] = Type_H_PLUS;
        adatatype[7] = Type_3G_PLUS;
        $VALUES = adatatype;
    }
}
