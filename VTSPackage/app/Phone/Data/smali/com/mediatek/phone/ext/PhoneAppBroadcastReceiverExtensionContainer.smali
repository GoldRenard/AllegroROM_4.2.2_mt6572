.class public Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtensionContainer;
.super Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtension;
.source "PhoneAppBroadcastReceiverExtensionContainer.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "PhoneAppBroadcastReceiverExtensionContainer"


# instance fields
.field private mSubExtensionList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtension;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtension;-><init>()V

    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 99
    const-string v0, "PhoneAppBroadcastReceiverExtensionContainer"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    return-void
.end method


# virtual methods
.method public add(Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtension;)V
    .locals 2
    .parameter "extension"

    .prologue
    .line 56
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v0, :cond_0

    .line 57
    const-string v0, "create sub extension list"

    invoke-static {v0}, Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtensionContainer;->log(Ljava/lang/String;)V

    .line 58
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    .line 60
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "add extension, extension is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtensionContainer;->log(Ljava/lang/String;)V

    .line 61
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 62
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)Z
    .locals 5
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v2, 0x0

    .line 78
    iget-object v3, p0, Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v3, :cond_1

    .line 79
    const-string v3, "onReceive(), sub extension list is null, just return"

    invoke-static {v3}, Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtensionContainer;->log(Ljava/lang/String;)V

    .line 91
    :cond_0
    :goto_0
    return v2

    .line 82
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onReceive(), context is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "intent is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtensionContainer;->log(Ljava/lang/String;)V

    .line 83
    iget-object v3, p0, Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 85
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtension;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 86
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtension;

    .line 87
    .local v0, extension:Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtension;
    invoke-virtual {v0, p1, p2}, Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtension;->onReceive(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 88
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public remove(Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtension;)V
    .locals 2
    .parameter "extension"

    .prologue
    .line 69
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v0, :cond_0

    .line 70
    const-string v0, "remove extension, sub extension list is null, just return"

    invoke-static {v0}, Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtensionContainer;->log(Ljava/lang/String;)V

    .line 75
    :goto_0
    return-void

    .line 73
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "remove extension, extension is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtensionContainer;->log(Ljava/lang/String;)V

    .line 74
    iget-object v0, p0, Lcom/mediatek/phone/ext/PhoneAppBroadcastReceiverExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method
