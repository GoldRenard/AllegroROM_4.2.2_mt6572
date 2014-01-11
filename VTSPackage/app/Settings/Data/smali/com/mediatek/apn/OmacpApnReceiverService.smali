.class public Lcom/mediatek/apn/OmacpApnReceiverService;
.super Landroid/app/IntentService;
.source "OmacpApnReceiverService.java"


# static fields
.field private static final ACTION_BROADCAST:Ljava/lang/String; = "broadcast_receiver"

.field private static final ACTION_OMACP_RESULT:Ljava/lang/String; = "com.mediatek.omacp.settings.result"

.field private static final APN_APN:Ljava/lang/String; = "NAP-ADDRESS"

.field private static final APN_AUTH_TYPE:Ljava/lang/String; = "AUTHTYPE"

.field private static final APN_EXIST:J = 0x0L

.field private static final APN_ID:Ljava/lang/String; = "APN-ID"

.field private static final APN_MMSC:Ljava/lang/String; = "MMSC"

.field private static final APN_MMS_PORT:Ljava/lang/String; = "MMS-PORT"

.field private static final APN_MMS_PROXY:Ljava/lang/String; = "MMS-PROXY"

.field private static final APN_NAME:Ljava/lang/String; = "NAP-NAME"

.field private static final APN_NAP_ID:Ljava/lang/String; = "NAPID"

.field private static final APN_NO_UPDATE:J = -0x1L

.field private static final APN_PASSWORD:Ljava/lang/String; = "AUTHSECRET"

.field private static final APN_PORT:Ljava/lang/String; = "PORTNBR"

.field private static final APN_PROXY:Ljava/lang/String; = "PXADDR"

.field private static final APN_PROXY_ID:Ljava/lang/String; = "PROXY-ID"

.field private static final APN_SERVER:Ljava/lang/String; = "SERVER"

.field private static final APN_SETTING_INTENT:Ljava/lang/String; = "apn_setting_intent"

.field private static final APN_TYPE:Ljava/lang/String; = "APN-TYPE"

.field private static final APN_USERNAME:Ljava/lang/String; = "AUTHNAME"

.field private static final APP_ID:Ljava/lang/String; = "appId"

.field private static final APP_ID_APN:Ljava/lang/String; = "apn"

.field private static final MMS_TYPE:Ljava/lang/String; = "mms"

.field private static final NAP_AUTH_INFO:Ljava/lang/String; = "NAPAUTHINFO"

.field private static final PORT:Ljava/lang/String; = "PORT"

.field private static final TAG:Ljava/lang/String; = "OmacpApnReceiverService"

.field private static sAuthType:I

.field private static sCONTEXT:Landroid/content/Context;


# instance fields
.field private mApn:Ljava/lang/String;

.field private mApnId:Ljava/lang/String;

.field private mAuthType:Ljava/lang/String;

.field private mIntentList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private mIsMmsApn:Z

.field private mMcc:Ljava/lang/String;

.field private mMmsPort:Ljava/lang/String;

.field private mMmsProxy:Ljava/lang/String;

.field private mMmsc:Ljava/lang/String;

.field private mMnc:Ljava/lang/String;

.field private mName:Ljava/lang/String;

.field private mNapId:Ljava/lang/String;

.field private mNumeric:Ljava/lang/String;

.field private mPassword:Ljava/lang/String;

.field private mPort:Ljava/lang/String;

.field private mPreferedUri:Landroid/net/Uri;

.field private mProxy:Ljava/lang/String;

.field private mProxyId:Ljava/lang/String;

.field private mReplaceApnExt:Lcom/mediatek/settings/ext/IReplaceApnProfileExt;

.field private mResult:Z

.field private mServer:Ljava/lang/String;

.field private mSimId:I

.field private mTelephonyService:Lcom/android/internal/telephony/ITelephony;

.field private mType:Ljava/lang/String;

.field private mUri:Landroid/net/Uri;

.field private mUserName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 73
    const/4 v0, -0x1

    sput v0, Lcom/mediatek/apn/OmacpApnReceiverService;->sAuthType:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 128
    const-string v0, "OmacpApnReceiverService"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 105
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mIsMmsApn:Z

    .line 107
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mResult:Z

    .line 129
    return-void
