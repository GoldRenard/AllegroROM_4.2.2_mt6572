.class public Lcom/android/browser/SmsHandler;
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
    .line 29
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/android/browser/SmsHandler;->mActivity:Landroid/app/Activity;

    .line 32
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    iput-object v0, p0, Lcom/android/browser/SmsHandler;->mSmsChangedFilter:Landroid/content/IntentFilter;

    .line 33
    iget-object v0, p0, Lcom/android/browser/SmsHandler;->mSmsChangedFilter:Landroid/content/IntentFilter;

    const-string v1, "android.provider.Telephony.SMS_RECEIVED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 34
    new-instance v0, Lcom/android/browser/SmsHandler$1;

    invoke-direct {v0, p0}, Lcom/android/browser/SmsHandler$1;-><init>(Lcom/android/browser/SmsHandler;)V

    iput-object v0, p0, Lcom/android/browser/SmsHandler;->mSmsIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 71
    return-void
.end method


# virtual methods
.method onPause()V
    .locals 2

    .prologue
    .line 74
    const-string v0, "browser/SmsHandler"

    const-string v1, "(SmsHandler::onPause) unregisterReceiver SMS_RECEIVED_ACTION"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    iget-object v0, p0, Lcom/android/browser/SmsHandler;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/android/browser/SmsHandler;->mSmsIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 77
    return-void
.end method

.method onResume()V
    .locals 3

    .prologue
    .line 80
    const-string v0, "browser/SmsHandler"

    const-string v1, "(SmsHandler::onResume) registerReceiver SMS_RECEIVED_ACTION"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    iget-object v0, p0, Lcom/android/browser/SmsHandler;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/android/browser/SmsHandler;->mSmsIntentReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/android/browser/SmsHandler;->mSmsChangedFilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 82
    return-void
.end method
