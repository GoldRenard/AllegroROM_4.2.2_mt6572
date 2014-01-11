.class public Lcom/mediatek/settings/MultipleSimActivity;
.super Landroid/preference/PreferenceActivity;
.source "MultipleSimActivity.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;
    }
.end annotation


# static fields
.field private static final ALERT_DIALOG:I = 0xc8

.field private static final ALERT_DIALOG_DEFAULT:I = 0x12c

.field private static final DBG:Z = true

.field public static final INIT_ARRAY:Ljava/lang/String; = "INIT_ARRAY"

.field public static final INIT_ARRAY_VALUE:Ljava/lang/String; = "INIT_ARRAY_VALUE"

.field public static final INIT_BASE_KEY:Ljava/lang/String; = "INIT_BASE_KEY"

.field public static final INIT_FEATURE_NAME:Ljava/lang/String; = "INIT_FEATURE_NAME"

.field public static final INIT_SIM_ID:Ljava/lang/String; = "INIT_SIM_ID"

.field public static final INIT_SIM_NUMBER:Ljava/lang/String; = "INIT_SIM_NUMBER"

.field public static final INIT_TITLE_NAME:Ljava/lang/String; = "INIT_TITLE_NAME"

.field public static final INTENT_KEY:Ljava/lang/String; = "ITEM_TYPE"

.field public static final LIST_TITLE:Ljava/lang/String; = "LIST_TITLE_NAME"

.field private static final MODEM_MASK_TDSCDMA:I = 0x8

.field public static final NETWORK_MODE_NAME:Ljava/lang/String; = "NETWORK_MODE"

.field private static final PROGRESS_DIALOG:I = 0x64

.field private static final SELECT_DEFAULT_PICTURE:Ljava/lang/String; = "0"

.field private static final SELECT_DEFAULT_PICTURE2:Ljava/lang/String; = "0"

.field private static final SELECT_MY_PICTURE:Ljava/lang/String; = "2"

.field private static final SELECT_MY_PICTURE2:Ljava/lang/String; = "1"

.field public static final SUB_TITLE_NAME:Ljava/lang/String; = "sub_title_name"

.field private static final TAG:Ljava/lang/String; = "MultipleSimActivity"

.field public static final TARGET_CALSS:Ljava/lang/String; = "TARGET_CLASS"

.field public static final VT_FEATURE_NAME:Ljava/lang/String; = "VT"


# instance fields
.field private mBaseKey:Ljava/lang/String;

.field private mBitmap:Landroid/graphics/Bitmap;

.field private mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

.field private mFeatureName:Ljava/lang/String;

.field private mImage:Landroid/widget/ImageView;

.field private mIntentFilter:Landroid/content/IntentFilter;

.field private mItemType:Ljava/lang/String;

.field private mListEntries:I

.field private mListTitle:I

.field private mListValues:I

.field private mPhone:Lcom/android/internal/telephony/Phone;

.field private mPhoneStateListener:Landroid/telephony/PhoneStateListener;

.field private mPreCheckForRunning:Lcom/mediatek/settings/PreCheckForRunning;

.field private mPref2CardSlot:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mReceiver:Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;

