.class public abstract Lcom/mediatek/calloption/VideoCallOptionHandler;
.super Lcom/mediatek/calloption/CallOptionBaseHandler;
.source "VideoCallOptionHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoCallOptionHandler"


# instance fields
.field private mRequest:Lcom/mediatek/calloption/Request;

.field private mThreeGSIMSelectCancelListener:Landroid/content/DialogInterface$OnCancelListener;

.field private mThreeGSIMSelectClickListener:Landroid/content/DialogInterface$OnClickListener;

.field private mThreeGSIMSelectDismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field private mThreeGServiceCancelListener:Landroid/content/DialogInterface$OnCancelListener;

.field private mThreeGServiceClickListener:Landroid/content/DialogInterface$OnClickListener;

.field private mThreeGServiceDismissListener:Landroid/content/DialogInterface$OnDismissListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/mediatek/calloption/CallOptionBaseHandler;-><init>()V

    .line 139
    new-instance v0, Lcom/mediatek/calloption/VideoCallOptionHandler$1;

    invoke-direct {v0, p0}, Lcom/mediatek/calloption/VideoCallOptionHandler$1;-><init>(Lcom/mediatek/calloption/VideoCallOptionHandler;)V

    iput-object v0, p0, Lcom/mediatek/calloption/VideoCallOptionHandler;->mThreeGSIMSelectClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 158
    new-instance v0, Lcom/mediatek/calloption/VideoCallOptionHandler$2;

    invoke-direct {v0, p0}, Lcom/mediatek/calloption/VideoCallOptionHandler$2;-><init>(Lcom/mediatek/calloption/VideoCallOptionHandler;)V

    iput-object v0, p0, Lcom/mediatek/calloption/VideoCallOptionHandler;->mThreeGSIMSelectDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 165
    new-instance v0, Lcom/mediatek/calloption/VideoCallOptionHandler$3;

    invoke-direct {v0, p0}, Lcom/mediatek/calloption/VideoCallOptionHandler$3;-><init>(Lcom/mediatek/calloption/VideoCallOptionHandler;)V

    iput-object v0, p0, Lcom/mediatek/calloption/VideoCallOptionHandler;->mThreeGSIMSelectCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    .line 174
    new-instance v0, Lcom/mediatek/calloption/VideoCallOptionHandler$4;

    invoke-direct {v0, p0}, Lcom/mediatek/calloption/VideoCallOptionHandler$4;-><init>(Lcom/mediatek/calloption/VideoCallOptionHandler;)V

    iput-object v0, p0, Lcom/mediatek/calloption/VideoCallOptionHandler;->mThreeGServiceClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 188
    new-instance v0, Lcom/mediatek/calloption/VideoCallOptionHandler$5;

    invoke-direct {v0, p0}, Lcom/mediatek/calloption/VideoCallOptionHandler$5;-><init>(Lcom/mediatek/calloption/VideoCallOptionHandler;)V

    iput-object v0, p0, Lcom/mediatek/calloption/VideoCallOptionHandler;->mThreeGServiceDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 195
    new-instance v0, Lcom/mediatek/calloption/VideoCallOptionHandler$6;

    invoke-direct {v0, p0}, Lcom/mediatek/calloption/VideoCallOptionHandler$6;-><init>(Lcom/mediatek/calloption/VideoCallOptionHandler;)V

    iput-object v0, p0, Lcom/mediatek/calloption/VideoCallOptionHandler;->mThreeGServiceCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 51
    invoke-static {p0}, Lcom/mediatek/calloption/VideoCallOptionHandler;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/calloption/VideoCallOptionHandler;)Lcom/mediatek/calloption/Request;
    .locals 1
    .parameter "x0"

    .prologue
    .line 51
    iget-object v0, p0, Lcom/mediatek/calloption/VideoCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    return-object v0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 215
    const-string v0, "VideoCallOptionHandler"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    return-void
.end method

