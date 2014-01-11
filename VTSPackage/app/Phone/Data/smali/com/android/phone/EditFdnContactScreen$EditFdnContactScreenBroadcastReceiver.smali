.class Lcom/android/phone/EditFdnContactScreen$EditFdnContactScreenBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "EditFdnContactScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/EditFdnContactScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EditFdnContactScreenBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/EditFdnContactScreen;


# direct methods
.method private constructor <init>(Lcom/android/phone/EditFdnContactScreen;)V
    .locals 0
    .parameter

    .prologue
    .line 776
    iput-object p1, p0, Lcom/android/phone/EditFdnContactScreen$EditFdnContactScreenBroadcastReceiver;->this$0:Lcom/android/phone/EditFdnContactScreen;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/phone/EditFdnContactScreen;Lcom/android/phone/EditFdnContactScreen$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 776
    invoke-direct {p0, p1}, Lcom/android/phone/EditFdnContactScreen$EditFdnContactScreenBroadcastReceiver;-><init>(Lcom/android/phone/EditFdnContactScreen;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 779
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 780
    .local v0, action:Ljava/lang/String;
    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 781
    iget-object v1, p0, Lcom/android/phone/EditFdnContactScreen$EditFdnContactScreenBroadcastReceiver;->this$0:Lcom/android/phone/EditFdnContactScreen;

    invoke-virtual {v1}, Lcom/android/phone/EditFdnContactScreen;->finish()V

    .line 783
    :cond_0
    return-void
.end method
