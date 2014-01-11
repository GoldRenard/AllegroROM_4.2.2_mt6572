// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.apn;

import android.net.Uri;
import android.os.SystemProperties;

public class ApnUtils
{

    public static final int APN_ID_INDEX = 17;
    public static final int APN_INDEX = 2;
    public static final int AUTH_TYPE_INDEX = 14;
    public static final int ID_INDEX = 0;
    public static final int MCC_INDEX = 9;
    public static final int MMSC_INDEX = 8;
    public static final int MMSPORT_INDEX = 13;
    public static final int MMSPROXY_INDEX = 12;
    public static final int MNC_INDEX = 10;
    public static final int NAME_INDEX = 1;
    public static final int NAP_ID_INDEX = 18;
    public static final int NUMERIC_INDEX = 11;
    public static final String NUMERIC_LIST[];
    public static final int PASSWORD_INDEX = 7;
    public static final int PORT_INDEX = 4;
    public static final String PREFERRED_APN_URI = "content://telephony/carriers/preferapn";
    public static final String PREFERRED_APN_URI_GEMINI_SIM1 = "content://telephony/carriers_sim1/preferapn";
    public static final String PREFERRED_APN_URI_GEMINI_SIM2 = "content://telephony/carriers_sim2/preferapn";
    public static final String PREFERRED_APN_URI_GEMINI_SIM3 = "content://telephony/carriers_sim3/preferapn";
    public static final String PREFERRED_APN_URI_GEMINI_SIM4 = "content://telephony/carriers_sim4/preferapn";
    public static final Uri PREFERRED_URI_LIST[];
    public static final String PROJECTION[] = {
        "_id", "name", "apn", "proxy", "port", "user", "server", "password", "mmsc", "mcc", 
        "mnc", "numeric", "mmsproxy", "mmsport", "authtype", "type", "sourcetype", "omacpid", "napid", "proxyid"
    };
    public static final int PROXY_ID_INDEX = 19;
    public static final int PROXY_INDEX = 3;
    public static final int SERVER_INDEX = 6;
    public static final int SIM_CARD_SINGLE = -1;
    public static final int SIM_CARD_UNDEFINED = -2;
    public static final int SOURCE_TYPE_INDEX = 16;
    public static final int TYPE_INDEX = 15;
    public static final Uri URI_LIST[];
    public static final int USER_INDEX = 5;


    public static String checkNotSet(String s)
    {
        if (s == null || s.length() == 0)
            s = "";
        return s;
    }

    static 
    {
        Uri auri[] = new Uri[4];
        auri[0] = android.provider.Telephony.Carriers.SIM1Carriers.CONTENT_URI;
        auri[1] = android.provider.Telephony.Carriers.SIM2Carriers.CONTENT_URI;
        auri[2] = android.provider.Telephony.Carriers.SIM3Carriers.CONTENT_URI;
        auri[3] = android.provider.Telephony.Carriers.SIM4Carriers.CONTENT_URI;
        URI_LIST = auri;
        String as[] = new String[4];
        as[0] = SystemProperties.get("gsm.sim.operator.numeric", "-1");
        as[1] = SystemProperties.get("gsm.sim.operator.numeric.2", "-1");
        as[2] = SystemProperties.get("gsm.sim.operator.numeric.3", "-1");
        as[3] = SystemProperties.get("gsm.sim.operator.numeric.4", "-1");
        NUMERIC_LIST = as;
        Uri auri1[] = new Uri[4];
        auri1[0] = Uri.parse("content://telephony/carriers_sim1/preferapn");
        auri1[1] = Uri.parse("content://telephony/carriers_sim2/preferapn");
        auri1[2] = Uri.parse("content://telephony/carriers_sim3/preferapn");
        auri1[3] = Uri.parse("content://telephony/carriers_sim4/preferapn");
        PREFERRED_URI_LIST = auri1;
    }
}
