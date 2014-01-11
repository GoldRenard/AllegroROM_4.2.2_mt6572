.class public Lcom/mediatek/bluetooth/avrcp/BTAvrcpProfile;
.super Ljava/lang/Object;
.source "BTAvrcpProfile.java"


# static fields
.field public static final APP_SETTING_EQUALIZER:I = 0x1

.field public static final APP_SETTING_MAX_NUM:I = 0x4

.field public static final APP_SETTING_REPEAT_MODE:I = 0x2

.field public static final APP_SETTING_SCAN:I = 0x4

.field public static final APP_SETTING_SHUFFLE:I = 0x3

.field public static final AVRCP_ERRCODE_INTERNAL_ERROR:B = 0x3t

.field public static final AVRCP_ERRCODE_INVALID_CMD:B = 0x0t

.field public static final AVRCP_ERRCODE_INVALID_DIRECTION:B = 0x7t

.field public static final AVRCP_ERRCODE_INVALID_PARAM:B = 0x1t

.field public static final AVRCP_ERRCODE_INVALID_PLAYER_ID:B = 0x11t

.field public static final AVRCP_ERRCODE_INVALID_SCOPE:B = 0xat

.field public static final AVRCP_ERRCODE_INVALID_SEARCH_RESULT:B = 0x14t

.field public static final AVRCP_ERRCODE_MEDIA_IN_USE:B = 0xdt

.field public static final AVRCP_ERRCODE_NOT_A_DIRECTORY:B = 0x8t

.field public static final AVRCP_ERRCODE_NOT_EXIST:B = 0x9t

.field public static final AVRCP_ERRCODE_NOT_FOUND:B = 0x2t

.field public static final AVRCP_ERRCODE_NOW_PLAYING_FULL:B = 0xet

.field public static final AVRCP_ERRCODE_NO_AVAILABLE_PLAYER:B = 0x15t

.field public static final AVRCP_ERRCODE_OPERATION_COMPLETE:B = 0x4t

.field public static final AVRCP_ERRCODE_PLAYER_CHANGED:B = 0x16t

.field public static final AVRCP_ERRCODE_PLAYER_NOT_ADDRESSED:B = 0x13t

.field public static final AVRCP_ERRCODE_PLAYER_NOT_BROWSABLE:B = 0x12t

.field public static final AVRCP_ERRCODE_RANGE_OUT_OF_BOUNDS:B = 0xbt

.field public static final AVRCP_ERRCODE_RESERVED:B = 0x6t

.field public static final AVRCP_ERRCODE_SEARCH_IN_PROGRESS:B = 0x10t

.field public static final AVRCP_ERRCODE_SEARCH_NOT_SUPPORTED:B = 0xft

.field public static final AVRCP_ERRCODE_UID_CHANGED:B = 0x5t

.field public static final AVRCP_ERRCODE_UID_IS_DIRECTORY:B = 0xct

.field public static final AVRCP_MAX_ATTRIBUTE_NUM:B = 0x4t

.field public static final AVRCP_MAX_ATTRIBUTE_STRING_SIZE:B = 0x50t

.field public static final AVRCP_MAX_ATTRIBUTE_VALUE_NUM:B = 0x4t

.field public static final AVRCP_MAX_ELEMENET_BUFFER_SIZE:S = 0x200s

.field public static final AVRCP_MAX_EVENT_NUM:B = 0x14t

.field public static final AVRCP_MAX_FILE_ATTRIBUTE:B = 0x7t

.field public static final AVRCP_MAX_FOLDER_BUFFER_SIZE:S = 0x200s

.field public static final AVRCP_MAX_FOLDER_DEPTH_NUM:B = 0x3ct

.field public static final AVRCP_MAX_GET_ELEMENT_ATTR_NUM:B = 0xat

.field public static final AVRCP_MAX_GET_ELEMENT_ITEM_SIZE:B = 0x8t

.field public static final AVRCP_MAX_MEDIA_ATTRIBUTE_ID:B = 0x7t

.field public static final AVRCP_MAX_PLAYERS_NUM:B = 0x14t

.field public static final AVRCP_MAX_PLAYER_NAME_SIZE:B = 0x3ct

.field public static final AVRCP_MAX_SEARCH_TEXT_SIZE:S = 0x80s

.field public static final AVRCP_MAX_VALUE_STRING_SIZE:B = 0x50t

.field public static final AVRCP_OPERATION_ID_BACKWARD:B = 0x4ct

.field public static final AVRCP_OPERATION_ID_FASTFORWARD:B = 0x49t

.field public static final AVRCP_OPERATION_ID_FORWARD:B = 0x4bt

.field public static final AVRCP_OPERATION_ID_PAUSE:B = 0x46t

.field public static final AVRCP_OPERATION_ID_PLAY:B = 0x44t

.field public static final AVRCP_OPERATION_ID_REWIND:B = 0x48t

.field public static final AVRCP_OPERATION_ID_STOP:B = 0x45t

.field public static final AVRCP_OPERATION_ID_VENDOR_NEXT_GROUP:S = 0x0s

.field public static final AVRCP_OPERATION_ID_VENDOR_PREVIOUS_GROUP:S = 0x1s

.field public static final AVRCP_OPERATION_ID_VENDOR_UNIQUE:B = 0x7et

