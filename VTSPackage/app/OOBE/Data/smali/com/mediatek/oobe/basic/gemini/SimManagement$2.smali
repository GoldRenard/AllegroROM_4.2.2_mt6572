.class Lcom/mediatek/oobe/basic/gemini/SimManagement$2;
.super Landroid/os/Handler;
.source "SimManagement.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/gemini/SimManagement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V
    .locals 0
    .parameter

    .prologue
    .line 264
    iput-object p1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$2;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 268
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 281
    :goto_0
    return-void

    .line 270
    :pswitch_0
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$2;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    .line 271
    const-string v0, "SimManagementSettings"

    const-string v1, "getActivity is null!"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 274
    :cond_0
    const-string v0, "SimManagementSettings"

    const-string v1, "dual sim mode changed!"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$2;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #calls: Lcom/mediatek/oobe/basic/gemini/SimManagement;->dealWithSwtichComplete()V
    invoke-static {v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$000(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V

    goto :goto_0

    .line 268
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
