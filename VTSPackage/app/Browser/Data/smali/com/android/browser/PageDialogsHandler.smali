.class public Lcom/android/browser/PageDialogsHandler;
.super Ljava/lang/Object;
.source "PageDialogsHandler.java"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mController:Lcom/android/browser/Controller;

.field private mHttpAuthenticationDialog:Lcom/android/browser/HttpAuthenticationDialog;

.field private mHttpAuthenticationHandler:Landroid/webkit/HttpAuthHandler;

.field private mPageInfoDialog:Landroid/app/AlertDialog;

.field private mPageInfoFromShowSSLCertificateOnError:Z

.field private mPageInfoView:Lcom/android/browser/Tab;

.field private mPopupWindowAttemptDialog:Landroid/app/AlertDialog;

.field private mPopupWindowAttemptIsDialog:Z

.field private mPopupWindowAttemptMessage:Landroid/os/Message;

.field private mPopupWindowAttemptView:Lcom/android/browser/Tab;

.field private mSSLCertificateDialog:Landroid/app/AlertDialog;

.field private mSSLCertificateOnErrorDialog:Landroid/app/AlertDialog;

.field private mSSLCertificateOnErrorError:Landroid/net/http/SslError;

.field private mSSLCertificateOnErrorHandler:Landroid/webkit/SslErrorHandler;

.field private mSSLCertificateOnErrorView:Landroid/webkit/WebView;

.field private mSSLCertificateView:Lcom/android/browser/Tab;

.field private mUrlCertificateOnError:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/browser/Controller;)V
    .locals 0
    .parameter "context"
    .parameter "controller"

    .prologue
    .line 70
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler;->mContext:Landroid/content/Context;

    .line 72
    iput-object p2, p0, Lcom/android/browser/PageDialogsHandler;->mController:Lcom/android/browser/Controller;

    .line 73
    return-void
.end method

.method static synthetic access$002(Lcom/android/browser/PageDialogsHandler;Lcom/android/browser/HttpAuthenticationDialog;)Lcom/android/browser/HttpAuthenticationDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler;->mHttpAuthenticationDialog:Lcom/android/browser/HttpAuthenticationDialog;

    return-object p1
.end method

.method static synthetic access$100(Lcom/android/browser/PageDialogsHandler;)Lcom/android/browser/Controller;
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mController:Lcom/android/browser/Controller;

    return-object v0
.end method