.field public static final AVRCP_OPERATION_ID_VOLUME_DOWN:B = 0x42t

.field public static final AVRCP_OPERATION_ID_VOLUME_UP:B = 0x41t

.field public static final AVRCP_POP_BACKWARD:I = 0x4c

.field public static final AVRCP_POP_EJECT:I = 0x4a

.field public static final AVRCP_POP_FAST_FORWARD:I = 0x49

.field public static final AVRCP_POP_FORWARD:I = 0x4b

.field public static final AVRCP_POP_MUTE:I = 0x43

.field public static final AVRCP_POP_PAUSE:I = 0x46

.field public static final AVRCP_POP_PLAY:I = 0x44

.field public static final AVRCP_POP_POWER:I = 0x40

.field public static final AVRCP_POP_RECORD:I = 0x47

.field public static final AVRCP_POP_REWIND:I = 0x48

.field public static final AVRCP_POP_STOP:I = 0x45

.field public static final AVRCP_POP_VOLUME_DOWN:I = 0x42

.field public static final AVRCP_POP_VOLUME_UP:I = 0x41

.field public static final AVRCP_SCOPE_FILE_SYSTEM:B = 0x1t

.field public static final AVRCP_SCOPE_NOW_PLAYING:B = 0x3t

.field public static final AVRCP_SCOPE_PLAYER_LIST:B = 0x0t

.field public static final AVRCP_SCOPE_SEARCH:B = 0x2t

.field public static final DIR_DOWN:B = 0x1t

.field public static final DIR_UP:B = 0x0t

.field public static final EQUALIZER_OFF:I = 0x1

.field public static final EQUALIZER_ON:I = 0x2

.field public static final EVENT_ADDRESSED_PLAYER_CHANGED:I = 0xb

.field public static final EVENT_AVAILABLE_PLAYERS_CHANGED:I = 0xa

.field public static final EVENT_BATT_STATUS_CHANGED:I = 0x6

.field public static final EVENT_NOW_PLAYING_CONTENT_CHANGED:I = 0x9

.field public static final EVENT_PLAYBACK_POS_CHANGED:I = 0x5

.field public static final EVENT_PLAYBACK_STATUS_CHANGED:I = 0x1

.field public static final EVENT_PLAYER_APPLICATION_SETTING_CHANGED:I = 0x8

.field public static final EVENT_SYSTEM_STATUS_CHANGED:I = 0x7

.field public static final EVENT_TRACK_CHANGED:I = 0x2

.field public static final EVENT_TRACK_REACHED_END:I = 0x3

.field public static final EVENT_TRACK_REACHED_START:I = 0x4

.field public static final EVENT_UIDS_CHANGED:I = 0xc

.field public static final EVENT_VOLUME_CHANGED:I = 0xd

.field public static final FAIL:B = 0x1t

.field public static final ITEM_TYPE_ELEMENT:B = 0x3t

.field public static final ITEM_TYPE_FOLDER:B = 0x2t

.field public static final ITEM_TYPE_PLAYER:B = 0x1t

.field public static final MAX_ATTRIBUTE_NUM:I = 0x4

.field public static final MAX_ATTRVALUE_NUM:I = 0x7

.field public static final MEDIA_TYPE_AUDIO:B = 0x0t

.field public static final MEDIA_TYPE_VIDEO:B = 0x1t

.field public static final MEIDA_ATTR_ALBUM:I = 0x3

.field public static final MEIDA_ATTR_ARTIST:I = 0x2

.field public static final MEIDA_ATTR_GENRE:I = 0x6

.field public static final MEIDA_ATTR_NUM_OF_ALBUM:I = 0x4

.field public static final MEIDA_ATTR_PLAYING_TIME_MS:I = 0x7

.field public static final MEIDA_ATTR_TITLE:I = 0x1

.field public static final MEIDA_ATTR_TOTAL_NUM:I = 0x5

.field public static final OK:B = 0x0t

.field public static final PLAY_STATUS_ERROR:I = 0xff

.field public static final PLAY_STATUS_FWD_SEEK:I = 0x3

.field public static final PLAY_STATUS_PAUSED:I = 0x2

.field public static final PLAY_STATUS_PLAYING:I = 0x1

.field public static final PLAY_STATUS_REV_SEEK:I = 0x4

.field public static final PLAY_STATUS_STOPPED:I = 0x0

.field public static final REPEAT_MODE_ALL_TRACK:I = 0x3

.field public static final REPEAT_MODE_GROUP_TRACK:I = 0x4

.field public static final REPEAT_MODE_OFF:I = 0x1

.field public static final REPEAT_MODE_SINGLE_TRACK:I = 0x2

.field public static final SCAN_ALL_TRACK:I = 0x2

.field public static final SCAN_GROUP_TRACK:I = 0x3

.field public static final SCAN_OFF:I = 0x1

.field public static final SHUFFLE_ALL_TRACK:I = 0x2

.field public static final SHUFFLE_GROUP_TRACK:I = 0x3

.field public static final SHUFFLE_OFF:I = 0x1

.field public static final STATUS_OK:B = 0x4t

.field public static final UTF8_CHARSET:S = 0x6as


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getPreferVersion()B
    .locals 1

    .prologue
    .line 358
    const/16 v0, 0xa

    return v0
.end method
