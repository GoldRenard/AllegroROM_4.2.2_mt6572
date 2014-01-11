.class public Lcom/mediatek/phone/ext/CallCardExtensionContainer;
.super Lcom/mediatek/phone/ext/CallCardExtension;
.source "CallCardExtensionContainer.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "CallCardExtensionContainer"


# instance fields
.field private mSubExtensionList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/mediatek/phone/ext/CallCardExtension;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/mediatek/phone/ext/CallCardExtension;-><init>()V

    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 136
    const-string v0, "CallCardExtensionContainer"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    return-void
.end method


# virtual methods
.method public add(Lcom/mediatek/phone/ext/CallCardExtension;)V
    .locals 2
    .parameter "extension"

    .prologue
    .line 57
    iget-object v0, p0, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v0, :cond_0

    .line 58
    const-string v0, "create sub extension list"

    invoke-static {v0}, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->log(Ljava/lang/String;)V

    .line 59
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    .line 61
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

    invoke-static {v0}, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->log(Ljava/lang/String;)V

    .line 62
    iget-object v0, p0, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 63
    return-void
.end method

.method public onFinishInflate(Landroid/view/View;)V
    .locals 3
    .parameter "callCard"

    .prologue
    .line 83
    iget-object v1, p0, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v1, :cond_1

    .line 84
    const-string v1, "onFinishInflate(), sub extension list is null, just return"

    invoke-static {v1}, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->log(Ljava/lang/String;)V

    .line 92
    :cond_0
    return-void

    .line 87
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onFinishInflate(), callCard is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->log(Ljava/lang/String;)V

    .line 88
    iget-object v1, p0, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 89
    .local v0, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/CallCardExtension;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 90
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/phone/ext/CallCardExtension;

    invoke-virtual {v1, p1}, Lcom/mediatek/phone/ext/CallCardExtension;->onFinishInflate(Landroid/view/View;)V

    goto :goto_0
.end method

.method public remove(Lcom/mediatek/phone/ext/CallCardExtension;)V
    .locals 2
    .parameter "extension"

    .prologue
    .line 70
    iget-object v0, p0, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v0, :cond_0

    .line 71
    const-string v0, "remove extension, sub extension list is null, just return"

    invoke-static {v0}, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->log(Ljava/lang/String;)V

    .line 76
    :goto_0
    return-void

    .line 74
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

    invoke-static {v0}, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->log(Ljava/lang/String;)V

    .line 75
    iget-object v0, p0, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public updateCallInfoLayout(Lcom/android/internal/telephony/PhoneConstants$State;)Z
    .locals 5
    .parameter "state"

    .prologue
    const/4 v2, 0x0

    .line 100
    iget-object v3, p0, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v3, :cond_1

    .line 101
    const-string v3, "updateCallInfoLayout(), sub extension list is null, just return"

    invoke-static {v3}, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->log(Ljava/lang/String;)V

    .line 112
    :cond_0
    :goto_0
    return v2

    .line 104
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateCallInfoLayout(), phone state is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->log(Ljava/lang/String;)V

    .line 105
    iget-object v3, p0, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 106
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/CallCardExtension;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 107
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/CallCardExtension;

    .line 108
    .local v0, extension:Lcom/mediatek/phone/ext/CallCardExtension;
    invoke-virtual {v0, p1}, Lcom/mediatek/phone/ext/CallCardExtension;->updateCallInfoLayout(Lcom/android/internal/telephony/PhoneConstants$State;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 109
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public updateState(Lcom/android/internal/telephony/CallManager;)V
    .locals 3
    .parameter "cm"

    .prologue
    .line 120
    iget-object v1, p0, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v1, :cond_1

    .line 121
    const-string v1, "updateState(), sub extension list is null, just return"

    invoke-static {v1}, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->log(Ljava/lang/String;)V

    .line 129
    :cond_0
    return-void

    .line 124
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateState(), call manager is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->log(Ljava/lang/String;)V

    .line 125
    iget-object v1, p0, Lcom/mediatek/phone/ext/CallCardExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 126
    .local v0, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/CallCardExtension;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 127
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/phone/ext/CallCardExtension;

    invoke-virtual {v1, p1}, Lcom/mediatek/phone/ext/CallCardExtension;->updateState(Lcom/android/internal/telephony/CallManager;)V

    goto :goto_0
.end method
