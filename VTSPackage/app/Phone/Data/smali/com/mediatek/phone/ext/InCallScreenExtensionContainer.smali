.class public Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;
.super Lcom/mediatek/phone/ext/InCallScreenExtension;
.source "InCallScreenExtensionContainer.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "InCallScreenExtensionContainer"


# instance fields
.field private mSubExtensionList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/mediatek/phone/ext/InCallScreenExtension;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/mediatek/phone/ext/InCallScreenExtension;-><init>()V

    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 271
    const-string v0, "InCallScreenExtensionContainer"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    return-void
.end method


# virtual methods
.method public add(Lcom/mediatek/phone/ext/InCallScreenExtension;)V
    .locals 2
    .parameter "extension"

    .prologue
    .line 61
    iget-object v0, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v0, :cond_0

    .line 62
    const-string v0, "create sub extension list"

    invoke-static {v0}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 63
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    .line 65
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

    invoke-static {v0}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 66
    iget-object v0, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 67
    return-void
.end method

.method public dismissDialogs()Z
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 251
    iget-object v3, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v3, :cond_1

    .line 252
    const-string v3, "dismissDialogs(), sub extension list is null, just return"

    invoke-static {v3}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 263
    :cond_0
    :goto_0
    return v2

    .line 255
    :cond_1
    const-string v3, "dismissDialogs()"

    invoke-static {v3}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 256
    iget-object v3, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 257
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/InCallScreenExtension;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 258
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/InCallScreenExtension;

    .line 259
    .local v0, extension:Lcom/mediatek/phone/ext/InCallScreenExtension;
    invoke-virtual {v0}, Lcom/mediatek/phone/ext/InCallScreenExtension;->dismissDialogs()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 260
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public handleOnScreenMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 5
    .parameter "menuItem"

    .prologue
    const/4 v2, 0x0

    .line 109
    iget-object v3, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v3, :cond_1

    .line 110
    const-string v3, "handleOnScreenMenuItemClick(), sub extension list is null, just return"

    invoke-static {v3}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 121
    :cond_0
    :goto_0
    return v2

    .line 113
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleOnScreenMenuItemClick(), menuItem is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 114
    iget-object v3, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 115
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/InCallScreenExtension;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 116
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/InCallScreenExtension;

    .line 117
    .local v0, extension:Lcom/mediatek/phone/ext/InCallScreenExtension;
    invoke-virtual {v0, p1}, Lcom/mediatek/phone/ext/InCallScreenExtension;->handleOnScreenMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 118
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public handleOnscreenButtonClick(I)Z
    .locals 5
    .parameter "id"

    .prologue
    const/4 v2, 0x0

    .line 231
    iget-object v3, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v3, :cond_1

    .line 232
    const-string v3, "handleOnscreenButtonClick(), sub extension list is null, just return"

    invoke-static {v3}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 243
    :cond_0
    :goto_0
    return v2

    .line 235
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleOnscreenButtonClick(), id = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 236
    iget-object v3, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 237
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/InCallScreenExtension;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 238
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/InCallScreenExtension;

    .line 239
    .local v0, extension:Lcom/mediatek/phone/ext/InCallScreenExtension;
    invoke-virtual {v0, p1}, Lcom/mediatek/phone/ext/InCallScreenExtension;->handleOnscreenButtonClick(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 240
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;Landroid/app/Activity;Lcom/mediatek/phone/ext/IInCallScreen;Lcom/android/internal/telephony/CallManager;)V
    .locals 3
    .parameter "icicle"
    .parameter "inCallScreenActivity"
    .parameter "inCallScreenHost"
    .parameter "cm"

    .prologue
    .line 155
    iget-object v1, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v1, :cond_1

    .line 156
    const-string v1, "onCreate(), sub extension list is null, just return"

    invoke-static {v1}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 165
    :cond_0
    return-void

    .line 159
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCreate(), icicle is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " incallscreen activity is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " incallscreen host is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " call manager is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 161
    iget-object v1, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 162
    .local v0, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/InCallScreenExtension;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 163
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/phone/ext/InCallScreenExtension;

    invoke-virtual {v1, p1, p2, p3, p4}, Lcom/mediatek/phone/ext/InCallScreenExtension;->onCreate(Landroid/os/Bundle;Landroid/app/Activity;Lcom/mediatek/phone/ext/IInCallScreen;Lcom/android/internal/telephony/CallManager;)V

    goto :goto_0
.end method

