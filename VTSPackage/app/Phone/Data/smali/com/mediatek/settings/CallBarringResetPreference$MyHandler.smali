.class Lcom/mediatek/settings/CallBarringResetPreference$MyHandler;
.super Landroid/os/Handler;
.source "CallBarringResetPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/CallBarringResetPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyHandler"
.end annotation


# static fields
.field private static final MESSAGE_SET_CALLBARRING_STATE:I = 0x1


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/CallBarringResetPreference;


# direct methods
.method private constructor <init>(Lcom/mediatek/settings/CallBarringResetPreference;)V
    .locals 0
    .parameter

    .prologue
    .line 195
    iput-object p1, p0, Lcom/mediatek/settings/CallBarringResetPreference$MyHandler;->this$0:Lcom/mediatek/settings/CallBarringResetPreference;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/settings/CallBarringResetPreference;Lcom/mediatek/settings/CallBarringResetPreference$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 195
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CallBarringResetPreference$MyHandler;-><init>(Lcom/mediatek/settings/CallBarringResetPreference;)V

    return-void
.end method

.method private handleSetCallBarringResponse(Landroid/os/Message;)V
    .locals 9
    .parameter "msg"

    .prologue
    const/4 v8, 0x0

    .line 212
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 213
    .local v0, ar:Landroid/os/AsyncResult;
    iget-object v6, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v6, :cond_3

    .line 215
    const-string v6, "CallBarringResetPreference"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "handleSetCallBarringResponse: ar.exception="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    iget-object v2, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    check-cast v2, Lcom/android/internal/telephony/CommandException;

    .line 220
    .local v2, ce:Lcom/android/internal/telephony/CommandException;
    invoke-virtual {v2}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v6

    sget-object v7, Lcom/android/internal/telephony/CommandException$Error;->PASSWORD_INCORRECT:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v6, v7, :cond_1

    .line 221
    const/16 v3, 0x2bc

    .line 227
    .local v3, errorid:I
    :goto_0
    iget-object v6, p0, Lcom/mediatek/settings/CallBarringResetPreference$MyHandler;->this$0:Lcom/mediatek/settings/CallBarringResetPreference;

    #getter for: Lcom/mediatek/settings/CallBarringResetPreference;->mCallBarringInterface:Lcom/mediatek/settings/CallBarringInterface;
    invoke-static {v6}, Lcom/mediatek/settings/CallBarringResetPreference;->access$300(Lcom/mediatek/settings/CallBarringResetPreference;)Lcom/mediatek/settings/CallBarringInterface;

    move-result-object v6

    invoke-interface {v6, v3}, Lcom/mediatek/settings/CallBarringInterface;->setErrorState(I)V

    .line 228
    iget-object v6, p0, Lcom/mediatek/settings/CallBarringResetPreference$MyHandler;->this$0:Lcom/mediatek/settings/CallBarringResetPreference;

    #getter for: Lcom/mediatek/settings/CallBarringResetPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    invoke-static {v6}, Lcom/mediatek/settings/CallBarringResetPreference;->access$400(Lcom/mediatek/settings/CallBarringResetPreference;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    move-result-object v6

    iget-object v7, p0, Lcom/mediatek/settings/CallBarringResetPreference$MyHandler;->this$0:Lcom/mediatek/settings/CallBarringResetPreference;

    invoke-interface {v6, v7, v3}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onError(Landroid/preference/Preference;I)V

    .line 248
    .end local v2           #ce:Lcom/android/internal/telephony/CommandException;
    .end local v3           #errorid:I
    :cond_0
    :goto_1
    return-void

    .line 222
    .restart local v2       #ce:Lcom/android/internal/telephony/CommandException;
    :cond_1
    invoke-virtual {v2}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v6

    sget-object v7, Lcom/android/internal/telephony/CommandException$Error;->FDN_CHECK_FAILURE:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v6, v7, :cond_2

    .line 223
    const/16 v3, 0x320

    .restart local v3       #errorid:I
    goto :goto_0

    .line 225
    .end local v3           #errorid:I
    :cond_2
    const/16 v3, 0x12c

    .restart local v3       #errorid:I
    goto :goto_0

    .line 231
    .end local v2           #ce:Lcom/android/internal/telephony/CommandException;
    .end local v3           #errorid:I
    :cond_3
    const-string v6, "CallBarringResetPreference"

    const-string v7, "handleSetCallBarringResponse is called without exception"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    iget-object v6, p0, Lcom/mediatek/settings/CallBarringResetPreference$MyHandler;->this$0:Lcom/mediatek/settings/CallBarringResetPreference;

    #getter for: Lcom/mediatek/settings/CallBarringResetPreference;->mCallBarringInterface:Lcom/mediatek/settings/CallBarringInterface;
    invoke-static {v6}, Lcom/mediatek/settings/CallBarringResetPreference;->access$300(Lcom/mediatek/settings/CallBarringResetPreference;)Lcom/mediatek/settings/CallBarringInterface;

    move-result-object v6

    instance-of v6, v6, Lcom/mediatek/settings/CallBarring;

    if-eqz v6, :cond_4

    .line 235
    iget-object v6, p0, Lcom/mediatek/settings/CallBarringResetPreference$MyHandler;->this$0:Lcom/mediatek/settings/CallBarringResetPreference;

    #getter for: Lcom/mediatek/settings/CallBarringResetPreference;->mCallBarringInterface:Lcom/mediatek/settings/CallBarringInterface;
    invoke-static {v6}, Lcom/mediatek/settings/CallBarringResetPreference;->access$300(Lcom/mediatek/settings/CallBarringResetPreference;)Lcom/mediatek/settings/CallBarringInterface;

    move-result-object v1

    check-cast v1, Lcom/mediatek/settings/CallBarring;

    .line 236
    .local v1, cb:Lcom/mediatek/settings/CallBarring;
    invoke-virtual {v1}, Lcom/mediatek/settings/CallBarring;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v5

    .line 237
    .local v5, prefSet:Landroid/preference/PreferenceScreen;
    const-string v6, "all_outing_key"

    invoke-virtual {v5, v6}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/mediatek/settings/CallBarringBasePreference;

    .line 240
    .local v4, mCallAllOutButton:Lcom/mediatek/settings/CallBarringBasePreference;
    if-eqz v4, :cond_0

    .line 241
    invoke-virtual {v1, v8}, Lcom/mediatek/settings/CallBarring;->resetIndex(I)V

    .line 242
    iget-object v6, p0, Lcom/mediatek/settings/CallBarringResetPreference$MyHandler;->this$0:Lcom/mediatek/settings/CallBarringResetPreference;

    #getter for: Lcom/mediatek/settings/CallBarringResetPreference;->mSimId:I
    invoke-static {v6}, Lcom/mediatek/settings/CallBarringResetPreference;->access$500(Lcom/mediatek/settings/CallBarringResetPreference;)I

    move-result v6

    invoke-virtual {v4, v1, v8, v6}, Lcom/mediatek/settings/CallBarringBasePreference;->init(Lcom/mediatek/phone/TimeConsumingPreferenceListener;ZI)V

    goto :goto_1

    .line 245
    .end local v1           #cb:Lcom/mediatek/settings/CallBarring;
    .end local v4           #mCallAllOutButton:Lcom/mediatek/settings/CallBarringBasePreference;
    .end local v5           #prefSet:Landroid/preference/PreferenceScreen;
    :cond_4
    iget-object v6, p0, Lcom/mediatek/settings/CallBarringResetPreference$MyHandler;->this$0:Lcom/mediatek/settings/CallBarringResetPreference;

    #getter for: Lcom/mediatek/settings/CallBarringResetPreference;->mCallBarringInterface:Lcom/mediatek/settings/CallBarringInterface;
    invoke-static {v6}, Lcom/mediatek/settings/CallBarringResetPreference;->access$300(Lcom/mediatek/settings/CallBarringResetPreference;)Lcom/mediatek/settings/CallBarringInterface;

    move-result-object v6

    invoke-interface {v6}, Lcom/mediatek/settings/CallBarringInterface;->doCancelAllState()V

    goto :goto_1
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 200
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 208
    :goto_0
    return-void

    .line 202
    :pswitch_0
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringResetPreference$MyHandler;->this$0:Lcom/mediatek/settings/CallBarringResetPreference;

    #getter for: Lcom/mediatek/settings/CallBarringResetPreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    invoke-static {v0}, Lcom/mediatek/settings/CallBarringResetPreference;->access$400(Lcom/mediatek/settings/CallBarringResetPreference;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/settings/CallBarringResetPreference$MyHandler;->this$0:Lcom/mediatek/settings/CallBarringResetPreference;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onFinished(Landroid/preference/Preference;Z)V

    .line 203
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CallBarringResetPreference$MyHandler;->handleSetCallBarringResponse(Landroid/os/Message;)V

    goto :goto_0

    .line 200
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
