.class public Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;
.super Ljava/lang/Thread;
.source "BTAvrcpMusicAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;
    }
.end annotation


# static fields
.field public static final AVRCP_PLAY_PAUSE:I = 0x2

.field public static final AVRCP_PLAY_PLAYING:I = 0x1

.field public static final AVRCP_PLAY_STOP:I = 0x0

.field public static final DEFAULT_METADATA_STRING:Ljava/lang/String; = " "

.field public static final LAST:I = 0x3

.field public static final META_CHANGED:Ljava/lang/String; = "com.android.music.metachanged"

.field public static final NEXT:I = 0x2

.field public static final NOW:I = 0x1

.field public static final PLAYBACK_COMPLETE:Ljava/lang/String; = "com.android.music.playbackcomplete"

.field public static final PLAYSTATE_CHANGED:Ljava/lang/String; = "com.android.music.playstatechanged"

.field private static final PLAY_UPDATE_PERIOD:I = 0x3e8

.field public static final QUEUE_CHANGED:Ljava/lang/String; = "com.android.music.queuechanged"

.field public static final QUIT_PLAYBACK:Ljava/lang/String; = "com.android.music.quitplayback"

.field private static final STATUS_FWD_SEEK:I = 0x3

.field private static final STATUS_PAUSED:I = 0x2

.field private static final STATUS_PLAYING:I = 0x1

.field private static final STATUS_REV_SEEK:I = 0x4

.field private static final STATUS_STOPPED:I = 0x0

.field public static final TAG:Ljava/lang/String; = "MMI_AVRCP"

.field private static mExtraAttribute:Z

.field private static mPlayStatus:I

.field private static mPreviousFFPlayStatus:I

.field private static mPreviousPlayStatus:I

.field private static mStartReceiver:Z

.field private static sMusicAlbum:Ljava/lang/String;

.field private static sMusicArtist:Ljava/lang/String;

.field private static sMusicId:J

.field private static sMusicPlaying:Z

.field private static sMusicTrack:Ljava/lang/String;

.field private static sPlayServiceInterface:Z


# instance fields
.field private final mActionKey:I

.field private final mActionKeyInfo:I

.field private final mActionRegNotify:I

.field private final mActionSetSetting:I

.field private mAdapterCallback:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;

