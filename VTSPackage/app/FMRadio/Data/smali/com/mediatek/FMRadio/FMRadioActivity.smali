.class public Lcom/mediatek/FMRadio/FMRadioActivity;
.super Landroid/app/Activity;
.source "FMRadioActivity.java"

# interfaces
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;
.implements Landroid/widget/PopupMenu$OnDismissListener;
.implements Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$NoAntennaListener;
.implements Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog$CancelSearchListener;
.implements Lcom/mediatek/FMRadio/FMRecordDialogFragment$OnRecordingDialogClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;
    }
.end annotation


# static fields
.field private static final NO_ANTENNA:Ljava/lang/String; = "NoAntenna"

.field private static final RDS_SETTING:Ljava/lang/String; = "RdsSetting"

.field private static final REFS_NAME:Ljava/lang/String; = "FMRecord"

.field private static final REQUEST_CODE_FAVORITE:I = 0x1

.field private static final SAVE_RECORDINGD:Ljava/lang/String; = "SaveRecording"

.field private static final SEARCH:Ljava/lang/String; = "Search"

.field private static final START_PLAY_TIME:Ljava/lang/String; = "startPlayTime"

.field private static final START_RECORD_TIME:Ljava/lang/String; = "startRecordTime"

.field public static final TAG:Ljava/lang/String; = "FmRx/Activity"

.field private static final TOAST_TIMER_DELAY:J = 0x7d0L


# instance fields
.field private mAnimImage:Landroid/widget/ImageView;

.field private mAnimation:Landroid/view/animation/Animation;

.field private mAudioManager:Landroid/media/AudioManager;

.field private mBroadcastReceiver:Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;

.field private mButtonAddToFavorite:Landroid/widget/ImageButton;

.field private final mButtonClickListener:Landroid/view/View$OnClickListener;

.field private mButtonDecrease:Landroid/widget/ImageButton;

.field private mButtonIncrease:Landroid/widget/ImageButton;

.field private mButtonNextStation:Landroid/widget/ImageButton;

.field private mButtonPlayback:Landroid/widget/ImageButton;

.field private mButtonPrevStation:Landroid/widget/ImageButton;

.field private mButtonRecord:Landroid/widget/ImageButton;

.field private mButtonStop:Landroid/widget/ImageButton;

.field private mContext:Landroid/content/Context;

.field private mCurrentStation:I

.field private mFMRadioListener:Lcom/mediatek/FMRadio/FMRadioListener;

.field private mFragmentManager:Landroid/app/FragmentManager;

.field private mHandler:Landroid/os/Handler;

.field private mIsActivityForeground:Z

.field private mIsInRecordingMode:Z

.field private mIsNeedDisablePower:Z

.field private mIsNeedShowNoAntennaDlg:Z

.field private mIsNeedShowRecordDlg:Z

.field private mIsNeedShowSearchDlg:Z

.field private mIsPlaying:Z

.field private mIsSDListenerRegistered:Z

.field private mIsServiceBinded:Z

.field private mIsServiceStarted:Z

.field private mMenuItemChannelList:Landroid/view/MenuItem;

.field private mMenuItemOverflow:Landroid/view/MenuItem;

.field private mMenuItemPower:Landroid/view/MenuItem;

.field private mNeedTuneto:Z

.field private mPlayStartTime:J

.field private mPopupMenu:Landroid/widget/PopupMenu;

.field private mPrevRecorderState:I

.field private mProjectStringExt:Lcom/mediatek/FMRadio/ext/IProjectStringExt;

.field private mRLRecordInfo:Landroid/widget/RelativeLayout;

.field private mRecordStartTime:J

.field private mRecordState:I

.field private mSDDirectory:Ljava/lang/String;

.field private final mSDListener:Landroid/content/BroadcastReceiver;

.field private mService:Lcom/mediatek/FMRadio/FMRadioService;

.field private final mServiceConnection:Landroid/content/ServiceConnection;

.field private mTextFM:Landroid/widget/TextView;

.field private mTextMHz:Landroid/widget/TextView;

.field private mTextRDS:Landroid/widget/TextView;

.field private mTextStationName:Landroid/widget/TextView;

.field private mTextStationValue:Landroid/widget/TextView;

.field private mToast:Landroid/widget/Toast;

.field private mTxtRecInfoLeft:Landroid/widget/TextView;

.field private mTxtRecInfoRight:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 89
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 113
    const/4 v0, -0x1

    iput v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPrevRecorderState:I

    .line 114
    const/16 v0, 0x3e8

    iput v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    .line 115
    iput v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordState:I

    .line 119
    iput-wide v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordStartTime:J

    .line 120
    iput-wide v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPlayStartTime:J

    .line 122
    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsServiceStarted:Z

    .line 123
    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsServiceBinded:Z

    .line 124
    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mNeedTuneto:Z

    .line 125
    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedDisablePower:Z

    .line 128
    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsPlaying:Z

    .line 129
    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsSDListenerRegistered:Z

    .line 130
    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    .line 131
    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowRecordDlg:Z

    .line 132
    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowNoAntennaDlg:Z

    .line 134
    iput-boolean v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowSearchDlg:Z

    .line 135
    iput-boolean v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsActivityForeground:Z

    .line 137
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    .line 138
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    .line 139
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mToast:Landroid/widget/Toast;

    .line 140
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mFragmentManager:Landroid/app/FragmentManager;

    .line 143
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextStationName:Landroid/widget/TextView;

    .line 145
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextStationValue:Landroid/widget/TextView;

    .line 147
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextRDS:Landroid/widget/TextView;

    .line 149
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextFM:Landroid/widget/TextView;

    .line 151
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextMHz:Landroid/widget/TextView;

    .line 153
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTxtRecInfoLeft:Landroid/widget/TextView;

    .line 154
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTxtRecInfoRight:Landroid/widget/TextView;

    .line 157
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonDecrease:Landroid/widget/ImageButton;

    .line 159
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonPrevStation:Landroid/widget/ImageButton;

    .line 161
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonNextStation:Landroid/widget/ImageButton;

    .line 163
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonIncrease:Landroid/widget/ImageButton;

    .line 165
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonAddToFavorite:Landroid/widget/ImageButton;

    .line 167
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonRecord:Landroid/widget/ImageButton;

    .line 169
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonStop:Landroid/widget/ImageButton;

    .line 171
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonPlayback:Landroid/widget/ImageButton;

    .line 174
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mMenuItemChannelList:Landroid/view/MenuItem;

    .line 176
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mMenuItemOverflow:Landroid/view/MenuItem;

    .line 178
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mMenuItemPower:Landroid/view/MenuItem;

    .line 180
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPopupMenu:Landroid/widget/PopupMenu;

    .line 183
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRLRecordInfo:Landroid/widget/RelativeLayout;

    .line 185
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mAnimation:Landroid/view/animation/Animation;

    .line 186
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mAnimImage:Landroid/widget/ImageView;

    .line 190
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mAudioManager:Landroid/media/AudioManager;

    .line 191
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mProjectStringExt:Lcom/mediatek/FMRadio/ext/IProjectStringExt;

    .line 193
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mSDDirectory:Ljava/lang/String;

    .line 194
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mBroadcastReceiver:Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;

    .line 196
    new-instance v0, Lcom/mediatek/FMRadio/FMRadioActivity$1;

    invoke-direct {v0, p0}, Lcom/mediatek/FMRadio/FMRadioActivity$1;-><init>(Lcom/mediatek/FMRadio/FMRadioActivity;)V

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mFMRadioListener:Lcom/mediatek/FMRadio/FMRadioListener;

    .line 223
    new-instance v0, Lcom/mediatek/FMRadio/FMRadioActivity$2;

    invoke-direct {v0, p0}, Lcom/mediatek/FMRadio/FMRadioActivity$2;-><init>(Lcom/mediatek/FMRadio/FMRadioActivity;)V

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mSDListener:Landroid/content/BroadcastReceiver;

    .line 270
    new-instance v0, Lcom/mediatek/FMRadio/FMRadioActivity$3;

    invoke-direct {v0, p0}, Lcom/mediatek/FMRadio/FMRadioActivity$3;-><init>(Lcom/mediatek/FMRadio/FMRadioActivity;)V

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonClickListener:Landroid/view/View$OnClickListener;

    .line 559
    new-instance v0, Lcom/mediatek/FMRadio/FMRadioActivity$4;

    invoke-direct {v0, p0}, Lcom/mediatek/FMRadio/FMRadioActivity$4;-><init>(Lcom/mediatek/FMRadio/FMRadioActivity;)V

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 633
    new-instance v0, Lcom/mediatek/FMRadio/FMRadioActivity$5;

    invoke-direct {v0, p0}, Lcom/mediatek/FMRadio/FMRadioActivity$5;-><init>(Lcom/mediatek/FMRadio/FMRadioActivity;)V

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/FMRadio/FMRadioActivity;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 89
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mediatek/FMRadio/FMRadioActivity;)Landroid/app/FragmentManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 89
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mFragmentManager:Landroid/app/FragmentManager;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/mediatek/FMRadio/FMRadioActivity;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 89
    iget-wide v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordStartTime:J

    return-wide v0
.end method

.method static synthetic access$1002(Lcom/mediatek/FMRadio/FMRadioActivity;J)J
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    iput-wide p1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordStartTime:J

    return-wide p1
.end method

.method static synthetic access$1100(Lcom/mediatek/FMRadio/FMRadioActivity;Ljava/lang/String;J)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 89
    invoke-direct {p0, p1, p2, p3}, Lcom/mediatek/FMRadio/FMRadioActivity;->editSharedPreferences(Ljava/lang/String;J)V

    return-void
.end method

