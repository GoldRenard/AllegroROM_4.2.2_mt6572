.class public Lcom/mediatek/settings/CellBroadcastSettings;
.super Lcom/android/phone/TimeConsumingPreferenceActivity;
.source "CellBroadcastSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/CellBroadcastSettings$MyHandler;
    }
.end annotation


# static fields
.field private static final CB_MAX_CHANNEL:I = 0xffff

.field private static final CHANNEL_NAME_LENGTH:I = 0x14

.field private static final CHANNEL_URI:Landroid/net/Uri; = null

.field private static final CHANNEL_URI1:Landroid/net/Uri; = null

.field private static final CHANNEL_URI2:Landroid/net/Uri; = null

.field private static final CHANNEL_URI3:Landroid/net/Uri; = null

.field private static final DBG:Z = true

.field public static final DEFAULT_SIM:I = 0x2

.field private static final ENABLE:Ljava/lang/String; = "enable"

.field private static final KEYID:Ljava/lang/String; = "_id"

.field private static final KEY_ADD_CHANNEL:Ljava/lang/String; = "button_add_channel"

.field private static final KEY_CHANNEL_LIST:Ljava/lang/String; = "menu_channel_list"

.field private static final KEY_LANGUAGE:Ljava/lang/String; = "button_language"

.field private static final LANGUAGE_NUM:I = 0x16

.field private static final LOG_TAG:Ljava/lang/String; = "Settings/CellBroadcastSettings"

.field private static final MENU_CHANNEL_DELETE:I = 0xc

.field private static final MENU_CHANNEL_EDIT:I = 0xb

.field private static final MENU_CHANNEL_ENABLE_DISABLE:I = 0xa

.field private static final MESSAGE_GET_CONFIG:I = 0x64

.field private static final MESSAGE_SET_CONFIG:I = 0x65

.field private static final NAME:Ljava/lang/String; = "name"

.field private static final NUMBER:Ljava/lang/String; = "number"


# instance fields
.field private mAddChannelPreference:Landroid/preference/PreferenceScreen;

.field private mChannelArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mediatek/settings/CellBroadcastChannel;",
            ">;"
        }
    .end annotation
.end field

.field private mChannelListPreference:Landroid/preference/PreferenceCategory;

.field private mChannelMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mediatek/settings/CellBroadcastChannel;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Lcom/mediatek/settings/CellBroadcastSettings$MyHandler;

.field private mLanguageList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mediatek/settings/CellBroadcastLanguage;",
            ">;"
        }
    .end annotation
.end field

.field private mLanguageMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mediatek/settings/CellBroadcastLanguage;",
            ">;"
        }
    .end annotation
.end field

.field private mLanguagePreference:Landroid/preference/PreferenceScreen;

.field private mPhone:Lcom/android/internal/telephony/Phone;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mSimId:I

.field private mUri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 106
    const-string v0, "content://cb/channel"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mediatek/settings/CellBroadcastSettings;->CHANNEL_URI:Landroid/net/Uri;

    .line 107
    const-string v0, "content://cb/channel1"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mediatek/settings/CellBroadcastSettings;->CHANNEL_URI1:Landroid/net/Uri;

    .line 108
    const-string v0, "content://cb/channel2"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mediatek/settings/CellBroadcastSettings;->CHANNEL_URI2:Landroid/net/Uri;

    .line 109
    const-string v0, "content://cb/channel3"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mediatek/settings/CellBroadcastSettings;->CHANNEL_URI3:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/android/phone/TimeConsumingPreferenceActivity;-><init>()V

    .line 111
    sget-object v0, Lcom/mediatek/settings/CellBroadcastSettings;->CHANNEL_URI:Landroid/net/Uri;

    iput-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mUri:Landroid/net/Uri;

    .line 117
    new-instance v0, Lcom/mediatek/settings/CellBroadcastSettings$MyHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mediatek/settings/CellBroadcastSettings$MyHandler;-><init>(Lcom/mediatek/settings/CellBroadcastSettings;Lcom/mediatek/settings/CellBroadcastSettings$1;)V

    iput-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mHandler:Lcom/mediatek/settings/CellBroadcastSettings$MyHandler;

    .line 122
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;

    .line 124
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    .line 128
    const/4 v0, 0x2

    iput v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mSimId:I

    .line 130
    new-instance v0, Lcom/mediatek/settings/CellBroadcastSettings$1;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/CellBroadcastSettings$1;-><init>(Lcom/mediatek/settings/CellBroadcastSettings;)V

    iput-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 595
    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/settings/CellBroadcastSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->setScreenEnabled()V

    return-void
.end method

