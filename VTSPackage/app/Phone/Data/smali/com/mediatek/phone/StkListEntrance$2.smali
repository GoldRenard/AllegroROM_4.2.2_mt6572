.class Lcom/mediatek/phone/StkListEntrance$2;
.super Ljava/lang/Object;
.source "StkListEntrance.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/phone/StkListEntrance;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/phone/StkListEntrance;


# direct methods
.method constructor <init>(Lcom/mediatek/phone/StkListEntrance;)V
    .locals 0
    .parameter

    .prologue
    .line 269
    iput-object p1, p0, Lcom/mediatek/phone/StkListEntrance$2;->this$0:Lcom/mediatek/phone/StkListEntrance;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 271
    const-string v1, "StkListEntrance"

    const-string v2, "serviceComplete run"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    iget-object v1, p0, Lcom/mediatek/phone/StkListEntrance$2;->this$0:Lcom/mediatek/phone/StkListEntrance;

    #getter for: Lcom/mediatek/phone/StkListEntrance;->mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;
    invoke-static {v1}, Lcom/mediatek/phone/StkListEntrance;->access$100(Lcom/mediatek/phone/StkListEntrance;)Lcom/mediatek/CellConnService/CellConnMgr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/CellConnService/CellConnMgr;->getResult()I

    move-result v0

    .line 273
    .local v0, nRet:I
    const-string v1, "StkListEntrance"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "serviceComplete result = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Lcom/mediatek/CellConnService/CellConnMgr;->resultToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 274
    iget-object v1, p0, Lcom/mediatek/phone/StkListEntrance$2;->this$0:Lcom/mediatek/phone/StkListEntrance;

    #getter for: Lcom/mediatek/phone/StkListEntrance;->mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;
    invoke-static {v1}, Lcom/mediatek/phone/StkListEntrance;->access$100(Lcom/mediatek/phone/StkListEntrance;)Lcom/mediatek/CellConnService/CellConnMgr;

    const/4 v1, 0x2

    if-ne v1, v0, :cond_0

    .line 278
    :cond_0
    return-void
.end method
