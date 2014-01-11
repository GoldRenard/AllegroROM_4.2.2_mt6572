.class public Lcom/android/settings/ApnSettings;
.super Landroid/preference/PreferenceActivity;
.source "ApnSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/ApnSettings$5;,
        Lcom/android/settings/ApnSettings$RestoreApnProcessHandler;,
        Lcom/android/settings/ApnSettings$RestoreApnUiHandler;
    }
.end annotation


# static fields
.field public static final APN_ID:Ljava/lang/String; = "apn_id"

.field private static final APN_INDEX:I = 0x2

.field public static final APN_TYPE:Ljava/lang/String; = "apn_type"

.field protected static final DEFAULTAPN_URI:Landroid/net/Uri; = null

.field private static final DEFAULTAPN_URI_GEMINI_SIM1:Landroid/net/Uri; = null

.field private static final DEFAULTAPN_URI_GEMINI_SIM2:Landroid/net/Uri; = null

.field private static final DEFAULTAPN_URI_GEMINI_SIM3:Landroid/net/Uri; = null

.field private static final DEFAULTAPN_URI_GEMINI_SIM4:Landroid/net/Uri; = null

.field private static final DIALOG_APN_DISABLED:I = 0x7d0

.field private static final DIALOG_RESTORE_DEFAULTAPN:I = 0x3e9

.field private static final EVENT_RESTORE_DEFAULTAPN_COMPLETE:I = 0x2

.field private static final EVENT_RESTORE_DEFAULTAPN_START:I = 0x1

.field private static final EVENT_SERVICE_STATE_CHANGED:I = 0x5

.field public static final EXTRA_POSITION:Ljava/lang/String; = "position"

.field private static final ID_INDEX:I = 0x0

.field protected static final MENU_NEW:I = 0x1

.field private static final MENU_RESTORE:I = 0x2

.field private static final NAME_INDEX:I = 0x1

.field private static final PREFERAPN_URI:Landroid/net/Uri; = null

.field private static final PREFERAPN_URI_GEMINI_SIM1:Landroid/net/Uri; = null

.field private static final PREFERAPN_URI_GEMINI_SIM2:Landroid/net/Uri; = null

.field private static final PREFERAPN_URI_GEMINI_SIM3:Landroid/net/Uri; = null

.field private static final PREFERAPN_URI_GEMINI_SIM4:Landroid/net/Uri; = null

.field public static final PREFERRED_APN_URI:Ljava/lang/String; = "content://telephony/carriers/preferapn"

.field private static final PREFERRED_APN_URI_GEMINI_SIM1:Ljava/lang/String; = "content://telephony/carriers_sim1/preferapn"

.field private static final PREFERRED_APN_URI_GEMINI_SIM2:Ljava/lang/String; = "content://telephony/carriers_sim2/preferapn"

.field private static final PREFERRED_APN_URI_GEMINI_SIM3:Ljava/lang/String; = "content://telephony/carriers_sim3/preferapn"

.field private static final PREFERRED_APN_URI_GEMINI_SIM4:Ljava/lang/String; = "content://telephony/carriers_sim4/preferapn"

.field public static final RCSE_TYPE:Ljava/lang/String; = "rcse"

.field public static final RESTORE_CARRIERS_URI:Ljava/lang/String; = "content://telephony/carriers/restore"

.field private static final RESTORE_CARRIERS_URI_GEMINI_SIM1:Ljava/lang/String; = "content://telephony/carriers_sim1/restore"

.field private static final RESTORE_CARRIERS_URI_GEMINI_SIM2:Ljava/lang/String; = "content://telephony/carriers_sim2/restore"

.field private static final RESTORE_CARRIERS_URI_GEMINI_SIM3:Ljava/lang/String; = "content://telephony/carriers_sim3/restore"

.field private static final RESTORE_CARRIERS_URI_GEMINI_SIM4:Ljava/lang/String; = "content://telephony/carriers_sim4/restore"

.field public static final SIM_CARD_SINGLE:I = -0x1

.field public static final SIM_CARD_UNDEFINED:I = -0x1

.field private static final SOURCE_TYPE_INDEX:I = 0x4

.field static final TAG:Ljava/lang/String; = "ApnSettings"

.field public static final TETHER_TYPE:Ljava/lang/String; = "tethering"

.field private static final TRANSACTION_START:Ljava/lang/String; = "com.android.mms.transaction.START"

.field private static final TRANSACTION_STOP:Ljava/lang/String; = "com.android.mms.transaction.STOP"

.field private static final TYPES_INDEX:I = 0x3

.field private static sNotInMmsTransation:Z


# instance fields
.field protected mAirplaneModeEnabled:Z

.field protected mDefaultApnUri:Landroid/net/Uri;

.field private mDualSimMode:I

.field private mExt:Lcom/mediatek/settings/ext/ISettingsMiscExt;

.field private mIMSI:Ljava/lang/String;

.field protected mIsCallStateIdle:Z

.field private mIsTetehred:Z

.field protected mIsTetherApn:Z

.field private mListener:Lcom/mediatek/settings/ext/IRcseOnlyApnExtension$OnRcseOnlyApnStateChangedListener;

.field private mMobileStateFilter:Landroid/content/IntentFilter;

.field private final mMobileStateReceiver:Landroid/content/BroadcastReceiver;

.field protected mNumeric:Ljava/lang/String;

.field private mPhoneStateListener:Landroid/telephony/PhoneStateListener;

.field private mPnn:Ljava/lang/String;

.field private mRcseExt:Lcom/mediatek/settings/ext/IRcseOnlyApnExtension;

.field private mReceiver:Landroid/content/BroadcastReceiver;

.field private mRestoreApnProcessHandler:Lcom/android/settings/ApnSettings$RestoreApnProcessHandler;

.field private mRestoreApnUiHandler:Lcom/android/settings/ApnSettings$RestoreApnUiHandler;

.field protected mRestoreCarrierUri:Landroid/net/Uri;

.field protected mRestoreDefaultApnMode:Z

.field private mRestoreDefaultApnThread:Landroid/os/HandlerThread;

.field protected mSelectableApnCount:I

.field protected mSelectedKey:Ljava/lang/String;

.field protected mSimId:I

.field private mSpn:Ljava/lang/String;

.field protected mTelephonyManager:Landroid/telephony/TelephonyManager;

