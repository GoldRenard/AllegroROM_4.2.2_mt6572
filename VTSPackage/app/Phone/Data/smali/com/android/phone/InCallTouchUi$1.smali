.class Lcom/android/phone/InCallTouchUi$1;
.super Landroid/os/Handler;
.source "InCallTouchUi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/InCallTouchUi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/InCallTouchUi;


# direct methods
.method constructor <init>(Lcom/android/phone/InCallTouchUi;)V
    .locals 0
    .parameter

    .prologue
    .line 154
    iput-object p1, p0, Lcom/android/phone/InCallTouchUi$1;->this$0:Lcom/android/phone/InCallTouchUi;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 159
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi$1;->this$0:Lcom/android/phone/InCallTouchUi;

    #getter for: Lcom/android/phone/InCallTouchUi;->mInCallScreen:Lcom/android/phone/InCallScreen;
    invoke-static {v0}, Lcom/android/phone/InCallTouchUi;->access$000(Lcom/android/phone/InCallTouchUi;)Lcom/android/phone/InCallScreen;

    move-result-object v0

    if-nez v0, :cond_0

    .line 170
    :goto_0
    return-void

    .line 161
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 167
    const-string v0, "InCallTouchUi"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mHandler: unexpected message: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 163
    :pswitch_0
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi$1;->this$0:Lcom/android/phone/InCallTouchUi;

    const-string v1, "INCOMING_CALL_WIDGET_PING..."

    #calls: Lcom/android/phone/InCallTouchUi;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/android/phone/InCallTouchUi;->access$100(Lcom/android/phone/InCallTouchUi;Ljava/lang/String;)V

    .line 164
    iget-object v0, p0, Lcom/android/phone/InCallTouchUi$1;->this$0:Lcom/android/phone/InCallTouchUi;

    invoke-virtual {v0}, Lcom/android/phone/InCallTouchUi;->triggerPing()V

    goto :goto_0

    .line 161
    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_0
    .end packed-switch
.end method
