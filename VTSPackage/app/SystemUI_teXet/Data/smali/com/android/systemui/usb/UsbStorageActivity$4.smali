.class Lcom/android/systemui/usb/UsbStorageActivity$4;
.super Ljava/lang/Object;
.source "UsbStorageActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/usb/UsbStorageActivity;->onResume()V
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
    .line 294
    iput-object p1, p0, Lcom/android/systemui/usb/UsbStorageActivity$4;->this$0:Lcom/android/systemui/usb/UsbStorageActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 297
    iget-object v0, p0, Lcom/android/systemui/usb/UsbStorageActivity$4;->this$0:Lcom/android/systemui/usb/UsbStorageActivity;

    iget-object v1, p0, Lcom/android/systemui/usb/UsbStorageActivity$4;->this$0:Lcom/android/systemui/usb/UsbStorageActivity;

    invoke-static {v1}, Lcom/android/systemui/usb/UsbStorageActivity;->access$200(Lcom/android/systemui/usb/UsbStorageActivity;)Landroid/os/storage/StorageManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/storage/StorageManager;->isUsbMassStorageEnabled()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/android/systemui/usb/UsbStorageActivity;->access$600(Lcom/android/systemui/usb/UsbStorageActivity;Z)V

    .line 298
    return-void
.end method