.method static synthetic access$1002(Lcom/android/browser/PageDialogsHandler;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$1102(Lcom/android/browser/PageDialogsHandler;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$1202(Lcom/android/browser/PageDialogsHandler;Lcom/android/browser/Tab;)Lcom/android/browser/Tab;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptView:Lcom/android/browser/Tab;

    return-object p1
.end method

.method static synthetic access$1302(Lcom/android/browser/PageDialogsHandler;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    iput-boolean p1, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptIsDialog:Z

    return p1
.end method

.method static synthetic access$1402(Lcom/android/browser/PageDialogsHandler;Landroid/os/Message;)Landroid/os/Message;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptMessage:Landroid/os/Message;

    return-object p1
.end method

.method static synthetic access$202(Lcom/android/browser/PageDialogsHandler;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler;->mPageInfoDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$302(Lcom/android/browser/PageDialogsHandler;Lcom/android/browser/Tab;)Lcom/android/browser/Tab;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler;->mPageInfoView:Lcom/android/browser/Tab;

    return-object p1
.end method

.method static synthetic access$400(Lcom/android/browser/PageDialogsHandler;)Landroid/webkit/WebView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$402(Lcom/android/browser/PageDialogsHandler;Landroid/webkit/WebView;)Landroid/webkit/WebView;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorView:Landroid/webkit/WebView;

    return-object p1
.end method

.method static synthetic access$500(Lcom/android/browser/PageDialogsHandler;)Landroid/webkit/SslErrorHandler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorHandler:Landroid/webkit/SslErrorHandler;

    return-object v0
.end method

.method static synthetic access$502(Lcom/android/browser/PageDialogsHandler;Landroid/webkit/SslErrorHandler;)Landroid/webkit/SslErrorHandler;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorHandler:Landroid/webkit/SslErrorHandler;

    return-object p1
.end method

.method static synthetic access$600(Lcom/android/browser/PageDialogsHandler;)Landroid/net/http/SslError;
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorError:Landroid/net/http/SslError;

    return-object v0
.end method

.method static synthetic access$602(Lcom/android/browser/PageDialogsHandler;Landroid/net/http/SslError;)Landroid/net/http/SslError;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorError:Landroid/net/http/SslError;

    return-object p1
.end method

.method static synthetic access$700(Lcom/android/browser/PageDialogsHandler;Lcom/android/browser/Tab;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/android/browser/PageDialogsHandler;->showSSLCertificate(Lcom/android/browser/Tab;)V

    return-void
.end method

.method static synthetic access$802(Lcom/android/browser/PageDialogsHandler;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$902(Lcom/android/browser/PageDialogsHandler;Lcom/android/browser/Tab;)Lcom/android/browser/Tab;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateView:Lcom/android/browser/Tab;

    return-object p1
.end method

.method private addError(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;I)V
    .locals 3
    .parameter "inflater"
    .parameter "parent"
    .parameter "error"

    .prologue
    .line 412
    const v1, 0x7f040031

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 414
    .local v0, textView:Landroid/widget/TextView;
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(I)V

    .line 415
    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 416
    return-void
.end method

.method private createSslCertificateDialog(Landroid/net/http/SslCertificate;Landroid/net/http/SslError;)Landroid/app/AlertDialog$Builder;
    .locals 8
    .parameter "certificate"
    .parameter "error"

    .prologue
    .line 363
    iget-object v6, p0, Lcom/android/browser/PageDialogsHandler;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v6}, Landroid/net/http/SslCertificate;->inflateCertificateView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v0

    .line 364
    .local v0, certificateView:Landroid/view/View;
    const v6, 0x1020380

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    .line 367
    .local v3, placeholder:Landroid/widget/LinearLayout;
    iget-object v6, p0, Lcom/android/browser/PageDialogsHandler;->mContext:Landroid/content/Context;

    invoke-static {v6}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 370
    .local v1, factory:Landroid/view/LayoutInflater;
    if-nez p2, :cond_1

    .line 371
    const v2, 0x7f02002b

    .line 372
    .local v2, iconId:I
    const v6, 0x7f040030

    invoke-virtual {v1, v6, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    .line 373
    .local v5, table:Landroid/widget/LinearLayout;
    const v6, 0x7f0d0074

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 374
    .local v4, successString:Landroid/widget/TextView;
    const v6, 0x10404f8

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(I)V

    .line 405
    .end local v4           #successString:Landroid/widget/TextView;
    .end local v5           #table:Landroid/widget/LinearLayout;
    :cond_0
    :goto_0
    new-instance v6, Landroid/app/AlertDialog$Builder;

    iget-object v7, p0, Lcom/android/browser/PageDialogsHandler;->mContext:Landroid/content/Context;

    invoke-direct {v6, v7}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v7, 0x10404f7

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    invoke-virtual {v6, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    invoke-virtual {v6, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    return-object v6

    .line 376
    .end local v2           #iconId:I
    :cond_1
    const v2, 0x7f02002a

    .line 377
    .restart local v2       #iconId:I
    const/4 v6, 0x3

    invoke-virtual {p2, v6}, Landroid/net/http/SslError;->hasError(I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 378
    const v6, 0x7f0c0062

    invoke-direct {p0, v1, v3, v6}, Lcom/android/browser/PageDialogsHandler;->addError(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;I)V

    .line 380
    :cond_2
    const/4 v6, 0x2

    invoke-virtual {p2, v6}, Landroid/net/http/SslError;->hasError(I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 381
    const v6, 0x7f0c0063

    invoke-direct {p0, v1, v3, v6}, Lcom/android/browser/PageDialogsHandler;->addError(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;I)V

    .line 383
    :cond_3
    const/4 v6, 0x1

    invoke-virtual {p2, v6}, Landroid/net/http/SslError;->hasError(I)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 384
    const v6, 0x7f0c0064

    invoke-direct {p0, v1, v3, v6}, Lcom/android/browser/PageDialogsHandler;->addError(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;I)V

    .line 386
    :cond_4
    const/4 v6, 0x0

    invoke-virtual {p2, v6}, Landroid/net/http/SslError;->hasError(I)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 387
    const v6, 0x7f0c0065

    invoke-direct {p0, v1, v3, v6}, Lcom/android/browser/PageDialogsHandler;->addError(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;I)V

    .line 389
    :cond_5
    const/4 v6, 0x4

    invoke-virtual {p2, v6}, Landroid/net/http/SslError;->hasError(I)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 390
    const v6, 0x7f0c0066

    invoke-direct {p0, v1, v3, v6}, Lcom/android/browser/PageDialogsHandler;->addError(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;I)V

    .line 392
    :cond_6
    const/4 v6, 0x5

    invoke-virtual {p2, v6}, Landroid/net/http/SslError;->hasError(I)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 393
    const v6, 0x7f0c0067

    invoke-direct {p0, v1, v3, v6}, Lcom/android/browser/PageDialogsHandler;->addError(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;I)V

    .line 400
    :cond_7
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v6

    if-nez v6, :cond_0

    .line 401
    const v6, 0x7f0c0068

    invoke-direct {p0, v1, v3, v6}, Lcom/android/browser/PageDialogsHandler;->addError(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;I)V

    goto :goto_0
.end method

.method private showSSLCertificate(Lcom/android/browser/Tab;)V
    .locals 4
    .parameter "tab"

    .prologue
    .line 261
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebView;->getCertificate()Landroid/net/http/SslCertificate;

    move-result-object v0

    .line 262
    .local v0, cert:Landroid/net/http/SslCertificate;
    if-nez v0, :cond_0

    .line 288
    :goto_0
    return-void

    .line 266
    :cond_0
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateView:Lcom/android/browser/Tab;

    .line 267
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getSslCertificateError()Landroid/net/http/SslError;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/android/browser/PageDialogsHandler;->createSslCertificateDialog(Landroid/net/http/SslCertificate;Landroid/net/http/SslError;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0c0058

    new-instance v3, Lcom/android/browser/PageDialogsHandler$7;

    invoke-direct {v3, p0, p1}, Lcom/android/browser/PageDialogsHandler$7;-><init>(Lcom/android/browser/PageDialogsHandler;Lcom/android/browser/Tab;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/android/browser/PageDialogsHandler$6;

    invoke-direct {v2, p0, p1}, Lcom/android/browser/PageDialogsHandler$6;-><init>(Lcom/android/browser/PageDialogsHandler;Lcom/android/browser/Tab;)V

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateDialog:Landroid/app/AlertDialog;

    goto :goto_0
.end method


# virtual methods
.method destroyDialogs()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 477
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mPageInfoDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 478
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mPageInfoDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 479
    iput-object v4, p0, Lcom/android/browser/PageDialogsHandler;->mPageInfoDialog:Landroid/app/AlertDialog;

    .line 480
    iput-object v4, p0, Lcom/android/browser/PageDialogsHandler;->mPageInfoView:Lcom/android/browser/Tab;

    .line 482
    :cond_0
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_1

    .line 483
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 484
    iput-object v4, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateDialog:Landroid/app/AlertDialog;

    .line 485
    iput-object v4, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateView:Lcom/android/browser/Tab;

    .line 487
    :cond_1
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_2

    .line 488
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 489
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorView:Landroid/webkit/WebView;

    invoke-static {v0}, Landroid/webkit/WebViewClassic;->fromWebView(Landroid/webkit/WebView;)Landroid/webkit/WebViewClassic;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebViewClassic;->getWebViewClient()Landroid/webkit/WebViewClient;

    move-result-object v0

    iget-object v1, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorHandler:Landroid/webkit/SslErrorHandler;

    iget-object v3, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorError:Landroid/net/http/SslError;

    invoke-virtual {v0, v1, v2, v3}, Landroid/webkit/WebViewClient;->onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    .line 492
    iput-object v4, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorDialog:Landroid/app/AlertDialog;

    .line 493
    iput-object v4, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorView:Landroid/webkit/WebView;

    .line 494
    iput-object v4, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorHandler:Landroid/webkit/SslErrorHandler;

    .line 495
    iput-object v4, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorError:Landroid/net/http/SslError;

    .line 497
    :cond_2
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mHttpAuthenticationDialog:Lcom/android/browser/HttpAuthenticationDialog;

    if-eqz v0, :cond_3

    .line 498
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mHttpAuthenticationHandler:Landroid/webkit/HttpAuthHandler;

    invoke-virtual {v0}, Landroid/webkit/HttpAuthHandler;->cancel()V

    .line 499
    iput-object v4, p0, Lcom/android/browser/PageDialogsHandler;->mHttpAuthenticationDialog:Lcom/android/browser/HttpAuthenticationDialog;

    .line 500
    iput-object v4, p0, Lcom/android/browser/PageDialogsHandler;->mHttpAuthenticationHandler:Landroid/webkit/HttpAuthHandler;

    .line 502
    :cond_3
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_4

    .line 503
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 504
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptView:Lcom/android/browser/Tab;

    invoke-virtual {v0}, Lcom/android/browser/Tab;->getWebViewClassic()Landroid/webkit/WebViewClassic;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebViewClassic;->notifyWebViewCoreThread()V

    .line 505
    iput-object v4, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptDialog:Landroid/app/AlertDialog;

    .line 506
    iput-object v4, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptView:Lcom/android/browser/Tab;

    .line 507
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptIsDialog:Z

    .line 508
    iput-object v4, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptMessage:Landroid/os/Message;

    .line 511
    :cond_4
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3
    .parameter "config"

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mPageInfoDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 77
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mPageInfoDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 78
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mPageInfoView:Lcom/android/browser/Tab;

    iget-boolean v1, p0, Lcom/android/browser/PageDialogsHandler;->mPageInfoFromShowSSLCertificateOnError:Z

    iget-object v2, p0, Lcom/android/browser/PageDialogsHandler;->mUrlCertificateOnError:Ljava/lang/String;

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/browser/PageDialogsHandler;->showPageInfo(Lcom/android/browser/Tab;ZLjava/lang/String;)V

    .line 82
    :cond_0
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_1

    .line 83
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 84
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateView:Lcom/android/browser/Tab;

    invoke-direct {p0, v0}, Lcom/android/browser/PageDialogsHandler;->showSSLCertificate(Lcom/android/browser/Tab;)V

    .line 86
    :cond_1
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_2

    .line 87
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 88
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorView:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorHandler:Landroid/webkit/SslErrorHandler;

    iget-object v2, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorError:Landroid/net/http/SslError;

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/browser/PageDialogsHandler;->showSSLCertificateOnError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    .line 92
    :cond_2
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mHttpAuthenticationDialog:Lcom/android/browser/HttpAuthenticationDialog;

    if-eqz v0, :cond_3

    .line 93
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mHttpAuthenticationDialog:Lcom/android/browser/HttpAuthenticationDialog;

    invoke-virtual {v0}, Lcom/android/browser/HttpAuthenticationDialog;->reshow()V

    .line 96
    :cond_3
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_4

    .line 97
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 98
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptView:Lcom/android/browser/Tab;

    iget-boolean v1, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptIsDialog:Z

    iget-object v2, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptMessage:Landroid/os/Message;

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/browser/PageDialogsHandler;->showPopupWindowAttempt(Lcom/android/browser/Tab;ZLandroid/os/Message;)V

    .line 103
    :cond_4
    return-void
.end method

.method public setHttpAuthUsernamePassword(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "host"
    .parameter "realm"
    .parameter "username"
    .parameter "password"

    .prologue
    .line 139
    iget-object v1, p0, Lcom/android/browser/PageDialogsHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v1}, Lcom/android/browser/Controller;->getCurrentTopWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 140
    .local v0, w:Landroid/webkit/WebView;
    if-eqz v0, :cond_0

    .line 141
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/webkit/WebView;->setHttpAuthUsernamePassword(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    :cond_0
    return-void
.end method

.method showHttpAuthentication(Lcom/android/browser/Tab;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "tab"
    .parameter "handler"
    .parameter "host"
    .parameter "realm"

    .prologue
    .line 109
    new-instance v0, Lcom/android/browser/HttpAuthenticationDialog;

    iget-object v1, p0, Lcom/android/browser/PageDialogsHandler;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p3, p4}, Lcom/android/browser/HttpAuthenticationDialog;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mHttpAuthenticationDialog:Lcom/android/browser/HttpAuthenticationDialog;

    .line 110
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mHttpAuthenticationDialog:Lcom/android/browser/HttpAuthenticationDialog;

    new-instance v1, Lcom/android/browser/PageDialogsHandler$1;

    invoke-direct {v1, p0, p2}, Lcom/android/browser/PageDialogsHandler$1;-><init>(Lcom/android/browser/PageDialogsHandler;Landroid/webkit/HttpAuthHandler;)V

    invoke-virtual {v0, v1}, Lcom/android/browser/HttpAuthenticationDialog;->setOkListener(Lcom/android/browser/HttpAuthenticationDialog$OkListener;)V

    .line 117
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mHttpAuthenticationDialog:Lcom/android/browser/HttpAuthenticationDialog;

    new-instance v1, Lcom/android/browser/PageDialogsHandler$2;

    invoke-direct {v1, p0, p2, p1}, Lcom/android/browser/PageDialogsHandler$2;-><init>(Lcom/android/browser/PageDialogsHandler;Landroid/webkit/HttpAuthHandler;Lcom/android/browser/Tab;)V

    invoke-virtual {v0, v1}, Lcom/android/browser/HttpAuthenticationDialog;->setCancelListener(Lcom/android/browser/HttpAuthenticationDialog$CancelListener;)V

    .line 124
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler;->mHttpAuthenticationDialog:Lcom/android/browser/HttpAuthenticationDialog;

    invoke-virtual {v0}, Lcom/android/browser/HttpAuthenticationDialog;->show()V

    .line 125
    return-void
.end method

.method showPageInfo(Lcom/android/browser/Tab;ZLjava/lang/String;)V
    .locals 9
    .parameter "tab"
    .parameter "fromShowSSLCertificateOnError"
    .parameter "urlCertificateOnError"

    .prologue
    .line 158
    if-nez p1, :cond_0

    .line 252
    :goto_0
    return-void

    .line 159
    :cond_0
    iget-object v6, p0, Lcom/android/browser/PageDialogsHandler;->mContext:Landroid/content/Context;

    invoke-static {v6}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 161
    .local v1, factory:Landroid/view/LayoutInflater;
    const v6, 0x7f040025

    const/4 v7, 0x0

    invoke-virtual {v1, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 163
    .local v2, pageInfoView:Landroid/view/View;
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v5

    .line 165
    .local v5, view:Landroid/webkit/WebView;
    if-eqz p2, :cond_5

    move-object v4, p3

    .line 166
    .local v4, url:Ljava/lang/String;
    :goto_1
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getTitle()Ljava/lang/String;

    move-result-object v3

    .line 168
    .local v3, title:Ljava/lang/String;
    if-nez v4, :cond_1

    .line 169
    const-string v4, ""

    .line 171
    :cond_1
    if-nez v3, :cond_2

    .line 172
    const-string v3, ""

    .line 175
    :cond_2
    const v6, 0x7f0d0038

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {v6, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    const v6, 0x7f0d0007

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 178
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler;->mPageInfoView:Lcom/android/browser/Tab;

    .line 179
    iput-boolean p2, p0, Lcom/android/browser/PageDialogsHandler;->mPageInfoFromShowSSLCertificateOnError:Z

    .line 180
    iput-object p3, p0, Lcom/android/browser/PageDialogsHandler;->mUrlCertificateOnError:Ljava/lang/String;

    .line 182
    new-instance v6, Landroid/app/AlertDialog$Builder;

    iget-object v7, p0, Lcom/android/browser/PageDialogsHandler;->mContext:Landroid/content/Context;

    invoke-direct {v6, v7}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v7, 0x7f0c005a

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const v7, 0x108009b

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    invoke-virtual {v6, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const v7, 0x7f0c0058

    new-instance v8, Lcom/android/browser/PageDialogsHandler$4;

    invoke-direct {v8, p0, p2}, Lcom/android/browser/PageDialogsHandler$4;-><init>(Lcom/android/browser/PageDialogsHandler;Z)V

    invoke-virtual {v6, v7, v8}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    new-instance v7, Lcom/android/browser/PageDialogsHandler$3;

    invoke-direct {v7, p0, p2}, Lcom/android/browser/PageDialogsHandler$3;-><init>(Lcom/android/browser/PageDialogsHandler;Z)V

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 224
    .local v0, alertDialogBuilder:Landroid/app/AlertDialog$Builder;
    if-nez p2, :cond_3

    if-eqz v5, :cond_4

    invoke-virtual {v5}, Landroid/webkit/WebView;->getCertificate()Landroid/net/http/SslCertificate;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 227
    :cond_3
    const v6, 0x7f0c0060

    new-instance v7, Lcom/android/browser/PageDialogsHandler$5;

    invoke-direct {v7, p0, p2, p1}, Lcom/android/browser/PageDialogsHandler$5;-><init>(Lcom/android/browser/PageDialogsHandler;ZLcom/android/browser/Tab;)V

    invoke-virtual {v0, v6, v7}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 251
    :cond_4
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v6

    iput-object v6, p0, Lcom/android/browser/PageDialogsHandler;->mPageInfoDialog:Landroid/app/AlertDialog;

    goto/16 :goto_0

    .line 165
    .end local v0           #alertDialogBuilder:Landroid/app/AlertDialog$Builder;
    .end local v3           #title:Ljava/lang/String;
    .end local v4           #url:Ljava/lang/String;
    :cond_5
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v4

    goto :goto_1
.end method

.method showPopupWindowAttempt(Lcom/android/browser/Tab;ZLandroid/os/Message;)V
    .locals 4
    .parameter "tab"
    .parameter "dialog"
    .parameter "resultMsg"

    .prologue
    .line 420
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptView:Lcom/android/browser/Tab;

    .line 421
    iput-boolean p2, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptIsDialog:Z

    .line 422
    iput-object p3, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptMessage:Landroid/os/Message;

    .line 425
    new-instance v0, Lcom/android/browser/PageDialogsHandler$11;

    invoke-direct {v0, p0, p3, p2, p1}, Lcom/android/browser/PageDialogsHandler$11;-><init>(Lcom/android/browser/PageDialogsHandler;Landroid/os/Message;ZLcom/android/browser/Tab;)V

    .line 448
    .local v0, allowListener:Landroid/content/DialogInterface$OnClickListener;
    new-instance v1, Lcom/android/browser/PageDialogsHandler$12;

    invoke-direct {v1, p0, p3}, Lcom/android/browser/PageDialogsHandler$12;-><init>(Lcom/android/browser/PageDialogsHandler;Landroid/os/Message;)V

    .line 461
    .local v1, blockListener:Landroid/content/DialogInterface$OnClickListener;
    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/android/browser/PageDialogsHandler;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x1010355

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setIconAttribute(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f0c014f

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f0c0150

    invoke-virtual {v2, v3, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f0c0151

    invoke-virtual {v2, v3, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptDialog:Landroid/app/AlertDialog;

    .line 471
    iget-object v2, p0, Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 472
    return-void
.end method

.method showSSLCertificateOnError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 4
    .parameter "view"
    .parameter "handler"
    .parameter "error"

    .prologue
    .line 301
    invoke-virtual {p3}, Landroid/net/http/SslError;->getCertificate()Landroid/net/http/SslCertificate;

    move-result-object v0

    .line 302
    .local v0, cert:Landroid/net/http/SslCertificate;
    if-nez v0, :cond_0

    .line 352
    :goto_0
    return-void

    .line 306
    :cond_0
    iput-object p2, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorHandler:Landroid/webkit/SslErrorHandler;

    .line 307
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorView:Landroid/webkit/WebView;

    .line 308
    iput-object p3, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorError:Landroid/net/http/SslError;

    .line 309
    invoke-direct {p0, v0, p3}, Lcom/android/browser/PageDialogsHandler;->createSslCertificateDialog(Landroid/net/http/SslCertificate;Landroid/net/http/SslError;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0c0058

    new-instance v3, Lcom/android/browser/PageDialogsHandler$10;

    invoke-direct {v3, p0, p1, p2, p3}, Lcom/android/browser/PageDialogsHandler$10;-><init>(Lcom/android/browser/PageDialogsHandler;Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0c005b

    new-instance v3, Lcom/android/browser/PageDialogsHandler$9;

    invoke-direct {v3, p0, p1, p3}, Lcom/android/browser/PageDialogsHandler$9;-><init>(Lcom/android/browser/PageDialogsHandler;Landroid/webkit/WebView;Landroid/net/http/SslError;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/android/browser/PageDialogsHandler$8;

    invoke-direct {v2, p0, p1, p2, p3}, Lcom/android/browser/PageDialogsHandler$8;-><init>(Lcom/android/browser/PageDialogsHandler;Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/PageDialogsHandler;->mSSLCertificateOnErrorDialog:Landroid/app/AlertDialog;

    goto :goto_0
.end method