.method static synthetic access$1000(Lcom/mediatek/settings/CellBroadcastSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->updateChannelUIList()V

    return-void
.end method

.method static synthetic access$1100(Lcom/mediatek/settings/CellBroadcastSettings;[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CellBroadcastSettings;->setCellBroadcastConfig([Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/mediatek/settings/CellBroadcastSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->showUpdateDBErrorInfoDialog()V

    return-void
.end method

.method static synthetic access$1300(Lcom/mediatek/settings/CellBroadcastSettings;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CellBroadcastSettings;->displayMessage(I)V

    return-void
.end method

.method static synthetic access$1400(Lcom/mediatek/settings/CellBroadcastSettings;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CellBroadcastSettings;->displayMessage(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/mediatek/settings/CellBroadcastSettings;II)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 84
    invoke-direct {p0, p1, p2}, Lcom/mediatek/settings/CellBroadcastSettings;->checkChannelIdExist(II)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1600(Lcom/mediatek/settings/CellBroadcastSettings;Lcom/mediatek/settings/CellBroadcastChannel;Lcom/mediatek/settings/CellBroadcastChannel;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 84
    invoke-direct {p0, p1, p2}, Lcom/mediatek/settings/CellBroadcastSettings;->updateChannelToDatabase(Lcom/mediatek/settings/CellBroadcastChannel;Lcom/mediatek/settings/CellBroadcastChannel;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1700(Lcom/mediatek/settings/CellBroadcastSettings;)Landroid/preference/PreferenceScreen;
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguagePreference:Landroid/preference/PreferenceScreen;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/mediatek/settings/CellBroadcastSettings;)Landroid/preference/PreferenceScreen;
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mAddChannelPreference:Landroid/preference/PreferenceScreen;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/mediatek/settings/CellBroadcastSettings;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->queryChannelFromDatabase()Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/mediatek/settings/CellBroadcastSettings;Lcom/mediatek/settings/CellBroadcastChannel;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CellBroadcastSettings;->showEditChannelDialog(Lcom/mediatek/settings/CellBroadcastChannel;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/mediatek/settings/CellBroadcastSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->initChannelMap()V

    return-void
.end method

.method static synthetic access$2100(Lcom/mediatek/settings/CellBroadcastSettings;Ljava/util/ArrayList;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CellBroadcastSettings;->updateCurrentChannelAndLanguage(Ljava/util/ArrayList;)V

    return-void
.end method

.method static synthetic access$2200(Lcom/mediatek/settings/CellBroadcastSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->updateLanguageSummary()V

    return-void
.end method

.method static synthetic access$2300(Lcom/mediatek/settings/CellBroadcastSettings;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CellBroadcastSettings;->getCellBroadcastConfig(Z)V

    return-void
.end method

.method static synthetic access$2400(Lcom/mediatek/settings/CellBroadcastSettings;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/mediatek/settings/CellBroadcastSettings;)[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->makeLanguageConfigArray()[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/mediatek/settings/CellBroadcastSettings;Ljava/lang/String;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CellBroadcastSettings;->checkChannelName(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/mediatek/settings/CellBroadcastSettings;Ljava/lang/String;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CellBroadcastSettings;->checkChannelNumber(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/mediatek/settings/CellBroadcastSettings;I)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CellBroadcastSettings;->checkChannelIdExist(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lcom/mediatek/settings/CellBroadcastSettings;Lcom/mediatek/settings/CellBroadcastChannel;)[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CellBroadcastSettings;->makeChannelConfigArray(Lcom/mediatek/settings/CellBroadcastChannel;)[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lcom/mediatek/settings/CellBroadcastSettings;Lcom/mediatek/settings/CellBroadcastChannel;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CellBroadcastSettings;->insertChannelToDatabase(Lcom/mediatek/settings/CellBroadcastChannel;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$800(Lcom/mediatek/settings/CellBroadcastSettings;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$900(Lcom/mediatek/settings/CellBroadcastSettings;)Ljava/util/HashMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelMap:Ljava/util/HashMap;

    return-object v0
.end method

.method private checkChannelIdExist(I)Z
    .locals 3
    .parameter "channelId"

    .prologue
    .line 947
    iget-object v2, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 948
    .local v1, length:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 949
    iget-object v2, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/settings/CellBroadcastChannel;

    invoke-virtual {v2}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelId()I

    move-result v2

    if-ne v2, p1, :cond_0

    .line 950
    const/4 v2, 0x1

    .line 953
    :goto_1
    return v2

    .line 948
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 953
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private checkChannelIdExist(II)Z
    .locals 6
    .parameter "newChannelId"
    .parameter "keyId"

    .prologue
    .line 957
    iget-object v5, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 958
    .local v1, length:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 959
    iget-object v5, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/settings/CellBroadcastChannel;

    .line 960
    .local v2, tChannel:Lcom/mediatek/settings/CellBroadcastChannel;
    invoke-virtual {v2}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelId()I

    move-result v3

    .line 961
    .local v3, tempChannelId:I
    invoke-virtual {v2}, Lcom/mediatek/settings/CellBroadcastChannel;->getKeyId()I

    move-result v4

    .line 962
    .local v4, tempKeyId:I
    if-ne v3, p1, :cond_0

    if-eq v4, p2, :cond_0

    .line 963
    const/4 v5, 0x1

    .line 966
    .end local v2           #tChannel:Lcom/mediatek/settings/CellBroadcastChannel;
    .end local v3           #tempChannelId:I
    .end local v4           #tempKeyId:I
    :goto_1
    return v5

    .line 958
    .restart local v2       #tChannel:Lcom/mediatek/settings/CellBroadcastChannel;
    .restart local v3       #tempChannelId:I
    .restart local v4       #tempKeyId:I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 966
    .end local v2           #tChannel:Lcom/mediatek/settings/CellBroadcastChannel;
    .end local v3           #tempChannelId:I
    .end local v4           #tempKeyId:I
    :cond_1
    const/4 v5, 0x0

    goto :goto_1
.end method

.method private checkChannelName(Ljava/lang/String;)Z
    .locals 2
    .parameter "name"

    .prologue
    .line 926
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 927
    :cond_0
    const-string p1, ""

    .line 929
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x14

    if-le v0, v1, :cond_2

    .line 930
    const/4 v0, 0x0

    .line 932
    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private checkChannelNumber(Ljava/lang/String;)Z
    .locals 3
    .parameter "number"

    .prologue
    const/4 v1, 0x0

    .line 936
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 943
    :cond_0
    :goto_0
    return v1

    .line 939
    :cond_1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 940
    .local v0, t:I
    const v2, 0xffff

    if-ge v0, v2, :cond_0

    if-ltz v0, :cond_0

    .line 943
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private clearChannel()V
    .locals 1

    .prologue
    .line 466
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 467
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 469
    :cond_0
    return-void
.end method

.method private deleteChannelFromDatabase(Lcom/mediatek/settings/CellBroadcastChannel;)Z
    .locals 5
    .parameter "oldChannel"

    .prologue
    .line 514
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "number="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 516
    .local v1, where:Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mUri:Landroid/net/Uri;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v1, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 520
    const/4 v2, 0x1

    :goto_0
    return v2

    .line 517
    :catch_0
    move-exception v0

    .line 518
    .local v0, e:Ljava/lang/IllegalArgumentException;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private displayMessage(I)V
    .locals 2
    .parameter "strId"

    .prologue
    .line 856
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/CellBroadcastSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 857
    return-void
.end method

.method private displayMessage(Ljava/lang/String;)V
    .locals 1
    .parameter "str"

    .prologue
    .line 860
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 861
    return-void
.end method

.method private dumpConfigInfo(Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;)V
    .locals 3
    .parameter "info"

    .prologue
    .line 587
    const-string v0, "Settings/CellBroadcastSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dump start for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 588
    const-string v0, "Settings/CellBroadcastSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FromServiceId "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;->getFromServiceId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  ToServiceId "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;->getToServiceId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 590
    const-string v0, "Settings/CellBroadcastSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FromCodeId "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;->getFromCodeScheme()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  ToCodeId "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;->getToCodeScheme()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 592
    const-string v0, "Settings/CellBroadcastSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dump end for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 593
    return-void
.end method

.method private getCellBroadcastConfig(Z)V
    .locals 6
    .parameter "reason"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    const/16 v3, 0x64

    .line 291
    if-eqz p1, :cond_1

    .line 292
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mHandler:Lcom/mediatek/settings/CellBroadcastSettings$MyHandler;

    invoke-virtual {v1, v3, v4, v3, v5}, Lcom/mediatek/settings/CellBroadcastSettings$MyHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 297
    .local v0, msg:Landroid/os/Message;
    :goto_0
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 298
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v2, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mSimId:I

    invoke-virtual {v1, v0, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getCellBroadcastSmsConfigGemini(Landroid/os/Message;I)V

    .line 303
    :goto_1
    if-eqz p1, :cond_0

    .line 304
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguagePreference:Landroid/preference/PreferenceScreen;

    invoke-virtual {p0, v1, p1}, Lcom/mediatek/settings/CellBroadcastSettings;->onStarted(Landroid/preference/Preference;Z)V

    .line 306
    :cond_0
    return-void

    .line 294
    .end local v0           #msg:Landroid/os/Message;
    :cond_1
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mHandler:Lcom/mediatek/settings/CellBroadcastSettings$MyHandler;

    const/16 v2, 0x65

    invoke-virtual {v1, v3, v4, v2, v5}, Lcom/mediatek/settings/CellBroadcastSettings$MyHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .restart local v0       #msg:Landroid/os/Message;
    goto :goto_0

    .line 300
    :cond_2
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1, v0}, Lcom/android/internal/telephony/Phone;->getCellBroadcastSmsConfig(Landroid/os/Message;)V

    goto :goto_1
.end method

.method private getChannelObjectFromKey(Ljava/lang/String;)Lcom/mediatek/settings/CellBroadcastChannel;
    .locals 1
    .parameter "key"

    .prologue
    .line 717
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/CellBroadcastChannel;

    return-object v0
.end method

.method private getLanguageObjectFromKey(Ljava/lang/String;)Lcom/mediatek/settings/CellBroadcastLanguage;
    .locals 1
    .parameter "key"

    .prologue
    .line 713
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/CellBroadcastLanguage;

    return-object v0
.end method

.method private initChannelMap()V
    .locals 6

    .prologue
    .line 457
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelMap:Ljava/util/HashMap;

    .line 458
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 459
    .local v2, tSize:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 460
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mediatek/settings/CellBroadcastChannel;

    invoke-virtual {v3}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelId()I

    move-result v1

    .line 461
    .local v1, id:I
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelMap:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 459
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 463
    .end local v1           #id:I
    :cond_0
    return-void
.end method

.method private initLanguage()V
    .locals 0

    .prologue
    .line 708
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->initLanguageList()V

    .line 709
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->initLanguageMap()V

    .line 710
    return-void
.end method

.method private initLanguageList()V
    .locals 11

    .prologue
    const/16 v10, 0x16

    .line 682
    new-array v4, v10, [Z

    .line 683
    .local v4, languageEnable:[Z
    new-array v5, v10, [Ljava/lang/String;

    .line 684
    .local v5, languageId:[Ljava/lang/String;
    new-array v6, v10, [Ljava/lang/String;

    .line 685
    .local v6, languageName:[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f07000c

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v6

    .line 686
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f07000d

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v5

    .line 687
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v10, :cond_0

    .line 688
    aget-object v8, v5, v1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 689
    .local v2, id:I
    aget-object v7, v6, v1

    .line 690
    .local v7, name:Ljava/lang/String;
    aget-boolean v0, v4, v1

    .line 691
    .local v0, enable:Z
    new-instance v3, Lcom/mediatek/settings/CellBroadcastLanguage;

    invoke-direct {v3, v2, v7, v0}, Lcom/mediatek/settings/CellBroadcastLanguage;-><init>(ILjava/lang/String;Z)V

    .line 692
    .local v3, language:Lcom/mediatek/settings/CellBroadcastLanguage;
    iget-object v8, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 687
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 694
    .end local v0           #enable:Z
    .end local v2           #id:I
    .end local v3           #language:Lcom/mediatek/settings/CellBroadcastLanguage;
    .end local v7           #name:Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private initLanguageMap()V
    .locals 5

    .prologue
    .line 697
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageMap:Ljava/util/HashMap;

    .line 698
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    const/16 v3, 0x16

    if-ge v0, v3, :cond_1

    .line 699
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/settings/CellBroadcastLanguage;

    .line 700
    .local v2, language:Lcom/mediatek/settings/CellBroadcastLanguage;
    if-eqz v2, :cond_0

    .line 701
    invoke-virtual {v2}, Lcom/mediatek/settings/CellBroadcastLanguage;->getLanguageId()I

    move-result v1

    .line 702
    .local v1, id:I
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageMap:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 698
    .end local v1           #id:I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 705
    .end local v2           #language:Lcom/mediatek/settings/CellBroadcastLanguage;
    :cond_1
    return-void
.end method

.method private initPreference()V
    .locals 1

    .prologue
    .line 188
    const-string v0, "button_language"

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CellBroadcastSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceScreen;

    iput-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguagePreference:Landroid/preference/PreferenceScreen;

    .line 189
    const-string v0, "button_add_channel"

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CellBroadcastSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceScreen;

    iput-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mAddChannelPreference:Landroid/preference/PreferenceScreen;

    .line 190
    const-string v0, "menu_channel_list"

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CellBroadcastSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceCategory;

    iput-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelListPreference:Landroid/preference/PreferenceCategory;

    .line 191
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguagePreference:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0, p0}, Landroid/preference/PreferenceScreen;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 192
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mAddChannelPreference:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0, p0}, Landroid/preference/PreferenceScreen;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 193
    return-void
.end method

.method private insertChannelToDatabase(Lcom/mediatek/settings/CellBroadcastChannel;)Z
    .locals 7
    .parameter "channel"

    .prologue
    .line 268
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 269
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "name"

    invoke-virtual {p1}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    const-string v4, "number"

    invoke-virtual {p1}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 271
    const-string v4, "enable"

    invoke-virtual {p1}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelState()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 273
    :try_start_0
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mUri:Landroid/net/Uri;

    invoke-virtual {v4, v5, v3}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v2

    .line 274
    .local v2, uri:Landroid/net/Uri;
    invoke-virtual {v2}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 275
    .local v1, insertId:I
    invoke-virtual {p1, v1}, Lcom/mediatek/settings/CellBroadcastChannel;->setKeyId(I)V

    .line 276
    const-string v4, "Settings/CellBroadcastSettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "insertChannelToDatabase(), insertId: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 280
    const/4 v4, 0x1

    .end local v1           #insertId:I
    .end local v2           #uri:Landroid/net/Uri;
    :goto_0
    return v4

    .line 277
    :catch_0
    move-exception v0

    .line 278
    .local v0, e:Ljava/lang/IllegalArgumentException;
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private makeChannelConfigArray(Lcom/mediatek/settings/CellBroadcastChannel;)[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    .locals 8
    .parameter "channel"

    .prologue
    const/4 v3, -0x1

    .line 378
    const/4 v0, 0x1

    new-array v6, v0, [Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    .line 379
    .local v6, objectList:[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    invoke-virtual {p1}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelId()I

    move-result v1

    .line 380
    .local v1, tChannelId:I
    const/4 v7, 0x0

    new-instance v0, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    invoke-virtual {p1}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelState()Z

    move-result v5

    move v2, v1

    move v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;-><init>(IIIIZ)V

    aput-object v0, v6, v7

    .line 381
    return-object v6
.end method

.method private makeLanguageConfigArray()[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    .locals 13

    .prologue
    const/4 v3, -0x2

    const/4 v5, 0x1

    const/4 v1, -0x1

    .line 819
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 821
    .local v7, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;>;"
    iget-object v2, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;

    const/4 v12, 0x0

    invoke-virtual {v2, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/settings/CellBroadcastLanguage;

    invoke-virtual {v2}, Lcom/mediatek/settings/CellBroadcastLanguage;->getLanguageState()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 822
    new-instance v0, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    move v2, v1

    move v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;-><init>(IIIIZ)V

    .line 823
    .local v0, cBConfig:Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 852
    .end local v0           #cBConfig:Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    :cond_0
    :goto_0
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    return-object v1

    .line 825
    :cond_1
    iget-object v2, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/settings/CellBroadcastLanguage;

    invoke-virtual {v2}, Lcom/mediatek/settings/CellBroadcastLanguage;->getLanguageId()I

    move-result v3

    .line 826
    .local v3, beginId:I
    move v4, v3

    .line 827
    .local v4, endId:I
    iget-object v2, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/settings/CellBroadcastLanguage;

    invoke-virtual {v2}, Lcom/mediatek/settings/CellBroadcastLanguage;->getLanguageState()Z

    move-result v5

    .line 828
    .local v5, beginState:Z
    const/4 v6, 0x2

    .line 829
    .local v6, i:I
    iget-object v2, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v9

    .line 830
    .local v9, tSize:I
    const/4 v6, 0x2

    :goto_1
    if-ge v6, v9, :cond_3

    .line 831
    iget-object v2, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/mediatek/settings/CellBroadcastLanguage;

    .line 832
    .local v8, tLanguage:Lcom/mediatek/settings/CellBroadcastLanguage;
    invoke-virtual {v8}, Lcom/mediatek/settings/CellBroadcastLanguage;->getLanguageId()I

    move-result v10

    .line 833
    .local v10, tempId:I
    invoke-virtual {v8}, Lcom/mediatek/settings/CellBroadcastLanguage;->getLanguageState()Z

    move-result v11

    .line 834
    .local v11, tempState:Z
    add-int/lit8 v2, v4, 0x1

    if-ne v10, v2, :cond_2

    if-ne v5, v11, :cond_2

    .line 835
    move v4, v10

    .line 830
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 837
    :cond_2
    new-instance v0, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    move v2, v1

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;-><init>(IIIIZ)V

    .line 838
    .restart local v0       #cBConfig:Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 839
    move v3, v10

    .line 840
    move v4, v10

    .line 841
    move v5, v11

    goto :goto_2

    .line 845
    .end local v0           #cBConfig:Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    .end local v8           #tLanguage:Lcom/mediatek/settings/CellBroadcastLanguage;
    .end local v10           #tempId:I
    .end local v11           #tempState:Z
    :cond_3
    iget-object v2, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ne v6, v2, :cond_0

    .line 846
    iget-object v2, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;

    add-int/lit8 v12, v6, -0x1

    invoke-virtual {v2, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/settings/CellBroadcastLanguage;

    invoke-virtual {v2}, Lcom/mediatek/settings/CellBroadcastLanguage;->getLanguageId()I

    move-result v4

    .line 847
    new-instance v0, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    move v2, v1

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;-><init>(IIIIZ)V

    .line 848
    .restart local v0       #cBConfig:Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private queryChannelFromDatabase()Z
    .locals 11

    .prologue
    const/4 v3, 0x3

    const/4 v1, 0x2

    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 472
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->clearChannel()V

    .line 473
    const/4 v0, 0x4

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v10

    const-string v0, "name"

    aput-object v0, v2, v9

    const-string v0, "number"

    aput-object v0, v2, v1

    const-string v0, "enable"

    aput-object v0, v2, v3

    .line 475
    .local v2, projection:[Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mUri:Landroid/net/Uri;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 476
    .local v7, cursor:Landroid/database/Cursor;
    if-eqz v7, :cond_2

    .line 477
    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 478
    new-instance v6, Lcom/mediatek/settings/CellBroadcastChannel;

    invoke-direct {v6}, Lcom/mediatek/settings/CellBroadcastChannel;-><init>()V

    .line 479
    .local v6, channel:Lcom/mediatek/settings/CellBroadcastChannel;
    const/4 v0, 0x2

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {v6, v0}, Lcom/mediatek/settings/CellBroadcastChannel;->setChannelId(I)V

    .line 480
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {v6, v0}, Lcom/mediatek/settings/CellBroadcastChannel;->setKeyId(I)V

    .line 481
    const/4 v0, 0x1

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Lcom/mediatek/settings/CellBroadcastChannel;->setChannelName(Ljava/lang/String;)V

    .line 482
    const/4 v0, 0x3

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-ne v0, v9, :cond_0

    move v0, v9

    :goto_1
    invoke-virtual {v6, v0}, Lcom/mediatek/settings/CellBroadcastChannel;->setChannelState(Z)V

    .line 483
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 487
    .end local v6           #channel:Lcom/mediatek/settings/CellBroadcastChannel;
    .end local v7           #cursor:Landroid/database/Cursor;
    :catch_0
    move-exception v8

    .local v8, e:Ljava/lang/IllegalArgumentException;
    move v0, v10

    .line 490
    .end local v8           #e:Ljava/lang/IllegalArgumentException;
    :goto_2
    return v0

    .restart local v6       #channel:Lcom/mediatek/settings/CellBroadcastChannel;
    .restart local v7       #cursor:Landroid/database/Cursor;
    :cond_0
    move v0, v10

    .line 482
    goto :goto_1

    .line 485
    .end local v6           #channel:Lcom/mediatek/settings/CellBroadcastChannel;
    :cond_1
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    move v0, v9

    .line 490
    goto :goto_2
.end method

.method private requestInputMethod(Landroid/app/Dialog;)V
    .locals 2
    .parameter "dialog"

    .prologue
    .line 385
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 386
    .local v0, window:Landroid/view/Window;
    const/16 v1, 0x15

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 388
    return-void
.end method

.method private setCellBroadcastConfig([Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;)V
    .locals 5
    .parameter "objectList"

    .prologue
    const/16 v4, 0x65

    const/4 v3, 0x0

    .line 807
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mHandler:Lcom/mediatek/settings/CellBroadcastSettings$MyHandler;

    const/4 v2, 0x0

    invoke-virtual {v1, v4, v3, v4, v2}, Lcom/mediatek/settings/CellBroadcastSettings$MyHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 808
    .local v0, msg:Landroid/os/Message;
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 809
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v2, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mSimId:I

    invoke-virtual {v1, p1, p1, v0, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setCellBroadcastSmsConfigGemini([Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;Landroid/os/Message;I)V

    .line 814
    :goto_0
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguagePreference:Landroid/preference/PreferenceScreen;

    invoke-virtual {p0, v1, v3}, Lcom/mediatek/settings/CellBroadcastSettings;->onStarted(Landroid/preference/Preference;Z)V

    .line 815
    return-void

    .line 811
    :cond_0
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1, p1, p1, v0}, Lcom/android/internal/telephony/Phone;->setCellBroadcastSmsConfig([Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;Landroid/os/Message;)V

    goto :goto_0
.end method

.method private setLanguageSummary([Z)V
    .locals 8
    .parameter "temp"

    .prologue
    const/4 v7, 0x0

    .line 234
    if-nez p1, :cond_0

    .line 265
    :goto_0
    return-void

    .line 237
    :cond_0
    const/4 v0, 0x1

    .line 238
    .local v0, allLanguagesFlag:Z
    array-length v5, p1

    .line 239
    .local v5, tLength:I
    const/4 v2, 0x1

    .local v2, i:I
    :goto_1
    if-ge v2, v5, :cond_1

    .line 240
    aget-boolean v6, p1, v2

    if-nez v6, :cond_2

    .line 241
    const/4 v0, 0x0

    .line 245
    :cond_1
    aput-boolean v0, p1, v7

    .line 246
    aget-boolean v6, p1, v7

    if-eqz v6, :cond_3

    .line 247
    iget-object v6, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguagePreference:Landroid/preference/PreferenceScreen;

    const v7, 0x7f0d00dd

    invoke-virtual {v6, v7}, Landroid/preference/PreferenceScreen;->setSummary(I)V

    goto :goto_0

    .line 239
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 250
    :cond_3
    const/4 v1, 0x0

    .line 251
    .local v1, flag:I
    const-string v4, ""

    .line 252
    .local v4, summary:Ljava/lang/String;
    const/4 v3, -0x1

    .line 253
    .local v3, lastIndex:I
    const/4 v2, 0x1

    :goto_2
    if-ge v2, v5, :cond_5

    .line 254
    aget-boolean v6, p1, v2

    if-eqz v6, :cond_4

    const/4 v6, 0x2

    if-ge v1, v6, :cond_4

    .line 255
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v6, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mediatek/settings/CellBroadcastLanguage;

    invoke-virtual {v6}, Lcom/mediatek/settings/CellBroadcastLanguage;->getLanguageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 256
    add-int/lit8 v1, v1, 0x1

    .line 257
    move v3, v2

    .line 259
    :cond_4
    aget-boolean v6, p1, v2

    if-eqz v6, :cond_6

    if-le v2, v3, :cond_6

    const/4 v6, -0x1

    if-eq v3, v6, :cond_6

    .line 260
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ..."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 264
    :cond_5
    iget-object v6, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguagePreference:Landroid/preference/PreferenceScreen;

    invoke-virtual {v6, v4}, Landroid/preference/PreferenceScreen;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 253
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_2
.end method

.method private setScreenEnabled()V
    .locals 3

    .prologue
    .line 970
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 971
    .local v0, insertSim:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 972
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->finish()V

    .line 978
    :cond_0
    :goto_0
    return-void

    .line 973
    :cond_1
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 974
    iget v2, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mSimId:I

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/provider/Telephony$SIMInfo;

    iget v1, v1, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    if-eq v2, v1, :cond_0

    .line 975
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->finish()V

    goto :goto_0
.end method

.method private showAddChannelDialog()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 320
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    .line 321
    .local v2, inflater:Landroid/view/LayoutInflater;
    const v4, 0x7f04002f

    invoke-virtual {v2, v4, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 323
    .local v3, setView:Landroid/view/View;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 324
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 325
    const v4, 0x7f0d00d0

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 326
    const v4, 0x104000a

    new-instance v5, Lcom/mediatek/settings/CellBroadcastSettings$3;

    invoke-direct {v5, p0, v3}, Lcom/mediatek/settings/CellBroadcastSettings$3;-><init>(Lcom/mediatek/settings/CellBroadcastSettings;Landroid/view/View;)V

    invoke-virtual {v0, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 369
    const/high16 v4, 0x104

    invoke-virtual {v0, v4, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 371
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 372
    .local v1, dialog:Landroid/app/AlertDialog;
    invoke-direct {p0, v1}, Lcom/mediatek/settings/CellBroadcastSettings;->requestInputMethod(Landroid/app/Dialog;)V

    .line 373
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 374
    return-void
.end method

.method private showEditChannelDialog(Lcom/mediatek/settings/CellBroadcastChannel;)V
    .locals 15
    .parameter "oldChannel"

    .prologue
    .line 391
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/settings/CellBroadcastChannel;->getKeyId()I

    move-result v12

    .line 392
    .local v12, keyId:I
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelId()I

    move-result v8

    .line 393
    .local v8, cid:I
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelName()Ljava/lang/String;

    move-result-object v9

    .line 394
    .local v9, cname:Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelState()Z

    move-result v7

    .line 395
    .local v7, checked:Z
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v11

    .line 396
    .local v11, inflater:Landroid/view/LayoutInflater;
    const v0, 0x7f04002f

    const/4 v1, 0x0

    invoke-virtual {v11, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v13

    .line 397
    .local v13, setView:Landroid/view/View;
    new-instance v6, Landroid/app/AlertDialog$Builder;

    invoke-direct {v6, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 398
    .local v6, builder:Landroid/app/AlertDialog$Builder;
    invoke-virtual {v6, v13}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 399
    const v0, 0x7f0d00d6

    invoke-virtual {v6, v0}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 400
    const v0, 0x7f0800d2

    invoke-virtual {v13, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 402
    .local v2, channelName:Landroid/widget/EditText;
    const v0, 0x7f0800d3

    invoke-virtual {v13, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 404
    .local v3, channelNum:Landroid/widget/EditText;
    const v0, 0x7f0800d4

    invoke-virtual {v13, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/CheckBox;

    .line 406
    .local v4, channelState:Landroid/widget/CheckBox;
    invoke-virtual {v2, v9}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 407
    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 408
    invoke-virtual {v4, v7}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 410
    const v14, 0x104000a

    new-instance v0, Lcom/mediatek/settings/CellBroadcastSettings$4;

    move-object v1, p0

    move-object/from16 v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/mediatek/settings/CellBroadcastSettings$4;-><init>(Lcom/mediatek/settings/CellBroadcastSettings;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/CheckBox;Lcom/mediatek/settings/CellBroadcastChannel;)V

    invoke-virtual {v6, v14, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 450
    const/high16 v0, 0x104

    const/4 v1, 0x0

    invoke-virtual {v6, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 451
    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v10

    .line 452
    .local v10, dialog:Landroid/app/AlertDialog;
    invoke-virtual {v10}, Landroid/app/AlertDialog;->show()V

    .line 453
    invoke-direct {p0, v10}, Lcom/mediatek/settings/CellBroadcastSettings;->requestInputMethod(Landroid/app/Dialog;)V

    .line 454
    return-void
.end method

.method private showLanguageSelectDialog()V
    .locals 12

    .prologue
    const/16 v8, 0x16

    const/4 v11, 0x0

    .line 721
    new-array v6, v8, [Z

    .line 722
    .local v6, temp:[Z
    new-array v7, v8, [Z

    .line 723
    .local v7, temp2:[Z
    const/4 v0, 0x1

    .line 724
    .local v0, allLanguagesFlag:Z
    const/4 v2, 0x1

    .local v2, i:I
    :goto_0
    array-length v8, v6

    if-ge v2, v8, :cond_2

    .line 725
    iget-object v8, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mediatek/settings/CellBroadcastLanguage;

    .line 726
    .local v5, tLanguage:Lcom/mediatek/settings/CellBroadcastLanguage;
    if-eqz v5, :cond_1

    .line 727
    const-string v8, "Settings/CellBroadcastSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "language status "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v5}, Lcom/mediatek/settings/CellBroadcastLanguage;->getLanguageState()Z

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 728
    invoke-virtual {v5}, Lcom/mediatek/settings/CellBroadcastLanguage;->getLanguageState()Z

    move-result v8

    aput-boolean v8, v6, v2

    .line 729
    invoke-virtual {v5}, Lcom/mediatek/settings/CellBroadcastLanguage;->getLanguageState()Z

    move-result v8

    aput-boolean v8, v7, v2

    .line 733
    :goto_1
    aget-boolean v8, v6, v2

    if-nez v8, :cond_0

    .line 734
    const/4 v0, 0x0

    .line 724
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 731
    :cond_1
    const-string v8, "Settings/CellBroadcastSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "showLanguageSelectDialog() init the language list failed when i="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 738
    .end local v5           #tLanguage:Lcom/mediatek/settings/CellBroadcastLanguage;
    :cond_2
    const-string v8, "Settings/CellBroadcastSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "All language status "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 739
    iget-object v8, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/mediatek/settings/CellBroadcastLanguage;

    invoke-virtual {v8, v0}, Lcom/mediatek/settings/CellBroadcastLanguage;->setLanguageState(Z)V

    .line 740
    aput-boolean v0, v6, v11

    .line 741
    aput-boolean v0, v7, v11

    .line 742
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 743
    .local v1, dlgBuilder:Landroid/app/AlertDialog$Builder;
    const v8, 0x7f0d00d2

    invoke-virtual {p0, v8}, Lcom/mediatek/settings/CellBroadcastSettings;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 744
    const v8, 0x7f0d0192

    new-instance v9, Lcom/mediatek/settings/CellBroadcastSettings$5;

    invoke-direct {v9, p0, v6, v7}, Lcom/mediatek/settings/CellBroadcastSettings$5;-><init>(Lcom/mediatek/settings/CellBroadcastSettings;[Z[Z)V

    invoke-virtual {v1, v8, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 774
    const v8, 0x7f0d0196

    const/4 v9, 0x0

    invoke-virtual {v1, v8, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 775
    new-instance v4, Lcom/mediatek/settings/CellBroadcastSettings$6;

    invoke-direct {v4, p0, v6}, Lcom/mediatek/settings/CellBroadcastSettings$6;-><init>(Lcom/mediatek/settings/CellBroadcastSettings;[Z)V

    .line 799
    .local v4, multiChoiceListener:Landroid/content/DialogInterface$OnMultiChoiceClickListener;
    const v8, 0x7f07000c

    invoke-virtual {v1, v8, v6, v4}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems(I[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    .line 800
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    .line 801
    .local v3, languageDialog:Landroid/app/AlertDialog;
    if-eqz v3, :cond_3

    .line 802
    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    .line 804
    :cond_3
    return-void
.end method

.method private showUpdateDBErrorInfoDialog()V
    .locals 2

    .prologue
    .line 284
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguagePreference:Landroid/preference/PreferenceScreen;

    const/16 v1, 0x12c

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/settings/CellBroadcastSettings;->onError(Landroid/preference/Preference;I)V

    .line 285
    return-void
.end method

.method private updateChannelToDatabase(Lcom/mediatek/settings/CellBroadcastChannel;Lcom/mediatek/settings/CellBroadcastChannel;)Z
    .locals 13
    .parameter "oldChannel"
    .parameter "newChannel"

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 494
    const/4 v8, 0x4

    new-array v5, v8, [Ljava/lang/String;

    const-string v8, "_id"

    aput-object v8, v5, v10

    const-string v8, "name"

    aput-object v8, v5, v9

    const/4 v8, 0x2

    const-string v11, "number"

    aput-object v11, v5, v8

    const/4 v8, 0x3

    const-string v11, "enable"

    aput-object v11, v5, v8

    .line 495
    .local v5, projection:[Ljava/lang/String;
    invoke-virtual {p2}, Lcom/mediatek/settings/CellBroadcastChannel;->getKeyId()I

    move-result v2

    .line 496
    .local v2, id:I
    invoke-virtual {p2}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelName()Ljava/lang/String;

    move-result-object v3

    .line 497
    .local v3, name:Ljava/lang/String;
    invoke-virtual {p2}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelState()Z

    move-result v1

    .line 498
    .local v1, enable:Z
    invoke-virtual {p2}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelId()I

    move-result v4

    .line 499
    .local v4, number:I
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 500
    .local v6, values:Landroid/content/ContentValues;
    const-string v8, "_id"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v6, v8, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 501
    const-string v8, "name"

    invoke-virtual {v6, v8, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 502
    const-string v8, "number"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v6, v8, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 503
    const-string v11, "enable"

    if-eqz v1, :cond_0

    move v8, v9

    :goto_0
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v11, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 504
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "_id="

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p1}, Lcom/mediatek/settings/CellBroadcastChannel;->getKeyId()I

    move-result v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 506
    .local v7, where:Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    iget-object v11, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mUri:Landroid/net/Uri;

    const/4 v12, 0x0

    invoke-virtual {v8, v11, v6, v7, v12}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 510
    :goto_1
    return v9

    .end local v7           #where:Ljava/lang/String;
    :cond_0
    move v8, v10

    .line 503
    goto :goto_0

    .line 507
    .restart local v7       #where:Ljava/lang/String;
    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/IllegalArgumentException;
    move v9, v10

    .line 508
    goto :goto_1
.end method

.method private updateChannelUIList()V
    .locals 11

    .prologue
    .line 197
    iget-object v9, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelListPreference:Landroid/preference/PreferenceCategory;

    invoke-virtual {v9}, Landroid/preference/PreferenceCategory;->removeAll()V

    .line 198
    iget-object v9, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 199
    .local v6, length:I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-ge v4, v6, :cond_1

    .line 200
    new-instance v0, Landroid/preference/Preference;

    invoke-direct {v0, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 201
    .local v0, channel:Landroid/preference/Preference;
    iget-object v9, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/mediatek/settings/CellBroadcastChannel;

    invoke-virtual {v9}, Lcom/mediatek/settings/CellBroadcastChannel;->getKeyId()I

    move-result v5

    .line 202
    .local v5, keyId:I
    iget-object v9, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/mediatek/settings/CellBroadcastChannel;

    invoke-virtual {v9}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelName()Ljava/lang/String;

    move-result-object v2

    .line 203
    .local v2, channelName:Ljava/lang/String;
    iget-object v9, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/mediatek/settings/CellBroadcastChannel;

    invoke-virtual {v9}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelId()I

    move-result v1

    .line 204
    .local v1, channelId:I
    iget-object v9, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/mediatek/settings/CellBroadcastChannel;

    invoke-virtual {v9}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelState()Z

    move-result v3

    .line 205
    .local v3, channelState:Z
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ")"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 206
    .local v8, title:Ljava/lang/String;
    invoke-virtual {v0, v8}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 207
    new-instance v7, Lcom/mediatek/settings/CellBroadcastChannel;

    invoke-direct {v7, v5, v1, v2, v3}, Lcom/mediatek/settings/CellBroadcastChannel;-><init>(IILjava/lang/String;Z)V

    .line 208
    .local v7, oldChannel:Lcom/mediatek/settings/CellBroadcastChannel;
    if-eqz v3, :cond_0

    .line 209
    const v9, 0x7f0d01e6

    invoke-virtual {v0, v9}, Landroid/preference/Preference;->setSummary(I)V

    .line 214
    :goto_1
    new-instance v9, Lcom/mediatek/settings/CellBroadcastSettings$2;

    invoke-direct {v9, p0, v7}, Lcom/mediatek/settings/CellBroadcastSettings$2;-><init>(Lcom/mediatek/settings/CellBroadcastSettings;Lcom/mediatek/settings/CellBroadcastChannel;)V

    invoke-virtual {v0, v9}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 220
    iget-object v9, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelListPreference:Landroid/preference/PreferenceCategory;

    invoke-virtual {v9, v0}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 199
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 211
    :cond_0
    const v9, 0x7f0d01e7

    invoke-virtual {v0, v9}, Landroid/preference/Preference;->setSummary(I)V

    goto :goto_1

    .line 222
    .end local v0           #channel:Landroid/preference/Preference;
    .end local v1           #channelId:I
    .end local v2           #channelName:Ljava/lang/String;
    .end local v3           #channelState:Z
    .end local v5           #keyId:I
    .end local v7           #oldChannel:Lcom/mediatek/settings/CellBroadcastChannel;
    .end local v8           #title:Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private updateChannelsWithSingleConfig(Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;)V
    .locals 11
    .parameter "info"

    .prologue
    .line 524
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;->getFromServiceId()I

    move-result v1

    .line 525
    .local v1, channelBeginIndex:I
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;->getToServiceId()I

    move-result v2

    .line 526
    .local v2, channelEndIndex:I
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;->isSelected()Z

    move-result v6

    .line 527
    .local v6, state:Z
    const-string v8, "Settings/CellBroadcastSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "updateChannelsWithSingleConfig STATE = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 529
    const/4 v8, -0x1

    if-eq v1, v8, :cond_2

    .line 530
    move v3, v1

    .local v3, j:I
    :goto_0
    if-gt v3, v2, :cond_2

    .line 531
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    .line 532
    .local v4, jStr:Ljava/lang/String;
    invoke-direct {p0, v4}, Lcom/mediatek/settings/CellBroadcastSettings;->getChannelObjectFromKey(Ljava/lang/String;)Lcom/mediatek/settings/CellBroadcastChannel;

    move-result-object v0

    .line 533
    .local v0, channel:Lcom/mediatek/settings/CellBroadcastChannel;
    if-eqz v0, :cond_0

    .line 534
    invoke-virtual {v0, v6}, Lcom/mediatek/settings/CellBroadcastChannel;->setChannelState(Z)V

    .line 530
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 537
    :cond_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const v9, 0x7f0d00de

    invoke-virtual {p0, v9}, Lcom/mediatek/settings/CellBroadcastSettings;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 538
    .local v7, tName:Ljava/lang/String;
    new-instance v5, Lcom/mediatek/settings/CellBroadcastChannel;

    invoke-direct {v5, v3, v7, v6}, Lcom/mediatek/settings/CellBroadcastChannel;-><init>(ILjava/lang/String;Z)V

    .line 539
    .local v5, newChannel:Lcom/mediatek/settings/CellBroadcastChannel;
    invoke-direct {p0, v5}, Lcom/mediatek/settings/CellBroadcastSettings;->insertChannelToDatabase(Lcom/mediatek/settings/CellBroadcastChannel;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 540
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->showUpdateDBErrorInfoDialog()V

    .line 542
    :cond_1
    iget-object v8, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 543
    iget-object v8, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelMap:Ljava/util/HashMap;

    invoke-virtual {v8, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 547
    .end local v0           #channel:Lcom/mediatek/settings/CellBroadcastChannel;
    .end local v3           #j:I
    .end local v4           #jStr:Ljava/lang/String;
    .end local v5           #newChannel:Lcom/mediatek/settings/CellBroadcastChannel;
    .end local v7           #tName:Ljava/lang/String;
    :cond_2
    return-void
.end method

.method private updateCurrentChannelAndLanguage(Ljava/util/ArrayList;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 574
    .local p1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;>;"
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_1

    .line 584
    :cond_0
    return-void

    .line 577
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 578
    .local v2, number:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 579
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    .line 580
    .local v1, info:Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    invoke-direct {p0, v1}, Lcom/mediatek/settings/CellBroadcastSettings;->updateLanguagesWithSingleConfig(Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;)V

    .line 581
    invoke-direct {p0, v1}, Lcom/mediatek/settings/CellBroadcastSettings;->dumpConfigInfo(Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;)V

    .line 582
    invoke-direct {p0, v1}, Lcom/mediatek/settings/CellBroadcastSettings;->updateChannelsWithSingleConfig(Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;)V

    .line 578
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private updateLanguageSummary()V
    .locals 4

    .prologue
    .line 225
    const/16 v3, 0x16

    new-array v2, v3, [Z

    .line 226
    .local v2, temp:[Z
    array-length v1, v2

    .line 227
    .local v1, tLength:I
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 228
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mediatek/settings/CellBroadcastLanguage;

    invoke-virtual {v3}, Lcom/mediatek/settings/CellBroadcastLanguage;->getLanguageState()Z

    move-result v3

    aput-boolean v3, v2, v0

    .line 227
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 230
    :cond_0
    invoke-direct {p0, v2}, Lcom/mediatek/settings/CellBroadcastSettings;->setLanguageSummary([Z)V

    .line 231
    return-void
.end method

.method private updateLanguagesWithSingleConfig(Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;)V
    .locals 9
    .parameter "info"

    .prologue
    const/4 v8, -0x2

    .line 550
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;->getFromCodeScheme()I

    move-result v4

    .line 551
    .local v4, languageBeginIndex:I
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;->getToCodeScheme()I

    move-result v5

    .line 552
    .local v5, languageEndIndex:I
    const/4 v6, -0x1

    if-eq v4, v6, :cond_1

    if-eq v4, v8, :cond_1

    .line 553
    move v1, v4

    .local v1, j:I
    :goto_0
    if-gt v1, v5, :cond_3

    .line 554
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mediatek/settings/CellBroadcastSettings;->getLanguageObjectFromKey(Ljava/lang/String;)Lcom/mediatek/settings/CellBroadcastLanguage;

    move-result-object v3

    .line 555
    .local v3, language:Lcom/mediatek/settings/CellBroadcastLanguage;
    if-eqz v3, :cond_0

    .line 556
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;->isSelected()Z

    move-result v6

    invoke-virtual {v3, v6}, Lcom/mediatek/settings/CellBroadcastLanguage;->setLanguageState(Z)V

    .line 553
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 560
    .end local v1           #j:I
    .end local v3           #language:Lcom/mediatek/settings/CellBroadcastLanguage;
    :cond_1
    const-string v6, "Settings/CellBroadcastSettings"

    const-string v7, "Select all language!"

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 561
    if-ne v4, v8, :cond_3

    if-ne v5, v8, :cond_3

    .line 562
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v6, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v0, v6, :cond_3

    .line 563
    iget-object v6, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mediatek/settings/CellBroadcastLanguage;

    .line 564
    .restart local v3       #language:Lcom/mediatek/settings/CellBroadcastLanguage;
    invoke-virtual {v3}, Lcom/mediatek/settings/CellBroadcastLanguage;->getLanguageId()I

    move-result v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mediatek/settings/CellBroadcastSettings;->getLanguageObjectFromKey(Ljava/lang/String;)Lcom/mediatek/settings/CellBroadcastLanguage;

    move-result-object v2

    .line 565
    .local v2, lang:Lcom/mediatek/settings/CellBroadcastLanguage;
    if-eqz v2, :cond_2

    .line 566
    const/4 v6, 0x1

    invoke-virtual {v2, v6}, Lcom/mediatek/settings/CellBroadcastLanguage;->setLanguageState(Z)V

    .line 562
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 571
    .end local v0           #i:I
    .end local v2           #lang:Lcom/mediatek/settings/CellBroadcastLanguage;
    .end local v3           #language:Lcom/mediatek/settings/CellBroadcastLanguage;
    :cond_3
    return-void
.end method


# virtual methods
.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 13
    .parameter "item"

    .prologue
    const/4 v2, 0x1

    const/4 v3, -0x1

    const/4 v12, 0x0

    .line 865
    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v7

    check-cast v7, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 866
    .local v7, info:Landroid/widget/AdapterView$AdapterContextMenuInfo;
    iget v0, v7, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    add-int/lit8 v6, v0, -0x3

    .line 867
    .local v6, index:I
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/mediatek/settings/CellBroadcastChannel;

    .line 868
    .local v11, oldChannel:Lcom/mediatek/settings/CellBroadcastChannel;
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 898
    :goto_0
    invoke-super {p0, p1}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    .line 870
    :pswitch_0
    new-instance v8, Lcom/mediatek/settings/CellBroadcastChannel;

    invoke-direct {v8}, Lcom/mediatek/settings/CellBroadcastChannel;-><init>()V

    .line 871
    .local v8, newChannel:Lcom/mediatek/settings/CellBroadcastChannel;
    move-object v8, v11

    .line 872
    invoke-virtual {v11}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelState()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v2

    :goto_1
    invoke-virtual {v8, v0}, Lcom/mediatek/settings/CellBroadcastChannel;->setChannelState(Z)V

    .line 873
    invoke-virtual {v11}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelId()I

    move-result v1

    .line 874
    .local v1, tempOldChannelId:I
    new-array v9, v2, [Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    .line 875
    .local v9, objectList:[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    new-instance v0, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    invoke-virtual {v8}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelState()Z

    move-result v5

    move v2, v1

    move v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;-><init>(IIIIZ)V

    aput-object v0, v9, v12

    .line 877
    invoke-direct {p0, v11, v8}, Lcom/mediatek/settings/CellBroadcastSettings;->updateChannelToDatabase(Lcom/mediatek/settings/CellBroadcastChannel;Lcom/mediatek/settings/CellBroadcastChannel;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 878
    invoke-direct {p0, v9}, Lcom/mediatek/settings/CellBroadcastSettings;->setCellBroadcastConfig([Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;)V

    goto :goto_0

    .end local v1           #tempOldChannelId:I
    .end local v9           #objectList:[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    :cond_0
    move v0, v12

    .line 872
    goto :goto_1

    .line 880
    .restart local v1       #tempOldChannelId:I
    .restart local v9       #objectList:[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    :cond_1
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->showUpdateDBErrorInfoDialog()V

    goto :goto_0

    .line 884
    .end local v1           #tempOldChannelId:I
    .end local v8           #newChannel:Lcom/mediatek/settings/CellBroadcastChannel;
    .end local v9           #objectList:[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    :pswitch_1
    invoke-direct {p0, v11}, Lcom/mediatek/settings/CellBroadcastSettings;->showEditChannelDialog(Lcom/mediatek/settings/CellBroadcastChannel;)V

    goto :goto_0

    .line 887
    :pswitch_2
    invoke-virtual {v11, v12}, Lcom/mediatek/settings/CellBroadcastChannel;->setChannelState(Z)V

    .line 888
    invoke-direct {p0, v11}, Lcom/mediatek/settings/CellBroadcastSettings;->makeChannelConfigArray(Lcom/mediatek/settings/CellBroadcastChannel;)[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    move-result-object v10

    .line 889
    .local v10, objectList1:[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    invoke-direct {p0, v11}, Lcom/mediatek/settings/CellBroadcastSettings;->deleteChannelFromDatabase(Lcom/mediatek/settings/CellBroadcastChannel;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 890
    invoke-direct {p0, v10}, Lcom/mediatek/settings/CellBroadcastSettings;->setCellBroadcastConfig([Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;)V

    goto :goto_0

    .line 892
    :cond_2
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->showUpdateDBErrorInfoDialog()V

    goto :goto_0

    .line 868
    nop

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 143
    invoke-super {p0, p1}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 145
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 146
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "simId"

    const/4 v3, -0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mSimId:I

    .line 147
    iget v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mSimId:I

    packed-switch v1, :pswitch_data_0

    .line 161
    const-string v1, "Settings/CellBroadcastSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "error no sim id matched with mSimId = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mSimId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    :cond_0
    :goto_0
    const-string v1, "CellBroadcastSetting"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Sim Id : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mSimId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 168
    const v1, 0x7f06000b

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/CellBroadcastSettings;->addPreferencesFromResource(I)V

    .line 169
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->initPreference()V

    .line 170
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->initLanguage()V

    .line 171
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/CellBroadcastSettings;->registerForContextMenu(Landroid/view/View;)V

    .line 173
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.SIM_INFO_UPDATE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 174
    .local v0, intentFilter:Landroid/content/IntentFilter;
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/mediatek/settings/CellBroadcastSettings;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 175
    return-void

    .line 149
    .end local v0           #intentFilter:Landroid/content/IntentFilter;
    :pswitch_0
    sget-object v1, Lcom/mediatek/settings/CellBroadcastSettings;->CHANNEL_URI:Landroid/net/Uri;

    iput-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mUri:Landroid/net/Uri;

    goto :goto_0

    .line 152
    :pswitch_1
    sget-object v1, Lcom/mediatek/settings/CellBroadcastSettings;->CHANNEL_URI1:Landroid/net/Uri;

    iput-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mUri:Landroid/net/Uri;

    goto :goto_0

    .line 155
    :pswitch_2
    sget-object v1, Lcom/mediatek/settings/CellBroadcastSettings;->CHANNEL_URI2:Landroid/net/Uri;

    iput-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mUri:Landroid/net/Uri;

    goto :goto_0

    .line 158
    :pswitch_3
    sget-object v1, Lcom/mediatek/settings/CellBroadcastSettings;->CHANNEL_URI3:Landroid/net/Uri;

    iput-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mUri:Landroid/net/Uri;

    goto :goto_0

    .line 147
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 9
    .parameter "menu"
    .parameter "v"
    .parameter "menuInfo"

    .prologue
    const/16 v6, 0xa

    const/4 v8, 0x0

    .line 903
    invoke-super {p0, p1, p2, p3}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    move-object v3, p3

    .line 904
    check-cast v3, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 905
    .local v3, info:Landroid/widget/AdapterView$AdapterContextMenuInfo;
    if-nez v3, :cond_1

    .line 906
    const-string v5, "Settings/CellBroadcastSettings"

    const-string v6, "onCreateContextMenu,menuInfo is null"

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 923
    :cond_0
    :goto_0
    return-void

    .line 909
    :cond_1
    iget v4, v3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    .line 910
    .local v4, position:I
    const/4 v5, 0x3

    if-lt v4, v5, :cond_0

    .line 911
    add-int/lit8 v2, v4, -0x3

    .line 912
    .local v2, index:I
    iget-object v5, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mChannelArray:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/CellBroadcastChannel;

    .line 913
    .local v0, channel:Lcom/mediatek/settings/CellBroadcastChannel;
    invoke-virtual {v0}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelName()Ljava/lang/String;

    move-result-object v1

    .line 914
    .local v1, channelName:Ljava/lang/String;
    invoke-interface {p1, v1}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 915
    invoke-virtual {v0}, Lcom/mediatek/settings/CellBroadcastChannel;->getChannelState()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 916
    const v5, 0x7f0d01e7

    invoke-interface {p1, v8, v6, v8, v5}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 920
    :goto_1
    const/4 v5, 0x1

    const/16 v6, 0xb

    const v7, 0x7f0d00d7

    invoke-interface {p1, v5, v6, v8, v7}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 921
    const/4 v5, 0x2

    const/16 v6, 0xc

    const v7, 0x7f0d00d8

    invoke-interface {p1, v5, v6, v8, v7}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    goto :goto_0

    .line 918
    :cond_2
    const v5, 0x7f0d01e6

    invoke-interface {p1, v8, v6, v8, v5}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    goto :goto_1
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 183
    invoke-super {p0}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onDestroy()V

    .line 184
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CellBroadcastSettings;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 185
    return-void
.end method

.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 2
    .parameter "preference"

    .prologue
    const/4 v0, 0x1

    .line 309
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mLanguagePreference:Landroid/preference/PreferenceScreen;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 310
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->showLanguageSelectDialog()V

    .line 316
    :goto_0
    return v0

    .line 312
    :cond_0
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastSettings;->mAddChannelPreference:Landroid/preference/PreferenceScreen;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 313
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastSettings;->showAddChannelDialog()V

    goto :goto_0

    .line 316
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 178
    invoke-super {p0}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onResume()V

    .line 179
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mediatek/settings/CellBroadcastSettings;->getCellBroadcastConfig(Z)V

    .line 180
    return-void
.end method