.method static synthetic access$1200(Lcom/mediatek/FMRadio/FMRadioActivity;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 89
    iget-wide v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPlayStartTime:J

    return-wide v0
.end method

.method static synthetic access$1202(Lcom/mediatek/FMRadio/FMRadioActivity;J)J
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    iput-wide p1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPlayStartTime:J

    return-wide p1
.end method

.method static synthetic access$1300(Lcom/mediatek/FMRadio/FMRadioActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->updateFavoriteStation()V

    return-void
.end method

.method static synthetic access$1400(Lcom/mediatek/FMRadio/FMRadioActivity;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 89
    iget v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    return v0
.end method

.method static synthetic access$1402(Lcom/mediatek/FMRadio/FMRadioActivity;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    iput p1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    return p1
.end method

.method static synthetic access$1500(Lcom/mediatek/FMRadio/FMRadioActivity;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioActivity;->tuneToStation(I)V

    return-void
.end method

.method static synthetic access$1600(Lcom/mediatek/FMRadio/FMRadioActivity;IZ)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 89
    invoke-direct {p0, p1, p2}, Lcom/mediatek/FMRadio/FMRadioActivity;->seekStation(IZ)V

    return-void
.end method

.method static synthetic access$1700(Lcom/mediatek/FMRadio/FMRadioActivity;)Lcom/mediatek/FMRadio/FMRadioListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 89
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mFMRadioListener:Lcom/mediatek/FMRadio/FMRadioListener;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/mediatek/FMRadio/FMRadioActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mNeedTuneto:Z

    return v0
.end method

.method static synthetic access$1802(Lcom/mediatek/FMRadio/FMRadioActivity;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    iput-boolean p1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mNeedTuneto:Z

    return p1
.end method

.method static synthetic access$1900(Lcom/mediatek/FMRadio/FMRadioActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->updateCurrentStation()V

    return-void
.end method

.method static synthetic access$200(Lcom/mediatek/FMRadio/FMRadioActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->dismissSaveRecordingDialog()V

    return-void
.end method

.method static synthetic access$2000(Lcom/mediatek/FMRadio/FMRadioActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->updateMenuStatus()V

    return-void
.end method

.method static synthetic access$2100(Lcom/mediatek/FMRadio/FMRadioActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->updateDialogStatus()V

    return-void
.end method

.method static synthetic access$2200(Lcom/mediatek/FMRadio/FMRadioActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->isRecordFileExist()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2300(Lcom/mediatek/FMRadio/FMRadioActivity;)Landroid/widget/ImageButton;
    .locals 1
    .parameter "x0"

    .prologue
    .line 89
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonPlayback:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/mediatek/FMRadio/FMRadioActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->updateRds()V

    return-void
.end method

.method static synthetic access$2500(Lcom/mediatek/FMRadio/FMRadioActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->restoreRecorderState()V

    return-void
.end method

.method static synthetic access$2600(Lcom/mediatek/FMRadio/FMRadioActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->powerUpFM()V

    return-void
.end method

.method static synthetic access$2700(Lcom/mediatek/FMRadio/FMRadioActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshTimeText()V

    return-void
.end method

.method static synthetic access$2800(Lcom/mediatek/FMRadio/FMRadioActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->stopAnimation()V

    return-void
.end method

.method static synthetic access$2900(Lcom/mediatek/FMRadio/FMRadioActivity;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshImageButton(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/mediatek/FMRadio/FMRadioActivity;Ljava/lang/CharSequence;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioActivity;->showToast(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic access$3000(Lcom/mediatek/FMRadio/FMRadioActivity;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshPopupMenuItem(Z)V

    return-void
.end method

.method static synthetic access$3100(Lcom/mediatek/FMRadio/FMRadioActivity;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuItem(Z)V

    return-void
.end method

.method static synthetic access$3200(Lcom/mediatek/FMRadio/FMRadioActivity;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuPower(Z)V

    return-void
.end method

.method static synthetic access$3300(Lcom/mediatek/FMRadio/FMRadioActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsActivityForeground:Z

    return v0
.end method

.method static synthetic access$3402(Lcom/mediatek/FMRadio/FMRadioActivity;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    iput-boolean p1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowNoAntennaDlg:Z

    return p1
.end method

.method static synthetic access$3502(Lcom/mediatek/FMRadio/FMRadioActivity;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    iput-boolean p1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedDisablePower:Z

    return p1
.end method

.method static synthetic access$3600(Lcom/mediatek/FMRadio/FMRadioActivity;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshStationUI(I)V

    return-void
.end method

.method static synthetic access$3700(Lcom/mediatek/FMRadio/FMRadioActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->dismissSearchDialog()V

    return-void
.end method

.method static synthetic access$3800(Lcom/mediatek/FMRadio/FMRadioActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->enterChannelList()V

    return-void
.end method

.method static synthetic access$3900(Lcom/mediatek/FMRadio/FMRadioActivity;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioActivity;->showRDS(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/mediatek/FMRadio/FMRadioActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->isAntennaAvailable()Z

    move-result v0

    return v0
.end method

.method static synthetic access$4000(Lcom/mediatek/FMRadio/FMRadioActivity;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioActivity;->updateRecordingState(I)V

    return-void
.end method

.method static synthetic access$4100(Lcom/mediatek/FMRadio/FMRadioActivity;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioActivity;->updateRecorderError(I)V

    return-void
.end method

.method static synthetic access$4200(Lcom/mediatek/FMRadio/FMRadioActivity;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioActivity;->exitRecordingMode(Z)V

    return-void
.end method

.method static synthetic access$500(Lcom/mediatek/FMRadio/FMRadioActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsPlaying:Z

    return v0
.end method

.method static synthetic access$502(Lcom/mediatek/FMRadio/FMRadioActivity;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    iput-boolean p1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsPlaying:Z

    return p1
.end method

.method static synthetic access$600(Lcom/mediatek/FMRadio/FMRadioActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->exitService()V

    return-void
.end method

.method static synthetic access$700(Lcom/mediatek/FMRadio/FMRadioActivity;)Lcom/mediatek/FMRadio/FMRadioService;
    .locals 1
    .parameter "x0"

    .prologue
    .line 89
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    return-object v0
.end method

.method static synthetic access$702(Lcom/mediatek/FMRadio/FMRadioActivity;Lcom/mediatek/FMRadio/FMRadioService;)Lcom/mediatek/FMRadio/FMRadioService;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    return-object p1
.end method

.method static synthetic access$800(Lcom/mediatek/FMRadio/FMRadioActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshRecordNotIdle()V

    return-void
.end method

.method static synthetic access$902(Lcom/mediatek/FMRadio/FMRadioActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 89
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mSDDirectory:Ljava/lang/String;

    return-object p1
.end method

.method private changeRecordingMode(Z)V
    .locals 4
    .parameter "recordingMode"

    .prologue
    .line 1540
    const-string v1, "FmRx/Activity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "changeRecordingMode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1541
    iget-boolean v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    if-ne v1, p1, :cond_1

    .line 1542
    const-string v2, "FmRx/Activity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "FM already "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz p1, :cond_0

    const-string v1, "in"

    :goto_0
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "recording mode!"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/mediatek/FMRadio/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1561
    :goto_1
    return-void

    .line 1542
    :cond_0
    const-string v1, "NOT in"

    goto :goto_0

    .line 1546
    :cond_1
    iput-boolean p1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    .line 1549
    iget-boolean v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsSDListenerRegistered:Z

    if-nez v1, :cond_2

    .line 1550
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 1551
    .local v0, iFilter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.MEDIA_EJECT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1552
    const-string v1, "android.intent.action.MEDIA_UNMOUNTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1553
    const-string v1, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1554
    const-string v1, "file"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 1555
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mSDListener:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1556
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsSDListenerRegistered:Z

    .line 1559
    .end local v0           #iFilter:Landroid/content/IntentFilter;
    :cond_2
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v1, p1}, Lcom/mediatek/FMRadio/FMRadioService;->setRecordingModeAsync(Z)V

    .line 1560
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioActivity;->switchRecordLayout(Z)V

    goto :goto_1
.end method

.method private dismissSaveRecordingDialog()V
    .locals 4

    .prologue
    .line 1831
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mFragmentManager:Landroid/app/FragmentManager;

    invoke-virtual {v2}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 1832
    .local v1, ft:Landroid/app/FragmentTransaction;
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mFragmentManager:Landroid/app/FragmentManager;

    const-string v3, "SaveRecording"

    invoke-virtual {v2, v3}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    .line 1833
    .local v0, fragment:Landroid/app/Fragment;
    invoke-virtual {v1, v0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 1834
    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 1835
    return-void
.end method

.method private dismissSearchDialog()V
    .locals 3

    .prologue
    .line 1820
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mFragmentManager:Landroid/app/FragmentManager;

    const-string v2, "Search"

    invoke-virtual {v1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;

    .line 1822
    .local v0, newFragment:Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;
    if-eqz v0, :cond_0

    .line 1823
    invoke-virtual {v0}, Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;->dismissAllowingStateLoss()V

    .line 1825
    :cond_0
    return-void
.end method

.method private editSharedPreferences(Ljava/lang/String;J)V
    .locals 4
    .parameter "key"
    .parameter "time"

    .prologue
    .line 549
    const-string v2, "FMRecord"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/FMRadio/FMRadioActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 550
    .local v1, sharedPreferences:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 551
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 552
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 553
    return-void
.end method

.method private enterChannelList()V
    .locals 2

    .prologue
    .line 914
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 915
    .local v0, intent:Landroid/content/Intent;
    const-class v1, Lcom/mediatek/FMRadio/FMRadioFavorite;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 916
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 917
    return-void
.end method

.method private exitRecordingMode(Z)V
    .locals 2
    .parameter "isInRecordingMode"

    .prologue
    const/4 v1, 0x0

    .line 443
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsPlaying:Z

    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshImageButton(Z)V

    .line 444
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsPlaying:Z

    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuItem(Z)V

    .line 445
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsPlaying:Z

    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshPopupMenuItem(Z)V

    .line 446
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuPower(Z)V

    .line 447
    if-nez p1, :cond_1

    .line 450
    iput-boolean v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    .line 451
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsSDListenerRegistered:Z

    if-eqz v0, :cond_0

    .line 452
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mSDListener:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 453
    iput-boolean v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsSDListenerRegistered:Z

    .line 455
    :cond_0
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioActivity;->switchRecordLayout(Z)V

    .line 457
    :cond_1
    return-void
.end method

.method private exitService()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1768
    const-string v1, "FmRx/Activity"

    const-string v2, "exitService"

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1769
    iget-boolean v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsServiceBinded:Z

    if-eqz v1, :cond_0

    .line 1770
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 1771
    iput-boolean v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsServiceBinded:Z

    .line 1774
    :cond_0
    iget-boolean v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsServiceStarted:Z

    if-eqz v1, :cond_2

    .line 1775
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/FMRadio/FMRadioService;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->stopService(Landroid/content/Intent;)Z

    move-result v0

    .line 1777
    .local v0, isSuccess:Z
    if-nez v0, :cond_1

    .line 1778
    const-string v1, "FmRx/Activity"

    const-string v2, "Error: Cannot stop the FM service."

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1780
    :cond_1
    iput-boolean v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsServiceStarted:Z

    .line 1782
    .end local v0           #isSuccess:Z
    :cond_2
    return-void
.end method

.method private getTimeString(I)Ljava/lang/String;
    .locals 14
    .parameter "time"

    .prologue
    const/4 v13, 0x2

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 467
    const/16 v3, 0xe10

    .line 468
    .local v3, oneHour:I
    div-int/lit16 v0, p1, 0xe10

    .line 469
    .local v0, hour:I
    const/16 v2, 0x3c

    .line 470
    .local v2, minuteSecond:I
    div-int/lit8 v8, p1, 0x3c

    rem-int/lit8 v1, v8, 0x3c

    .line 471
    .local v1, minute:I
    rem-int/lit8 v4, p1, 0x3c

    .line 472
    .local v4, second:I
    const/4 v7, 0x0

    .line 474
    .local v7, timeString:Ljava/lang/String;
    if-lez v0, :cond_0

    .line 475
    const-string v5, "%02d:%02d:%02d"

    .line 476
    .local v5, timeFormatLong:Ljava/lang/String;
    const-string v8, "%02d:%02d:%02d"

    const/4 v9, 0x3

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v12

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v13

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 482
    .end local v5           #timeFormatLong:Ljava/lang/String;
    :goto_0
    return-object v7

    .line 478
    :cond_0
    const-string v6, "%02d:%02d"

    .line 479
    .local v6, timeFormatShort:Ljava/lang/String;
    const-string v8, "%02d:%02d"

    new-array v9, v13, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v12

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_0
.end method

.method private initUIComponent()V
    .locals 4

    .prologue
    .line 1983
    const-string v1, "FmRx/Activity"

    const-string v2, "initUIComponent"

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1984
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    .line 1987
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRadioStation;->initFMDatabase(Landroid/content/Context;)V

    .line 1988
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/mediatek/FMRadio/ExtensionUtils;->getExtension(Landroid/content/Context;)Lcom/mediatek/FMRadio/ext/IProjectStringExt;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mProjectStringExt:Lcom/mediatek/FMRadio/ext/IProjectStringExt;

    .line 1989
    const v1, 0x7f060041

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextRDS:Landroid/widget/TextView;

    .line 1990
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextRDS:Landroid/widget/TextView;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1992
    const v1, 0x7f06003f

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextFM:Landroid/widget/TextView;

    .line 1993
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextFM:Landroid/widget/TextView;

    const-string v2, "FM"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1995
    const v1, 0x7f060040

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextMHz:Landroid/widget/TextView;

    .line 1996
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextMHz:Landroid/widget/TextView;

    const-string v2, "MHz"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1997
    const v1, 0x7f06003e

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextStationValue:Landroid/widget/TextView;

    .line 1998
    const v1, 0x7f06004d

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTxtRecInfoLeft:Landroid/widget/TextView;

    .line 1999
    const v1, 0x7f06004e

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTxtRecInfoRight:Landroid/widget/TextView;

    .line 2000
    const v1, 0x7f06004c

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRLRecordInfo:Landroid/widget/RelativeLayout;

    .line 2001
    const v1, 0x7f060049

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonRecord:Landroid/widget/ImageButton;

    .line 2002
    const v1, 0x7f06004a

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonStop:Landroid/widget/ImageButton;

    .line 2003
    const v1, 0x7f06004b

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonPlayback:Landroid/widget/ImageButton;

    .line 2004
    const v1, 0x7f060042

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonAddToFavorite:Landroid/widget/ImageButton;

    .line 2005
    const v1, 0x7f06003d

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextStationName:Landroid/widget/TextView;

    .line 2006
    const v1, 0x7f060045

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonDecrease:Landroid/widget/ImageButton;

    .line 2007
    const v1, 0x7f060046

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonIncrease:Landroid/widget/ImageButton;

    .line 2008
    const v1, 0x7f060044

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonPrevStation:Landroid/widget/ImageButton;

    .line 2009
    const v1, 0x7f060047

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonNextStation:Landroid/widget/ImageButton;

    .line 2015
    new-instance v1, Landroid/widget/PopupMenu;

    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    const v3, 0x7f060056

    invoke-virtual {p0, v3}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPopupMenu:Landroid/widget/PopupMenu;

    .line 2016
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v1}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v0

    .line 2017
    .local v0, menu:Landroid/view/Menu;
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v1}, Landroid/widget/PopupMenu;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    const v2, 0x7f050001

    invoke-virtual {v1, v2, v0}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 2019
    return-void
.end method

.method private isAirplaneModeOn()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 2070
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private isAntennaAvailable()Z
    .locals 1

    .prologue
    .line 1238
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    move-result v0

    return v0
.end method

.method private isHaveAvailableStorage()Z
    .locals 10

    .prologue
    .line 1679
    new-instance v4, Landroid/os/StatFs;

    iget-object v7, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mSDDirectory:Ljava/lang/String;

    invoke-direct {v4, v7}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 1680
    .local v4, fs:Landroid/os/StatFs;
    invoke-virtual {v4}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v7

    int-to-long v2, v7

    .line 1681
    .local v2, blocks:J
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockSize()I

    move-result v7

    int-to-long v0, v7

    .line 1682
    .local v0, blockSize:J
    mul-long v5, v2, v0

    .line 1683
    .local v5, spaceLeft:J
    const-string v7, "FmRx/Activity"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "checkRemainingStorage: available space="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1685
    const-wide/32 v7, 0x80000

    cmp-long v7, v5, v7

    if-lez v7, :cond_0

    const/4 v7, 0x1

    :goto_0
    return v7

    :cond_0
    const/4 v7, 0x0

    goto :goto_0
.end method

.method private isRecordFileExist()Z
    .locals 5

    .prologue
    .line 1664
    const/4 v0, 0x0

    .line 1665
    .local v0, fileName:Ljava/lang/String;
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v3}, Lcom/mediatek/FMRadio/FMRadioService;->getRecordingName()Ljava/lang/String;

    move-result-object v0

    .line 1667
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mSDDirectory:Ljava/lang/String;

    const-string v4, "FM Recording"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1668
    .local v2, recordingFolderPath:Ljava/io/File;
    new-instance v1, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".3gpp"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1670
    .local v1, recordingFileToSave:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    return v3
.end method

.method private powerUpFM()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1342
    const-string v0, "FmRx/Activity"

    const-string v1, "start powerUpFM"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1343
    invoke-direct {p0, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshImageButton(Z)V

    .line 1344
    invoke-direct {p0, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuItem(Z)V

    .line 1345
    invoke-direct {p0, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshPopupMenuItem(Z)V

    .line 1346
    invoke-direct {p0, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuPower(Z)V

    .line 1347
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->startAnimation()V

    .line 1348
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    iget v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRadioUtils;->computeFrequency(I)F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mediatek/FMRadio/FMRadioService;->powerUpAsync(F)V

    .line 1349
    const-string v0, "FmRx/Activity"

    const-string v1, "end powerUpFM"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1350
    return-void
.end method

.method private refreshActionMenuItem(Z)V
    .locals 1
    .parameter "enabled"

    .prologue
    .line 1419
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mMenuItemChannelList:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    .line 1421
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mMenuItemChannelList:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 1422
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mMenuItemOverflow:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 1425
    :cond_0
    return-void
.end method

.method private refreshActionMenuPower(Z)V
    .locals 2
    .parameter "enabled"

    .prologue
    .line 1430
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mMenuItemChannelList:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    .line 1432
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mMenuItemPower:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 1433
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mMenuItemPower:Landroid/view/MenuItem;

    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsPlaying:Z

    if-eqz v0, :cond_1

    const v0, 0x7f020017

    :goto_0
    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1436
    :cond_0
    return-void

    .line 1433
    :cond_1
    const v0, 0x7f020016

    goto :goto_0
.end method

.method private refreshImageButton(Z)V
    .locals 1
    .parameter "enabled"

    .prologue
    .line 1410
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonDecrease:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1411
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonPrevStation:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1412
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonNextStation:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1413
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonIncrease:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1414
    return-void
.end method

.method private refreshPlaybackIdle(Z)V
    .locals 2
    .parameter "btnPlayBack"

    .prologue
    .line 1465
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonRecord:Landroid/widget/ImageButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1466
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonPlayback:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1467
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonStop:Landroid/widget/ImageButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1468
    return-void
.end method

.method private refreshPlaybacking()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1477
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonRecord:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1478
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonPlayback:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1479
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonStop:Landroid/widget/ImageButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1480
    return-void
.end method

.method private refreshPopupMenuItem(Z)V
    .locals 4
    .parameter "enabled"

    .prologue
    .line 1439
    const/4 v0, 0x0

    .line 1440
    .local v0, isOverBT:Z
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v2, :cond_0

    .line 1441
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v2}, Lcom/mediatek/FMRadio/FMRadioService;->isFmViaBt()Z

    move-result v0

    .line 1443
    :cond_0
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPopupMenu:Landroid/widget/PopupMenu;

    if-eqz v2, :cond_1

    .line 1444
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    .line 1445
    .local v1, menu:Landroid/view/Menu;
    const v2, 0x7f060059

    invoke-interface {v1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    if-nez v0, :cond_2

    if-eqz p1, :cond_2

    const/4 v2, 0x1

    :goto_0
    invoke-interface {v3, v2}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 1446
    const v2, 0x7f060057

    invoke-interface {v1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    invoke-interface {v2, p1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 1447
    const v2, 0x7f060058

    invoke-interface {v1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    invoke-interface {v2, p1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 1449
    .end local v1           #menu:Landroid/view/Menu;
    :cond_1
    return-void

    .line 1445
    .restart local v1       #menu:Landroid/view/Menu;
    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private refreshRecordIdle()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1459
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonRecord:Landroid/widget/ImageButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1460
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonPlayback:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1461
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonStop:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1462
    return-void
.end method

.method private refreshRecordNotIdle()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1453
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonRecord:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1454
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonPlayback:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1455
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonStop:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1456
    return-void
.end method

.method private refreshRecording()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1471
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonRecord:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1472
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonPlayback:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1473
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonStop:Landroid/widget/ImageButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1474
    return-void
.end method

.method private refreshRecordingStatus(I)V
    .locals 12
    .parameter "stateOverride"

    .prologue
    const-wide/16 v10, 0x0

    const/16 v9, 0x8

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1593
    const/4 v2, -0x1

    .line 1595
    .local v2, recorderState:I
    const/4 v6, -0x1

    if-ne p1, v6, :cond_0

    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v6}, Lcom/mediatek/FMRadio/FMRadioService;->getRecorderState()I

    move-result v2

    .line 1598
    :goto_0
    const-string v6, "FmRx/Activity"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "refreshRecordingStatus: state="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1599
    packed-switch v2, :pswitch_data_0

    .line 1650
    :pswitch_0
    const-string v4, "FmRx/Activity"

    const-string v5, "invalid record status"

    invoke-static {v4, v5}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1653
    :goto_1
    iput v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPrevRecorderState:I

    .line 1654
    const-string v4, "FmRx/Activity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "refreshRecordingStatus.mPrevRecorderState:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPrevRecorderState:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1655
    return-void

    :cond_0
    move v2, p1

    .line 1595
    goto :goto_0

    .line 1601
    :pswitch_1
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v6}, Lcom/mediatek/FMRadio/FMRadioService;->getRecordTime()J

    move-result-wide v0

    .line 1602
    .local v0, recordTime:J
    cmp-long v6, v0, v10

    if-lez v6, :cond_4

    .line 1603
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->isRecordFileExist()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1604
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonPlayback:Landroid/widget/ImageButton;

    invoke-virtual {v6, v4}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1607
    :cond_1
    const/4 v6, 0x6

    iget v7, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPrevRecorderState:I

    if-ne v6, v7, :cond_2

    .line 1608
    const-string v6, "FmRx/Activity"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "need show recorder dialog.mPrevRecorderState:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPrevRecorderState:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1609
    iget-boolean v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsActivityForeground:Z

    if-eqz v6, :cond_3

    .line 1610
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v6}, Lcom/mediatek/FMRadio/FMRadioService;->getRecordingName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/mediatek/FMRadio/FMRadioActivity;->showSaveRecordingDialog(Ljava/lang/String;)V

    .line 1620
    :cond_2
    :goto_2
    cmp-long v6, v0, v10

    if-lez v6, :cond_5

    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->isRecordFileExist()Z

    move-result v6

    if-eqz v6, :cond_5

    :goto_3
    invoke-direct {p0, v4}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshPlaybackIdle(Z)V

    .line 1621
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRLRecordInfo:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v9}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto :goto_1

    .line 1612
    :cond_3
    iput-boolean v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowRecordDlg:Z

    goto :goto_2

    .line 1617
    :cond_4
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonPlayback:Landroid/widget/ImageButton;

    invoke-virtual {v6, v5}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto :goto_2

    :cond_5
    move v4, v5

    .line 1620
    goto :goto_3

    .line 1625
    .end local v0           #recordTime:J
    :pswitch_2
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTxtRecInfoLeft:Landroid/widget/TextView;

    const-string v6, ""

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1626
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTxtRecInfoRight:Landroid/widget/TextView;

    const-string v6, ""

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1627
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTxtRecInfoLeft:Landroid/widget/TextView;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setSelected(Z)V

    .line 1628
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshRecording()V

    .line 1629
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRLRecordInfo:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_1

    .line 1633
    :pswitch_3
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v6}, Lcom/mediatek/FMRadio/FMRadioService;->getRecordingName()Ljava/lang/String;

    move-result-object v3

    .line 1634
    .local v3, recordingName:Ljava/lang/String;
    if-nez v3, :cond_6

    .line 1635
    const-string v3, ""

    .line 1637
    :cond_6
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTxtRecInfoLeft:Landroid/widget/TextView;

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1638
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTxtRecInfoRight:Landroid/widget/TextView;

    const-string v7, ""

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1639
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTxtRecInfoLeft:Landroid/widget/TextView;

    invoke-virtual {v6, v4}, Landroid/widget/TextView;->setSelected(Z)V

    .line 1640
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshPlaybacking()V

    .line 1641
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRLRecordInfo:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_1

    .line 1645
    .end local v3           #recordingName:Ljava/lang/String;
    :pswitch_4
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshRecordIdle()V

    .line 1646
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRLRecordInfo:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v9}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_1

    .line 1599
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private refreshStationUI(I)V
    .locals 3
    .parameter "station"

    .prologue
    .line 928
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextStationValue:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/mediatek/FMRadio/FMRadioUtils;->formatStation(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 930
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/mediatek/FMRadio/FMRadioStation;->isFavoriteStation(Landroid/content/Context;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 931
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonAddToFavorite:Landroid/widget/ImageButton;

    const v1, 0x7f020009

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 933
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextStationName:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    const/4 v2, 0x2

    invoke-static {v1, p1, v2}, Lcom/mediatek/FMRadio/FMRadioStation;->getStationName(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 940
    :goto_0
    return-void

    .line 936
    :cond_0
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonAddToFavorite:Landroid/widget/ImageButton;

    const v1, 0x7f020007

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 938
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextStationName:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private refreshTimeText()V
    .locals 9

    .prologue
    const-wide/16 v7, 0x3e8

    .line 2033
    const-string v3, "FmRx/Activity"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "refreshTimeText:mRecordState:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordState:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2034
    iget-boolean v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    if-nez v3, :cond_2

    .line 2035
    const-string v3, "FmRx/Activity"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "refreshTimeText:mIsInRecordingMode:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2036
    iget v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordState:I

    const/4 v4, 0x6

    if-ne v3, v4, :cond_1

    .line 2037
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v3}, Lcom/mediatek/FMRadio/FMRadioService;->stopRecordingAsync()V

    .line 2066
    :cond_0
    :goto_0
    return-void

    .line 2038
    :cond_1
    iget v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordState:I

    const/4 v4, 0x7

    if-ne v3, v4, :cond_0

    .line 2039
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v3}, Lcom/mediatek/FMRadio/FMRadioService;->stopPlaybackAsync()V

    goto :goto_0

    .line 2044
    :cond_2
    const/16 v0, 0x3e8

    .line 2045
    .local v0, oneSecond:I
    iget v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordState:I

    packed-switch v3, :pswitch_data_0

    .line 2065
    :cond_3
    :goto_1
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mHandler:Landroid/os/Handler;

    const/16 v4, 0x65

    invoke-virtual {v3, v4, v7, v8}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 2047
    :pswitch_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordStartTime:J

    sub-long/2addr v3, v5

    div-long/2addr v3, v7

    long-to-int v2, v3

    .line 2048
    .local v2, recordTime:I
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTxtRecInfoLeft:Landroid/widget/TextView;

    invoke-direct {p0, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->getTimeString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2049
    const-string v3, "FmRx/Activity"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Recording time = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTxtRecInfoLeft:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2050
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->isHaveAvailableStorage()Z

    move-result v3

    if-nez v3, :cond_3

    .line 2052
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v3}, Lcom/mediatek/FMRadio/FMRadioService;->stopRecordingAsync()V

    goto :goto_1

    .line 2057
    .end local v2           #recordTime:I
    :pswitch_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPlayStartTime:J

    sub-long/2addr v3, v5

    div-long/2addr v3, v7

    long-to-int v1, v3

    .line 2058
    .local v1, playTime:I
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTxtRecInfoRight:Landroid/widget/TextView;

    invoke-direct {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->getTimeString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2059
    const-string v3, "FmRx/Activity"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Playing time = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTxtRecInfoRight:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 2045
    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private registerButtonClickListener()V
    .locals 2

    .prologue
    .line 2022
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonRecord:Landroid/widget/ImageButton;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2023
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonStop:Landroid/widget/ImageButton;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2024
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonPlayback:Landroid/widget/ImageButton;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2025
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonAddToFavorite:Landroid/widget/ImageButton;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2026
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonDecrease:Landroid/widget/ImageButton;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2027
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonIncrease:Landroid/widget/ImageButton;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2028
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonPrevStation:Landroid/widget/ImageButton;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2029
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonNextStation:Landroid/widget/ImageButton;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2030
    return-void
.end method

.method private restoreConfiguration()V
    .locals 5

    .prologue
    .line 944
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 945
    const-string v2, "FmRx/Activity"

    const-string v3, "Configration changes,activity restart,need to reset UI!"

    invoke-static {v2, v3}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 947
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    .line 948
    .local v0, bundle:Landroid/os/Bundle;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mSDDirectory:Ljava/lang/String;

    .line 951
    if-nez v0, :cond_1

    .line 967
    .end local v0           #bundle:Landroid/os/Bundle;
    :cond_0
    :goto_0
    return-void

    .line 954
    .restart local v0       #bundle:Landroid/os/Bundle;
    :cond_1
    const-string v2, "mPrevRecorderState"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPrevRecorderState:I

    .line 955
    const-string v2, "mRecordState"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordState:I

    .line 956
    const-string v2, "mIsFreshRecordingStatus"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowRecordDlg:Z

    .line 957
    const-string v2, "mIsNeedShowNoAntennaDlg"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowNoAntennaDlg:Z

    .line 958
    const-string v2, "mIsNeedShowSearchDlg"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowSearchDlg:Z

    .line 961
    const-string v2, "isInRecordingMode"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    .line 962
    .local v1, isInRecordingMode:Z
    iput-boolean v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    .line 963
    const-string v2, "FmRx/Activity"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isInRecordingMode = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ";mPrevRecorderState = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPrevRecorderState:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 965
    const-string v2, "mIsPlaying"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsPlaying:Z

    goto :goto_0
.end method

.method private restoreRecorderState()V
    .locals 7

    .prologue
    const-wide/16 v5, 0x0

    const/4 v4, 0x0

    .line 1314
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mSDDirectory:Ljava/lang/String;

    .line 1315
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v2}, Lcom/mediatek/FMRadio/FMRadioService;->getRecordingMode()Z

    move-result v2

    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    .line 1316
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v2}, Lcom/mediatek/FMRadio/FMRadioService;->getRecorderState()I

    move-result v2

    iput v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordState:I

    .line 1317
    const v2, 0x7f06004c

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    .line 1319
    .local v0, recInfoBar:Landroid/widget/RelativeLayout;
    const/4 v2, 0x6

    iget v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordState:I

    if-eq v2, v3, :cond_0

    const/4 v2, 0x7

    iget v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordState:I

    if-ne v2, v3, :cond_2

    .line 1321
    :cond_0
    const-string v2, "FMRecord"

    invoke-virtual {p0, v2, v4}, Lcom/mediatek/FMRadio/FMRadioActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1322
    .local v1, sharedPreferences:Landroid/content/SharedPreferences;
    const-string v2, "startRecordTime"

    invoke-interface {v1, v2, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordStartTime:J

    .line 1323
    const-string v2, "startPlayTime"

    invoke-interface {v1, v2, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPlayStartTime:J

    .line 1324
    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 1325
    const-string v2, "FmRx/Activity"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "&&&sendemptyMessage:mRecoderStart:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordStartTime:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1326
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x65

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1331
    .end local v1           #sharedPreferences:Landroid/content/SharedPreferences;
    :goto_0
    iget-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    invoke-direct {p0, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->switchRecordLayout(Z)V

    .line 1332
    iget-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    invoke-direct {p0, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->changeRecordingMode(Z)V

    .line 1333
    iget-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    if-eqz v2, :cond_1

    .line 1334
    const/4 v2, -0x1

    invoke-direct {p0, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshRecordingStatus(I)V

    .line 1336
    :cond_1
    return-void

    .line 1328
    :cond_2
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method private seekStation(IZ)V
    .locals 2
    .parameter "station"
    .parameter "direction"

    .prologue
    const/4 v0, 0x0

    .line 1399
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->startAnimation()V

    .line 1400
    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshImageButton(Z)V

    .line 1401
    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuItem(Z)V

    .line 1402
    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshPopupMenuItem(Z)V

    .line 1403
    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuPower(Z)V

    .line 1404
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-static {p1}, Lcom/mediatek/FMRadio/FMRadioUtils;->computeFrequency(I)F

    move-result v1

    invoke-virtual {v0, v1, p2}, Lcom/mediatek/FMRadio/FMRadioService;->seekStationAsync(FZ)V

    .line 1406
    return-void
.end method

.method private setSpeakerPhoneOn(Z)V
    .locals 6
    .parameter "isSpeaker"

    .prologue
    .line 1353
    if-eqz p1, :cond_1

    .line 1354
    const-string v3, "FmRx/Activity"

    const-string v4, "UseSpeaker"

    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/LogUtils;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1355
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/mediatek/FMRadio/FMRadioService;->setSpeakerPhoneOn(Z)V

    .line 1356
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 1357
    .local v0, endTime:J
    const-string v3, "FmRx/Activity"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[Performance test][FMRadio] switch speaker end ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1364
    :goto_0
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPopupMenu:Landroid/widget/PopupMenu;

    if-eqz v3, :cond_0

    .line 1365
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v3}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v2

    .line 1366
    .local v2, menu:Landroid/view/Menu;
    const v3, 0x7f060058

    invoke-interface {v2, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v3}, Lcom/mediatek/FMRadio/FMRadioService;->isSpeakerUsed()Z

    move-result v3

    if-eqz v3, :cond_2

    const v3, 0x7f04003e

    :goto_1
    invoke-interface {v4, v3}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 1369
    .end local v2           #menu:Landroid/view/Menu;
    :cond_0
    return-void

    .line 1359
    .end local v0           #endTime:J
    :cond_1
    const-string v3, "FmRx/Activity"

    const-string v4, "UseEarphone"

    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/LogUtils;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1360
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/FMRadio/FMRadioService;->setSpeakerPhoneOn(Z)V

    .line 1361
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 1362
    .restart local v0       #endTime:J
    const-string v3, "FmRx/Activity"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[Performance test][FMRadio] switch earphone end ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1366
    .restart local v2       #menu:Landroid/view/Menu;
    :cond_2
    const v3, 0x7f04003d

    goto :goto_1
.end method

.method private showRDS(Ljava/lang/String;)V
    .locals 3
    .parameter "text"

    .prologue
    .line 1528
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextRDS:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1529
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextRDS:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 1530
    const-string v0, "FmRx/Activity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FMRadioActivity.showRDS: RDS = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1531
    return-void
.end method

.method private showToast(Ljava/lang/CharSequence;)V
    .locals 3
    .parameter "text"

    .prologue
    .line 1519
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mToast:Landroid/widget/Toast;

    if-nez v0, :cond_0

    .line 1520
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mToast:Landroid/widget/Toast;

    .line 1522
    :cond_0
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0, p1}, Landroid/widget/Toast;->setText(Ljava/lang/CharSequence;)V

    .line 1523
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1524
    const-string v0, "FmRx/Activity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FMRadioActivity.showToast: toast = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1525
    return-void
.end method

.method private startAnimation()V
    .locals 2

    .prologue
    .line 1296
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mAnimImage:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAnimation(Landroid/view/animation/Animation;)V

    .line 1297
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mAnimImage:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1298
    const-string v0, "FmRx/Activity"

    const-string v1, "FMRadioActivity.startAnimation end"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1299
    return-void
.end method

.method private stopAnimation()V
    .locals 2

    .prologue
    .line 1305
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mAnimImage:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1306
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mAnimImage:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAnimation(Landroid/view/animation/Animation;)V

    .line 1307
    return-void
.end method

.method private switchRecordLayout(Z)V
    .locals 6
    .parameter "recordingMode"

    .prologue
    const/16 v4, 0x8

    const/4 v5, 0x0

    .line 1568
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 1569
    .local v0, actionBar:Landroid/app/ActionBar;
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->invalidateOptionsMenu()V

    .line 1572
    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 1573
    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 1574
    if-eqz p1, :cond_0

    const v3, 0x7f04002e

    :goto_0
    invoke-virtual {v0, v3}, Landroid/app/ActionBar;->setTitle(I)V

    .line 1577
    const v3, 0x7f060048

    invoke-virtual {p0, v3}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 1578
    .local v2, recBar:Landroid/widget/LinearLayout;
    const v3, 0x7f060043

    invoke-virtual {p0, v3}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 1580
    .local v1, bottomBar:Landroid/widget/LinearLayout;
    if-eqz p1, :cond_1

    move v3, v4

    :goto_1
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1581
    if-eqz p1, :cond_2

    move v3, v5

    :goto_2
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1582
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonAddToFavorite:Landroid/widget/ImageButton;

    if-eqz p1, :cond_3

    :goto_3
    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 1584
    return-void

    .line 1574
    .end local v1           #bottomBar:Landroid/widget/LinearLayout;
    .end local v2           #recBar:Landroid/widget/LinearLayout;
    :cond_0
    const/high16 v3, 0x7f04

    goto :goto_0

    .restart local v1       #bottomBar:Landroid/widget/LinearLayout;
    .restart local v2       #recBar:Landroid/widget/LinearLayout;
    :cond_1
    move v3, v5

    .line 1580
    goto :goto_1

    :cond_2
    move v3, v4

    .line 1581
    goto :goto_2

    :cond_3
    move v4, v5

    .line 1582
    goto :goto_3
.end method

.method private tuneToStation(I)V
    .locals 2
    .parameter "station"

    .prologue
    const/4 v0, 0x0

    .line 1378
    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshImageButton(Z)V

    .line 1379
    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuItem(Z)V

    .line 1380
    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshPopupMenuItem(Z)V

    .line 1381
    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuPower(Z)V

    .line 1382
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-static {p1}, Lcom/mediatek/FMRadio/FMRadioUtils;->computeFrequency(I)F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mediatek/FMRadio/FMRadioService;->tuneStationAsync(F)V

    .line 1383
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsPlaying:Z

    if-nez v0, :cond_0

    .line 1384
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->startAnimation()V

    .line 1386
    :cond_0
    return-void
.end method

.method private updateCurrentStation()V
    .locals 3

    .prologue
    .line 1913
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v1}, Lcom/mediatek/FMRadio/FMRadioService;->getFrequency()I

    move-result v0

    .line 1914
    .local v0, freq:I
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioUtils;->isValidStation(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1915
    iget v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    if-eq v1, v0, :cond_0

    .line 1916
    const-string v1, "FmRx/Activity"

    const-string v2, "frequency in service isn\'t same as in database"

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1918
    iput v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    .line 1919
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    iget v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/FMRadioStation;->setCurrentStation(Landroid/content/Context;I)V

    .line 1920
    iget v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    invoke-direct {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshStationUI(I)V

    .line 1923
    :cond_0
    return-void
.end method

.method private updateDialogStatus()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1929
    const-string v1, "FmRx/Activity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateDialogStatus.mIsNeedShowSearchDlg:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowSearchDlg:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1930
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v1}, Lcom/mediatek/FMRadio/FMRadioService;->isScanning()Z

    move-result v0

    .line 1932
    .local v0, isScan:Z
    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowSearchDlg:Z

    if-eqz v1, :cond_0

    .line 1933
    const-string v1, "FmRx/Activity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateDialogStatus: show search dialog. isScan is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1934
    iput-boolean v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowSearchDlg:Z

    .line 1935
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->showSearchDialog()V

    .line 1939
    :cond_0
    iget-boolean v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowRecordDlg:Z

    if-eqz v1, :cond_1

    .line 1940
    const-string v1, "FmRx/Activity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateDialogStatus.reume recordDlg.mPrevRecorderState:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPrevRecorderState:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1941
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v1}, Lcom/mediatek/FMRadio/FMRadioService;->getRecordingName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->showSaveRecordingDialog(Ljava/lang/String;)V

    .line 1942
    iput-boolean v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowRecordDlg:Z

    .line 1946
    :cond_1
    iget-boolean v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowNoAntennaDlg:Z

    if-eqz v1, :cond_2

    .line 1947
    const-string v1, "FmRx/Activity"

    const-string v2, "updateDialogStatus.reume noAntennaDlg:"

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1948
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->showNoAntennaDialog()V

    .line 1949
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuPower(Z)V

    .line 1950
    iput-boolean v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowNoAntennaDlg:Z

    .line 1952
    :cond_2
    return-void
.end method

.method private updateFavoriteStation()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    .line 491
    const/4 v0, 0x0

    .line 493
    .local v0, showString:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    iget v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    invoke-static {v2, v3}, Lcom/mediatek/FMRadio/FMRadioStation;->isFavoriteStation(Landroid/content/Context;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 495
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    iget v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    invoke-static {v2, v3, v4}, Lcom/mediatek/FMRadio/FMRadioStation;->getStationName(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    .line 497
    .local v1, stationName:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    iget v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    invoke-static {v2, v1, v5, v3}, Lcom/mediatek/FMRadio/FMRadioStation;->updateStationToDB(Landroid/content/Context;Ljava/lang/String;II)V

    .line 499
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonAddToFavorite:Landroid/widget/ImageButton;

    const v3, 0x7f020007

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 501
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextStationName:Landroid/widget/TextView;

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 502
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mProjectStringExt:Lcom/mediatek/FMRadio/ext/IProjectStringExt;

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    const v4, 0x7f04001e

    const v5, 0x7f04001f

    invoke-interface {v2, v3, v4, v5}, Lcom/mediatek/FMRadio/ext/IProjectStringExt;->getProjectString(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v0

    .line 533
    .end local v1           #stationName:Ljava/lang/String;
    :goto_0
    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->showToast(Ljava/lang/CharSequence;)V

    .line 538
    return-void

    .line 507
    :cond_0
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    invoke-static {v2, v4}, Lcom/mediatek/FMRadio/FMRadioStation;->getStationCount(Landroid/content/Context;I)I

    move-result v2

    const/4 v3, 0x5

    if-lt v2, v3, :cond_1

    .line 509
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mProjectStringExt:Lcom/mediatek/FMRadio/ext/IProjectStringExt;

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    const v4, 0x7f04001a

    const v5, 0x7f04001b

    invoke-interface {v2, v3, v4, v5}, Lcom/mediatek/FMRadio/ext/IProjectStringExt;->getProjectString(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 513
    :cond_1
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    iget v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    invoke-static {v2, v3, v5}, Lcom/mediatek/FMRadio/FMRadioStation;->getStationName(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    .line 515
    .restart local v1       #stationName:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    iget v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    invoke-static {v2, v3, v5}, Lcom/mediatek/FMRadio/FMRadioStation;->isStationExist(Landroid/content/Context;II)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 517
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    iget v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    invoke-static {v2, v1, v4, v3}, Lcom/mediatek/FMRadio/FMRadioStation;->updateStationToDB(Landroid/content/Context;Ljava/lang/String;II)V

    .line 525
    :goto_1
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonAddToFavorite:Landroid/widget/ImageButton;

    const v3, 0x7f020009

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 527
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextStationName:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 528
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mProjectStringExt:Lcom/mediatek/FMRadio/ext/IProjectStringExt;

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    const v4, 0x7f040020

    const v5, 0x7f040021

    invoke-interface {v2, v3, v4, v5}, Lcom/mediatek/FMRadio/ext/IProjectStringExt;->getProjectString(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 521
    :cond_2
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    iget v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    invoke-static {v2, v1, v3, v4}, Lcom/mediatek/FMRadio/FMRadioStation;->insertStationToDB(Landroid/content/Context;Ljava/lang/String;II)V

    goto :goto_1
.end method

.method private updateMenuStatus()V
    .locals 11

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 1958
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v6}, Lcom/mediatek/FMRadio/FMRadioService;->isPowerUp()Z

    move-result v2

    .line 1959
    .local v2, isPlaying:Z
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v6}, Lcom/mediatek/FMRadio/FMRadioService;->isPowerUping()Z

    move-result v3

    .line 1960
    .local v3, isPoweruping:Z
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v6}, Lcom/mediatek/FMRadio/FMRadioService;->isSeeking()Z

    move-result v5

    .line 1961
    .local v5, isSeeking:Z
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v6}, Lcom/mediatek/FMRadio/FMRadioService;->isScanning()Z

    move-result v4

    .line 1962
    .local v4, isScan:Z
    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v6}, Lcom/mediatek/FMRadio/FMRadioService;->isMakePowerDown()Z

    move-result v1

    .line 1963
    .local v1, isMakePowerdown:Z
    const-string v6, "FmRx/Activity"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "updateMenuStatus.isSeeking:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1964
    if-nez v4, :cond_0

    if-nez v5, :cond_0

    if-eqz v3, :cond_4

    :cond_0
    move v0, v8

    .line 1967
    .local v0, fmStatus:Z
    :goto_0
    if-eqz v0, :cond_5

    move v6, v7

    :goto_1
    invoke-direct {p0, v6}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshImageButton(Z)V

    .line 1968
    if-eqz v0, :cond_6

    move v6, v7

    :goto_2
    invoke-direct {p0, v6}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshPopupMenuItem(Z)V

    .line 1969
    if-eqz v0, :cond_7

    move v6, v7

    :goto_3
    invoke-direct {p0, v6}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuItem(Z)V

    .line 1972
    const-string v6, "FmRx/Activity"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "updateMenuStatus.mIsNeedDisablePower: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-boolean v10, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedDisablePower:Z

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1973
    if-eqz v0, :cond_8

    :cond_1
    :goto_4
    invoke-direct {p0, v7}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuPower(Z)V

    .line 1976
    if-nez v5, :cond_2

    if-eqz v3, :cond_3

    .line 1977
    :cond_2
    const-string v6, "FmRx/Activity"

    const-string v7, "updateMenuStatus. it is seeking or poweruping"

    invoke-static {v6, v7}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1978
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->startAnimation()V

    .line 1980
    :cond_3
    return-void

    .end local v0           #fmStatus:Z
    :cond_4
    move v0, v7

    .line 1964
    goto :goto_0

    .restart local v0       #fmStatus:Z
    :cond_5
    move v6, v2

    .line 1967
    goto :goto_1

    :cond_6
    move v6, v2

    .line 1968
    goto :goto_2

    :cond_7
    move v6, v2

    .line 1969
    goto :goto_3

    .line 1973
    :cond_8
    if-nez v2, :cond_9

    if-eqz v1, :cond_1

    iget-boolean v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedDisablePower:Z

    if-nez v6, :cond_1

    :cond_9
    move v7, v8

    goto :goto_4
.end method

.method private updateRds()V
    .locals 4

    .prologue
    .line 1896
    iget-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsPlaying:Z

    if-eqz v2, :cond_0

    .line 1897
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 1898
    .local v0, bundle:Landroid/os/Bundle;
    const-string v2, "key_ps_info"

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v3}, Lcom/mediatek/FMRadio/FMRadioService;->getPS()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1899
    const-string v2, "key_rt_info"

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v3}, Lcom/mediatek/FMRadio/FMRadioService;->getLRText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1900
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mHandler:Landroid/os/Handler;

    const v3, 0x100011

    invoke-virtual {v2, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 1902
    .local v1, msg:Landroid/os/Message;
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 1903
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1905
    .end local v0           #bundle:Landroid/os/Bundle;
    .end local v1           #msg:Landroid/os/Message;
    :cond_0
    return-void
.end method

.method private updateRecorderError(I)V
    .locals 4
    .parameter "errorType"

    .prologue
    .line 401
    const-string v1, "FmRx/Activity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateRecorderError.errorType: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    const/4 v0, 0x0

    .line 405
    .local v0, showString:Ljava/lang/String;
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshRecordIdle()V

    .line 406
    sparse-switch p1, :sswitch_data_0

    .line 429
    :cond_0
    :goto_0
    const-string v1, "FmRx/Activity"

    const-string v2, "invalid recorder error"

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 433
    :goto_1
    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->showToast(Ljava/lang/CharSequence;)V

    .line 434
    return-void

    .line 408
    :sswitch_0
    const v1, 0x7f040031

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 409
    goto :goto_1

    .line 412
    :sswitch_1
    const v1, 0x7f040032

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 413
    goto :goto_1

    .line 416
    :sswitch_2
    const v1, 0x7f040033

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 417
    goto :goto_1

    .line 420
    :sswitch_3
    const v1, 0x7f040034

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 421
    goto :goto_1

    .line 424
    :sswitch_4
    const v1, 0x7f04003f

    invoke-virtual {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 425
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->isRecordFileExist()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 426
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshPlaybackIdle(Z)V

    goto :goto_0

    .line 406
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x3 -> :sswitch_2
        0x4 -> :sswitch_3
        0x21 -> :sswitch_4
    .end sparse-switch
.end method

.method private updateRecordingState(I)V
    .locals 3
    .parameter "recorderState"

    .prologue
    const/16 v2, 0x65

    .line 367
    iput p1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordState:I

    .line 368
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshRecordingStatus(I)V

    .line 370
    packed-switch p1, :pswitch_data_0

    .line 388
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 391
    :goto_0
    return-void

    .line 372
    :pswitch_0
    const v0, 0x7f040030

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->showToast(Ljava/lang/CharSequence;)V

    .line 373
    const-string v0, "FmRx/Activity"

    const-string v1, "updateRecordingState:startRecording"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 378
    :pswitch_1
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 382
    :pswitch_2
    const-string v0, "FmRx/Activity"

    const-string v1, "updateRecordingState:remove message"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_0

    .line 370
    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public cancelSearch()V
    .locals 2

    .prologue
    .line 1855
    const-string v0, "FmRx/Activity"

    const-string v1, "FMRadioActivity.cancelSearch"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1856
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->stopScan()Z

    .line 1857
    return-void
.end method

.method public isRecordingCardUnmount(Landroid/content/Intent;)Z
    .locals 4
    .parameter "intent"

    .prologue
    .line 1845
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1846
    .local v0, unmountSDCard:Ljava/lang/String;
    const-string v1, "FmRx/Activity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unmount sd card file path: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1847
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "file://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mSDDirectory:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public noAntennaCancel()V
    .locals 2

    .prologue
    .line 1878
    const-string v0, "FmRx/Activity"

    const-string v1, " onClick Negative"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1879
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->exitService()V

    .line 1880
    return-void
.end method

.method public noAntennaContinue()V
    .locals 2

    .prologue
    .line 1865
    const-string v0, "FmRx/Activity"

    const-string v1, " noAntennaContinue.onClick ok to continue"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1866
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->isAntennaAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1867
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->powerUpFM()V

    .line 1872
    :goto_0
    return-void

    .line 1869
    :cond_0
    const-string v0, "FmRx/Activity"

    const-string v1, "noAntennaContinue.earphone is not ready"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1870
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/mediatek/FMRadio/FMRadioService;->switchAntennaAsync(I)V

    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    const/4 v4, 0x1

    .line 1253
    const/4 v1, -0x1

    if-ne v1, p2, :cond_2

    .line 1254
    if-eq v4, p1, :cond_0

    .line 1255
    const-string v1, "FmRx/Activity"

    const-string v2, "Error: Invalid requestcode."

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1290
    :goto_0
    return-void

    .line 1258
    :cond_0
    const-string v1, "ACTIVITY_RESULT"

    iget v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    invoke-virtual {p3, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 1261
    .local v0, iStation:I
    iput v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    .line 1264
    iput-boolean v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedDisablePower:Z

    .line 1265
    const-string v1, "FmRx/Activity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onActivityForReult:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedDisablePower:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1266
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-nez v1, :cond_1

    .line 1267
    const-string v1, "FmRx/Activity"

    const-string v2, "activity.onActivityResult mService is null"

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1268
    iput-boolean v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mNeedTuneto:Z

    goto :goto_0

    .line 1271
    :cond_1
    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->tuneToStation(I)V

    goto :goto_0

    .line 1275
    .end local v0           #iStation:I
    :cond_2
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    iget v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/FMRadioStation;->isFavoriteStation(Landroid/content/Context;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1276
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonAddToFavorite:Landroid/widget/ImageButton;

    const v2, 0x7f020009

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 1278
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextStationName:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    iget v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    const/4 v4, 0x2

    invoke-static {v2, v3, v4}, Lcom/mediatek/FMRadio/FMRadioStation;->getStationName(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1288
    :goto_1
    const-string v1, "FmRx/Activity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The activity for requestcode "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " does not return any data."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1282
    :cond_3
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonAddToFavorite:Landroid/widget/ImageButton;

    const v2, 0x7f020007

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 1284
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextStationName:Landroid/widget/TextView;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method public onBackPressed()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1486
    const-string v1, "FmRx/Activity"

    const-string v2, "begin FMRadioActivity.onBackPressed"

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1488
    iget-boolean v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    if-eqz v1, :cond_1

    .line 1489
    invoke-direct {p0, v3}, Lcom/mediatek/FMRadio/FMRadioActivity;->changeRecordingMode(Z)V

    .line 1490
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-nez v1, :cond_0

    .line 1491
    const-string v1, "FmRx/Activity"

    const-string v2, "mService is null"

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1516
    :goto_0
    return-void

    .line 1495
    :cond_0
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v1}, Lcom/mediatek/FMRadio/FMRadioService;->isPowerUp()Z

    move-result v0

    .line 1496
    .local v0, isPlaying:Z
    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshImageButton(Z)V

    .line 1497
    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshPopupMenuItem(Z)V

    .line 1498
    invoke-direct {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuItem(Z)V

    .line 1499
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuPower(Z)V

    goto :goto_0

    .line 1504
    .end local v0           #isPlaying:Z
    :cond_1
    iget-boolean v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsPlaying:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v1}, Lcom/mediatek/FMRadio/FMRadioService;->isPowerUping()Z

    move-result v1

    if-nez v1, :cond_2

    .line 1505
    invoke-direct {p0, v3}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshImageButton(Z)V

    .line 1506
    invoke-direct {p0, v3}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuItem(Z)V

    .line 1507
    invoke-direct {p0, v3}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshPopupMenuItem(Z)V

    .line 1508
    invoke-direct {p0, v3}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuPower(Z)V

    .line 1509
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->exitService()V

    goto :goto_0

    .line 1513
    :cond_2
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 1515
    const-string v1, "FmRx/Activity"

    const-string v2, "end FMRadioActivity.onBackPressed"

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 8
    .parameter "savedInstanceState"

    .prologue
    .line 848
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 849
    .local v2, startTime:J
    const-string v4, "FmRx/Activity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[Performance test][FMRadio] onCreate start ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 850
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 851
    const-string v4, "FmRx/Activity"

    const-string v5, "FMRadioActivity.onCreate start"

    invoke-static {v4, v5}, Lcom/mediatek/FMRadio/LogUtils;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 853
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v4

    iput-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mFragmentManager:Landroid/app/FragmentManager;

    .line 855
    const/16 v4, 0xa

    invoke-virtual {p0, v4}, Lcom/mediatek/FMRadio/FMRadioActivity;->setVolumeControlStream(I)V

    .line 856
    const v4, 0x7f030007

    invoke-virtual {p0, v4}, Lcom/mediatek/FMRadio/FMRadioActivity;->setContentView(I)V

    .line 860
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->isAirplaneModeOn()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 861
    const v4, 0x7f04005f

    const/4 v5, 0x0

    invoke-static {p0, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 863
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->finish()V

    .line 869
    :cond_0
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->initUIComponent()V

    .line 871
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->registerButtonClickListener()V

    .line 875
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/mediatek/FMRadio/FMRadioStation;->getCurrentStation(Landroid/content/Context;)I

    move-result v4

    iput v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    .line 876
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    iget v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    invoke-static {v4, v5}, Lcom/mediatek/FMRadio/FMRadioStation;->isFavoriteStation(Landroid/content/Context;I)Z

    move-result v1

    .line 880
    .local v1, isFavoriteStation:Z
    if-eqz v1, :cond_1

    .line 881
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonAddToFavorite:Landroid/widget/ImageButton;

    const v5, 0x7f020009

    invoke-virtual {v4, v5}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 883
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextStationName:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    iget v6, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    const/4 v7, 0x2

    invoke-static {v5, v6, v7}, Lcom/mediatek/FMRadio/FMRadioStation;->getStationName(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 890
    :goto_0
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mTextStationValue:Landroid/widget/TextView;

    iget v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I

    invoke-static {v5}, Lcom/mediatek/FMRadio/FMRadioUtils;->formatStation(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 891
    const/high16 v4, 0x7f02

    invoke-static {p0, v4}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v4

    iput-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mAnimation:Landroid/view/animation/Animation;

    .line 893
    const v4, 0x7f060050

    invoke-virtual {p0, v4}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mAnimImage:Landroid/widget/ImageView;

    .line 894
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mAnimImage:Landroid/widget/ImageView;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 896
    const-string v4, "audio"

    invoke-virtual {p0, v4}, Lcom/mediatek/FMRadio/FMRadioActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/media/AudioManager;

    iput-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mAudioManager:Landroid/media/AudioManager;

    .line 899
    const-string v4, "FmRx/Activity"

    const-string v5, "FMRadioActivity.onCreate end"

    invoke-static {v4, v5}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 902
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 903
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v4, "com.mediatek.FMRadio.FMRadioService.ACTION_EXIT_FMSERVICE"

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 904
    const-string v4, "com.mediatek.FMRadio.FMRadioService.ACTION_EXIT_FMSERVICE_AIEPLANE"

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 905
    new-instance v4, Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;-><init>(Lcom/mediatek/FMRadio/FMRadioActivity;Lcom/mediatek/FMRadio/FMRadioActivity$1;)V

    iput-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mBroadcastReceiver:Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;

    .line 906
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mBroadcastReceiver:Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;

    invoke-virtual {p0, v4, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 908
    return-void

    .line 886
    .end local v0           #filter:Landroid/content/IntentFilter;
    :cond_1
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonAddToFavorite:Landroid/widget/ImageButton;

    const v5, 0x7f020007

    invoke-virtual {v4, v5}, Landroid/widget/ImageButton;->setImageResource(I)V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3
    .parameter "menu"

    .prologue
    .line 1096
    const-string v1, "FmRx/Activity"

    const-string v2, "start FMRadioActivity.onCreateOptionsMenu"

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1097
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 1098
    .local v0, inflater:Landroid/view/MenuInflater;
    const/high16 v1, 0x7f05

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 1099
    const v1, 0x7f060054

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mMenuItemChannelList:Landroid/view/MenuItem;

    .line 1100
    const v1, 0x7f060056

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mMenuItemOverflow:Landroid/view/MenuItem;

    .line 1101
    const v1, 0x7f060055

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mMenuItemPower:Landroid/view/MenuItem;

    .line 1103
    const-string v1, "FmRx/Activity"

    const-string v2, "end FMRadioActivity.onCreateOptionsMenu"

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1104
    const/4 v1, 0x1

    return v1
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1057
    const-string v0, "FmRx/Activity"

    const-string v1, "start FMRadioActivity.onDestroy"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1058
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsSDListenerRegistered:Z

    if-eqz v0, :cond_0

    .line 1059
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mSDListener:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1060
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsSDListenerRegistered:Z

    .line 1067
    :cond_0
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 1068
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v0, :cond_1

    .line 1069
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mFMRadioListener:Lcom/mediatek/FMRadio/FMRadioListener;

    invoke-virtual {v0, v1}, Lcom/mediatek/FMRadio/FMRadioService;->unregisterFMRadioListener(Lcom/mediatek/FMRadio/FMRadioListener;)V

    .line 1072
    :cond_1
    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mFMRadioListener:Lcom/mediatek/FMRadio/FMRadioListener;

    .line 1073
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPopupMenu:Landroid/widget/PopupMenu;

    if-eqz v0, :cond_2

    .line 1074
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v0}, Landroid/widget/PopupMenu;->dismiss()V

    .line 1075
    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPopupMenu:Landroid/widget/PopupMenu;

    .line 1077
    :cond_2
    const-string v0, "FmRx/Activity"

    const-string v1, "end FMRadioActivity.onDestroy"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1080
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mBroadcastReceiver:Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;

    if-eqz v0, :cond_3

    .line 1081
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mBroadcastReceiver:Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1082
    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mBroadcastReceiver:Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;

    .line 1085
    :cond_3
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 1086
    return-void
.end method

.method public onDismiss(Landroid/widget/PopupMenu;)V
    .locals 3
    .parameter "menu"

    .prologue
    .line 1760
    const-string v0, "FmRx/Activity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "popmenu dismiss listener:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1761
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->invalidateOptionsMenu()V

    .line 1762
    return-void
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 7
    .parameter "item"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1720
    const-string v4, "FmRx/Activity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onMenuItemClick:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1721
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 1747
    const-string v2, "FmRx/Activity"

    const-string v4, "invalid menu item"

    invoke-static {v2, v4}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1750
    :goto_0
    return v3

    .line 1724
    :pswitch_0
    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowSearchDlg:Z

    .line 1725
    invoke-direct {p0, v3}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshImageButton(Z)V

    .line 1726
    invoke-direct {p0, v3}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuItem(Z)V

    .line 1727
    invoke-direct {p0, v3}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshPopupMenuItem(Z)V

    .line 1728
    invoke-direct {p0, v3}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuPower(Z)V

    .line 1729
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->showSearchDialog()V

    .line 1730
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/mediatek/FMRadio/FMRadioStation;->cleanSearchedStations(Landroid/content/Context;)V

    .line 1731
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v2}, Lcom/mediatek/FMRadio/FMRadioService;->startScanAsync()V

    goto :goto_0

    .line 1735
    :pswitch_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 1736
    .local v0, startTime:J
    const-string v4, "FmRx/Activity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[Performance test][FMRadio] switch speaker start ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1737
    const-string v4, "FmRx/Activity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[Performance test][FMRadio] switch earphone start ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1738
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v4}, Lcom/mediatek/FMRadio/FMRadioService;->isSpeakerUsed()Z

    move-result v4

    if-nez v4, :cond_0

    :goto_1
    invoke-direct {p0, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->setSpeakerPhoneOn(Z)V

    goto :goto_0

    :cond_0
    move v2, v3

    goto :goto_1

    .line 1742
    .end local v0           #startTime:J
    :pswitch_2
    invoke-direct {p0, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->changeRecordingMode(Z)V

    .line 1743
    const/4 v2, -0x1

    invoke-direct {p0, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshRecordingStatus(I)V

    goto :goto_0

    .line 1721
    nop

    :pswitch_data_0
    .packed-switch 0x7f060057
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 8
    .parameter "item"

    .prologue
    const v7, 0x7f060058

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 1163
    const-string v3, "FmRx/Activity"

    const-string v4, "start FMRadioActivity.onOptionsItemSelected"

    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1164
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    .line 1225
    const-string v3, "FmRx/Activity"

    const-string v4, "Error: Invalid options menu item."

    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1228
    :goto_0
    const-string v3, "FmRx/Activity"

    const-string v4, "end FMRadioActivity.onOptionsItemSelected"

    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1229
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v3

    return v3

    .line 1166
    :sswitch_0
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->onBackPressed()V

    goto :goto_0

    .line 1171
    :sswitch_1
    invoke-direct {p0, v5}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshImageButton(Z)V

    .line 1172
    invoke-direct {p0, v5}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuItem(Z)V

    .line 1173
    invoke-direct {p0, v5}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshPopupMenuItem(Z)V

    .line 1174
    invoke-direct {p0, v5}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuPower(Z)V

    .line 1176
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->enterChannelList()V

    goto :goto_0

    .line 1180
    :sswitch_2
    const-string v3, "FmRx/Activity"

    const-string v4, "click fm_power menu"

    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1181
    iget-boolean v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsPlaying:Z

    if-eqz v3, :cond_0

    .line 1182
    invoke-direct {p0, v5}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshImageButton(Z)V

    .line 1183
    invoke-direct {p0, v5}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuItem(Z)V

    .line 1184
    invoke-direct {p0, v5}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshPopupMenuItem(Z)V

    .line 1185
    invoke-direct {p0, v5}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuPower(Z)V

    .line 1186
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->exitService()V

    goto :goto_0

    .line 1189
    :cond_0
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->powerUpFM()V

    goto :goto_0

    .line 1193
    :sswitch_3
    invoke-interface {p1, v5}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 1195
    new-instance v3, Landroid/widget/PopupMenu;

    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mContext:Landroid/content/Context;

    const v5, 0x7f060056

    invoke-virtual {p0, v5}, Lcom/mediatek/FMRadio/FMRadioActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPopupMenu:Landroid/widget/PopupMenu;

    .line 1196
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v3}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v2

    .line 1197
    .local v2, menu:Landroid/view/Menu;
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v3}, Landroid/widget/PopupMenu;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v3

    const v4, 0x7f050001

    invoke-virtual {v3, v4, v2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 1198
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v3, p0}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 1199
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v3, p0}, Landroid/widget/PopupMenu;->setOnDismissListener(Landroid/widget/PopupMenu$OnDismissListener;)V

    .line 1201
    const/4 v0, 0x0

    .line 1203
    .local v0, isFmViaBt:Z
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v3}, Lcom/mediatek/FMRadio/FMRadioService;->isFmViaBt()Z

    move-result v0

    .line 1209
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v3}, Lcom/mediatek/FMRadio/FMRadioService;->isPowerUp()Z

    move-result v1

    .line 1210
    .local v1, isPlaying:Z
    if-eqz v1, :cond_1

    if-nez v0, :cond_1

    .line 1211
    const v3, 0x7f060059

    invoke-interface {v2, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3, v6}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 1212
    invoke-interface {v2, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3, v6}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 1213
    invoke-interface {v2, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v3}, Lcom/mediatek/FMRadio/FMRadioService;->isSpeakerUsed()Z

    move-result v3

    if-eqz v3, :cond_3

    const v3, 0x7f04003e

    :goto_1
    invoke-interface {v4, v3}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 1217
    :cond_1
    if-eqz v1, :cond_2

    .line 1218
    const v3, 0x7f060057

    invoke-interface {v2, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3, v6}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 1221
    :cond_2
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v3}, Landroid/widget/PopupMenu;->show()V

    goto/16 :goto_0

    .line 1213
    :cond_3
    const v3, 0x7f04003d

    goto :goto_1

    .line 1164
    nop

    :sswitch_data_0
    .sparse-switch
        0x102002c -> :sswitch_0
        0x7f060054 -> :sswitch_1
        0x7f060055 -> :sswitch_2
        0x7f060056 -> :sswitch_3
    .end sparse-switch
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 1026
    const-string v0, "FmRx/Activity"

    const-string v1, "start FMRadioActivity.onPause"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1027
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsActivityForeground:Z

    .line 1032
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowSearchDlg:Z

    .line 1033
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->dismissSearchDialog()V

    .line 1034
    const-string v0, "FmRx/Activity"

    const-string v1, "end FMRadioActivity.onPause"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1035
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 1036
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 9
    .parameter "menu"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 1115
    const-string v5, "FmRx/Activity"

    const-string v8, "start FMRadioActivity.onPrepareOptionsMenu"

    invoke-static {v5, v8}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1120
    iget-object v8, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mMenuItemChannelList:Landroid/view/MenuItem;

    iget-boolean v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    if-nez v5, :cond_1

    move v5, v6

    :goto_0
    invoke-interface {v8, v5}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1121
    iget-object v8, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mMenuItemOverflow:Landroid/view/MenuItem;

    iget-boolean v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    if-nez v5, :cond_2

    move v5, v6

    :goto_1
    invoke-interface {v8, v5}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1122
    iget-object v8, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mMenuItemPower:Landroid/view/MenuItem;

    iget-boolean v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    if-nez v5, :cond_3

    move v5, v6

    :goto_2
    invoke-interface {v8, v5}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1123
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-nez v5, :cond_5

    .line 1124
    const-string v5, "FmRx/Activity"

    const-string v8, "mService is null"

    invoke-static {v5, v8}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1125
    iget-boolean v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    if-nez v5, :cond_4

    .line 1152
    :cond_0
    :goto_3
    return v6

    :cond_1
    move v5, v7

    .line 1120
    goto :goto_0

    :cond_2
    move v5, v7

    .line 1121
    goto :goto_1

    :cond_3
    move v5, v7

    .line 1122
    goto :goto_2

    :cond_4
    move v6, v7

    .line 1125
    goto :goto_3

    .line 1127
    :cond_5
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v5}, Lcom/mediatek/FMRadio/FMRadioService;->isShortAntennaSupport()Z

    move-result v4

    .line 1129
    .local v4, isShortAntennaSupport:Z
    if-nez v4, :cond_6

    .line 1130
    const-string v5, "FmRx/Activity"

    const-string v7, "onPrepareOptionsMenu: no antenna support"

    invoke-static {v5, v7}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1131
    invoke-direct {p0, v6}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuPower(Z)V

    goto :goto_3

    .line 1135
    :cond_6
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v5}, Lcom/mediatek/FMRadio/FMRadioService;->isPowerUp()Z

    move-result v1

    .line 1136
    .local v1, isPlaying:Z
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v5}, Lcom/mediatek/FMRadio/FMRadioService;->isMakePowerDown()Z

    move-result v0

    .line 1137
    .local v0, isMakePowerdown:Z
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v5}, Lcom/mediatek/FMRadio/FMRadioService;->isSeeking()Z

    move-result v3

    .line 1138
    .local v3, isSeeking:Z
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v5}, Lcom/mediatek/FMRadio/FMRadioService;->isScanning()Z

    move-result v2

    .line 1140
    .local v2, isScan:Z
    if-nez v3, :cond_7

    if-eqz v2, :cond_a

    :cond_7
    move v5, v7

    :goto_4
    invoke-direct {p0, v5}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuItem(Z)V

    .line 1141
    if-nez v2, :cond_8

    if-eqz v3, :cond_b

    :cond_8
    move v5, v7

    :goto_5
    invoke-direct {p0, v5}, Lcom/mediatek/FMRadio/FMRadioActivity;->refreshActionMenuPower(Z)V

    .line 1146
    if-eqz v3, :cond_9

    .line 1147
    const-string v5, "FmRx/Activity"

    const-string v8, "onPrepareOptionsMenu: it is seeking"

    invoke-static {v5, v8}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1148
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->startAnimation()V

    .line 1151
    :cond_9
    const-string v5, "FmRx/Activity"

    const-string v8, "end FMRadioActivity.onPrepareOptionsMenu"

    invoke-static {v5, v8}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1152
    iget-boolean v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    if-eqz v5, :cond_0

    move v6, v7

    goto :goto_3

    :cond_a
    move v5, v1

    .line 1140
    goto :goto_4

    .line 1141
    :cond_b
    if-nez v1, :cond_c

    if-eqz v0, :cond_d

    iget-boolean v5, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedDisablePower:Z

    if-nez v5, :cond_d

    :cond_c
    move v5, v6

    goto :goto_5

    :cond_d
    move v5, v7

    goto :goto_5
.end method

.method public onRecordingDialogClick(Ljava/lang/String;)V
    .locals 1
    .parameter "recordingName"

    .prologue
    .line 1889
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v0, p1}, Lcom/mediatek/FMRadio/FMRadioService;->saveRecordingAsync(Ljava/lang/String;)V

    .line 1890
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 1005
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 1006
    const-string v0, "FmRx/Activity"

    const-string v1, "FMRadioActivity.onResume start"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1007
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsActivityForeground:Z

    .line 1008
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-nez v0, :cond_0

    .line 1009
    const-string v0, "FmRx/Activity"

    const-string v1, "service has not bind finished"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1019
    :goto_0
    return-void

    .line 1012
    :cond_0
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->updateMenuStatus()V

    .line 1013
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->updateDialogStatus()V

    .line 1014
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->isRecordFileExist()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1015
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mButtonPlayback:Landroid/widget/ImageButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1018
    :cond_1
    const-string v0, "FmRx/Activity"

    const-string v1, "FMRadioActivity.onResume end"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onRetainNonConfigurationInstance()Ljava/lang/Object;
    .locals 5

    .prologue
    .line 1693
    const/4 v2, 0x5

    .line 1694
    .local v2, size:I
    new-instance v0, Landroid/os/Bundle;

    const/4 v3, 0x5

    invoke-direct {v0, v3}, Landroid/os/Bundle;-><init>(I)V

    .line 1695
    .local v0, bundle:Landroid/os/Bundle;
    const/4 v1, 0x0

    .line 1696
    .local v1, isInRecordingMode:Z
    const-string v3, "isInRecordingMode"

    iget-boolean v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsInRecordingMode:Z

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1697
    const-string v3, "mPrevRecorderState"

    iget v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mPrevRecorderState:I

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1698
    const-string v3, "mIsFreshRecordingStatus"

    iget-boolean v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowRecordDlg:Z

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1699
    const-string v3, "mIsNeedShowNoAntennaDlg"

    iget-boolean v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowNoAntennaDlg:Z

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1700
    const-string v3, "mIsNeedShowSearchDlg"

    iget-boolean v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsNeedShowSearchDlg:Z

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1701
    const-string v3, "mRecordState"

    iget v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordState:I

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1702
    const-string v3, "mIsPlaying"

    iget-boolean v4, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsPlaying:Z

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1703
    return-object v0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 1708
    const-string v0, "FmRx/Activity"

    const-string v1, "onSaveInstanceState"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1709
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 1710
    return-void
.end method

.method public onStart()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 974
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 975
    const-string v0, "FmRx/Activity"

    const-string v1, "FMRadioActivity.onStart start"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 978
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/FMRadio/FMRadioService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v0

    if-nez v0, :cond_0

    .line 980
    const-string v0, "FmRx/Activity"

    const-string v1, "Error: Cannot start FM service"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 998
    :goto_0
    return-void

    .line 984
    :cond_0
    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsServiceStarted:Z

    .line 985
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/FMRadio/FMRadioService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0, v1, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsServiceBinded:Z

    .line 989
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsServiceBinded:Z

    if-nez v0, :cond_1

    .line 990
    const-string v0, "FmRx/Activity"

    const-string v1, "Error: Cannot bind FM service"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 991
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->finish()V

    goto :goto_0

    .line 995
    :cond_1
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioActivity;->restoreConfiguration()V

    .line 997
    const-string v0, "FmRx/Activity"

    const-string v1, "FMRadioActivity.onStart end"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 1043
    const-string v0, "FmRx/Activity"

    const-string v1, "start FMRadioActivity.onStop"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1044
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsServiceBinded:Z

    if-eqz v0, :cond_0

    .line 1045
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 1046
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mIsServiceBinded:Z

    .line 1048
    :cond_0
    const-string v0, "FmRx/Activity"

    const-string v1, "end FMRadioActivity.onStop"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1049
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 1050
    return-void
.end method

.method public showNoAntennaDialog()V
    .locals 3

    .prologue
    .line 1788
    invoke-static {}, Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;->newInstance()Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;

    move-result-object v0

    .line 1789
    .local v0, newFragment:Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mFragmentManager:Landroid/app/FragmentManager;

    const-string v2, "NoAntenna"

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 1790
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mFragmentManager:Landroid/app/FragmentManager;

    invoke-virtual {v1}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    .line 1792
    return-void
.end method

.method public showSaveRecordingDialog(Ljava/lang/String;)V
    .locals 3
    .parameter "name"

    .prologue
    .line 1802
    new-instance v0, Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    invoke-direct {v0, p1}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;-><init>(Ljava/lang/String;)V

    .line 1803
    .local v0, newFragment:Lcom/mediatek/FMRadio/FMRecordDialogFragment;
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mFragmentManager:Landroid/app/FragmentManager;

    const-string v2, "SaveRecording"

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 1804
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mFragmentManager:Landroid/app/FragmentManager;

    invoke-virtual {v1}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    .line 1805
    return-void
.end method

.method public showSearchDialog()V
    .locals 3

    .prologue
    .line 1811
    invoke-static {}, Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;->newInstance()Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;

    move-result-object v0

    .line 1812
    .local v0, newFragment:Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mFragmentManager:Landroid/app/FragmentManager;

    const-string v2, "Search"

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 1813
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity;->mFragmentManager:Landroid/app/FragmentManager;

    invoke-virtual {v1}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    .line 1814
    return-void
.end method