.field protected mUri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 112
    const-string v0, "content://telephony/carriers/restore"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/settings/ApnSettings;->DEFAULTAPN_URI:Landroid/net/Uri;

    .line 113
    const-string v0, "content://telephony/carriers/preferapn"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/settings/ApnSettings;->PREFERAPN_URI:Landroid/net/Uri;

    .line 116
    const-string v0, "content://telephony/carriers_sim1/restore"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/settings/ApnSettings;->DEFAULTAPN_URI_GEMINI_SIM1:Landroid/net/Uri;

    .line 117
    const-string v0, "content://telephony/carriers_sim2/restore"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/settings/ApnSettings;->DEFAULTAPN_URI_GEMINI_SIM2:Landroid/net/Uri;

    .line 119
    const-string v0, "content://telephony/carriers_sim1/preferapn"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/settings/ApnSettings;->PREFERAPN_URI_GEMINI_SIM1:Landroid/net/Uri;

    .line 120
    const-string v0, "content://telephony/carriers_sim2/preferapn"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/settings/ApnSettings;->PREFERAPN_URI_GEMINI_SIM2:Landroid/net/Uri;

    .line 122
    const-string v0, "content://telephony/carriers_sim3/restore"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/settings/ApnSettings;->DEFAULTAPN_URI_GEMINI_SIM3:Landroid/net/Uri;

    .line 123
    const-string v0, "content://telephony/carriers_sim4/restore"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/settings/ApnSettings;->DEFAULTAPN_URI_GEMINI_SIM4:Landroid/net/Uri;

    .line 124
    const-string v0, "content://telephony/carriers_sim3/preferapn"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/settings/ApnSettings;->PREFERAPN_URI_GEMINI_SIM3:Landroid/net/Uri;

    .line 125
    const-string v0, "content://telephony/carriers_sim4/preferapn"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/settings/ApnSettings;->PREFERAPN_URI_GEMINI_SIM4:Landroid/net/Uri;

    .line 144
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/settings/ApnSettings;->sNotInMmsTransation:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 70
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 130
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/settings/ApnSettings;->mIsCallStateIdle:Z

    .line 131
    iput-boolean v1, p0, Lcom/android/settings/ApnSettings;->mAirplaneModeEnabled:Z

    .line 132
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/settings/ApnSettings;->mDualSimMode:I

    .line 134
    iput v1, p0, Lcom/android/settings/ApnSettings;->mSelectableApnCount:I

    .line 137
    const-string v0, ""

    iput-object v0, p0, Lcom/android/settings/ApnSettings;->mSpn:Ljava/lang/String;

    .line 138
    const-string v0, ""

    iput-object v0, p0, Lcom/android/settings/ApnSettings;->mIMSI:Ljava/lang/String;

    .line 139
    const-string v0, ""

    iput-object v0, p0, Lcom/android/settings/ApnSettings;->mPnn:Ljava/lang/String;

    .line 164
    iput-boolean v1, p0, Lcom/android/settings/ApnSettings;->mIsTetherApn:Z

    .line 165
    iput-boolean v1, p0, Lcom/android/settings/ApnSettings;->mIsTetehred:Z

    .line 169
    new-instance v0, Lcom/android/settings/ApnSettings$1;

    invoke-direct {v0, p0}, Lcom/android/settings/ApnSettings$1;-><init>(Lcom/android/settings/ApnSettings;)V

    iput-object v0, p0, Lcom/android/settings/ApnSettings;->mListener:Lcom/mediatek/settings/ext/IRcseOnlyApnExtension$OnRcseOnlyApnStateChangedListener;

    .line 177
    new-instance v0, Lcom/android/settings/ApnSettings$2;

    invoke-direct {v0, p0}, Lcom/android/settings/ApnSettings$2;-><init>(Lcom/android/settings/ApnSettings;)V

    iput-object v0, p0, Lcom/android/settings/ApnSettings;->mMobileStateReceiver:Landroid/content/BroadcastReceiver;

    .line 253
    new-instance v0, Lcom/android/settings/ApnSettings$3;

    invoke-direct {v0, p0}, Lcom/android/settings/ApnSettings$3;-><init>(Lcom/android/settings/ApnSettings;)V

    iput-object v0, p0, Lcom/android/settings/ApnSettings;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    .line 795
    return-void
.end method

