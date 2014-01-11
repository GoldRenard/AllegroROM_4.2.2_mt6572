.class Lcom/android/systemui/usb/UsbStorageActivity$8;
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


# direct methods
.method constructor <init>(Lcom/android/systemui/usb/UsbStorageActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 387
    iput-object p1, p0, Lcom/android/systemui/usb/UsbStorageActivity$8;->this$0:Lcom/android/systemui/usb/UsbStorageActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 390
    iget-object v0, p0, Lcom/android/systemui/usb/UsbStorageActivity$8;->this$0:Lcom/android/systemui/usb/UsbStorageActivity;

    #getter for: Lcom/android/systemui/usb/UsbStorageActivity;->mUnmountButton:Landroid/widget/Button;
    invoke-static {v0}, Lcom/android/systemui/usb/UsbStorageActivity;->access$1100(Lcom/android/systemui/usb/UsbStorageActivity;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 391
    iget-object v0, p0, Lcom/android/systemui/usb/UsbStorageActivity$8;->this$0:Lcom/android/systemui/usb/UsbStorageActivity;

    #getter for: Lcom/android/systemui/usb/UsbStorageActivity;->mMountButton:Landroid/widget/Button;
    invoke-static {v0}, Lcom/android/systemui/usb/UsbStorageActivity;->access$1200(Lcom/android/systemui/usb/UsbStorageActivity;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 393
    iget-object v0, p0, Lcom/android/systemui/usb/UsbStorageActivity$8;->this$0:Lcom/android/systemui/usb/UsbStorageActivity;

    #getter for: Lcom/android/systemui/usb/UsbStorageActivity;->mProgressBar:Landroid/widget/ProgressBar;
    invoke-static {v0}, Lcom/android/systemui/usb/UsbStorageActivity;->access$1300(Lcom/android/systemui/usb/UsbStorageActivity;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 395
    return-void
.end method
