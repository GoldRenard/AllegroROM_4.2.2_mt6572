.class public Lcom/mediatek/settings/PLMNListPreference;
.super Lcom/android/phone/TimeConsumingPreferenceActivity;
.source "PLMNListPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/PLMNListPreference$SIMCapability;,
        Lcom/mediatek/settings/PLMNListPreference$MyHandler;,
        Lcom/mediatek/settings/PLMNListPreference$NetworkCompare;
    }
.end annotation


# static fields
.field private static final BUTTON_PLMN_LIST_KEY:Ljava/lang/String; = "button_plmn_list_key"

.field private static final DBG:Z = true

.field private static final LOG_TAG:Ljava/lang/String; = "Settings/PLMNListPreference"

.field private static final MENU_ADD:I = 0x1

.field private static final REQUEST_ADD:I = 0x64

.field private static final REQUEST_EDIT:I = 0xc8


# instance fields
.field private mAirplaneModeEnabled:Z

.field private mCapability:Lcom/mediatek/settings/PLMNListPreference$SIMCapability;

.field private mDualSimMode:I

.field private mHandler:Lcom/mediatek/settings/PLMNListPreference$MyHandler;

.field private mIntentFilter:Landroid/content/IntentFilter;

.field mListPriority:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field mListService:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mNumbers:I

.field private mOldInfo:Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;

.field private mPLMNList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;",
            ">;"
        }
    .end annotation
.end field

.field private mPLMNListContainer:Landroid/preference/PreferenceScreen;

.field private mPhone:Lcom/android/internal/telephony/Phone;

.field private mPhoneStateListener:Landroid/telephony/PhoneStateListener;

.field private mPreferenceMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Landroid/preference/Preference;",
            "Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;",
            ">;"
        }
    .end annotation
.end field

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mSlotId:I

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;


# direct methods
.method public constructor <init>()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v2, 0x0

    .line 40
    invoke-direct {p0}, Lcom/android/phone/TimeConsumingPreferenceActivity;-><init>()V

    .line 43
    iput v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mNumbers:I

    .line 50
    iput v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mSlotId:I

    .line 51
    iput-object v6, p0, Lcom/mediatek/settings/PLMNListPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 54
    new-instance v0, Lcom/mediatek/settings/PLMNListPreference$SIMCapability;

    move-object v1, p0

    move v3, v2

    move v4, v2

    move v5, v2

    invoke-direct/range {v0 .. v5}, Lcom/mediatek/settings/PLMNListPreference$SIMCapability;-><init>(Lcom/mediatek/settings/PLMNListPreference;IIII)V

    iput-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mCapability:Lcom/mediatek/settings/PLMNListPreference$SIMCapability;

    .line 55
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mPreferenceMap:Ljava/util/Map;

    .line 58
    new-instance v0, Lcom/mediatek/settings/PLMNListPreference$MyHandler;

    invoke-direct {v0, p0, v6}, Lcom/mediatek/settings/PLMNListPreference$MyHandler;-><init>(Lcom/mediatek/settings/PLMNListPreference;Lcom/mediatek/settings/PLMNListPreference$1;)V

    iput-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mHandler:Lcom/mediatek/settings/PLMNListPreference$MyHandler;

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mListPriority:Ljava/util/ArrayList;

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mListService:Ljava/util/ArrayList;

    .line 68
    iput-boolean v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mAirplaneModeEnabled:Z

    .line 69
    const/4 v0, -0x1

    iput v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mDualSimMode:I

    .line 72
    new-instance v0, Lcom/mediatek/settings/PLMNListPreference$1;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/PLMNListPreference$1;-><init>(Lcom/mediatek/settings/PLMNListPreference;)V

    iput-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    .line 87
    new-instance v0, Lcom/mediatek/settings/PLMNListPreference$2;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/PLMNListPreference$2;-><init>(Lcom/mediatek/settings/PLMNListPreference;)V

    iput-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 604
    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/settings/PLMNListPreference;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/mediatek/settings/PLMNListPreference;->setScreenEnabled()V

    return-void
.end method

.method static synthetic access$1000(Lcom/mediatek/settings/PLMNListPreference;)Lcom/android/internal/telephony/Phone;
    .locals 1
    .parameter "x0"

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/mediatek/settings/PLMNListPreference;)Lcom/mediatek/settings/PLMNListPreference$MyHandler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mHandler:Lcom/mediatek/settings/PLMNListPreference$MyHandler;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/mediatek/settings/PLMNListPreference;)Lcom/mediatek/settings/PLMNListPreference$SIMCapability;
    .locals 1
    .parameter "x0"

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mCapability:Lcom/mediatek/settings/PLMNListPreference$SIMCapability;

    return-object v0
