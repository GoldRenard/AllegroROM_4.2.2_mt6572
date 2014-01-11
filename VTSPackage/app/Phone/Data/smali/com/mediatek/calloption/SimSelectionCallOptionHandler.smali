.class public abstract Lcom/mediatek/calloption/SimSelectionCallOptionHandler;
.super Lcom/mediatek/calloption/CallOptionBaseHandler;
.source "SimSelectionCallOptionHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;,
        Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;
    }
.end annotation


# static fields
.field private static final MAKE_CALL_REASON_ASK:I = 0x5

.field private static final MAKE_CALL_REASON_ASSOCIATE_MISSING:I = 0x6

.field private static final MAKE_CALL_REASON_OK:I = 0x0

.field private static final TAG:Ljava/lang/String; = "SimSelectionCallOptionHandler"


# instance fields
.field private mAssociateMissingCancelListener:Landroid/content/DialogInterface$OnCancelListener;

.field private mAssociateMissingClickListener:Landroid/content/DialogInterface$OnClickListener;

.field private mAssociateMissingDismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field private mAssociateSimMissingArgs:Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;

.field private mReasonAskCancelListener:Landroid/content/DialogInterface$OnCancelListener;

.field private mReasonAskClickListener:Landroid/content/DialogInterface$OnClickListener;

.field private mReasonAskDismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field private mRequest:Lcom/mediatek/calloption/Request;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/mediatek/calloption/CallOptionBaseHandler;-><init>()V

    .line 533
    new-instance v0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$1;

    invoke-direct {v0, p0}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$1;-><init>(Lcom/mediatek/calloption/SimSelectionCallOptionHandler;)V

    iput-object v0, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mReasonAskClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 556
    new-instance v0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$2;

    invoke-direct {v0, p0}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$2;-><init>(Lcom/mediatek/calloption/SimSelectionCallOptionHandler;)V

    iput-object v0, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mReasonAskDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 563
    new-instance v0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$3;

    invoke-direct {v0, p0}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$3;-><init>(Lcom/mediatek/calloption/SimSelectionCallOptionHandler;)V

    iput-object v0, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mReasonAskCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    .line 578
    new-instance v0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$4;

    invoke-direct {v0, p0}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$4;-><init>(Lcom/mediatek/calloption/SimSelectionCallOptionHandler;)V

    iput-object v0, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mAssociateMissingClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 613
    new-instance v0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$5;

    invoke-direct {v0, p0}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$5;-><init>(Lcom/mediatek/calloption/SimSelectionCallOptionHandler;)V

    iput-object v0, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mAssociateMissingDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 619
    new-instance v0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$6;

    invoke-direct {v0, p0}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$6;-><init>(Lcom/mediatek/calloption/SimSelectionCallOptionHandler;)V

    iput-object v0, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mAssociateMissingCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 51
    invoke-static {p0}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/calloption/SimSelectionCallOptionHandler;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->doSipCallOptionHandle()V

    return-void
.end method

.method static synthetic access$200(Lcom/mediatek/calloption/SimSelectionCallOptionHandler;)Lcom/mediatek/calloption/Request;
    .locals 1
    .parameter "x0"

    .prologue
    .line 51
    iget-object v0, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mediatek/calloption/SimSelectionCallOptionHandler;)Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;
    .locals 1
    .parameter "x0"

    .prologue
    .line 51
    iget-object v0, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mAssociateSimMissingArgs:Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;

    return-object v0
.end method

.method private doSipCallOptionHandle()V
    .locals 4

    .prologue
    .line 628
    const-string v1, "doSipCallOptionHandle()"

    invoke-static {v1}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->log(Ljava/lang/String;)V

    .line 629
    iget-object v1, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v1

    if-nez v1, :cond_0

    .line 630
    const-string v1, "doSipCallOptionHandle(), mRequest.getIntent() == null"

    invoke-static {v1}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->log(Ljava/lang/String;)V

    .line 641
    :goto_0
    return-void

    .line 634
    :cond_0
    iget-object v1, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "follow_sim_management"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 635
    iget-object v1, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v2}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/calloption/CallOptionUtils;->getInitialNumber(Landroid/content/Context;Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v0

    .line 637
    .local v0, number:Ljava/lang/String;
    iget-object v1, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "sip"

    const/4 v3, 0x0

    invoke-static {v2, v0, v3}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 640
    iget-object v1, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v1}, Lcom/mediatek/calloption/Request;->getCallOptionHandlerFactory()Lcom/mediatek/calloption/CallOptionHandlerFactory;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/calloption/CallOptionHandlerFactory;->getInternetCallOptionHandler()Lcom/mediatek/calloption/InternetCallOptionHandler;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v1, v2}, Lcom/mediatek/calloption/InternetCallOptionHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    goto :goto_0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 644
    const-string v0, "SimSelectionCallOptionHandler"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 645
    return-void
