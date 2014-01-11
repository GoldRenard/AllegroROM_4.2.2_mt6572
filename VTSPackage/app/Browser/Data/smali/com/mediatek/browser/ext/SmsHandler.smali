.class public Lcom/mediatek/browser/ext/SmsHandler;
.super Ljava/lang/Object;
.source "SmsHandler.java"


# static fields
.field private static final XLOGTAG:Ljava/lang/String; = "browser/SmsHandler"


# instance fields
.field mActivity:Landroid/app/Activity;

.field private mSmsChangedFilter:Landroid/content/IntentFilter;

.field private mSmsIntentReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 2
    .parameter "aActivity"

    .prologue
    .line 26
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/mediatek/browser/ext/SmsHandler;->mActivity:Landroid/app/Activity;

    .line 29
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    iput-object v0, p0, Lcom/mediatek/browser/ext/SmsHandler;->mSmsChangedFilter:Landroid/content/IntentFilter;

    .line 30
    iget-object v0, p0, Lcom/mediatek/browser/ext/SmsHandler;->mSmsChangedFilter:Landroid/content/IntentFilter;

    const-string v1, "android.provider.Telephony.SMS_RECEIVED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 31
    new-instance v0, Lcom/mediatek/browser/ext/SmsHandler$1;

    invoke-direct {v0, p0}, Lcom/mediatek/browser/ext/SmsHandler$1;-><init>(Lcom/mediatek/browser/ext/SmsHandler;)V

    iput-object v0, p0, Lcom/mediatek/browser/ext/SmsHandler;->mSmsIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 48
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/browser/ext/SmsHandler;Landroid/content/Intent;)[Landroid/telephony/gsm/SmsMessage;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/mediatek/browser/ext/SmsHandler;->fetchMessageFromIntent(Landroid/content/Intent;)[Landroid/telephony/gsm/SmsMessage;

    move-result-object v0

    return-object v0
.end method

.method private fetchMessageFromIntent(Landroid/content/Intent;)[Landroid/telephony/gsm/SmsMessage;
    .locals 5
    .parameter "intent"

    .prologue
    .line 64
    const-string v4, "pdus"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v4

    check-cast v4, [Ljava/lang/Object;

    move-object v1, v4

    check-cast v1, [Ljava/lang/Object;

    .line 65
    .local v1, messages:[Ljava/lang/Object;
    if-nez v1, :cond_1

    .line 66
    const/4 v2, 0x0

    .line 73
    :cond_0
    return-object v2

    .line 68
    :cond_1
    array-length v3, v1

    .line 69
    .local v3, pduCount:I
    new-array v2, v3, [Landroid/telephony/gsm/SmsMessage;

    .line 70
    .local v2, msgs:[Landroid/telephony/gsm/SmsMessage;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v3, :cond_0

    .line 71
    aget-object v4, v1, v0

    check-cast v4, [B

    check-cast v4, [B

    invoke-static {v4}, Landroid/telephony/gsm/SmsMessage;->createFromPdu([B)Landroid/telephony/gsm/SmsMessage;

    move-result-object v4

    aput-object v4, v2, v0

    .line 70
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public onPause()V
    .locals 2

    .prologue
    .line 51
    const-string v0, "browser/SmsHandler"

    const-string v1, " (SmsHandler::onPause) unregisterReceiver SMS_RECEIVED_ACTION : android.provider.Telephony.SMS_RECEIVED"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    iget-object v0, p0, Lcom/mediatek/browser/ext/SmsHandler;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/mediatek/browser/ext/SmsHandler;->mSmsIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 55
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 58
    const-string v0, "browser/SmsHandler"

    const-string v1, " (SmsHandler::onResume) registerReceiver SMS_RECEIVED_ACTION : android.provider.Telephony.SMS_RECEIVED"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    iget-object v0, p0, Lcom/mediatek/browser/ext/SmsHandler;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/mediatek/browser/ext/SmsHandler;->mSmsIntentReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/mediatek/browser/ext/SmsHandler;->mSmsChangedFilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 61
    return-void
.end method