.method private requestCheckSimStatus(Lcom/mediatek/calloption/Request;I)V
    .locals 3
    .parameter "request"
    .parameter "slot"

    .prologue
    .line 132
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "com.android.phone.extra.slot"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 133
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getCallOptionHandlerFactory()Lcom/mediatek/calloption/CallOptionHandlerFactory;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/calloption/CallOptionHandlerFactory;->getSimStatusCallOptionHandler()Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    move-result-object v0

    .line 135
    .local v0, simStatusHandler:Lcom/mediatek/calloption/SimStatusCallOptionHandler;
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getCallOptionHandlerFactory()Lcom/mediatek/calloption/CallOptionHandlerFactory;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/calloption/CallOptionHandlerFactory;->getFinalCallOptionHandler()Lcom/mediatek/calloption/FinalCallOptionHandler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->setSuccessor(Lcom/mediatek/calloption/CallOptionBaseHandler;)V

    .line 136
    invoke-virtual {v0, p1}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    .line 137
    return-void
.end method


# virtual methods
.method public handleRequest(Lcom/mediatek/calloption/Request;)V
    .locals 18
    .parameter "request"

    .prologue
    .line 59
    const-string v2, "handleRequest()"

    invoke-static {v2}, Lcom/mediatek/calloption/VideoCallOptionHandler;->log(Ljava/lang/String;)V

    .line 60
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/calloption/VideoCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    .line 62
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "com.android.phone.extra.video"

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_1

    .line 63
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v2, :cond_0

    .line 64
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    .line 122
    :cond_0
    :goto_0
    return-void

    .line 71
    :cond_1
    invoke-static {}, Lcom/mediatek/calloption/CallOptionUtils;->get3GCapabilitySlots()Ljava/util/List;

    move-result-object v17

    .line 72
    .local v17, slots3G:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Integer;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/calloption/VideoCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v2}, Lcom/mediatek/calloption/Request;->isMultipleSim()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_5

    .line 73
    const/16 v16, -0x1

    .line 74
    .local v16, slotId:I
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 75
    .local v12, inserted3GSims:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-interface/range {v17 .. v17}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v15

    .line 76
    .local v15, slot:I
    move-object/from16 v0, p1

    invoke-static {v0, v15}, Lcom/mediatek/calloption/CallOptionUtils;->isSimInsert(Lcom/mediatek/calloption/Request;I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 77
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v12, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 80
    .end local v15           #slot:I
    :cond_3
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_4

    .line 81
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/calloption/VideoCallOptionHandler;->mThreeGSIMSelectClickListener:Landroid/content/DialogInterface$OnClickListener;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/calloption/VideoCallOptionHandler;->mThreeGSIMSelectDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/calloption/VideoCallOptionHandler;->mThreeGSIMSelectCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v2, v3, v5}, Lcom/mediatek/calloption/VideoCallOptionHandler;->show3GSIMSelectDialog(Lcom/mediatek/calloption/Request;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V

    goto :goto_0

    .line 84
    :cond_4
    invoke-virtual {v12}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 85
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "com.android.phone.extra.slot"

    move/from16 v0, v16

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 86
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getCallOptionHandlerFactory()Lcom/mediatek/calloption/CallOptionHandlerFactory;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/calloption/CallOptionHandlerFactory;->getSimStatusCallOptionHandler()Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    move-result-object v14

    .line 88
    .local v14, simStatusHandler:Lcom/mediatek/calloption/SimStatusCallOptionHandler;
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->getCallOptionHandlerFactory()Lcom/mediatek/calloption/CallOptionHandlerFactory;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/calloption/CallOptionHandlerFactory;->getFinalCallOptionHandler()Lcom/mediatek/calloption/FinalCallOptionHandler;

    move-result-object v2

    invoke-virtual {v14, v2}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->setSuccessor(Lcom/mediatek/calloption/CallOptionBaseHandler;)V

    .line 90
    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    goto/16 :goto_0

    .line 97
    .end local v11           #i$:Ljava/util/Iterator;
    .end local v12           #inserted3GSims:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v14           #simStatusHandler:Lcom/mediatek/calloption/SimStatusCallOptionHandler;
    .end local v16           #slotId:I
    :cond_5
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/calloption/Request;->is3GSwitchSupport()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-static/range {p1 .. p1}, Lcom/mediatek/calloption/CallOptionUtils;->get3GCapabilitySIM(Lcom/mediatek/calloption/Request;)I

    move-result v15

    .line 98
    .restart local v15       #slot:I
    :goto_2
    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_7

    const/4 v2, 0x0

    move-object/from16 v0, v17

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v9

    .line 99
    .local v9, defaultSlot3G:I
    :goto_3
    const/4 v2, -0x1

    if-ne v2, v15, :cond_b

    .line 104
    move-object/from16 v0, p1

    invoke-static {v0, v9}, Lcom/mediatek/calloption/CallOptionUtils;->isSimInsert(Lcom/mediatek/calloption/Request;I)Z

    move-result v2

    if-eqz v2, :cond_8

    move-object/from16 v0, p1

    invoke-static {v0, v9}, Lcom/mediatek/calloption/CallOptionUtils;->isSimReady(Lcom/mediatek/calloption/Request;I)Z

    move-result v2

    if-nez v2, :cond_8

    .line 106
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v9}, Lcom/mediatek/calloption/VideoCallOptionHandler;->requestCheckSimStatus(Lcom/mediatek/calloption/Request;I)V

    goto/16 :goto_0

    .line 97
    .end local v9           #defaultSlot3G:I
    .end local v15           #slot:I
    :cond_6
    const/4 v15, 0x0

    goto :goto_2

    .line 98
    .restart local v15       #slot:I
    :cond_7
    const/4 v9, -0x1

    goto :goto_3

    .line 110
    .restart local v9       #defaultSlot3G:I
    :cond_8
    const/4 v4, 0x0

    .line 111
    .local v4, isInsertSim:Z
    sget-object v8, Lcom/mediatek/phone/GeminiConstants;->SLOTS:[I

    .local v8, arr$:[I
    array-length v13, v8

    .local v13, len$:I
    const/4 v11, 0x0

    .local v11, i$:I
    :goto_4
    if-ge v11, v13, :cond_9

    aget v10, v8, v11

    .line 112
    .local v10, gs:I
    move-object/from16 v0, p1

    invoke-static {v0, v10}, Lcom/mediatek/calloption/CallOptionUtils;->isSimInsert(Lcom/mediatek/calloption/Request;I)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 113
    const/4 v4, 0x1

    .line 117
    .end local v10           #gs:I
    :cond_9
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/calloption/VideoCallOptionHandler;->mThreeGServiceClickListener:Landroid/content/DialogInterface$OnClickListener;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/mediatek/calloption/VideoCallOptionHandler;->mThreeGServiceDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/mediatek/calloption/VideoCallOptionHandler;->mThreeGServiceCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-virtual/range {v2 .. v7}, Lcom/mediatek/calloption/VideoCallOptionHandler;->showOpen3GServiceDialog(Lcom/mediatek/calloption/Request;ZLandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V

    goto/16 :goto_0

    .line 111
    .restart local v10       #gs:I
    :cond_a
    add-int/lit8 v11, v11, 0x1

    goto :goto_4

    .line 120
    .end local v4           #isInsertSim:Z
    .end local v8           #arr$:[I
    .end local v10           #gs:I
    .end local v11           #i$:I
    .end local v13           #len$:I
    :cond_b
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v15}, Lcom/mediatek/calloption/VideoCallOptionHandler;->requestCheckSimStatus(Lcom/mediatek/calloption/Request;I)V

    goto/16 :goto_0
.end method

.method protected abstract show3GSIMSelectDialog(Lcom/mediatek/calloption/Request;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V
.end method

.method protected abstract showOpen3GServiceDialog(Lcom/mediatek/calloption/Request;ZLandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V
.end method
