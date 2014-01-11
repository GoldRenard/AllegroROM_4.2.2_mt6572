.class public Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;
.super Ljava/lang/Object;
.source "BluetoothPbapServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$1;,
        Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = true

.field private static final IOT_DEVICE:[Ljava/lang/String; = null

.field public static final PBAP_AUTHORIZE_IND:I = 0x65

.field public static final PBAP_AUTH_CHALL_IND:I = 0x66

.field private static final PBAP_CNF_FAILED:I = 0x1

.field private static final PBAP_CNF_SUCCESS:I = 0x0

.field private static final PBAP_COMPOSE_COUNT:I = 0x64

.field public static final PBAP_SESSION_DISCONNECTED:I = 0x68

.field public static final PBAP_SESSION_ESTABLISHED:I = 0x67

.field private static final TAG:Ljava/lang/String; = "BluetoothPbapServer"


# instance fields
.field private mComposeReady:Z

.field private mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

.field private mContext:Landroid/content/Context;

.field private mIOTSolutionOn:Z

.field private mIsContinue:Z

.field private mListener:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;

.field private mLocalName:Ljava/lang/String;

.field private mLocalNumber:Ljava/lang/String;

.field private mNativeData:I

.field private mPath:Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;

.field private mRemainCount:I

.field private mResultPath:Ljava/lang/String;

.field private mServerState:I

.field private mServiceHandler:Landroid/os/Handler;

.field mSimAdn:Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;

.field private mVcardListing:Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 134
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "My Volvo Car"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->IOT_DEVICE:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/os/Handler;Landroid/content/Context;)V
    .locals 2
    .parameter "handler"
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 143
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 112
    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mSimAdn:Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;

    .line 120
    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mResultPath:Ljava/lang/String;

    .line 122
    iput-boolean v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    .line 124
    iput-boolean v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposeReady:Z

    .line 126
    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    .line 132
    iput-boolean v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIOTSolutionOn:Z

    .line 144
    iput-object p2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mContext:Landroid/content/Context;

    .line 145
    iput-object p1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mServiceHandler:Landroid/os/Handler;

    .line 146
    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mListener:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;

    .line 147
    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mPath:Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;

    .line 148
    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mLocalName:Ljava/lang/String;

    .line 149
    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mLocalNumber:Ljava/lang/String;

    .line 150
    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mVcardListing:Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;

    .line 151
    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mSimAdn:Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;

    .line 152
    iput-boolean v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    .line 153
    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    .line 154
    iput-boolean v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIOTSolutionOn:Z

    .line 155
    sget-boolean v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->sUtState:Z

    if-eqz v0, :cond_0

    .line 156
    const-string v0, "extpbap_ut"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 157
    const-string v0, "System.loadLibrary()     extpbap_ut"

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 162
    :goto_0
    invoke-static {}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->classInitNative()V

    .line 163
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->initializeNativeDataNative()V

    .line 164
    return-void

    .line 159
    :cond_0
    const-string v0, "extpbap_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 160
    const-string v0, "System.loadLibrary()     extpbap_jni"

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;Z)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->listenIndicationNative(Z)Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V

    return-void
.end method

.method private native authChallengeRspNative(ZLjava/lang/String;Ljava/lang/String;)Z
.end method

.method private native authorizeRspNative(Z)Z
.end method

