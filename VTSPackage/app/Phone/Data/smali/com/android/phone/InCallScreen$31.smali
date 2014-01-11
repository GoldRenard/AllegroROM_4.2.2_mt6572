.class Lcom/android/phone/InCallScreen$31;
.super Ljava/lang/Object;
.source "InCallScreen.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/phone/InCallScreen;->selectWhichCallActive(Ljava/util/List;)V
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
    .line 8190
    iput-object p1, p0, Lcom/android/phone/InCallScreen$31;->this$0:Lcom/android/phone/InCallScreen;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 10
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 8192
    move-object v0, p1

    check-cast v0, Landroid/app/AlertDialog;

    .line 8193
    .local v0, alert:Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v4

    .line 8194
    .local v4, listAdapter:Landroid/widget/ListAdapter;
    invoke-interface {v4, p2}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Call;

    .line 8195
    .local v1, call:Lcom/android/internal/telephony/Call;
    iget-object v7, p0, Lcom/android/phone/InCallScreen$31;->this$0:Lcom/android/phone/InCallScreen;

    iget-object v7, v7, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v7}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    .line 8196
    .local v2, firstBgCall:Lcom/android/internal/telephony/Call;
    iget-object v7, p0, Lcom/android/phone/InCallScreen$31;->this$0:Lcom/android/phone/InCallScreen;

    iget-object v7, v7, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v7}, Lcom/mediatek/phone/DualTalkUtils;->getSecondActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v5

    .line 8197
    .local v5, secondBgCall:Lcom/android/internal/telephony/Call;
    if-eqz v1, :cond_0

    if-eqz v2, :cond_0

    if-eqz v5, :cond_0

    .line 8198
    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v3

    .line 8199
    .local v3, firstPhone:Lcom/android/internal/telephony/Phone;
    invoke-virtual {v5}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v6

    .line 8201
    .local v6, secondPhone:Lcom/android/internal/telephony/Phone;
    iget-object v7, p0, Lcom/android/phone/InCallScreen$31;->this$0:Lcom/android/phone/InCallScreen;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "select call at phone :"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " firstPhone "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " secondPhone "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    #calls: Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/android/phone/InCallScreen;->access$100(Lcom/android/phone/InCallScreen;Ljava/lang/String;)V

    .line 8205
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v7

    if-ne v7, v3, :cond_1

    .line 8208
    iget-object v7, p0, Lcom/android/phone/InCallScreen$31;->this$0:Lcom/android/phone/InCallScreen;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    #setter for: Lcom/android/phone/InCallScreen;->mLastClickActionTime:J
    invoke-static {v7, v8, v9}, Lcom/android/phone/InCallScreen;->access$3502(Lcom/android/phone/InCallScreen;J)J

    .line 8209
    invoke-static {v1}, Lcom/android/phone/PhoneUtils;->switchHoldingAndActive(Lcom/android/internal/telephony/Call;)V

    .line 8214
    .end local v3           #firstPhone:Lcom/android/internal/telephony/Phone;
    .end local v6           #secondPhone:Lcom/android/internal/telephony/Phone;
    :cond_0
    :goto_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 8215
    return-void

    .line 8211
    .restart local v3       #firstPhone:Lcom/android/internal/telephony/Phone;
    .restart local v6       #secondPhone:Lcom/android/internal/telephony/Phone;
    :cond_1
    iget-object v7, p0, Lcom/android/phone/InCallScreen$31;->this$0:Lcom/android/phone/InCallScreen;

    iget-object v8, p0, Lcom/android/phone/InCallScreen$31;->this$0:Lcom/android/phone/InCallScreen;

    iget-object v8, v8, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v8}, Lcom/mediatek/phone/DualTalkUtils;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/android/phone/InCallScreen;->handleUnholdAndEnd(Lcom/android/internal/telephony/Call;)V

    goto :goto_0
.end method
