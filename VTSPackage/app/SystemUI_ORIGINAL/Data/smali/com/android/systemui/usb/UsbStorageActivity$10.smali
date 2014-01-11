.class Lcom/android/systemui/usb/UsbStorageActivity$10;
.super Ljava/lang/Object;
.source "UsbStorageActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/usb/UsbStorageActivity;->checkStorageUsers()V
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
    .line 417
    iput-object p1, p0, Lcom/android/systemui/usb/UsbStorageActivity$10;->this$0:Lcom/android/systemui/usb/UsbStorageActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 420
    iget-object v0, p0, Lcom/android/systemui/usb/UsbStorageActivity$10;->this$0:Lcom/android/systemui/usb/UsbStorageActivity;

    #calls: Lcom/android/systemui/usb/UsbStorageActivity;->checkStorageUsersAsync()V
    invoke-static {v0}, Lcom/android/systemui/usb/UsbStorageActivity;->access$1400(Lcom/android/systemui/usb/UsbStorageActivity;)V

    .line 421
    return-void
.end method
