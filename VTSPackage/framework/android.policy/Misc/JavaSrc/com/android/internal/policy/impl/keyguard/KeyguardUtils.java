// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.os.SystemProperties;
import com.android.internal.telephony.PhoneConstants;
import com.mediatek.xlog.Xlog;

public class KeyguardUtils
{


    public static int getMaxSimId()
    {
        byte byte0 = 3;
        if (isGemini())
        {
            if (PhoneConstants.GEMINI_SIM_NUM == byte0)
                byte0 = 2;
            else
            if (PhoneConstants.GEMINI_SIM_NUM != 4)
                return 1;
            return byte0;
        } else
        {
            return 0;
        }
    }

    public static int getNumOfSim()
    {
        if (isGemini())
            return PhoneConstants.GEMINI_SIM_NUM;
        else
            return 1;
    }

    public static final boolean isGemini()
    {
        return true;
    }

    public static final boolean isMediatekGemini3GSwitchSupport()
    {
        return false;
    }

    public static final boolean isMediatekLCASupport()
    {
        return false;
    }

    public static final boolean isMediatekVT3G324MSupport()
    {
        return false;
    }

    public static final boolean isTablet()
    {
        return "tablet".equals(SystemProperties.get("ro.build.characteristics"));
    }

    public static boolean isValidSimId(int i)
    {
        return i >= 0 && i <= getMaxSimId();
    }

    public static final void xlogD(String s, String s1)
    {
        Xlog.d(s, s1);
    }

    public static final void xlogE(String s, String s1)
    {
        Xlog.e(s, s1);
    }

    public static final void xlogI(String s, String s1)
    {
        Xlog.i(s, s1);
    }

    public static final void xlogW(String s, String s1)
    {
        Xlog.w(s, s1);
    }
}
