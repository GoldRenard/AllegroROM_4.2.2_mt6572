.class public Lcom/mediatek/phone/calloption/PhoneIpCallOptionHandler;
.super Lcom/mediatek/calloption/IpCallOptionHandler;
.source "PhoneIpCallOptionHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PhoneIpCallOptionHandler"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/mediatek/calloption/IpCallOptionHandler;-><init>()V

    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 55
    const-string v0, "PhoneIpCallOptionHandler"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    return-void
.end method


# virtual methods
.method protected showToast(Lcom/mediatek/calloption/Request;)V
    .locals 3
    .parameter "request"

    .prologue
    .line 50
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0d0096

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 52
    return-void
.end method
