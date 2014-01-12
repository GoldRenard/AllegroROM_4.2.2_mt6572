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
        0x7f02018c, 0x7f020190, 0x7f02018e, 0x7f020192, 0x7f020194
    };
    static final int DATA_1X_ROAM[] = {
        0x7f02018d, 0x7f020191, 0x7f02018f, 0x7f020193, 0x7f020195
    };
    static final int DATA_3G[] = {
        0x7f020196, 0x7f02019a, 0x7f020198, 0x7f02019c, 0x7f02019e
    };
    static final int DATA_3G_ROAM[] = {
        0x7f020197, 0x7f02019b, 0x7f020199, 0x7f02019d, 0x7f02019f
    };
    static final int DATA_4G[] = {
        0x7f0201a0, 0x7f0201a4, 0x7f0201a2, 0x7f0201a6, 0x7f0201a8
    };
    static final int DATA_4G_ROAM[] = {
        0x7f0201a1, 0x7f0201a5, 0x7f0201a3, 0x7f0201a7, 0x7f0201a9
    };
    static final int DATA_E[] = {
        0x7f0201aa, 0x7f0201ae, 0x7f0201ac, 0x7f0201b0, 0x7f0201b2
    };
    static final int DATA_E_ROAM[] = {
        0x7f0201ab, 0x7f0201af, 0x7f0201ad, 0x7f0201b1, 0x7f0201b3
    };
    static final int DATA_G[] = {
        0x7f0201b4, 0x7f0201b8, 0x7f0201b6, 0x7f0201ba, 0x7f0201bc
    };
    static final int DATA_G_ROAM[] = {
        0x7f0201b5, 0x7f0201b9, 0x7f0201b7, 0x7f0201bb, 0x7f0201bd
    };
    static final int DATA_H[] = {
        0x7f0201be, 0x7f0201c2, 0x7f0201c0, 0x7f0201ce, 0x7f0201d0
    };
    static final int DATA_H_PLUS[] = {
        0x7f0201c4, 0x7f0201c8, 0x7f0201c6, 0x7f0201ca, 0x7f0201cc
    };
    static final int DATA_H_PLUS_ROAM[] = {
        0x7f0201c5, 0x7f0201c9, 0x7f0201c7, 0x7f0201cb, 0x7f0201cd
    };
    static final int DATA_H_ROAM[] = {
        0x7f0201bf, 0x7f0201c3, 0x7f0201c1, 0x7f0201cf, 0x7f0201d1
    };
    static final int DATA_ROAM[][];
    static final int ROAMING[] = {
        0x7f0201d2, 0x7f0201d4, 0x7f0201d3, 0x7f0201d5, 0x7f0201d6
    };
    private static final int TELEPHONY_CUSTOMER_DATA[][] = {
        {
            0, 0, 0, 0, 0
        }, {
            0, 0x7f02013a, 0x7f020139, 0x7f020138, 0x7f02013b
        }, {
            0, 0x7f02013e, 0x7f02013d, 0x7f02013c, 0x7f02013f
        }, {
            0, 0x7f020146, 0x7f020145, 0x7f020144, 0x7f020147
        }, {
            0, 0x7f020142, 0x7f020141, 0x7f020140, 0x7f020143
        }
    };
    static final int TELEPHONY_CUSTOMER_NETWORK_TYPE[] = {
        0x7f020149, 0x7f020148
    };
    static final int TELEPHONY_CUSTOMER_ROAMING[] = {
        0x7f02014a, 0x7f02014b
    };
    static final int TELEPHONY_CUSTOMER_SIGNAL_NULL[] = {
        0x7f02015d, 0x7f02015e
    };
    private static final int TELEPHONY_CUSTOMER_SIGNAL_STRENGTH[][] = {
        {
            0x7f02014c, 0x7f02014d, 0x7f02014e, 0x7f02014f, 0x7f020150, 0x7f020151
        }, {
            0x7f020153, 0x7f020154, 0x7f020155, 0x7f020156, 0x7f020157, 0x7f020158
        }
    };
    private static final int TELEPHONY_SIGNAL_STRENGTH[][] = {
        {
            0x7f0201d8, 0x7f0201d9, 0x7f0201de, 0x7f0201e3, 0x7f0201e8
        }, {
            0x7f0201d8, 0x7f0201db, 0x7f0201e0, 0x7f0201e5, 0x7f0201ea
        }, {
            0x7f0201d8, 0x7f0201da, 0x7f0201df, 0x7f0201e4, 0x7f0201e9
        }, {
            0x7f0201d8, 0x7f0201dc, 0x7f0201e1, 0x7f0201e6, 0x7f0201eb
        }
    };
    private static final int TELEPHONY_SIGNAL_STRENGTH_WHITE[] = {
        0x7f0201d8, 0x7f0201dd, 0x7f0201e2, 0x7f0201e7, 0x7f0201ec
    };


    public static int[] getDataTypeIconListGemini(boolean flag, DataType datatype)
    {
        if (flag)
            return DATA_ROAM[datatype.getTypeId()];
        else
            return DATA[datatype.getTypeId()];
    }

    public static int getTelephonySignalDataActivityIcon(int i, int j)
    {
        return TELEPHONY_CUSTOMER_DATA[i][j];
    }

    public static int getTelephonySignalNetworkTypeIcon(int i)
    {
        return TELEPHONY_CUSTOMER_NETWORK_TYPE[i];
    }

    public static int getTelephonySignalNetworkTypeIcon(NetworkType networktype)
    {
        int i = networktype.getTypeId();
        if (i >= 0 && i <= 1)
            return TELEPHONY_CUSTOMER_NETWORK_TYPE[i];
        else
            return 0;
    }

    public static int getTelephonySignalNullIcon(int i)
    {
        return TELEPHONY_CUSTOMER_SIGNAL_NULL[i];
    }

    public static int getTelephonySignalRoamingIcon(int i)
    {
        return TELEPHONY_CUSTOMER_ROAMING[i];
    }

    public static int getTelephonySignalStrengthIcon(int i, int j)
    {
        return TELEPHONY_CUSTOMER_SIGNAL_STRENGTH[i][j];
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
        int ai[][] = new int[7][];
        ai[0] = DATA_1X;
        ai[1] = DATA_3G;
        ai[2] = DATA_4G;
        ai[3] = DATA_E;
        ai[4] = DATA_G;
        ai[5] = DATA_H;
        ai[6] = DATA_H_PLUS;
        DATA = ai;
        int ai1[][] = new int[7][];
        ai1[0] = DATA_1X_ROAM;
        ai1[1] = DATA_3G_ROAM;
        ai1[2] = DATA_4G_ROAM;
        ai1[3] = DATA_E_ROAM;
        ai1[4] = DATA_G_ROAM;
        ai1[5] = DATA_H_ROAM;
        ai1[6] = DATA_H_PLUS_ROAM;
        DATA_ROAM = ai1;
    }
}
