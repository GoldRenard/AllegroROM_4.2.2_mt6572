.class public abstract Lcom/mediatek/calloption/InternetCallOptionHandler;
.super Lcom/mediatek/calloption/CallOptionBaseHandler;
.source "InternetCallOptionHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Landroid/content/DialogInterface$OnCancelListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "InternetCallOptionHandler"


# instance fields
.field private mRequest:Lcom/mediatek/calloption/Request;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/mediatek/calloption/CallOptionBaseHandler;-><init>()V

    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 146
    const-string v0, "InternetCallOptionHandler"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    return-void
.end method


# virtual methods
.method protected abstract doSipCallOptionHandle(Lcom/mediatek/calloption/Request;)V
.end method

.method public handleRequest(Lcom/mediatek/calloption/Request;)V
    .locals 6
    .parameter "request"

    .prologue
    const/4 v5, 0x0

    .line 57
    const-string v3, "handleRequest()"

    invoke-static {v3}, Lcom/mediatek/calloption/InternetCallOptionHandler;->log(Ljava/lang/String;)V

    .line 58
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    .line 59
    .local v2, uri:Landroid/net/Uri;
    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    .line 61
    .local v1, scheme:Ljava/lang/String;
    const-string v3, "sip"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "follow_sim_management"

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 63
    :cond_0
    iget-object v3, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v3, :cond_1

    .line 64
    iget-object v3, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    invoke-virtual {v3, p1}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    .line 110
    :cond_1
    :goto_0
    return-void

    .line 89
    :cond_2
    const-string v3, "data schema is sip and follow sim management extra is false"

    invoke-static {v3}, Lcom/mediatek/calloption/InternetCallOptionHandler;->log(Ljava/lang/String;)V

    .line 90
    iput-object p1, p0, Lcom/mediatek/calloption/InternetCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    .line 92
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "enable_internet_call_value"

    invoke-static {v3, v4, v5}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 94
    .local v0, enabled:I
    const/4 v3, 0x1

    if-ne v3, v0, :cond_4

    .line 96
    const-string v3, "internet call setting is enabled"

    invoke-static {v3}, Lcom/mediatek/calloption/InternetCallOptionHandler;->log(Ljava/lang/String;)V

    .line 97
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "com.android.phone.extra.ip"

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 98
    const-string v3, "extra ip dial is true, show toast"

    invoke-static {v3}, Lcom/mediatek/calloption/InternetCallOptionHandler;->log(Ljava/lang/String;)V

    .line 99
    invoke-virtual {p0, p1}, Lcom/mediatek/calloption/InternetCallOptionHandler;->showIPDialToast(Lcom/mediatek/calloption/Request;)V

    .line 105
    :goto_1
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getResultHandler()Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;

    move-result-object v3

    invoke-interface {v3}, Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;->onHandlingFinish()V

    goto :goto_0

    .line 102
    :cond_3
    const-string v3, "doSipCallOptionHandle()"

    invoke-static {v3}, Lcom/mediatek/calloption/InternetCallOptionHandler;->log(Ljava/lang/String;)V

    .line 103
    invoke-virtual {p0, p1}, Lcom/mediatek/calloption/InternetCallOptionHandler;->doSipCallOptionHandle(Lcom/mediatek/calloption/Request;)V

    goto :goto_1

    .line 107
    :cond_4
    const-string v3, "internet call setting not enabled, show sip disable dialog"

    invoke-static {v3}, Lcom/mediatek/calloption/InternetCallOptionHandler;->log(Ljava/lang/String;)V

    .line 108
    invoke-virtual {p0, p1, p0, p0, p0}, Lcom/mediatek/calloption/InternetCallOptionHandler;->showSipDisableDialog(Lcom/mediatek/calloption/Request;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V

    goto :goto_0
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "dialog"

    .prologue
    .line 141
    const-string v0, "onCancel()"

    invoke-static {v0}, Lcom/mediatek/calloption/InternetCallOptionHandler;->log(Ljava/lang/String;)V

    .line 142
    iget-object v0, p0, Lcom/mediatek/calloption/InternetCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v0}, Lcom/mediatek/calloption/Request;->getResultHandler()Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;

    move-result-object v0

    invoke-interface {v0}, Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;->onHandlingFinish()V

    .line 143
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 125
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onClick(), which = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/calloption/InternetCallOptionHandler;->log(Ljava/lang/String;)V

    .line 126
    const/4 v1, -0x1

    if-ne v1, p2, :cond_1

    .line 127
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 128
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "com.android.phone"

    const-string v2, "com.mediatek.settings.SipCallSetting"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 129
    const/high16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 130
    iget-object v1, p0, Lcom/mediatek/calloption/InternetCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;

    invoke-virtual {v1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 134
    .end local v0           #intent:Landroid/content/Intent;
    :cond_0
    :goto_0
    return-void

    .line 131
    :cond_1
    const/4 v1, -0x2

    if-ne v1, p2, :cond_0

    .line 132
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    goto :goto_0
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "dialog"

    .prologue
    .line 137
    const-string v0, "onDismiss()"

    invoke-static {v0}, Lcom/mediatek/calloption/InternetCallOptionHandler;->log(Ljava/lang/String;)V

    .line 138
    return-void
.end method

.method protected abstract showIPDialToast(Lcom/mediatek/calloption/Request;)V
.end method

.method protected showSipDisableDialog(Lcom/mediatek/calloption/Request;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface$OnCancelListener;)V
    .locals 0
    .parameter "request"
    .parameter "clickListener"
    .parameter "dismissListener"
    .parameter "cancelListener"

    .prologue
    .line 122
    return-void
.end method