.method private checkIOTSolutionOnOff(Ljava/lang/String;)V
    .locals 6
    .parameter "addr"

    .prologue
    .line 298
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    .line 299
    .local v0, adapter:Landroid/bluetooth/BluetoothAdapter;
    invoke-virtual {v0, p1}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v4

    invoke-virtual {v4}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v1

    .line 300
    .local v1, deviceName:Ljava/lang/String;
    sget-object v4, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->IOT_DEVICE:[Ljava/lang/String;

    array-length v3, v4

    .line 302
    .local v3, size:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v3, :cond_0

    .line 303
    sget-object v4, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->IOT_DEVICE:[Ljava/lang/String;

    aget-object v4, v4, v2

    invoke-virtual {v1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 304
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIOTSolutionOn:Z

    .line 308
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getRemoteDevice name is ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") IOTSolutionOn is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIOTSolutionOn:Z

    invoke-static {v5}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 309
    return-void

    .line 302
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private static native classInitNative()V
.end method

.method private native cleanupNativeDataNative()V
.end method

.method private composeVCards(IZIIJJ)I
    .locals 16
    .parameter "type"
    .parameter "vcard21"
    .parameter "listOffset"
    .parameter "maxCount"
    .parameter "filter"
    .parameter "contactID"

    .prologue
    .line 506
    const/4 v8, 0x0

    .line 508
    .local v8, handler:Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;
    const/4 v11, 0x0

    .line 509
    .local v11, ownerCard:Ljava/lang/String;
    const/4 v13, 0x0

    .line 510
    .local v13, selection:Ljava/lang/String;
    const/4 v10, 0x0

    .line 511
    .local v10, order:Ljava/lang/String;
    const/4 v12, 0x0

    .line 512
    .local v12, ownerIncl:Z
    const/4 v14, 0x0

    .line 514
    .local v14, sendCount:I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[API] composeVCards("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p4

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, p5

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, p7

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 516
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mResultPath:Ljava/lang/String;

    .line 518
    const/4 v2, -0x1

    move/from16 v0, p1

    if-ne v0, v2, :cond_0

    .line 519
    const-string v2, "[ERR] type is unknown"

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V

    .line 520
    const/16 v2, 0xc0

    .line 653
    :goto_0
    return v2

    .line 523
    :cond_0
    if-ltz p3, :cond_1

    if-gez p4, :cond_2

    .line 524
    :cond_1
    const-string v2, "[ERR] listOffset or maxCount is negtive"

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V

    .line 525
    const/16 v2, 0xc0

    goto :goto_0

    .line 528
    :cond_2
    if-eqz p1, :cond_3

    const/4 v2, 0x5

    move/from16 v0, p1

    if-ne v0, v2, :cond_4

    .line 530
    :cond_3
    const-string v10, "upper(display_name)"

    .line 535
    :goto_1
    packed-switch p1, :pswitch_data_0

    .line 586
    const-string v2, "Unsupported folder type"

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V

    .line 587
    const/16 v2, 0xd1

    goto :goto_0

    .line 532
    :cond_4
    const-string v10, "date DESC"

    goto :goto_1

    .line 537
    :pswitch_0
    const-string v13, "type=1"

    .line 591
    :goto_2
    :pswitch_1
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->getLocalNameAndNum()Z

    .line 592
    new-instance v2, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mContext:Landroid/content/Context;

    if-eqz p2, :cond_d

    const/high16 v4, -0x4000

    :goto_3
    const/4 v5, 0x1

    if-eqz p1, :cond_e

    const/4 v6, 0x5

    move/from16 v0, p1

    if-eq v0, v6, :cond_e

    const/4 v6, 0x1

    :goto_4
    const/4 v7, 0x1

    invoke-direct/range {v2 .. v7}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;-><init>(Landroid/content/Context;IZZZ)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    .line 598
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    move-wide/from16 v0, p5

    invoke-virtual {v2, v0, v1}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->setVCardAttribFilter(J)V

    .line 599
    if-eqz v12, :cond_5

    .line 601
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    const/4 v3, 0x2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mLocalName:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mLocalNumber:Ljava/lang/String;

    move/from16 v0, p2

    invoke-virtual {v2, v3, v4, v5, v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->composeVCardForPhoneOwnNumber(ILjava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v11

    .line 604
    :cond_5
    new-instance v8, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;

    .end local v8           #handler:Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;
    invoke-direct {v8, v11}, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;-><init>(Ljava/lang/String;)V

    .line 605
    .restart local v8       #handler:Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    invoke-virtual {v2, v8}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->addHandler(Lcom/android/bluetooth/pbap/BluetoothVCardComposer$OneEntryHandler;)V

    .line 606
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    .line 607
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposeReady:Z

    .line 608
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    const/4 v3, 0x0

    invoke-virtual {v2, v13, v3, v10}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->init(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_f

    .line 609
    const-string v2, "composer init failed"

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V

    .line 610
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    invoke-virtual {v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->getErrorReason()Ljava/lang/String;

    move-result-object v2

    const-string v3, "There\'s no exportable in the database"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_14

    .line 613
    const/16 v2, 0xd0

    goto/16 :goto_0

    .line 540
    :pswitch_2
    const-string v13, "type=2"

    .line 541
    goto :goto_2

    .line 543
    :pswitch_3
    const-string v13, "type=3"

    .line 544
    goto :goto_2

    .line 546
    :pswitch_4
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIOTSolutionOn:Z

    if-nez v2, :cond_6

    .line 547
    const-string v13, "indicate_phone_or_sim_contact=-1"

    .line 551
    :goto_5
    const-wide/16 v2, 0x0

    cmp-long v2, p7, v2

    if-ltz v2, :cond_8

    .line 552
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIOTSolutionOn:Z

    if-nez v2, :cond_7

    .line 553
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " AND _id= "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, p7

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 557
    :goto_6
    const/16 p3, 0x0

    .line 558
    const/16 p4, 0x1

    goto/16 :goto_2

    .line 549
    :cond_6
    const-string v13, ""

    goto :goto_5

    .line 555
    :cond_7
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_id= "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, p7

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    goto :goto_6

    .line 559
    :cond_8
    if-nez p3, :cond_9

    .line 560
    const/4 v12, 0x1

    .line 561
    add-int/lit8 p4, p4, -0x1

    goto/16 :goto_2

    .line 563
    :cond_9
    add-int/lit8 p3, p3, -0x1

    .line 565
    goto/16 :goto_2

    .line 567
    :pswitch_5
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIOTSolutionOn:Z

    if-nez v2, :cond_a

    .line 568
    const-string v13, "indicate_phone_or_sim_contact>-1"

    .line 572
    :goto_7
    const-wide/16 v2, 0x0

    cmp-long v2, p7, v2

    if-ltz v2, :cond_b

    .line 573
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " AND _id= "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, p7

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 574
    const/16 p3, 0x0

    .line 575
    const/16 p4, 0x1

    goto/16 :goto_2

    .line 570
    :cond_a
    const-string v13, "in_visible_group=1000"

    goto :goto_7

    .line 576
    :cond_b
    if-nez p3, :cond_c

    .line 577
    const/4 v12, 0x1

    .line 578
    add-int/lit8 p4, p4, -0x1

    goto/16 :goto_2

    .line 580
    :cond_c
    add-int/lit8 p3, p3, -0x1

    .line 582
    goto/16 :goto_2

    .line 592
    :cond_d
    const v4, -0x3fffffff

    goto/16 :goto_3

    :cond_e
    const/4 v6, 0x0

    goto/16 :goto_4

    .line 617
    :cond_f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    move/from16 v0, p3

    invoke-virtual {v2, v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->movePosition(I)Z

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_13

    .line 618
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    invoke-virtual {v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->getCount()I

    move-result v2

    sub-int v15, v2, p3

    .line 619
    .local v15, total:I
    move/from16 v0, p4

    if-ge v15, v0, :cond_10

    .line 620
    move-object/from16 v0, p0

    iput v15, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mRemainCount:I

    .line 626
    :goto_8
    move-object/from16 v0, p0

    iget v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mRemainCount:I

    const/16 v3, 0x64

    if-gt v2, v3, :cond_11

    .line 627
    move-object/from16 v0, p0

    iget v14, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mRemainCount:I

    .line 634
    :goto_9
    move-object/from16 v0, p0

    iget v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mRemainCount:I

    sub-int/2addr v2, v14

    move-object/from16 v0, p0

    iput v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mRemainCount:I

    .line 636
    const/4 v9, 0x0

    .local v9, i:I
    :goto_a
    if-ge v9, v14, :cond_14

    .line 637
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    invoke-virtual {v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->createOneEntry()Z

    move-result v2

    if-nez v2, :cond_12

    .line 638
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CreateEntry "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " failed "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V

    .line 639
    const/16 v2, 0xd0

    goto/16 :goto_0

    .line 623
    .end local v9           #i:I
    :cond_10
    move/from16 v0, p4

    move-object/from16 v1, p0

    iput v0, v1, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mRemainCount:I

    goto :goto_8

    .line 630
    :cond_11
    const/16 v14, 0x64

    .line 631
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    goto :goto_9

    .line 636
    .restart local v9       #i:I
    :cond_12
    add-int/lit8 v9, v9, 0x1

    goto :goto_a

    .line 644
    .end local v9           #i:I
    .end local v15           #total:I
    :cond_13
    const/16 v2, 0xc4

    goto/16 :goto_0

    .line 647
    :cond_14
    invoke-virtual {v8}, Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;->getPath()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mResultPath:Ljava/lang/String;

    .line 648
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    if-nez v2, :cond_15

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    if-eqz v2, :cond_15

    .line 649
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    invoke-virtual {v2}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->terminate()V

    .line 650
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    .line 653
    :cond_15
    const/16 v2, 0xa0

    goto/16 :goto_0

    .line 535
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_5
    .end packed-switch
.end method

.method private composeVCardsContinue()I
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 657
    const-string v5, "[API] composeVCardsContinue()+"

    invoke-direct {p0, v5}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 659
    const v1, 0xffff

    .line 660
    .local v1, missedCalls:I
    const v2, 0xffff

    .line 661
    .local v2, pbSize:I
    const/16 v3, 0xa0

    .line 662
    .local v3, ret:I
    const/4 v4, 0x0

    .line 664
    .local v4, sendCount:I
    iget-object v5, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    if-eqz v5, :cond_5

    iget-boolean v5, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    if-eqz v5, :cond_5

    .line 665
    iget v5, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mRemainCount:I

    const/16 v6, 0x64

    if-le v5, v6, :cond_3

    .line 666
    const/16 v4, 0x64

    .line 667
    iput-boolean v8, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    .line 675
    :goto_0
    iput-boolean v8, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposeReady:Z

    .line 676
    iget v5, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mRemainCount:I

    sub-int/2addr v5, v4

    iput v5, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mRemainCount:I

    .line 678
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-ge v0, v4, :cond_0

    .line 679
    iget-object v5, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    invoke-virtual {v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->createOneEntry()Z

    move-result v5

    if-nez v5, :cond_4

    .line 680
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "CreateEntry "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " failed "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V

    .line 681
    const/16 v3, 0xd0

    .line 691
    .end local v0           #i:I
    :cond_0
    :goto_2
    const/16 v5, 0xa0

    if-eq v3, v5, :cond_1

    .line 692
    iput-boolean v7, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    .line 693
    iput-boolean v7, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposeReady:Z

    .line 694
    const-string v5, "ComposeVCardsContinue failed."

    invoke-direct {p0, v5}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V

    .line 697
    :cond_1
    iget-boolean v5, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    if-nez v5, :cond_2

    iget-object v5, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    if-eqz v5, :cond_2

    .line 698
    iget-object v5, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    invoke-virtual {v5}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->terminate()V

    .line 699
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    .line 702
    :cond_2
    return v3

    .line 671
    :cond_3
    iget v4, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mRemainCount:I

    .line 672
    iput-boolean v7, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    goto :goto_0

    .line 678
    .restart local v0       #i:I
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 687
    .end local v0           #i:I
    :cond_5
    const-string v5, "ComposeVCardsContinue in wrong state."

    invoke-direct {p0, v5}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V

    .line 688
    const/16 v3, 0xd0

    goto :goto_2
.end method

.method private native connectRspNative(IZ)Z
.end method

.method private native disableNative()V
.end method

.method private native disconnectNative()V
.end method

.method private native enableNative()Z
.end method

.method private errorLog(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 947
    const-string v0, "BluetoothPbapServer"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 948
    return-void
.end method

.method private getLocalNameAndNum()Z
    .locals 3

    .prologue
    .line 191
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mContext:Landroid/content/Context;

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 193
    .local v0, tm:Landroid/telephony/TelephonyManager;
    if-eqz v0, :cond_1

    .line 194
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mLocalNumber:Ljava/lang/String;

    .line 195
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getLine1AlphaTag()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mLocalName:Ljava/lang/String;

    .line 200
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getLocalNameAndNum : name="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mLocalName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " num="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mLocalNumber:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 201
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mLocalNumber:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mLocalName:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    :cond_0
    const/4 v1, 0x1

    :goto_1
    return v1

    .line 197
    :cond_1
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1}, Ljava/lang/String;-><init>()V

    iput-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mLocalNumber:Ljava/lang/String;

    .line 198
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1}, Ljava/lang/String;-><init>()V

    iput-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mLocalName:Ljava/lang/String;

    goto :goto_0

    .line 201
    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private getNewMissedCallSize()I
    .locals 8

    .prologue
    .line 275
    sget-object v1, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    .line 276
    .local v1, myUri:Landroid/net/Uri;
    new-instance v3, Ljava/lang/String;

    const-string v0, "type=3 AND new=1"

    invoke-direct {v3, v0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 278
    .local v3, selection:Ljava/lang/String;
    const/4 v7, 0x0

    .line 280
    .local v7, size:I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getNewMissedCallSize : selection="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 281
    const/4 v6, 0x0

    .line 283
    .local v6, callCursor:Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v4, 0x0

    const-string v5, "date DESC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 285
    if-eqz v6, :cond_0

    .line 286
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .line 289
    :cond_0
    if-eqz v6, :cond_1

    .line 290
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 293
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "newMissed calls="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 294
    return v7

    .line 289
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_2

    .line 290
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v0
.end method

.method private getPbSize(I)I
    .locals 8
    .parameter "type"

    .prologue
    const/4 v2, 0x0

    .line 205
    const/4 v7, 0x0

    .line 206
    .local v7, size:I
    const/4 v0, 0x0

    .line 207
    .local v0, resolver:Landroid/content/ContentResolver;
    const/4 v6, 0x0

    .line 208
    .local v6, c:Landroid/database/Cursor;
    const/4 v1, 0x0

    .line 209
    .local v1, pbUri:Landroid/net/Uri;
    const/4 v3, 0x0

    .line 210
    .local v3, sel:Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[API] getPbSize("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 212
    iget-object v4, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 213
    if-nez v0, :cond_0

    .line 271
    :goto_0
    return v2

    .line 216
    :cond_0
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 218
    :pswitch_0
    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 219
    iget-boolean v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIOTSolutionOn:Z

    if-nez v2, :cond_3

    .line 220
    const-string v3, "indicate_phone_or_sim_contact=-1"

    .line 258
    :goto_1
    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :try_start_0
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 259
    if-eqz v6, :cond_2

    .line 260
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .line 261
    if-eqz p1, :cond_1

    const/4 v2, 0x5

    if-ne p1, v2, :cond_2

    .line 264
    :cond_1
    add-int/lit8 v7, v7, 0x1

    .line 268
    :cond_2
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    move v2, v7

    .line 271
    goto :goto_0

    .line 222
    :cond_3
    const-string v3, ""

    .line 224
    goto :goto_1

    .line 226
    :pswitch_1
    sget-object v1, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    .line 227
    const-string v3, "type=1"

    .line 228
    goto :goto_1

    .line 230
    :pswitch_2
    sget-object v1, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    .line 231
    const-string v3, "type=2"

    .line 232
    goto :goto_1

    .line 234
    :pswitch_3
    sget-object v1, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    .line 235
    const-string v3, "type=3"

    .line 236
    goto :goto_1

    .line 238
    :pswitch_4
    sget-object v1, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    .line 239
    goto :goto_1

    .line 241
    :pswitch_5
    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 242
    iget-boolean v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIOTSolutionOn:Z

    if-nez v2, :cond_4

    .line 243
    const-string v3, "indicate_phone_or_sim_contact>-1"

    goto :goto_1

    .line 245
    :cond_4
    const-string v3, "in_visible_group=1000"

    .line 247
    goto :goto_1

    .line 268
    :catchall_0
    move-exception v2

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v2

    .line 216
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method private native initializeNativeDataNative()V
.end method

.method private native listenIndicationNative(Z)Z
.end method

.method private onAbortInd()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 887
    const-string v0, "[CBK] onAbortInd()"

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 889
    iput-boolean v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    .line 890
    iput-boolean v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposeReady:Z

    .line 891
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    if-eqz v0, :cond_0

    .line 893
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    invoke-virtual {v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->terminate()V

    .line 894
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    .line 896
    :cond_0
    return-void
.end method

.method private onAuthChallInd(Ljava/lang/String;ZZ)V
    .locals 2
    .parameter "name"
    .parameter "isUserIdRequired"
    .parameter "isFullAccess"

    .prologue
    .line 899
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onAuthChallInd: name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", isUserIdRequired="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", isFullAccess="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 902
    const/16 v0, 0x66

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->sendServiceMsg(ILjava/lang/Object;)V

    .line 903
    return-void
.end method

.method private onAuthorizeInd(Ljava/lang/String;)I
    .locals 3
    .parameter "addr"

    .prologue
    .line 370
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    .line 371
    .local v0, adapter:Landroid/bluetooth/BluetoothAdapter;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[CBK] onAuthorizeInd("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 372
    if-eqz v0, :cond_0

    .line 373
    const/16 v1, 0x65

    invoke-virtual {v0, p1}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->sendServiceMsg(ILjava/lang/Object;)V

    .line 379
    :goto_0
    const/4 v1, 0x1

    return v1

    .line 376
    :cond_0
    const-string v1, "Failed to get default adapter"

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V

    .line 377
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->authorizeRspNative(Z)Z

    goto :goto_0
.end method

.method private onConnectInd(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 5
    .parameter "addr"
    .parameter "name"
    .parameter "connectionId"

    .prologue
    .line 384
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[CBK] onConnectInd("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 386
    const/4 v0, 0x1

    invoke-direct {p0, p3, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->connectRspNative(IZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 387
    new-instance v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;

    invoke-direct {v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;-><init>()V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mPath:Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;

    .line 388
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->getLocalNameAndNum()Z

    .line 389
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->checkIOTSolutionOnOff(Ljava/lang/String;)V

    .line 390
    new-instance v0, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;

    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mLocalName:Ljava/lang/String;

    iget-object v3, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mLocalNumber:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIOTSolutionOn:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mVcardListing:Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;

    .line 391
    const/16 v0, 0x67

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->sendServiceMsg(ILjava/lang/Object;)V

    .line 393
    :cond_0
    const/16 v0, 0xa0

    return v0
.end method

.method private onDisconnectInd()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 397
    const-string v0, "[CBK] onDisconnectInd"

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 400
    iput-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mPath:Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;

    .line 401
    iput-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mVcardListing:Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;

    .line 402
    iput-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mSimAdn:Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;

    .line 403
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    .line 404
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposeReady:Z

    .line 405
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIOTSolutionOn:Z

    .line 406
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    if-eqz v0, :cond_0

    .line 408
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    invoke-virtual {v0}, Lcom/android/bluetooth/pbap/BluetoothVCardComposer;->terminate()V

    .line 409
    iput-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    .line 411
    :cond_0
    const/16 v0, 0x68

    invoke-direct {p0, v0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->sendServiceMsg(ILjava/lang/Object;)V

    .line 412
    return-void
.end method

.method private onPullPhonebookContinueInd(I)I
    .locals 8
    .parameter "conId"

    .prologue
    const/16 v7, 0xa0

    const/4 v1, 0x0

    .line 706
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[CBK] onPullPhonebookContinueInd("

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "). Continue is ("

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v4, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    invoke-static {v4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ")."

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 708
    const v3, 0xffff

    .line 709
    .local v3, missedCalls:I
    const v2, 0xffff

    .line 710
    .local v2, pbSize:I
    const/16 v6, 0xa0

    .line 712
    .local v6, ret:I
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposeReady:Z

    if-nez v0, :cond_1

    .line 713
    const-string v0, "Receive PullPonebookContinueind in wrong state."

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V

    .line 715
    const/16 v6, 0xd0

    .line 721
    :goto_0
    if-ne v6, v7, :cond_2

    :goto_1
    iget-object v4, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mResultPath:Ljava/lang/String;

    iget-boolean v5, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->pullPhonebookRspNative(IIILjava/lang/String;Z)Z

    .line 724
    if-ne v6, v7, :cond_0

    iget-boolean v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    if-eqz v0, :cond_0

    .line 725
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->composeVCardsContinue()I

    move-result v6

    .line 728
    :cond_0
    return v6

    .line 718
    :cond_1
    iput-boolean v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposeReady:Z

    goto :goto_0

    .line 721
    :cond_2
    const/4 v1, 0x1

    goto :goto_1
.end method

.method private onPullPhonebookInd(ILjava/lang/String;JZII)I
    .locals 16
    .parameter "conId"
    .parameter "name"
    .parameter "filter"
    .parameter "vcard21"
    .parameter "maxListCount"
    .parameter "listStartOffset"

    .prologue
    .line 732
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[CBK] onPullPhonebookInd("

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, p3

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static/range {p5 .. p5}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p6

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p7

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ")"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 734
    const/4 v11, 0x0

    .line 737
    .local v11, handler:Lcom/android/bluetooth/pbap/BluetoothVCardEntryHandler;
    const/4 v15, 0x0

    .line 738
    .local v15, selection:Ljava/lang/String;
    const v7, 0xffff

    .line 739
    .local v7, missedCalls:I
    const v13, 0xffff

    .line 741
    .local v13, pbSize:I
    const/16 v14, 0xa0

    .line 743
    .local v14, ret:I
    const-string v2, ".vcf"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 744
    const/4 v2, 0x0

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x4

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 746
    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mPath:Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;

    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v2, v0, v4}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->getPathType(Ljava/lang/String;Z)I

    move-result v3

    .line 748
    .local v3, type:I
    const/4 v2, -0x1

    if-ne v3, v2, :cond_3

    .line 749
    const/16 v14, 0xc0

    move v6, v13

    .line 778
    .end local v13           #pbSize:I
    .local v6, pbSize:I
    :goto_0
    const/16 v2, 0xa0

    if-eq v14, v2, :cond_1

    .line 779
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    .line 782
    :cond_1
    const/16 v2, 0xa0

    if-ne v14, v2, :cond_5

    const/4 v5, 0x0

    :goto_1
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mResultPath:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    move-object/from16 v4, p0

    invoke-direct/range {v4 .. v9}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->pullPhonebookRspNative(IIILjava/lang/String;Z)Z

    .line 785
    const/16 v2, 0xa0

    if-ne v14, v2, :cond_2

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIsContinue:Z

    if-eqz v2, :cond_2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mComposer:Lcom/android/bluetooth/pbap/BluetoothVCardComposer;

    if-eqz v2, :cond_2

    .line 786
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->composeVCardsContinue()I

    move-result v14

    .line 789
    :cond_2
    return v14

    .line 751
    .end local v6           #pbSize:I
    .restart local v13       #pbSize:I
    :cond_3
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mResultPath:Ljava/lang/String;

    .line 753
    const/4 v2, 0x3

    if-ne v3, v2, :cond_6

    .line 754
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->getNewMissedCallSize()I

    move-result v7

    move v12, v7

    .line 757
    .end local v7           #missedCalls:I
    .local v12, missedCalls:I
    :goto_2
    if-nez p6, :cond_4

    .line 758
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->getPbSize(I)I

    move-result v6

    .end local v13           #pbSize:I
    .restart local v6       #pbSize:I
    move v7, v12

    .end local v12           #missedCalls:I
    .restart local v7       #missedCalls:I
    goto :goto_0

    .line 761
    .end local v6           #pbSize:I
    .end local v7           #missedCalls:I
    .restart local v12       #missedCalls:I
    .restart local v13       #pbSize:I
    :cond_4
    const-wide/16 v9, -0x1

    move-object/from16 v2, p0

    move/from16 v4, p5

    move/from16 v5, p7

    move/from16 v6, p6

    move-wide/from16 v7, p3

    invoke-direct/range {v2 .. v10}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->composeVCards(IZIIJJ)I

    move-result v14

    move v6, v13

    .end local v13           #pbSize:I
    .restart local v6       #pbSize:I
    move v7, v12

    .end local v12           #missedCalls:I
    .restart local v7       #missedCalls:I
    goto :goto_0

    .line 782
    :cond_5
    const/4 v5, 0x1

    goto :goto_1

    .end local v6           #pbSize:I
    .restart local v13       #pbSize:I
    :cond_6
    move v12, v7

    .end local v7           #missedCalls:I
    .restart local v12       #missedCalls:I
    goto :goto_2
.end method

.method private onPullVcardEntryInd(ILjava/lang/String;JZ)I
    .locals 17
    .parameter "conId"
    .parameter "name"
    .parameter "filter"
    .parameter "vcard21"

    .prologue
    .line 793
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[CBK] onPullVcardEntryInd("

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, p3

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static/range {p5 .. p5}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ")"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 795
    const/16 v16, 0xa0

    .line 796
    .local v16, ret:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mPath:Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual {v2, v4, v5}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->getPathType(Ljava/lang/String;Z)I

    move-result v3

    .line 798
    .local v3, type:I
    const-wide/16 v9, -0x1

    .line 800
    .local v9, contactID:J
    const/4 v14, 0x0

    .line 801
    .local v14, ownerCard:Ljava/lang/String;
    const/4 v15, 0x0

    .line 803
    .local v15, path:Ljava/lang/String;
    const/4 v2, -0x1

    if-eq v3, v2, :cond_8

    .line 804
    const-string v2, ".vcf"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 806
    const/4 v2, 0x0

    :try_start_0
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x4

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v12

    .line 807
    .local v12, idx:J
    const/4 v2, 0x5

    if-eq v3, v2, :cond_0

    if-nez v3, :cond_5

    .line 809
    :cond_0
    const-wide/16 v4, 0x0

    cmp-long v2, v12, v4

    if-lez v2, :cond_2

    .line 810
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mVcardListing:Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;

    if-nez v2, :cond_1

    .line 811
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->getLocalNameAndNum()Z

    .line 812
    new-instance v2, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mLocalName:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mLocalNumber:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mIOTSolutionOn:Z

    invoke-direct {v2, v4, v5, v6, v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mVcardListing:Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;

    .line 816
    :cond_1
    if-nez v3, :cond_4

    .line 817
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mVcardListing:Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;

    long-to-int v4, v12

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v2, v4}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->queryPbID(I)J

    move-result-wide v9

    .line 822
    :goto_0
    const-wide/16 v4, 0x0

    cmp-long v2, v9, v4

    if-gez v2, :cond_2

    .line 823
    const/16 v16, 0xc4

    .line 836
    :cond_2
    :goto_1
    const/16 v2, 0xa0

    move/from16 v0, v16

    if-ne v0, v2, :cond_3

    .line 837
    long-to-int v5, v12

    const/4 v6, 0x1

    move-object/from16 v2, p0

    move/from16 v4, p5

    move-wide/from16 v7, p3

    invoke-direct/range {v2 .. v10}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->composeVCards(IZIIJJ)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v16

    .line 878
    .end local v12           #idx:J
    :cond_3
    :goto_2
    const/16 v2, 0xa0

    move/from16 v0, v16

    if-ne v0, v2, :cond_9

    .line 879
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mResultPath:Ljava/lang/String;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v4, v5}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->pullVcardEntryRspNative(ILjava/lang/String;Z)Z

    .line 883
    :goto_3
    return v16

    .line 819
    .restart local v12       #idx:J
    :cond_4
    :try_start_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mVcardListing:Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;

    long-to-int v4, v12

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v2, v4}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->querySimPbID(I)J
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-wide v9

    goto :goto_0

    .line 828
    :cond_5
    const-wide/16 v4, 0x0

    cmp-long v2, v12, v4

    if-gtz v2, :cond_6

    .line 829
    const/16 v16, 0xc4

    goto :goto_1

    .line 832
    :cond_6
    const-wide/16 v4, 0x1

    sub-long/2addr v12, v4

    goto :goto_1

    .line 868
    .end local v12           #idx:J
    :catch_0
    move-exception v11

    .line 869
    .local v11, e:Ljava/lang/NumberFormatException;
    const/16 v16, 0xc0

    .line 870
    goto :goto_2

    .line 872
    .end local v11           #e:Ljava/lang/NumberFormatException;
    :cond_7
    const/16 v16, 0xc0

    goto :goto_2

    .line 875
    :cond_8
    const/16 v16, 0xc0

    goto :goto_2

    .line 881
    :cond_9
    const/4 v2, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v4, v5}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->pullVcardEntryRspNative(ILjava/lang/String;Z)Z

    goto :goto_3
.end method

.method private onPullVcardListingInd(ILjava/lang/String;ILjava/lang/String;III)I
    .locals 13
    .parameter "conId"
    .parameter "name"
    .parameter "order"
    .parameter "searchVal"
    .parameter "searchAttr"
    .parameter "maxListCount"
    .parameter "listStartOffset"

    .prologue
    .line 432
    const v10, 0xffff

    .line 433
    .local v10, pbSize:I
    const v6, 0xffff

    .line 434
    .local v6, missedCalls:I
    const/4 v11, 0x0

    .line 435
    .local v11, resultPath:Ljava/lang/String;
    const/16 v12, 0xa0

    .line 437
    .local v12, ret:I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[CBK] onPullVcardListingInd("

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v0, p3

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p4

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v0, p5

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v0, p6

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v0, p7

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ")"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 441
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mPath:Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;

    if-nez v1, :cond_0

    .line 442
    const-string v1, "mPath is null"

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V

    .line 443
    const/16 v12, 0xd0

    move-object v7, v11

    .end local v11           #resultPath:Ljava/lang/String;
    .local v7, resultPath:Ljava/lang/String;
    move v5, v10

    .line 499
    .end local v10           #pbSize:I
    .local v5, pbSize:I
    :goto_0
    const/16 v1, 0xa0

    if-ne v12, v1, :cond_6

    const/4 v4, 0x0

    :goto_1
    const/4 v8, 0x0

    move-object v3, p0

    invoke-direct/range {v3 .. v8}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->pullVcardListingRspNative(IIILjava/lang/String;Z)Z

    .line 501
    return v12

    .line 445
    .end local v5           #pbSize:I
    .end local v7           #resultPath:Ljava/lang/String;
    .restart local v10       #pbSize:I
    .restart local v11       #resultPath:Ljava/lang/String;
    :cond_0
    const-string v1, ".vcf"

    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 446
    const/4 v1, 0x0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x4

    invoke-virtual {p2, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 449
    :cond_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mPath:Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;

    const/4 v3, 0x1

    invoke-virtual {v1, p2, v3}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->getPathType(Ljava/lang/String;Z)I

    move-result v2

    .line 450
    .local v2, type:I
    const/4 v1, -0x1

    if-ne v2, v1, :cond_2

    .line 451
    const-string v1, "unknown folder type type"

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V

    .line 452
    const/16 v12, 0xc0

    move-object v7, v11

    .end local v11           #resultPath:Ljava/lang/String;
    .restart local v7       #resultPath:Ljava/lang/String;
    move v5, v10

    .end local v10           #pbSize:I
    .restart local v5       #pbSize:I
    goto :goto_0

    .line 455
    .end local v5           #pbSize:I
    .end local v7           #resultPath:Ljava/lang/String;
    .restart local v10       #pbSize:I
    .restart local v11       #resultPath:Ljava/lang/String;
    :cond_2
    const/4 v1, 0x3

    if-ne v2, v1, :cond_8

    .line 456
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->getNewMissedCallSize()I

    move-result v6

    move v9, v6

    .line 459
    .end local v6           #missedCalls:I
    .local v9, missedCalls:I
    :goto_2
    if-nez p6, :cond_3

    .line 460
    invoke-direct {p0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->getPbSize(I)I

    move-result v5

    .end local v10           #pbSize:I
    .restart local v5       #pbSize:I
    move-object v7, v11

    .end local v11           #resultPath:Ljava/lang/String;
    .restart local v7       #resultPath:Ljava/lang/String;
    move v6, v9

    .end local v9           #missedCalls:I
    .restart local v6       #missedCalls:I
    goto :goto_0

    .line 463
    .end local v5           #pbSize:I
    .end local v6           #missedCalls:I
    .end local v7           #resultPath:Ljava/lang/String;
    .restart local v9       #missedCalls:I
    .restart local v10       #pbSize:I
    .restart local v11       #resultPath:Ljava/lang/String;
    :cond_3
    const/4 v1, 0x2

    move/from16 v0, p3

    if-eq v0, v1, :cond_4

    const/4 v1, 0x2

    move/from16 v0, p5

    if-ne v0, v1, :cond_5

    .line 465
    :cond_4
    const-string v1, "order or search attrib is not supported"

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 466
    const/16 v12, 0xd1

    move-object v7, v11

    .end local v11           #resultPath:Ljava/lang/String;
    .restart local v7       #resultPath:Ljava/lang/String;
    move v6, v9

    .end local v9           #missedCalls:I
    .restart local v6       #missedCalls:I
    move v5, v10

    .end local v10           #pbSize:I
    .restart local v5       #pbSize:I
    goto :goto_0

    .line 469
    .end local v5           #pbSize:I
    .end local v6           #missedCalls:I
    .end local v7           #resultPath:Ljava/lang/String;
    .restart local v9       #missedCalls:I
    .restart local v10       #pbSize:I
    .restart local v11       #resultPath:Ljava/lang/String;
    :cond_5
    packed-switch v2, :pswitch_data_0

    .line 491
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown folder type : "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V

    .line 492
    const/16 v12, 0xc0

    move-object v7, v11

    .end local v11           #resultPath:Ljava/lang/String;
    .restart local v7       #resultPath:Ljava/lang/String;
    move v6, v9

    .end local v9           #missedCalls:I
    .restart local v6       #missedCalls:I
    move v5, v10

    .end local v10           #pbSize:I
    .restart local v5       #pbSize:I
    goto :goto_0

    .line 472
    .end local v5           #pbSize:I
    .end local v6           #missedCalls:I
    .end local v7           #resultPath:Ljava/lang/String;
    .restart local v9       #missedCalls:I
    .restart local v10       #pbSize:I
    .restart local v11       #resultPath:Ljava/lang/String;
    :pswitch_0
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->getLocalNameAndNum()Z

    .line 473
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mVcardListing:Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;

    move/from16 v3, p3

    move/from16 v4, p5

    move-object/from16 v5, p4

    move/from16 v6, p7

    move/from16 v7, p6

    invoke-virtual/range {v1 .. v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->list(IIILjava/lang/String;II)I

    move-result v12

    .line 475
    const/16 v1, 0xa0

    if-ne v12, v1, :cond_7

    .line 476
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mVcardListing:Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;

    invoke-virtual {v1}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->getPath()Ljava/lang/String;

    move-result-object v7

    .end local v11           #resultPath:Ljava/lang/String;
    .restart local v7       #resultPath:Ljava/lang/String;
    move v6, v9

    .end local v9           #missedCalls:I
    .restart local v6       #missedCalls:I
    move v5, v10

    .end local v10           #pbSize:I
    .restart local v5       #pbSize:I
    goto/16 :goto_0

    .line 484
    .end local v5           #pbSize:I
    .end local v6           #missedCalls:I
    .end local v7           #resultPath:Ljava/lang/String;
    .restart local v9       #missedCalls:I
    .restart local v10       #pbSize:I
    .restart local v11       #resultPath:Ljava/lang/String;
    :pswitch_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mVcardListing:Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;

    move/from16 v3, p3

    move/from16 v4, p5

    move-object/from16 v5, p4

    move/from16 v6, p7

    move/from16 v7, p6

    invoke-virtual/range {v1 .. v7}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->list(IIILjava/lang/String;II)I

    move-result v12

    .line 486
    const/16 v1, 0xa0

    if-ne v12, v1, :cond_7

    .line 487
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mVcardListing:Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;

    invoke-virtual {v1}, Lcom/android/bluetooth/pbap/BluetoothPbapVCardListing;->getPath()Ljava/lang/String;

    move-result-object v7

    .end local v11           #resultPath:Ljava/lang/String;
    .restart local v7       #resultPath:Ljava/lang/String;
    move v6, v9

    .end local v9           #missedCalls:I
    .restart local v6       #missedCalls:I
    move v5, v10

    .end local v10           #pbSize:I
    .restart local v5       #pbSize:I
    goto/16 :goto_0

    .line 499
    .end local v2           #type:I
    :cond_6
    const/4 v4, 0x1

    goto/16 :goto_1

    .end local v5           #pbSize:I
    .end local v6           #missedCalls:I
    .end local v7           #resultPath:Ljava/lang/String;
    .restart local v2       #type:I
    .restart local v9       #missedCalls:I
    .restart local v10       #pbSize:I
    .restart local v11       #resultPath:Ljava/lang/String;
    :cond_7
    move-object v7, v11

    .end local v11           #resultPath:Ljava/lang/String;
    .restart local v7       #resultPath:Ljava/lang/String;
    move v6, v9

    .end local v9           #missedCalls:I
    .restart local v6       #missedCalls:I
    move v5, v10

    .end local v10           #pbSize:I
    .restart local v5       #pbSize:I
    goto/16 :goto_0

    .end local v5           #pbSize:I
    .end local v7           #resultPath:Ljava/lang/String;
    .restart local v10       #pbSize:I
    .restart local v11       #resultPath:Ljava/lang/String;
    :cond_8
    move v9, v6

    .end local v6           #missedCalls:I
    .restart local v9       #missedCalls:I
    goto/16 :goto_2

    .line 469
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private onSetPathInd(Ljava/lang/String;I)I
    .locals 3
    .parameter "name"
    .parameter "op"

    .prologue
    .line 415
    const/16 v0, 0xa0

    .line 417
    .local v0, ret:I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[CBK] onSetPathInd("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 420
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mPath:Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;

    invoke-virtual {v1, p2, p1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->setPath(ILjava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 421
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->setPathRspNative(I)Z

    .line 422
    const/16 v0, 0xc0

    .line 426
    :goto_0
    return v0

    .line 424
    :cond_0
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->setPathRspNative(I)Z

    goto :goto_0
.end method

.method private printLog(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 942
    const-string v0, "BluetoothPbapServer"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 944
    return-void
.end method

.method private native pullPhonebookRspNative(IIILjava/lang/String;Z)Z
.end method

.method private native pullVcardEntryRspNative(ILjava/lang/String;Z)Z
.end method

.method private native pullVcardListingRspNative(IIILjava/lang/String;Z)Z
.end method

.method private sendServiceMsg(ILjava/lang/Object;)V
    .locals 3
    .parameter "what"
    .parameter "arg"

    .prologue
    .line 951
    const/4 v0, 0x0

    .line 952
    .local v0, msg:Landroid/os/Message;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[API] sendServiceMsg("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 953
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mServiceHandler:Landroid/os/Handler;

    if-eqz v1, :cond_0

    .line 954
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mServiceHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 955
    iput p1, v0, Landroid/os/Message;->what:I

    .line 956
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 957
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mServiceHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 961
    :goto_0
    return-void

    .line 959
    :cond_0
    const-string v1, "mServiceHandler is null"

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private native setPathRspNative(I)Z
.end method

.method private native wakeupListenerNative()V
.end method


# virtual methods
.method accept(Z)Z
    .locals 2
    .parameter "isAccept"

    .prologue
    .line 351
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[API] accept("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 352
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->authorizeRspNative(Z)Z

    move-result v0

    return v0
.end method

.method authChallRsp(ZLjava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .parameter "cancel"
    .parameter "password"
    .parameter "userID"

    .prologue
    .line 356
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[API] authChallRsp("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 358
    invoke-direct {p0, p1, p2, p3}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->authChallengeRspNative(ZLjava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public disable()V
    .locals 3

    .prologue
    .line 332
    const-string v1, "[API] disable"

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 334
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mListener:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;

    if-eqz v1, :cond_0

    .line 335
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mListener:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;->mStopListen:Z

    .line 336
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->wakeupListenerNative()V

    .line 338
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mListener:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;

    invoke-virtual {v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 342
    :goto_0
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->disableNative()V

    .line 346
    :goto_1
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->cleanupNativeDataNative()V

    .line 347
    return-void

    .line 339
    :catch_0
    move-exception v0

    .line 340
    .local v0, ex:Ljava/lang/InterruptedException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mListener close error"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V

    goto :goto_0

    .line 344
    .end local v0           #ex:Ljava/lang/InterruptedException;
    :cond_0
    const-string v1, "Pbap server is not enabled yet"

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public disconnect()V
    .locals 1

    .prologue
    .line 362
    const-string v0, "[API] disconnect"

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 363
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->disconnectNative()V

    .line 364
    return-void
.end method

.method public enable()Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 315
    const/4 v0, 0x0

    .line 317
    .local v0, ret:Z
    const-string v1, "[API] enable"

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V

    .line 319
    new-instance v1, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;

    invoke-direct {v1, p0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;-><init>(Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$1;)V

    iput-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mListener:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;

    .line 320
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->enableNative()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 321
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mListener:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;->mStopListen:Z

    .line 322
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mListener:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;

    invoke-virtual {v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;->start()V

    .line 323
    const/4 v0, 0x1

    .line 328
    :goto_0
    return v0

    .line 325
    :cond_0
    const-string v1, "enableNative failed"

    invoke-direct {p0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V

    .line 326
    iput-object v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->mListener:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;

    goto :goto_0
.end method
