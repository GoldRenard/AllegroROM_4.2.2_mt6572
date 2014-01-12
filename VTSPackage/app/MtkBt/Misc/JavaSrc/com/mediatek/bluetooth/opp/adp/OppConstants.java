// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.adp;


public interface OppConstants
{
    public static interface GOEP
    {

        public static final int DATABASE_FULL = 96;
        public static final int FORBIDDEN = 67;
        public static final int INTERNAL_SERVER_ERR = 80;
        public static final int NOT_FOUND = 68;
        public static final int NOT_IMPLEMENTED = 81;
        public static final int SERVICE_UNAVAILABLE = 83;
        public static final int STATUS_FAILED = 1;
        public static final int STATUS_SUCCESS = 0;
        public static final int UNAUTHORIZED = 65;
        public static final int UNSUPPORT_MEDIA_TYPE = 79;
    }

    public static interface OppService
    {

        public static final String ACTION_OPPC_START = "com.mediatek.bluetooth.opp.action.OPPC_START";
        public static final String ACTION_OPPS_START = "com.mediatek.bluetooth.opp.action.OPPS_START";
    }

    public static interface OppsAccessRequest
    {

        public static final String ACTION_PULL_REQUEST = "com.mediatek.bluetooth.opp.action.PULL_REQUEST";
        public static final String ACTION_PUSH_REQUEST = "com.mediatek.bluetooth.opp.action.PUSH_REQUEST";
        public static final String EXTRA_OBJECT_NAME = "com.mediatek.bluetooth.opp.extra.OBJECT_NAME";
        public static final String EXTRA_PEER_NAME = "com.mediatek.bluetooth.opp.extra.PEER_NAME";
        public static final String EXTRA_TASK_ID = "com.mediatek.bluetooth.opp.extra.TASK_ID";
        public static final String EXTRA_TOTAL_BYTES = "com.mediatek.bluetooth.opp.extra.TOTAL_BYTES";
    }


    public static final String ACTION_BT_OPP_TRANSFER_DONE = "android.btopp.intent.action.BT_OPP_TRANSFER_DONE";
    public static final String ACTION_BT_OPP_TRANSFER_PROGRESS = "android.btopp.intent.action.BT_OPP_TRANSFER_PROGRESS";
    public static final String ACTION_HANDOVER_SEND = "android.btopp.intent.action.HANDOVER_SEND";
    public static final String ACTION_HANDOVER_SEND_MULTIPLE = "android.btopp.intent.action.HANDOVER_SEND_MULTIPLE";
    public static final String ACTION_STOP_HANDOVER = "android.btopp.intent.action.STOP_HANDOVER_TRANSFER";
    public static final String ACTION_WHITELIST_DEVICE = "android.btopp.intent.action.WHITELIST_DEVICE";
    public static final boolean DEBUG = false;
    public static final int DIRECTION_BLUETOOTH_INCOMING = 0;
    public static final int DIRECTION_BLUETOOTH_OUTGOING = 1;
    public static final String EXTRA_BT_OPP_ADDRESS = "android.btopp.intent.extra.BT_OPP_ADDRESS";
    public static final String EXTRA_BT_OPP_TRANSFER_DIRECTION = "android.btopp.intent.extra.BT_OPP_TRANSFER_DIRECTION";
    public static final String EXTRA_BT_OPP_TRANSFER_DONE_SIZE = "com.mediatek.bluetooth.opp.extra.BT_OPP_TRANSFER_DONE_SIZE";
    public static final String EXTRA_BT_OPP_TRANSFER_FILE_SIZE = "com.mediatek.bluetooth.opp.extra.BT_OPP_TRANSFER_FILE_SIZE";
    public static final String EXTRA_BT_OPP_TRANSFER_ID = "android.btopp.intent.extra.BT_OPP_TRANSFER_ID";
    public static final String EXTRA_BT_OPP_TRANSFER_MIMETYPE = "android.btopp.intent.extra.BT_OPP_TRANSFER_MIMETYPE";
    public static final String EXTRA_BT_OPP_TRANSFER_OBJECT_NAME = "com.mediatek.bluetooth.opp.extra.BT_OPP_TRANSFER_OBJECT_NAME";
    public static final String EXTRA_BT_OPP_TRANSFER_PROGRESS = "android.btopp.intent.extra.BT_OPP_TRANSFER_PROGRESS";
    public static final String EXTRA_BT_OPP_TRANSFER_STATUS = "android.btopp.intent.extra.BT_OPP_TRANSFER_STATUS";
    public static final String EXTRA_BT_OPP_TRANSFER_URI = "android.btopp.intent.extra.BT_OPP_TRANSFER_URI";
    public static final String EXTRA_CONNECTION_HANDOVER = "com.android.intent.extra.CONNECTION_HANDOVER";
    public static final String HANDOVER_STATUS_PERMISSION = "com.android.permission.HANDOVER_STATUS";
    public static final int HANDOVER_TRANSFER_STATUS_FAILURE = 1;
    public static final int HANDOVER_TRANSFER_STATUS_SUCCESS = 0;
    public static final int OPPC_OPERATION_RETURN_THRESHOLD = 4;
    public static final int OPPC_OPERATION_TIMEOUT = 20000;
    public static final int OPPS_OPERATION_RETURN_THRESHOLD = 4;
    public static final int OPPS_OPERATION_TIMEOUT = 20000;
    public static final int VCARD_BUF_SIZE = 512;
    public static final boolean VERBOSE;
}
