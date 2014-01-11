.class public Lcom/mediatek/FMRadio/FMRadioEMActivity;
.super Landroid/app/Activity;
.source "FMRadioEMActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/FMRadio/FMRadioEMActivity$FactoryTestModeReceiver;,
        Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;
    }
.end annotation


# static fields
.field private static final MSGID_INIT_OK:I = 0x7

.field private static final MSGID_OK:I = 0x1

.field private static final MSGID_POWERUP:I = 0x8

.field private static final MSGID_TICK_EVENT:I = 0x6

.field private static final MSGID_TUNE_FNISHED:I = 0x9

.field private static final MSGID_UPDATE_CURRENT_STATION:I = 0x3

.field private static final MSGID_UPDATE_RDS:I = 0x2

.field private static final RDS_BLER_STRING:Ljava/lang/String; = "RDS_BLER_STRING"

.field private static final RDS_CAPARRAY_STRING:Ljava/lang/String; = "RDS_CAPARRAY_STRING"

.field private static final RDS_RSSI_STRING:Ljava/lang/String; = "RDS_RSSI_STRING"

.field private static final RDS_STEREMONO_STRING:Ljava/lang/String; = "RDS_STEREMONO_STRING"

.field public static final TAG:Ljava/lang/String; = "FmRx/EM"

.field private static final TYPE_MSGID:Ljava/lang/String; = "MSGID"