.method static synthetic access$000(Lcom/android/settings/ApnSettings;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lcom/android/settings/ApnSettings;->fillList(I)V

    return-void
.end method

.method static synthetic access$100(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    invoke-static {p0}, Lcom/android/settings/ApnSettings;->getMobileDataState(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1002(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 70
    sput-boolean p0, Lcom/android/settings/ApnSettings;->sNotInMmsTransation:Z

    return p0
.end method

.method static synthetic access$200(Lcom/android/settings/ApnSettings;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget v0, p0, Lcom/android/settings/ApnSettings;->mDualSimMode:I

    return v0
.end method

.method static synthetic access$202(Lcom/android/settings/ApnSettings;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 70
    iput p1, p0, Lcom/android/settings/ApnSettings;->mDualSimMode:I

    return p1
.end method

.method static synthetic access$300(Lcom/android/settings/ApnSettings;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mSpn:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/settings/ApnSettings;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mIMSI:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/settings/ApnSettings;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mPnn:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/settings/ApnSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/android/settings/ApnSettings;->initSimState()V

    return-void
.end method

.method static synthetic access$700(Lcom/android/settings/ApnSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/android/settings/ApnSettings;->setSpn()V

    return-void
.end method

.method static synthetic access$800(Lcom/android/settings/ApnSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/android/settings/ApnSettings;->setIMSI()V

    return-void
.end method

.method static synthetic access$900(Lcom/android/settings/ApnSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/android/settings/ApnSettings;->setPnn()V

    return-void
.end method

.method private fillList(I)V
    .locals 25
    .parameter "simId"

    .prologue
    .line 553
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings/ApnSettings;->getFillListQuery()Ljava/lang/String;

    move-result-object v5

    .line 554
    .local v5, where:Ljava/lang/String;
    const-string v2, "ApnSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "fillList where: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 556
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/settings/ApnSettings;->mUri:Landroid/net/Uri;

    if-nez v2, :cond_0

    .line 557
    const-string v2, "ApnSettings"

    const-string v3, "fillList, mUri null !"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 558
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings/ApnSettings;->finish()V

    .line 662
    :goto_0
    return-void

    .line 561
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings/ApnSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings/ApnSettings;->mUri:Landroid/net/Uri;

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "_id"

    aput-object v7, v4, v6

    const/4 v6, 0x1

    const-string v7, "name"

    aput-object v7, v4, v6

    const/4 v6, 0x2

    const-string v7, "apn"

    aput-object v7, v4, v6

    const/4 v6, 0x3

    const-string v7, "type"

    aput-object v7, v4, v6

    const/4 v6, 0x4

    const-string v7, "sourcetype"

    aput-object v7, v4, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 564
    .local v11, cursor:Landroid/database/Cursor;
    const-string v2, "apn_list"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/settings/ApnSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v9

    check-cast v9, Landroid/preference/PreferenceGroup;

    .line 565
    .local v9, apnList:Landroid/preference/PreferenceGroup;
    invoke-virtual {v9}, Landroid/preference/PreferenceGroup;->removeAll()V

    .line 567
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 569
    .local v17, mmsApnList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/preference/Preference;>;"
    const/16 v16, 0x0

    .line 571
    .local v16, keySetChecked:Z
    invoke-direct/range {p0 .. p0}, Lcom/android/settings/ApnSettings;->getSelectedApnKey()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/settings/ApnSettings;->mSelectedKey:Ljava/lang/String;

    .line 572
    const-string v2, "ApnSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "fillList : mSelectedKey = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/settings/ApnSettings;->mSelectedKey:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 574
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    .line 576
    :goto_1
    invoke-interface {v11}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v2

    if-nez v2, :cond_b

    .line 577
    const/4 v2, 0x3

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v24

    .line 579
    .local v24, type:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/settings/ApnSettings;->mIsTetherApn:Z

    if-eqz v2, :cond_1

    const-string v2, "tethering"

    move-object/from16 v0, v24

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 580
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_1

    .line 584
    :cond_1
    const/4 v2, 0x1

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    .line 585
    .local v18, name:Ljava/lang/String;
    const/4 v2, 0x2

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 586
    .local v8, apn:Ljava/lang/String;
    const/4 v2, 0x0

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 588
    .local v15, key:Ljava/lang/String;
    const/4 v2, 0x4

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v23

    .line 590
    .local v23, sourcetype:I
    const-string v2, "cmmail"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    if-nez v23, :cond_2

    .line 591
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_1

    .line 594
    :cond_2
    const-string v2, "rcse"

    move-object/from16 v0, v24

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/settings/ApnSettings;->mRcseExt:Lcom/mediatek/settings/ext/IRcseOnlyApnExtension;

    if-eqz v2, :cond_4

    .line 595
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/settings/ApnSettings;->mRcseExt:Lcom/mediatek/settings/ext/IRcseOnlyApnExtension;

    invoke-interface {v2}, Lcom/mediatek/settings/ext/IRcseOnlyApnExtension;->isRcseOnlyApnEnabled()Z

    move-result v2

    if-nez v2, :cond_3

    .line 596
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    .line 597
    const-string v2, "ApnSettings"

    const-string v3, "Vodafone not matched"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 600
    :cond_3
    const-string v2, "ApnSettings"

    const-string v3, "Vodafone matched"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 604
    :cond_4
    new-instance v19, Lcom/android/settings/ApnPreference;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/settings/ApnPreference;-><init>(Landroid/content/Context;)V

    .line 606
    .local v19, pref:Lcom/android/settings/ApnPreference;
    move-object/from16 v0, v19

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/android/settings/ApnPreference;->setSimId(I)V

    .line 607
    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Lcom/android/settings/ApnPreference;->setKey(Ljava/lang/String;)V

    .line 608
    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/settings/ApnPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 609
    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Lcom/android/settings/ApnPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 610
    const/4 v2, 0x0

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Lcom/android/settings/ApnPreference;->setPersistent(Z)V

    .line 611
    move-object/from16 v0, v19

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/android/settings/ApnPreference;->setSourceType(I)V

    .line 612
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/android/settings/ApnPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 614
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/settings/ApnSettings;->mExt:Lcom/mediatek/settings/ext/ISettingsMiscExt;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/settings/ApnSettings;->mNumeric:Ljava/lang/String;

    move-object/from16 v0, v24

    invoke-interface {v2, v0, v8, v3}, Lcom/mediatek/settings/ext/ISettingsMiscExt;->isAllowEditPresetApn(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v14

    .line 615
    .local v14, isEditable:Z
    if-nez v23, :cond_5

    if-eqz v14, :cond_7

    :cond_5
    const/4 v2, 0x1

    :goto_2
    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Lcom/android/settings/ApnPreference;->setApnEditable(Z)V

    .line 618
    const/16 v21, 0x1

    .line 619
    .local v21, selectable:Z
    const-string v2, "tethering"

    move-object/from16 v0, v24

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 620
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/settings/ApnSettings;->mIsTetherApn:Z

    move/from16 v21, v0

    .line 624
    :goto_3
    move-object/from16 v0, v19

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/android/settings/ApnPreference;->setSelectable(Z)V

    .line 626
    if-eqz v21, :cond_a

    .line 627
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/settings/ApnSettings;->mSelectedKey:Ljava/lang/String;

    if-eqz v2, :cond_6

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/settings/ApnSettings;->mSelectedKey:Ljava/lang/String;

    invoke-virtual {v2, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 628
    invoke-virtual/range {v19 .. v19}, Lcom/android/settings/ApnPreference;->setChecked()V

    .line 629
    const/16 v16, 0x1

    .line 630
    const-string v2, "ApnSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "apn key: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " set."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 632
    :cond_6
    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 633
    const-string v2, "ApnSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "key:  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " added!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 637
    :goto_4
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    goto/16 :goto_1

    .line 615
    .end local v21           #selectable:Z
    :cond_7
    const/4 v2, 0x0

    goto :goto_2

    .line 622
    .restart local v21       #selectable:Z
    :cond_8
    const-string v2, "mms"

    move-object/from16 v0, v24

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    const/16 v21, 0x1

    :goto_5
    goto :goto_3

    :cond_9
    const/16 v21, 0x0

    goto :goto_5

    .line 635
    :cond_a
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 639
    .end local v8           #apn:Ljava/lang/String;
    .end local v14           #isEditable:Z
    .end local v15           #key:Ljava/lang/String;
    .end local v18           #name:Ljava/lang/String;
    .end local v19           #pref:Lcom/android/settings/ApnPreference;
    .end local v21           #selectable:Z
    .end local v23           #sourcetype:I
    .end local v24           #type:Ljava/lang/String;
    :cond_b
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 641
    invoke-virtual {v9}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/android/settings/ApnSettings;->mSelectableApnCount:I

    .line 643
    if-nez v16, :cond_d

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/settings/ApnSettings;->mSelectableApnCount:I

    if-lez v2, :cond_d

    .line 644
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/settings/ApnSettings;->mSelectableApnCount:I

    new-array v0, v2, [I

    move-object/from16 v22, v0

    .line 645
    .local v22, sourceTypeArray:[I
    const/4 v12, 0x0

    .local v12, i:I
    :goto_6
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/settings/ApnSettings;->mSelectableApnCount:I

    if-ge v12, v2, :cond_c

    .line 646
    invoke-virtual {v9, v12}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Lcom/android/settings/ApnPreference;

    invoke-virtual {v2}, Lcom/android/settings/ApnPreference;->getSourceType()I

    move-result v2

    aput v2, v22, v12

    .line 645
    add-int/lit8 v12, v12, 0x1

    goto :goto_6

    .line 648
    :cond_c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/settings/ApnSettings;->mExt:Lcom/mediatek/settings/ext/ISettingsMiscExt;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/settings/ApnSettings;->mSelectableApnCount:I

    move-object/from16 v0, v22

    invoke-interface {v2, v9, v3, v0}, Lcom/mediatek/settings/ext/ISettingsMiscExt;->getApnPref(Landroid/preference/PreferenceGroup;I[I)Landroid/preference/Preference;

    move-result-object v10

    check-cast v10, Lcom/android/settings/ApnPreference;

    .line 649
    .local v10, apnPref:Lcom/android/settings/ApnPreference;
    if-eqz v10, :cond_d

    .line 650
    invoke-virtual {v10}, Lcom/android/settings/ApnPreference;->getKey()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/settings/ApnSettings;->setSelectedApnKey(Ljava/lang/String;)V

    .line 651
    invoke-virtual {v10}, Lcom/android/settings/ApnPreference;->setChecked()V

    .line 652
    const-string v2, "ApnSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Key does not match.Set key: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v10}, Lcom/android/settings/ApnPreference;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 656
    .end local v10           #apnPref:Lcom/android/settings/ApnPreference;
    .end local v12           #i:I
    .end local v22           #sourceTypeArray:[I
    :cond_d
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/settings/ApnSettings;->mIsTetherApn:Z

    if-nez v2, :cond_e

    .line 657
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, i$:Ljava/util/Iterator;
    :goto_7
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Landroid/preference/Preference;

    .line 658
    .local v20, preference:Landroid/preference/Preference;
    move-object/from16 v0, v20

    invoke-virtual {v9, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_7

    .line 661
    .end local v13           #i$:Ljava/util/Iterator;
    .end local v20           #preference:Landroid/preference/Preference;
    :cond_e
    invoke-virtual/range {p0 .. p0}, Lcom/android/settings/ApnSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Lcom/android/settings/ApnSettings;->getScreenEnableState()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    goto/16 :goto_0
.end method

.method private static getMobileDataState(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;
    .locals 2
    .parameter "intent"

    .prologue
    .line 264
    const-string v1, "state"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 265
    .local v0, str:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 266
    const-class v1, Lcom/android/internal/telephony/PhoneConstants$DataState;

    invoke-static {v1, v0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/PhoneConstants$DataState;

    .line 268
    :goto_0
    return-object v1

    :cond_0
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$DataState;->DISCONNECTED:Lcom/android/internal/telephony/PhoneConstants$DataState;

    goto :goto_0
.end method

.method private getSelectedApnKey()Ljava/lang/String;
    .locals 9

    .prologue
    const/4 v3, 0x0

    const/4 v8, 0x0

    .line 739
    const/4 v7, 0x0

    .line 741
    .local v7, key:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/android/settings/ApnSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/android/settings/ApnSettings;->mRestoreCarrierUri:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v4, "_id"

    aput-object v4, v2, v8

    const-string v5, "name ASC"

    move-object v4, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 743
    .local v6, cursor:Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 744
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 745
    invoke-interface {v6, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 747
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 748
    return-object v7
.end method

.method private initSimState()V
    .locals 6

    .prologue
    .line 332
    invoke-virtual {p0}, Lcom/android/settings/ApnSettings;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 333
    .local v1, it:Landroid/content/Intent;
    const-string v3, "simId"

    const/4 v4, -0x1

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/android/settings/ApnSettings;->mSimId:I

    .line 334
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMCount(Landroid/content/Context;)I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_0

    .line 335
    iget v3, p0, Lcom/android/settings/ApnSettings;->mSimId:I

    invoke-static {p0, v3}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v2

    .line 336
    .local v2, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v2, :cond_0

    .line 337
    iget-object v3, v2, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {p0, v3}, Lcom/android/settings/ApnSettings;->setTitle(Ljava/lang/CharSequence;)V

    .line 340
    .end local v2           #siminfo:Landroid/provider/Telephony$SIMInfo;
    :cond_0
    const-string v3, "ApnSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "GEMINI_SIM_ID_KEY = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/settings/ApnSettings;->mSimId:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 345
    iget v3, p0, Lcom/android/settings/ApnSettings;->mSimId:I

    packed-switch v3, :pswitch_data_0

    .line 378
    const-string v3, "ApnSettings"

    const-string v4, "Incorrect sim id "

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 380
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 381
    .local v0, intent:Landroid/content/Intent;
    const-string v3, "com.android.phone"

    const-string v4, "com.mediatek.settings.MultipleSimActivity"

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 382
    const-string v3, "TARGET_CLASS"

    const-string v4, "com.android.settings.ApnSettings"

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 383
    invoke-virtual {p0, v0}, Lcom/android/settings/ApnSettings;->startActivity(Landroid/content/Intent;)V

    .line 385
    invoke-virtual {p0}, Lcom/android/settings/ApnSettings;->finish()V

    .line 389
    .end local v0           #intent:Landroid/content/Intent;
    :goto_0
    const-string v3, "ApnSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mNumeric "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/settings/ApnSettings;->mNumeric:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 390
    const-string v3, "ApnSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mUri = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/settings/ApnSettings;->mUri:Landroid/net/Uri;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    return-void

    .line 347
    :pswitch_0
    sget-object v3, Landroid/provider/Telephony$Carriers;->CONTENT_URI:Landroid/net/Uri;

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mUri:Landroid/net/Uri;

    .line 348
    const-string v3, "gsm.sim.operator.numeric"

    const-string v4, "-1"

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mNumeric:Ljava/lang/String;

    .line 349
    sget-object v3, Lcom/android/settings/ApnSettings;->DEFAULTAPN_URI:Landroid/net/Uri;

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mDefaultApnUri:Landroid/net/Uri;

    .line 350
    sget-object v3, Lcom/android/settings/ApnSettings;->PREFERAPN_URI:Landroid/net/Uri;

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mRestoreCarrierUri:Landroid/net/Uri;

    goto :goto_0

    .line 353
    :pswitch_1
    sget-object v3, Landroid/provider/Telephony$Carriers$SIM1Carriers;->CONTENT_URI:Landroid/net/Uri;

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mUri:Landroid/net/Uri;

    .line 354
    const-string v3, "gsm.sim.operator.numeric"

    const-string v4, "-1"

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mNumeric:Ljava/lang/String;

    .line 355
    sget-object v3, Lcom/android/settings/ApnSettings;->DEFAULTAPN_URI_GEMINI_SIM1:Landroid/net/Uri;

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mDefaultApnUri:Landroid/net/Uri;

    .line 356
    sget-object v3, Lcom/android/settings/ApnSettings;->PREFERAPN_URI_GEMINI_SIM1:Landroid/net/Uri;

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mRestoreCarrierUri:Landroid/net/Uri;

    goto :goto_0

    .line 359
    :pswitch_2
    sget-object v3, Landroid/provider/Telephony$Carriers$SIM2Carriers;->CONTENT_URI:Landroid/net/Uri;

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mUri:Landroid/net/Uri;

    .line 360
    const-string v3, "gsm.sim.operator.numeric.2"

    const-string v4, "-1"

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mNumeric:Ljava/lang/String;

    .line 361
    sget-object v3, Lcom/android/settings/ApnSettings;->DEFAULTAPN_URI_GEMINI_SIM2:Landroid/net/Uri;

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mDefaultApnUri:Landroid/net/Uri;

    .line 362
    sget-object v3, Lcom/android/settings/ApnSettings;->PREFERAPN_URI_GEMINI_SIM2:Landroid/net/Uri;

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mRestoreCarrierUri:Landroid/net/Uri;

    goto :goto_0

    .line 365
    :pswitch_3
    sget-object v3, Landroid/provider/Telephony$Carriers$SIM3Carriers;->CONTENT_URI:Landroid/net/Uri;

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mUri:Landroid/net/Uri;

    .line 366
    const-string v3, "gsm.sim.operator.numeric.3"

    const-string v4, "-1"

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mNumeric:Ljava/lang/String;

    .line 367
    sget-object v3, Lcom/android/settings/ApnSettings;->DEFAULTAPN_URI_GEMINI_SIM3:Landroid/net/Uri;

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mDefaultApnUri:Landroid/net/Uri;

    .line 368
    sget-object v3, Lcom/android/settings/ApnSettings;->PREFERAPN_URI_GEMINI_SIM3:Landroid/net/Uri;

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mRestoreCarrierUri:Landroid/net/Uri;

    goto/16 :goto_0

    .line 371
    :pswitch_4
    sget-object v3, Landroid/provider/Telephony$Carriers$SIM4Carriers;->CONTENT_URI:Landroid/net/Uri;

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mUri:Landroid/net/Uri;

    .line 372
    const-string v3, "gsm.sim.operator.numeric.4"

    const-string v4, "-1"

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mNumeric:Ljava/lang/String;

    .line 373
    sget-object v3, Lcom/android/settings/ApnSettings;->DEFAULTAPN_URI_GEMINI_SIM4:Landroid/net/Uri;

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mDefaultApnUri:Landroid/net/Uri;

    .line 374
    sget-object v3, Lcom/android/settings/ApnSettings;->PREFERAPN_URI_GEMINI_SIM4:Landroid/net/Uri;

    iput-object v3, p0, Lcom/android/settings/ApnSettings;->mRestoreCarrierUri:Landroid/net/Uri;

    goto/16 :goto_0

    .line 345
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private isMMSNotTransaction()Z
    .locals 7

    .prologue
    .line 411
    const/4 v1, 0x1

    .line 412
    .local v1, isMMSNotProcess:Z
    const-string v4, "connectivity"

    invoke-virtual {p0, v4}, Lcom/android/settings/ApnSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 413
    .local v0, cm:Landroid/net/ConnectivityManager;
    if-eqz v0, :cond_0

    .line 414
    const/4 v4, 0x2

    invoke-virtual {v0, v4}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v2

    .line 415
    .local v2, networkInfo:Landroid/net/NetworkInfo;
    if-eqz v2, :cond_0

    .line 416
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v3

    .line 417
    .local v3, state:Landroid/net/NetworkInfo$State;
    const-string v4, "ApnSettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mms state = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 418
    sget-object v4, Landroid/net/NetworkInfo$State;->CONNECTING:Landroid/net/NetworkInfo$State;

    if-eq v3, v4, :cond_1

    sget-object v4, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-eq v3, v4, :cond_1

    const/4 v1, 0x1

    .line 422
    .end local v2           #networkInfo:Landroid/net/NetworkInfo;
    .end local v3           #state:Landroid/net/NetworkInfo$State;
    :cond_0
    :goto_0
    return v1

    .line 418
    .restart local v2       #networkInfo:Landroid/net/NetworkInfo;
    .restart local v3       #state:Landroid/net/NetworkInfo$State;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private restoreDefaultApn()Z
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 752
    const-string v0, "ApnSettings"

    const-string v1, "restore Default Apn."

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 753
    const/16 v0, 0x3e9

    invoke-virtual {p0, v0}, Lcom/android/settings/ApnSettings;->showDialog(I)V

    .line 754
    iput-boolean v3, p0, Lcom/android/settings/ApnSettings;->mRestoreDefaultApnMode:Z

    .line 756
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mRestoreApnUiHandler:Lcom/android/settings/ApnSettings$RestoreApnUiHandler;

    if-nez v0, :cond_0

    .line 757
    new-instance v0, Lcom/android/settings/ApnSettings$RestoreApnUiHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/settings/ApnSettings$RestoreApnUiHandler;-><init>(Lcom/android/settings/ApnSettings;Lcom/android/settings/ApnSettings$1;)V

    iput-object v0, p0, Lcom/android/settings/ApnSettings;->mRestoreApnUiHandler:Lcom/android/settings/ApnSettings$RestoreApnUiHandler;

    .line 760
    :cond_0
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mRestoreApnProcessHandler:Lcom/android/settings/ApnSettings$RestoreApnProcessHandler;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    if-nez v0, :cond_2

    .line 762
    :cond_1
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "Restore default APN Handler: Process Thread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/settings/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    .line 764
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 765
    new-instance v0, Lcom/android/settings/ApnSettings$RestoreApnProcessHandler;

    iget-object v1, p0, Lcom/android/settings/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    iget-object v2, p0, Lcom/android/settings/ApnSettings;->mRestoreApnUiHandler:Lcom/android/settings/ApnSettings$RestoreApnUiHandler;

    invoke-direct {v0, p0, v1, v2}, Lcom/android/settings/ApnSettings$RestoreApnProcessHandler;-><init>(Lcom/android/settings/ApnSettings;Landroid/os/Looper;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/settings/ApnSettings;->mRestoreApnProcessHandler:Lcom/android/settings/ApnSettings$RestoreApnProcessHandler;

    .line 769
    :cond_2
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mRestoreApnProcessHandler:Lcom/android/settings/ApnSettings$RestoreApnProcessHandler;

    invoke-virtual {v0, v3}, Lcom/android/settings/ApnSettings$RestoreApnProcessHandler;->sendEmptyMessage(I)Z

    .line 771
    return v3
.end method

.method private setIMSI()V
    .locals 5

    .prologue
    .line 530
    :try_start_0
    const-string v2, "phone"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v1

    .line 532
    .local v1, telephony:Lcom/android/internal/telephony/ITelephony;
    iget v2, p0, Lcom/android/settings/ApnSettings;->mSimId:I

    invoke-interface {v1, v2}, Lcom/android/internal/telephony/ITelephony;->isOperatorMvnoForImsiGemini(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/settings/ApnSettings;->mIMSI:Ljava/lang/String;

    .line 536
    const-string v2, "ApnSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "IMSI = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/settings/ApnSettings;->mIMSI:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 540
    .end local v1           #telephony:Lcom/android/internal/telephony/ITelephony;
    :goto_0
    const-string v2, "ApnSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "IMSI = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/settings/ApnSettings;->mIMSI:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 541
    return-void

    .line 537
    :catch_0
    move-exception v0

    .line 538
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "ApnSettings"

    const-string v3, "RemoteException"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private setPnn()V
    .locals 3

    .prologue
    .line 545
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget v1, p0, Lcom/android/settings/ApnSettings;->mSimId:I

    invoke-virtual {v0, v1}, Landroid/telephony/TelephonyManager;->isOperatorMvnoForEfPnnGemini(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/ApnSettings;->mPnn:Ljava/lang/String;

    .line 549
    const-string v0, "ApnSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Pnn = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/settings/ApnSettings;->mPnn:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 550
    return-void
.end method

.method private setSpn()V
    .locals 5

    .prologue
    .line 516
    :try_start_0
    const-string v2, "phone"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v1

    .line 518
    .local v1, telephony:Lcom/android/internal/telephony/ITelephony;
    iget v2, p0, Lcom/android/settings/ApnSettings;->mSimId:I

    invoke-interface {v1, v2}, Lcom/android/internal/telephony/ITelephony;->getSpNameInEfSpnGemini(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/settings/ApnSettings;->mSpn:Ljava/lang/String;

    .line 522
    const-string v2, "ApnSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "spn = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/settings/ApnSettings;->mSpn:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 526
    .end local v1           #telephony:Lcom/android/internal/telephony/ITelephony;
    :goto_0
    return-void

    .line 523
    :catch_0
    move-exception v0

    .line 524
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "ApnSettings"

    const-string v3, "RemoteException"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method protected addMenu(Landroid/view/Menu;)V
    .locals 4
    .parameter "menu"

    .prologue
    const/4 v3, 0x0

    .line 674
    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/android/settings/ApnSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0b05a8

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v3, v0, v3, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080033

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 677
    const/4 v0, 0x2

    invoke-virtual {p0}, Lcom/android/settings/ApnSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0b05b1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v3, v0, v3, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080055

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 680
    return-void
.end method

.method protected addNewApn()V
    .locals 3

    .prologue
    .line 712
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.INSERT"

    iget-object v2, p0, Lcom/android/settings/ApnSettings;->mUri:Landroid/net/Uri;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 713
    .local v0, it:Landroid/content/Intent;
    const-string v1, "simId"

    iget v2, p0, Lcom/android/settings/ApnSettings;->mSimId:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 714
    invoke-virtual {p0, v0}, Lcom/android/settings/ApnSettings;->startActivity(Landroid/content/Intent;)V

    .line 715
    return-void
.end method

.method protected getBroadcastReceiver()Landroid/content/BroadcastReceiver;
    .locals 1

    .prologue
    .line 327
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mMobileStateReceiver:Landroid/content/BroadcastReceiver;

    return-object v0
.end method

.method protected getFillListQuery()Ljava/lang/String;
    .locals 11

    .prologue
    .line 449
    const/4 v4, 0x0

    .line 451
    .local v4, isMVNO:Z
    :try_start_0
    const-string v8, "phone"

    invoke-static {v8}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v8

    invoke-static {v8}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v7

    .line 454
    .local v7, telephony:Lcom/android/internal/telephony/ITelephony;
    iget v8, p0, Lcom/android/settings/ApnSettings;->mSimId:I

    invoke-interface {v7, v8}, Lcom/android/internal/telephony/ITelephony;->isIccCardProviderAsMvnoGemini(I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 462
    .end local v7           #telephony:Lcom/android/internal/telephony/ITelephony;
    :goto_0
    const/4 v1, 0x0

    .line 463
    .local v1, flagImsi:Z
    const/4 v3, 0x0

    .line 464
    .local v3, flagSpn:Z
    const/4 v2, 0x0

    .line 465
    .local v2, flagPnn:Z
    const-string v6, ""

    .line 467
    .local v6, sqlStr:Ljava/lang/String;
    const-string v8, "ApnSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "[isMVNO ="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "]"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 469
    if-eqz v4, :cond_6

    .line 470
    iget-object v8, p0, Lcom/android/settings/ApnSettings;->mIMSI:Ljava/lang/String;

    if-eqz v8, :cond_0

    iget-object v8, p0, Lcom/android/settings/ApnSettings;->mIMSI:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    .line 471
    const/4 v1, 0x1

    .line 472
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " imsi=\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/settings/ApnSettings;->mIMSI:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 474
    :cond_0
    iget-object v8, p0, Lcom/android/settings/ApnSettings;->mSpn:Ljava/lang/String;

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/android/settings/ApnSettings;->mSpn:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_1

    .line 475
    const/4 v3, 0x1

    .line 476
    if-eqz v1, :cond_4

    .line 477
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " or spn=\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/settings/ApnSettings;->mSpn:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 483
    :cond_1
    :goto_1
    iget-object v8, p0, Lcom/android/settings/ApnSettings;->mPnn:Ljava/lang/String;

    if-eqz v8, :cond_3

    iget-object v8, p0, Lcom/android/settings/ApnSettings;->mPnn:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_3

    .line 484
    const/4 v2, 0x1

    .line 485
    if-nez v1, :cond_2

    if-eqz v3, :cond_5

    .line 486
    :cond_2
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " or pnn=\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/settings/ApnSettings;->mPnn:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 496
    :cond_3
    :goto_2
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "numeric=\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/settings/ApnSettings;->mNumeric:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\" and ( "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 497
    .local v5, result:Ljava/lang/String;
    const-string v8, "ApnSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getFillListQuery result: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 498
    return-object v5

    .line 459
    .end local v1           #flagImsi:Z
    .end local v2           #flagPnn:Z
    .end local v3           #flagSpn:Z
    .end local v5           #result:Ljava/lang/String;
    .end local v6           #sqlStr:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 460
    .local v0, e:Landroid/os/RemoteException;
    const-string v8, "ApnSettings"

    const-string v9, "RemoteException"

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 479
    .end local v0           #e:Landroid/os/RemoteException;
    .restart local v1       #flagImsi:Z
    .restart local v2       #flagPnn:Z
    .restart local v3       #flagSpn:Z
    .restart local v6       #sqlStr:Ljava/lang/String;
    :cond_4
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " spn=\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/settings/ApnSettings;->mSpn:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 488
    :cond_5
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " pnn=\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/settings/ApnSettings;->mPnn:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_2

    .line 493
    :cond_6
    const-string v6, "(spn is NULL or spn=\"\") and (imsi is NULL or imsi=\"\") and (pnn is NULL or pnn=\"\") "

    goto/16 :goto_2
.end method

.method protected getIntentFilter()Landroid/content/IntentFilter;
    .locals 2

    .prologue
    .line 309
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.ANY_DATA_STATE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 312
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 313
    const-string v1, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 314
    const-string v1, "com.android.mms.transaction.START"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 315
    const-string v1, "com.android.mms.transaction.STOP"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 317
    const-string v1, "android.intent.action.DUAL_SIM_MODE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 320
    const-string v1, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 322
    return-object v0
.end method

.method protected getScreenEnableState()Z
    .locals 6

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 504
    const/4 v0, 0x1

    .line 506
    .local v0, simReady:Z
    const/4 v3, 0x5

    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v4

    iget v5, p0, Lcom/android/settings/ApnSettings;->mSimId:I

    invoke-virtual {v4, v5}, Landroid/telephony/TelephonyManager;->getSimStateGemini(I)I

    move-result v4

    if-ne v3, v4, :cond_0

    move v0, v1

    .line 510
    :goto_0
    iget-object v3, p0, Lcom/android/settings/ApnSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v3}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v3

    if-nez v3, :cond_1

    move v3, v1

    :goto_1
    iput-boolean v3, p0, Lcom/android/settings/ApnSettings;->mIsCallStateIdle:Z

    .line 511
    sget-boolean v3, Lcom/android/settings/ApnSettings;->sNotInMmsTransation:Z

    if-eqz v3, :cond_2

    iget-boolean v3, p0, Lcom/android/settings/ApnSettings;->mIsCallStateIdle:Z

    if-eqz v3, :cond_2

    iget-boolean v3, p0, Lcom/android/settings/ApnSettings;->mAirplaneModeEnabled:Z

    if-nez v3, :cond_2

    if-eqz v0, :cond_2

    :goto_2
    return v1

    :cond_0
    move v0, v2

    .line 506
    goto :goto_0

    :cond_1
    move v3, v2

    .line 510
    goto :goto_1

    :cond_2
    move v1, v2

    .line 511
    goto :goto_2
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "icicle"

    .prologue
    const/4 v2, 0x1

    .line 274
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 276
    const v0, 0x7f050006

    invoke-virtual {p0, v0}, Lcom/android/settings/ApnSettings;->addPreferencesFromResource(I)V

    .line 277
    invoke-virtual {p0}, Lcom/android/settings/ApnSettings;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    .line 279
    invoke-static {p0}, Lcom/android/settings/Utils;->getMiscPlugin(Landroid/content/Context;)Lcom/mediatek/settings/ext/ISettingsMiscExt;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/ApnSettings;->mExt:Lcom/mediatek/settings/ext/ISettingsMiscExt;

    .line 280
    invoke-static {p0}, Lcom/android/settings/Utils;->getRcseApnPlugin(Landroid/content/Context;)Lcom/mediatek/settings/ext/IRcseOnlyApnExtension;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/ApnSettings;->mRcseExt:Lcom/mediatek/settings/ext/IRcseOnlyApnExtension;

    .line 281
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mRcseExt:Lcom/mediatek/settings/ext/IRcseOnlyApnExtension;

    if-eqz v0, :cond_0

    .line 282
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mRcseExt:Lcom/mediatek/settings/ext/IRcseOnlyApnExtension;

    iget-object v1, p0, Lcom/android/settings/ApnSettings;->mListener:Lcom/mediatek/settings/ext/IRcseOnlyApnExtension$OnRcseOnlyApnStateChangedListener;

    invoke-interface {v0, v1}, Lcom/mediatek/settings/ext/IRcseOnlyApnExtension;->addRcseOnlyApnStateChanged(Lcom/mediatek/settings/ext/IRcseOnlyApnExtension$OnRcseOnlyApnStateChangedListener;)V

    .line 286
    :goto_0
    invoke-direct {p0}, Lcom/android/settings/ApnSettings;->initSimState()V

    .line 288
    invoke-virtual {p0}, Lcom/android/settings/ApnSettings;->getIntentFilter()Landroid/content/IntentFilter;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/ApnSettings;->mMobileStateFilter:Landroid/content/IntentFilter;

    .line 289
    invoke-virtual {p0}, Lcom/android/settings/ApnSettings;->getBroadcastReceiver()Landroid/content/BroadcastReceiver;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/ApnSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 290
    const-string v0, "phone"

    invoke-virtual {p0, v0}, Lcom/android/settings/ApnSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/android/settings/ApnSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 291
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/android/settings/ApnSettings;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 293
    invoke-direct {p0}, Lcom/android/settings/ApnSettings;->setSpn()V

    .line 294
    invoke-direct {p0}, Lcom/android/settings/ApnSettings;->setIMSI()V

    .line 295
    invoke-direct {p0}, Lcom/android/settings/ApnSettings;->setPnn()V

    .line 297
    return-void

    .line 284
    :cond_0
    const-string v0, "ApnSettings"

    const-string v1, "mApnPlugin is null"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 4
    .parameter "id"

    .prologue
    .line 820
    const/16 v1, 0x3e9

    if-ne p1, v1, :cond_0

    .line 821
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 822
    .local v0, dialog:Landroid/app/ProgressDialog;
    invoke-virtual {p0}, Lcom/android/settings/ApnSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0b05b0

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 823
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 837
    .end local v0           #dialog:Landroid/app/ProgressDialog;
    :goto_0
    return-object v0

    .line 826
    :cond_0
    const/16 v1, 0x7d0

    if-ne p1, v1, :cond_1

    .line 827
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0b0092

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0b0093

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x104000a

    new-instance v3, Lcom/android/settings/ApnSettings$4;

    invoke-direct {v3, p0}, Lcom/android/settings/ApnSettings$4;-><init>(Lcom/android/settings/ApnSettings;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto :goto_0

    .line 837
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .parameter "menu"

    .prologue
    .line 666
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 667
    invoke-virtual {p0, p1}, Lcom/android/settings/ApnSettings;->addMenu(Landroid/view/Menu;)V

    .line 668
    const/4 v0, 0x1

    return v0
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    .line 433
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 435
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/android/settings/ApnSettings;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 436
    const-string v0, "ApnSettings"

    const-string v1, "onDestroy set PhoneStateListener.LISTEN_NONE!"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 438
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_0

    .line 439
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mRestoreDefaultApnThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 441
    :cond_0
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mRcseExt:Lcom/mediatek/settings/ext/IRcseOnlyApnExtension;

    if-eqz v0, :cond_1

    .line 442
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mRcseExt:Lcom/mediatek/settings/ext/IRcseOnlyApnExtension;

    iget-object v1, p0, Lcom/android/settings/ApnSettings;->mListener:Lcom/mediatek/settings/ext/IRcseOnlyApnExtension$OnRcseOnlyApnStateChangedListener;

    invoke-interface {v0, v1}, Lcom/mediatek/settings/ext/IRcseOnlyApnExtension;->removeRcseOnlyApnStateChanged(Lcom/mediatek/settings/ext/IRcseOnlyApnExtension$OnRcseOnlyApnStateChangedListener;)V

    .line 444
    :cond_1
    return-void
.end method

.method public onMenuOpened(ILandroid/view/Menu;)Z
    .locals 2
    .parameter "featureId"
    .parameter "menu"

    .prologue
    .line 684
    invoke-super {p0, p1, p2}, Landroid/preference/PreferenceActivity;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 686
    if-eqz p2, :cond_0

    .line 687
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/android/settings/ApnSettings;->getScreenEnableState()Z

    move-result v1

    invoke-interface {p2, v0, v1}, Landroid/view/Menu;->setGroupEnabled(IZ)V

    .line 689
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .parameter "intent"

    .prologue
    .line 301
    invoke-virtual {p0, p1}, Lcom/android/settings/ApnSettings;->setIntent(Landroid/content/Intent;)V

    .line 303
    invoke-direct {p0}, Lcom/android/settings/ApnSettings;->initSimState()V

    .line 304
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    const/4 v0, 0x1

    .line 695
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 706
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 697
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/settings/ApnSettings;->addNewApn()V

    goto :goto_0

    .line 701
    :pswitch_1
    invoke-direct {p0}, Lcom/android/settings/ApnSettings;->restoreDefaultApn()Z

    goto :goto_0

    .line 695
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 426
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onPause()V

    .line 428
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/android/settings/ApnSettings;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 429
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 3
    .parameter "preference"
    .parameter "newValue"

    .prologue
    .line 717
    const-string v0, "ApnSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPreferenceChange(): Preference - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", newValue - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", newValue type - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 720
    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 721
    check-cast p2, Ljava/lang/String;

    .end local p2
    invoke-virtual {p0, p2}, Lcom/android/settings/ApnSettings;->setSelectedApnKey(Ljava/lang/String;)V

    .line 724
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .locals 2
    .parameter "id"
    .parameter "dialog"

    .prologue
    .line 842
    const/16 v0, 0x3e9

    if-ne p1, v0, :cond_0

    .line 843
    invoke-virtual {p0}, Lcom/android/settings/ApnSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    .line 845
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 3

    .prologue
    .line 394
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 396
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v1, p0, Lcom/android/settings/ApnSettings;->mMobileStateFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v1}, Lcom/android/settings/ApnSettings;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 398
    invoke-static {p0}, Lcom/android/settings/AirplaneModeEnabler;->isAirplaneModeOn(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/settings/ApnSettings;->mAirplaneModeEnabled:Z

    .line 399
    invoke-virtual {p0}, Lcom/android/settings/ApnSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "dual_sim_mode_setting"

    const/4 v2, -0x1

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/settings/ApnSettings;->mDualSimMode:I

    .line 401
    invoke-direct {p0}, Lcom/android/settings/ApnSettings;->isMMSNotTransaction()Z

    move-result v0

    sput-boolean v0, Lcom/android/settings/ApnSettings;->sNotInMmsTransation:Z

    .line 402
    iget-boolean v0, p0, Lcom/android/settings/ApnSettings;->mAirplaneModeEnabled:Z

    if-nez v0, :cond_0

    iget v0, p0, Lcom/android/settings/ApnSettings;->mDualSimMode:I

    if-nez v0, :cond_1

    .line 403
    :cond_0
    const/16 v0, 0x7d0

    invoke-virtual {p0, v0}, Lcom/android/settings/ApnSettings;->showDialog(I)V

    .line 406
    :cond_1
    iget-boolean v0, p0, Lcom/android/settings/ApnSettings;->mRestoreDefaultApnMode:Z

    if-nez v0, :cond_2

    .line 407
    iget v0, p0, Lcom/android/settings/ApnSettings;->mSimId:I

    invoke-direct {p0, v0}, Lcom/android/settings/ApnSettings;->fillList(I)V

    .line 409
    :cond_2
    return-void
.end method

.method protected setSelectedApnKey(Ljava/lang/String;)V
    .locals 5
    .parameter "key"

    .prologue
    const/4 v4, 0x0

    .line 730
    iput-object p1, p0, Lcom/android/settings/ApnSettings;->mSelectedKey:Ljava/lang/String;

    .line 731
    invoke-virtual {p0}, Lcom/android/settings/ApnSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 733
    .local v0, resolver:Landroid/content/ContentResolver;
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 734
    .local v1, values:Landroid/content/ContentValues;
    const-string v2, "apn_id"

    iget-object v3, p0, Lcom/android/settings/ApnSettings;->mSelectedKey:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 735
    iget-object v2, p0, Lcom/android/settings/ApnSettings;->mRestoreCarrierUri:Landroid/net/Uri;

    invoke-virtual {v0, v2, v1, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 736
    return-void
.end method
