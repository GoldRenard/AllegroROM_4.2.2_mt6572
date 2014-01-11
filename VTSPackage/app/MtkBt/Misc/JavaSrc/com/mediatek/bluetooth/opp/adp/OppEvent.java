// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.adp;


public class OppEvent
{

    public static final int BT_OPPC_CONNECTED = 5;
    public static final int BT_OPPC_DISABLE_FAIL = 4;
    public static final int BT_OPPC_DISABLE_SUCCESS = 3;
    public static final int BT_OPPC_DISCONNECT = 16;
    public static final int BT_OPPC_ENABLE_FAIL = 2;
    public static final int BT_OPPC_ENABLE_SUCCESS = 1;
    public static final int BT_OPPC_EXCH_FAIL = 15;
    public static final int BT_OPPC_EXCH_START = 13;
    public static final int BT_OPPC_EXCH_SUCCESS = 14;
    public static final int BT_OPPC_GROUP_END = 30;
    public static final int BT_OPPC_GROUP_START = 0;
    public static final int BT_OPPC_PROGRESS_UPDATE = 6;
    public static final int BT_OPPC_PULL_FAIL = 12;
    public static final int BT_OPPC_PULL_START = 10;
    public static final int BT_OPPC_PULL_SUCCESS = 11;
    public static final int BT_OPPC_PUSH_FAIL = 9;
    public static final int BT_OPPC_PUSH_START = 7;
    public static final int BT_OPPC_PUSH_SUCCESS = 8;
    public static final int BT_OPPS_DISABLE_FAIL = 104;
    public static final int BT_OPPS_DISABLE_SUCCESS = 103;
    public static final int BT_OPPS_DISCONNECT = 112;
    public static final int BT_OPPS_ENABLE_FAIL = 102;
    public static final int BT_OPPS_ENABLE_SUCCESS = 101;
    public static final int BT_OPPS_GROUP_END = 130;
    public static final int BT_OPPS_GROUP_START = 100;
    public static final int BT_OPPS_PROGRESS_UPDATE = 105;
    public static final int BT_OPPS_PULL_ACCESS_REQUEST = 114;
    public static final int BT_OPPS_PULL_FAIL = 111;
    public static final int BT_OPPS_PULL_START = 109;
    public static final int BT_OPPS_PULL_SUCCESS = 110;
    public static final int BT_OPPS_PUSH_ACCESS_REQUEST = 113;
    public static final int BT_OPPS_PUSH_FAIL = 108;
    public static final int BT_OPPS_PUSH_START = 106;
    public static final int BT_OPPS_PUSH_SUCCESS = 107;
    public int event;
    public String parameters[];

    public OppEvent(int i, String as[])
    {
        event = i;
        parameters = as;
    }

    public static String getEventName(int i)
    {
        switch (i)
        {
        case 114: // 'r'
            return "BT_OPPS_PULL_ACCESS_REQUEST";

        case 113: // 'q'
            return "BT_OPPS_PUSH_ACCESS_REQUEST";

        case 112: // 'p'
            return "BT_OPPS_DISCONNECT";

        case 111: // 'o'
            return "BT_OPPS_PULL_FAIL";

        case 110: // 'n'
            return "BT_OPPS_PULL_SUCCESS";

        case 109: // 'm'
            return "BT_OPPS_PULL_START";

        case 108: // 'l'
            return "BT_OPPS_PUSH_FAIL";

        case 107: // 'k'
            return "BT_OPPS_PUSH_SUCCESS";

        case 106: // 'j'
            return "BT_OPPS_PUSH_START";

        case 105: // 'i'
            return "BT_OPPS_PROGRESS_UPDATE";

        case 104: // 'h'
            return "BT_OPPS_DISABLE_FAIL";

        case 103: // 'g'
            return "BT_OPPS_DISABLE_SUCCESS";

        case 102: // 'f'
            return "BT_OPPS_ENABLE_FAIL";

        case 101: // 'e'
            return "BT_OPPS_ENABLE_SUCCESS";

        case 16: // '\020'
            return "BT_OPPC_DISCONNECT";

        case 15: // '\017'
            return "BT_OPPC_EXCH_FAIL";

        case 14: // '\016'
            return "BT_OPPC_EXCH_SUCCESS";

        case 13: // '\r'
            return "BT_OPPC_EXCH_START";

        case 12: // '\f'
            return "BT_OPPC_PULL_FAIL";

        case 11: // '\013'
            return "BT_OPPC_PULL_SUCCESS";

        case 10: // '\n'
            return "BT_OPPC_PULL_START";

        case 9: // '\t'
            return "BT_OPPC_PUSH_FAIL";

        case 8: // '\b'
            return "BT_OPPC_PUSH_SUCCESS";

        case 7: // '\007'
            return "BT_OPPC_PUSH_START";

        case 6: // '\006'
            return "BT_OPPC_PROGRESS_UPDATE";

        case 4: // '\004'
            return "BT_OPPC_DISABLE_FAIL";

        case 3: // '\003'
            return "BT_OPPC_DISABLE_SUCCESS";

        case 2: // '\002'
            return "BT_OPPC_ENABLE_FAIL";

        case 1: // '\001'
            return "BT_OPPC_ENABLE_SUCCESS";
        }
        return (new StringBuilder()).append("Unknow event: ").append(i).toString();
    }

    public boolean equals(Object obj)
    {
        if (this != obj)
        {
            if (obj == null)
                return false;
            if (!(obj instanceof OppEvent))
                return false;
            OppEvent oppevent = (OppEvent)obj;
            if (event != oppevent.event)
                return false;
        }
        return true;
    }

    public int hashCode()
    {
        return 31 + event;
    }

    public String toString()
    {
        StringBuilder stringbuilder = (new StringBuilder()).append("[").append(getEventName(event)).append(",");
        if (parameters != null)
        {
            String as[] = parameters;
            int i = as.length;
            for (int j = 0; j < i; j++)
                stringbuilder.append(as[j]).append(",");

        }
        stringbuilder.append("]").toString();
        return stringbuilder.toString();
    }
}
