.class Lcom/mediatek/browser/ext/SmsHandler$1;
.super Landroid/content/BroadcastReceiver;
.source "SmsHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/browser/ext/SmsHandler;-><init>(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/browser/ext/SmsHandler;


# direct methods
.method constructor <init>(Lcom/mediatek/browser/ext/SmsHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 31
    iput-object p1, p0, Lcom/mediatek/browser/ext/SmsHandler$1;->this$0:Lcom/mediatek/browser/ext/SmsHandler;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 34
    const-string v7, "browser/SmsHandler"

    const-string v8, "(SmsHandler::onReceive)"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    const-string v8, "android.provider.Telephony.SMS_RECEIVED"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 36
    iget-object v7, p0, Lcom/mediatek/browser/ext/SmsHandler$1;->this$0:Lcom/mediatek/browser/ext/SmsHandler;

    #calls: Lcom/mediatek/browser/ext/SmsHandler;->fetchMessageFromIntent(Landroid/content/Intent;)[Landroid/telephony/gsm/SmsMessage;
    invoke-static {v7, p2}, Lcom/mediatek/browser/ext/SmsHandler;->access$000(Lcom/mediatek/browser/ext/SmsHandler;Landroid/content/Intent;)[Landroid/telephony/gsm/SmsMessage;

    move-result-object v3

    .line 37
    .local v3, messages:[Landroid/telephony/gsm/SmsMessage;
    const-string v7, "browser/SmsHandler"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "(SmsHandler::onReceive) count"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    array-length v9, v3

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    move-object v0, v3

    .local v0, arr$:[Landroid/telephony/gsm/SmsMessage;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .line 39
    .local v4, sms:Landroid/telephony/gsm/SmsMessage;
    invoke-virtual {v4}, Landroid/telephony/gsm/SmsMessage;->getOriginatingAddress()Ljava/lang/String;

    move-result-object v5

    .line 40
    .local v5, strAddress:Ljava/lang/String;
    invoke-virtual {v4}, Landroid/telephony/gsm/SmsMessage;->getMessageBody()Ljava/lang/String;

    move-result-object v6

    .line 41
    .local v6, strBody:Ljava/lang/String;
    const-string v7, "browser/SmsHandler"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "address: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", body: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    iget-object v7, p0, Lcom/mediatek/browser/ext/SmsHandler$1;->this$0:Lcom/mediatek/browser/ext/SmsHandler;

    iget-object v7, v7, Lcom/mediatek/browser/ext/SmsHandler;->mActivity:Landroid/app/Activity;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "From:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " message"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-static {v7, v8, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    .line 38
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 46
    .end local v0           #arr$:[Landroid/telephony/gsm/SmsMessage;
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v3           #messages:[Landroid/telephony/gsm/SmsMessage;
    .end local v4           #sms:Landroid/telephony/gsm/SmsMessage;
    .end local v5           #strAddress:Ljava/lang/String;
    .end local v6           #strBody:Ljava/lang/String;
    :cond_0
    return-void
.end method
