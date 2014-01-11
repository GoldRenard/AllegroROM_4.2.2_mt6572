.class public Lcom/mediatek/settings/CallBarringChangePassword;
.super Lcom/android/phone/EditPinPreference;
.source "CallBarringChangePassword.java"

# interfaces
.implements Lcom/android/phone/EditPinPreference$OnPinEnteredListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/CallBarringChangePassword$1;,
        Lcom/mediatek/settings/CallBarringChangePassword$MyHandler;
    }
.end annotation


# static fields
.field private static final DBG:Z = true

.field public static final DEFAULT_SIM:I = 0x2

.field private static final LOG_TAG:Ljava/lang/String; = "Settings/CallChangePassword"

.field private static final PASSWORD_CHANGE_NEW:I = 0x1

.field private static final PASSWORD_CHANGE_OLD:I = 0x0

.field private static final PASSWORD_CHANGE_REENTER:I = 0x2

.field private static final PASSWORD_LENGTH:I = 0x4


# instance fields
.field private mCallBarringInterface:Lcom/mediatek/settings/CallBarringInterface;

.field private mContext:Landroid/content/Context;

.field private mHandler:Lcom/mediatek/settings/CallBarringChangePassword$MyHandler;

.field private mNewPassword:Ljava/lang/String;

.field private mOldPassword:Ljava/lang/String;

.field private mPasswordChangeState:I

.field private mPhone:Lcom/android/internal/telephony/Phone;

.field private mSimId:I

.field private mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v1, 0x0

    .line 85
    invoke-direct {p0, p1, p2}, Lcom/android/phone/EditPinPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 72
    new-instance v0, Lcom/mediatek/settings/CallBarringChangePassword$MyHandler;

    invoke-direct {v0, p0, v1}, Lcom/mediatek/settings/CallBarringChangePassword$MyHandler;-><init>(Lcom/mediatek/settings/CallBarringChangePassword;Lcom/mediatek/settings/CallBarringChangePassword$1;)V

    iput-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mHandler:Lcom/mediatek/settings/CallBarringChangePassword$MyHandler;

    .line 73
    iput-object v1, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    .line 77
    iput-object v1, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mContext:Landroid/content/Context;

    .line 79
    iput-object v1, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mCallBarringInterface:Lcom/mediatek/settings/CallBarringInterface;

    .line 82
    const/4 v0, 0x2

    iput v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mSimId:I

    .line 86
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CallBarringChangePassword;->init(Landroid/content/Context;)V

    .line 87
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 88
    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/settings/CallBarringChangePassword;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mediatek/settings/CallBarringChangePassword;)Lcom/mediatek/settings/CallBarringInterface;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mCallBarringInterface:Lcom/mediatek/settings/CallBarringInterface;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mediatek/settings/CallBarringChangePassword;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CallBarringChangePassword;->displayMessage(I)V

    return-void
.end method

