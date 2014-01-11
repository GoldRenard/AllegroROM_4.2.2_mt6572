.class Lcom/android/phone/ChangeIccPinScreen$ChangeIccPinScreenBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ChangeIccPinScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/ChangeIccPinScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ChangeIccPinScreenBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/ChangeIccPinScreen;


# direct methods
.method private constructor <init>(Lcom/android/phone/ChangeIccPinScreen;)V
    .locals 0
    .parameter

    .prologue
    .line 581
    iput-object p1, p0, Lcom/android/phone/ChangeIccPinScreen$ChangeIccPinScreenBroadcastReceiver;->this$0:Lcom/android/phone/ChangeIccPinScreen;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/phone/ChangeIccPinScreen;Lcom/android/phone/ChangeIccPinScreen$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 581
    invoke-direct {p0, p1}, Lcom/android/phone/ChangeIccPinScreen$ChangeIccPinScreenBroadcastReceiver;-><init>(Lcom/android/phone/ChangeIccPinScreen;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 584
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 585
    .local v0, action:Ljava/lang/String;
    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "state"

    const/4 v2, 0x0

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const-string v1, "android.intent.action.DUAL_SIM_MODE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "mode"

    const/4 v2, -0x1

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    if-nez v1, :cond_2

    .line 589
    :cond_1
    iget-object v1, p0, Lcom/android/phone/ChangeIccPinScreen$ChangeIccPinScreenBroadcastReceiver;->this$0:Lcom/android/phone/ChangeIccPinScreen;

    invoke-virtual {v1}, Lcom/android/phone/ChangeIccPinScreen;->finish()V

    .line 591
    :cond_2
    return-void
.end method
