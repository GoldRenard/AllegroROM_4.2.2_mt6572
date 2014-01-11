.class Lcom/android/settings/deviceinfo/SimStatusGemini$3;
.super Ljava/lang/Object;
.source "SimStatusGemini.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/deviceinfo/SimStatusGemini;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/deviceinfo/SimStatusGemini;


# direct methods
.method constructor <init>(Lcom/android/settings/deviceinfo/SimStatusGemini;)V
    .locals 0
    .parameter

    .prologue
    .line 199
    iput-object p1, p0, Lcom/android/settings/deviceinfo/SimStatusGemini$3;->this$0:Lcom/android/settings/deviceinfo/SimStatusGemini;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 202
    iget-object v0, p0, Lcom/android/settings/deviceinfo/SimStatusGemini$3;->this$0:Lcom/android/settings/deviceinfo/SimStatusGemini;

    #getter for: Lcom/android/settings/deviceinfo/SimStatusGemini;->mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;
    invoke-static {v0}, Lcom/android/settings/deviceinfo/SimStatusGemini;->access$100(Lcom/android/settings/deviceinfo/SimStatusGemini;)Lcom/mediatek/CellConnService/CellConnMgr;

    move-result-object v0

    iget-object v1, p0, Lcom/android/settings/deviceinfo/SimStatusGemini$3;->this$0:Lcom/android/settings/deviceinfo/SimStatusGemini;

    #getter for: Lcom/android/settings/deviceinfo/SimStatusGemini;->mSimId:I
    invoke-static {v1}, Lcom/android/settings/deviceinfo/SimStatusGemini;->access$600(Lcom/android/settings/deviceinfo/SimStatusGemini;)I

    move-result v1

    const/16 v2, 0x12e

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/CellConnService/CellConnMgr;->handleCellConn(II)I

    .line 203
    return-void
.end method