.method private displayMessage(I)V
    .locals 3
    .parameter "strId"

    .prologue
    .line 211
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mContext:Landroid/content/Context;

    invoke-virtual {v1, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 213
    return-void
.end method

.method private displayPasswordChangeDialog(IZ)V
    .locals 3
    .parameter "strId"
    .parameter "shouldDisplay"

    .prologue
    .line 92
    const/4 v0, 0x0

    .line 93
    .local v0, msgId:I
    iget v1, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mPasswordChangeState:I

    packed-switch v1, :pswitch_data_0

    .line 106
    :goto_0
    if-eqz p1, :cond_1

    .line 107
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarringChangePassword;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarringChangePassword;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/CallBarringChangePassword;->setDialogMessage(Ljava/lang/CharSequence;)V

    .line 113
    :goto_1
    if-eqz p2, :cond_0

    .line 114
    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarringChangePassword;->showPinDialog()V

    .line 116
    :cond_0
    return-void

    .line 95
    :pswitch_0
    const v0, 0x7f0d00c4

    .line 96
    goto :goto_0

    .line 98
    :pswitch_1
    const v0, 0x7f0d00c5

    .line 99
    goto :goto_0

    .line 101
    :pswitch_2
    const v0, 0x7f0d00c7

    .line 102
    goto :goto_0

    .line 110
    :cond_1
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CallBarringChangePassword;->setDialogMessage(I)V

    goto :goto_1

    .line 93
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private doChangePassword(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .parameter "oldPassword"
    .parameter "newPassword"

    .prologue
    const/4 v3, 0x0

    .line 174
    const-string v0, "Settings/CallChangePassword"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "doChangePassword() is called with oldPassword is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "newPassword is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mHandler:Lcom/mediatek/settings/CallBarringChangePassword$MyHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v3, v3, v3, v1}, Lcom/mediatek/settings/CallBarringChangePassword$MyHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    .line 180
    .local v4, m:Landroid/os/Message;
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    const-string v1, "AB"

    iget v5, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mSimId:I

    move-object v2, p1

    move-object v3, p2

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/telephony/gemini/GeminiPhone;->changeBarringPasswordGemini(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;I)V

    .line 187
    :goto_0
    return-void

    .line 184
    :cond_0
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mPhone:Lcom/android/internal/telephony/Phone;

    const-string v1, "AB"

    invoke-interface {v0, v1, p1, p2, v4}, Lcom/android/internal/telephony/Phone;->changeBarringPassword(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    goto :goto_0
.end method

.method private init(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 194
    iput-object p1, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mContext:Landroid/content/Context;

    .line 195
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CallBarringChangePassword;->setEnabled(Z)V

    .line 196
    invoke-virtual {p0, p0}, Lcom/mediatek/settings/CallBarringChangePassword;->setOnPinEnteredListener(Lcom/android/phone/EditPinPreference$OnPinEnteredListener;)V

    .line 197
    invoke-direct {p0}, Lcom/mediatek/settings/CallBarringChangePassword;->resetPasswordChangeState()V

    .line 198
    return-void
.end method

.method private resetPasswordChangeState()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 119
    iput v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mPasswordChangeState:I

    .line 120
    invoke-direct {p0, v0, v0}, Lcom/mediatek/settings/CallBarringChangePassword;->displayPasswordChangeDialog(IZ)V

    .line 121
    const-string v0, ""

    iput-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mOldPassword:Ljava/lang/String;

    .line 122
    const-string v0, ""

    iput-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mNewPassword:Ljava/lang/String;

    .line 123
    return-void
.end method

.method private validatePassword(Ljava/lang/String;)Z
    .locals 2
    .parameter "password"

    .prologue
    .line 190
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onPinEntered(Lcom/android/phone/EditPinPreference;Z)V
    .locals 4
    .parameter "preference"
    .parameter "positiveResult"

    .prologue
    const v1, 0x7f0d00c6

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 127
    if-nez p2, :cond_0

    .line 128
    invoke-direct {p0}, Lcom/mediatek/settings/CallBarringChangePassword;->resetPasswordChangeState()V

    .line 169
    :goto_0
    return-void

    .line 131
    :cond_0
    iget v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mPasswordChangeState:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 133
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarringChangePassword;->getText()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mOldPassword:Ljava/lang/String;

    .line 134
    const-string v0, ""

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CallBarringChangePassword;->setText(Ljava/lang/String;)V

    .line 135
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mOldPassword:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/mediatek/settings/CallBarringChangePassword;->validatePassword(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 136
    iput v2, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mPasswordChangeState:I

    .line 137
    invoke-direct {p0, v3, v2}, Lcom/mediatek/settings/CallBarringChangePassword;->displayPasswordChangeDialog(IZ)V

    goto :goto_0

    .line 139
    :cond_1
    invoke-direct {p0, v1, v2}, Lcom/mediatek/settings/CallBarringChangePassword;->displayPasswordChangeDialog(IZ)V

    goto :goto_0

    .line 143
    :pswitch_1
    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarringChangePassword;->getText()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mNewPassword:Ljava/lang/String;

    .line 144
    const-string v0, ""

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CallBarringChangePassword;->setText(Ljava/lang/String;)V

    .line 145
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mNewPassword:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/mediatek/settings/CallBarringChangePassword;->validatePassword(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 146
    const/4 v0, 0x2

    iput v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mPasswordChangeState:I

    .line 147
    invoke-direct {p0, v3, v2}, Lcom/mediatek/settings/CallBarringChangePassword;->displayPasswordChangeDialog(IZ)V

    goto :goto_0

    .line 149
    :cond_2
    invoke-direct {p0, v1, v2}, Lcom/mediatek/settings/CallBarringChangePassword;->displayPasswordChangeDialog(IZ)V

    goto :goto_0

    .line 153
    :pswitch_2
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mNewPassword:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarringChangePassword;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 154
    iput v2, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mPasswordChangeState:I

    .line 155
    const-string v0, ""

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CallBarringChangePassword;->setText(Ljava/lang/String;)V

    .line 156
    const v0, 0x7f0d00c8

    invoke-direct {p0, v0, v2}, Lcom/mediatek/settings/CallBarringChangePassword;->displayPasswordChangeDialog(IZ)V

    goto :goto_0

    .line 158
    :cond_3
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    if-eqz v0, :cond_4

    .line 159
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    invoke-interface {v0, p0, v3}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onStarted(Landroid/preference/Preference;Z)V

    .line 161
    :cond_4
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mOldPassword:Ljava/lang/String;

    iget-object v1, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mNewPassword:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/mediatek/settings/CallBarringChangePassword;->doChangePassword(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    const-string v0, ""

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CallBarringChangePassword;->setText(Ljava/lang/String;)V

    .line 163
    invoke-direct {p0}, Lcom/mediatek/settings/CallBarringChangePassword;->resetPasswordChangeState()V

    goto :goto_0

    .line 131
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public setTimeConsumingListener(Lcom/mediatek/phone/TimeConsumingPreferenceListener;I)V
    .locals 0
    .parameter "listener"
    .parameter "simId"

    .prologue
    .line 202
    iput-object p1, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    .line 203
    check-cast p1, Lcom/mediatek/settings/CallBarringInterface;

    .end local p1
    iput-object p1, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mCallBarringInterface:Lcom/mediatek/settings/CallBarringInterface;

    .line 204
    iput p2, p0, Lcom/mediatek/settings/CallBarringChangePassword;->mSimId:I

    .line 205
    return-void
.end method