.end method

.method private extractAPN(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 3
    .parameter "intent"
    .parameter "context"

    .prologue
    .line 335
    const-string v0, "NAP-NAME"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mName:Ljava/lang/String;

    .line 337
    iget-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_1

    .line 338
    :cond_0
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0807

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mName:Ljava/lang/String;

    .line 340
    :cond_1
    const-string v0, "NAP-ADDRESS"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mApn:Ljava/lang/String;

    .line 341
    const-string v0, "PXADDR"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mProxy:Ljava/lang/String;

    .line 344
    invoke-direct {p0, p1}, Lcom/mediatek/apn/OmacpApnReceiverService;->getPort(Landroid/content/Intent;)V

    .line 346
    invoke-direct {p0, p1}, Lcom/mediatek/apn/OmacpApnReceiverService;->getNapAuthInfo(Landroid/content/Intent;)V

    .line 348
    const-string v0, "SERVER"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mServer:Ljava/lang/String;

    .line 349
    const-string v0, "MMSC"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mMmsc:Ljava/lang/String;

    .line 350
    const-string v0, "MMS-PROXY"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mMmsProxy:Ljava/lang/String;

    .line 351
    const-string v0, "MMS-PORT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mMmsPort:Ljava/lang/String;

    .line 352
    const-string v0, "APN-TYPE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mType:Ljava/lang/String;

    .line 353
    const-string v0, "APN-ID"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mApnId:Ljava/lang/String;

    .line 354
    const-string v0, "NAPID"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mNapId:Ljava/lang/String;

    .line 355
    const-string v0, "PROXY-ID"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mProxyId:Ljava/lang/String;

    .line 357
    const-string v0, "mms"

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mIsMmsApn:Z

    .line 358
    const-string v0, "OmacpApnReceiverService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "extractAPN: mName: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | mApn: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mApn:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | mProxy: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mProxy:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | mServer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mServer:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | mMmsc: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mMmsc:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | mMmsProxy: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mMmsProxy:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | mMmsPort: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mMmsPort:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | mType: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | mApnId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mApnId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | mNapId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mNapId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | mMmsPort: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mMmsPort:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | mProxyId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mProxyId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | mIsMmsApn: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mIsMmsApn:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 365
    return-void
.end method

.method private getNapAuthInfo(Landroid/content/Intent;)V
    .locals 4
    .parameter "intent"

    .prologue
    const/4 v2, 0x0

    .line 301
    iput-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mUserName:Ljava/lang/String;

    .line 302
    iput-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mPassword:Ljava/lang/String;

    .line 303
    iput-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mAuthType:Ljava/lang/String;

    .line 304
    const/4 v2, -0x1

    sput v2, Lcom/mediatek/apn/OmacpApnReceiverService;->sAuthType:I

    .line 306
    const-string v2, "NAPAUTHINFO"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getExtra(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 308
    .local v0, napAuthInfo:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-eqz v0, :cond_0

    .line 309
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 310
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 311
    .local v1, napAuthInfoMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "AUTHNAME"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mUserName:Ljava/lang/String;

    .line 312
    const-string v2, "AUTHSECRET"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mPassword:Ljava/lang/String;

    .line 313
    const-string v2, "AUTHTYPE"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mAuthType:Ljava/lang/String;

    .line 315
    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mAuthType:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 316
    const-string v2, "PAP"

    iget-object v3, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mAuthType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 317
    const/4 v2, 0x1

    sput v2, Lcom/mediatek/apn/OmacpApnReceiverService;->sAuthType:I

    .line 326
    .end local v1           #napAuthInfoMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    :goto_0
    return-void

    .line 318
    .restart local v1       #napAuthInfoMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    const-string v2, "CHAP"

    iget-object v3, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mAuthType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 319
    const/4 v2, 0x2

    sput v2, Lcom/mediatek/apn/OmacpApnReceiverService;->sAuthType:I

    goto :goto_0

    .line 321
    :cond_2
    const/4 v2, 0x3

    sput v2, Lcom/mediatek/apn/OmacpApnReceiverService;->sAuthType:I

    goto :goto_0
.end method

.method private getPort(Landroid/content/Intent;)V
    .locals 3
    .parameter "intent"

    .prologue
    .line 285
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mPort:Ljava/lang/String;

    .line 286
    const-string v2, "PORT"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getExtra(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 288
    .local v0, portList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-eqz v0, :cond_0

    .line 289
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 290
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 291
    .local v1, portMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "PORTNBR"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mPort:Ljava/lang/String;

    .line 294
    .end local v1           #portMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    return-void
.end method

.method private initState(Landroid/content/Intent;)Z
    .locals 3
    .parameter "intent"

    .prologue
    .line 508
    const-string v0, "simId"

    const/4 v1, -0x2

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mSimId:I

    .line 509
    const-string v0, "OmacpApnReceiverService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "GEMINI_SIM_ID_KEY = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mSimId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 511
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->NUMERIC_LIST:[Ljava/lang/String;

    iget v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mSimId:I

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mNumeric:Ljava/lang/String;

    .line 512
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PREFERRED_URI_LIST:[Landroid/net/Uri;

    iget v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mSimId:I

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mPreferedUri:Landroid/net/Uri;

    .line 519
    const-string v0, "OmacpApnReceiverService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initState: mSimId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mSimId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | mNumeric: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mNumeric:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | mPreferedUri: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mPreferedUri:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 522
    iget-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mNumeric:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/mediatek/apn/OmacpApnReceiverService;->verifyMccMnc(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static processBroadcastIntent(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter "context"
    .parameter "broadcastIntent"

    .prologue
    .line 134
    sput-object p0, Lcom/mediatek/apn/OmacpApnReceiverService;->sCONTEXT:Landroid/content/Context;

    .line 135
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/apn/OmacpApnReceiverService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 136
    .local v0, i:Landroid/content/Intent;
    const-string v1, "broadcast_receiver"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 137
    const-string v1, "android.intent.extra.INTENT"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 138
    const-string v1, "OmacpApnReceiverService"

    const-string v2, "startService"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 140
    return-void
.end method

.method private sendFeedback(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 225
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 226
    .local v0, it:Landroid/content/Intent;
    const-string v1, "com.mediatek.omacp.settings.result"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 227
    const-string v1, "appId"

    const-string v2, "apn"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 228
    const-string v1, "result"

    iget-boolean v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mResult:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 229
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 230
    return-void
.end method

.method private setCurrentApn(Landroid/content/Context;JLandroid/net/Uri;)Z
    .locals 7
    .parameter "context"
    .parameter "apnToUseId"
    .parameter "preferedUri"

    .prologue
    .line 371
    const/4 v2, 0x0

    .line 372
    .local v2, row:I
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 373
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "apn_id"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 374
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 376
    .local v1, mContentResolver:Landroid/content/ContentResolver;
    const/4 v4, 0x0

    const/4 v5, 0x0

    :try_start_0
    invoke-virtual {v1, p4, v3, v4, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 377
    const-string v4, "OmacpApnReceiverService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "update preferred uri ,row = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 381
    :goto_0
    if-lez v2, :cond_0

    const/4 v4, 0x1

    :goto_1
    return v4

    .line 378
    :catch_0
    move-exception v0

    .line 379
    .local v0, e:Landroid/database/SQLException;
    const-string v4, "OmacpApnReceiverService"

    const-string v5, "SetCurrentApn SQLException happened!"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 381
    .end local v0           #e:Landroid/database/SQLException;
    :cond_0
    const/4 v4, 0x0

    goto :goto_1
.end method

.method private updateApn(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;Landroid/net/Uri;I)V
    .locals 17
    .parameter "context"
    .parameter "uri"
    .parameter "apn"
    .parameter "apnId"
    .parameter "name"
    .parameter "values"
    .parameter "numeric"
    .parameter "peferredUri"
    .parameter "slotId"

    .prologue
    .line 394
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/apn/OmacpApnReceiverService;->mReplaceApnExt:Lcom/mediatek/settings/ext/IReplaceApnProfileExt;

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    move-object/from16 v10, p7

    invoke-interface/range {v3 .. v10}, Lcom/mediatek/settings/ext/IReplaceApnProfileExt;->replaceApn(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;)J

    move-result-wide v15

    .line 397
    .local v15, replaceNum:J
    const-string v3, "OmacpApnReceiverService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "replace number = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide v0, v15

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 399
    move-wide v12, v15

    .line 403
    .local v12, insertNum:J
    const-wide/16 v3, -0x1

    cmp-long v3, v15, v3

    if-nez v3, :cond_0

    .line 404
    move-object/from16 v0, p0

    move-object/from16 v1, p6

    move/from16 v2, p9

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/apn/OmacpApnReceiverService;->addMVNOItem(Landroid/content/ContentValues;I)Landroid/content/ContentValues;

    move-result-object p6

    .line 406
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    move-object/from16 v0, p2

    move-object/from16 v1, p6

    invoke-virtual {v3, v0, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v14

    .line 407
    .local v14, newRow:Landroid/net/Uri;
    if-eqz v14, :cond_0

    .line 408
    const-string v3, "OmacpApnReceiverService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "uri = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    invoke-virtual {v14}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    .line 410
    invoke-virtual {v14}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v12

    .line 411
    const-string v3, "OmacpApnReceiverService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "insert row id = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 419
    .end local v14           #newRow:Landroid/net/Uri;
    :cond_0
    :goto_0
    const-string v3, "OmacpApnReceiverService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "insert number = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 423
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/mediatek/apn/OmacpApnReceiverService;->mIsMmsApn:Z

    if-eqz v3, :cond_2

    .line 424
    const-wide/16 v3, -0x1

    cmp-long v3, v12, v3

    if-nez v3, :cond_1

    .line 425
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/mediatek/apn/OmacpApnReceiverService;->mResult:Z

    .line 426
    const-string v3, "OmacpApnReceiverService"

    const-string v4, "mms ,insertNum is APN_NO_UPDATE ,mResult = false"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 445
    :cond_1
    :goto_1
    return-void

    .line 414
    :catch_0
    move-exception v11

    .line 415
    .local v11, e:Landroid/database/SQLException;
    const-string v3, "OmacpApnReceiverService"

    const-string v4, "insert SQLException happened!"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/mediatek/apn/OmacpApnReceiverService;->mResult:Z

    goto :goto_0

    .line 432
    .end local v11           #e:Landroid/database/SQLException;
    :cond_2
    const-wide/16 v3, -0x1

    cmp-long v3, v12, v3

    if-nez v3, :cond_3

    .line 433
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/mediatek/apn/OmacpApnReceiverService;->mResult:Z

    .line 434
    const-string v3, "OmacpApnReceiverService"

    const-string v4, "not mms ,insertNum is APN_NO_UPDATE ,mResult = false"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 435
    :cond_3
    const-wide/16 v3, 0x0

    cmp-long v3, v12, v3

    if-nez v3, :cond_4

    .line 436
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/mediatek/apn/OmacpApnReceiverService;->mResult:Z

    .line 437
    const-string v3, "OmacpApnReceiverService"

    const-string v4, "not mms ,  insertNum is APN_EXIST ,mResult = true"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 439
    :cond_4
    move-object/from16 v0, p0

    iget v3, v0, Lcom/mediatek/apn/OmacpApnReceiverService;->mSimId:I

    move/from16 v0, p9

    if-ne v0, v3, :cond_1

    .line 440
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p8

    invoke-direct {v0, v1, v12, v13, v2}, Lcom/mediatek/apn/OmacpApnReceiverService;->setCurrentApn(Landroid/content/Context;JLandroid/net/Uri;)Z

    move-result v3

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/mediatek/apn/OmacpApnReceiverService;->mResult:Z

    .line 441
    const-string v3, "OmacpApnReceiverService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "set current apn result , mResult = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/mediatek/apn/OmacpApnReceiverService;->mResult:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private validateProfile(Landroid/content/ContentValues;)V
    .locals 3
    .parameter "values"

    .prologue
    const/4 v2, 0x2

    .line 239
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    aget-object v0, v0, v2

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mApn:Ljava/lang/String;

    invoke-static {v1}, Lcom/mediatek/apn/ApnUtils;->checkNotSet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 241
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/4 v1, 0x3

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mProxy:Ljava/lang/String;

    invoke-static {v1}, Lcom/mediatek/apn/ApnUtils;->checkNotSet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/4 v1, 0x4

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mPort:Ljava/lang/String;

    invoke-static {v1}, Lcom/mediatek/apn/ApnUtils;->checkNotSet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/4 v1, 0x5

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mUserName:Ljava/lang/String;

    invoke-static {v1}, Lcom/mediatek/apn/ApnUtils;->checkNotSet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/4 v1, 0x6

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mServer:Ljava/lang/String;

    invoke-static {v1}, Lcom/mediatek/apn/ApnUtils;->checkNotSet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/4 v1, 0x7

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mPassword:Ljava/lang/String;

    invoke-static {v1}, Lcom/mediatek/apn/ApnUtils;->checkNotSet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0x8

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mMmsc:Ljava/lang/String;

    invoke-static {v1}, Lcom/mediatek/apn/ApnUtils;->checkNotSet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0x9

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mMcc:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0xa

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mMnc:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0xc

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mMmsProxy:Ljava/lang/String;

    invoke-static {v1}, Lcom/mediatek/apn/ApnUtils;->checkNotSet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0xd

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mMmsPort:Ljava/lang/String;

    invoke-static {v1}, Lcom/mediatek/apn/ApnUtils;->checkNotSet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0xe

    aget-object v0, v0, v1

    sget v1, Lcom/mediatek/apn/OmacpApnReceiverService;->sAuthType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 252
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0xf

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mType:Ljava/lang/String;

    invoke-static {v1}, Lcom/mediatek/apn/ApnUtils;->checkNotSet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0x10

    aget-object v0, v0, v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 254
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0x11

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mApnId:Ljava/lang/String;

    invoke-static {v1}, Lcom/mediatek/apn/ApnUtils;->checkNotSet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0x12

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mNapId:Ljava/lang/String;

    invoke-static {v1}, Lcom/mediatek/apn/ApnUtils;->checkNotSet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0x13

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mProxyId:Ljava/lang/String;

    invoke-static {v1}, Lcom/mediatek/apn/ApnUtils;->checkNotSet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0xb

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mNumeric:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    return-void
.end method

.method private verifyMccMnc(Ljava/lang/String;)Z
    .locals 6
    .parameter "numeric"

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x0

    .line 264
    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mNumeric:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mNumeric:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x4

    if-le v2, v3, :cond_0

    .line 266
    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mNumeric:Ljava/lang/String;

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 268
    .local v0, mcc:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mNumeric:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 271
    .local v1, mnc:Ljava/lang/String;
    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mMcc:Ljava/lang/String;

    .line 272
    iput-object v1, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mMnc:Ljava/lang/String;

    .line 273
    const-string v2, "OmacpApnReceiverService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mcc&mnc is right , mMcc = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mMcc:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " mMnc = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mMnc:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    .end local v0           #mcc:Ljava/lang/String;
    .end local v1           #mnc:Ljava/lang/String;
    :goto_0
    iget-boolean v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mResult:Z

    return v2

    .line 275
    :cond_0
    iput-boolean v4, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mResult:Z

    .line 276
    const-string v2, "OmacpApnReceiverService"

    const-string v3, "mcc&mnc is wrong , set mResult = false"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method addMVNOItem(Landroid/content/ContentValues;I)Landroid/content/ContentValues;
    .locals 8
    .parameter "values"
    .parameter "slotId"

    .prologue
    .line 458
    const/4 v2, 0x0

    .line 462
    .local v2, isMVNO:Z
    :try_start_0
    iget-object v5, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mTelephonyService:Lcom/android/internal/telephony/ITelephony;

    invoke-interface {v5, p2}, Lcom/android/internal/telephony/ITelephony;->isIccCardProviderAsMvnoGemini(I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 470
    :goto_0
    const-string v5, "OmacpApnReceiverService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "isMVNO = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    if-eqz v2, :cond_0

    .line 474
    :try_start_1
    iget-object v5, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mTelephonyService:Lcom/android/internal/telephony/ITelephony;

    invoke-interface {v5, p2}, Lcom/android/internal/telephony/ITelephony;->getSpNameInEfSpnGemini(I)Ljava/lang/String;

    move-result-object v4

    .line 475
    .local v4, spn:Ljava/lang/String;
    iget-object v5, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mTelephonyService:Lcom/android/internal/telephony/ITelephony;

    invoke-interface {v5, p2}, Lcom/android/internal/telephony/ITelephony;->isOperatorMvnoForImsiGemini(I)Ljava/lang/String;

    move-result-object v1

    .line 476
    .local v1, imsi:Ljava/lang/String;
    iget-object v5, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mTelephonyService:Lcom/android/internal/telephony/ITelephony;

    invoke-interface {v5, p2}, Lcom/android/internal/telephony/ITelephony;->isOperatorMvnoForEfPnnGemini(I)Ljava/lang/String;

    move-result-object v3

    .line 482
    .local v3, pnn:Ljava/lang/String;
    const-string v5, "OmacpApnReceiverService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "spn = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 483
    const-string v5, "OmacpApnReceiverService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "imsi = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 484
    const-string v5, "OmacpApnReceiverService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "pnn = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 487
    const-string v5, "imsi"

    invoke-virtual {p1, v5, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 498
    .end local v1           #imsi:Ljava/lang/String;
    .end local v3           #pnn:Ljava/lang/String;
    .end local v4           #spn:Ljava/lang/String;
    :cond_0
    :goto_1
    return-object p1

    .line 466
    :catch_0
    move-exception v0

    .line 467
    .local v0, e:Landroid/os/RemoteException;
    const-string v5, "OmacpApnReceiverService"

    const-string v6, "RemoteException"

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 488
    .end local v0           #e:Landroid/os/RemoteException;
    .restart local v1       #imsi:Ljava/lang/String;
    .restart local v3       #pnn:Ljava/lang/String;
    .restart local v4       #spn:Ljava/lang/String;
    :cond_1
    if-eqz v4, :cond_2

    :try_start_2
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    .line 489
    const-string v5, "spn"

    invoke-virtual {p1, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 493
    .end local v1           #imsi:Ljava/lang/String;
    .end local v3           #pnn:Ljava/lang/String;
    .end local v4           #spn:Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 494
    .restart local v0       #e:Landroid/os/RemoteException;
    const-string v5, "OmacpApnReceiverService"

    const-string v6, "RemoteException"

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 491
    .end local v0           #e:Landroid/os/RemoteException;
    .restart local v1       #imsi:Ljava/lang/String;
    .restart local v3       #pnn:Ljava/lang/String;
    .restart local v4       #spn:Ljava/lang/String;
    :cond_2
    :try_start_3
    const-string v5, "pnn"

    invoke-virtual {p1, v5, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 14
    .parameter "intent"

    .prologue
    const/4 v3, 0x0

    .line 143
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v10

    .line 144
    .local v10, action:Ljava/lang/String;
    const-string v0, "OmacpApnReceiverService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "get action = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    const-string v0, "broadcast_receiver"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 215
    :goto_0
    return-void

    .line 149
    :cond_0
    sget-object v0, Lcom/mediatek/apn/OmacpApnReceiverService;->sCONTEXT:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/settings/Utils;->getReplaceApnPlugin(Landroid/content/Context;)Lcom/mediatek/settings/ext/IReplaceApnProfileExt;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mReplaceApnExt:Lcom/mediatek/settings/ext/IReplaceApnProfileExt;

    .line 150
    sget-object v0, Lcom/mediatek/apn/OmacpApnReceiverService;->sCONTEXT:Landroid/content/Context;

    const-string v0, "phone"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mTelephonyService:Lcom/android/internal/telephony/ITelephony;

    .line 152
    const-string v0, "android.intent.extra.INTENT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v11

    check-cast v11, Landroid/content/Intent;

    .line 154
    .local v11, broadcastIntent:Landroid/content/Intent;
    const-string v0, "apn_setting_intent"

    invoke-virtual {v11, v0}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mIntentList:Ljava/util/ArrayList;

    .line 156
    iget-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mIntentList:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 157
    iput-boolean v3, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mResult:Z

    .line 158
    sget-object v0, Lcom/mediatek/apn/OmacpApnReceiverService;->sCONTEXT:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/mediatek/apn/OmacpApnReceiverService;->sendFeedback(Landroid/content/Context;)V

    .line 159
    const-string v0, "OmacpApnReceiverService"

    const-string v1, "mIntentList == null"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 163
    :cond_1
    iget-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mIntentList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v13

    .line 165
    .local v13, sizeIntent:I
    const-string v0, "OmacpApnReceiverService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "apn list size is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    if-gtz v13, :cond_2

    .line 168
    iput-boolean v3, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mResult:Z

    .line 169
    sget-object v0, Lcom/mediatek/apn/OmacpApnReceiverService;->sCONTEXT:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/mediatek/apn/OmacpApnReceiverService;->sendFeedback(Landroid/content/Context;)V

    .line 170
    const-string v0, "OmacpApnReceiverService"

    const-string v1, "Intent list size is wrong"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 175
    :cond_2
    iget-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mIntentList:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    invoke-direct {p0, v0}, Lcom/mediatek/apn/OmacpApnReceiverService;->initState(Landroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 176
    sget-object v0, Lcom/mediatek/apn/OmacpApnReceiverService;->sCONTEXT:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/mediatek/apn/OmacpApnReceiverService;->sendFeedback(Landroid/content/Context;)V

    .line 177
    const-string v0, "OmacpApnReceiverService"

    const-string v1, "Can not get MCC+MNC"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 186
    :cond_3
    const-string v0, "OmacpApnReceiverService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PhoneConstants.GEMINI_SIM_NUM "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    const/4 v9, 0x0

    .local v9, slotId:I
    :goto_1
    iget-boolean v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mResult:Z

    if-eqz v0, :cond_5

    sget v0, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    if-ge v9, v0, :cond_5

    .line 188
    sget-object v0, Lcom/mediatek/apn/ApnUtils;->URI_LIST:[Landroid/net/Uri;

    aget-object v0, v0, v9

    iput-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mUri:Landroid/net/Uri;

    .line 189
    const-string v0, "OmacpApnReceiverService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "slotId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " mUri = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mUri:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " mNumeric = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mNumeric:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " mPreferedUri = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mPreferedUri:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    const/4 v12, 0x0

    .local v12, k:I
    :goto_2
    iget-boolean v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mResult:Z

    if-eqz v0, :cond_4

    if-ge v12, v13, :cond_4

    .line 193
    iget-object v0, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mIntentList:Ljava/util/ArrayList;

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    sget-object v1, Lcom/mediatek/apn/OmacpApnReceiverService;->sCONTEXT:Landroid/content/Context;

    invoke-direct {p0, v0, v1}, Lcom/mediatek/apn/OmacpApnReceiverService;->extractAPN(Landroid/content/Intent;Landroid/content/Context;)V

    .line 194
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 195
    .local v6, values:Landroid/content/ContentValues;
    invoke-direct {p0, v6}, Lcom/mediatek/apn/OmacpApnReceiverService;->validateProfile(Landroid/content/ContentValues;)V

    .line 196
    sget-object v1, Lcom/mediatek/apn/OmacpApnReceiverService;->sCONTEXT:Landroid/content/Context;

    iget-object v2, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mUri:Landroid/net/Uri;

    iget-object v3, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mApn:Ljava/lang/String;

    iget-object v4, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mApnId:Ljava/lang/String;

    iget-object v5, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mName:Ljava/lang/String;

    iget-object v7, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mNumeric:Ljava/lang/String;

    iget-object v8, p0, Lcom/mediatek/apn/OmacpApnReceiverService;->mPreferedUri:Landroid/net/Uri;

    move-object v0, p0

    invoke-direct/range {v0 .. v9}, Lcom/mediatek/apn/OmacpApnReceiverService;->updateApn(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;Landroid/net/Uri;I)V

    .line 191
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 187
    .end local v6           #values:Landroid/content/ContentValues;
    :cond_4
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 214
    .end local v12           #k:I
    :cond_5
    sget-object v0, Lcom/mediatek/apn/OmacpApnReceiverService;->sCONTEXT:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/mediatek/apn/OmacpApnReceiverService;->sendFeedback(Landroid/content/Context;)V

    goto/16 :goto_0
.end method
