.class Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;
.super Ljava/lang/Object;
.source "CellConnMgr.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Element"
.end annotation


# instance fields
.field private mReqType:I

.field private mSlot:I

.field final synthetic this$1:Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;


# direct methods
.method public constructor <init>(Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;)V
    .registers 3
    .parameter

    .prologue
    const/4 v0, 0x0

    .line 329
    iput-object p1, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;->this$1:Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 330
    iput v0, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;->mSlot:I

    .line 331
    iput v0, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;->mReqType:I

    .line 332
    return-void
.end method

.method public constructor <init>(Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;II)V
    .registers 4
    .parameter
    .parameter "slot"
    .parameter "reqType"

    .prologue
    .line 324
    iput-object p1, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;->this$1:Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 325
    iput p2, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;->mSlot:I

    .line 326
    iput p3, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;->mReqType:I

    .line 327
    return-void
.end method


# virtual methods
.method public getReqType()I
    .registers 2

    .prologue
    .line 339
    iget v0, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;->mReqType:I

    return v0
.end method

.method public getSlot()I
    .registers 2

    .prologue
    .line 335
    iget v0, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;->mSlot:I

    return v0
.end method
