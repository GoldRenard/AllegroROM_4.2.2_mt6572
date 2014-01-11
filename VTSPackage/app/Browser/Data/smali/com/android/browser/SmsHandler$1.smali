.class Lcom/android/browser/SmsHandler$1;
.super Landroid/content/BroadcastReceiver;
.source "SmsHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/SmsHandler;-><init>(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/SmsHandler;


# direct methods
.method constructor <init>(Lcom/android/browser/SmsHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 34
    iput-object p1, p0, Lcom/android/browser/SmsHandler$1;->this$0:Lcom/android/browser/SmsHandler;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 15
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 38
    const-string v10, "browser/SmsHandler"

    const-string v11, "(SmsHandler::onReceive) "

    invoke-static {v10, v11}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v10

    const-string v11, "android.provider.Telephony.SMS_RECEIVED"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 41
    invoke-static/range {p2 .. p2}, Landroid/provider/Telephony$Sms$Intents;->getMessagesFromIntent(Landroid/content/Intent;)[Landroid/telephony/SmsMessage;

    move-result-object v4

    .line 42
    .local v4, messages:[Landroid/telephony/SmsMessage;
    if-nez v4, :cond_1

    .line 43
    const-string v10, "browser/SmsHandler"

    const-string v11, "Smshandler.onReceive, messages are null"

    invoke-static {v10, v11}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .end local v4           #messages:[Landroid/telephony/SmsMessage;
    :cond_0
    :goto_0
    return-void

    .line 46
    .restart local v4       #messages:[Landroid/telephony/SmsMessage;
    :cond_1
    const-string v10, "browser/SmsHandler"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "(SmsHandler::onReceive) count"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    array-length v12, v4

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    const/4 v10, 0x0

    aget-object v7, v4, v10

    .line 48
    .local v7, sms:Landroid/telephony/SmsMessage;
    iget-object v10, v7, Landroid/telephony/SmsMessage;->mWrappedSmsMessage:Lcom/android/internal/telephony/SmsMessageBase;

    if-nez v10, :cond_2

    const-string v8, ""

    .line 49
    .local v8, strAddress:Ljava/lang/String;
    :goto_1
    const/4 v9, 0x0

    .line 50
    .local v9, strBody:Ljava/lang/String;
    array-length v1, v4

    .line 51
    .local v1, count:I
    const/4 v10, 0x1

    if-ne v1, v10, :cond_4

    .line 52
    const/4 v10, 0x0

    aget-object v7, v4, v10

    .line 53
    iget-object v10, v7, Landroid/telephony/SmsMessage;->mWrappedSmsMessage:Lcom/android/internal/telephony/SmsMessageBase;

    if-nez v10, :cond_3

    const-string v9, ""

    .line 63
    :goto_2
    const-string v10, "browser/SmsHandler"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "address: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", body: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    iget-object v10, p0, Lcom/android/browser/SmsHandler$1;->this$0:Lcom/android/browser/SmsHandler;

    iget-object v10, v10, Lcom/android/browser/SmsHandler;->mActivity:Landroid/app/Activity;

    iget-object v11, p0, Lcom/android/browser/SmsHandler$1;->this$0:Lcom/android/browser/SmsHandler;

    iget-object v11, v11, Lcom/android/browser/SmsHandler;->mActivity:Landroid/app/Activity;

    const v12, 0x7f0c003d

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object v8, v13, v14

    invoke-virtual {v11, v12, v13}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    invoke-static {v10, v11, v12}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v10

    invoke-virtual {v10}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 48
    .end local v1           #count:I
    .end local v8           #strAddress:Ljava/lang/String;
    .end local v9           #strBody:Ljava/lang/String;
    :cond_2
    invoke-virtual {v7}, Landroid/telephony/SmsMessage;->getDisplayOriginatingAddress()Ljava/lang/String;

    move-result-object v8

    goto :goto_1

    .line 53
    .restart local v1       #count:I
    .restart local v8       #strAddress:Ljava/lang/String;
    .restart local v9       #strBody:Ljava/lang/String;
    :cond_3
    invoke-virtual {v7}, Landroid/telephony/SmsMessage;->getDisplayMessageBody()Ljava/lang/String;

    move-result-object v9

    goto :goto_2

    .line 55
    :cond_4
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .local v6, sb:Ljava/lang/StringBuilder;
    move-object v0, v4

    .local v0, arr$:[Landroid/telephony/SmsMessage;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_3
    if-ge v2, v3, :cond_6

    aget-object v5, v0, v2

    .line 57
    .local v5, msg:Landroid/telephony/SmsMessage;
    iget-object v10, v5, Landroid/telephony/SmsMessage;->mWrappedSmsMessage:Lcom/android/internal/telephony/SmsMessageBase;

    if-eqz v10, :cond_5

    .line 58
    invoke-virtual {v5}, Landroid/telephony/SmsMessage;->getDisplayMessageBody()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 61
    .end local v5           #msg:Landroid/telephony/SmsMessage;
    :cond_6
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto :goto_2
.end method
