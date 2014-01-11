.class public Lcom/android/phone/RespondViaSmsManager$RespondViaSmsItemClickListener;
.super Ljava/lang/Object;
.source "RespondViaSmsManager.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/RespondViaSmsManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RespondViaSmsItemClickListener"
.end annotation


# instance fields
.field private mPhoneNumber:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/phone/RespondViaSmsManager;


# direct methods
.method public constructor <init>(Lcom/android/phone/RespondViaSmsManager;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "phoneNumber"

    .prologue
    .line 234
    iput-object p1, p0, Lcom/android/phone/RespondViaSmsManager$RespondViaSmsItemClickListener;->this$0:Lcom/android/phone/RespondViaSmsManager;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 235
    iput-object p2, p0, Lcom/android/phone/RespondViaSmsManager$RespondViaSmsItemClickListener;->mPhoneNumber:Ljava/lang/String;

    .line 236
    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 9
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const/4 v8, 0x1

    .line 247
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "RespondViaSmsItemClickListener.onItemClick("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")..."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    #calls: Lcom/android/phone/RespondViaSmsManager;->log(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/android/phone/RespondViaSmsManager;->access$000(Ljava/lang/String;)V

    .line 249
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 251
    .local v2, message:Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "- message: \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    #calls: Lcom/android/phone/RespondViaSmsManager;->log(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/android/phone/RespondViaSmsManager;->access$000(Ljava/lang/String;)V

    .line 256
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getCount()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ne p3, v5, :cond_0

    .line 258
    iget-object v5, p0, Lcom/android/phone/RespondViaSmsManager$RespondViaSmsItemClickListener;->this$0:Lcom/android/phone/RespondViaSmsManager;

    iget-object v6, p0, Lcom/android/phone/RespondViaSmsManager$RespondViaSmsItemClickListener;->mPhoneNumber:Ljava/lang/String;

    #calls: Lcom/android/phone/RespondViaSmsManager;->launchSmsCompose(Ljava/lang/String;)V
    invoke-static {v5, v6}, Lcom/android/phone/RespondViaSmsManager;->access$100(Lcom/android/phone/RespondViaSmsManager;Ljava/lang/String;)V

    .line 292
    :goto_0
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->getInstance()Lcom/mediatek/phone/DualTalkUtils;

    move-result-object v5

    invoke-virtual {v5}, Lcom/mediatek/phone/DualTalkUtils;->hasMultipleRingingCall()Z

    move-result v5

    if-nez v5, :cond_1

    const/4 v5, -0x1

    iget-object v6, p0, Lcom/android/phone/RespondViaSmsManager$RespondViaSmsItemClickListener;->this$0:Lcom/android/phone/RespondViaSmsManager;

    #getter for: Lcom/android/phone/RespondViaSmsManager;->mOldSoltId:I
    invoke-static {v6}, Lcom/android/phone/RespondViaSmsManager;->access$400(Lcom/android/phone/RespondViaSmsManager;)I

    move-result v6

    if-eq v5, v6, :cond_1

    iget-object v5, p0, Lcom/android/phone/RespondViaSmsManager$RespondViaSmsItemClickListener;->this$0:Lcom/android/phone/RespondViaSmsManager;

    #getter for: Lcom/android/phone/RespondViaSmsManager;->mOldSoltId:I
    invoke-static {v5}, Lcom/android/phone/RespondViaSmsManager;->access$400(Lcom/android/phone/RespondViaSmsManager;)I

    move-result v5

    iget-object v6, p0, Lcom/android/phone/RespondViaSmsManager$RespondViaSmsItemClickListener;->this$0:Lcom/android/phone/RespondViaSmsManager;

    invoke-virtual {v6}, Lcom/android/phone/RespondViaSmsManager;->getSendTextSimId()I

    move-result v6

    if-eq v5, v6, :cond_1

    .line 300
    :goto_1
    iget-object v5, p0, Lcom/android/phone/RespondViaSmsManager$RespondViaSmsItemClickListener;->this$0:Lcom/android/phone/RespondViaSmsManager;

    invoke-virtual {v5}, Lcom/android/phone/RespondViaSmsManager;->dismissPopup()V

    .line 302
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v5

    iget-object v5, v5, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v5}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v4

    .line 303
    .local v4, state:Lcom/android/internal/telephony/PhoneConstants$State;
    sget-object v5, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v4, v5, :cond_2

    .line 305
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/phone/PhoneGlobals;->dismissCallScreen()V

    .line 311
    :goto_2
    return-void

    .line 261
    .end local v4           #state:Lcom/android/internal/telephony/PhoneConstants$State;
    :cond_0
    iget-object v5, p0, Lcom/android/phone/RespondViaSmsManager$RespondViaSmsItemClickListener;->this$0:Lcom/android/phone/RespondViaSmsManager;

    iget-object v6, p0, Lcom/android/phone/RespondViaSmsManager$RespondViaSmsItemClickListener;->mPhoneNumber:Ljava/lang/String;

    #calls: Lcom/android/phone/RespondViaSmsManager;->sendText(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v5, v6, v2}, Lcom/android/phone/RespondViaSmsManager;->access$200(Lcom/android/phone/RespondViaSmsManager;Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    iget-object v5, p0, Lcom/android/phone/RespondViaSmsManager$RespondViaSmsItemClickListener;->this$0:Lcom/android/phone/RespondViaSmsManager;

    #getter for: Lcom/android/phone/RespondViaSmsManager;->mInCallScreen:Lcom/android/phone/InCallScreen;
    invoke-static {v5}, Lcom/android/phone/RespondViaSmsManager;->access$300(Lcom/android/phone/RespondViaSmsManager;)Lcom/android/phone/InCallScreen;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 267
    .local v3, res:Landroid/content/res/Resources;
    const v5, 0x7f0d037f

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 268
    .local v1, formatString:Ljava/lang/String;
    new-array v5, v8, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/android/phone/RespondViaSmsManager$RespondViaSmsItemClickListener;->mPhoneNumber:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-static {v1, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 269
    .local v0, confirmationMsg:Ljava/lang/String;
    iget-object v5, p0, Lcom/android/phone/RespondViaSmsManager$RespondViaSmsItemClickListener;->this$0:Lcom/android/phone/RespondViaSmsManager;

    #getter for: Lcom/android/phone/RespondViaSmsManager;->mInCallScreen:Lcom/android/phone/InCallScreen;
    invoke-static {v5}, Lcom/android/phone/RespondViaSmsManager;->access$300(Lcom/android/phone/RespondViaSmsManager;)Lcom/android/phone/InCallScreen;

    move-result-object v5

    invoke-static {v5, v0, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 297
    .end local v0           #confirmationMsg:Ljava/lang/String;
    .end local v1           #formatString:Ljava/lang/String;
    .end local v3           #res:Landroid/content/res/Resources;
    :cond_1
    iget-object v5, p0, Lcom/android/phone/RespondViaSmsManager$RespondViaSmsItemClickListener;->this$0:Lcom/android/phone/RespondViaSmsManager;

    #getter for: Lcom/android/phone/RespondViaSmsManager;->mInCallScreen:Lcom/android/phone/InCallScreen;
    invoke-static {v5}, Lcom/android/phone/RespondViaSmsManager;->access$300(Lcom/android/phone/RespondViaSmsManager;)Lcom/android/phone/InCallScreen;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/phone/InCallScreen;->hangupRingingCall()V

    goto :goto_1

    .line 309
    .restart local v4       #state:Lcom/android/internal/telephony/PhoneConstants$State;
    :cond_2
    iget-object v5, p0, Lcom/android/phone/RespondViaSmsManager$RespondViaSmsItemClickListener;->this$0:Lcom/android/phone/RespondViaSmsManager;

    #getter for: Lcom/android/phone/RespondViaSmsManager;->mInCallScreen:Lcom/android/phone/InCallScreen;
    invoke-static {v5}, Lcom/android/phone/RespondViaSmsManager;->access$300(Lcom/android/phone/RespondViaSmsManager;)Lcom/android/phone/InCallScreen;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/phone/InCallScreen;->requestUpdateScreen()V

    goto :goto_2
.end method
