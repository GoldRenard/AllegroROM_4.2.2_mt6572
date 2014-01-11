.class Lcom/android/phone/InCallScreen$4;
.super Landroid/content/BroadcastReceiver;
.source "InCallScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/InCallScreen;
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
    .line 824
    iput-object p1, p0, Lcom/android/phone/InCallScreen$4;->this$0:Lcom/android/phone/InCallScreen;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v4, 0x1

    .line 827
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 828
    .local v0, action:Ljava/lang/String;
    invoke-static {}, Lcom/android/phone/InCallScreen;->access$2700()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 829
    const v1, 0x7f0d0005

    .line 830
    .local v1, msg:I
    iget-object v3, p0, Lcom/android/phone/InCallScreen$4;->this$0:Lcom/android/phone/InCallScreen;

    #getter for: Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v3}, Lcom/android/phone/InCallScreen;->access$1500(Lcom/android/phone/InCallScreen;)Lcom/android/internal/telephony/CallManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v2

    .line 831
    .local v2, state:Lcom/android/internal/telephony/PhoneConstants$State;
    sget-object v3, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v2, v3, :cond_1

    .line 852
    .end local v1           #msg:I
    .end local v2           #state:Lcom/android/internal/telephony/PhoneConstants$State;
    :cond_0
    :goto_0
    return-void

    .line 834
    .restart local v1       #msg:I
    .restart local v2       #state:Lcom/android/internal/telephony/PhoneConstants$State;
    :cond_1
    iget-object v3, p0, Lcom/android/phone/InCallScreen$4;->this$0:Lcom/android/phone/InCallScreen;

    invoke-static {v3, v1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 846
    .end local v1           #msg:I
    .end local v2           #state:Lcom/android/internal/telephony/PhoneConstants$State;
    :cond_2
    :goto_1
    iget-object v3, p0, Lcom/android/phone/InCallScreen$4;->this$0:Lcom/android/phone/InCallScreen;

    #getter for: Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;
    invoke-static {v3}, Lcom/android/phone/InCallScreen;->access$1700(Lcom/android/phone/InCallScreen;)Lcom/android/phone/CallCard;

    move-result-object v3

    iget-object v4, p0, Lcom/android/phone/InCallScreen$4;->this$0:Lcom/android/phone/InCallScreen;

    #getter for: Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v4}, Lcom/android/phone/InCallScreen;->access$1500(Lcom/android/phone/InCallScreen;)Lcom/android/internal/telephony/CallManager;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/android/phone/CallCard;->updateState(Lcom/android/internal/telephony/CallManager;)V

    .line 847
    iget-object v3, p0, Lcom/android/phone/InCallScreen$4;->this$0:Lcom/android/phone/InCallScreen;

    #calls: Lcom/android/phone/InCallScreen;->updateInCallTouchUi()V
    invoke-static {v3}, Lcom/android/phone/InCallScreen;->access$2300(Lcom/android/phone/InCallScreen;)V

    .line 849
    sget-object v3, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_OPEN:Lcom/android/phone/Constants$VTScreenMode;

    iget-object v4, p0, Lcom/android/phone/InCallScreen$4;->this$0:Lcom/android/phone/InCallScreen;

    #getter for: Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;
    invoke-static {v4}, Lcom/android/phone/InCallScreen;->access$800(Lcom/android/phone/InCallScreen;)Lcom/mediatek/phone/vt/IVTInCallScreen;

    move-result-object v4

    invoke-interface {v4}, Lcom/mediatek/phone/vt/IVTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v4

    if-ne v3, v4, :cond_0

    .line 850
    iget-object v3, p0, Lcom/android/phone/InCallScreen$4;->this$0:Lcom/android/phone/InCallScreen;

    #getter for: Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;
    invoke-static {v3}, Lcom/android/phone/InCallScreen;->access$800(Lcom/android/phone/InCallScreen;)Lcom/mediatek/phone/vt/IVTInCallScreen;

    move-result-object v3

    iget-object v4, p0, Lcom/android/phone/InCallScreen$4;->this$0:Lcom/android/phone/InCallScreen;

    #getter for: Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;
    invoke-static {v4}, Lcom/android/phone/InCallScreen;->access$800(Lcom/android/phone/InCallScreen;)Lcom/mediatek/phone/vt/IVTInCallScreen;

    move-result-object v4

    invoke-interface {v4}, Lcom/mediatek/phone/vt/IVTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/mediatek/phone/vt/IVTInCallScreen;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    goto :goto_0

    .line 836
    :cond_3
    invoke-static {}, Lcom/android/phone/InCallScreen;->access$2800()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 837
    const v1, 0x7f0d0006

    .line 838
    .restart local v1       #msg:I
    iget-object v3, p0, Lcom/android/phone/InCallScreen$4;->this$0:Lcom/android/phone/InCallScreen;

    #getter for: Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;
    invoke-static {v3}, Lcom/android/phone/InCallScreen;->access$1500(Lcom/android/phone/InCallScreen;)Lcom/android/internal/telephony/CallManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v2

    .line 839
    .restart local v2       #state:Lcom/android/internal/telephony/PhoneConstants$State;
    sget-object v3, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v2, v3, :cond_0

    .line 842
    iget-object v3, p0, Lcom/android/phone/InCallScreen$4;->this$0:Lcom/android/phone/InCallScreen;

    invoke-static {v3, v1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_1
.end method