.field private mSimIds:[J

.field private mSimList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/provider/Telephony$SIMInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mSimNumbers:I

.field private mTargetClass:Ljava/lang/String;

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;

.field private mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;

.field private mTitleName:I

.field private mVTSimId:I

.field private mVTWhichToSave:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 52
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 55
    const-string v0, "PreferenceScreen"

    iput-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mItemType:Ljava/lang/String;

    .line 86
    iput v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mVTWhichToSave:I

    .line 87
    iput v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mVTSimId:I

    .line 89
    iput v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimNumbers:I

    .line 90
    iput-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    .line 98
    iput-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 100
    iput-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimIds:[J

    .line 101
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPref2CardSlot:Ljava/util/HashMap;

    .line 116
    new-instance v0, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;

    invoke-direct {v0, p0, v1}, Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;-><init>(Lcom/mediatek/settings/MultipleSimActivity;Lcom/mediatek/settings/MultipleSimActivity$1;)V

    iput-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mReceiver:Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;

    .line 175
    new-instance v0, Lcom/mediatek/settings/MultipleSimActivity$1;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/MultipleSimActivity$1;-><init>(Lcom/mediatek/settings/MultipleSimActivity;)V

    iput-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/settings/MultipleSimActivity;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/mediatek/settings/MultipleSimActivity;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/mediatek/settings/MultipleSimActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/mediatek/settings/MultipleSimActivity;->createSubItems()V

    return-void
.end method

.method static synthetic access$1100(Lcom/mediatek/settings/MultipleSimActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/mediatek/settings/MultipleSimActivity;->updatePreferenceList()V

    return-void
.end method

.method static synthetic access$1200(Lcom/mediatek/settings/MultipleSimActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/mediatek/settings/MultipleSimActivity;->setSimList()V

    return-void
.end method

.method static synthetic access$1300(Lcom/mediatek/settings/MultipleSimActivity;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mImage:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/mediatek/settings/MultipleSimActivity;)Landroid/graphics/Bitmap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mediatek/settings/MultipleSimActivity;)Lcom/android/internal/telephony/Phone;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPhone:Lcom/android/internal/telephony/Phone;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mediatek/settings/MultipleSimActivity;I)Ljava/lang/String;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/mediatek/settings/MultipleSimActivity;->getNetworkModeName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/mediatek/settings/MultipleSimActivity;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mFeatureName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/settings/MultipleSimActivity;)Ljava/util/HashMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPref2CardSlot:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mediatek/settings/MultipleSimActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/mediatek/settings/MultipleSimActivity;->updatePreferenceEnableState()V

    return-void
.end method

.method static synthetic access$700(Lcom/mediatek/settings/MultipleSimActivity;)Ljava/util/List;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$800(Lcom/mediatek/settings/MultipleSimActivity;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$900(Lcom/mediatek/settings/MultipleSimActivity;)Lcom/mediatek/phone/ext/SettingsExtension;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    return-object v0
.end method

.method private checkToStart(ILandroid/content/Intent;)V
    .locals 2
    .parameter "slotId"
    .parameter "intent"

    .prologue
    .line 818
    invoke-direct {p0}, Lcom/mediatek/settings/MultipleSimActivity;->isNeededToCheckLock()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 819
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPreCheckForRunning:Lcom/mediatek/settings/PreCheckForRunning;

    if-nez v0, :cond_0

    .line 820
    new-instance v0, Lcom/mediatek/settings/PreCheckForRunning;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/PreCheckForRunning;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPreCheckForRunning:Lcom/mediatek/settings/PreCheckForRunning;

    .line 822
    :cond_0
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPreCheckForRunning:Lcom/mediatek/settings/PreCheckForRunning;

    const/16 v1, 0x12e

    invoke-virtual {v0, p2, p1, v1}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    .line 826
    :goto_0
    return-void

    .line 824
    :cond_1
    invoke-virtual {p0, p2}, Lcom/mediatek/settings/MultipleSimActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method private createSubItems()V
    .locals 9

    .prologue
    .line 316
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v5

    .line 317
    .local v5, prefSet:Landroid/preference/PreferenceScreen;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 318
    .local v3, keys:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {v5}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v7

    if-ge v1, v7, :cond_1

    .line 319
    invoke-virtual {v5, v1}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v7

    invoke-virtual {v7}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 320
    .local v0, c:Ljava/lang/String;
    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity;->mItemType:Ljava/lang/String;

    invoke-virtual {v0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 321
    invoke-virtual {v5, v1}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v7

    invoke-virtual {v7}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 318
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 325
    .end local v0           #c:Ljava/lang/String;
    :cond_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 326
    .local v6, s:Ljava/lang/String;
    invoke-virtual {v5, v6}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_1

    .line 329
    .end local v6           #s:Ljava/lang/String;
    :cond_2
    invoke-virtual {v5}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v4

    .line 331
    .local v4, prefCount:I
    add-int/lit8 v1, v4, -0x1

    :goto_2
    iget v7, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimNumbers:I

    add-int/lit8 v7, v7, -0x1

    if-le v1, v7, :cond_3

    .line 332
    invoke-virtual {v5, v1}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 331
    add-int/lit8 v1, v1, -0x1

    goto :goto_2

    .line 335
    :cond_3
    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity;->mItemType:Ljava/lang/String;

    const-string v8, "PreferenceScreen"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 336
    invoke-direct {p0}, Lcom/mediatek/settings/MultipleSimActivity;->initPreferenceScreen()V

    .line 342
    :cond_4
    :goto_3
    return-void

    .line 337
    :cond_5
    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity;->mItemType:Ljava/lang/String;

    const-string v8, "CheckBoxPreference"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 338
    invoke-direct {p0}, Lcom/mediatek/settings/MultipleSimActivity;->initCheckBoxPreference()V

    goto :goto_3

    .line 339
    :cond_6
    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity;->mItemType:Ljava/lang/String;

    const-string v8, "ListPreference"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 340
    invoke-direct {p0}, Lcom/mediatek/settings/MultipleSimActivity;->initListPreference()V

    goto :goto_3
.end method

.method private customizeForEVDO(Landroid/content/Intent;ILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "intent"
    .parameter "slotId"
    .parameter "pkName"
    .parameter "targetClass"

    .prologue
    .line 794
    if-nez p2, :cond_0

    .line 795
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    invoke-virtual {p1, p3, v0}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 796
    invoke-direct {p0, p2, p1}, Lcom/mediatek/settings/MultipleSimActivity;->checkToStart(ILandroid/content/Intent;)V

    .line 815
    :goto_0
    return-void

    .line 799
    :cond_0
    const-string v0, "com.android.phone.GsmUmtsCallForwardOptions"

    invoke-virtual {v0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 800
    const-string v0, "com.mediatek.settings.CdmaCallForwardOptions"

    invoke-virtual {p1, p3, v0}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 801
    invoke-direct {p0, p2, p1}, Lcom/mediatek/settings/MultipleSimActivity;->checkToStart(ILandroid/content/Intent;)V

    goto :goto_0

    .line 802
    :cond_1
    const-string v0, "com.android.phone.GsmUmtsAdditionalCallOptions"

    invoke-virtual {v0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 803
    const-string v0, "com.mediatek.settings.CdmaCallWaitingOptions"

    invoke-virtual {p1, p3, v0}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 804
    invoke-direct {p0, p2, p1}, Lcom/mediatek/settings/MultipleSimActivity;->checkToStart(ILandroid/content/Intent;)V

    goto :goto_0

    .line 805
    :cond_2
    const-string v0, "com.mediatek.settings.FdnSetting2"

    invoke-virtual {v0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "com.mediatek.settings.CallBarring"

    invoke-virtual {v0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "com.android.phone.NetworkSetting"

    iget-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "com.mediatek.settings.PLMNListPreference"

    iget-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 809
    :cond_3
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0d0087

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 812
    :cond_4
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    invoke-virtual {p1, p3, v0}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 813
    invoke-direct {p0, p2, p1}, Lcom/mediatek/settings/MultipleSimActivity;->checkToStart(ILandroid/content/Intent;)V

    goto :goto_0
.end method

.method private getNetworkModeEntry(I)I
    .locals 1
    .parameter "slot"

    .prologue
    .line 443
    invoke-static {p1}, Lcom/mediatek/settings/CallSettings;->getBaseband(I)I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_0

    .line 444
    const v0, 0x7f070020

    .line 446
    :goto_0
    return v0

    :cond_0
    const v0, 0x7f07001e

    goto :goto_0
.end method

.method private getNetworkModeEntryValues(I)I
    .locals 1
    .parameter "slot"

    .prologue
    .line 450
    invoke-static {p1}, Lcom/mediatek/settings/CallSettings;->getBaseband(I)I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_0

    .line 451
    const v0, 0x7f070021

    .line 453
    :goto_0
    return v0

    :cond_0
    const v0, 0x7f07001f

    goto :goto_0
.end method

.method private getNetworkModeName(I)Ljava/lang/String;
    .locals 1
    .parameter "slotId"

    .prologue
    .line 870
    const-string v0, "preferred_network_mode"

    .line 871
    .local v0, name:Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 880
    :goto_0
    :pswitch_0
    return-object v0

    .line 875
    :pswitch_1
    const-string v0, "preferred_network_mode_2"

    .line 876
    goto :goto_0

    .line 871
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private getProperOperatorNumber(Landroid/provider/Telephony$SIMInfo;)Ljava/lang/String;
    .locals 5
    .parameter "info"

    .prologue
    const/4 v4, 0x4

    .line 512
    const/4 v1, 0x0

    .line 513
    .local v1, res:Ljava/lang/String;
    const/4 v0, 0x4

    .line 514
    .local v0, charCount:I
    if-nez p1, :cond_0

    move-object v2, v1

    .line 536
    .end local v1           #res:Ljava/lang/String;
    .local v2, res:Ljava/lang/String;
    :goto_0
    return-object v2

    .line 517
    .end local v2           #res:Ljava/lang/String;
    .restart local v1       #res:Ljava/lang/String;
    :cond_0
    iget-object v1, p1, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    .line 518
    iget v3, p1, Landroid/provider/Telephony$SIMInfo;->mDispalyNumberFormat:I

    packed-switch v3, :pswitch_data_0

    .line 533
    const-string v1, ""

    :cond_1
    :goto_1
    move-object v2, v1

    .line 536
    .end local v1           #res:Ljava/lang/String;
    .restart local v2       #res:Ljava/lang/String;
    goto :goto_0

    .line 520
    .end local v2           #res:Ljava/lang/String;
    .restart local v1       #res:Ljava/lang/String;
    :pswitch_0
    const-string v1, ""

    .line 521
    goto :goto_1

    .line 523
    :pswitch_1
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v4, :cond_1

    .line 524
    const/4 v3, 0x0

    invoke-virtual {v1, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 528
    :pswitch_2
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v4, :cond_1

    .line 529
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 518
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private initCheckBoxPreference()V
    .locals 9

    .prologue
    const/4 v6, 0x0

    .line 359
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    .line 360
    .local v3, prefSet:Landroid/preference/PreferenceScreen;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v5, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimNumbers:I

    if-ge v0, v5, :cond_2

    .line 361
    const/4 v1, 0x0

    .line 362
    .local v1, key:Ljava/lang/String;
    invoke-virtual {v3, v0}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Lcom/mediatek/settings/CheckSimPreference;

    .line 363
    .local v2, p:Lcom/mediatek/settings/CheckSimPreference;
    iget-object v5, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/provider/Telephony$SIMInfo;

    iget-object v5, v5, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lcom/mediatek/settings/CheckSimPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 364
    iget-object v5, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/provider/Telephony$SIMInfo;

    iget v5, v5, Landroid/provider/Telephony$SIMInfo;->mColor:I

    invoke-virtual {v2, v5}, Lcom/mediatek/settings/CheckSimPreference;->setSimColor(I)V

    .line 365
    iget-object v5, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/provider/Telephony$SIMInfo;

    iget v5, v5, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-virtual {v2, v5}, Lcom/mediatek/settings/CheckSimPreference;->setSimSlot(I)V

    .line 366
    iget-object v5, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/provider/Telephony$SIMInfo;

    iget-object v5, v5, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lcom/mediatek/settings/CheckSimPreference;->setSimName(Ljava/lang/String;)V

    .line 367
    iget-object v5, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/provider/Telephony$SIMInfo;

    iget-object v5, v5, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lcom/mediatek/settings/CheckSimPreference;->setSimNumber(Ljava/lang/String;)V

    .line 368
    iget-object v5, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/provider/Telephony$SIMInfo;

    invoke-direct {p0, v5}, Lcom/mediatek/settings/MultipleSimActivity;->getProperOperatorNumber(Landroid/provider/Telephony$SIMInfo;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/mediatek/settings/CheckSimPreference;->setSimIconNumber(Ljava/lang/String;)V

    .line 370
    iget-object v5, p0, Lcom/mediatek/settings/MultipleSimActivity;->mBaseKey:Ljava/lang/String;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/mediatek/settings/MultipleSimActivity;->mBaseKey:Ljava/lang/String;

    const-string v7, "@"

    invoke-virtual {v5, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 371
    iget-object v5, p0, Lcom/mediatek/settings/MultipleSimActivity;->mBaseKey:Ljava/lang/String;

    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity;->mBaseKey:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 372
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, "_"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v5, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/provider/Telephony$SIMInfo;

    iget v5, v5, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 373
    invoke-virtual {v2, v1}, Lcom/mediatek/settings/CheckSimPreference;->setKey(Ljava/lang/String;)V

    .line 375
    :cond_0
    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPref2CardSlot:Ljava/util/HashMap;

    invoke-virtual {v3, v0}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v8

    iget-object v5, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/provider/Telephony$SIMInfo;

    iget v5, v5, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v7, v8, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 379
    .local v4, sp:Landroid/content/SharedPreferences;
    const-string v5, "button_vt_auto_dropback_key"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    const/4 v5, 0x1

    :goto_1
    invoke-interface {v4, v1, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    invoke-virtual {v2, v5}, Lcom/mediatek/settings/CheckSimPreference;->setChecked(Z)V

    .line 380
    invoke-virtual {v2, p0}, Lcom/mediatek/settings/CheckSimPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 360
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    :cond_1
    move v5, v6

    .line 379
    goto :goto_1

    .line 382
    .end local v1           #key:Ljava/lang/String;
    .end local v2           #p:Lcom/mediatek/settings/CheckSimPreference;
    .end local v4           #sp:Landroid/content/SharedPreferences;
    :cond_2
    return-void
.end method

.method private initListPreference()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    .line 385
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v5

    .line 386
    .local v5, prefSet:Landroid/preference/PreferenceScreen;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    iget v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimNumbers:I

    if-ge v2, v8, :cond_8

    .line 387
    const/4 v3, 0x0

    .line 388
    .local v3, key:Ljava/lang/String;
    invoke-virtual {v5, v2}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/mediatek/settings/ListSimPreference;

    .line 389
    .local v4, listPref:Lcom/mediatek/settings/ListSimPreference;
    iget-object v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/provider/Telephony$SIMInfo;

    iget-object v8, v8, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v4, v8}, Lcom/mediatek/settings/ListSimPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 390
    iget-object v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/provider/Telephony$SIMInfo;

    iget v8, v8, Landroid/provider/Telephony$SIMInfo;->mColor:I

    invoke-virtual {v4, v8}, Lcom/mediatek/settings/ListSimPreference;->setSimColor(I)V

    .line 391
    iget-object v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/provider/Telephony$SIMInfo;

    iget v8, v8, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-virtual {v4, v8}, Lcom/mediatek/settings/ListSimPreference;->setSimSlot(I)V

    .line 392
    iget-object v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/provider/Telephony$SIMInfo;

    iget-object v8, v8, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v4, v8}, Lcom/mediatek/settings/ListSimPreference;->setSimName(Ljava/lang/String;)V

    .line 393
    iget-object v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/provider/Telephony$SIMInfo;

    iget-object v8, v8, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v4, v8}, Lcom/mediatek/settings/ListSimPreference;->setSimNumber(Ljava/lang/String;)V

    .line 394
    iget-object v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/provider/Telephony$SIMInfo;

    invoke-direct {p0, v8}, Lcom/mediatek/settings/MultipleSimActivity;->getProperOperatorNumber(Landroid/provider/Telephony$SIMInfo;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Lcom/mediatek/settings/ListSimPreference;->setSimIconNumber(Ljava/lang/String;)V

    .line 396
    iget-object v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mBaseKey:Ljava/lang/String;

    if-eqz v8, :cond_0

    iget-object v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mBaseKey:Ljava/lang/String;

    const-string v9, "@"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 397
    iget-object v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mBaseKey:Ljava/lang/String;

    iget-object v9, p0, Lcom/mediatek/settings/MultipleSimActivity;->mBaseKey:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {v8, v11, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 398
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "_"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/provider/Telephony$SIMInfo;

    iget v8, v8, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 399
    invoke-virtual {v4, v3}, Lcom/mediatek/settings/ListSimPreference;->setKey(Ljava/lang/String;)V

    .line 401
    :cond_0
    iget-object v9, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPref2CardSlot:Ljava/util/HashMap;

    invoke-virtual {v5, v2}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v10

    iget-object v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/provider/Telephony$SIMInfo;

    iget v8, v8, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v9, v10, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 403
    iget v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mListTitle:I

    if-lez v8, :cond_1

    .line 404
    iget v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mListTitle:I

    invoke-virtual {v4, v8}, Lcom/mediatek/settings/ListSimPreference;->setDialogTitle(I)V

    .line 407
    :cond_1
    iget v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mListEntries:I

    if-lez v8, :cond_2

    .line 408
    iget-object v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/provider/Telephony$SIMInfo;

    iget v8, v8, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-direct {p0, v8}, Lcom/mediatek/settings/MultipleSimActivity;->getNetworkModeEntry(I)I

    move-result v0

    .line 409
    .local v0, entryLocal:I
    const-string v8, "NETWORK_MODE"

    iget-object v9, p0, Lcom/mediatek/settings/MultipleSimActivity;->mFeatureName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 410
    invoke-virtual {v4, v0}, Lcom/mediatek/settings/ListSimPreference;->setEntries(I)V

    .line 415
    .end local v0           #entryLocal:I
    :cond_2
    :goto_1
    iget v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mListValues:I

    if-lez v8, :cond_3

    .line 416
    iget-object v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/provider/Telephony$SIMInfo;

    iget v8, v8, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-direct {p0, v8}, Lcom/mediatek/settings/MultipleSimActivity;->getNetworkModeEntryValues(I)I

    move-result v1

    .line 417
    .local v1, entryValueLocal:I
    const-string v8, "NETWORK_MODE"

    iget-object v9, p0, Lcom/mediatek/settings/MultipleSimActivity;->mFeatureName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 418
    invoke-virtual {v4, v1}, Lcom/mediatek/settings/ListSimPreference;->setEntryValues(I)V

    .line 423
    .end local v1           #entryValueLocal:I
    :cond_3
    :goto_2
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 425
    .local v7, sp:Landroid/content/SharedPreferences;
    const-string v8, "0"

    invoke-interface {v7, v3, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Lcom/mediatek/settings/ListSimPreference;->setValue(Ljava/lang/String;)V

    .line 426
    invoke-virtual {v4, p0}, Lcom/mediatek/settings/ListSimPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 428
    const-string v8, "NETWORK_MODE"

    iget-object v9, p0, Lcom/mediatek/settings/MultipleSimActivity;->mFeatureName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 429
    iget-object v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v8}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    iget-object v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/provider/Telephony$SIMInfo;

    iget v8, v8, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-direct {p0, v8}, Lcom/mediatek/settings/MultipleSimActivity;->getNetworkModeName(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v9, v8, v11}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v6

    .line 431
    .local v6, settingsNetworkMode:I
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "settingsNetworkMode in provider = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/mediatek/settings/MultipleSimActivity;->log(Ljava/lang/String;)V

    .line 433
    const/4 v8, 0x3

    if-ne v6, v8, :cond_4

    .line 434
    const/4 v6, 0x0

    .line 436
    :cond_4
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "settingsNetworkMode init value = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/mediatek/settings/MultipleSimActivity;->log(Ljava/lang/String;)V

    .line 437
    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Lcom/mediatek/settings/ListSimPreference;->setValue(Ljava/lang/String;)V

    .line 386
    .end local v6           #settingsNetworkMode:I
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 412
    .end local v7           #sp:Landroid/content/SharedPreferences;
    .restart local v0       #entryLocal:I
    :cond_6
    iget v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mListEntries:I

    invoke-virtual {v4, v8}, Lcom/mediatek/settings/ListSimPreference;->setEntries(I)V

    goto/16 :goto_1

    .line 420
    .end local v0           #entryLocal:I
    .restart local v1       #entryValueLocal:I
    :cond_7
    iget v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mListValues:I

    invoke-virtual {v4, v8}, Lcom/mediatek/settings/ListSimPreference;->setEntryValues(I)V

    goto/16 :goto_2

    .line 440
    .end local v1           #entryValueLocal:I
    .end local v3           #key:Ljava/lang/String;
    .end local v4           #listPref:Lcom/mediatek/settings/ListSimPreference;
    :cond_8
    return-void
.end method

.method private initPreferenceScreen()V
    .locals 6

    .prologue
    .line 345
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    .line 346
    .local v2, prefSet:Landroid/preference/PreferenceScreen;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimNumbers:I

    if-ge v0, v3, :cond_0

    .line 347
    invoke-virtual {v2, v0}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Lcom/mediatek/settings/SimPreference;

    .line 348
    .local v1, p:Lcom/mediatek/settings/SimPreference;
    iget-object v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/provider/Telephony$SIMInfo;

    iget-object v3, v3, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/SimPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 349
    iget-object v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/provider/Telephony$SIMInfo;

    iget v3, v3, Landroid/provider/Telephony$SIMInfo;->mColor:I

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/SimPreference;->setSimColor(I)V

    .line 350
    iget-object v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/provider/Telephony$SIMInfo;

    iget v3, v3, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/SimPreference;->setSimSlot(I)V

    .line 351
    iget-object v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/provider/Telephony$SIMInfo;

    iget-object v3, v3, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/SimPreference;->setSimName(Ljava/lang/String;)V

    .line 352
    iget-object v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/provider/Telephony$SIMInfo;

    iget-object v3, v3, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/SimPreference;->setSimNumber(Ljava/lang/String;)V

    .line 353
    iget-object v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/provider/Telephony$SIMInfo;

    invoke-direct {p0, v3}, Lcom/mediatek/settings/MultipleSimActivity;->getProperOperatorNumber(Landroid/provider/Telephony$SIMInfo;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/mediatek/settings/SimPreference;->setSimIconNumber(Ljava/lang/String;)V

    .line 354
    iget-object v4, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPref2CardSlot:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v5

    iget-object v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/provider/Telephony$SIMInfo;

    iget v3, v3, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 356
    .end local v1           #p:Lcom/mediatek/settings/SimPreference;
    :cond_0
    return-void
.end method

.method private isNeededToCheckLock()Z
    .locals 2

    .prologue
    .line 458
    const-string v0, "com.mediatek.settings.IpPrefixPreference"

    iget-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 459
    const/4 v0, 0x0

    .line 461
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private isSimInserted(J)Z
    .locals 6
    .parameter "simId"

    .prologue
    .line 859
    const/4 v1, 0x0

    .line 860
    .local v1, isInserted:Z
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v3

    .line 861
    .local v3, simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/provider/Telephony$SIMInfo;

    .line 862
    .local v2, simInfo:Landroid/provider/Telephony$SIMInfo;
    iget-wide v4, v2, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    cmp-long v4, v4, p1

    if-nez v4, :cond_0

    .line 863
    const/4 v1, 0x1

    goto :goto_0

    .line 866
    .end local v2           #simInfo:Landroid/provider/Telephony$SIMInfo;
    :cond_1
    return v1
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 193
    const-string v0, "MultipleSimActivity"

    invoke-static {v0, p1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    return-void
.end method

.method private setSimList()V
    .locals 4

    .prologue
    .line 835
    const-string v1, "MultipleSimActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[simlist = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 836
    const-string v1, "MultipleSimActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[mSimIds = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimIds:[J

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 837
    iget-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    if-nez v1, :cond_0

    .line 838
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    .line 840
    :cond_0
    iget-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimIds:[J

    if-eqz v1, :cond_2

    .line 841
    iget-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 842
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimIds:[J

    array-length v1, v1

    if-ge v0, v1, :cond_3

    .line 843
    iget-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimIds:[J

    aget-wide v1, v1, v0

    invoke-direct {p0, v1, v2}, Lcom/mediatek/settings/MultipleSimActivity;->isSimInserted(J)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 844
    iget-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    iget-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimIds:[J

    aget-wide v2, v2, v0

    invoke-static {p0, v2, v3}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoById(Landroid/content/Context;J)Landroid/provider/Telephony$SIMInfo;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 842
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 848
    .end local v0           #i:I
    :cond_2
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    .line 850
    :cond_3
    iget-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iput v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimNumbers:I

    .line 851
    iget-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    new-instance v2, Lcom/mediatek/settings/CallSettings$SIMInfoComparable;

    invoke-direct {v2}, Lcom/mediatek/settings/CallSettings$SIMInfoComparable;-><init>()V

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 852
    iget v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimNumbers:I

    if-nez v1, :cond_4

    .line 853
    const-string v1, "MultipleSimActivity"

    const-string v2, "Activity finished"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 854
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->finish()V

    .line 856
    :cond_4
    return-void
.end method

.method private showDialogPic(Ljava/lang/String;I)V
    .locals 3
    .parameter "filename"
    .parameter "dialog"

    .prologue
    .line 708
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mImage:Landroid/widget/ImageView;

    .line 709
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mBitmap:Landroid/graphics/Bitmap;

    .line 710
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mImage:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 711
    invoke-virtual {p0, p2}, Lcom/mediatek/settings/MultipleSimActivity;->showDialog(I)V

    .line 712
    const-string v0, "MultipleSimActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[showDialogPic][filename = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 713
    const-string v0, "MultipleSimActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[showDialogPic][mBitmap = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 714
    const-string v0, "MultipleSimActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[showDialogPic][mImage = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mImage:Landroid/widget/ImageView;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 715
    return-void
.end method

.method private skipUsIfNeeded()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 293
    const-string v4, "VT"

    iget-object v5, p0, Lcom/mediatek/settings/MultipleSimActivity;->mFeatureName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "NETWORK_MODE"

    iget-object v5, p0, Lcom/mediatek/settings/MultipleSimActivity;->mFeatureName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 313
    :cond_0
    :goto_0
    return-void

    .line 297
    :cond_1
    iget v4, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimNumbers:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    iget-object v4, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 298
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 299
    .local v0, intent:Landroid/content/Intent;
    iget-object v4, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    const/16 v5, 0x2e

    invoke-virtual {v4, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 300
    .local v2, position:I
    iget-object v4, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    invoke-virtual {v4, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 301
    .local v1, pkName:Ljava/lang/String;
    const-string v4, "com.mediatek.settings"

    const-string v5, "com.android.phone"

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 302
    const-string v4, "android.intent.action.MAIN"

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 303
    iget-object v4, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/provider/Telephony$SIMInfo;

    iget v3, v4, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    .line 304
    .local v3, slotId:I
    const-string v4, "simId"

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 308
    iget-object v4, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 309
    invoke-direct {p0, v3, v0}, Lcom/mediatek/settings/MultipleSimActivity;->checkToStart(ILandroid/content/Intent;)V

    .line 311
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->finish()V

    goto :goto_0
.end method

.method private updatePreferenceEnableState()V
    .locals 10

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 765
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v5

    .line 768
    .local v5, prefSet:Landroid/preference/PreferenceScreen;
    const/4 v1, 0x0

    .line 769
    .local v1, dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPhone:Lcom/android/internal/telephony/Phone;

    instance-of v6, v6, Lcom/android/internal/telephony/gemini/GeminiPhone;

    if-eqz v6, :cond_0

    .line 770
    iget-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPhone:Lcom/android/internal/telephony/Phone;

    .end local v1           #dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 772
    .restart local v1       #dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    :cond_0
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v6}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v6

    if-nez v6, :cond_2

    move v3, v7

    .line 773
    .local v3, isIdle:Z
    :goto_0
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    invoke-virtual {v5}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v6

    if-ge v2, v6, :cond_5

    .line 774
    invoke-virtual {v5, v2}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v4

    .line 775
    .local v4, p:Landroid/preference/Preference;
    if-eqz v1, :cond_1

    .line 776
    const-string v6, "NETWORK_MODE"

    iget-object v9, p0, Lcom/mediatek/settings/MultipleSimActivity;->mFeatureName:Ljava/lang/String;

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 777
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPref2CardSlot:Ljava/util/HashMap;

    invoke-virtual {v6, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v1, v6}, Lcom/android/internal/telephony/gemini/GeminiPhone;->isRadioOnGemini(I)Z

    move-result v6

    if-eqz v6, :cond_3

    if-eqz v3, :cond_3

    move v6, v7

    :goto_2
    invoke-virtual {v4, v6}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 781
    :goto_3
    invoke-virtual {v4}, Landroid/preference/Preference;->isEnabled()Z

    move-result v6

    if-nez v6, :cond_1

    .line 782
    instance-of v6, v4, Landroid/preference/ListPreference;

    if-eqz v6, :cond_1

    .line 783
    check-cast v4, Landroid/preference/ListPreference;

    .end local v4           #p:Landroid/preference/Preference;
    invoke-virtual {v4}, Landroid/preference/ListPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 784
    .local v0, dialog:Landroid/app/Dialog;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 785
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 773
    .end local v0           #dialog:Landroid/app/Dialog;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .end local v2           #i:I
    .end local v3           #isIdle:Z
    :cond_2
    move v3, v8

    .line 772
    goto :goto_0

    .restart local v2       #i:I
    .restart local v3       #isIdle:Z
    .restart local v4       #p:Landroid/preference/Preference;
    :cond_3
    move v6, v8

    .line 777
    goto :goto_2

    .line 779
    :cond_4
    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPref2CardSlot:Ljava/util/HashMap;

    invoke-virtual {v6, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v1, v6}, Lcom/android/internal/telephony/gemini/GeminiPhone;->isRadioOnGemini(I)Z

    move-result v6

    invoke-virtual {v4, v6}, Landroid/preference/Preference;->setEnabled(Z)V

    goto :goto_3

    .line 791
    .end local v4           #p:Landroid/preference/Preference;
    :cond_5
    return-void
.end method

.method private updatePreferenceList()V
    .locals 2

    .prologue
    .line 829
    const-string v1, "---------[update mutiple list views]---------"

    invoke-direct {p0, v1}, Lcom/mediatek/settings/MultipleSimActivity;->log(Ljava/lang/String;)V

    .line 830
    const v1, 0x102000a

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/MultipleSimActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    .line 831
    .local v0, listView:Landroid/widget/ListView;
    invoke-virtual {v0}, Landroid/widget/ListView;->invalidateViews()V

    .line 832
    return-void
.end method


# virtual methods
.method public checkAllowedRun(Landroid/content/Intent;Landroid/preference/Preference;)V
    .locals 4
    .parameter "intent"
    .parameter "preference"

    .prologue
    .line 504
    const-string v2, "simId"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 505
    .local v1, slot:I
    const/4 v0, 0x0

    .line 506
    .local v0, dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    iget-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPhone:Lcom/android/internal/telephony/Phone;

    instance-of v2, v2, Lcom/android/internal/telephony/gemini/GeminiPhone;

    if-eqz v2, :cond_0

    .line 507
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPhone:Lcom/android/internal/telephony/Phone;

    .end local v0           #dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 509
    .restart local v0       #dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    :cond_0
    return-void
.end method

.method public getNetworkMode(II)I
    .locals 5
    .parameter "buttonNetworkMode"
    .parameter "slotId"

    .prologue
    .line 540
    iget-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-direct {p0, p2}, Lcom/mediatek/settings/MultipleSimActivity;->getNetworkModeName(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    .line 542
    .local v1, settingsNetworkMode:I
    move v0, v1

    .line 543
    .local v0, modemNetworkMode:I
    if-eq p1, v1, :cond_0

    .line 544
    packed-switch p1, :pswitch_data_0

    .line 570
    const/4 v0, 0x0

    .line 573
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-direct {p0, p2}, Lcom/mediatek/settings/MultipleSimActivity;->getNetworkModeName(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 575
    return v0

    .line 546
    :pswitch_0
    const/4 v0, 0x7

    .line 547
    goto :goto_0

    .line 549
    :pswitch_1
    const/4 v0, 0x6

    .line 550
    goto :goto_0

    .line 552
    :pswitch_2
    const/4 v0, 0x5

    .line 553
    goto :goto_0

    .line 555
    :pswitch_3
    const/4 v0, 0x4

    .line 556
    goto :goto_0

    .line 558
    :pswitch_4
    const/4 v0, 0x3

    .line 559
    goto :goto_0

    .line 561
    :pswitch_5
    const/4 v0, 0x2

    .line 562
    goto :goto_0

    .line 564
    :pswitch_6
    const/4 v0, 0x1

    .line 565
    goto :goto_0

    .line 567
    :pswitch_7
    const/4 v0, 0x0

    .line 568
    goto :goto_0

    .line 544
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    const/16 v4, 0xc8

    .line 718
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onActivityResult: requestCode = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", resultCode = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/settings/MultipleSimActivity;->log(Ljava/lang/String;)V

    .line 720
    const/4 v2, -0x1

    if-eq p2, v2, :cond_0

    .line 750
    :goto_0
    return-void

    .line 724
    :cond_0
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 727
    :pswitch_0
    :try_start_0
    const-string v2, "data"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 728
    .local v0, bitmap:Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 729
    iget v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mVTWhichToSave:I

    if-nez v2, :cond_2

    .line 730
    iget v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mVTSimId:I

    invoke-static {v2}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/mediatek/phone/vt/VTCallUtils;->saveMyBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 734
    :goto_1
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v2

    if-nez v2, :cond_1

    .line 735
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 741
    .end local v0           #bitmap:Landroid/graphics/Bitmap;
    :cond_1
    :goto_2
    iget v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mVTWhichToSave:I

    if-nez v2, :cond_3

    .line 742
    iget v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mVTSimId:I

    invoke-static {v2}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2, v4}, Lcom/mediatek/settings/MultipleSimActivity;->showDialogPic(Ljava/lang/String;I)V

    goto :goto_0

    .line 732
    .restart local v0       #bitmap:Landroid/graphics/Bitmap;
    :cond_2
    :try_start_1
    iget v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mVTSimId:I

    invoke-static {v2}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect2(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/mediatek/phone/vt/VTCallUtils;->saveMyBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 738
    .end local v0           #bitmap:Landroid/graphics/Bitmap;
    :catch_0
    move-exception v1

    .line 739
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 744
    .end local v1           #e:Ljava/io/IOException;
    :cond_3
    iget v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mVTSimId:I

    invoke-static {v2}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect2(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2, v4}, Lcom/mediatek/settings/MultipleSimActivity;->showDialogPic(Ljava/lang/String;I)V

    goto :goto_0

    .line 724
    nop

    :pswitch_data_0
    .packed-switch 0xbcd
        :pswitch_0
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .parameter "icicle"

    .prologue
    const/4 v4, -0x1

    .line 199
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 201
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "INIT_SIM_ID"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getLongArrayExtra(Ljava/lang/String;)[J

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimIds:[J

    .line 202
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "TARGET_CLASS"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    .line 203
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "INIT_FEATURE_NAME"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mFeatureName:Ljava/lang/String;

    .line 204
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "INIT_BASE_KEY"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mBaseKey:Ljava/lang/String;

    .line 206
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "INIT_TITLE_NAME"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTitleName:I

    .line 207
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "LIST_TITLE_NAME"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mListTitle:I

    .line 208
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "INIT_ARRAY"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mListEntries:I

    .line 209
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "INIT_ARRAY_VALUE"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mListValues:I

    .line 210
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "ITEM_TYPE"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 211
    .local v1, itemType:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 212
    iput-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mItemType:Ljava/lang/String;

    .line 215
    :cond_0
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 216
    new-instance v2, Lcom/mediatek/telephony/TelephonyManagerEx;

    invoke-direct {v2, p0}, Lcom/mediatek/telephony/TelephonyManagerEx;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;

    .line 217
    const-string v2, "phone"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/MultipleSimActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    iput-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 218
    iget-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/16 v4, 0x20

    invoke-virtual {v2, v3, v4}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 220
    invoke-direct {p0}, Lcom/mediatek/settings/MultipleSimActivity;->setSimList()V

    .line 221
    invoke-direct {p0}, Lcom/mediatek/settings/MultipleSimActivity;->skipUsIfNeeded()V

    .line 222
    const v2, 0x7f060015

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/MultipleSimActivity;->addPreferencesFromResource(I)V

    .line 223
    invoke-direct {p0}, Lcom/mediatek/settings/MultipleSimActivity;->createSubItems()V

    .line 225
    invoke-static {}, Lcom/mediatek/phone/ext/ExtensionManager;->getInstance()Lcom/mediatek/phone/ext/ExtensionManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/phone/ext/ExtensionManager;->getSettingsExtension()Lcom/mediatek/phone/ext/SettingsExtension;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    .line 226
    iget-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    iget-object v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v4, p0, Lcom/mediatek/settings/MultipleSimActivity;->mSimList:Ljava/util/List;

    iget-object v5, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    invoke-virtual {v2, v3, v4, v5}, Lcom/mediatek/phone/ext/SettingsExtension;->removeNMOpForMultiSim(Lcom/android/internal/telephony/Phone;Ljava/util/List;Ljava/lang/String;)V

    .line 227
    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mIntentFilter:Landroid/content/IntentFilter;

    .line 229
    iget-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 230
    iget-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.ACTION_EF_CSP_CONTENT_NOTIFY"

    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 231
    iget-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 233
    iget-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.DUAL_SIM_MODE"

    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 235
    const-string v2, "NETWORK_MODE"

    iget-object v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mFeatureName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 236
    iget-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v3, "com.android.phone.NETWORK_MODE_CHANGE_RESPONSE"

    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 238
    :cond_1
    iget-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mReceiver:Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;

    iget-object v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/settings/MultipleSimActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 239
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 240
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_2

    .line 242
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 244
    :cond_2
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 6
    .parameter "id"

    .prologue
    const v5, 0x104000a

    .line 629
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[onCreateDialog]["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/settings/MultipleSimActivity;->log(Ljava/lang/String;)V

    .line 630
    const/4 v0, 0x0

    .line 631
    .local v0, dialog:Landroid/app/Dialog;
    const-string v2, "MultipleSimActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[mBitmap = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/MultipleSimActivity;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 632
    const-string v2, "MultipleSimActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[mImage = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/MultipleSimActivity;->mImage:Landroid/widget/ImageView;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 633
    iget-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/mediatek/settings/MultipleSimActivity;->mImage:Landroid/widget/ImageView;

    if-nez v2, :cond_1

    :cond_0
    move-object v1, v0

    .line 704
    .end local v0           #dialog:Landroid/app/Dialog;
    .local v1, dialog:Landroid/app/Dialog;
    :goto_0
    return-object v1

    .line 637
    .end local v1           #dialog:Landroid/app/Dialog;
    .restart local v0       #dialog:Landroid/app/Dialog;
    :cond_1
    sparse-switch p1, :sswitch_data_0

    .line 703
    :goto_1
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    move-object v1, v0

    .line 704
    .end local v0           #dialog:Landroid/app/Dialog;
    .restart local v1       #dialog:Landroid/app/Dialog;
    goto :goto_0

    .line 639
    .end local v1           #dialog:Landroid/app/Dialog;
    .restart local v0       #dialog:Landroid/app/Dialog;
    :sswitch_0
    new-instance v0, Landroid/app/ProgressDialog;

    .end local v0           #dialog:Landroid/app/Dialog;
    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .restart local v0       #dialog:Landroid/app/Dialog;
    move-object v2, v0

    .line 640
    check-cast v2, Landroid/app/ProgressDialog;

    const v3, 0x7f0d01df

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/MultipleSimActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    move-object v2, v0

    .line 641
    check-cast v2, Landroid/app/ProgressDialog;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    move-object v2, v0

    .line 642
    check-cast v2, Landroid/app/ProgressDialog;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    goto :goto_1

    .line 645
    :sswitch_1
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f0d003a

    new-instance v4, Lcom/mediatek/settings/MultipleSimActivity$3;

    invoke-direct {v4, p0}, Lcom/mediatek/settings/MultipleSimActivity$3;-><init>(Lcom/mediatek/settings/MultipleSimActivity;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/mediatek/settings/MultipleSimActivity$2;

    invoke-direct {v3, p0}, Lcom/mediatek/settings/MultipleSimActivity$2;-><init>(Lcom/mediatek/settings/MultipleSimActivity;)V

    invoke-virtual {v2, v5, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    move-object v2, v0

    .line 668
    check-cast v2, Landroid/app/AlertDialog;

    iget-object v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mImage:Landroid/widget/ImageView;

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog;->setView(Landroid/view/View;)V

    .line 669
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0031

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 670
    new-instance v2, Lcom/mediatek/settings/MultipleSimActivity$4;

    invoke-direct {v2, p0}, Lcom/mediatek/settings/MultipleSimActivity$4;-><init>(Lcom/mediatek/settings/MultipleSimActivity;)V

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    goto :goto_1

    .line 682
    :sswitch_2
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v3, Lcom/mediatek/settings/MultipleSimActivity$5;

    invoke-direct {v3, p0}, Lcom/mediatek/settings/MultipleSimActivity$5;-><init>(Lcom/mediatek/settings/MultipleSimActivity;)V

    invoke-virtual {v2, v5, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    move-object v2, v0

    .line 687
    check-cast v2, Landroid/app/AlertDialog;

    iget-object v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mImage:Landroid/widget/ImageView;

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog;->setView(Landroid/view/View;)V

    .line 688
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d002f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 689
    new-instance v2, Lcom/mediatek/settings/MultipleSimActivity$6;

    invoke-direct {v2, p0}, Lcom/mediatek/settings/MultipleSimActivity$6;-><init>(Lcom/mediatek/settings/MultipleSimActivity;)V

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    goto/16 :goto_1

    .line 637
    :sswitch_data_0
    .sparse-switch
        0x64 -> :sswitch_0
        0xc8 -> :sswitch_1
        0x12c -> :sswitch_2
    .end sparse-switch
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    .line 753
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 754
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPreCheckForRunning:Lcom/mediatek/settings/PreCheckForRunning;

    if-eqz v0, :cond_0

    .line 755
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPreCheckForRunning:Lcom/mediatek/settings/PreCheckForRunning;

    invoke-virtual {v0}, Lcom/mediatek/settings/PreCheckForRunning;->deRegister()V

    .line 757
    :cond_0
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mReceiver:Lcom/mediatek/settings/MultipleSimActivity$MultipleSimReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/MultipleSimActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 758
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    if-eqz v0, :cond_1

    .line 759
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 762
    :cond_1
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 258
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 259
    .local v0, itemId:I
    packed-switch v0, :pswitch_data_0

    .line 266
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 261
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->finish()V

    .line 262
    const/4 v1, 0x1

    goto :goto_0

    .line 259
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 11
    .parameter "preference"
    .parameter "newValue"

    .prologue
    const/16 v10, 0x12c

    const/16 v9, 0xc8

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 580
    iget-object v4, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPref2CardSlot:Ljava/util/HashMap;

    invoke-virtual {v4, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 582
    .local v3, slotId:I
    const-string v4, "MultipleSimActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[slotId = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 583
    const-string v4, "MultipleSimActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[newValue = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 584
    const-string v4, "MultipleSimActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[key = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 585
    const-string v4, "MultipleSimActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[mFeatureName = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/mediatek/settings/MultipleSimActivity;->mFeatureName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 586
    const-string v4, "VT"

    iget-object v5, p0, Lcom/mediatek/settings/MultipleSimActivity;->mFeatureName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 587
    invoke-static {v3}, Lcom/mediatek/phone/vt/VTCallUtils;->checkVTFile(I)V

    .line 588
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "button_vt_replace_expand_key_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 590
    iput v7, p0, Lcom/mediatek/settings/MultipleSimActivity;->mVTWhichToSave:I

    .line 591
    iput v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mVTSimId:I

    .line 592
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "0"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 593
    invoke-static {}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathDefault()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4, v10}, Lcom/mediatek/settings/MultipleSimActivity;->showDialogPic(Ljava/lang/String;I)V

    .line 624
    .end local p2
    :cond_0
    :goto_0
    return v8

    .line 594
    .restart local p2
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "2"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 595
    invoke-static {v3}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4, v9}, Lcom/mediatek/settings/MultipleSimActivity;->showDialogPic(Ljava/lang/String;I)V

    goto :goto_0

    .line 598
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "button_vt_replace_peer_expand_key_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 600
    iput v3, p0, Lcom/mediatek/settings/MultipleSimActivity;->mVTSimId:I

    .line 601
    iput v8, p0, Lcom/mediatek/settings/MultipleSimActivity;->mVTWhichToSave:I

    .line 602
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "0"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 603
    invoke-static {}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathDefault2()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4, v10}, Lcom/mediatek/settings/MultipleSimActivity;->showDialogPic(Ljava/lang/String;I)V

    goto :goto_0

    .line 604
    :cond_3
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "1"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 605
    invoke-static {v3}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect2(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4, v9}, Lcom/mediatek/settings/MultipleSimActivity;->showDialogPic(Ljava/lang/String;I)V

    goto :goto_0

    .line 609
    :cond_4
    const-string v4, "NETWORK_MODE"

    iget-object v5, p0, Lcom/mediatek/settings/MultipleSimActivity;->mFeatureName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 610
    iget-object v4, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-direct {p0, v3}, Lcom/mediatek/settings/MultipleSimActivity;->getNetworkModeName(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v7}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    .line 612
    .local v2, settingsNetworkMode:I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Current network mode = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/mediatek/settings/MultipleSimActivity;->log(Ljava/lang/String;)V

    .line 613
    check-cast p2, Ljava/lang/String;

    .end local p2
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p0, v4, v3}, Lcom/mediatek/settings/MultipleSimActivity;->getNetworkMode(II)I

    move-result v1

    .line 614
    .local v1, networkMode:I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "new network mode = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/mediatek/settings/MultipleSimActivity;->log(Ljava/lang/String;)V

    .line 615
    if-eq v2, v1, :cond_0

    .line 616
    new-instance v0, Landroid/content/Intent;

    const-string v4, "com.android.phone.NETWORK_MODE_CHANGE"

    const/4 v5, 0x0

    invoke-direct {v0, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 617
    .local v0, intent:Landroid/content/Intent;
    const-string v4, "com.android.phone.OLD_NETWORK_MODE"

    invoke-virtual {v0, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 618
    const-string v4, "com.android.phone.NETWORK_MODE_CHANGE"

    invoke-virtual {v0, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 619
    const-string v4, "simId"

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 620
    const/16 v4, 0x64

    invoke-virtual {p0, v4}, Lcom/mediatek/settings/MultipleSimActivity;->showDialog(I)V

    .line 621
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/MultipleSimActivity;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 10
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v9, 0x0

    .line 466
    invoke-virtual {p0}, Lcom/mediatek/settings/MultipleSimActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v5

    .line 468
    .local v5, prefSet:Landroid/preference/PreferenceScreen;
    const/4 v0, 0x0

    .line 469
    .local v0, dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPhone:Lcom/android/internal/telephony/Phone;

    instance-of v7, v7, Lcom/android/internal/telephony/gemini/GeminiPhone;

    if-eqz v7, :cond_0

    .line 470
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPhone:Lcom/android/internal/telephony/Phone;

    .end local v0           #dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 473
    .restart local v0       #dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    :cond_0
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {v5}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v7

    if-ge v1, v7, :cond_3

    .line 474
    invoke-virtual {v5, v1}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v7

    if-ne p2, v7, :cond_2

    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    if-eqz v7, :cond_2

    if-eqz v0, :cond_2

    .line 476
    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity;->mPref2CardSlot:Ljava/util/HashMap;

    invoke-virtual {v7, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 477
    .local v6, slotId:I
    invoke-virtual {v0, v6}, Lcom/android/internal/telephony/gemini/GeminiPhone;->isRadioOnGemini(I)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 478
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 479
    .local v2, intent:Landroid/content/Intent;
    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    const/16 v8, 0x2e

    invoke-virtual {v7, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    .line 480
    .local v4, position:I
    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    invoke-virtual {v7, v9, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 481
    .local v3, pkName:Ljava/lang/String;
    const-string v7, "com.mediatek.settings"

    const-string v8, "com.android.phone"

    invoke-virtual {v3, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 482
    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    invoke-virtual {v2, v3, v7}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 483
    const-string v7, "android.intent.action.MAIN"

    invoke-virtual {v2, v7}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 484
    const-string v7, "simId"

    invoke-virtual {v2, v7, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 485
    const-string v7, "sub_title_name"

    invoke-static {p0, v6}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v8

    iget-object v8, v8, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v2, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 487
    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity;->mFeatureName:Ljava/lang/String;

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity;->mFeatureName:Ljava/lang/String;

    const-string v8, "VT"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 488
    const-string v7, "ISVT"

    const/4 v8, 0x1

    invoke-virtual {v2, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 494
    :cond_1
    iget-object v7, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTargetClass:Ljava/lang/String;

    invoke-virtual {v2, v3, v7}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 495
    invoke-direct {p0, v6, v2}, Lcom/mediatek/settings/MultipleSimActivity;->checkToStart(ILandroid/content/Intent;)V

    .line 473
    .end local v2           #intent:Landroid/content/Intent;
    .end local v3           #pkName:Ljava/lang/String;
    .end local v4           #position:I
    .end local v6           #slotId:I
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 500
    :cond_3
    return v9
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    const/4 v1, -0x1

    .line 281
    const-string v0, "-----------[onRestoreInstanceState]-----------"

    invoke-direct {p0, v0}, Lcom/mediatek/settings/MultipleSimActivity;->log(Ljava/lang/String;)V

    .line 282
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 283
    const-string v0, "INIT_TITLE_NAME"

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTitleName:I

    .line 284
    const-string v0, "LIST_TITLE_NAME"

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mListTitle:I

    .line 285
    const-string v0, "INIT_ARRAY"

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mListEntries:I

    .line 286
    const-string v0, "INIT_ARRAY_VALUE"

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mListValues:I

    .line 287
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 248
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 249
    invoke-direct {p0}, Lcom/mediatek/settings/MultipleSimActivity;->updatePreferenceList()V

    .line 250
    invoke-direct {p0}, Lcom/mediatek/settings/MultipleSimActivity;->updatePreferenceEnableState()V

    .line 251
    iget v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTitleName:I

    if-lez v0, :cond_0

    .line 252
    iget v0, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTitleName:I

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/MultipleSimActivity;->setTitle(I)V

    .line 254
    :cond_0
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 271
    const-string v0, "-----------[onSaveInstanceState]-----------"

    invoke-direct {p0, v0}, Lcom/mediatek/settings/MultipleSimActivity;->log(Ljava/lang/String;)V

    .line 272
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 273
    const-string v0, "INIT_TITLE_NAME"

    iget v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mTitleName:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 274
    const-string v0, "LIST_TITLE_NAME"

    iget v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mListTitle:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 275
    const-string v0, "INIT_ARRAY"

    iget v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mListEntries:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 276
    const-string v0, "INIT_ARRAY_VALUE"

    iget v1, p0, Lcom/mediatek/settings/MultipleSimActivity;->mListValues:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 277
    return-void
.end method
