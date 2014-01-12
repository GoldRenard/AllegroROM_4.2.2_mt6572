// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.avrcp;


public class BTAvrcpProfile
{

    public static final int APP_SETTING_EQUALIZER = 1;
    public static final int APP_SETTING_MAX_NUM = 4;
    public static final int APP_SETTING_REPEAT_MODE = 2;
    public static final int APP_SETTING_SCAN = 4;
    public static final int APP_SETTING_SHUFFLE = 3;
    public static final byte AVRCP_ERRCODE_INTERNAL_ERROR = 3;
    public static final byte AVRCP_ERRCODE_INVALID_CMD = 0;
    public static final byte AVRCP_ERRCODE_INVALID_DIRECTION = 7;
    public static final byte AVRCP_ERRCODE_INVALID_PARAM = 1;
    public static final byte AVRCP_ERRCODE_INVALID_PLAYER_ID = 17;
    public static final byte AVRCP_ERRCODE_INVALID_SCOPE = 10;
    public static final byte AVRCP_ERRCODE_INVALID_SEARCH_RESULT = 20;
    public static final byte AVRCP_ERRCODE_MEDIA_IN_USE = 13;
    public static final byte AVRCP_ERRCODE_NOT_A_DIRECTORY = 8;
    public static final byte AVRCP_ERRCODE_NOT_EXIST = 9;
    public static final byte AVRCP_ERRCODE_NOT_FOUND = 2;
    public static final byte AVRCP_ERRCODE_NOW_PLAYING_FULL = 14;
    public static final byte AVRCP_ERRCODE_NO_AVAILABLE_PLAYER = 21;
    public static final byte AVRCP_ERRCODE_OPERATION_COMPLETE = 4;
    public static final byte AVRCP_ERRCODE_PLAYER_CHANGED = 22;
    public static final byte AVRCP_ERRCODE_PLAYER_NOT_ADDRESSED = 19;
    public static final byte AVRCP_ERRCODE_PLAYER_NOT_BROWSABLE = 18;
    public static final byte AVRCP_ERRCODE_RANGE_OUT_OF_BOUNDS = 11;
    public static final byte AVRCP_ERRCODE_RESERVED = 6;
    public static final byte AVRCP_ERRCODE_SEARCH_IN_PROGRESS = 16;
    public static final byte AVRCP_ERRCODE_SEARCH_NOT_SUPPORTED = 15;
    public static final byte AVRCP_ERRCODE_UID_CHANGED = 5;
    public static final byte AVRCP_ERRCODE_UID_IS_DIRECTORY = 12;
    public static final byte AVRCP_MAX_ATTRIBUTE_NUM = 4;
    public static final byte AVRCP_MAX_ATTRIBUTE_STRING_SIZE = 80;
    public static final byte AVRCP_MAX_ATTRIBUTE_VALUE_NUM = 4;
    public static final short AVRCP_MAX_ELEMENET_BUFFER_SIZE = 512;
    public static final byte AVRCP_MAX_EVENT_NUM = 20;
    public static final byte AVRCP_MAX_FILE_ATTRIBUTE = 7;
    public static final short AVRCP_MAX_FOLDER_BUFFER_SIZE = 512;
    public static final byte AVRCP_MAX_FOLDER_DEPTH_NUM = 60;
    public static final byte AVRCP_MAX_GET_ELEMENT_ATTR_NUM = 10;
    public static final byte AVRCP_MAX_GET_ELEMENT_ITEM_SIZE = 8;
    public static final byte AVRCP_MAX_MEDIA_ATTRIBUTE_ID = 7;
    public static final byte AVRCP_MAX_PLAYERS_NUM = 20;
    public static final byte AVRCP_MAX_PLAYER_NAME_SIZE = 60;
    public static final short AVRCP_MAX_SEARCH_TEXT_SIZE = 128;
    public static final byte AVRCP_MAX_VALUE_STRING_SIZE = 80;
    public static final byte AVRCP_OPERATION_ID_BACKWARD = 76;
    public static final byte AVRCP_OPERATION_ID_FASTFORWARD = 73;
    public static final byte AVRCP_OPERATION_ID_FORWARD = 75;
    public static final byte AVRCP_OPERATION_ID_PAUSE = 70;
    public static final byte AVRCP_OPERATION_ID_PLAY = 68;
    public static final byte AVRCP_OPERATION_ID_REWIND = 72;
    public static final byte AVRCP_OPERATION_ID_STOP = 69;
    public static final short AVRCP_OPERATION_ID_VENDOR_NEXT_GROUP = 0;
    public static final short AVRCP_OPERATION_ID_VENDOR_PREVIOUS_GROUP = 1;
    public static final byte AVRCP_OPERATION_ID_VENDOR_UNIQUE = 126;
    public static final byte AVRCP_OPERATION_ID_VOLUME_DOWN = 66;
    public static final byte AVRCP_OPERATION_ID_VOLUME_UP = 65;
    public static final int AVRCP_POP_BACKWARD = 76;
    public static final int AVRCP_POP_EJECT = 74;
    public static final int AVRCP_POP_FAST_FORWARD = 73;
    public static final int AVRCP_POP_FORWARD = 75;
    public static final int AVRCP_POP_MUTE = 67;
    public static final int AVRCP_POP_PAUSE = 70;
    public static final int AVRCP_POP_PLAY = 68;
    public static final int AVRCP_POP_POWER = 64;
    public static final int AVRCP_POP_RECORD = 71;
    public static final int AVRCP_POP_REWIND = 72;
    public static final int AVRCP_POP_STOP = 69;
    public static final int AVRCP_POP_VOLUME_DOWN = 66;
    public static final int AVRCP_POP_VOLUME_UP = 65;
    public static final byte AVRCP_SCOPE_FILE_SYSTEM = 1;
    public static final byte AVRCP_SCOPE_NOW_PLAYING = 3;
    public static final byte AVRCP_SCOPE_PLAYER_LIST = 0;
    public static final byte AVRCP_SCOPE_SEARCH = 2;
    public static final byte DIR_DOWN = 1;
    public static final byte DIR_UP = 0;
    public static final int EQUALIZER_OFF = 1;
    public static final int EQUALIZER_ON = 2;
    public static final int EVENT_ADDRESSED_PLAYER_CHANGED = 11;
    public static final int EVENT_AVAILABLE_PLAYERS_CHANGED = 10;
    public static final int EVENT_BATT_STATUS_CHANGED = 6;
    public static final int EVENT_NOW_PLAYING_CONTENT_CHANGED = 9;
    public static final int EVENT_PLAYBACK_POS_CHANGED = 5;
    public static final int EVENT_PLAYBACK_STATUS_CHANGED = 1;
    public static final int EVENT_PLAYER_APPLICATION_SETTING_CHANGED = 8;
    public static final int EVENT_SYSTEM_STATUS_CHANGED = 7;
    public static final int EVENT_TRACK_CHANGED = 2;
    public static final int EVENT_TRACK_REACHED_END = 3;
    public static final int EVENT_TRACK_REACHED_START = 4;
    public static final int EVENT_UIDS_CHANGED = 12;
    public static final int EVENT_VOLUME_CHANGED = 13;
    public static final byte FAIL = 1;
    public static final byte ITEM_TYPE_ELEMENT = 3;
    public static final byte ITEM_TYPE_FOLDER = 2;
    public static final byte ITEM_TYPE_PLAYER = 1;
    public static final int MAX_ATTRIBUTE_NUM = 4;
    public static final int MAX_ATTRVALUE_NUM = 7;
    public static final byte MEDIA_TYPE_AUDIO = 0;
    public static final byte MEDIA_TYPE_VIDEO = 1;
    public static final int MEIDA_ATTR_ALBUM = 3;
    public static final int MEIDA_ATTR_ARTIST = 2;
    public static final int MEIDA_ATTR_GENRE = 6;
    public static final int MEIDA_ATTR_NUM_OF_ALBUM = 4;
    public static final int MEIDA_ATTR_PLAYING_TIME_MS = 7;
    public static final int MEIDA_ATTR_TITLE = 1;
    public static final int MEIDA_ATTR_TOTAL_NUM = 5;
    public static final byte OK = 0;
    public static final int PLAY_STATUS_ERROR = 255;
    public static final int PLAY_STATUS_FWD_SEEK = 3;
    public static final int PLAY_STATUS_PAUSED = 2;
    public static final int PLAY_STATUS_PLAYING = 1;
    public static final int PLAY_STATUS_REV_SEEK = 4;
    public static final int PLAY_STATUS_STOPPED = 0;
    public static final int REPEAT_MODE_ALL_TRACK = 3;
    public static final int REPEAT_MODE_GROUP_TRACK = 4;
    public static final int REPEAT_MODE_OFF = 1;
    public static final int REPEAT_MODE_SINGLE_TRACK = 2;
    public static final int SCAN_ALL_TRACK = 2;
    public static final int SCAN_GROUP_TRACK = 3;
    public static final int SCAN_OFF = 1;
    public static final int SHUFFLE_ALL_TRACK = 2;
    public static final int SHUFFLE_GROUP_TRACK = 3;
    public static final int SHUFFLE_OFF = 1;
    public static final byte STATUS_OK = 4;
    public static final short UTF8_CHARSET = 106;


    public static final byte getPreferVersion()
    {
        return 10;
    }
}
