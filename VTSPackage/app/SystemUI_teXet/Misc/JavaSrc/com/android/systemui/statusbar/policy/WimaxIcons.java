// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;


// Referenced classes of package com.android.systemui.statusbar.policy:
//            TelephonyIcons

class WimaxIcons
{

    static final int WIMAX_DISCONNECTED;
    static final int WIMAX_IDLE;
    static final int WIMAX_SIGNAL_STRENGTH[][];


    static 
    {
        WIMAX_SIGNAL_STRENGTH = TelephonyIcons.DATA_SIGNAL_STRENGTH;
        WIMAX_DISCONNECTED = WIMAX_SIGNAL_STRENGTH[0][0];
        WIMAX_IDLE = WIMAX_DISCONNECTED;
    }
}