.end method

.method static synthetic access$202(Lcom/mediatek/settings/PLMNListPreference;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 40
    iput-boolean p1, p0, Lcom/mediatek/settings/PLMNListPreference;->mAirplaneModeEnabled:Z

    return p1
.end method

.method static synthetic access$302(Lcom/mediatek/settings/PLMNListPreference;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 40
    iput p1, p0, Lcom/mediatek/settings/PLMNListPreference;->mDualSimMode:I

    return p1
.end method

.method static synthetic access$400(Lcom/mediatek/settings/PLMNListPreference;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 40
    iget v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mSlotId:I

    return v0
.end method

.method static synthetic access$500(Lcom/mediatek/settings/PLMNListPreference;I)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/mediatek/settings/PLMNListPreference;->isSimStateReady(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lcom/mediatek/settings/PLMNListPreference;)Landroid/preference/PreferenceScreen;
    .locals 1
    .parameter "x0"

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNListContainer:Landroid/preference/PreferenceScreen;

    return-object v0
.end method

.method static synthetic access$700(Lcom/mediatek/settings/PLMNListPreference;)Ljava/util/List;
    .locals 1
    .parameter "x0"

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$702(Lcom/mediatek/settings/PLMNListPreference;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 40
    iput-object p1, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$800(Lcom/mediatek/settings/PLMNListPreference;Ljava/util/ArrayList;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/mediatek/settings/PLMNListPreference;->refreshPreference(Ljava/util/ArrayList;)V

    return-void
.end method

.method static synthetic access$900(Lcom/mediatek/settings/PLMNListPreference;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 40
    iget v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mNumbers:I

    return v0
.end method

.method static synthetic access$910(Lcom/mediatek/settings/PLMNListPreference;)I
    .locals 2
    .parameter "x0"

    .prologue
    .line 40
    iget v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mNumbers:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mNumbers:I

    return v0
.end method

.method private addPLMNPreference(Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;)V
    .locals 5
    .parameter "network"

    .prologue
    .line 292
    new-instance v2, Landroid/preference/Preference;

    invoke-direct {v2, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 293
    .local v2, pref:Landroid/preference/Preference;
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->getOperatorAlphaName()Ljava/lang/String;

    move-result-object v1

    .line 294
    .local v1, plmnName:Ljava/lang/String;
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->getAccessTechnology()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/mediatek/settings/PLMNListPreference;->getNWString(I)Ljava/lang/String;

    move-result-object v0

    .line 295
    .local v0, extendName:Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 296
    iget-object v3, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNListContainer:Landroid/preference/PreferenceScreen;

    invoke-virtual {v3, v2}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 297
    iget-object v3, p0, Lcom/mediatek/settings/PLMNListPreference;->mPreferenceMap:Ljava/util/Map;

    invoke-interface {v3, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    return-void
.end method

.method private adjustPriority(Ljava/util/ArrayList;)V
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 483
    .local p1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;>;"
    const/4 v2, 0x0

    .line 484
    .local v2, priority:I
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;

    .line 485
    .local v1, info:Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;
    add-int/lit8 v3, v2, 0x1

    .end local v2           #priority:I
    .local v3, priority:I
    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->setPriority(I)V

    move v2, v3

    .end local v3           #priority:I
    .restart local v2       #priority:I
    goto :goto_0

    .line 487
    .end local v1           #info:Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;
    :cond_0
    return-void
.end method

.method private createNetworkInfo(Landroid/content/Intent;)Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;
    .locals 6
    .parameter "intent"

    .prologue
    const/4 v5, 0x0

    .line 348
    const-string v4, "plmn_code"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 349
    .local v1, numberName:Ljava/lang/String;
    const-string v4, "plmn_name"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 350
    .local v2, operatorName:Ljava/lang/String;
    const-string v4, "plmn_priority"

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 351
    .local v3, priority:I
    const-string v4, "plmn_service"

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 352
    .local v0, act:I
    new-instance v4, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;

    invoke-direct {v4, v2, v1, v0, v3}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    return-object v4
.end method

.method private dumpNetworkInfo(Ljava/util/List;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 404
    .local p1, list:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;>;"
    const-string v1, "Settings/PLMNListPreference"

    const-string v2, "dumpNetworkInfo : **********start*******"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 406
    const-string v2, "Settings/PLMNListPreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dumpNetworkInfo : "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;

    invoke-virtual {v1}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 408
    :cond_0
    const-string v1, "Settings/PLMNListPreference"

    const-string v2, "dumpNetworkInfo : ***********stop*******"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    return-void
.end method

.method private extractInfoFromNetworkInfo(Landroid/content/Intent;Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;)V
    .locals 2
    .parameter "intent"
    .parameter "info"

    .prologue
    .line 301
    const-string v0, "plmn_code"

    invoke-virtual {p2}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 302
    const-string v0, "plmn_name"

    invoke-virtual {p2}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->getOperatorAlphaName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 303
    const-string v0, "plmn_priority"

    invoke-virtual {p2}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->getPriority()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 304
    const-string v0, "plmn_service"

    invoke-virtual {p2}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->getAccessTechnology()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 305
    const-string v0, "plmn_add"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 306
    const-string v0, "plmn_size"

    iget-object v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 307
    const-string v0, "plmn_slot"

    iget v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mSlotId:I

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 308
    return-void
.end method

.method private genDelete(Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;)Ljava/util/ArrayList;
    .locals 9
    .parameter "network"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 490
    const-string v5, "Settings/PLMNListPreference"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "genDelete : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    iget-object v5, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-direct {p0, v5}, Lcom/mediatek/settings/PLMNListPreference;->dumpNetworkInfo(Ljava/util/List;)V

    .line 493
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 494
    .local v1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;>;"
    new-instance v2, Lcom/mediatek/settings/PLMNListPreference$NetworkCompare;

    invoke-direct {v2, p0}, Lcom/mediatek/settings/PLMNListPreference$NetworkCompare;-><init>(Lcom/mediatek/settings/PLMNListPreference;)V

    .line 495
    .local v2, nc:Lcom/mediatek/settings/PLMNListPreference$NetworkCompare;
    iget-object v5, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-static {v5, p1, v2}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v4

    .line 497
    .local v4, pos:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v5, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v0, v5, :cond_0

    .line 498
    iget-object v5, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 497
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 501
    :cond_0
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 502
    invoke-virtual {p1, v8}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->setOperatorNumeric(Ljava/lang/String;)V

    .line 503
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 505
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_1
    iget-object v5, p0, Lcom/mediatek/settings/PLMNListPreference;->mCapability:Lcom/mediatek/settings/PLMNListPreference$SIMCapability;

    iget v5, v5, Lcom/mediatek/settings/PLMNListPreference$SIMCapability;->mLastIndex:I

    add-int/lit8 v5, v5, 0x1

    if-ge v0, v5, :cond_1

    .line 506
    new-instance v3, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;

    const-string v5, ""

    const/4 v6, 0x1

    invoke-direct {v3, v5, v8, v6, v0}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    .line 507
    .local v3, ni:Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 505
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 509
    .end local v3           #ni:Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;
    :cond_1
    invoke-direct {p0, v1}, Lcom/mediatek/settings/PLMNListPreference;->adjustPriority(Ljava/util/ArrayList;)V

    .line 510
    invoke-direct {p0, v1}, Lcom/mediatek/settings/PLMNListPreference;->dumpNetworkInfo(Ljava/util/List;)V

    .line 512
    return-object v1
.end method

.method private genModifyEx(Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;)Ljava/util/ArrayList;
    .locals 10
    .parameter "newInfo"
    .parameter "oldInfo"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;",
            "Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;",
            ">;"
        }
    .end annotation

    .prologue
    .line 412
    const-string v7, "Settings/PLMNListPreference"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "genModifyEx: change : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p2}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "----> "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 413
    iget-object v7, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-direct {p0, v7}, Lcom/mediatek/settings/PLMNListPreference;->dumpNetworkInfo(Ljava/util/List;)V

    .line 415
    new-instance v3, Lcom/mediatek/settings/PLMNListPreference$NetworkCompare;

    invoke-direct {v3, p0}, Lcom/mediatek/settings/PLMNListPreference$NetworkCompare;-><init>(Lcom/mediatek/settings/PLMNListPreference;)V

    .line 416
    .local v3, nc:Lcom/mediatek/settings/PLMNListPreference$NetworkCompare;
    iget-object v7, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-static {v7, p2, v3}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v5

    .line 417
    .local v5, oldPos:I
    iget-object v7, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-static {v7, p1, v3}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v4

    .line 419
    .local v4, newPos:I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 420
    .local v2, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;>;"
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->getPriority()I

    move-result v7

    invoke-virtual {p2}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->getPriority()I

    move-result v8

    if-ne v7, v8, :cond_0

    .line 421
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 422
    invoke-direct {p0, v2}, Lcom/mediatek/settings/PLMNListPreference;->dumpNetworkInfo(Ljava/util/List;)V

    .line 453
    :goto_0
    return-object v2

    .line 426
    :cond_0
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    iget-object v7, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-ge v1, v7, :cond_1

    .line 427
    iget-object v7, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 426
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 430
    :cond_1
    const/4 v6, -0x1

    .line 431
    .local v6, properPos:I
    if-gez v4, :cond_2

    .line 432
    iget-object v7, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-direct {p0, v7, p1}, Lcom/mediatek/settings/PLMNListPreference;->getPosition(Ljava/util/List;Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;)I

    move-result v6

    .line 433
    invoke-virtual {v2, v6, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 434
    invoke-direct {p0, v2}, Lcom/mediatek/settings/PLMNListPreference;->dumpNetworkInfo(Ljava/util/List;)V

    goto :goto_0

    .line 438
    :cond_2
    move v0, v4

    .line 439
    .local v0, adjustIndex:I
    if-le v5, v4, :cond_3

    .line 440
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 441
    invoke-virtual {v2, v4, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 451
    :goto_2
    invoke-direct {p0, v2}, Lcom/mediatek/settings/PLMNListPreference;->adjustPriority(Ljava/util/ArrayList;)V

    .line 452
    invoke-direct {p0, v2}, Lcom/mediatek/settings/PLMNListPreference;->dumpNetworkInfo(Ljava/util/List;)V

    goto :goto_0

    .line 442
    :cond_3
    if-ge v5, v4, :cond_4

    .line 443
    add-int/lit8 v7, v4, 0x1

    invoke-virtual {v2, v7, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 444
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 445
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 447
    :cond_4
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 448
    invoke-virtual {v2, v5, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_2
.end method

.method private getNWString(I)Ljava/lang/String;
    .locals 4
    .parameter "rilNW"

    .prologue
    .line 629
    invoke-static {p1}, Lcom/mediatek/settings/NetworkEditor;->covertRilNW2Ap(I)I

    move-result v0

    .line 630
    .local v0, index:I
    const-string v1, ""

    .line 631
    .local v1, summary:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/settings/NetworkEditor;->getBaseBand()I

    move-result v2

    and-int/lit8 v2, v2, 0x8

    if-nez v2, :cond_0

    .line 633
    invoke-virtual {p0}, Lcom/mediatek/settings/PLMNListPreference;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f07001b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aget-object v1, v2, v0

    .line 640
    :goto_0
    return-object v1

    .line 637
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/settings/PLMNListPreference;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f07001c

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aget-object v1, v2, v0

    goto :goto_0
.end method

.method private getPosition(Ljava/util/List;Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;)I
    .locals 6
    .parameter
    .parameter "newInfo"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;",
            ">;",
            "Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;",
            ")I"
        }
    .end annotation

    .prologue
    .local p1, list:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;>;"
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 457
    const/4 v1, -0x1

    .line 458
    .local v1, index:I
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    move v2, v3

    .line 479
    :goto_0
    return v2

    .line 462
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ne v2, v4, :cond_3

    .line 463
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;

    invoke-virtual {v2}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->getPriority()I

    move-result v2

    invoke-virtual {p2}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->getPriority()I

    move-result v5

    if-le v2, v5, :cond_2

    move v2, v3

    goto :goto_0

    :cond_2
    move v2, v4

    goto :goto_0

    .line 466
    :cond_3
    const/4 v0, 0x0

    .local v0, i:I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_4

    .line 467
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;

    invoke-virtual {v2}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->getPriority()I

    move-result v2

    invoke-virtual {p2}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->getPriority()I

    move-result v3

    if-le v2, v3, :cond_4

    .line 468
    if-nez v0, :cond_6

    .line 469
    const/4 v1, 0x0

    .line 476
    :cond_4
    :goto_1
    const/4 v2, -0x1

    if-ne v1, v2, :cond_5

    .line 477
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    :cond_5
    move v2, v1

    .line 479
    goto :goto_0

    .line 471
    :cond_6
    add-int/lit8 v1, v0, -0x1

    goto :goto_1
.end method

.method private getSIMCapability()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    .line 241
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 242
    iget-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 243
    .local v0, dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    iget v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mSlotId:I

    iget-object v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mHandler:Lcom/mediatek/settings/PLMNListPreference$MyHandler;

    iget v3, p0, Lcom/mediatek/settings/PLMNListPreference;->mSlotId:I

    invoke-virtual {v2, v4, v3, v4}, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getPOLCapabilityGemini(ILandroid/os/Message;)V

    .line 250
    .end local v0           #dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    :goto_0
    return-void

    .line 247
    :cond_0
    iget-object v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mHandler:Lcom/mediatek/settings/PLMNListPreference$MyHandler;

    iget v3, p0, Lcom/mediatek/settings/PLMNListPreference;->mSlotId:I

    invoke-virtual {v2, v4, v3, v4}, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/android/internal/telephony/Phone;->getPOLCapability(Landroid/os/Message;)V

    goto :goto_0
.end method

.method private handlePLMNListAdd(Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;)V
    .locals 8
    .parameter "newInfo"

    .prologue
    .line 376
    const-string v5, "Settings/PLMNListPreference"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "handlePLMNListAdd: add new network: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 377
    iget-object v5, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-direct {p0, v5}, Lcom/mediatek/settings/PLMNListPreference;->dumpNetworkInfo(Ljava/util/List;)V

    .line 378
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 379
    .local v1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v5, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v0, v5, :cond_0

    .line 380
    iget-object v5, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 379
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 382
    :cond_0
    new-instance v2, Lcom/mediatek/settings/PLMNListPreference$NetworkCompare;

    invoke-direct {v2, p0}, Lcom/mediatek/settings/PLMNListPreference$NetworkCompare;-><init>(Lcom/mediatek/settings/PLMNListPreference;)V

    .line 383
    .local v2, nc:Lcom/mediatek/settings/PLMNListPreference$NetworkCompare;
    iget-object v5, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-static {v5, p1, v2}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v3

    .line 385
    .local v3, pos:I
    const/4 v4, -0x1

    .line 386
    .local v4, properPos:I
    if-gez v3, :cond_1

    .line 387
    iget-object v5, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-direct {p0, v5, p1}, Lcom/mediatek/settings/PLMNListPreference;->getPosition(Ljava/util/List;Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;)I

    move-result v4

    .line 389
    :cond_1
    const/4 v5, -0x1

    if-ne v4, v5, :cond_2

    .line 390
    invoke-virtual {v1, v3, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 394
    :goto_1
    invoke-direct {p0, v1}, Lcom/mediatek/settings/PLMNListPreference;->adjustPriority(Ljava/util/ArrayList;)V

    .line 395
    invoke-direct {p0, v1}, Lcom/mediatek/settings/PLMNListPreference;->dumpNetworkInfo(Ljava/util/List;)V

    .line 396
    invoke-direct {p0, v1}, Lcom/mediatek/settings/PLMNListPreference;->handleSetPLMN(Ljava/util/ArrayList;)V

    .line 397
    return-void

    .line 392
    :cond_2
    invoke-virtual {v1, v4, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_1
.end method

.method private handleSetPLMN(Ljava/util/ArrayList;)V
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;>;"
    const/4 v6, 0x1

    .line 356
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    iput v3, p0, Lcom/mediatek/settings/PLMNListPreference;->mNumbers:I

    .line 357
    invoke-virtual {p0}, Lcom/mediatek/settings/PLMNListPreference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/PLMNListPreference;->setDialogTitle(Ljava/lang/CharSequence;)V

    .line 358
    iget-object v3, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNListContainer:Landroid/preference/PreferenceScreen;

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Lcom/mediatek/settings/PLMNListPreference;->onStarted(Landroid/preference/Preference;Z)V

    .line 359
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 360
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;

    .line 361
    .local v2, ni:Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 362
    iget-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 363
    .local v0, dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    iget v3, p0, Lcom/mediatek/settings/PLMNListPreference;->mSlotId:I

    iget-object v4, p0, Lcom/mediatek/settings/PLMNListPreference;->mHandler:Lcom/mediatek/settings/PLMNListPreference$MyHandler;

    iget v5, p0, Lcom/mediatek/settings/PLMNListPreference;->mSlotId:I

    invoke-virtual {v4, v6, v5, v6}, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v4

    invoke-virtual {v0, v3, v2, v4}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setPOLEntryGemini(ILcom/android/internal/telephony/gsm/NetworkInfoWithAcT;Landroid/os/Message;)V

    .line 359
    .end local v0           #dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 366
    :cond_0
    iget-object v3, p0, Lcom/mediatek/settings/PLMNListPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v4, p0, Lcom/mediatek/settings/PLMNListPreference;->mHandler:Lcom/mediatek/settings/PLMNListPreference$MyHandler;

    iget v5, p0, Lcom/mediatek/settings/PLMNListPreference;->mSlotId:I

    invoke-virtual {v4, v6, v5, v6}, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Lcom/android/internal/telephony/Phone;->setPOLEntry(Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;Landroid/os/Message;)V

    .line 369
    const-string v3, "Settings/PLMNListPreference"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleSetPLMN: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 373
    .end local v2           #ni:Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;
    :cond_1
    return-void
.end method

.method private init(Lcom/mediatek/phone/TimeConsumingPreferenceListener;ZI)V
    .locals 5
    .parameter "listener"
    .parameter "skipReading"
    .parameter "slotId"

    .prologue
    const/4 v4, 0x0

    .line 211
    const-string v1, "Settings/PLMNListPreference"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "init with simSlot = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 213
    invoke-virtual {p0}, Lcom/mediatek/settings/PLMNListPreference;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    const/4 v3, -0x1

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mDualSimMode:I

    .line 215
    const-string v1, "Settings/PLMNListPreference"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Settings.onResume(), mDualSimMode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/PLMNListPreference;->mDualSimMode:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    :cond_0
    if-nez p2, :cond_1

    .line 218
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 219
    iget-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 220
    .local v0, dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    iget-object v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mHandler:Lcom/mediatek/settings/PLMNListPreference$MyHandler;

    invoke-virtual {v1, v4, p3, v4}, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, p3, v1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getPreferedOperatorListGemini(ILandroid/os/Message;)V

    .line 228
    .end local v0           #dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    :goto_0
    if-eqz p1, :cond_1

    .line 229
    invoke-virtual {p0}, Lcom/mediatek/settings/PLMNListPreference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/PLMNListPreference;->setDialogTitle(Ljava/lang/CharSequence;)V

    .line 230
    iget-object v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNListContainer:Landroid/preference/PreferenceScreen;

    const/4 v2, 0x1

    invoke-interface {p1, v1, v2}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onStarted(Landroid/preference/Preference;Z)V

    .line 233
    :cond_1
    return-void

    .line 224
    :cond_2
    iget-object v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mHandler:Lcom/mediatek/settings/PLMNListPreference$MyHandler;

    invoke-virtual {v2, v4, p3, v4}, Lcom/mediatek/settings/PLMNListPreference$MyHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/android/internal/telephony/Phone;->getPreferedOperatorList(Landroid/os/Message;)V

    goto :goto_0
.end method

.method private isSimStateReady(I)Z
    .locals 5
    .parameter "slotId"

    .prologue
    const/4 v4, 0x5

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 657
    const/4 v0, 0x0

    .line 658
    .local v0, isSimStateReady:Z
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 659
    invoke-static {}, Lcom/mediatek/telephony/TelephonyManagerEx;->getDefault()Lcom/mediatek/telephony/TelephonyManagerEx;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/mediatek/telephony/TelephonyManagerEx;->getSimState(I)I

    move-result v3

    if-ne v4, v3, :cond_0

    move v0, v1

    .line 665
    :goto_0
    const-string v1, "Settings/PLMNListPreference"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isSimStateReady isSimStateReady: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 666
    return v0

    :cond_0
    move v0, v2

    .line 659
    goto :goto_0

    .line 662
    :cond_1
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v3

    if-ne v4, v3, :cond_2

    move v0, v1

    :goto_1
    goto :goto_0

    :cond_2
    move v0, v2

    goto :goto_1
.end method

.method private refreshPreference(Ljava/util/ArrayList;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 253
    .local p1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;>;"
    iget-object v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNListContainer:Landroid/preference/PreferenceScreen;

    invoke-virtual {v2}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v2

    if-eqz v2, :cond_0

    .line 254
    iget-object v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNListContainer:Landroid/preference/PreferenceScreen;

    invoke-virtual {v2}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 257
    :cond_0
    iget-object v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mPreferenceMap:Ljava/util/Map;

    if-eqz v2, :cond_1

    .line 258
    iget-object v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mPreferenceMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 261
    :cond_1
    iget-object v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    if-eqz v2, :cond_2

    .line 262
    iget-object v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 264
    :cond_2
    iput-object p1, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    .line 265
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_5

    .line 267
    :cond_3
    const-string v2, "Settings/PLMNListPreference"

    const-string v3, "refreshPreference : NULL PLMN list!"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    if-nez p1, :cond_4

    .line 270
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    .line 282
    :cond_4
    return-void

    .line 274
    :cond_5
    new-instance v2, Lcom/mediatek/settings/PLMNListPreference$NetworkCompare;

    invoke-direct {v2, p0}, Lcom/mediatek/settings/PLMNListPreference$NetworkCompare;-><init>(Lcom/mediatek/settings/PLMNListPreference;)V

    invoke-static {p1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 276
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;

    .line 277
    .local v1, network:Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;
    invoke-direct {p0, v1}, Lcom/mediatek/settings/PLMNListPreference;->addPLMNPreference(Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;)V

    .line 279
    const-string v2, "Settings/PLMNListPreference"

    invoke-virtual {v1}, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private setScreenEnabled()V
    .locals 5

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 644
    const/4 v1, 0x0

    .line 645
    .local v1, isShouldEnabled:Z
    iget-object v4, p0, Lcom/mediatek/settings/PLMNListPreference;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v4

    if-nez v4, :cond_0

    move v0, v2

    .line 646
    .local v0, isIdle:Z
    :goto_0
    if-eqz v0, :cond_1

    iget-boolean v4, p0, Lcom/mediatek/settings/PLMNListPreference;->mAirplaneModeEnabled:Z

    if-nez v4, :cond_1

    iget v4, p0, Lcom/mediatek/settings/PLMNListPreference;->mDualSimMode:I

    if-eqz v4, :cond_1

    move v1, v2

    .line 647
    :goto_1
    invoke-virtual {p0}, Lcom/mediatek/settings/PLMNListPreference;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    .line 648
    invoke-virtual {p0}, Lcom/mediatek/settings/PLMNListPreference;->invalidateOptionsMenu()V

    .line 649
    return-void

    .end local v0           #isIdle:Z
    :cond_0
    move v0, v3

    .line 645
    goto :goto_0

    .restart local v0       #isIdle:Z
    :cond_1
    move v1, v3

    .line 646
    goto :goto_1
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "intent"

    .prologue
    const/16 v5, 0xc8

    const/16 v4, 0x64

    .line 325
    const-string v1, "Settings/PLMNListPreference"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "resultCode = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    const-string v1, "Settings/PLMNListPreference"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "requestCode = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    if-eqz p3, :cond_0

    iget v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mSlotId:I

    invoke-direct {p0, v1}, Lcom/mediatek/settings/PLMNListPreference;->isSimStateReady(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 334
    invoke-direct {p0, p3}, Lcom/mediatek/settings/PLMNListPreference;->createNetworkInfo(Landroid/content/Intent;)Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;

    move-result-object v0

    .line 335
    .local v0, newInfo:Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;
    if-ne p2, v5, :cond_1

    .line 336
    iget-object v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mOldInfo:Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;

    invoke-direct {p0, v1}, Lcom/mediatek/settings/PLMNListPreference;->genDelete(Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/settings/PLMNListPreference;->handleSetPLMN(Ljava/util/ArrayList;)V

    .line 345
    .end local v0           #newInfo:Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;
    :cond_0
    :goto_0
    return-void

    .line 337
    .restart local v0       #newInfo:Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;
    :cond_1
    if-ne p2, v4, :cond_0

    .line 338
    if-ne p1, v4, :cond_2

    .line 339
    invoke-direct {p0, v0}, Lcom/mediatek/settings/PLMNListPreference;->handlePLMNListAdd(Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;)V

    goto :goto_0

    .line 340
    :cond_2
    if-ne p1, v5, :cond_0

    .line 341
    iget-object v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mOldInfo:Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;

    invoke-direct {p0, v0, v1}, Lcom/mediatek/settings/PLMNListPreference;->genModifyEx(Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/settings/PLMNListPreference;->handleSetPLMN(Ljava/util/ArrayList;)V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "icicle"

    .prologue
    .line 122
    invoke-super {p0, p1}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 123
    const v1, 0x7f060019

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/PLMNListPreference;->addPreferencesFromResource(I)V

    .line 124
    const-string v1, "button_plmn_list_key"

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/PLMNListPreference;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/PreferenceScreen;

    iput-object v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNListContainer:Landroid/preference/PreferenceScreen;

    .line 125
    invoke-static {}, Lcom/android/internal/telephony/PhoneFactory;->getDefaultPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 126
    invoke-virtual {p0}, Lcom/mediatek/settings/PLMNListPreference;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "simId"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mSlotId:I

    .line 128
    const-string v1, "phone"

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/PLMNListPreference;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    iput-object v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 129
    iget-object v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/16 v3, 0x20

    invoke-virtual {v1, v2, v3}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 131
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mIntentFilter:Landroid/content/IntentFilter;

    .line 132
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 133
    iget-object v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.DUAL_SIM_MODE"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 135
    :cond_0
    iget-object v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 136
    iget-object v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 137
    iget-object v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v1, v2}, Lcom/mediatek/settings/PLMNListPreference;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 138
    invoke-virtual {p0}, Lcom/mediatek/settings/PLMNListPreference;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 139
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_1

    .line 141
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 143
    :cond_1
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3
    .parameter "menu"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 170
    invoke-super {p0, p1}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 171
    const v0, 0x7f0d0123

    invoke-interface {p1, v2, v1, v2, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 173
    return v1
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    .line 147
    invoke-super {p0}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onDestroy()V

    .line 148
    iget-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/PLMNListPreference;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 149
    iget-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    if-eqz v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/mediatek/settings/PLMNListPreference;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 153
    :cond_0
    return-void
.end method

.method public onFinished(Landroid/preference/Preference;Z)V
    .locals 0
    .parameter "preference"
    .parameter "reading"

    .prologue
    .line 236
    invoke-super {p0, p1, p2}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onFinished(Landroid/preference/Preference;Z)V

    .line 237
    invoke-direct {p0}, Lcom/mediatek/settings/PLMNListPreference;->setScreenEnabled()V

    .line 238
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 5
    .parameter "item"

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x0

    .line 189
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    .line 207
    :goto_0
    invoke-super {p0, p1}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_1
    return v1

    .line 191
    :sswitch_0
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/NetworkEditor;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 192
    .local v0, intent:Landroid/content/Intent;
    const-string v2, "plmn_name"

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 193
    const-string v2, "plmn_code"

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 194
    const-string v2, "plmn_priority"

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 195
    const-string v2, "plmn_service"

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 196
    const-string v2, "plmn_add"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 197
    const-string v1, "plmn_size"

    iget-object v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mPLMNList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 198
    const-string v1, "plmn_slot"

    iget v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mSlotId:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 199
    const/16 v1, 0x64

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/settings/PLMNListPreference;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 202
    .end local v0           #intent:Landroid/content/Intent;
    :sswitch_1
    invoke-virtual {p0}, Lcom/mediatek/settings/PLMNListPreference;->finish()V

    goto :goto_1

    .line 189
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x102002c -> :sswitch_1
    .end sparse-switch
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 3
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    .line 311
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/NetworkEditor;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 312
    .local v1, intent:Landroid/content/Intent;
    iget-object v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mPreferenceMap:Ljava/util/Map;

    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;

    .line 314
    .local v0, info:Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;
    if-nez v0, :cond_0

    .line 315
    const/4 v2, 0x0

    .line 320
    :goto_0
    return v2

    .line 317
    :cond_0
    iput-object v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mOldInfo:Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;

    .line 318
    invoke-direct {p0, v1, v0}, Lcom/mediatek/settings/PLMNListPreference;->extractInfoFromNetworkInfo(Landroid/content/Intent;Lcom/android/internal/telephony/gsm/NetworkInfoWithAcT;)V

    .line 319
    const/16 v2, 0xc8

    invoke-virtual {p0, v1, v2}, Lcom/mediatek/settings/PLMNListPreference;->startActivityForResult(Landroid/content/Intent;I)V

    .line 320
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 5
    .parameter "menu"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 178
    const/4 v1, 0x0

    .line 179
    .local v1, isShouldEnabled:Z
    iget-object v4, p0, Lcom/mediatek/settings/PLMNListPreference;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v4

    if-nez v4, :cond_1

    move v0, v2

    .line 180
    .local v0, isIdle:Z
    :goto_0
    if-eqz v0, :cond_2

    iget-boolean v4, p0, Lcom/mediatek/settings/PLMNListPreference;->mAirplaneModeEnabled:Z

    if-nez v4, :cond_2

    iget v4, p0, Lcom/mediatek/settings/PLMNListPreference;->mDualSimMode:I

    if-eqz v4, :cond_2

    move v1, v2

    .line 181
    :goto_1
    if-eqz p1, :cond_0

    .line 182
    invoke-interface {p1, v3, v1}, Landroid/view/Menu;->setGroupEnabled(IZ)V

    .line 184
    :cond_0
    invoke-super {p0, p1}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v2

    return v2

    .end local v0           #isIdle:Z
    :cond_1
    move v0, v3

    .line 179
    goto :goto_0

    .restart local v0       #isIdle:Z
    :cond_2
    move v1, v3

    .line 180
    goto :goto_1
.end method

.method public onResume()V
    .locals 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v4, -0x1

    .line 156
    invoke-super {p0}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onResume()V

    .line 157
    invoke-direct {p0}, Lcom/mediatek/settings/PLMNListPreference;->getSIMCapability()V

    .line 158
    iget v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mSlotId:I

    invoke-direct {p0, p0, v1, v2}, Lcom/mediatek/settings/PLMNListPreference;->init(Lcom/mediatek/phone/TimeConsumingPreferenceListener;ZI)V

    .line 159
    invoke-virtual {p0}, Lcom/mediatek/settings/PLMNListPreference;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "airplane_mode_on"

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_1

    :goto_0
    iput-boolean v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mAirplaneModeEnabled:Z

    .line 161
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 162
    invoke-virtual {p0}, Lcom/mediatek/settings/PLMNListPreference;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "dual_sim_mode_setting"

    invoke-static {v0, v1, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/settings/PLMNListPreference;->mDualSimMode:I

    .line 164
    const-string v0, "Settings/PLMNListPreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Settings.onResume(), mDualSimMode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/settings/PLMNListPreference;->mDualSimMode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    :cond_0
    return-void

    :cond_1
    move v0, v1

    .line 159
    goto :goto_0
.end method
