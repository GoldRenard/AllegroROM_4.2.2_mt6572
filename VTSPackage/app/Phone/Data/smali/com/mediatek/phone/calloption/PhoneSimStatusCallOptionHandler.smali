.class public Lcom/mediatek/phone/calloption/PhoneSimStatusCallOptionHandler;
.super Lcom/mediatek/calloption/SimStatusCallOptionHandler;
.source "PhoneSimStatusCallOptionHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PhoneSimStatusCallOptionHandler"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;-><init>()V

    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 78
    const-string v0, "PhoneSimStatusCallOptionHandler"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    return-void
.end method


# virtual methods
.method protected dismissProgressIndication()V
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    .line 72
    iget-object v0, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mDialog:Landroid/app/Dialog;

    .line 75
    :cond_0
    return-void
.end method

.method protected showProgressIndication(Lcom/mediatek/calloption/Request;)V
    .locals 3
    .parameter "request"

    .prologue
    .line 54
    const-string v0, "showProgressIndication(searching network message )"

    invoke-static {v0}, Lcom/mediatek/phone/calloption/PhoneSimStatusCallOptionHandler;->log(Ljava/lang/String;)V

    .line 56
    invoke-virtual {p0}, Lcom/mediatek/phone/calloption/PhoneSimStatusCallOptionHandler;->dismissProgressIndication()V

    .line 58
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mDialog:Landroid/app/Dialog;

    .line 59
    iget-object v0, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mDialog:Landroid/app/Dialog;

    check-cast v0, Landroid/app/ProgressDialog;

    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d01fc

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 61
    iget-object v0, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mDialog:Landroid/app/Dialog;

    check-cast v0, Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 62
    iget-object v0, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mDialog:Landroid/app/Dialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 63
    iget-object v0, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 64
    iget-object v0, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 65
    return-void
.end method
