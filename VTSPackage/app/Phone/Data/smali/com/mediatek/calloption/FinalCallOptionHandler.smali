.class public Lcom/mediatek/calloption/FinalCallOptionHandler;
.super Lcom/mediatek/calloption/CallOptionBaseHandler;
.source "FinalCallOptionHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "FinalCallOptionHandler"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/mediatek/calloption/CallOptionBaseHandler;-><init>()V

    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 51
    const-string v0, "FinalCallOptionHandler"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    return-void
.end method


# virtual methods
.method public handleRequest(Lcom/mediatek/calloption/Request;)V
    .locals 2
    .parameter "request"

    .prologue
    .line 46
    const-string v0, "handleRequest()"

    invoke-static {v0}, Lcom/mediatek/calloption/FinalCallOptionHandler;->log(Ljava/lang/String;)V

    .line 47
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getResultHandler()Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;->onContinueCallProcess(Landroid/content/Intent;)V

    .line 48
    return-void
.end method
