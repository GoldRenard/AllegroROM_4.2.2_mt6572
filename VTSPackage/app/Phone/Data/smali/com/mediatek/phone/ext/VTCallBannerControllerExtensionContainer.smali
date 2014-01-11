.class public Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;
.super Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;
.source "VTCallBannerControllerExtensionContainer.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "VTCallBannerControllerExtension"


# instance fields
.field private mSubExtensionList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;-><init>()V

    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 163
    const-string v0, "VTCallBannerControllerExtension"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    return-void
.end method


# virtual methods
.method public add(Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;)V
    .locals 2
    .parameter "extension"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v0, :cond_0

    .line 61
    const-string v0, "create sub extension list"

    invoke-static {v0}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->log(Ljava/lang/String;)V

    .line 62
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    .line 64
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

    invoke-static {v0}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->log(Ljava/lang/String;)V

    .line 65
    iget-object v0, p0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 66
    return-void
.end method

.method public initialize(Landroid/content/Context;Landroid/view/ViewGroup;)V
    .locals 3
    .parameter "context"
    .parameter "vtCallBanner"

    .prologue
    .line 87
    iget-object v1, p0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v1, :cond_1

    .line 88
    const-string v1, "initialize(), sub extension list is null, just return"

    invoke-static {v1}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->log(Ljava/lang/String;)V

    .line 96
    :cond_0
    return-void

    .line 91
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initialize(), context is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " vtCallBanner is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->log(Ljava/lang/String;)V

    .line 92
    iget-object v1, p0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 93
    .local v0, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 94
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;

    invoke-virtual {v1, p1, p2}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;->initialize(Landroid/content/Context;Landroid/view/ViewGroup;)V

    goto :goto_0
.end method

.method public remove(Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;)V
    .locals 2
    .parameter "extension"

    .prologue
    .line 73
    iget-object v0, p0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v0, :cond_0

    .line 74
    const-string v0, "remove extension, sub extension list is null, just return"

    invoke-static {v0}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->log(Ljava/lang/String;)V

    .line 79
    :goto_0
    return-void

    .line 77
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

    invoke-static {v0}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->log(Ljava/lang/String;)V

    .line 78
    iget-object v0, p0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public updateCallStateWidgets(Lcom/android/internal/telephony/Call;)Z
    .locals 5
    .parameter "call"

    .prologue
    const/4 v2, 0x0

    .line 104
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v3, :cond_1

    .line 105
    const-string v3, "updateCallStateWidgets(), sub extension list is null, just return"

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->log(Ljava/lang/String;)V

    .line 116
    :cond_0
    :goto_0
    return v2

    .line 108
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateCallStateWidgets(), call is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->log(Ljava/lang/String;)V

    .line 109
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 110
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 111
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;

    .line 112
    .local v0, extension:Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;
    invoke-virtual {v0, p1}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;->updateCallStateWidgets(Lcom/android/internal/telephony/Call;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 113
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;)V
    .locals 7
    .parameter "info"
    .parameter "presentation"
    .parameter "isTemporary"
    .parameter "call"
    .parameter "conn"

    .prologue
    .line 150
    iget-object v0, p0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v0, :cond_1

    .line 151
    const-string v0, "updateDisplayForPerson(), sub extension list is null, just return"

    invoke-static {v0}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->log(Ljava/lang/String;)V

    .line 160
    :cond_0
    return-void

    .line 154
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateDisplayForPerson(), info is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", presentation is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", isTemporary is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", call is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", connection is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->log(Ljava/lang/String;)V

    .line 156
    iget-object v0, p0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 157
    .local v6, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;>;"
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 158
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;->updateDisplayForPerson(Lcom/android/internal/telephony/CallerInfo;IZLcom/android/internal/telephony/Call;Lcom/android/internal/telephony/Connection;)V

    goto :goto_0
.end method

.method public updateState(Lcom/android/internal/telephony/Call;)Z
    .locals 5
    .parameter "call"

    .prologue
    const/4 v2, 0x0

    .line 125
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v3, :cond_1

    .line 126
    const-string v3, "updateState(), sub extension list is null, just return"

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->log(Ljava/lang/String;)V

    .line 137
    :cond_0
    :goto_0
    return v2

    .line 129
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateState(), call is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->log(Ljava/lang/String;)V

    .line 130
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 131
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 132
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;

    .line 133
    .local v0, extension:Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;
    invoke-virtual {v0, p1}, Lcom/mediatek/phone/ext/VTCallBannerControllerExtension;->updateState(Lcom/android/internal/telephony/Call;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 134
    const/4 v2, 0x1

    goto :goto_0
.end method