.end method


# virtual methods
.method public handleRequest(Lcom/mediatek/calloption/Request;)V
    .locals 31
    .parameter "request"

    .prologue
    .line 116
    const-string v3, "handleRequest()"

    invoke-static {v3}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->log(Ljava/lang/String;)V

    .line 117
    const/16 v19, 0x0

    .line 118
    .local v19, isVoiceMail:Z
    const-string v3, "voicemail:"

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 119
    const/16 v19, 0x1

    .line 122
    :cond_0
    const/4 v3, -0x1

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v6, "com.android.phone.extra.slot"

    const/4 v7, -0x1

    invoke-virtual {v4, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    if-eq v3, v4, :cond_2

    .line 124
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v3, :cond_1

    .line 125
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    .line 410
    :cond_1
    :goto_0
    return-void

    .line 129
    :cond_2
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    .line 131
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/calloption/CallOptionUtils;->getInitialNumber(Landroid/content/Context;Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v5

    .line 134
    .local v5, number:Ljava/lang/String;
    new-instance v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;

    const/4 v4, 0x0

    const-wide/16 v6, 0x0

    const/4 v8, 0x0

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v8}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;-><init>(Lcom/mediatek/calloption/SimSelectionCallOptionHandler;ILjava/lang/String;JLjava/lang/Object;)V

    .line 136
    .local v2, callbackArgs:Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "com.android.phone.extra.original"

    const-wide/16 v6, -0x5

    invoke-virtual {v3, v4, v6, v7}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v21

    .line 139
    .local v21, originalSim:J
    const-wide/16 v26, -0x5

    .line 140
    .local v26, suggestedSim:J
    const-wide/16 v9, -0x5

    .line 141
    .local v9, associateSim:J
    const/4 v11, 0x0

    .line 142
    .local v11, associateSimInserts:I
    const/16 v23, 0x0

    .line 144
    .local v23, originalSimInsert:Z
    invoke-static {}, Lcom/mediatek/phone/SIMInfoWrapper;->getDefault()Lcom/mediatek/phone/SIMInfoWrapper;

    move-result-object v24

    .line 146
    .local v24, simInfoWrapper:Lcom/mediatek/phone/SIMInfoWrapper;
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "voice_call_sim_setting"

    const-wide/16 v6, -0x5

    invoke-static {v3, v4, v6, v7}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v14

    .line 150
    .local v14, defaultSim:J
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/calloption/SimAssociateHandler;->getInstance(Landroid/content/Context;)Lcom/mediatek/calloption/SimAssociateHandler;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/mediatek/calloption/SimAssociateHandler;->query(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v13

    .line 151
    .local v13, associateSims:Ljava/util/ArrayList;
    if-eqz v13, :cond_4

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_4

    const/16 v16, 0x1

    .line 152
    .local v16, hasAssociateSims:Z
    :goto_1
    if-eqz v16, :cond_5

    .line 153
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .local v17, i$:Ljava/util/Iterator;
    :cond_3
    :goto_2
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    .line 154
    .local v20, item:Ljava/lang/Object;
    check-cast v20, Ljava/lang/Integer;

    .end local v20           #item:Ljava/lang/Object;
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v28

    .line 155
    .local v28, temp:I
    move-object/from16 v0, v24

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/SIMInfoWrapper;->getSimSlotById(I)I

    move-result v25

    .line 156
    .local v25, slot:I
    if-ltz v25, :cond_3

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-static {v0, v1}, Lcom/mediatek/calloption/CallOptionUtils;->isSimInsert(Lcom/mediatek/calloption/Request;I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 157
    add-int/lit8 v11, v11, 0x1

    .line 158
    move/from16 v0, v28

    int-to-long v9, v0

    goto :goto_2

    .line 151
    .end local v16           #hasAssociateSims:Z
    .end local v17           #i$:Ljava/util/Iterator;
    .end local v25           #slot:I
    .end local v28           #temp:I
    :cond_4
    const/16 v16, 0x0

    goto :goto_1

    .line 163
    .restart local v16       #hasAssociateSims:Z
    :cond_5
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "enable_internet_call_value"

    const/4 v6, 0x0

    invoke-static {v3, v4, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v18

    .line 167
    .local v18, internetEnableSetting:I
    invoke-virtual/range {v24 .. v24}, Lcom/mediatek/phone/SIMInfoWrapper;->getInsertedSimCount()I

    move-result v3

    if-nez v3, :cond_7

    const-wide/16 v3, -0x2

    cmp-long v3, v14, v3

    if-eqz v3, :cond_7

    .line 172
    const/4 v3, 0x1

    move/from16 v0, v18

    if-eq v3, v0, :cond_6

    .line 174
    const-wide/16 v3, 0x0

    iput-wide v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->id:J

    .line 175
    const/4 v3, 0x0

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 181
    :goto_3
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->onMakeCall(Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;)V

    goto/16 :goto_0

    .line 178
    :cond_6
    const/4 v3, 0x5

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 179
    const-wide/16 v3, -0x2

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    goto :goto_3

    .line 185
    :cond_7
    const-wide/16 v3, -0x5

    cmp-long v3, v14, v3

    if-nez v3, :cond_8

    .line 186
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->onMakeCall(Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;)V

    goto/16 :goto_0

    .line 189
    :cond_8
    const-wide/16 v3, -0x5

    cmp-long v3, v21, v3

    if-eqz v3, :cond_9

    .line 190
    move-wide/from16 v0, v21

    long-to-int v3, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v3}, Lcom/mediatek/phone/SIMInfoWrapper;->getSimSlotById(I)I

    move-result v25

    .line 191
    .restart local v25       #slot:I
    if-ltz v25, :cond_a

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-static {v0, v1}, Lcom/mediatek/calloption/CallOptionUtils;->isSimInsert(Lcom/mediatek/calloption/Request;I)Z

    move-result v3

    if-eqz v3, :cond_a

    const/16 v23, 0x1

    .line 192
    :goto_4
    const-wide/16 v3, -0x2

    cmp-long v3, v21, v3

    if-nez v3, :cond_9

    .line 193
    const/4 v3, 0x1

    move/from16 v0, v18

    if-ne v0, v3, :cond_b

    const/16 v23, 0x1

    .line 197
    .end local v25           #slot:I
    :cond_9
    :goto_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "makeVoiceCall, number = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", originalSim = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, v21

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", defaultSim = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", associateSims = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->log(Ljava/lang/String;)V

    .line 201
    const-wide/16 v3, -0x1

    cmp-long v3, v14, v3

    if-nez v3, :cond_11

    .line 210
    const/4 v3, 0x1

    move/from16 v0, v18

    if-eq v3, v0, :cond_c

    invoke-virtual/range {v24 .. v24}, Lcom/mediatek/phone/SIMInfoWrapper;->getInsertedSimCount()I

    move-result v3

    if-nez v3, :cond_c

    .line 211
    const/4 v3, 0x0

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 212
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->onMakeCall(Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;)V

    goto/16 :goto_0

    .line 191
    .restart local v25       #slot:I
    :cond_a
    const/16 v23, 0x0

    goto :goto_4

    .line 193
    :cond_b
    const/16 v23, 0x0

    goto :goto_5

    .line 217
    .end local v25           #slot:I
    :cond_c
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "always, associateSimInserts = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " originalSim = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, v21

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->log(Ljava/lang/String;)V

    .line 218
    const/4 v3, 0x1

    if-le v11, v3, :cond_f

    .line 219
    const-wide/16 v26, -0x5

    .line 227
    :cond_d
    :goto_6
    if-eqz v19, :cond_e

    .line 228
    const-wide/16 v26, -0x5

    .line 231
    :cond_e
    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    .line 232
    const/4 v3, 0x5

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 233
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->onMakeCall(Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;)V

    goto/16 :goto_0

    .line 220
    :cond_f
    const/4 v3, 0x1

    if-ne v11, v3, :cond_10

    .line 221
    move-wide/from16 v26, v9

    goto :goto_6

    .line 222
    :cond_10
    if-eqz v23, :cond_d

    .line 223
    move-wide/from16 v26, v21

    goto :goto_6

    .line 238
    :cond_11
    if-nez v16, :cond_13

    const-wide/16 v3, -0x5

    cmp-long v3, v21, v3

    if-eqz v3, :cond_13

    const-wide/16 v3, -0x2

    cmp-long v3, v14, v3

    if-nez v3, :cond_13

    cmp-long v3, v21, v14

    if-eqz v3, :cond_13

    .line 241
    if-eqz v23, :cond_12

    .line 242
    invoke-static/range {v21 .. v22}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    .line 246
    :goto_7
    const/4 v3, 0x5

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 247
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->onMakeCall(Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;)V

    goto/16 :goto_0

    .line 244
    :cond_12
    const-wide/16 v3, -0x5

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    goto :goto_7

    .line 252
    :cond_13
    const-wide/16 v3, -0x2

    cmp-long v3, v14, v3

    if-nez v3, :cond_19

    .line 253
    if-nez v16, :cond_14

    const-wide/16 v3, -0x5

    cmp-long v3, v21, v3

    if-eqz v3, :cond_18

    const-wide/16 v3, -0x2

    cmp-long v3, v21, v3

    if-eqz v3, :cond_18

    .line 256
    :cond_14
    const/4 v3, 0x1

    if-le v11, v3, :cond_16

    .line 257
    const-wide/16 v26, -0x5

    .line 264
    :cond_15
    :goto_8
    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    .line 265
    const/4 v3, 0x5

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 266
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->onMakeCall(Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;)V

    goto/16 :goto_0

    .line 258
    :cond_16
    const/4 v3, 0x1

    if-ne v11, v3, :cond_17

    .line 259
    move-wide/from16 v26, v9

    goto :goto_8

    .line 260
    :cond_17
    if-eqz v23, :cond_15

    .line 261
    move-wide/from16 v26, v21

    goto :goto_8

    .line 269
    :cond_18
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->doSipCallOptionHandle()V

    goto/16 :goto_0

    .line 274
    :cond_19
    const-wide/16 v3, -0x5

    cmp-long v3, v21, v3

    if-nez v3, :cond_1a

    if-nez v16, :cond_1a

    .line 275
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "deaultSim = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->log(Ljava/lang/String;)V

    .line 276
    const/4 v3, 0x0

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 277
    iput-wide v14, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->id:J

    .line 279
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->onMakeCall(Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;)V

    goto/16 :goto_0

    .line 284
    :cond_1a
    const-wide/16 v3, -0x5

    cmp-long v3, v21, v3

    if-eqz v3, :cond_1e

    if-nez v16, :cond_1e

    .line 286
    cmp-long v3, v14, v21

    if-eqz v3, :cond_1b

    if-nez v23, :cond_1c

    .line 288
    :cond_1b
    const/4 v3, 0x0

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 289
    iput-wide v14, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->id:J

    .line 290
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->onMakeCall(Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;)V

    goto/16 :goto_0

    .line 295
    :cond_1c
    const-wide/16 v26, -0x5

    .line 296
    if-eqz v23, :cond_1d

    .line 297
    move-wide/from16 v26, v21

    .line 299
    :cond_1d
    const/4 v3, 0x5

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 300
    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    .line 301
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->onMakeCall(Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;)V

    goto/16 :goto_0

    .line 306
    :cond_1e
    const-wide/16 v3, -0x5

    cmp-long v3, v21, v3

    if-nez v3, :cond_24

    if-eqz v16, :cond_24

    .line 308
    const/4 v3, 0x2

    if-lt v11, v3, :cond_1f

    .line 309
    const/4 v3, 0x5

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 310
    const-wide/16 v3, -0x5

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    .line 311
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->onMakeCall(Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;)V

    goto/16 :goto_0

    .line 315
    :cond_1f
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_21

    .line 316
    const/4 v3, 0x0

    invoke-virtual {v13, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-long v9, v3

    .line 329
    :cond_20
    :goto_9
    const/4 v3, 0x1

    if-ne v11, v3, :cond_24

    .line 330
    cmp-long v3, v14, v9

    if-nez v3, :cond_23

    .line 331
    const/4 v3, 0x0

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 332
    iput-wide v14, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->id:J

    .line 337
    :goto_a
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->onMakeCall(Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;)V

    goto/16 :goto_0

    .line 317
    :cond_21
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x2

    if-lt v3, v4, :cond_20

    .line 319
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .restart local v17       #i$:Ljava/util/Iterator;
    :cond_22
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_20

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    .line 320
    .restart local v20       #item:Ljava/lang/Object;
    check-cast v20, Ljava/lang/Integer;

    .end local v20           #item:Ljava/lang/Object;
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v28

    .line 321
    .restart local v28       #temp:I
    move-object/from16 v0, v24

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/SIMInfoWrapper;->getSimSlotById(I)I

    move-result v25

    .line 322
    .restart local v25       #slot:I
    if-ltz v25, :cond_22

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-static {v0, v1}, Lcom/mediatek/calloption/CallOptionUtils;->isSimInsert(Lcom/mediatek/calloption/Request;I)Z

    move-result v3

    if-eqz v3, :cond_22

    .line 323
    move/from16 v0, v28

    int-to-long v9, v0

    .line 324
    goto :goto_9

    .line 334
    .end local v17           #i$:Ljava/util/Iterator;
    .end local v25           #slot:I
    .end local v28           #temp:I
    :cond_23
    const/4 v3, 0x5

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 335
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    goto :goto_a

    .line 343
    :cond_24
    cmp-long v3, v14, v21

    if-nez v3, :cond_25

    cmp-long v3, v14, v9

    if-nez v3, :cond_25

    .line 344
    const/4 v3, 0x0

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 345
    iput-wide v14, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->id:J

    .line 346
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->onMakeCall(Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;)V

    goto/16 :goto_0

    .line 351
    :cond_25
    cmp-long v3, v14, v21

    if-nez v3, :cond_26

    if-eqz v16, :cond_26

    if-nez v11, :cond_26

    .line 352
    const/4 v3, 0x5

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 353
    invoke-static/range {v21 .. v22}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    .line 354
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->onMakeCall(Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;)V

    goto/16 :goto_0

    .line 359
    :cond_26
    const-wide/16 v3, -0x5

    cmp-long v3, v21, v3

    if-eqz v3, :cond_27

    if-eqz v16, :cond_27

    if-nez v11, :cond_27

    .line 361
    move-wide/from16 v0, v21

    long-to-int v3, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v3}, Lcom/mediatek/phone/SIMInfoWrapper;->getSimSlotById(I)I

    move-result v25

    .line 362
    .restart local v25       #slot:I
    if-ltz v25, :cond_27

    cmp-long v3, v21, v14

    if-eqz v3, :cond_27

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-static {v0, v1}, Lcom/mediatek/calloption/CallOptionUtils;->isSimInsert(Lcom/mediatek/calloption/Request;I)Z

    move-result v3

    if-eqz v3, :cond_27

    .line 364
    invoke-static/range {v21 .. v22}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    .line 365
    const/4 v3, 0x5

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 366
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->onMakeCall(Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;)V

    goto/16 :goto_0

    .line 371
    .end local v25           #slot:I
    :cond_27
    const/4 v3, 0x2

    if-lt v11, v3, :cond_28

    .line 372
    const/4 v3, 0x5

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 373
    const-wide/16 v3, -0x5

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    .line 374
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->onMakeCall(Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;)V

    goto/16 :goto_0

    .line 378
    :cond_28
    const/4 v3, 0x1

    if-ne v11, v3, :cond_29

    .line 379
    const/4 v3, 0x5

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 380
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    .line 409
    .end local v21           #originalSim:J
    :goto_b
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->onMakeCall(Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;)V

    goto/16 :goto_0

    .line 383
    .restart local v21       #originalSim:J
    :cond_29
    const-wide/16 v3, -0x5

    cmp-long v3, v9, v3

    if-nez v3, :cond_2a

    .line 384
    const/4 v3, 0x0

    invoke-virtual {v13, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-long v9, v3

    .line 386
    :cond_2a
    iput-wide v9, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->id:J

    .line 387
    const/4 v3, 0x6

    iput v3, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    .line 388
    new-instance v12, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;

    move-object/from16 v0, p0

    invoke-direct {v12, v0}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;-><init>(Lcom/mediatek/calloption/SimSelectionCallOptionHandler;)V

    .line 389
    .local v12, associateSimMissingArgs:Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;
    invoke-static {}, Lcom/mediatek/phone/SIMInfoWrapper;->getDefault()Lcom/mediatek/phone/SIMInfoWrapper;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/phone/SIMInfoWrapper;->getInsertedSimCount()I

    move-result v3

    const/4 v4, 0x1

    if-gt v3, v4, :cond_2e

    .line 390
    const/4 v3, 0x0

    iput v3, v12, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;->type:I

    .line 392
    if-eqz v23, :cond_2c

    move-wide/from16 v29, v21

    .line 394
    .local v29, viaSimId:J
    :goto_c
    const-wide/16 v3, -0x2

    cmp-long v3, v14, v3

    if-nez v3, :cond_2d

    .line 395
    const-wide/16 v3, -0x2

    iput-wide v3, v12, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;->suggested:J

    .line 407
    .end local v21           #originalSim:J
    .end local v29           #viaSimId:J
    :cond_2b
    :goto_d
    iput-object v12, v2, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    goto :goto_b

    .restart local v21       #originalSim:J
    :cond_2c
    move-wide/from16 v29, v14

    .line 392
    goto :goto_c

    .line 397
    .restart local v29       #viaSimId:J
    :cond_2d
    move-wide/from16 v0, v29

    long-to-int v3, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v3}, Lcom/mediatek/phone/SIMInfoWrapper;->getSimInfoById(I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v3

    iput-object v3, v12, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;->viaSimInfo:Landroid/provider/Telephony$SIMInfo;

    goto :goto_d

    .line 400
    .end local v29           #viaSimId:J
    :cond_2e
    const/4 v3, 0x1

    iput v3, v12, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;->type:I

    .line 401
    if-eqz v23, :cond_2f

    .end local v21           #originalSim:J
    :goto_e
    move-wide/from16 v0, v21

    iput-wide v0, v12, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;->suggested:J

    .line 402
    const-wide/16 v3, -0x1

    cmp-long v3, v14, v3

    if-eqz v3, :cond_2b

    const-wide/16 v3, -0x2

    cmp-long v3, v14, v3

    if-eqz v3, :cond_2b

    .line 404
    long-to-int v3, v14

    move-object/from16 v0, v24

    invoke-virtual {v0, v3}, Lcom/mediatek/phone/SIMInfoWrapper;->getSimInfoById(I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v3

    iput-object v3, v12, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;->viaSimInfo:Landroid/provider/Telephony$SIMInfo;

    goto :goto_d

    .restart local v21       #originalSim:J
    :cond_2f
    move-wide/from16 v21, v14

    .line 401
    goto :goto_e
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 478
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onClick, dialog = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " which = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->log(Ljava/lang/String;)V

    move-object v0, p1

    .line 481
    check-cast v0, Landroid/app/AlertDialog;

    .line 482
    .local v0, alert:Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    .line 483
    .local v1, listAdapter:Landroid/widget/ListAdapter;
    invoke-interface {v1, p2}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 486
    .local v2, slot:I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onClick, slot = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->log(Ljava/lang/String;)V

    .line 487
    const/4 v3, -0x2

    if-ne v2, v3, :cond_1

    .line 488
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 489
    invoke-direct {p0}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->doSipCallOptionHandle()V

    .line 526
    :cond_0
    :goto_0
    return-void

    .line 491
    :cond_1
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 492
    iget-object v3, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v3}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "com.android.phone.extra.slot"

    invoke-virtual {v3, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 493
    iget-object v3, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v3, :cond_0

    .line 494
    iget-object v3, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    iget-object v4, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v3, v4}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    goto :goto_0
.end method

.method public onMakeCall(Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;)V
    .locals 14
    .parameter "args"

    .prologue
    const/4 v4, 0x1

    const/4 v1, 0x0

    .line 418
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onMakeCall, reason = "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v5, p1, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, " args = "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v5, p1, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->log(Ljava/lang/String;)V

    .line 420
    iget v0, p1, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->reason:I

    sparse-switch v0, :sswitch_data_0

    .line 467
    const-string v0, "onMakeCall: no match case found!"

    invoke-static {v0}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->log(Ljava/lang/String;)V

    .line 470
    :cond_0
    :goto_0
    return-void

    .line 422
    :sswitch_0
    invoke-static {}, Lcom/mediatek/phone/SIMInfoWrapper;->getDefault()Lcom/mediatek/phone/SIMInfoWrapper;

    move-result-object v0

    iget-wide v5, p1, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->id:J

    long-to-int v1, v5

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/SIMInfoWrapper;->getSimSlotById(I)I

    move-result v13

    .line 426
    .local v13, slot:I
    const/4 v0, -0x1

    if-ne v13, v0, :cond_1

    .line 427
    const/4 v13, 0x0

    .line 430
    :cond_1
    iget-object v0, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v0}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "com.android.phone.extra.slot"

    invoke-virtual {v0, v1, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 431
    iget-object v0, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v0, :cond_0

    .line 432
    iget-object v0, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    iget-object v1, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v0, v1}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    goto :goto_0

    .line 437
    .end local v13           #slot:I
    :sswitch_1
    iget-object v0, p1, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    if-nez v0, :cond_4

    const-wide/16 v2, -0x5

    .line 439
    .local v2, suggestedSim:J
    :goto_1
    iget-object v0, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v0}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v5, "com.android.phone.extra.ip"

    invoke-virtual {v0, v5, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/mediatek/phone/SIMInfoWrapper;->getDefault()Lcom/mediatek/phone/SIMInfoWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/phone/SIMInfoWrapper;->getInsertedSimCount()I

    move-result v0

    if-nez v0, :cond_5

    :cond_2
    iget-object v0, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v0}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v5, "com.android.phone.extra.international"

    invoke-virtual {v0, v5, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    if-eq v4, v0, :cond_5

    .line 449
    .local v4, addInternet:Z
    :goto_2
    const-string v0, "voicemail:"

    iget-object v1, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 450
    const/4 v4, 0x0

    .line 452
    :cond_3
    iget-object v1, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    iget-object v5, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mReasonAskClickListener:Landroid/content/DialogInterface$OnClickListener;

    iget-object v6, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mReasonAskDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    iget-object v7, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mReasonAskCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    move-object v0, p0

    invoke-virtual/range {v0 .. v7}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->showReasonAskDialog(Lcom/mediatek/calloption/Request;JZLandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V

    goto :goto_0

    .line 437
    .end local v2           #suggestedSim:J
    .end local v4           #addInternet:Z
    :cond_4
    iget-object v0, p1, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    goto :goto_1

    .restart local v2       #suggestedSim:J
    :cond_5
    move v4, v1

    .line 439
    goto :goto_2

    .line 457
    .end local v2           #suggestedSim:J
    :sswitch_2
    iget-object v0, p1, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    check-cast v0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;

    iput-object v0, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mAssociateSimMissingArgs:Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;

    .line 458
    invoke-static {}, Lcom/mediatek/phone/SIMInfoWrapper;->getDefault()Lcom/mediatek/phone/SIMInfoWrapper;

    move-result-object v0

    iget-wide v5, p1, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->id:J

    long-to-int v1, v5

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/SIMInfoWrapper;->getSimInfoById(I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v7

    .line 459
    .local v7, associateSimInfo:Landroid/provider/Telephony$SIMInfo;
    iget-object v6, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    iget-object v8, p1, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->number:Ljava/lang/String;

    iget-object v9, p1, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$CallbackArgs;->args:Ljava/lang/Object;

    check-cast v9, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;

    iget-object v10, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mAssociateMissingClickListener:Landroid/content/DialogInterface$OnClickListener;

    iget-object v11, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mAssociateMissingDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    iget-object v12, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mAssociateMissingCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    move-object v5, p0

    invoke-virtual/range {v5 .. v12}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->showAssociateMissingDialog(Lcom/mediatek/calloption/Request;Landroid/provider/Telephony$SIMInfo;Ljava/lang/String;Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V

    goto/16 :goto_0

    .line 420
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x5 -> :sswitch_1
        0x6 -> :sswitch_2
    .end sparse-switch
.end method

.method protected abstract showAssociateMissingDialog(Lcom/mediatek/calloption/Request;Landroid/provider/Telephony$SIMInfo;Ljava/lang/String;Lcom/mediatek/calloption/SimSelectionCallOptionHandler$AssociateSimMissingArgs;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V
.end method

.method protected abstract showReasonAskDialog(Lcom/mediatek/calloption/Request;JZLandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V
.end method
