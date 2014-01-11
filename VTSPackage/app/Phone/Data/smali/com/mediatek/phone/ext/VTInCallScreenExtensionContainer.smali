.class public Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;
.super Lcom/mediatek/phone/ext/VTInCallScreenExtension;
.source "VTInCallScreenExtensionContainer.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "VTInCallScreenExtensionContainer"


# instance fields
.field private mSubExtensionList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/mediatek/phone/ext/VTInCallScreenExtension;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;-><init>()V

    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 239
    const-string v0, "VTInCallScreenExtensionContainer"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    return-void
.end method


# virtual methods
.method public add(Lcom/mediatek/phone/ext/VTInCallScreenExtension;)V
    .locals 2
    .parameter "extension"

    .prologue
    .line 62
    iget-object v0, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v0, :cond_0

    .line 63
    const-string v0, "create sub extension list"

    invoke-static {v0}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 64
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    .line 66
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

    invoke-static {v0}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 67
    iget-object v0, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 68
    return-void
.end method

.method public initDialingSuccessVTState()Z
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 159
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v3, :cond_1

    .line 160
    const-string v3, "initDialingSuccessVTState(), sub extension list is null, just return"

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 171
    :cond_0
    :goto_0
    return v2

    .line 163
    :cond_1
    const-string v3, "initDialingSuccessVTState()"

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 164
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 165
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/VTInCallScreenExtension;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 166
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    .line 167
    .local v0, extension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;
    invoke-virtual {v0}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;->initDialingSuccessVTState()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 168
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public initVTInCallScreen(Landroid/view/ViewGroup;Landroid/view/View$OnTouchListener;Landroid/app/Activity;)Z
    .locals 5
    .parameter "vtInCallScreen"
    .parameter "touchListener"
    .parameter "inCallScreen"

    .prologue
    const/4 v2, 0x0

    .line 96
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v3, :cond_1

    .line 97
    const-string v3, "initVTInCallScreen(), sub extension list is null, just return"

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 109
    :cond_0
    :goto_0
    return v2

    .line 100
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "initVTInCallScreen(), vtInCallScreen is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", touchListener is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", inCallScreen is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 102
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 103
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/VTInCallScreenExtension;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 104
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    .line 105
    .local v0, extension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;
    invoke-virtual {v0, p1, p2, p3}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;->initVTInCallScreen(Landroid/view/ViewGroup;Landroid/view/View$OnTouchListener;Landroid/app/Activity;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 106
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public internalAnswerVTCallPre()Z
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 139
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v3, :cond_1

    .line 140
    const-string v3, "internalAnswerVTCallPre(), sub extension list is null, just return"

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 151
    :cond_0
    :goto_0
    return v2

    .line 143
    :cond_1
    const-string v3, "internalAnswerVTCallPre()"

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 144
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 145
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/VTInCallScreenExtension;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 146
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    .line 147
    .local v0, extension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;
    invoke-virtual {v0}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;->internalAnswerVTCallPre()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 148
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 5
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v2, 0x0

    .line 181
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v3, :cond_1

    .line 182
    const-string v3, "onKeyDown(), sub extension list is null, just return"

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 193
    :cond_0
    :goto_0
    return v2

    .line 185
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onKeyDown(), keyCode is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", event is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 186
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 187
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/VTInCallScreenExtension;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 188
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    .line 189
    .local v0, extension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;
    invoke-virtual {v0, p1, p2}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 190
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 5
    .parameter "menu"

    .prologue
    const/4 v2, 0x0

    .line 202
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v3, :cond_1

    .line 203
    const-string v3, "onPrepareOptionMenu(), sub extension list is null, just return"

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 214
    :cond_0
    :goto_0
    return v2

    .line 206
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onPrepareOptionMenu(), menu is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 207
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 208
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/VTInCallScreenExtension;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 209
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    .line 210
    .local v0, extension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;
    invoke-virtual {v0, p1}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 211
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public onReceiveVTManagerStartCounter(Lcom/android/internal/telephony/CallManager;)Z
    .locals 5
    .parameter "cm"

    .prologue
    const/4 v2, 0x0

    .line 223
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v3, :cond_1

    .line 224
    const-string v3, "onReceiveVTManagerStartCounter(), sub extension list is null, just return"

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 235
    :cond_0
    :goto_0
    return v2

    .line 227
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onReceiveVTManagerStartCounter(), call manager is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 228
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 229
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/VTInCallScreenExtension;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 230
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    .line 231
    .local v0, extension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;
    invoke-virtual {v0, p1}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;->onReceiveVTManagerStartCounter(Lcom/android/internal/telephony/CallManager;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 232
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5
    .parameter "v"
    .parameter "event"

    .prologue
    const/4 v2, 0x0

    .line 119
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v3, :cond_1

    .line 120
    const-string v3, "onTouch(), sub extension list is null, just return"

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 131
    :cond_0
    :goto_0
    return v2

    .line 123
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onTouch(), view is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", event is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 124
    iget-object v3, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 125
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/VTInCallScreenExtension;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 126
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    .line 127
    .local v0, extension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;
    invoke-virtual {v0, p1, p2}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 128
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public remove(Lcom/mediatek/phone/ext/VTInCallScreenExtension;)V
    .locals 2
    .parameter "extension"

    .prologue
    .line 75
    iget-object v0, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v0, :cond_0

    .line 76
    const-string v0, "remove extension, sub extension list is null, just return"

    invoke-static {v0}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 81
    :goto_0
    return-void

    .line 79
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

    invoke-static {v0}, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 80
    iget-object v0, p0, Lcom/mediatek/phone/ext/VTInCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method
