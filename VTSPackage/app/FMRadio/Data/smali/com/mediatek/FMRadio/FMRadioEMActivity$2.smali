.class Lcom/mediatek/FMRadio/FMRadioEMActivity$2;
.super Ljava/lang/Object;
.source "FMRadioEMActivity.java"

# interfaces
.implements Lcom/mediatek/FMRadio/FMRadioListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/FMRadio/FMRadioEMActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/FMRadio/FMRadioEMActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 282
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$2;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallBack(Landroid/os/Bundle;)V
    .locals 3
    .parameter "bundle"

    .prologue
    .line 288
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$2;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mHandler:Landroid/os/Handler;
    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$1300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/os/Handler;

    move-result-object v1

    const-string v2, "callback_flag"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 289
    .local v0, msg:Landroid/os/Message;
    invoke-virtual {v0, p1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 290
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$2;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mHandler:Landroid/os/Handler;
    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$1300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 291
    return-void
.end method