.field private mAddToNowList:[J

.field private mAttrs:[B

.field private mAudioMax:I

.field private mAudioMgr:Landroid/media/AudioManager;

.field private mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

.field private mCapabilities:[B

.field private mConnected:Z

.field private mConnection:Landroid/content/ServiceConnection;

.field private mContext:Landroid/content/Context;

.field public mCurEqualSetting:B

.field public mCurRepeatSetting:B

.field public mCurScanSetting:B

.field public mCurShuffleSetting:B

.field private mCurValue:[B

.field private mDebug:Z

.field private mHandler:Landroid/os/Handler;

.field private mInitCapability:Z

.field private mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

.field private mNotifySongId:J

.field private mPendingRegBit:Ljava/util/BitSet;

.field private mPlayConnection:Landroid/content/ServiceConnection;

.field private mPlayService:Lcom/android/music/IMediaPlaybackService;

.field private mPlayStartBind:Z

.field private mPlayerStatus:B

.field private mRegBit:Ljava/util/BitSet;

.field private volatile mServiceLooper:Landroid/os/Looper;

.field private mStartBind:Z

.field private mStatusListener:Landroid/content/BroadcastReceiver;

.field private mSystemListener:Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;

.field private mUpdateSending:Z

.field private mValueNum:[B

.field private mValuesEqualizer:[B

.field private mValuesRepeat:[B

.field private mValuesScan:[B

.field private mValuesShuffle:[B

.field private mVolume:B


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v0, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 123
    sput-boolean v2, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mStartReceiver:Z

    .line 154
    sput-object v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicArtist:Ljava/lang/String;

    .line 156
    sput-object v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicAlbum:Ljava/lang/String;

    .line 158
    sput-object v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicTrack:Ljava/lang/String;

    .line 160
    const-wide/16 v0, -0x1

    sput-wide v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicId:J

    .line 162
    sput-boolean v2, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicPlaying:Z

    .line 164
    sput-boolean v3, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mExtraAttribute:Z

    .line 167
    sput-boolean v3, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sPlayServiceInterface:Z

    .line 181
    sput v2, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    .line 183
    sput v2, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPreviousPlayStatus:I

    .line 193
    sput v3, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPreviousFFPlayStatus:I

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;)V
    .locals 6
    .parameter "context"
    .parameter "server"

    .prologue
    const/16 v5, 0x12

    const/4 v4, 0x3

    const/4 v1, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 197
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 65
    iput-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    .line 67
    iput-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMgr:Landroid/media/AudioManager;

    .line 69
    const/16 v0, 0x64

    iput v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMax:I

    .line 89
    const/4 v0, 0x2

    iput-byte v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayerStatus:B

    .line 91
    iput-byte v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mVolume:B

    .line 93
    iput-byte v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mCurEqualSetting:B

    .line 95
    iput-byte v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mCurRepeatSetting:B

    .line 97
    iput-byte v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mCurShuffleSetting:B

    .line 99
    iput-byte v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mCurScanSetting:B

    .line 105
    const/16 v0, 0x11

    iput v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mActionKey:I

    .line 107
    iput v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mActionSetSetting:I

    .line 109
    const/16 v0, 0x21

    iput v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mActionKeyInfo:I

    .line 111
    const/16 v0, 0x22

    iput v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mActionRegNotify:I

    .line 113
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mStartBind:Z

    .line 115
    iput-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mServiceLooper:Landroid/os/Looper;

    .line 121
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mNotifySongId:J

    .line 143
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStartBind:Z

    .line 145
    iput-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayService:Lcom/android/music/IMediaPlaybackService;

    .line 187
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mConnected:Z

    .line 189
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mUpdateSending:Z

    .line 195
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mInitCapability:Z

    .line 1308
    new-instance v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$2;

    invoke-direct {v0, p0, p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$2;-><init>(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mSystemListener:Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;

    .line 1324
    iput-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    .line 1400
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mDebug:Z

    .line 1513
    new-instance v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$3;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$3;-><init>(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mStatusListener:Landroid/content/BroadcastReceiver;

    .line 1571
    new-instance v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$4;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$4;-><init>(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayConnection:Landroid/content/ServiceConnection;

    .line 1595
    new-instance v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$5;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$5;-><init>(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mConnection:Landroid/content/ServiceConnection;

    .line 1645
    new-instance v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;

    invoke-direct {v0, p0, p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;-><init>(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAdapterCallback:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;

    .line 198
    iput-object p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mContext:Landroid/content/Context;

    .line 199
    iput-object p2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    .line 200
    const-string v0, "audio"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMgr:Landroid/media/AudioManager;

    .line 203
    const-string v0, "BTAvrcpMusicAdapterThread "

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->setName(Ljava/lang/String;)V

    .line 204
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMgr:Landroid/media/AudioManager;

    if-eqz v0, :cond_0

    .line 205
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMgr:Landroid/media/AudioManager;

    invoke-virtual {v0, v4}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMax:I

    .line 206
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMgr:Landroid/media/AudioManager;

    invoke-virtual {v0, v4}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->convertToAbosoluteVolume(I)B

    move-result v0

    iput-byte v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mVolume:B

    .line 212
    :goto_0
    const/16 v0, 0x3f

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->convertToMgrVolume(B)I

    .line 213
    const/16 v0, 0x7f

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->convertToMgrVolume(B)I

    .line 214
    iget v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMax:I

    div-int/lit8 v0, v0, 0x2

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->convertToAbosoluteVolume(I)B

    .line 215
    iget v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMax:I

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->convertToAbosoluteVolume(I)B

    .line 218
    const-string v0, "MMI_AVRCP"

    const-string v1, "[BT][AVRCP] BTAvrcpMusicAdapter construct"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    invoke-direct {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->checkCapability()V

    .line 222
    sput-boolean v2, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mStartReceiver:Z

    .line 223
    return-void

    .line 208
    :cond_0
    iput v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMax:I

    .line 209
    iput-byte v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mVolume:B

    goto :goto_0
.end method

.method static synthetic access$000()I
    .locals 1

    .prologue
    .line 62
    sget v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPreviousPlayStatus:I

    return v0
.end method

.method static synthetic access$002(I)I
    .locals 0
    .parameter "x0"

    .prologue
    .line 62
    sput p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPreviousPlayStatus:I

    return p0
.end method

.method static synthetic access$102(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;Lcom/android/music/IMediaPlaybackService;)Lcom/android/music/IMediaPlaybackService;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 62
    iput-object p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayService:Lcom/android/music/IMediaPlaybackService;

    return-object p1
.end method

.method static synthetic access$200(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    return-object v0
.end method

.method static synthetic access$202(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;)Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 62
    iput-object p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    return-object p1
.end method

.method static synthetic access$300(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mDebug:Z

    return v0
.end method

.method static synthetic access$400(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAdapterCallback:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Ljava/util/BitSet;
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    return-object v0
.end method

.method static synthetic access$700(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    return-object v0
.end method

.method private checkCapability()V
    .locals 11

    .prologue
    const/16 v10, 0xe

    const/4 v9, 0x3

    const/4 v8, 0x0

    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 227
    const/16 v2, 0xa

    .line 228
    .local v2, version:B
    const/4 v0, 0x0

    .line 229
    .local v0, i:B
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->getSupportVersion()B

    move-result v2

    .line 231
    iget-boolean v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mInitCapability:Z

    if-ne v6, v3, :cond_0

    .line 232
    const-string v3, "MMI_AVRCP"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[BT][AVRCP] version:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/Byte;->toString(B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 310
    :goto_0
    return-void

    .line 236
    :cond_0
    const-string v3, "MMI_AVRCP"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[BT][AVRCP] init capability version:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/Byte;->toString(B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    iput-boolean v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mInitCapability:Z

    .line 239
    new-array v3, v7, [B

    iput-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAttrs:[B

    .line 240
    new-array v3, v7, [B

    iput-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mValueNum:[B

    .line 241
    const/4 v3, 0x4

    new-array v3, v3, [B

    iput-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mCurValue:[B

    .line 244
    const/4 v0, 0x0

    .line 245
    if-ne v2, v10, :cond_2

    .line 246
    const/4 v3, 0x5

    new-array v3, v3, [B

    iput-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mCapabilities:[B

    .line 251
    :goto_1
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mCapabilities:[B

    int-to-byte v1, v6

    .end local v0           #i:B
    .local v1, i:B
    aput-byte v6, v3, v0

    .line 252
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mCapabilities:[B

    add-int/lit8 v4, v1, 0x1

    int-to-byte v0, v4

    .end local v1           #i:B
    .restart local v0       #i:B
    aput-byte v7, v3, v1

    .line 260
    if-ne v2, v10, :cond_1

    .line 261
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mCapabilities:[B

    add-int/lit8 v4, v0, 0x1

    int-to-byte v1, v4

    .end local v0           #i:B
    .restart local v1       #i:B
    const/16 v4, 0x9

    aput-byte v4, v3, v0

    .line 262
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mCapabilities:[B

    add-int/lit8 v4, v1, 0x1

    int-to-byte v0, v4

    .end local v1           #i:B
    .restart local v0       #i:B
    const/16 v4, 0xa

    aput-byte v4, v3, v1

    .line 263
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mCapabilities:[B

    add-int/lit8 v4, v0, 0x1

    int-to-byte v1, v4

    .end local v0           #i:B
    .restart local v1       #i:B
    const/16 v4, 0xb

    aput-byte v4, v3, v0

    move v0, v1

    .line 268
    .end local v1           #i:B
    .restart local v0       #i:B
    :cond_1
    const/4 v0, 0x0

    .line 270
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAttrs:[B

    int-to-byte v1, v6

    .end local v0           #i:B
    .restart local v1       #i:B
    aput-byte v7, v3, v0

    .line 271
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAttrs:[B

    add-int/lit8 v4, v1, 0x1

    int-to-byte v0, v4

    .end local v1           #i:B
    .restart local v0       #i:B
    aput-byte v9, v3, v1

    .line 275
    const/4 v0, 0x0

    .line 276
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mValueNum:[B

    int-to-byte v1, v6

    .end local v0           #i:B
    .restart local v1       #i:B
    aput-byte v7, v3, v0

    .line 277
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mValueNum:[B

    add-int/lit8 v4, v1, 0x1

    int-to-byte v0, v4

    .end local v1           #i:B
    .restart local v0       #i:B
    aput-byte v7, v3, v1

    .line 282
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mCurValue:[B

    aput-byte v6, v3, v8

    .line 283
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mCurValue:[B

    aput-byte v6, v3, v6

    .line 288
    new-array v3, v9, [B

    iput-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mValuesRepeat:[B

    .line 289
    new-array v3, v7, [B

    iput-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mValuesShuffle:[B

    .line 292
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mValuesRepeat:[B

    aput-byte v6, v3, v8

    .line 293
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mValuesRepeat:[B

    aput-byte v7, v3, v6

    .line 294
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mValuesRepeat:[B

    aput-byte v9, v3, v7

    .line 296
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mValuesShuffle:[B

    aput-byte v6, v3, v8

    .line 297
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mValuesShuffle:[B

    aput-byte v7, v3, v6

    .line 299
    new-instance v3, Ljava/util/BitSet;

    const/16 v4, 0x10

    invoke-direct {v3, v4}, Ljava/util/BitSet;-><init>(I)V

    iput-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    .line 300
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    invoke-virtual {v3}, Ljava/util/BitSet;->clear()V

    .line 302
    new-instance v3, Ljava/util/BitSet;

    const/16 v4, 0x10

    invoke-direct {v3, v4}, Ljava/util/BitSet;-><init>(I)V

    iput-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPendingRegBit:Ljava/util/BitSet;

    .line 303
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPendingRegBit:Ljava/util/BitSet;

    invoke-virtual {v3}, Ljava/util/BitSet;->clear()V

    .line 305
    sget-boolean v3, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->sSupportMusicUI:Z

    if-eqz v3, :cond_3

    .line 306
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->start()V

    goto/16 :goto_0

    .line 248
    :cond_2
    new-array v3, v7, [B

    iput-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mCapabilities:[B

    goto/16 :goto_1

    .line 308
    :cond_3
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] No AvrcpMusic debug looper"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method private checkPlayStatusChange()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 1458
    const/4 v0, 0x1

    .line 1459
    .local v0, eventId:I
    const/4 v1, 0x0

    .line 1461
    .local v1, status:I
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->getPlayerstatus()B

    move-result v1

    .line 1462
    sget v2, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPreviousPlayStatus:I

    if-eq v2, v1, :cond_1

    .line 1463
    sput v1, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPreviousPlayStatus:I

    .line 1465
    const/4 v0, 0x2

    .line 1466
    invoke-virtual {p0, v0, v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->passNotifyMsg(II)Z

    move-result v2

    if-eq v4, v2, :cond_0

    .line 1467
    const-string v2, "MMI_AVRCP"

    const-string v3, "[BT][AVRCP] onReceive EVENT_TRACK_CHANGED fail"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1470
    :cond_0
    const/4 v0, 0x1

    .line 1471
    sget v2, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    invoke-virtual {p0, v0, v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->passNotifyMsg(II)Z

    move-result v2

    if-eq v4, v2, :cond_1

    .line 1472
    const-string v2, "MMI_AVRCP"

    const-string v3, "[BT][AVRCP] onReceive EVENT_PLAYBACK_STATUS_CHANGED fail"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1475
    :cond_1
    return-void
.end method

.method private convertToAbosoluteVolume(I)B
    .locals 6
    .parameter "iMgrVolume"

    .prologue
    .line 827
    const/4 v0, 0x0

    .line 828
    .local v0, ret:B
    int-to-float v1, p1

    iget v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMax:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    const/high16 v2, 0x42fe

    mul-float/2addr v1, v2

    float-to-int v1, v1

    int-to-byte v0, v1

    .line 829
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP] Adapter convertToAbosoluteVolume Mgr(%d) to abs(%d) MaxMgr(%d)"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    iget v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMax:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 831
    return v0
.end method

.method private convertToMgrVolume(B)I
    .locals 6
    .parameter "absolute"

    .prologue
    .line 835
    const/4 v0, 0x0

    .line 836
    .local v0, ret:I
    int-to-float v1, p1

    const/high16 v2, 0x42fe

    div-float/2addr v1, v2

    iget v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMax:I

    int-to-float v2, v2

    mul-float/2addr v1, v2

    float-to-int v0, v1

    .line 837
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP] Adapter convertToMgrVolume absolute(%d) to Mgr(%d) MaxMgr(%d)"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    iget v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMax:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 839
    return v0
.end method

.method private handleKeyMessage(Landroid/os/Message;)V
    .locals 14
    .parameter "msg"

    .prologue
    const/4 v13, 0x2

    const/4 v12, 0x4

    const/4 v11, 0x3

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 1123
    const/4 v0, 0x0

    .line 1125
    .local v0, apKey:I
    const-wide/16 v2, 0x0

    .line 1126
    .local v2, id:J
    const/4 v1, 0x0

    .line 1128
    .local v1, eventId:I
    iget v5, p1, Landroid/os/Message;->what:I

    sparse-switch v5, :sswitch_data_0

    .line 1268
    :goto_0
    return-void

    .line 1130
    :sswitch_0
    const-string v5, "[BT][AVRCP] Receive a Avrcpkey:%d "

    new-array v6, v10, [Ljava/lang/Object;

    iget v7, p1, Landroid/os/Message;->arg1:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 1131
    .local v4, sMsg:Ljava/lang/String;
    const-string v5, "MMI_AVRCP"

    const-string v6, "[BT][AVRCP] ACTION_KEY msg.what:%d arg1:%d arg2:%d"

    new-array v7, v11, [Ljava/lang/Object;

    iget v8, p1, Landroid/os/Message;->what:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    iget v8, p1, Landroid/os/Message;->arg1:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v10

    iget v8, p1, Landroid/os/Message;->arg2:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v13

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1133
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mContext:Landroid/content/Context;

    invoke-static {v5, v4, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 1135
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->handleKeyMessageKeyEvent(Landroid/os/Message;)V

    goto :goto_0

    .line 1140
    .end local v4           #sMsg:Ljava/lang/String;
    :sswitch_1
    const-string v5, "MMI_AVRCP"

    const-string v6, "[BT][AVRCP] KEY_INFO msg.what:%d arg1:%d arg2:%d"

    new-array v7, v11, [Ljava/lang/Object;

    iget v8, p1, Landroid/os/Message;->what:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    iget v8, p1, Landroid/os/Message;->arg1:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v10

    iget v8, p1, Landroid/os/Message;->arg2:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v13

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1141
    iget v5, p1, Landroid/os/Message;->arg1:I

    packed-switch v5, :pswitch_data_0

    .line 1218
    const-string v5, "KeyCode:%d"

    new-array v6, v10, [Ljava/lang/Object;

    iget v7, p1, Landroid/os/Message;->arg1:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 1219
    .restart local v4       #sMsg:Ljava/lang/String;
    goto :goto_0

    .line 1143
    .end local v4           #sMsg:Ljava/lang/String;
    :pswitch_0
    const-string v4, "POWER Key"

    .line 1144
    .restart local v4       #sMsg:Ljava/lang/String;
    goto :goto_0

    .line 1146
    .end local v4           #sMsg:Ljava/lang/String;
    :pswitch_1
    const-string v4, "VOLUME UP"

    .line 1147
    .restart local v4       #sMsg:Ljava/lang/String;
    goto/16 :goto_0

    .line 1149
    .end local v4           #sMsg:Ljava/lang/String;
    :pswitch_2
    const-string v4, "VOLUME DOWN"

    .line 1150
    .restart local v4       #sMsg:Ljava/lang/String;
    goto/16 :goto_0

    .line 1152
    .end local v4           #sMsg:Ljava/lang/String;
    :pswitch_3
    const-string v4, "MUTE"

    .line 1153
    .restart local v4       #sMsg:Ljava/lang/String;
    goto/16 :goto_0

    .line 1155
    .end local v4           #sMsg:Ljava/lang/String;
    :pswitch_4
    const-string v4, "PLAY"

    .line 1156
    .restart local v4       #sMsg:Ljava/lang/String;
    goto/16 :goto_0

    .line 1158
    .end local v4           #sMsg:Ljava/lang/String;
    :pswitch_5
    const-string v4, "STOP"

    .line 1159
    .restart local v4       #sMsg:Ljava/lang/String;
    goto/16 :goto_0

    .line 1161
    .end local v4           #sMsg:Ljava/lang/String;
    :pswitch_6
    const-string v4, "PAUSE"

    .line 1162
    .restart local v4       #sMsg:Ljava/lang/String;
    goto/16 :goto_0

    .line 1164
    .end local v4           #sMsg:Ljava/lang/String;
    :pswitch_7
    const-string v4, "RECORD"

    .line 1165
    .restart local v4       #sMsg:Ljava/lang/String;
    goto/16 :goto_0

    .line 1167
    .end local v4           #sMsg:Ljava/lang/String;
    :pswitch_8
    const-string v4, "REWIND"

    .line 1168
    .restart local v4       #sMsg:Ljava/lang/String;
    iget v5, p1, Landroid/os/Message;->arg2:I

    if-nez v5, :cond_1

    .line 1169
    sget v5, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    if-ne v5, v12, :cond_0

    .line 1170
    const-string v5, "MMI_AVRCP"

    const-string v6, "[AVRCP] back to playing status from rev_seek"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1171
    sget v5, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPreviousFFPlayStatus:I

    sput v5, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    .line 1172
    const-string v5, "MMI_AVRCP"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "[BT][AVRCP] update-info back mPlayStatus:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget v7, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1185
    :cond_0
    :goto_1
    invoke-direct {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->checkPlayStatusChange()V

    goto/16 :goto_0

    .line 1176
    :cond_1
    sget v5, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    if-eq v5, v12, :cond_2

    sget v5, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    if-ne v5, v11, :cond_3

    .line 1177
    :cond_2
    sput v10, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPreviousFFPlayStatus:I

    .line 1183
    :goto_2
    sput v12, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    goto :goto_1

    .line 1179
    :cond_3
    sget v5, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    sput v5, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPreviousFFPlayStatus:I

    goto :goto_2

    .line 1188
    .end local v4           #sMsg:Ljava/lang/String;
    :pswitch_9
    const-string v4, "FAST FORWARD"

    .line 1189
    .restart local v4       #sMsg:Ljava/lang/String;
    iget v5, p1, Landroid/os/Message;->arg2:I

    if-nez v5, :cond_5

    .line 1190
    sget v5, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    if-ne v5, v11, :cond_4

    .line 1191
    const-string v5, "MMI_AVRCP"

    const-string v6, "[AVRCP] back to playing status from fwd_seek"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1192
    sget v5, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPreviousFFPlayStatus:I

    sput v5, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    .line 1193
    const-string v5, "MMI_AVRCP"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "[BT][AVRCP] update-info back mPlayStatus:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget v7, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1206
    :cond_4
    :goto_3
    invoke-direct {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->checkPlayStatusChange()V

    goto/16 :goto_0

    .line 1197
    :cond_5
    sget v5, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    if-eq v5, v12, :cond_6

    sget v5, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    if-ne v5, v11, :cond_7

    .line 1198
    :cond_6
    sput v10, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPreviousFFPlayStatus:I

    .line 1204
    :goto_4
    sput v11, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    goto :goto_3

    .line 1200
    :cond_7
    sget v5, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    sput v5, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPreviousFFPlayStatus:I

    goto :goto_4

    .line 1209
    .end local v4           #sMsg:Ljava/lang/String;
    :pswitch_a
    const-string v4, "EJECT"

    .line 1210
    .restart local v4       #sMsg:Ljava/lang/String;
    goto/16 :goto_0

    .line 1212
    .end local v4           #sMsg:Ljava/lang/String;
    :pswitch_b
    const-string v4, "FORWARD"

    .line 1213
    .restart local v4       #sMsg:Ljava/lang/String;
    goto/16 :goto_0

    .line 1215
    .end local v4           #sMsg:Ljava/lang/String;
    :pswitch_c
    const-string v4, "BACKWARD"

    .line 1216
    .restart local v4       #sMsg:Ljava/lang/String;
    goto/16 :goto_0

    .line 1226
    .end local v4           #sMsg:Ljava/lang/String;
    :sswitch_2
    const-string v5, "MMI_AVRCP"

    const-string v6, "[BT][AVRCP] ACTION_REG_NOTIFY for notifyChange msg.what:%d arg1:%d arg2:%d cardinality:%d"

    new-array v7, v12, [Ljava/lang/Object;

    iget v8, p1, Landroid/os/Message;->what:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    iget v8, p1, Landroid/os/Message;->arg1:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v10

    iget v8, p1, Landroid/os/Message;->arg2:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v13

    iget-object v8, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    invoke-virtual {v8}, Ljava/util/BitSet;->cardinality()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v11

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1233
    iget-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    monitor-enter v6

    .line 1234
    :try_start_0
    iget v5, p1, Landroid/os/Message;->arg1:I

    sparse-switch v5, :sswitch_data_1

    .line 1262
    :cond_8
    :goto_5
    monitor-exit v6

    goto/16 :goto_0

    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    .line 1236
    :sswitch_3
    const/4 v1, 0x1

    .line 1237
    :try_start_1
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    invoke-virtual {v5, v1}, Ljava/util/BitSet;->get(I)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 1238
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/4 v7, 0x0

    const/4 v8, 0x0

    iget v9, p1, Landroid/os/Message;->arg1:I

    int-to-byte v9, v9

    invoke-virtual {v5, v7, v8, v9}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->notificationPlayStatusChangedNative(BBB)Z

    .line 1239
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    invoke-virtual {v5, v1}, Ljava/util/BitSet;->clear(I)V

    goto :goto_5

    .line 1243
    :sswitch_4
    const/4 v1, 0x2

    .line 1244
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    invoke-virtual {v5, v1}, Ljava/util/BitSet;->get(I)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 1245
    sget-wide v7, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicId:J

    iput-wide v7, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mNotifySongId:J

    .line 1246
    const-string v5, "MMI_AVRCP"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "[BT][AVRCP] songid:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-wide v8, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mNotifySongId:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1247
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/4 v7, 0x0

    const/4 v8, 0x0

    iget-wide v9, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mNotifySongId:J

    invoke-virtual {v5, v7, v8, v9, v10}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->notificationTrackChangedNative(BBJ)Z

    .line 1248
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    invoke-virtual {v5, v1}, Ljava/util/BitSet;->clear(I)V

    goto :goto_5

    .line 1253
    :sswitch_5
    const/16 v1, 0x9

    .line 1254
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    invoke-virtual {v5, v1}, Ljava/util/BitSet;->get(I)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 1255
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v5, v7, v8}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->notificationNowPlayingChangedNative(BB)Z

    .line 1256
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    invoke-virtual {v5, v1}, Ljava/util/BitSet;->clear(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_5

    .line 1128
    :sswitch_data_0
    .sparse-switch
        0x11 -> :sswitch_0
        0x21 -> :sswitch_1
        0x22 -> :sswitch_2
    .end sparse-switch

    .line 1141
    :pswitch_data_0
    .packed-switch 0x40
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
    .end packed-switch

    .line 1234
    :sswitch_data_1
    .sparse-switch
        0x1 -> :sswitch_3
        0x2 -> :sswitch_4
        0x9 -> :sswitch_5
    .end sparse-switch
.end method

.method private handleKeyMessageKeyEvent(Landroid/os/Message;)V
    .locals 8
    .parameter "msg"

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 1271
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    if-nez v1, :cond_1

    .line 1306
    :cond_0
    :goto_0
    return-void

    .line 1277
    :cond_1
    :try_start_0
    iget v1, p1, Landroid/os/Message;->arg1:I

    packed-switch v1, :pswitch_data_0

    .line 1300
    :pswitch_0
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP] Unhandle AvrcpKey:%d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p1, Landroid/os/Message;->what:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1303
    :catch_0
    move-exception v0

    .line 1304
    .local v0, ex:Landroid/os/RemoteException;
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP] AVRCP fail to passToHandleMessage what:%d"

    new-array v3, v6, [Ljava/lang/Object;

    iget v4, p1, Landroid/os/Message;->what:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1279
    .end local v0           #ex:Landroid/os/RemoteException;
    :pswitch_1
    :try_start_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    invoke-interface {v1}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->getPlayStatus()B

    move-result v1

    if-eq v6, v1, :cond_0

    .line 1280
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    invoke-interface {v1}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->play()V

    goto :goto_0

    .line 1284
    :pswitch_2
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    invoke-interface {v1}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->getPlayStatus()B

    move-result v1

    if-eqz v1, :cond_0

    .line 1285
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    invoke-interface {v1}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->stop()V

    goto :goto_0

    .line 1289
    :pswitch_3
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    invoke-interface {v1}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->getPlayStatus()B

    move-result v1

    if-ne v6, v1, :cond_0

    .line 1290
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    invoke-interface {v1}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->pause()V

    goto :goto_0

    .line 1294
    :pswitch_4
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    invoke-interface {v1}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->next()V

    goto :goto_0

    .line 1297
    :pswitch_5
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    invoke-interface {v1}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->prev()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1277
    nop

    :pswitch_data_0
    .packed-switch 0x44
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method private handleSettingMessage(Landroid/os/Message;)V
    .locals 0
    .parameter "msg"

    .prologue
    .line 1120
    return-void
.end method

.method public static hasStartReceiver()Z
    .locals 1

    .prologue
    .line 1403
    sget-boolean v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mStartReceiver:Z

    return v0
.end method

.method private sendHandlerMessageDelayed(IIIJ)Z
    .locals 5
    .parameter "action"
    .parameter "arg1"
    .parameter "arg2"
    .parameter "delayMillis"

    .prologue
    .line 1410
    const/4 v1, 0x0

    .line 1411
    .local v1, result:Z
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mContext:Landroid/content/Context;

    if-eqz v3, :cond_1

    .line 1413
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mHandler:Landroid/os/Handler;

    if-eqz v3, :cond_1

    .line 1414
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 1415
    .local v0, msg:Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 1417
    iput p2, v0, Landroid/os/Message;->arg1:I

    .line 1418
    iput p3, v0, Landroid/os/Message;->arg2:I

    .line 1420
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v0, p4, p5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    move-result v1

    .line 1421
    if-nez v1, :cond_0

    .line 1422
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] sendMessageDelayed fail ! "

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    move v2, v1

    .line 1427
    .end local v0           #msg:Landroid/os/Message;
    .end local v1           #result:Z
    .local v2, result:I
    :goto_0
    return v2

    .end local v2           #result:I
    .restart local v1       #result:Z
    :cond_1
    move v2, v1

    .restart local v2       #result:I
    goto :goto_0
.end method

.method public static updateMusicTrackInfo(Landroid/content/Intent;)V
    .locals 10
    .parameter "intent"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1481
    if-eqz p0, :cond_2

    .line 1482
    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v5, "com.android.music.metachanged"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1483
    const-string v2, "artist"

    invoke-virtual {p0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicArtist:Ljava/lang/String;

    .line 1484
    const-string v2, "album"

    invoke-virtual {p0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicAlbum:Ljava/lang/String;

    .line 1485
    const-string v2, "track"

    invoke-virtual {p0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicTrack:Ljava/lang/String;

    .line 1487
    const-string v2, "id"

    const-wide/16 v5, -0x1

    invoke-virtual {p0, v2, v5, v6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v5

    sput-wide v5, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicId:J

    .line 1488
    const-string v2, "MMI_AVRCP"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[BT][AVRCP] update-info id:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "%d"

    new-array v7, v4, [Ljava/lang/Object;

    sget-wide v8, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v7, v3

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1492
    :cond_0
    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v5, "com.android.music.playstatechanged"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1494
    const-string v2, "playing"

    invoke-virtual {p0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 1496
    .local v0, b1:Ljava/lang/Boolean;
    const-string v2, "playstate"

    invoke-virtual {p0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 1497
    .local v1, b2:Ljava/lang/Boolean;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_1
    move v2, v4

    :goto_0
    sput-boolean v2, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicPlaying:Z

    .line 1498
    const-string v2, "MMI_AVRCP"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[BT][AVRCP] update-info playing:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1503
    .end local v0           #b1:Ljava/lang/Boolean;
    .end local v1           #b2:Ljava/lang/Boolean;
    :cond_2
    sget-object v2, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicArtist:Ljava/lang/String;

    if-eqz v2, :cond_4

    .line 1504
    const-string v2, "MMI_AVRCP"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[BT][AVRCP] track-info artist:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicArtist:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " isPlaying:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "%b"

    new-array v4, v4, [Ljava/lang/Object;

    sget-boolean v7, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicPlaying:Z

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v4, v3

    invoke-static {v6, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " id:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-wide v4, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1511
    :goto_1
    return-void

    .restart local v0       #b1:Ljava/lang/Boolean;
    .restart local v1       #b2:Ljava/lang/Boolean;
    :cond_3
    move v2, v3

    .line 1497
    goto :goto_0

    .line 1507
    .end local v0           #b1:Ljava/lang/Boolean;
    .end local v1           #b2:Ljava/lang/Boolean;
    :cond_4
    const-string v2, "MMI_AVRCP"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[BT][AVRCP] track-info isPlaying:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "%b"

    new-array v4, v4, [Ljava/lang/Object;

    sget-boolean v7, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicPlaying:Z

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v4, v3

    invoke-static {v6, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " id:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-wide v4, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private static updateNewPlayStatus(I)V
    .locals 6
    .parameter "newPlayStatus"

    .prologue
    const/4 v5, 0x4

    const/4 v4, 0x3

    .line 1436
    sget v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    .line 1438
    .local v0, before:I
    const-string v1, "MMI_AVRCP"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[BT][AVRCP] updateNewPlayStatuso status:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " newStatus:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1440
    if-eq v4, p0, :cond_0

    if-eq v5, p0, :cond_0

    const/4 v1, 0x1

    if-ne v1, p0, :cond_3

    .line 1441
    :cond_0
    const/4 p0, 0x1

    .line 1444
    sget v1, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    if-eq v4, v1, :cond_1

    if-eq v5, p0, :cond_1

    .line 1445
    sput p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    .line 1452
    :cond_1
    :goto_0
    sget v1, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    if-eq v0, v1, :cond_2

    .line 1453
    const-string v1, "MMI_AVRCP"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[BT][AVRCP] update-info new mPlayStatus:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1455
    :cond_2
    return-void

    .line 1449
    :cond_3
    sput p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStatus:I

    goto :goto_0
.end method


# virtual methods
.method public abortContinueInd()V
    .locals 2

    .prologue
    .line 792
    const-string v0, "MMI_AVRCP"

    const-string v1, "Receive an abort indication !"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 793
    return-void
.end method

.method public addToNowPlaying(J)Z
    .locals 11
    .parameter "id"

    .prologue
    const/4 v5, 0x1

    .line 909
    const/4 v4, 0x0

    .line 910
    .local v4, ret:Z
    const/4 v2, 0x0

    .line 912
    .local v2, hasExit:Z
    const/4 v3, 0x0

    .line 914
    .local v3, i:I
    invoke-virtual {p0, v5}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->checkAndBindPlayService(Z)V

    .line 915
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayService:Lcom/android/music/IMediaPlaybackService;

    if-eqz v5, :cond_0

    .line 917
    const/4 v5, 0x1

    :try_start_0
    new-array v0, v5, [J

    .line 918
    .local v0, curList:[J
    const/4 v5, 0x0

    aput-wide p1, v0, v5

    .line 919
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayService:Lcom/android/music/IMediaPlaybackService;

    const/4 v6, 0x3

    invoke-interface {v5, v0, v6}, Lcom/android/music/IMediaPlaybackService;->enqueue([JI)V

    .line 920
    const-string v5, "MMI_AVRCP"

    const-string v6, "[BT][AVRCP] enqueu %d"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const/4 v9, 0x0

    aget-wide v9, v0, v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 921
    const/4 v4, 0x1

    .line 927
    .end local v0           #curList:[J
    :cond_0
    :goto_0
    return v4

    .line 922
    :catch_0
    move-exception v1

    .line 923
    .local v1, ex:Landroid/os/RemoteException;
    const-string v5, "MMI_AVRCP"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "[BT][AVRCP] BTAvrcpMusicAdapter addToNowPlaying enqueue exception:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public checkAndBindMusicService()V
    .locals 0

    .prologue
    .line 854
    return-void
.end method

.method public checkAndBindPlayService(Z)V
    .locals 2
    .parameter "wait"

    .prologue
    .line 861
    sget-boolean v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sPlayServiceInterface:Z

    if-eqz v0, :cond_1

    .line 862
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayService:Lcom/android/music/IMediaPlaybackService;

    if-nez v0, :cond_0

    .line 864
    :try_start_0
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->startToBindPlayService()V

    .line 865
    const/4 v0, 0x1

    if-ne v0, p1, :cond_0

    .line 867
    const-wide/16 v0, 0x7d0

    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sleep(J)V

    .line 869
    const-string v0, "MMI_AVRCP"

    const-string v1, "[BT][AVRCP] sleep 2000 to wait for binding "

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 879
    :cond_0
    :goto_0
    return-void

    .line 876
    :cond_1
    const-string v0, "MMI_AVRCP"

    const-string v1, "[BT][AVRCP] ignore the mMusic playService"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 871
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public deinit()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 330
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mConnection:Landroid/content/ServiceConnection;

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mStartBind:Z

    if-eqz v1, :cond_1

    .line 331
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP] Adapter deinit"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    if-eqz v1, :cond_0

    .line 333
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP][TT] unregistercallback "

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 335
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAdapterCallback:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;

    invoke-interface {v1, v2}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->unregisterCallback(Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 341
    :cond_0
    :goto_0
    iput-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    .line 342
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->stopToBind()V

    .line 344
    :cond_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayService:Lcom/android/music/IMediaPlaybackService;

    if-eqz v1, :cond_2

    .line 345
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v1, v2}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->unbindService(Landroid/content/ServiceConnection;)V

    .line 346
    iput-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayService:Lcom/android/music/IMediaPlaybackService;

    .line 348
    :cond_2
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mServiceLooper:Landroid/os/Looper;

    if-eqz v1, :cond_3

    .line 349
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mServiceLooper:Landroid/os/Looper;

    invoke-virtual {v1}, Landroid/os/Looper;->quit()V

    .line 350
    iput-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mServiceLooper:Landroid/os/Looper;

    .line 352
    :cond_3
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->stopReceiver()V

    .line 354
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mHandler:Landroid/os/Handler;

    if-eqz v1, :cond_4

    .line 355
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP] BTAvrcpMusicAdapter mHandler join 2"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->interrupt()V

    .line 359
    const-wide/16 v1, 0x64

    :try_start_1
    invoke-virtual {p0, v1, v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->join(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 364
    :cond_4
    :goto_1
    return-void

    .line 336
    :catch_0
    move-exception v0

    .line 337
    .local v0, ex:Landroid/os/RemoteException;
    const-string v1, "MMI_AVRCP"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[BT][AVRCP][TT] unregistercallback exception: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 360
    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 361
    .local v0, ex:Ljava/lang/InterruptedException;
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP] join fail"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public getAbsoluteVolume()B
    .locals 1

    .prologue
    .line 823
    iget-byte v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mVolume:B

    return v0
.end method

.method public getCurPlayerAppValue(B)B
    .locals 10
    .parameter "attrId"

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v2, 0x0

    .line 454
    const/4 v1, 0x0

    .line 456
    .local v1, value:I
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->checkAndBindMusicService()V

    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    if-eqz v3, :cond_0

    .line 457
    packed-switch p1, :pswitch_data_0

    .line 481
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] attr_id is not find attr_id:%d"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 482
    :goto_0
    return v2

    :cond_0
    const v2, 0x1
    goto :goto_0

    .line 460
    :pswitch_0
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    invoke-interface {v3}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->getRepeatMode()I

    move-result v1

    .line 461
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] getRepeatMode ret %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 465
    :goto_1
    int-to-byte v2, v1

    goto :goto_0

    .line 462
    :catch_0
    move-exception v0

    .line 463
    .local v0, ex:Landroid/os/RemoteException;
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] Exception ! Fail to getRepeatMode %d %s"

    new-array v5, v9, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 469
    .end local v0           #ex:Landroid/os/RemoteException;
    :pswitch_1
    :try_start_1
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    invoke-interface {v3}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->getShuffleMode()I

    move-result v1

    .line 470
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] getShuffleMode ret %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 474
    :goto_2
    int-to-byte v2, v1

    goto :goto_0

    .line 471
    :catch_1
    move-exception v0

    .line 472
    .restart local v0       #ex:Landroid/os/RemoteException;
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] Exception ! Fail to getShuffleMode %d %s"

    new-array v5, v9, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 457
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getElementAttribute(JI)Ljava/lang/String;
    .locals 11
    .parameter "identifier"
    .parameter "attrId"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 1018
    const/4 v3, 0x0

    .line 1019
    .local v3, s:Ljava/lang/String;
    const/4 v2, 0x0

    .line 1020
    .local v2, lsplit:I
    const-wide/16 v0, 0x0

    .line 1036
    .local v0, id:J
    const-string v7, "MMI_AVRCP"

    const-string v8, "[BT][AVRCP] AVRCP getElementAttribute %b"

    new-array v9, v5, [Ljava/lang/Object;

    iget-object v10, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayService:Lcom/android/music/IMediaPlaybackService;

    if-eqz v10, :cond_0

    :goto_0
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v9, v6

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v7, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1039
    packed-switch p3, :pswitch_data_0

    move-object v4, v3

    .line 1083
    .end local v3           #s:Ljava/lang/String;
    .local v4, s:Ljava/lang/String;
    :goto_1
    return-object v4

    .end local v4           #s:Ljava/lang/String;
    .restart local v3       #s:Ljava/lang/String;
    :cond_0
    move v5, v6

    .line 1036
    goto :goto_0

    .line 1041
    :pswitch_0
    sget-object v3, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicTrack:Ljava/lang/String;

    .line 1042
    if-nez v3, :cond_1

    .line 1043
    const-string v3, ""

    .line 1074
    :cond_1
    :goto_2
    :pswitch_1
    if-nez v3, :cond_2

    .line 1075
    const-string v3, ""

    :cond_2
    move-object v4, v3

    .line 1083
    .end local v3           #s:Ljava/lang/String;
    .restart local v4       #s:Ljava/lang/String;
    goto :goto_1

    .line 1047
    .end local v4           #s:Ljava/lang/String;
    .restart local v3       #s:Ljava/lang/String;
    :pswitch_2
    sget-object v3, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicArtist:Ljava/lang/String;

    .line 1048
    if-nez v3, :cond_1

    .line 1049
    const-string v3, ""

    goto :goto_2

    .line 1053
    :pswitch_3
    sget-object v3, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicAlbum:Ljava/lang/String;

    .line 1054
    if-nez v3, :cond_1

    .line 1055
    const-string v3, ""

    goto :goto_2

    .line 1039
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public getNowPlaying()[J
    .locals 5

    .prologue
    .line 931
    const/4 v1, 0x0

    .line 933
    .local v1, playing:[J
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->checkAndBindPlayService(Z)V

    .line 934
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayService:Lcom/android/music/IMediaPlaybackService;

    if-nez v2, :cond_0

    .line 935
    const-string v2, "MMI_AVRCP"

    const-string v3, "[AVRCP] no mPlayService for getNowPlaying"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 936
    const/4 v2, 0x0

    .line 947
    :goto_0
    return-object v2

    .line 939
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayService:Lcom/android/music/IMediaPlaybackService;

    invoke-interface {v2}, Lcom/android/music/IMediaPlaybackService;->getQueue()[J

    move-result-object v1

    .line 940
    const-string v2, "MMI_AVRCP"

    const-string v3, "[AVRCP] getQueue from mPlayService"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 941
    if-eqz v1, :cond_1

    .line 942
    const-string v2, "MMI_AVRCP"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[AVRCP] getQueue from mPlayService length:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    array-length v4, v1

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_1
    move-object v2, v1

    .line 947
    goto :goto_0

    .line 944
    :catch_0
    move-exception v0

    .line 945
    .local v0, ex:Landroid/os/RemoteException;
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getPlayerAppAttrText(B)Ljava/lang/String;
    .locals 5
    .parameter "attrId"

    .prologue
    .line 557
    packed-switch p1, :pswitch_data_0

    .line 567
    const-string v0, "MMI_AVRCP"

    const-string v1, "[BT][AVRCP] getPlayerAppAttrText unknow id:%d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 568
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 559
    :pswitch_0
    const-string v0, "Equalizer Setting"

    goto :goto_0

    .line 561
    :pswitch_1
    const-string v0, "RepeatMode Setting"

    goto :goto_0

    .line 563
    :pswitch_2
    const-string v0, "Shuffle Setting"

    goto :goto_0

    .line 565
    :pswitch_3
    const-string v0, "Scan Setting"

    goto :goto_0

    .line 557
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public getPlayerAppValueText(BB)Ljava/lang/String;
    .locals 1
    .parameter "attrId"
    .parameter "valueId"

    .prologue
    const/4 v0, 0x0

    .line 573
    packed-switch p1, :pswitch_data_0

    .line 617
    :goto_0
    return-object v0

    .line 575
    :pswitch_0
    packed-switch p2, :pswitch_data_1

    goto :goto_0

    .line 577
    :pswitch_1
    const-string v0, "Equal Off"

    goto :goto_0

    .line 579
    :pswitch_2
    const-string v0, "Equal On"

    goto :goto_0

    .line 585
    :pswitch_3
    packed-switch p2, :pswitch_data_2

    goto :goto_0

    .line 587
    :pswitch_4
    const-string v0, "Repeat Off"

    goto :goto_0

    .line 589
    :pswitch_5
    const-string v0, "Repeat Single"

    goto :goto_0

    .line 591
    :pswitch_6
    const-string v0, "Repeat All"

    goto :goto_0

    .line 597
    :pswitch_7
    packed-switch p2, :pswitch_data_3

    goto :goto_0

    .line 599
    :pswitch_8
    const-string v0, "Shuffle Off"

    goto :goto_0

    .line 601
    :pswitch_9
    const-string v0, "Shuffle All"

    goto :goto_0

    .line 607
    :pswitch_a
    packed-switch p2, :pswitch_data_4

    goto :goto_0

    .line 609
    :pswitch_b
    const-string v0, "Equal Off"

    goto :goto_0

    .line 611
    :pswitch_c
    const-string v0, "Equal On"

    goto :goto_0

    .line 573
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_3
        :pswitch_7
        :pswitch_a
    .end packed-switch

    .line 575
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 585
    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch

    .line 597
    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_8
        :pswitch_9
    .end packed-switch

    .line 607
    :pswitch_data_4
    .packed-switch 0x1
        :pswitch_b
        :pswitch_c
    .end packed-switch
.end method

.method public getPlayerstatus()B
    .locals 8

    .prologue
    .line 657
    const/4 v3, -0x1

    .line 658
    .local v3, status:B
    const/4 v0, 0x0

    .line 659
    .local v0, bPlay:Z
    const-wide/16 v1, 0x0

    .line 661
    .local v1, id:J
    sget-boolean v4, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicPlaying:Z

    if-eqz v4, :cond_0

    .line 662
    const/4 v3, 0x1

    .line 670
    :goto_0
    iput-byte v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayerStatus:B

    .line 672
    return v3

    .line 664
    :cond_0
    const-wide/16 v4, -0x1

    sget-wide v6, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicId:J

    cmp-long v4, v4, v6

    if-eqz v4, :cond_1

    .line 665
    const/4 v3, 0x2

    goto :goto_0

    .line 667
    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getPlayerstatusSongLength()I
    .locals 4

    .prologue
    .line 676
    const/4 v0, 0x0

    .line 678
    .local v0, duration:I
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->checkAndBindPlayService(Z)V

    .line 679
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayService:Lcom/android/music/IMediaPlaybackService;

    if-eqz v2, :cond_0

    .line 681
    :try_start_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayService:Lcom/android/music/IMediaPlaybackService;

    invoke-interface {v2}, Lcom/android/music/IMediaPlaybackService;->duration()J
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    long-to-int v0, v2

    :goto_0
    move v2, v0

    .line 688
    :goto_1
    return v2

    .line 682
    :catch_0
    move-exception v1

    .line 683
    .local v1, ex:Landroid/os/RemoteException;
    const/4 v0, 0x0

    goto :goto_0

    .line 688
    .end local v1           #ex:Landroid/os/RemoteException;
    :cond_0
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public getPlayerstatusSongPos()I
    .locals 4

    .prologue
    .line 692
    const/4 v1, 0x0

    .line 694
    .local v1, position:I
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->checkAndBindPlayService(Z)V

    .line 695
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayService:Lcom/android/music/IMediaPlaybackService;

    if-eqz v2, :cond_0

    .line 697
    :try_start_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayService:Lcom/android/music/IMediaPlaybackService;

    invoke-interface {v2}, Lcom/android/music/IMediaPlaybackService;->position()J
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    long-to-int v1, v2

    :goto_0
    move v2, v1

    .line 703
    :goto_1
    return v2

    .line 698
    :catch_0
    move-exception v0

    .line 699
    .local v0, ex:Landroid/os/RemoteException;
    const/4 v1, 0x0

    goto :goto_0

    .line 703
    .end local v0           #ex:Landroid/os/RemoteException;
    :cond_0
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public getSupportVersion()B
    .locals 1

    .prologue
    .line 321
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->checkAndBindPlayService(Z)V

    .line 323
    sget-boolean v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sPlayServiceInterface:Z

    if-eqz v0, :cond_0

    .line 324
    const/16 v0, 0xe

    .line 326
    :goto_0
    return v0

    :cond_0
    const/16 v0, 0xd

    goto :goto_0
.end method

.method public informBatteryStatus(B)V
    .locals 5
    .parameter "status"

    .prologue
    .line 622
    const-string v0, "MMI_AVRCP"

    const-string v1, "[BT][AVRCP] informBatteryStatus status:%d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 623
    return-void
.end method

.method public informDisplayCharset(B[S)Z
    .locals 7
    .parameter "count"
    .parameter "charsets"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 628
    const/4 v0, 0x0

    .local v0, i:B
    :goto_0
    array-length v3, p2

    if-ge v0, v3, :cond_1

    if-ge v0, p1, :cond_1

    .line 629
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] charset i:%d value:%d"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v6

    aput-object v6, v5, v2

    aget-short v6, p2, v0

    invoke-static {v6}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 630
    aget-short v3, p2, v0

    const/16 v4, 0x6a

    if-ne v3, v4, :cond_0

    .line 635
    :goto_1
    return v1

    .line 628
    :cond_0
    add-int/lit8 v3, v0, 0x1

    int-to-byte v0, v3

    goto :goto_0

    :cond_1
    move v1, v2

    .line 635
    goto :goto_1
.end method

.method public init()V
    .locals 0

    .prologue
    .line 316
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->startReceiver()V

    .line 317
    return-void
.end method

.method public listPlayerAppAttribute()[B
    .locals 1

    .prologue
    .line 426
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAttrs:[B

    return-object v0
.end method

.method public listPlayerAppValue(B)[B
    .locals 5
    .parameter "attrId"

    .prologue
    .line 433
    packed-switch p1, :pswitch_data_0

    .line 449
    const-string v0, "MMI_AVRCP"

    const-string v1, "[BT][AVRCP] listPlayerAppValue attr_id:%d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 450
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 435
    :pswitch_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mValuesEqualizer:[B

    goto :goto_0

    .line 438
    :pswitch_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mValuesRepeat:[B

    goto :goto_0

    .line 441
    :pswitch_2
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mValuesShuffle:[B

    goto :goto_0

    .line 444
    :pswitch_3
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mValuesScan:[B

    goto :goto_0

    .line 433
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public notificationBatteryStatusChanged(BBB)V
    .locals 1
    .parameter "error"
    .parameter "isinterim"
    .parameter "status"

    .prologue
    .line 639
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    if-eqz v0, :cond_0

    .line 640
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    invoke-virtual {v0, p1, p2, p3}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->notificationBatteryStatusChanged(BBB)V

    .line 642
    :cond_0
    return-void
.end method

.method public notificationSystemStatusChanged(BBB)V
    .locals 1
    .parameter "error"
    .parameter "isinterim"
    .parameter "status"

    .prologue
    .line 645
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    if-eqz v0, :cond_0

    .line 646
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    invoke-virtual {v0, p1, p2, p3}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->notificationSystemStatusChanged(BBB)V

    .line 648
    :cond_0
    return-void
.end method

.method public notificationVolumeChanged(BBB)V
    .locals 1
    .parameter "error"
    .parameter "isinterim"
    .parameter "volume"

    .prologue
    .line 651
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    if-eqz v0, :cond_0

    .line 652
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    invoke-virtual {v0, p1, p2, p3}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->notificationVolumeChanged(BBB)V

    .line 654
    :cond_0
    return-void
.end method

.method public onConnect()V
    .locals 3

    .prologue
    .line 367
    const-string v0, "MMI_AVRCP"

    const-string v1, "[BT][AVRCP] Adapter onConnect"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 368
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->startToBind()V

    .line 369
    const-string v0, "MMI_AVRCP"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[BT][AVRCP] mbPlayServiceInterface is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sPlayServiceInterface:Z

    invoke-static {v2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    monitor-enter v1

    .line 376
    :try_start_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->clear()V

    .line 377
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 378
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPendingRegBit:Ljava/util/BitSet;

    if-eqz v0, :cond_0

    .line 379
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPendingRegBit:Ljava/util/BitSet;

    monitor-enter v1

    .line 380
    :try_start_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPendingRegBit:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->clear()V

    .line 381
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 384
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mConnected:Z

    .line 385
    return-void

    .line 377
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 381
    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method

.method public onDisconnect()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 388
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mConnection:Landroid/content/ServiceConnection;

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mStartBind:Z

    if-eqz v1, :cond_1

    .line 389
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP] Adapter onDisconnect"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    if-eqz v1, :cond_0

    .line 392
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP][TT] unregistercallback "

    new-array v3, v5, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 394
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAdapterCallback:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;

    invoke-interface {v1, v2}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->unregisterCallback(Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 402
    :cond_0
    :goto_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    .line 403
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->stopToBind()V

    .line 410
    :cond_1
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    monitor-enter v2

    .line 411
    :try_start_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    invoke-virtual {v1}, Ljava/util/BitSet;->clear()V

    .line 412
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 413
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPendingRegBit:Ljava/util/BitSet;

    monitor-enter v2

    .line 414
    :try_start_2
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPendingRegBit:Ljava/util/BitSet;

    invoke-virtual {v1}, Ljava/util/BitSet;->clear()V

    .line 415
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 417
    iput-boolean v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mConnected:Z

    .line 418
    iput-boolean v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mUpdateSending:Z

    .line 419
    return-void

    .line 395
    :catch_0
    move-exception v0

    .line 396
    .local v0, ex:Landroid/os/RemoteException;
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP][TT] BTAvrcpMusicAdapter onDisconnect unregistercallback Exception: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 412
    .end local v0           #ex:Landroid/os/RemoteException;
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1

    .line 415
    :catchall_1
    move-exception v1

    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v1
.end method

.method public passNotifyMsg(II)Z
    .locals 2
    .parameter "event"
    .parameter "interval"

    .prologue
    .line 1004
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mHandler:Landroid/os/Handler;

    if-eqz v1, :cond_0

    .line 1005
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 1006
    .local v0, msg:Landroid/os/Message;
    const/16 v1, 0x22

    iput v1, v0, Landroid/os/Message;->what:I

    .line 1008
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 1009
    iput p2, v0, Landroid/os/Message;->arg2:I

    .line 1011
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1012
    const/4 v1, 0x1

    .line 1014
    .end local v0           #msg:Landroid/os/Message;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public passThroughKeyInd(IB)V
    .locals 8
    .parameter "keyvalue"
    .parameter "isPress"

    .prologue
    const/4 v7, 0x1

    .line 979
    const/4 v0, 0x0

    .line 981
    .local v0, apKey:I
    const-string v3, "[BT][AVRCP] Receive a Avrcpkey:%d (APKey:%d)"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 983
    .local v2, sMsg:Ljava/lang/String;
    const-string v3, "MMI_AVRCP"

    invoke-static {v3, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 985
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mContext:Landroid/content/Context;

    if-eqz v3, :cond_0

    if-ne p2, v7, :cond_0

    sget-boolean v3, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->sSupportMusicUI:Z

    if-eqz v3, :cond_0

    .line 988
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mHandler:Landroid/os/Handler;

    if-eqz v3, :cond_0

    .line 989
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 990
    .local v1, msg:Landroid/os/Message;
    const/16 v3, 0x21

    iput v3, v1, Landroid/os/Message;->what:I

    .line 992
    iput p1, v1, Landroid/os/Message;->arg1:I

    .line 993
    iput p2, v1, Landroid/os/Message;->arg2:I

    .line 995
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1000
    .end local v1           #msg:Landroid/os/Message;
    :cond_0
    return-void
.end method

.method public passToHandleMessage(Landroid/os/Message;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 1107
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 1113
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->handleKeyMessage(Landroid/os/Message;)V

    .line 1116
    :goto_0
    return-void

    .line 1109
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->handleSettingMessage(Landroid/os/Message;)V

    goto :goto_0

    .line 1107
    nop

    :pswitch_data_0
    .packed-switch 0x12
        :pswitch_0
    .end packed-switch
.end method

.method public playItems(J)Z
    .locals 11
    .parameter "id"

    .prologue
    const/4 v5, 0x1

    .line 882
    const/4 v4, 0x0

    .line 883
    .local v4, ret:Z
    const/4 v2, 0x0

    .line 885
    .local v2, hasExit:Z
    const/4 v3, 0x0

    .line 888
    .local v3, i:I
    const-wide/16 v6, 0x0

    cmp-long v6, p1, v6

    if-nez v6, :cond_0

    .line 889
    const-string v6, "MMI_AVRCP"

    const-string v7, "[BT][AVRCP] Wrong id 0"

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 905
    :goto_0
    return v5

    .line 893
    :cond_0
    invoke-virtual {p0, v5}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->checkAndBindPlayService(Z)V

    .line 894
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayService:Lcom/android/music/IMediaPlaybackService;

    if-eqz v5, :cond_1

    .line 896
    const/4 v5, 0x1

    :try_start_0
    new-array v0, v5, [J

    .line 897
    .local v0, curList:[J
    const/4 v5, 0x0

    aput-wide p1, v0, v5

    .line 898
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayService:Lcom/android/music/IMediaPlaybackService;

    const/4 v6, 0x1

    invoke-interface {v5, v0, v6}, Lcom/android/music/IMediaPlaybackService;->enqueue([JI)V

    .line 899
    const-string v5, "MMI_AVRCP"

    const-string v6, "[BT][AVRCP] enqueu %d"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const/4 v9, 0x0

    aget-wide v9, v0, v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 900
    const/4 v4, 0x1

    .end local v0           #curList:[J
    :cond_1
    :goto_1
    move v5, v4

    .line 905
    goto :goto_0

    .line 901
    :catch_0
    move-exception v1

    .line 902
    .local v1, ex:Landroid/os/RemoteException;
    const-string v5, "MMI_AVRCP"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "[BT][AVRCP] BTAvrcpMusicAdapter playItem enqueue exception:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public playerAppCapabilities()[B
    .locals 1

    .prologue
    .line 422
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mCapabilities:[B

    return-object v0
.end method

.method public registerNotification(BI)Z
    .locals 10
    .parameter "eventId"
    .parameter "interval"

    .prologue
    const/4 v6, 0x1

    const/4 v8, 0x0

    .line 710
    const/4 v0, 0x0

    .line 715
    .local v0, bReg:Z
    packed-switch p1, :pswitch_data_0

    .line 777
    :cond_0
    :goto_0
    :pswitch_0
    if-eqz v0, :cond_1

    .line 779
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    monitor-enter v5

    .line 780
    :try_start_0
    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    invoke-virtual {v4, p1}, Ljava/util/BitSet;->set(I)V

    .line 781
    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    invoke-virtual {v4, p1}, Ljava/util/BitSet;->get(I)Z

    move-result v0

    .line 782
    const-string v4, "MMI_AVRCP"

    const-string v6, "[BT][AVRCP] mRegBit set %d Reg:%b cardinality:%d"

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x2

    iget-object v9, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;

    invoke-virtual {v9}, Ljava/util/BitSet;->cardinality()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 784
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 787
    :cond_1
    return v0

    .line 720
    :pswitch_1
    const-string v4, "MMI_AVRCP"

    const-string v5, "[BT][AVRCP] MusicAdapter blocks support register event:%d"

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 721
    const/4 v0, 0x0

    .line 722
    goto :goto_0

    .line 728
    :pswitch_2
    sparse-switch p1, :sswitch_data_0

    .line 759
    :goto_1
    const-string v4, "MMI_AVRCP"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[BT][AVRCP] registerNotification "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 731
    :sswitch_0
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->getPlayerstatus()B

    move-result v3

    .line 732
    .local v3, status:B
    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    invoke-virtual {v4, v8, v6, v3}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->notificationPlayStatusChangedNative(BBB)Z

    .line 735
    const/4 v0, 0x1

    .line 737
    goto :goto_1

    .line 739
    .end local v3           #status:B
    :sswitch_1
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->getPlayerstatus()B

    move-result v3

    .line 740
    .restart local v3       #status:B
    packed-switch v3, :pswitch_data_1

    .line 746
    const-wide/16 v1, -0x1

    .line 749
    .local v1, lvalue:J
    :goto_2
    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    invoke-virtual {v4, v8, v6, v1, v2}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->notificationTrackChangedNative(BBJ)Z

    .line 750
    const/4 v0, 0x1

    .line 751
    goto :goto_1

    .line 743
    .end local v1           #lvalue:J
    :pswitch_3
    sget-wide v1, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sMusicId:J

    .line 744
    .restart local v1       #lvalue:J
    goto :goto_2

    .line 753
    .end local v1           #lvalue:J
    .end local v3           #status:B
    :sswitch_2
    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    invoke-virtual {v4, v8, v6}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->notificationNowPlayingChangedNative(BB)Z

    .line 754
    const/4 v0, 0x1

    .line 755
    goto :goto_1

    .line 764
    :pswitch_4
    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mSystemListener:Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;

    if-eqz v4, :cond_0

    .line 765
    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mSystemListener:Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;

    invoke-virtual {v4, p1, p2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->regNotificationEvent(BI)Z

    move-result v0

    goto/16 :goto_0

    .line 770
    :pswitch_5
    const-string v4, "MMI_AVRCP"

    const-string v5, "[BT][AVRCP] MusicAdapter blocks support register event:%d"

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 771
    const/4 v0, 0x0

    .line 772
    goto/16 :goto_0

    .line 784
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4

    .line 715
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_4
        :pswitch_4
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
    .end packed-switch

    .line 728
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0x9 -> :sswitch_2
    .end sparse-switch

    .line 740
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method public run()V
    .locals 1

    .prologue
    .line 1093
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 1094
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mServiceLooper:Landroid/os/Looper;

    .line 1095
    new-instance v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$1;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$1;-><init>(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mHandler:Landroid/os/Handler;

    .line 1102
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 1103
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mHandler:Landroid/os/Handler;

    .line 1104
    return-void
.end method

.method public sendAvrcpKeyEvent(IB)V
    .locals 8
    .parameter "keyvalue"
    .parameter "isPress"

    .prologue
    const/4 v7, 0x1

    .line 952
    const/4 v0, 0x0

    .line 954
    .local v0, apKey:I
    const-string v3, "[BT][AVRCP] Receive a Avrcpkey:%d (APKey:%d)"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 956
    .local v2, sMsg:Ljava/lang/String;
    const-string v3, "MMI_AVRCP"

    invoke-static {v3, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 958
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mContext:Landroid/content/Context;

    if-eqz v3, :cond_0

    if-ne p2, v7, :cond_0

    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mHandler:Landroid/os/Handler;

    if-eqz v3, :cond_0

    .line 961
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 962
    .local v1, msg:Landroid/os/Message;
    const/16 v3, 0x11

    iput v3, v1, Landroid/os/Message;->what:I

    .line 964
    iput p1, v1, Landroid/os/Message;->arg1:I

    .line 965
    iput p2, v1, Landroid/os/Message;->arg2:I

    .line 967
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 972
    .end local v1           #msg:Landroid/os/Message;
    :cond_0
    return-void
.end method

.method public setAbsoluteVolume(B)Z
    .locals 10
    .parameter "volume"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v7, 0x3

    .line 799
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMgr:Landroid/media/AudioManager;

    if-nez v5, :cond_1

    .line 819
    :cond_0
    :goto_0
    return v3

    .line 808
    :cond_1
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->convertToMgrVolume(B)I

    move-result v0

    .line 809
    .local v0, adjVolume:I
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMgr:Landroid/media/AudioManager;

    if-eqz v5, :cond_0

    .line 810
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMgr:Landroid/media/AudioManager;

    invoke-virtual {v5, v7}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v2

    .line 811
    .local v2, getVolume:I
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMgr:Landroid/media/AudioManager;

    const/4 v6, 0x4

    invoke-virtual {v5, v7, v0, v6}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 812
    iget-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAudioMgr:Landroid/media/AudioManager;

    invoke-virtual {v5, v7}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    .line 813
    .local v1, compare:I
    const-string v5, "MMI_AVRCP"

    const-string v6, "[BT][AVRCP] Adapter before:%d to-set:%d after:%d"

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v4

    const/4 v8, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 814
    if-ne v1, v0, :cond_0

    .line 815
    iput-byte p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mVolume:B

    move v3, v4

    .line 816
    goto :goto_0
.end method

.method public setPlayerAppValue(BB)Z
    .locals 11
    .parameter "attrId"
    .parameter "value"

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x0

    const/4 v3, 0x1

    .line 486
    const/4 v1, 0x0

    .line 487
    .local v1, lDone:Z
    const/4 v2, 0x0

    .line 489
    .local v2, mode:I
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->checkAndBindMusicService()V

    .line 490
    if-ne p1, v10, :cond_1

    .line 492
    :try_start_0
    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    invoke-interface {v4}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->getRepeatMode()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 496
    :goto_0
    if-ne p2, v2, :cond_0

    .line 497
    const-string v4, "MMI_AVRCP"

    const-string v5, "[BT][AVRCP] Already in repeat mode"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 552
    :goto_1
    return v3

    .line 493
    :catch_0
    move-exception v0

    .line 494
    .local v0, ex:Landroid/os/RemoteException;
    const-string v4, "MMI_AVRCP"

    const-string v5, "[BT][AVRCP] Exception ! Fail to getRepeatMode %s"

    new-array v6, v10, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v3

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 500
    .end local v0           #ex:Landroid/os/RemoteException;
    :cond_0
    packed-switch p2, :pswitch_data_0

    .line 518
    :cond_1
    :goto_2
    const/4 v4, 0x3

    if-ne p1, v4, :cond_3

    .line 520
    :try_start_1
    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    invoke-interface {v4}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->getShuffleMode()I
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_2

    move-result v2

    .line 524
    :goto_3
    if-ne p2, v2, :cond_2

    .line 525
    const-string v4, "MMI_AVRCP"

    const-string v5, "Already in shutffle mode"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 505
    :pswitch_0
    :try_start_2
    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    invoke-interface {v4, p2}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->setRepeatMode(I)Z

    move-result v1

    .line 506
    if-eqz v1, :cond_1

    .line 507
    const-string v4, "MMI_AVRCP"

    const-string v5, "[BT][AVRCP] setRepeatMode ret %s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 509
    :catch_1
    move-exception v0

    .line 510
    .restart local v0       #ex:Landroid/os/RemoteException;
    const-string v4, "MMI_AVRCP"

    const-string v5, "[BT][AVRCP] Exception ! Fail to setRepeatMode %d %s"

    new-array v6, v10, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v3

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 521
    .end local v0           #ex:Landroid/os/RemoteException;
    :catch_2
    move-exception v0

    .line 522
    .restart local v0       #ex:Landroid/os/RemoteException;
    const-string v4, "MMI_AVRCP"

    const-string v5, "[BT][AVRCP] Exception ! Fail to getShuffleMode %s"

    new-array v6, v3, [Ljava/lang/Object;

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 528
    .end local v0           #ex:Landroid/os/RemoteException;
    :cond_2
    packed-switch p2, :pswitch_data_1

    .line 549
    :cond_3
    :goto_4
    :pswitch_1
    if-nez v1, :cond_4

    .line 550
    const-string v4, "MMI_AVRCP"

    const-string v5, "[BT][AVRCP] fail to set attr_id:%d to value:%d"

    new-array v6, v10, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    aput-object v7, v6, v3

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    move v3, v1

    .line 552
    goto/16 :goto_1

    .line 532
    :pswitch_2
    :try_start_3
    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    invoke-interface {v4, p2}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->setShuffleMode(I)Z

    move-result v1

    .line 533
    if-eqz v1, :cond_3

    .line 534
    const-string v4, "MMI_AVRCP"

    const-string v5, "[BT][AVRCP] setShuffleMode ret %s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_4

    .line 536
    :catch_3
    move-exception v0

    .line 537
    .restart local v0       #ex:Landroid/os/RemoteException;
    const-string v4, "MMI_AVRCP"

    const-string v5, "[BT][AVRCP] Exception ! Fail to setShuffleMode %d %s"

    new-array v6, v10, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v3

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 539
    const-string v4, "MMI_AVRCP"

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    .line 500
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 528
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public startReceiver()V
    .locals 4

    .prologue
    .line 1359
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP][b] startReceiver"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1360
    sget-boolean v1, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mStartReceiver:Z

    if-eqz v1, :cond_0

    .line 1361
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP][b] startReceiver ignore"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1375
    :goto_0
    return-void

    .line 1365
    :cond_0
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP][b] startReceiver music intent"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1366
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 1367
    .local v0, f:Landroid/content/IntentFilter;
    const-string v1, "com.android.music.playstatechanged"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1368
    const-string v1, "com.android.music.metachanged"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1369
    const-string v1, "com.android.music.quitplayback"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1370
    const-string v1, "com.android.music.queuechanged"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1371
    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1372
    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1373
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mStatusListener:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3, v0}, Landroid/content/IntentFilter;-><init>(Landroid/content/IntentFilter;)V

    invoke-virtual {v1, v2, v3}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1374
    const/4 v1, 0x1

    sput-boolean v1, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mStartReceiver:Z

    goto :goto_0
.end method

.method public startToBind()V
    .locals 0

    .prologue
    .line 1330
    return-void
.end method

.method public startToBindPlayService()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 1333
    const/4 v0, 0x0

    .line 1334
    .local v0, bBindRet:Z
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayService:Lcom/android/music/IMediaPlaybackService;

    if-nez v2, :cond_0

    .line 1335
    sget-boolean v2, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sPlayServiceInterface:Z

    if-nez v2, :cond_1

    .line 1356
    :cond_0
    :goto_0
    return-void

    .line 1339
    :cond_1
    sput-boolean v7, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sPlayServiceInterface:Z

    .line 1342
    :try_start_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    new-instance v3, Landroid/content/Intent;

    const-string v4, "com.android.music.MediaPlaybackService"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 1343
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    new-instance v3, Landroid/content/Intent;

    const-string v4, "com.android.music.MediaPlaybackService"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayConnection:Landroid/content/ServiceConnection;

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    .line 1344
    const-string v2, "MMI_AVRCP"

    const-string v3, "[BT][AVRCP][b] startPlaybackService bBindRet:%b"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1345
    sput-boolean v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sPlayServiceInterface:Z

    .line 1346
    if-nez v0, :cond_2

    .line 1347
    const-string v2, "MMI_AVRCP"

    const-string v3, "[BT][AVRCP] mMusicService does not have play interface "

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1349
    :cond_2
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStartBind:Z
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1354
    :goto_1
    const-string v2, "MMI_AVRCP"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[BT][AVRCP] mbPlayServiceInterface is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-boolean v4, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sPlayServiceInterface:Z

    invoke-static {v4}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1350
    :catch_0
    move-exception v1

    .line 1351
    .local v1, ex:Ljava/lang/SecurityException;
    sput-boolean v7, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->sPlayServiceInterface:Z

    goto :goto_1
.end method

.method public stopReceiver()V
    .locals 2

    .prologue
    .line 1378
    sget-boolean v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mStartReceiver:Z

    if-nez v0, :cond_0

    .line 1379
    const-string v0, "MMI_AVRCP"

    const-string v1, "[BT][AVRCP][b] stopReceiver ignore"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1386
    :goto_0
    return-void

    .line 1382
    :cond_0
    const-string v0, "MMI_AVRCP"

    const-string v1, "[BT][AVRCP] startReceiver stop "

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1383
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mStatusListener:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1385
    const/4 v0, 0x0

    sput-boolean v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mStartReceiver:Z

    goto :goto_0
.end method

.method public stopToBind()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1389
    const-string v0, "MMI_AVRCP"

    const-string v1, "[BT][AVRCP][b] stopToBind"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1390
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->unbindService(Landroid/content/ServiceConnection;)V

    .line 1391
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mStartBind:Z

    .line 1395
    const-string v0, "MMI_AVRCP"

    const-string v1, "[BT][AVRCP][b] PlayService stopToBind"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1396
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->unbindService(Landroid/content/ServiceConnection;)V

    .line 1397
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mPlayStartBind:Z

    .line 1398
    return-void
.end method