.field private static freps:[Ljava/lang/String;

.field private static names:[I


# instance fields
.field private factorymode:Z

.field private mAudioManager:Landroid/media/AudioManager;

.field private mButtonClickListener:Landroid/view/View$OnClickListener;

.field private mButtonTune:Landroid/widget/Button;

.field private mContext:Landroid/content/Context;

.field private mCurrentStation:I

.field private mEditFreq:Landroid/widget/EditText;

.field private mEditLayout:Landroid/widget/LinearLayout;

.field private mEditText:Landroid/widget/EditText;

.field private mFMEmLayout:Landroid/widget/LinearLayout;

.field private mFMEmLayout1:Landroid/widget/LinearLayout;

.field private mFMEmLayout2:Landroid/widget/LinearLayout;

.field private mFMEmLayout3:Landroid/widget/LinearLayout;

.field private mFMEmLayout4:Landroid/widget/LinearLayout;

.field private mFMEmLayout5:Landroid/widget/LinearLayout;

.field private mFMEmLayout6:Landroid/widget/LinearLayout;

.field private mFMFactoryLayout:Landroid/widget/RelativeLayout;

.field private mFMRadioListener:Lcom/mediatek/FMRadio/FMRadioListener;

.field private mFMStationList:Landroid/widget/ListView;

.field private mFMinfo:Landroid/widget/Button;

.field private mFactoryTestModeReceiver:Lcom/mediatek/FMRadio/FMRadioEMActivity$FactoryTestModeReceiver;

.field private mHandler:Landroid/os/Handler;

.field private mHeadsetConnectionReceiver:Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;

.field private mIsDestroying:Z

.field private mIsPlaying:Z

.field private mIsServiceBinded:Z

.field private mIsServiceStarted:Z

.field private mIsTickEventExit:Z

.field private mLRTextString:Ljava/lang/String;

.field private mPSString:Ljava/lang/String;

.field private mRdAntennaL:Landroid/widget/RadioButton;

.field private mRdAntennaS:Landroid/widget/RadioButton;

.field private mRdMono:Landroid/widget/RadioButton;

.field private mRdStereo:Landroid/widget/RadioButton;

.field private mRgAntenna:Landroid/widget/RadioGroup;

.field private mService:Lcom/mediatek/FMRadio/FMRadioService;

.field private mServiceConnection:Landroid/content/ServiceConnection;

.field private mTextCapArray:Landroid/widget/TextView;

.field private mTextChipID:Landroid/widget/TextView;

.field private mTextDSPVersion:Landroid/widget/TextView;

.field private mTextECOVersion:Landroid/widget/TextView;

.field private mTextPatchVersion:Landroid/widget/TextView;

.field private mTextRdsBler:Landroid/widget/TextView;

.field private mTextRdsPS:Landroid/widget/TextView;

.field private mTextRdsRT:Landroid/widget/TextView;

.field private mTextRssi:Landroid/widget/TextView;

.field private mTextStereoMono:Landroid/widget/TextView;

.field private mTickEventThread:Ljava/lang/Thread;

.field private mTuneButton:Landroid/widget/Button;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x5

    .line 410
    new-array v0, v3, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "87.9"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "91.4"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "97.7"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "101.7"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "106.5"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->freps:[Ljava/lang/String;

    .line 411
    new-array v0, v3, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->names:[I

    return-void

    :array_0
    .array-data 0x4
        0x15t 0x0t 0x4t 0x7ft
        0x15t 0x0t 0x4t 0x7ft
        0x15t 0x0t 0x4t 0x7ft
        0x15t 0x0t 0x4t 0x7ft
        0x15t 0x0t 0x4t 0x7ft
    .end array-data
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 77
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 95
    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsServiceStarted:Z

    .line 96
    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsServiceBinded:Z

    .line 97
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    .line 99
    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsPlaying:Z

    .line 102
    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsDestroying:Z

    .line 103
    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsTickEventExit:Z

    .line 106
    const-string v0, ""

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mPSString:Ljava/lang/String;

    .line 107
    const-string v0, ""

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mLRTextString:Ljava/lang/String;

    .line 109
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextStereoMono:Landroid/widget/TextView;

    .line 110
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRssi:Landroid/widget/TextView;

    .line 111
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextCapArray:Landroid/widget/TextView;

    .line 112
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRdsBler:Landroid/widget/TextView;

    .line 113
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRdsPS:Landroid/widget/TextView;

    .line 114
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRdsRT:Landroid/widget/TextView;

    .line 115
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextChipID:Landroid/widget/TextView;

    .line 116
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextECOVersion:Landroid/widget/TextView;

    .line 117
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextPatchVersion:Landroid/widget/TextView;

    .line 118
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextDSPVersion:Landroid/widget/TextView;

    .line 119
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditFreq:Landroid/widget/EditText;

    .line 120
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mButtonTune:Landroid/widget/Button;

    .line 121
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRdAntennaS:Landroid/widget/RadioButton;

    .line 122
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRdAntennaL:Landroid/widget/RadioButton;

    .line 123
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRgAntenna:Landroid/widget/RadioGroup;

    .line 124
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRdStereo:Landroid/widget/RadioButton;

    .line 125
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRdMono:Landroid/widget/RadioButton;

    .line 126
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mContext:Landroid/content/Context;

    .line 129
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout:Landroid/widget/LinearLayout;

    .line 130
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout1:Landroid/widget/LinearLayout;

    .line 131
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout2:Landroid/widget/LinearLayout;

    .line 132
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout3:Landroid/widget/LinearLayout;

    .line 133
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout4:Landroid/widget/LinearLayout;

    .line 134
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout5:Landroid/widget/LinearLayout;

    .line 135
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout6:Landroid/widget/LinearLayout;

    .line 136
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMFactoryLayout:Landroid/widget/RelativeLayout;

    .line 137
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditLayout:Landroid/widget/LinearLayout;

    .line 138
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditText:Landroid/widget/EditText;

    .line 139
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTuneButton:Landroid/widget/Button;

    .line 141
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTickEventThread:Ljava/lang/Thread;

    .line 144
    const/16 v0, 0x3e8

    iput v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mCurrentStation:I

    .line 145
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mAudioManager:Landroid/media/AudioManager;

    .line 146
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mHeadsetConnectionReceiver:Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;

    .line 148
    iput-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->factorymode:Z

    .line 149
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFactoryTestModeReceiver:Lcom/mediatek/FMRadio/FMRadioEMActivity$FactoryTestModeReceiver;

    .line 213
    new-instance v0, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;

    invoke-direct {v0, p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;-><init>(Lcom/mediatek/FMRadio/FMRadioEMActivity;)V

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mButtonClickListener:Landroid/view/View$OnClickListener;

    .line 282
    new-instance v0, Lcom/mediatek/FMRadio/FMRadioEMActivity$2;

    invoke-direct {v0, p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity$2;-><init>(Lcom/mediatek/FMRadio/FMRadioEMActivity;)V

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMRadioListener:Lcom/mediatek/FMRadio/FMRadioListener;

    .line 409
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMStationList:Landroid/widget/ListView;

    .line 500
    new-instance v0, Lcom/mediatek/FMRadio/FMRadioEMActivity$4;

    invoke-direct {v0, p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity$4;-><init>(Lcom/mediatek/FMRadio/FMRadioEMActivity;)V

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 576
    new-instance v0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;

    invoke-direct {v0, p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;-><init>(Lcom/mediatek/FMRadio/FMRadioEMActivity;)V

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method private AdapterFmStation()V
    .locals 3

    .prologue
    .line 415
    const v0, 0x7f060012

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMStationList:Landroid/widget/ListView;

    .line 416
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMStationList:Landroid/widget/ListView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    .line 417
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMStationList:Landroid/widget/ListView;

    sget-object v1, Lcom/mediatek/FMRadio/FMRadioEMActivity;->freps:[Ljava/lang/String;

    sget-object v2, Lcom/mediatek/FMRadio/FMRadioEMActivity;->names:[I

    invoke-direct {p0, v1, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getMenuAdapter([Ljava/lang/String;[I)Landroid/widget/SimpleAdapter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 418
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMStationList:Landroid/widget/ListView;

    new-instance v1, Lcom/mediatek/FMRadio/FMRadioEMActivity$3;

    invoke-direct {v1, p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity$3;-><init>(Lcom/mediatek/FMRadio/FMRadioEMActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 432
    return-void
.end method

.method private HideButtonsAndText()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 436
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout1:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout1:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 437
    :cond_0
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout2:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout2:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 438
    :cond_1
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout3:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout3:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 439
    :cond_2
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout4:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout4:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 440
    :cond_3
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout5:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout5:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 441
    :cond_4
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout6:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout6:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 442
    :cond_5
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMFactoryLayout:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMFactoryLayout:Landroid/widget/RelativeLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 444
    :cond_6
    return-void
.end method

.method private StartToHandlerFactoryMode()V
    .locals 0

    .prologue
    .line 406
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->HideButtonsAndText()V

    .line 407
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsPlaying:Z

    return v0
.end method

.method static synthetic access$002(Lcom/mediatek/FMRadio/FMRadioEMActivity;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    iput-boolean p1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsPlaying:Z

    return p1
.end method

.method static synthetic access$100(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/RadioGroup;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRgAntenna:Landroid/widget/RadioGroup;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/Button;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mButtonTune:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/mediatek/FMRadio/FMRadioEMActivity;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->tuneToStation(I)V

    return-void
.end method

.method static synthetic access$1200(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/EditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1600()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    sget-object v0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->freps:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Lcom/mediatek/FMRadio/FMRadioListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMRadioListener:Lcom/mediatek/FMRadio/FMRadioListener;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->isServiceInit()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1900(Lcom/mediatek/FMRadio/FMRadioEMActivity;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->initService(I)V

    return-void
.end method

.method static synthetic access$200(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Lcom/mediatek/FMRadio/FMRadioService;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/mediatek/FMRadio/FMRadioEMActivity;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->refreshTextStatus(Z)V

    return-void
.end method

.method static synthetic access$202(Lcom/mediatek/FMRadio/FMRadioEMActivity;Lcom/mediatek/FMRadio/FMRadioService;)Lcom/mediatek/FMRadio/FMRadioService;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    return-object p1
.end method

.method static synthetic access$2100(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->isDeviceOpen()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2200(Lcom/mediatek/FMRadio/FMRadioEMActivity;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getFrequency()I

    move-result v0

    return v0
.end method

.method static synthetic access$2300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->isPowerUp()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2502(Lcom/mediatek/FMRadio/FMRadioEMActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mPSString:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2600(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getPS()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2702(Lcom/mediatek/FMRadio/FMRadioEMActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mLRTextString:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2800(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getLRText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2900(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsDestroying:Z

    return v0
.end method

.method static synthetic access$300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/Button;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMinfo:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$3000(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextChipID:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3100(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextECOVersion:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3200(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextPatchVersion:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextDSPVersion:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3400(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRdsBler:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3500(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRssi:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3600(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextStereoMono:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3700(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextCapArray:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$3800(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->isSpeakerUsed()Z

    move-result v0

    return v0
.end method

.method static synthetic access$3900(Lcom/mediatek/FMRadio/FMRadioEMActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->showRDS()V

    return-void
.end method

.method static synthetic access$400(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/ListView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMStationList:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$4000(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsTickEventExit:Z

    return v0
.end method

.method static synthetic access$4100(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/RadioButton;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRdAntennaL:Landroid/widget/RadioButton;

    return-object v0
.end method

.method static synthetic access$4200(Lcom/mediatek/FMRadio/FMRadioEMActivity;I)Ljava/lang/String;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->formatCapArray(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/LinearLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditLayout:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$602(Lcom/mediatek/FMRadio/FMRadioEMActivity;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    iput-boolean p1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->factorymode:Z

    return p1
.end method

.method static synthetic access$700(Lcom/mediatek/FMRadio/FMRadioEMActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->StartToHandlerFactoryMode()V

    return-void
.end method

.method static synthetic access$800(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/EditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditFreq:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$900(Lcom/mediatek/FMRadio/FMRadioEMActivity;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mCurrentStation:I

    return v0
.end method

.method static synthetic access$902(Lcom/mediatek/FMRadio/FMRadioEMActivity;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    iput p1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mCurrentStation:I

    return p1
.end method

.method private formatCapArray(I)Ljava/lang/String;
    .locals 9
    .parameter "raw"

    .prologue
    const/4 v8, 0x1

    .line 651
    const/16 v4, 0x8

    new-array v2, v4, [F

    fill-array-data v2, :array_0

    .line 653
    .local v2, pF:[F
    const/4 v3, 0x0

    .line 654
    .local v3, sum:F
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v4, v2

    if-ge v1, v4, :cond_1

    .line 655
    const/4 v0, 0x6

    .line 656
    .local v0, base:I
    float-to-double v6, v3

    add-int/lit8 v4, v1, 0x6

    shr-int v4, p1, v4

    and-int/lit8 v4, v4, 0x1

    if-ne v4, v8, :cond_0

    aget v4, v2, v1

    float-to-double v4, v4

    :goto_1
    add-double/2addr v4, v6

    double-to-float v3, v4

    .line 654
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 656
    :cond_0
    const-wide/16 v4, 0x0

    goto :goto_1

    .line 658
    .end local v0           #base:I
    :cond_1
    const-string v4, "%.2f"

    new-array v5, v8, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 651
    :array_0
    .array-data 0x4
        0xe7t 0xfbt 0x29t 0x3et
        0xe7t 0xfbt 0xa9t 0x3et
        0xe7t 0xfbt 0x29t 0x3ft
        0x71t 0x3dt 0xaat 0x3ft
        0x71t 0x3dt 0x2at 0x40t
        0x85t 0xebt 0xa9t 0x40t
        0x9at 0x99t 0x29t 0x41t
        0xcdt 0xcct 0x94t 0x41t
    .end array-data
.end method

.method private getFrequency()I
    .locals 1

    .prologue
    .line 900
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v0, :cond_0

    .line 901
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->getFrequency()I

    move-result v0

    .line 903
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getLRText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 866
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v0, :cond_0

    .line 867
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->getLRText()Ljava/lang/String;

    move-result-object v0

    .line 869
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getMenuAdapter([Ljava/lang/String;[I)Landroid/widget/SimpleAdapter;
    .locals 9
    .parameter "frep"
    .parameter "names"

    .prologue
    const/4 v8, 0x2

    .line 471
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 472
    .local v2, data:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v6, 0x0

    .local v6, i:I
    :goto_0
    array-length v1, p1

    if-ge v6, v1, :cond_0

    .line 473
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 474
    .local v7, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "itemfrep"

    aget-object v3, p1, v6

    invoke-virtual {v7, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    const-string v1, "itemname"

    aget v3, p2, v6

    invoke-virtual {p0, v3}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 472
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 479
    .end local v7           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    new-instance v0, Landroid/widget/SimpleAdapter;

    const v3, 0x7f030004

    new-array v4, v8, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v5, "itemfrep"

    aput-object v5, v4, v1

    const/4 v1, 0x1

    const-string v5, "itemname"

    aput-object v5, v4, v1

    new-array v5, v8, [I

    fill-array-data v5, :array_0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    .line 482
    .local v0, simperAdapter:Landroid/widget/SimpleAdapter;
    return-object v0

    .line 479
    :array_0
    .array-data 0x4
        0x16t 0x0t 0x6t 0x7ft
        0x17t 0x0t 0x6t 0x7ft
    .end array-data
.end method

.method private getPS()Ljava/lang/String;
    .locals 1

    .prologue
    .line 859
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v0, :cond_0

    .line 860
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->getPS()Ljava/lang/String;

    move-result-object v0

    .line 862
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private initService(I)V
    .locals 1
    .parameter "iCurrentStation"

    .prologue
    .line 887
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v0, :cond_0

    .line 888
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v0, p1}, Lcom/mediatek/FMRadio/FMRadioService;->initService(I)V

    .line 890
    :cond_0
    return-void
.end method

.method private isAntennaAvailable()Z
    .locals 1

    .prologue
    .line 742
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    move-result v0

    return v0
.end method

.method private isDeviceOpen()Z
    .locals 1

    .prologue
    .line 844
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v0, :cond_0

    .line 845
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->isDeviceOpen()Z

    move-result v0

    .line 847
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isPowerUp()Z
    .locals 2

    .prologue
    .line 851
    const/4 v0, 0x0

    .line 852
    .local v0, bRet:Z
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v1, :cond_0

    .line 853
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v1}, Lcom/mediatek/FMRadio/FMRadioService;->isPowerUp()Z

    move-result v1

    .line 855
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private isRDSSupported()Z
    .locals 1

    .prologue
    .line 873
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v0, :cond_0

    .line 874
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->isRDSSupported()Z

    move-result v0

    .line 876
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isServiceInit()Z
    .locals 1

    .prologue
    .line 893
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v0, :cond_0

    .line 894
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->isServiceInit()Z

    move-result v0

    .line 896
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isSpeakerUsed()Z
    .locals 1

    .prologue
    .line 880
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v0, :cond_0

    .line 881
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->isSpeakerUsed()Z

    move-result v0

    .line 883
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private refreshTextStatus(Z)V
    .locals 2
    .parameter "on"

    .prologue
    .line 751
    if-nez p1, :cond_0

    .line 752
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextStereoMono:Landroid/widget/TextView;

    const-string v1, "X"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 753
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRssi:Landroid/widget/TextView;

    const-string v1, "X"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 754
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextCapArray:Landroid/widget/TextView;

    const-string v1, "X"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 755
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRdsBler:Landroid/widget/TextView;

    const-string v1, "X"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 756
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRdsPS:Landroid/widget/TextView;

    const-string v1, "X"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 757
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRdsRT:Landroid/widget/TextView;

    const-string v1, "X"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 758
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditFreq:Landroid/widget/EditText;

    iget v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mCurrentStation:I

    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRadioUtils;->formatStation(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 759
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRgAntenna:Landroid/widget/RadioGroup;

    invoke-virtual {v0}, Landroid/widget/RadioGroup;->clearCheck()V

    .line 760
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mButtonTune:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 764
    :goto_0
    return-void

    .line 762
    :cond_0
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mButtonTune:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0
.end method

.method private showRDS()V
    .locals 3

    .prologue
    .line 775
    const-string v0, "FmRx/EM"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FMRadioEMActivity.showRDS PS : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mPSString:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "RT :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mLRTextString:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 776
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRdsPS:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mPSString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 777
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRdsRT:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mLRTextString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 778
    return-void
.end method

.method private stopTickEventThread()V
    .locals 2

    .prologue
    .line 1057
    const-string v0, "FmRx/EM"

    const-string v1, ">>> stopTickEventThread"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1058
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTickEventThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 1059
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsTickEventExit:Z

    .line 1060
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTickEventThread:Ljava/lang/Thread;

    .line 1062
    :cond_0
    const-string v0, "FmRx/EM"

    const-string v1, "<<< stopTickEventThread"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1063
    return-void
.end method

.method private tuneToStation(I)V
    .locals 2
    .parameter "iStation"

    .prologue
    .line 746
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-static {p1}, Lcom/mediatek/FMRadio/FMRadioUtils;->computeFrequency(I)F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mediatek/FMRadio/FMRadioService;->tuneStationAsync(F)V

    .line 747
    return-void
.end method


# virtual methods
.method public getChipId()Ljava/lang/String;
    .locals 3

    .prologue
    .line 785
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getHardwareVersion()[I

    move-result-object v1

    .line 786
    .local v1, hardwareVersion:[I
    const/4 v0, 0x0

    .line 787
    .local v0, chipId:I
    if-eqz v1, :cond_0

    .line 788
    const/4 v2, 0x0

    aget v0, v1, v2

    .line 790
    :cond_0
    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getStringValue(I)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getDspVersion()Ljava/lang/String;
    .locals 4

    .prologue
    .line 835
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getHardwareVersion()[I

    move-result-object v1

    .line 836
    .local v1, hardwareVersion:[I
    const/4 v0, 0x0

    .line 837
    .local v0, dspVersion:I
    if-eqz v1, :cond_0

    .line 838
    const/4 v2, 0x2

    aget v0, v1, v2

    .line 840
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "V"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getStringValue(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getEcoVersion()Ljava/lang/String;
    .locals 4

    .prologue
    .line 798
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getHardwareVersion()[I

    move-result-object v1

    .line 799
    .local v1, hardwareVersion:[I
    const/4 v0, 0x0

    .line 800
    .local v0, ecoVersion:I
    if-eqz v1, :cond_0

    .line 801
    const/4 v2, 0x1

    aget v0, v1, v2

    .line 803
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "E"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getStringValue(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getHardwareVersion()[I
    .locals 4

    .prologue
    .line 985
    const/4 v0, 0x0

    .line 986
    .local v0, hardwareVersion:[I
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v1, :cond_0

    .line 987
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v1}, Lcom/mediatek/FMRadio/FMRadioService;->getHardwareVersion()[I

    move-result-object v0

    .line 989
    :cond_0
    const-string v1, "FmRx/EM"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getHardwareversion: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 990
    return-object v0
.end method

.method public getPatchVersion()Ljava/lang/String;
    .locals 9

    .prologue
    .line 811
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getHardwareVersion()[I

    move-result-object v1

    .line 812
    .local v1, hardwareVersion:[I
    const/4 v5, 0x0

    .line 813
    .local v5, patchVersion:I
    if-eqz v1, :cond_0

    .line 814
    const/4 v6, 0x3

    .line 815
    .local v6, patchVersionPosition:I
    const/4 v7, 0x3

    aget v5, v1, v7

    .line 817
    .end local v6           #patchVersionPosition:I
    :cond_0
    invoke-virtual {p0, v5}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getStringValue(I)Ljava/lang/String;

    move-result-object v4

    .line 818
    .local v4, patchStr:Ljava/lang/String;
    const/4 v3, 0x0

    .line 819
    .local v3, patch:F
    if-eqz v4, :cond_1

    .line 821
    const/16 v2, 0x64

    .line 822
    .local v2, hundred:I
    :try_start_0
    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    const/high16 v8, 0x42c8

    div-float v3, v7, v8

    .line 827
    .end local v2           #hundred:I
    :cond_1
    :goto_0
    invoke-static {v3}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 823
    .restart local v2       #hundred:I
    :catch_0
    move-exception v0

    .line 824
    .local v0, e:Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_0
.end method

.method public getStereoMono()Z
    .locals 1

    .prologue
    .line 933
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v0, :cond_0

    .line 934
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->getStereoMono()Z

    move-result v0

    .line 936
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getStringValue(I)Ljava/lang/String;
    .locals 5
    .parameter "convertData"

    .prologue
    .line 999
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 1000
    .local v3, temp:Ljava/lang/StringBuilder;
    move v1, p1

    .line 1001
    .local v1, quotient:I
    const/4 v2, 0x0

    .line 1002
    .local v2, remainder:I
    :goto_0
    if-lez v1, :cond_0

    .line 1003
    const/16 v0, 0x10

    .line 1004
    .local v0, hexadecimal:I
    rem-int/lit8 v2, v1, 0x10

    .line 1005
    div-int/lit8 v1, v1, 0x10

    .line 1006
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1007
    goto :goto_0

    .line 1008
    .end local v0           #hexadecimal:I
    :cond_0
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->reverse()Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public onBackPressed()V
    .locals 3

    .prologue
    .line 487
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->factorymode:Z

    if-eqz v0, :cond_0

    .line 488
    new-instance v0, Landroid/content/Intent;

    const-string v1, "exit_fm_cit_test"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "exit"

    const-string v2, "true"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 489
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->finish()V

    .line 493
    :goto_0
    return-void

    .line 491
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->finish()V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    .line 448
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    .line 449
    .local v1, id:I
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 450
    .local v0, i:Landroid/content/Intent;
    const-string v2, "return_result_form_fm"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 451
    packed-switch v1, :pswitch_data_0

    .line 459
    :goto_0
    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 460
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->finish()V

    .line 461
    return-void

    .line 453
    :pswitch_0
    const-string v2, "result"

    const-string v3, "pass"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 456
    :pswitch_1
    const-string v2, "result"

    const-string v3, "fail"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 451
    :pswitch_data_0
    .packed-switch 0x7f060014
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .parameter "savedInstanceState"

    .prologue
    const/4 v5, 0x0

    const/16 v4, 0x8

    .line 298
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 299
    const-string v2, "FmRx/EM"

    const-string v3, "begin FMRadioEMActivity.onCreate"

    invoke-static {v2, v3}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    const/16 v2, 0xa

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->setVolumeControlStream(I)V

    .line 302
    const v2, 0x7f030006

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->setContentView(I)V

    .line 304
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mContext:Landroid/content/Context;

    .line 305
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/mediatek/FMRadio/FMRadioStation;->initFMDatabase(Landroid/content/Context;)V

    .line 308
    const v2, 0x7f060020

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout:Landroid/widget/LinearLayout;

    .line 309
    const v2, 0x7f060021

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout1:Landroid/widget/LinearLayout;

    .line 310
    const v2, 0x7f060025

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout2:Landroid/widget/LinearLayout;

    .line 311
    const v2, 0x7f060029

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout3:Landroid/widget/LinearLayout;

    .line 312
    const v2, 0x7f06002d

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout4:Landroid/widget/LinearLayout;

    .line 313
    const v2, 0x7f060031

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout5:Landroid/widget/LinearLayout;

    .line 314
    const v2, 0x7f060035

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMEmLayout6:Landroid/widget/LinearLayout;

    .line 316
    const v2, 0x7f06000d

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMFactoryLayout:Landroid/widget/RelativeLayout;

    .line 317
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMFactoryLayout:Landroid/widget/RelativeLayout;

    const v3, 0x7f06000f

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditLayout:Landroid/widget/LinearLayout;

    .line 318
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMFactoryLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v4}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 319
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 321
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMFactoryLayout:Landroid/widget/RelativeLayout;

    const v3, 0x7f06000e

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMinfo:Landroid/widget/Button;

    .line 323
    const v2, 0x7f06002e

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextStereoMono:Landroid/widget/TextView;

    .line 324
    const v2, 0x7f06002f

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRssi:Landroid/widget/TextView;

    .line 325
    const v2, 0x7f060030

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextCapArray:Landroid/widget/TextView;

    .line 326
    const v2, 0x7f060032

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRdsBler:Landroid/widget/TextView;

    .line 327
    const v2, 0x7f060033

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRdsPS:Landroid/widget/TextView;

    .line 328
    const v2, 0x7f060034

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRdsRT:Landroid/widget/TextView;

    .line 329
    const v2, 0x7f060036

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextChipID:Landroid/widget/TextView;

    .line 330
    const v2, 0x7f060037

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextECOVersion:Landroid/widget/TextView;

    .line 331
    const v2, 0x7f060038

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextPatchVersion:Landroid/widget/TextView;

    .line 332
    const v2, 0x7f060039

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextDSPVersion:Landroid/widget/TextView;

    .line 333
    const v2, 0x7f060023

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditFreq:Landroid/widget/EditText;

    .line 334
    const v2, 0x7f060024

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mButtonTune:Landroid/widget/Button;

    .line 335
    const v2, 0x7f060027

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioButton;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRdAntennaS:Landroid/widget/RadioButton;

    .line 336
    const v2, 0x7f060028

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioButton;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRdAntennaL:Landroid/widget/RadioButton;

    .line 337
    const v2, 0x7f060026

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioGroup;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRgAntenna:Landroid/widget/RadioGroup;

    .line 338
    const v2, 0x7f06002b

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioButton;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRdStereo:Landroid/widget/RadioButton;

    .line 339
    const v2, 0x7f06002c

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioButton;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRdMono:Landroid/widget/RadioButton;

    .line 341
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRdAntennaS:Landroid/widget/RadioButton;

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 342
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRdAntennaL:Landroid/widget/RadioButton;

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 343
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRdStereo:Landroid/widget/RadioButton;

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 344
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRdMono:Landroid/widget/RadioButton;

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 345
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mButtonTune:Landroid/widget/Button;

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 365
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 366
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v2, "start_in_factory_mode"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 367
    new-instance v2, Lcom/mediatek/FMRadio/FMRadioEMActivity$FactoryTestModeReceiver;

    invoke-direct {v2, p0, v5}, Lcom/mediatek/FMRadio/FMRadioEMActivity$FactoryTestModeReceiver;-><init>(Lcom/mediatek/FMRadio/FMRadioEMActivity;Lcom/mediatek/FMRadio/FMRadioEMActivity$1;)V

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFactoryTestModeReceiver:Lcom/mediatek/FMRadio/FMRadioEMActivity$FactoryTestModeReceiver;

    .line 368
    const-string v2, "FmRx/EM"

    const-string v3, "Register mFactoryTestModeReceiver"

    invoke-static {v2, v3}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 369
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFactoryTestModeReceiver:Lcom/mediatek/FMRadio/FMRadioEMActivity$FactoryTestModeReceiver;

    invoke-virtual {p0, v2, v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 373
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 374
    .local v1, filterHeadset:Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.HEADSET_PLUG"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 375
    new-instance v2, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;

    invoke-direct {v2, p0, v5}, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;-><init>(Lcom/mediatek/FMRadio/FMRadioEMActivity;Lcom/mediatek/FMRadio/FMRadioEMActivity$1;)V

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mHeadsetConnectionReceiver:Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;

    .line 376
    const-string v2, "FmRx/EM"

    const-string v3, "Register HeadsetConnectionReceiver"

    invoke-static {v2, v3}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 377
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mHeadsetConnectionReceiver:Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;

    invoke-virtual {p0, v2, v1}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 380
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/mediatek/FMRadio/FMRadioStation;->getCurrentStation(Landroid/content/Context;)I

    move-result v2

    iput v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mCurrentStation:I

    .line 381
    const-string v2, "audio"

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/AudioManager;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mAudioManager:Landroid/media/AudioManager;

    .line 382
    iget-boolean v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsPlaying:Z

    invoke-direct {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->refreshTextStatus(Z)V

    .line 383
    const-string v2, "FmRx/EM"

    const-string v3, "end FMRadioEMActivity.onCreate"

    invoke-static {v2, v3}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 386
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMinfo:Landroid/widget/Button;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setClickable(Z)V

    .line 387
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMinfo:Landroid/widget/Button;

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v3}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 389
    const v2, 0x7f060014

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 390
    const v2, 0x7f060015

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 392
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMFactoryLayout:Landroid/widget/RelativeLayout;

    const v3, 0x7f060010

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditText:Landroid/widget/EditText;

    .line 393
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMFactoryLayout:Landroid/widget/RelativeLayout;

    const v3, 0x7f060011

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTuneButton:Landroid/widget/Button;

    .line 394
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMinfo:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 395
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditText:Landroid/widget/EditText;

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 396
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTuneButton:Landroid/widget/Button;

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 398
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->AdapterFmStation()V

    .line 402
    return-void
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 709
    const-string v0, "FmRx/EM"

    const-string v1, ">>> FMRadioEMActivity.onDestroy"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 710
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsDestroying:Z

    .line 711
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 712
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mHeadsetConnectionReceiver:Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;

    if-eqz v0, :cond_0

    .line 713
    const-string v0, "FmRx/EM"

    const-string v1, "Unregister headset broadcast receiver."

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 714
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mHeadsetConnectionReceiver:Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 715
    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mHeadsetConnectionReceiver:Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;

    .line 718
    :cond_0
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsPlaying:Z

    if-eqz v0, :cond_1

    .line 719
    const-string v0, "FmRx/EM"

    const-string v1, "FM is Playing. So stop it."

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 721
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->powerDownAsync()V

    .line 722
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsPlaying:Z

    .line 724
    :cond_1
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v0, :cond_2

    .line 725
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMRadioListener:Lcom/mediatek/FMRadio/FMRadioListener;

    invoke-virtual {v0, v1}, Lcom/mediatek/FMRadio/FMRadioService;->unregisterFMRadioListener(Lcom/mediatek/FMRadio/FMRadioListener;)V

    .line 727
    :cond_2
    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    .line 728
    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMRadioListener:Lcom/mediatek/FMRadio/FMRadioListener;

    .line 731
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFactoryTestModeReceiver:Lcom/mediatek/FMRadio/FMRadioEMActivity$FactoryTestModeReceiver;

    if-eqz v0, :cond_3

    .line 732
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFactoryTestModeReceiver:Lcom/mediatek/FMRadio/FMRadioEMActivity$FactoryTestModeReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 733
    iput-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFactoryTestModeReceiver:Lcom/mediatek/FMRadio/FMRadioEMActivity$FactoryTestModeReceiver;

    .line 737
    :cond_3
    const-string v0, "FmRx/EM"

    const-string v1, "<<< FMRadioEMActivity.onDestroy"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 738
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 739
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 3
    .parameter "v"

    .prologue
    .line 465
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.mediatek.FMRadio"

    const-string v2, "com.mediatek.FMRadio.FMRadioActivity"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->startActivity(Landroid/content/Intent;)V

    .line 466
    const/4 v0, 0x0

    return v0
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 689
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 690
    invoke-direct {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->stopTickEventThread()V

    .line 691
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 692
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 679
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 682
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->readTickEvent()V

    .line 683
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .parameter "outState"

    .prologue
    .line 767
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 768
    return-void
.end method

.method protected onStart()V
    .locals 3

    .prologue
    .line 663
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 664
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/FMRadio/FMRadioService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mServiceConnection:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsServiceBinded:Z

    .line 667
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsServiceBinded:Z

    if-nez v0, :cond_0

    .line 668
    const-string v0, "FmRx/EM"

    const-string v1, "Error: Cannot bind FM service"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 669
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->finish()V

    .line 674
    :goto_0
    return-void

    .line 672
    :cond_0
    const-string v0, "FmRx/EM"

    const-string v1, "Bind FM service successfully."

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 696
    const-string v0, "FmRx/EM"

    const-string v1, "start FMRadioActivity.onStop"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 697
    iget-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsServiceBinded:Z

    if-eqz v0, :cond_0

    .line 698
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 699
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsServiceBinded:Z

    .line 701
    :cond_0
    const-string v0, "FmRx/EM"

    const-string v1, "end FMRadioActivity.onStop"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 702
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 703
    return-void
.end method

.method public readCapArray()I
    .locals 1

    .prologue
    .line 911
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v0, :cond_0

    .line 912
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->getCapArray()I

    move-result v0

    .line 914
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public readRdsBler()I
    .locals 1

    .prologue
    .line 973
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v0, :cond_0

    .line 974
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->getRdsBler()I

    move-result v0

    .line 976
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public readRssi()I
    .locals 1

    .prologue
    .line 922
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    if-eqz v0, :cond_0

    .line 923
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->getRssi()I

    move-result v0

    .line 925
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public readTickEvent()V
    .locals 3

    .prologue
    .line 1012
    const/16 v0, 0x3e8

    .line 1014
    .local v0, interval:I
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTickEventThread:Ljava/lang/Thread;

    if-eqz v1, :cond_0

    .line 1054
    :goto_0
    return-void

    .line 1017
    :cond_0
    new-instance v1, Lcom/mediatek/FMRadio/FMRadioEMActivity$6;

    invoke-direct {v1, p0}, Lcom/mediatek/FMRadio/FMRadioEMActivity$6;-><init>(Lcom/mediatek/FMRadio/FMRadioEMActivity;)V

    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTickEventThread:Ljava/lang/Thread;

    .line 1052
    const-string v1, "FmRx/EM"

    const-string v2, "Start tick event Thread."

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1053
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTickEventThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public setStereoMono(Z)V
    .locals 1
    .parameter "isMono"

    .prologue
    .line 949
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v0, p1}, Lcom/mediatek/FMRadio/FMRadioService;->setStereoMono(Z)Z

    .line 950
    return-void
.end method

.method public switchAntenna(I)V
    .locals 1
    .parameter "type"

    .prologue
    .line 964
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v0, p1}, Lcom/mediatek/FMRadio/FMRadioService;->switchAntennaAsync(I)V

    .line 965
    return-void
.end method
