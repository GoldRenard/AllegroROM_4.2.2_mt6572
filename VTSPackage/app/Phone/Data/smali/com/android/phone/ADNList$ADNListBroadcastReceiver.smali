.class Lcom/android/phone/ADNList$ADNListBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ADNList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/ADNList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ADNListBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/ADNList;


# direct methods
.method private constructor <init>(Lcom/android/phone/ADNList;)V
    .locals 0
    .parameter

    .prologue
    .line 307
    iput-object p1, p0, Lcom/android/phone/ADNList$ADNListBroadcastReceiver;->this$0:Lcom/android/phone/ADNList;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/phone/ADNList;Lcom/android/phone/ADNList$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 307
    invoke-direct {p0, p1}, Lcom/android/phone/ADNList$ADNListBroadcastReceiver;-><init>(Lcom/android/phone/ADNList;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 310
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 311
    .local v0, action:Ljava/lang/String;
    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 312
    iget-object v1, p0, Lcom/android/phone/ADNList$ADNListBroadcastReceiver;->this$0:Lcom/android/phone/ADNList;

    invoke-virtual {v1}, Lcom/android/phone/ADNList;->finish()V

    .line 314
    :cond_0
    return-void
.end method
