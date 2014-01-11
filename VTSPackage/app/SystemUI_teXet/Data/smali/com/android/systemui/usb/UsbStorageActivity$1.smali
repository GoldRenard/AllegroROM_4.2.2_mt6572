.class Lcom/android/systemui/usb/UsbStorageActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "UsbStorageActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/usb/UsbStorageActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/usb/UsbStorageActivity;


# direct methods
.method constructor <init>(Lcom/android/systemui/usb/UsbStorageActivity;)V
    .registers 2
    .parameter

    .prologue
    .line 90
    iput-object p1, p0, Lcom/android/systemui/usb/UsbStorageActivity$1;->this$0:Lcom/android/systemui/usb/UsbStorageActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 93
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.hardware.usb.action.USB_STATE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 94
    iget-object v0, p0, Lcom/android/systemui/usb/UsbStorageActivity$1;->this$0:Lcom/android/systemui/usb/UsbStorageActivity;

    invoke-static {v0, p2}, Lcom/android/systemui/usb/UsbStorageActivity;->access$000(Lcom/android/systemui/usb/UsbStorageActivity;Landroid/content/Intent;)V

    .line 96
    :cond_11
    return-void
.end method
