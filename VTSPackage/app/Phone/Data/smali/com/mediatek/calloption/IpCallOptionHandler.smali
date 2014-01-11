.class public abstract Lcom/mediatek/calloption/IpCallOptionHandler;
.super Lcom/mediatek/calloption/CallOptionBaseHandler;
.source "IpCallOptionHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "IpCallOptionHandler"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/mediatek/calloption/CallOptionBaseHandler;-><init>()V

    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 109
    const-string v0, "IpCallOptionHandler"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    return-void
.end method


# virtual methods
.method public handleRequest(Lcom/mediatek/calloption/Request;)V
    .locals 8
    .parameter "request"

    .prologue
    const/4 v7, -0x1

    .line 53
    const-string v5, "handleRequest()"

    invoke-static {v5}, Lcom/mediatek/calloption/IpCallOptionHandler;->log(Ljava/lang/String;)V

    .line 54
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "com.android.phone.extra.slot"

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 55
    .local v4, slot:I
    if-ne v7, v4, :cond_1

    .line 56
    const-string v5, "handleRequest(), slot is -1"

    invoke-static {v5}, Lcom/mediatek/calloption/IpCallOptionHandler;->log(Ljava/lang/String;)V

    .line 57
    iget-object v5, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v5, :cond_0

    .line 58
    iget-object v5, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    invoke-virtual {v5, p1}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    .line 93
    :cond_0
    :goto_0
    return-void

    .line 64
    :cond_1
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "com.android.phone.extra.ip"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-static {}, Lcom/mediatek/phone/SIMInfoWrapper;->getDefault()Lcom/mediatek/phone/SIMInfoWrapper;

    move-result-object v5

    invoke-virtual {v5}, Lcom/mediatek/phone/SIMInfoWrapper;->getInsertedSimCount()I

    move-result v5

    if-lez v5, :cond_4

    .line 66
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->isMultipleSim()Z

    move-result v6

    invoke-static {v5, v4, v6}, Lcom/mediatek/calloption/CallOptionUtils;->queryIPPrefix(Landroid/content/Context;IZ)Ljava/lang/String;

    move-result-object v1

    .line 68
    .local v1, ipPrefix:Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 69
    invoke-virtual {p0, p1}, Lcom/mediatek/calloption/IpCallOptionHandler;->showToast(Lcom/mediatek/calloption/Request;)V

    .line 70
    new-instance v0, Landroid/content/Intent;

    const-string v5, "android.intent.action.MAIN"

    invoke-direct {v0, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 71
    .local v0, intent:Landroid/content/Intent;
    const-string v5, "com.android.phone"

    const-string v6, "com.mediatek.settings.IpPrefixPreference"

    invoke-virtual {v0, v5, v6}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 72
    const/high16 v5, 0x400

    invoke-virtual {v0, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 73
    invoke-static {}, Lcom/mediatek/phone/SIMInfoWrapper;->getDefault()Lcom/mediatek/phone/SIMInfoWrapper;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/mediatek/phone/SIMInfoWrapper;->getSimInfoBySlot(I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v3

    .line 74
    .local v3, simInfo:Landroid/provider/Telephony$SIMInfo;
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->isMultipleSim()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 75
    const-string v5, "simId"

    invoke-virtual {v0, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 77
    :cond_2
    const-string v5, "sub_title_name"

    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v6

    iget v7, v3, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-static {v6, v7}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v6

    iget-object v6, v6, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v0, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 79
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 80
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getResultHandler()Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;

    move-result-object v5

    invoke-interface {v5}, Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;->onHandlingFinish()V

    goto :goto_0

    .line 83
    .end local v0           #intent:Landroid/content/Intent;
    .end local v3           #simInfo:Landroid/provider/Telephony$SIMInfo;
    :cond_3
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/calloption/CallOptionUtils;->getInitialNumber(Landroid/content/Context;Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v2

    .line 85
    .local v2, number:Ljava/lang/String;
    invoke-virtual {v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-eqz v5, :cond_4

    .line 86
    invoke-virtual {p1}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "android.phone.extra.ACTUAL_NUMBER_TO_DIAL"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 90
    .end local v1           #ipPrefix:Ljava/lang/String;
    .end local v2           #number:Ljava/lang/String;
    :cond_4
    iget-object v5, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v5, :cond_0

    .line 91
    iget-object v5, p0, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    invoke-virtual {v5, p1}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    goto/16 :goto_0
.end method

.method protected abstract showToast(Lcom/mediatek/calloption/Request;)V
.end method
