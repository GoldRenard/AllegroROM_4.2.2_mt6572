.class public Lcom/android/browser/NotificationPermissionsPrompt;
.super Landroid/widget/RelativeLayout;
.source "NotificationPermissionsPrompt.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "NotificationPermissionsPrompt"


# instance fields
.field private mAllowButton:Landroid/widget/Button;

.field private mBody:Landroid/widget/TextView;

.field private mCallback:Landroid/webkit/NotificationPermissions$Callback;

.field private mDenyButton:Landroid/widget/Button;

.field private mOrigin:Ljava/lang/String;

.field private mTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 29
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/browser/NotificationPermissionsPrompt;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attributeSet"

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    return-void
.end method

.method static synthetic access$000(Lcom/android/browser/NotificationPermissionsPrompt;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/android/browser/NotificationPermissionsPrompt;->handleButtonClick(Z)V

    return-void
.end method

.method private handleButtonClick(Z)V
    .locals 2
    .parameter "allow"

    .prologue
    .line 37
    const-string v0, "NotificationPermissionsPrompt"

    const-string v1, "Inside NotificationPermissionsPrompt handleButtonClick"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    invoke-virtual {p0}, Lcom/android/browser/NotificationPermissionsPrompt;->hide()V

    .line 39
    iget-object v0, p0, Lcom/android/browser/NotificationPermissionsPrompt;->mCallback:Landroid/webkit/NotificationPermissions$Callback;

    iget-object v1, p0, Lcom/android/browser/NotificationPermissionsPrompt;->mOrigin:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Landroid/webkit/NotificationPermissions$Callback;->invoke(Ljava/lang/String;Z)V

    .line 40
    return-void
.end method

.method private init()V
    .locals 2

    .prologue
    .line 43
    const-string v0, "NotificationPermissionsPrompt"

    const-string v1, "Inside NotificationPermissionsPrompt init"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    const v0, 0x7f0d0007

    invoke-virtual {p0, v0}, Lcom/android/browser/NotificationPermissionsPrompt;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/browser/NotificationPermissionsPrompt;->mTitle:Landroid/widget/TextView;

    .line 45
    const v0, 0x7f0d0064

    invoke-virtual {p0, v0}, Lcom/android/browser/NotificationPermissionsPrompt;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/browser/NotificationPermissionsPrompt;->mBody:Landroid/widget/TextView;

    .line 46
    const v0, 0x7f0d0066

    invoke-virtual {p0, v0}, Lcom/android/browser/NotificationPermissionsPrompt;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/android/browser/NotificationPermissionsPrompt;->mDenyButton:Landroid/widget/Button;

    .line 47
    const v0, 0x7f0d0065

    invoke-virtual {p0, v0}, Lcom/android/browser/NotificationPermissionsPrompt;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/android/browser/NotificationPermissionsPrompt;->mAllowButton:Landroid/widget/Button;

    .line 49
    iget-object v0, p0, Lcom/android/browser/NotificationPermissionsPrompt;->mDenyButton:Landroid/widget/Button;

    new-instance v1, Lcom/android/browser/NotificationPermissionsPrompt$1;

    invoke-direct {v1, p0}, Lcom/android/browser/NotificationPermissionsPrompt$1;-><init>(Lcom/android/browser/NotificationPermissionsPrompt;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    iget-object v0, p0, Lcom/android/browser/NotificationPermissionsPrompt;->mAllowButton:Landroid/widget/Button;

    new-instance v1, Lcom/android/browser/NotificationPermissionsPrompt$2;

    invoke-direct {v1, p0}, Lcom/android/browser/NotificationPermissionsPrompt$2;-><init>(Lcom/android/browser/NotificationPermissionsPrompt;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    return-void
.end method

.method private setMessage(Ljava/lang/CharSequence;)V
    .locals 4
    .parameter "message"

    .prologue
    .line 62
    const-string v0, "NotificationPermissionsPrompt"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Inside NotificationPermissionsPrompt setMessage"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    iget-object v0, p0, Lcom/android/browser/NotificationPermissionsPrompt;->mTitle:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/browser/NotificationPermissionsPrompt;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c01ab

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    return-void
.end method


# virtual methods
.method public hide()V
    .locals 1

    .prologue
    .line 67
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/android/browser/NotificationPermissionsPrompt;->setVisibility(I)V

    .line 68
    return-void
.end method

.method protected onFinishInflate()V
    .locals 2

    .prologue
    .line 71
    const-string v0, "NotificationPermissionsPrompt"

    const-string v1, "Inside NotificationPermissionsPrompt onFinishInflate"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    .line 73
    invoke-direct {p0}, Lcom/android/browser/NotificationPermissionsPrompt;->init()V

    .line 74
    return-void
.end method

.method public show(Ljava/lang/String;Landroid/webkit/NotificationPermissions$Callback;)V
    .locals 3
    .parameter "origin"
    .parameter "callback"

    .prologue
    .line 77
    const-string v0, "NotificationPermissionsPrompt"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Inside NotificationPermissionsPrompt show, origin = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    iput-object p1, p0, Lcom/android/browser/NotificationPermissionsPrompt;->mOrigin:Ljava/lang/String;

    .line 79
    iput-object p2, p0, Lcom/android/browser/NotificationPermissionsPrompt;->mCallback:Landroid/webkit/NotificationPermissions$Callback;

    .line 80
    const-string v0, "http"

    iget-object v1, p0, Lcom/android/browser/NotificationPermissionsPrompt;->mOrigin:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/android/browser/NotificationPermissionsPrompt;->mOrigin:Ljava/lang/String;

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/browser/NotificationPermissionsPrompt;->setMessage(Ljava/lang/CharSequence;)V

    .line 86
    :goto_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/browser/NotificationPermissionsPrompt;->setVisibility(I)V

    .line 87
    return-void

    .line 83
    :cond_0
    iget-object v0, p0, Lcom/android/browser/NotificationPermissionsPrompt;->mOrigin:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/android/browser/NotificationPermissionsPrompt;->setMessage(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
