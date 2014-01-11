.class public Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;
.super Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtension;
.source "VTInCallScreenFlagsExtensionContainer.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "VTInCallScreenFlagsExtensionContainer"


# instance fields
.field private mSubExtensionList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtension;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtension;-><init>()V

    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 88
    const-string v0, "VTInCallScreenFlagsExtensionContainer"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    return-void
.end method


# virtual methods
.method public add(Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtension;)V
    .locals 2
    .parameter "extension"

    .prologue
    .line 54
    iget-object v0, p0, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v0, :cond_0

    .line 55
    const-string v0, "create sub extension list"

    invoke-static {v0}, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;->log(Ljava/lang/String;)V

    .line 56
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    .line 58
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

    invoke-static {v0}, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;->log(Ljava/lang/String;)V

    .line 59
    iget-object v0, p0, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 60
    return-void
.end method

.method public remove(Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtension;)V
    .locals 2
    .parameter "extension"

    .prologue
    .line 67
    iget-object v0, p0, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v0, :cond_0

    .line 68
    const-string v0, "remove extension, sub extension list is null, just return"

    invoke-static {v0}, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;->log(Ljava/lang/String;)V

    .line 73
    :goto_0
    return-void

    .line 71
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

    invoke-static {v0}, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;->log(Ljava/lang/String;)V

    .line 72
    iget-object v0, p0, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public reset()V
    .locals 2

    .prologue
    .line 76
    iget-object v1, p0, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v1, :cond_1

    .line 77
    const-string v1, "reset(), sub extension list is null, just return"

    invoke-static {v1}, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;->log(Ljava/lang/String;)V

    .line 85
    :cond_0
    return-void

    .line 80
    :cond_1
    const-string v1, "reset()"

    invoke-static {v1}, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;->log(Ljava/lang/String;)V

    .line 81
    iget-object v1, p0, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 82
    .local v0, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtension;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 83
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtension;

    invoke-virtual {v1}, Lcom/mediatek/phone/ext/VTInCallScreenFlagsExtension;->reset()V

    goto :goto_0
.end method
