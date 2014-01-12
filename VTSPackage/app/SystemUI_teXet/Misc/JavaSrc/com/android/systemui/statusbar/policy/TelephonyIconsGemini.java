// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import com.mediatek.systemui.ext.DataType;
import com.mediatek.systemui.ext.NetworkType;

public class TelephonyIconsGemini
{

    static final int DATA[][];
    static final int DATA_1X[] = {
        0x7f020168, 0x7f02016c, 0x7f02016a, 0x7f02016e, 0x7f020170
    };
    static final int DATA_1X_ROAM[] = {
        0x7f020169, 0x7f02016d, 0x7f02016b, 0x7f02016f, 0x7f020171
    };
    static final int DATA_3G[] = {
        0x7f020172, 0x7f020176, 0x7f020174, 0x7f020182, 0x7f020184
    };
    static final int DATA_3G_PLUS[] = {
        0x7f020178, 0x7f02017c, 0x7f02017a, 0x7f02017e, 0x7f020180
    };
    static final int DATA_3G_PLUS_ROAM[] = {
        0x7f020179, 0x7f02017d, 0x7f02017b, 0x7f02017f, 0x7f020181
    };
    static final int DATA_3G_ROAM[] = {
        0x7f020173, 0x7f020177, 0x7f020175, 0x7f020183, 0x7f020185
    };
    static final int DATA_4G[] = {
        0x7f020186, 0x7f02018a, 0x7f020188, 0x7f02018c, 0x7f02018e
    };
    static final int DATA_4G_ROAM[] = {
        0x7f020187, 0x7f02018b, 0x7f020189, 0x7f02018d, 0x7f02018f
    };
    static final int DATA_E[] = {
        0x7f020190, 0x7f020194, 0x7f020192, 0x7f020196, 0x7f020198
    };
    static final int DATA_E_ROAM[] = {
        0x7f020191, 0x7f020195, 0x7f020193, 0x7f020197, 0x7f020199
    };
    static final int DATA_G[] = {
        0x7f02019a, 0x7f02019e, 0x7f02019c, 0x7f0201a0, 0x7f0201a2
    };
    static final int DATA_G_ROAM[] = {
        0x7f02019b, 0x7f02019f, 0x7f02019d, 0x7f0201a1, 0x7f0201a3
    };
    static final int DATA_H[] = {
        0x7f0201a4, 0x7f0201a8, 0x7f0201a6, 0x7f0201b4, 0x7f0201b6
    };
    static final int DATA_H_PLUS[] = {
        0x7f0201aa, 0x7f0201ae, 0x7f0201ac, 0x7f0201b0, 0x7f0201b2
    };
    static final int DATA_H_PLUS_ROAM[] = {
        0x7f0201ab, 0x7f0201af, 0x7f0201ad, 0x7f0201b1, 0x7f0201b3
    };
    static final int DATA_H_ROAM[] = {
        0x7f0201a5, 0x7f0201a9, 0x7f0201a7, 0x7f0201b5, 0x7f0201b7
    };
    static final int DATA_ROAM[][];
    static final int NETWORK_TYPE_3G[] = {
        0x7f0201ce, 0x7f0201d0, 0x7f0201cf, 0x7f0201d1, 0x7f0201d2
    };
    static final int NETWORK_TYPE_4G[] = {
        0x7f0201d8, 0x7f0201da, 0x7f0201d9, 0x7f0201db, 0x7f0201dc
    };
    static final int NETWORK_TYPE_E[] = {
        0x7f0201dd, 0x7f0201df, 0x7f0201de, 0x7f0201e0, 0x7f0201e1
    };
    static final int NETWORK_TYPE_G[] = {
        0x7f0201e2, 0x7f0201e4, 0x7f0201e3, 0x7f0201e5, 0x7f0201e6
    };
    static final int ROAMING[] = {
        0x7f0201b8, 0x7f0201ba, 0x7f0201b9, 0x7f0201bb, 0x7f0201bc
    };
    private static final int TELEPHONY_SIGNAL_STRENGTH[][] = {
        {
            0x7f0201be, 0x7f0201bf, 0x7f0201c4, 0x7f0201c9, 0x7f0201d3
        }, {
            0x7f0201be, 0x7f0201c1, 0x7f0201c6, 0x7f0201cb, 0x7f0201d5
        }, {
            0x7f0201be, 0x7f0201c0, 0x7f0201c5, 0x7f0201ca, 0x7f0201d4
        }, {
            0x7f0201be, 0x7f0201c2, 0x7f0201c7, 0x7f0201cc, 0x7f0201d6
        }
    };
    private static final int TELEPHONY_SIGNAL_STRENGTH_WHITE[] = {
        0x7f0201be, 0x7f0201c3, 0x7f0201c8, 0x7f0201cd, 0x7f0201d7
    };


    public static int[] getDataTypeIconListGemini(boolean flag, DataType datatype)
    {
        if (flag)
            return DATA_ROAM[datatype.getTypeId()];
        else
            return DATA[datatype.getTypeId()];
    }

    public static int getNetworkTypeIconGemini(NetworkType networktype, int i)
    {
        if (networktype == NetworkType.Type_G)
            return NETWORK_TYPE_G[i];
        if (networktype == NetworkType.Type_E)
            return NETWORK_TYPE_E[i];
        if (networktype == NetworkType.Type_3G)
            return NETWORK_TYPE_3G[i];
        if (networktype == NetworkType.Type_4G)
            return NETWORK_TYPE_4G[i];
        else
            return -1;
    }

    public static int[] getTelephonySignalStrengthIconList(int i, boolean flag)
    {
        if (flag)
            return TELEPHONY_SIGNAL_STRENGTH_WHITE;
        else
            return TELEPHONY_SIGNAL_STRENGTH[i];
    }

    static 
    {
        int ai[][] = new int[8][];
        ai[0] = DATA_1X;
        ai[1] = DATA_3G;
        ai[2] = DATA_4G;
        ai[3] = DATA_E;
        ai[4] = DATA_G;
        ai[5] = DATA_H;
        ai[6] = DATA_H_PLUS;
        ai[7] = DATA_3G_PLUS;
        DATA = ai;
        int ai1[][] = new int[8][];
        ai1[0] = DATA_1X_ROAM;
        ai1[1] = DATA_3G_ROAM;
        ai1[2] = DATA_4G_ROAM;
        ai1[3] = DATA_E_ROAM;
        ai1[4] = DATA_G_ROAM;
        ai1[5] = DATA_H_ROAM;
        ai1[6] = DATA_H_PLUS_ROAM;
        ai1[7] = DATA_3G_PLUS_ROAM;
        DATA_ROAM = ai1;
    }
}
