// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import java.util.HashMap;
import java.util.Map;

public class CarrierLogo
{

    private static Map sLogoMap = null;

    private CarrierLogo()
    {
    }

    public static int getLogo(String s)
    {
        Integer integer = (Integer)getLogoMap().get(s);
        if (integer != null)
            return integer.intValue();
        else
            return -1;
    }

    private static Map getLogoMap()
    {
        if (sLogoMap == null)
            sLogoMap = new HashMap();
        return sLogoMap;
    }

}
