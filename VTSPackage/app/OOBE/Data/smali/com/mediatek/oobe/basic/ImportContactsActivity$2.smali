.class Lcom/mediatek/oobe/basic/ImportContactsActivity$2;
.super Ljava/lang/Object;
.source "ImportContactsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/ImportContactsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 254
    iput-object p1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$2;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 259
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$2;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$2;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCellMgr:Lcom/mediatek/CellConnService/CellConnMgr;
    invoke-static {v1}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$400(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Lcom/mediatek/CellConnService/CellConnMgr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/CellConnService/CellConnMgr;->getResult()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    #setter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mResultSimLock:Ljava/lang/Integer;
    invoke-static {v0, v1}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$302(Lcom/mediatek/oobe/basic/ImportContactsActivity;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 260
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "serviceComplete result: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$2;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mResultSimLock:Ljava/lang/Integer;
    invoke-static {v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$300(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    return-void
.end method
