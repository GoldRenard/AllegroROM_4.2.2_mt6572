.class public Lcom/android/browser/NfcHandler;
.super Ljava/lang/Object;
.source "NfcHandler.java"

# interfaces
.implements Landroid/nfc/NfcAdapter$CreateNdefMessageCallback;


# static fields
.field static final GET_PRIVATE_BROWSING_STATE_MSG:I = 0x64

.field static final TAG:Ljava/lang/String; = "BrowserNfcHandler"


# instance fields
.field final mController:Lcom/android/browser/Controller;

.field mCurrentTab:Lcom/android/browser/Tab;

.field final mHandler:Landroid/os/Handler;

.field mIsPrivate:Z

.field mPrivateBrowsingSignal:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public constructor <init>(Lcom/android/browser/Controller;)V
    .locals 1
    .parameter "controller"

    .prologue
    .line 64
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 68
    new-instance v0, Lcom/android/browser/NfcHandler$1;

    invoke-direct {v0, p0}, Lcom/android/browser/NfcHandler$1;-><init>(Lcom/android/browser/NfcHandler;)V

    iput-object v0, p0, Lcom/android/browser/NfcHandler;->mHandler:Landroid/os/Handler;

    .line 65
    iput-object p1, p0, Lcom/android/browser/NfcHandler;->mController:Lcom/android/browser/Controller;

    .line 66
    return-void
.end method

.method public static register(Landroid/app/Activity;Lcom/android/browser/Controller;)V
    .locals 3
    .parameter "activity"
    .parameter "controller"

    .prologue
    .line 46
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/nfc/NfcAdapter;->getDefaultAdapter(Landroid/content/Context;)Landroid/nfc/NfcAdapter;

    move-result-object v0

    .line 47
    .local v0, adapter:Landroid/nfc/NfcAdapter;
    if-nez v0, :cond_0

    .line 56
    :goto_0
    return-void

    .line 50
    :cond_0
    const/4 v1, 0x0

    .line 51
    .local v1, handler:Lcom/android/browser/NfcHandler;
    if-eqz p1, :cond_1

    .line 52
    new-instance v1, Lcom/android/browser/NfcHandler;

    .end local v1           #handler:Lcom/android/browser/NfcHandler;
    invoke-direct {v1, p1}, Lcom/android/browser/NfcHandler;-><init>(Lcom/android/browser/Controller;)V

    .line 55
    .restart local v1       #handler:Lcom/android/browser/NfcHandler;
    :cond_1
    const/4 v2, 0x0

    new-array v2, v2, [Landroid/app/Activity;

    invoke-virtual {v0, v1, p0, v2}, Landroid/nfc/NfcAdapter;->setNdefPushMessageCallback(Landroid/nfc/NfcAdapter$CreateNdefMessageCallback;Landroid/app/Activity;[Landroid/app/Activity;)V

    goto :goto_0
.end method

.method public static unregister(Landroid/app/Activity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 61
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/android/browser/NfcHandler;->register(Landroid/app/Activity;Lcom/android/browser/Controller;)V

    .line 62
    return-void
.end method


# virtual methods
.method public createNdefMessage(Landroid/nfc/NfcEvent;)Landroid/nfc/NdefMessage;
    .locals 6
    .parameter "event"

    .prologue
    const/4 v2, 0x0

    .line 80
    iget-object v3, p0, Lcom/android/browser/NfcHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v3}, Lcom/android/browser/Controller;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v3

    iput-object v3, p0, Lcom/android/browser/NfcHandler;->mCurrentTab:Lcom/android/browser/Tab;

    .line 81
    iget-object v3, p0, Lcom/android/browser/NfcHandler;->mCurrentTab:Lcom/android/browser/Tab;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/android/browser/NfcHandler;->mCurrentTab:Lcom/android/browser/Tab;

    invoke-virtual {v3}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 84
    new-instance v3, Ljava/util/concurrent/CountDownLatch;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v3, p0, Lcom/android/browser/NfcHandler;->mPrivateBrowsingSignal:Ljava/util/concurrent/CountDownLatch;

    .line 85
    iget-object v3, p0, Lcom/android/browser/NfcHandler;->mHandler:Landroid/os/Handler;

    iget-object v4, p0, Lcom/android/browser/NfcHandler;->mHandler:Landroid/os/Handler;

    const/16 v5, 0x64

    invoke-virtual {v4, v5}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 87
    :try_start_0
    iget-object v3, p0, Lcom/android/browser/NfcHandler;->mPrivateBrowsingSignal:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v3}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    :cond_0
    iget-object v3, p0, Lcom/android/browser/NfcHandler;->mCurrentTab:Lcom/android/browser/Tab;

    if-eqz v3, :cond_1

    iget-boolean v3, p0, Lcom/android/browser/NfcHandler;->mIsPrivate:Z

    if-eqz v3, :cond_2

    .line 106
    :cond_1
    :goto_0
    return-object v2

    .line 88
    :catch_0
    move-exception v1

    .line 89
    .local v1, e:Ljava/lang/InterruptedException;
    goto :goto_0

    .line 97
    .end local v1           #e:Ljava/lang/InterruptedException;
    :cond_2
    iget-object v3, p0, Lcom/android/browser/NfcHandler;->mCurrentTab:Lcom/android/browser/Tab;

    invoke-virtual {v3}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v0

    .line 98
    .local v0, currentUrl:Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 100
    :try_start_1
    new-instance v3, Landroid/nfc/NdefMessage;

    invoke-static {v0}, Landroid/nfc/NdefRecord;->createUri(Ljava/lang/String;)Landroid/nfc/NdefRecord;

    move-result-object v4

    const/4 v5, 0x0

    new-array v5, v5, [Landroid/nfc/NdefRecord;

    invoke-direct {v3, v4, v5}, Landroid/nfc/NdefMessage;-><init>(Landroid/nfc/NdefRecord;[Landroid/nfc/NdefRecord;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v2, v3

    goto :goto_0

    .line 101
    :catch_1
    move-exception v1

    .line 102
    .local v1, e:Ljava/lang/IllegalArgumentException;
    const-string v3, "BrowserNfcHandler"

    const-string v4, "IllegalArgumentException creating URI NdefRecord"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
