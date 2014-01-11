.class public Lcom/mediatek/calloption/FirstCallOptionHandler;
.super Lcom/mediatek/calloption/CallOptionBaseHandler;
.source "FirstCallOptionHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "FirstCallOptionHandler"


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
    .line 78
    const-string v0, "FirstCallOptionHandler"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    return-void
.end method


# virtual methods
.method public handleRequest(Lcom/mediatek/calloption/Request;)V
    .locals 9
    .parameter "request"

    .prologue
    .line 53
    const-string v5, "handleRequest()"

    invoke-static {v5}, Lcom/mediatek/calloption/FirstCallOptionHandler;->log(Ljava/lang/String;)V

    .line 60
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v3

    .line 61
    .local v3, intent:Landroid/content/Intent;
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 62
    .local v0, ctx:Landroid/content/Context;
    const-string v5, "voicemail:"

    invoke-virtual {v3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 63
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "voice_call_sim_setting"

    const-wide/16 v7, -0x5

    invoke-static {v5, v6, v7, v8}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v1

    .line 65
    .local v1, defaultSim:J
    invoke-static {}, Lcom/mediatek/phone/SIMInfoWrapper;->getDefault()Lcom/mediatek/phone/SIMInfoWrapper;

    move-result-object v4

    .line 67
    .local v4, simInfoWrapper:Lcom/mediatek/phone/SIMInfoWrapper;
    const-wide/16 v5, 0x0

    cmp-long v5, v1, v5

    if-lez v5, :cond_0

    long-to-int v5, v1

    invoke-virtual {v4, v5}, Lcom/mediatek/phone/SIMInfoWrapper;->getSlotIdBySimId(I)I

    move-result v5

    if-ltz v5, :cond_0

    .line 68
    const-string v5, "simId"

    long-to-int v6, v1

    invoke-virtual {v4, v6}, Lcom/mediatek/phone/SIMInfoWrapper;->getSlotIdBySimId(I)I

    move-result v6

    invoke-virtual {v3, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 72
    .end local v1           #defaultSim:J
    .end local v4           #simInfoWrapper:Lcom/mediatek/phone/SIMInfoWrapper;
    :cond_0
    iget-object v5, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v5, :cond_1

    .line 73
    iget-object v5, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    invoke-virtual {v5, p1}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    .line 75
    :cond_1
    return-void
.end method
