.class Lcom/android/phone/InCallScreen$32;
.super Ljava/util/TimerTask;
.source "InCallScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/phone/InCallScreen;->delayStartLockScreen()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/InCallScreen;


# direct methods
.method constructor <init>(Lcom/android/phone/InCallScreen;)V
    .locals 0
    .parameter

    .prologue
    .line 8428
    iput-object p1, p0, Lcom/android/phone/InCallScreen$32;->this$0:Lcom/android/phone/InCallScreen;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 8432
    const-string v0, "lockNow"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mIsForegroundActivity = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/phone/InCallScreen$32;->this$0:Lcom/android/phone/InCallScreen;

    #getter for: Lcom/android/phone/InCallScreen;->mIsForegroundActivity:Z
    invoke-static {v2}, Lcom/android/phone/InCallScreen;->access$200(Lcom/android/phone/InCallScreen;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8433
    iget-object v0, p0, Lcom/android/phone/InCallScreen$32;->this$0:Lcom/android/phone/InCallScreen;

    #getter for: Lcom/android/phone/InCallScreen;->mIsForegroundActivity:Z
    invoke-static {v0}, Lcom/android/phone/InCallScreen;->access$200(Lcom/android/phone/InCallScreen;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 8434
    const-string v0, "lockNow"

    const-string v1, "lockscreen"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8435
    iget-object v0, p0, Lcom/android/phone/InCallScreen$32;->this$0:Lcom/android/phone/InCallScreen;

    #calls: Lcom/android/phone/InCallScreen;->lockscreen()V
    invoke-static {v0}, Lcom/android/phone/InCallScreen;->access$3600(Lcom/android/phone/InCallScreen;)V

    .line 8440
    :goto_0
    return-void

    .line 8437
    :cond_0
    const-string v0, "lockNow"

    const-string v1, "! lockscreen"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8438
    iget-object v0, p0, Lcom/android/phone/InCallScreen$32;->this$0:Lcom/android/phone/InCallScreen;

    invoke-virtual {v0}, Lcom/android/phone/InCallScreen;->cancelLockScreenTimer()V

    goto :goto_0
.end method