.method public onDestroy(Landroid/app/Activity;)V
    .locals 3
    .parameter "inCallScreen"

    .prologue
    .line 172
    iget-object v1, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v1, :cond_1

    .line 173
    const-string v1, "onDestroy(), sub extension list is null, just return"

    invoke-static {v1}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 181
    :cond_0
    return-void

    .line 176
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDestroy(), incallscreen activity is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 177
    iget-object v1, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 178
    .local v0, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/InCallScreenExtension;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 179
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/phone/ext/InCallScreenExtension;

    invoke-virtual {v1, p1}, Lcom/mediatek/phone/ext/InCallScreenExtension;->onDestroy(Landroid/app/Activity;)V

    goto :goto_0
.end method

.method public onDisconnect(Lcom/android/internal/telephony/Connection;)Z
    .locals 5
    .parameter "cn"

    .prologue
    const/4 v2, 0x0

    .line 189
    iget-object v3, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v3, :cond_1

    .line 190
    const-string v3, "onDisconnect(), sub extension list is null, just return"

    invoke-static {v3}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 201
    :cond_0
    :goto_0
    return v2

    .line 193
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onDisconnect(), connection is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 194
    iget-object v3, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 195
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/InCallScreenExtension;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 196
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/InCallScreenExtension;

    .line 197
    .local v0, extension:Lcom/mediatek/phone/ext/InCallScreenExtension;
    invoke-virtual {v0, p1}, Lcom/mediatek/phone/ext/InCallScreenExtension;->onDisconnect(Lcom/android/internal/telephony/Connection;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 198
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public onPhoneStateChanged(Lcom/android/internal/telephony/CallManager;)Z
    .locals 5
    .parameter "cm"

    .prologue
    const/4 v2, 0x0

    .line 210
    iget-object v3, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v3, :cond_1

    .line 211
    const-string v3, "onPhoneStateChanged(), sub extension list is null, just return"

    invoke-static {v3}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 222
    :cond_0
    :goto_0
    return v2

    .line 214
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onPhoneStateChanged(), call manager is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 215
    iget-object v3, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 216
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/InCallScreenExtension;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 217
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/InCallScreenExtension;

    .line 218
    .local v0, extension:Lcom/mediatek/phone/ext/InCallScreenExtension;
    invoke-virtual {v0, p1}, Lcom/mediatek/phone/ext/InCallScreenExtension;->onPhoneStateChanged(Lcom/android/internal/telephony/CallManager;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 219
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public remove(Lcom/mediatek/phone/ext/InCallScreenExtension;)V
    .locals 2
    .parameter "extension"

    .prologue
    .line 74
    iget-object v0, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v0, :cond_0

    .line 75
    const-string v0, "remove extension, sub extension list is null, just return"

    invoke-static {v0}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 80
    :goto_0
    return-void

    .line 78
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

    invoke-static {v0}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 79
    iget-object v0, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public setupMenuItems(Landroid/view/Menu;Lcom/mediatek/phone/ext/IInCallControlState;)V
    .locals 3
    .parameter "menu"
    .parameter "inCallControlState"

    .prologue
    .line 92
    iget-object v1, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v1, :cond_1

    .line 93
    const-string v1, "setupMenuItems(), sub extension list is null, just return"

    invoke-static {v1}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 101
    :cond_0
    return-void

    .line 96
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setupMenuItems(), menu is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", incallcontrolstate is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 97
    iget-object v1, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 98
    .local v0, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/InCallScreenExtension;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 99
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/phone/ext/InCallScreenExtension;

    invoke-virtual {v1, p1, p2}, Lcom/mediatek/phone/ext/InCallScreenExtension;->setupMenuItems(Landroid/view/Menu;Lcom/mediatek/phone/ext/IInCallControlState;)V

    goto :goto_0
.end method

.method public updateScreen(Lcom/android/internal/telephony/CallManager;Z)Z
    .locals 5
    .parameter "callManager"
    .parameter "isForegroundActivity"

    .prologue
    const/4 v2, 0x0

    .line 131
    iget-object v3, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    if-nez v3, :cond_1

    .line 132
    const-string v3, "updateScreen(), sub extension list is null, just return"

    invoke-static {v3}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 143
    :cond_0
    :goto_0
    return v2

    .line 135
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateScreen(), call manage is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " isForeground is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->log(Ljava/lang/String;)V

    .line 136
    iget-object v3, p0, Lcom/mediatek/phone/ext/InCallScreenExtensionContainer;->mSubExtensionList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 137
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/mediatek/phone/ext/InCallScreenExtension;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 138
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/ext/InCallScreenExtension;

    .line 139
    .local v0, extension:Lcom/mediatek/phone/ext/InCallScreenExtension;
    invoke-virtual {v0, p1, p2}, Lcom/mediatek/phone/ext/InCallScreenExtension;->updateScreen(Lcom/android/internal/telephony/CallManager;Z)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 140
    const/4 v2, 0x1

    goto :goto_0
.end method
