.class Lcom/android/systemui/usb/UsbStorageActivity$9;
.super Ljava/lang/Object;
.source "UsbStorageActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/usb/UsbStorageActivity;->switchUsbMassStorage(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/usb/UsbStorageActivity;

.field final synthetic val$on:Z


# direct methods
.method constructor <init>(Lcom/android/systemui/usb/UsbStorageActivity;Z)V
    .registers 3
    .parameter
    .parameter

    .prologue
    .line 399
    iput-object p1, p0, Lcom/android/systemui/usb/UsbStorageActivity$9;->this$0:Lcom/android/systemui/usb/UsbStorageActivity;

    iput-boolean p2, p0, Lcom/android/systemui/usb/UsbStorageActivity$9;->val$on:Z

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 405
    iget-boolean v0, p0, Lcom/android/systemui/usb/UsbStorageActivity$9;->val$on:Z

    if-eqz v0, :cond_12

    .line 406
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/android/systemui/usb/UsbStorageActivity;->access$102(Z)Z

    .line 407
    iget-object v0, p0, Lcom/android/systemui/usb/UsbStorageActivity$9;->this$0:Lcom/android/systemui/usb/UsbStorageActivity;

    invoke-static {v0}, Lcom/android/systemui/usb/UsbStorageActivity;->access$200(Lcom/android/systemui/usb/UsbStorageActivity;)Landroid/os/storage/StorageManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/storage/StorageManager;->enableUsbMassStorage()V

    .line 412
    :goto_11
    return-void

    .line 409
    :cond_12
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/android/systemui/usb/UsbStorageActivity;->access$102(Z)Z

    .line 410
    iget-object v0, p0, Lcom/android/systemui/usb/UsbStorageActivity$9;->this$0:Lcom/android/systemui/usb/UsbStorageActivity;

    invoke-static {v0}, Lcom/android/systemui/usb/UsbStorageActivity;->access$200(Lcom/android/systemui/usb/UsbStorageActivity;)Landroid/os/storage/StorageManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/storage/StorageManager;->disableUsbMassStorage()V

    goto :goto_11
.end method
