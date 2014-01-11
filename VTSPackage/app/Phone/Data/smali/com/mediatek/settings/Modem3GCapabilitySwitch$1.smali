.class Lcom/mediatek/settings/Modem3GCapabilitySwitch$1;
.super Landroid/os/Handler;
.source "Modem3GCapabilitySwitch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/Modem3GCapabilitySwitch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)V
    .locals 0
    .parameter

    .prologue
    .line 72
    iput-object p1, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$1;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 75
    const/16 v0, 0x3e8

    iget v1, p1, Landroid/os/Message;->what:I

    if-ne v0, v1, :cond_0

    .line 76
    const-string v0, "TEST"

    const-string v1, "3G switch time out remove the progress dialog"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$1;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #calls: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->disSwitchProgressDialog()V
    invoke-static {v0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$000(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)V

    .line 78
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$1;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    const/4 v1, 0x1

    #calls: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->setStatusBarEnableStatus(Z)V
    invoke-static {v0, v1}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$100(Lcom/mediatek/settings/Modem3GCapabilitySwitch;Z)V

    .line 80
    :cond_0
    return-void
.end method
