.class public Lcom/mediatek/settings/CallBarringBasePreference;
.super Landroid/preference/CheckBoxPreference;
.source "CallBarringBasePreference.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/CallBarringBasePreference$MyHandler;
    }
.end annotation


# static fields
.field private static final DBG:Z = true

.field public static final DEFAULT_SIM:I = 0x2

.field private static final LOG_TAG:Ljava/lang/String; = "Settings/CallBarringBasePreference"

.field private static final PASSWORD_LENGTH:I = 0x4


# instance fields
.field private mCallBarringInterface:Lcom/mediatek/settings/CallBarringInterface;

.field private mContext:Landroid/content/Context;

.field private mCurrentClickState:Z

.field private mFacility:Ljava/lang/String;

.field private mHandler:Lcom/mediatek/settings/CallBarringBasePreference$MyHandler;

.field private mPhone:Lcom/android/internal/telephony/Phone;

.field private mResult:Z

.field private mServiceClass:I

.field private mSimId:I

.field private mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

.field private mTitle:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 93
    invoke-direct {p0, p1, p2}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 75
    new-instance v0, Lcom/mediatek/settings/CallBarringBasePreference$MyHandler;

    invoke-direct {v0, p0, v1}, Lcom/mediatek/settings/CallBarringBasePreference$MyHandler;-><init>(Lcom/mediatek/settings/CallBarringBasePreference;Lcom/mediatek/settings/CallBarringBasePreference$1;)V

    iput-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mHandler:Lcom/mediatek/settings/CallBarringBasePreference$MyHandler;

    .line 77
    iput-object v1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mContext:Landroid/content/Context;

    .line 81
    iput-boolean v2, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mCurrentClickState:Z

    .line 83
    iput-object v1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mCallBarringInterface:Lcom/mediatek/settings/CallBarringInterface;

    .line 85
    iput-boolean v3, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mResult:Z

    .line 88
    const/4 v0, 0x2

    iput v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mSimId:I

    .line 90
    iput v3, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mServiceClass:I

    .line 94
    invoke-virtual {p0, v2}, Lcom/mediatek/settings/CallBarringBasePreference;->setEnabled(Z)V

    .line 95
    iput-object p1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mContext:Landroid/content/Context;

    .line 96
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 97
    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/settings/CallBarringBasePreference;Ljava/lang/String;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CallBarringBasePreference;->validatePassword(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1000(Lcom/mediatek/settings/CallBarringBasePreference;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mServiceClass:I

    return v0
.end method

.method static synthetic access$200(Lcom/mediatek/settings/CallBarringBasePreference;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mediatek/settings/CallBarringBasePreference;)Lcom/mediatek/phone/TimeConsumingPreferenceListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mediatek/settings/CallBarringBasePreference;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mFacility:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/settings/CallBarringBasePreference;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget-boolean v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mCurrentClickState:Z

    return v0
.end method

.method static synthetic access$600(Lcom/mediatek/settings/CallBarringBasePreference;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 70
    invoke-direct {p0, p1, p2, p3}, Lcom/mediatek/settings/CallBarringBasePreference;->setCallState(Ljava/lang/String;ZLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lcom/mediatek/settings/CallBarringBasePreference;)Lcom/mediatek/settings/CallBarringInterface;
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mCallBarringInterface:Lcom/mediatek/settings/CallBarringInterface;

    return-object v0
.end method

.method static synthetic access$800(Lcom/mediatek/settings/CallBarringBasePreference;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 70
    invoke-direct {p0, p1, p2, p3}, Lcom/mediatek/settings/CallBarringBasePreference;->getCallState(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$902(Lcom/mediatek/settings/CallBarringBasePreference;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 70
    iput-boolean p1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mResult:Z

    return p1
.end method

.method private doPreferenceClick(Ljava/lang/String;)V
    .locals 9
    .parameter "title"

    .prologue
    const/4 v8, 0x0

    .line 139
    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarringBasePreference;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    .line 140
    .local v3, inflater:Landroid/view/LayoutInflater;
    const v6, 0x7f04000a

    invoke-virtual {v3, v6, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 142
    .local v4, textEntryView:Landroid/view/View;
    const v6, 0x7f08001f

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 143
    .local v1, content:Landroid/widget/TextView;
    iget-object v6, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mContext:Landroid/content/Context;

    const v7, 0x7f0d00ca

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarringBasePreference;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v0, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 147
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 148
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 149
    const v6, 0x7f0d0196

    invoke-virtual {v0, v6, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 150
    const v6, 0x7f0d0192

    new-instance v7, Lcom/mediatek/settings/CallBarringBasePreference$1;

    invoke-direct {v7, p0, v4, p1}, Lcom/mediatek/settings/CallBarringBasePreference$1;-><init>(Lcom/mediatek/settings/CallBarringBasePreference;Landroid/view/View;Ljava/lang/String;)V

    invoke-virtual {v0, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 179
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    .line 181
    .local v2, dlg:Landroid/app/AlertDialog;
    if-eqz v2, :cond_0

    .line 182
    invoke-virtual {v2}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    .line 183
    .local v5, window:Landroid/view/Window;
    const/4 v6, 0x5

    invoke-virtual {v5, v6}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 184
    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 188
    .end local v5           #window:Landroid/view/Window;
    :cond_0
    return-void
.end method

.method private getCallState(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 7
    .parameter "facility"
    .parameter "password"
    .parameter "reason"

    .prologue
    const/4 v6, 0x0

    const/16 v5, 0x200

    const/4 v4, 0x0

    .line 195
    const-string v1, "Settings/CallBarringBasePreference"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getCallState() is called with facility is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "password is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "reason is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    if-eqz p3, :cond_0

    .line 201
    iget-object v1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mHandler:Lcom/mediatek/settings/CallBarringBasePreference$MyHandler;

    invoke-virtual {v1, v4, v4, v4, v6}, Lcom/mediatek/settings/CallBarringBasePreference$MyHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 207
    .local v0, m:Landroid/os/Message;
    :goto_0
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 208
    iget v1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mServiceClass:I

    if-ne v1, v5, :cond_1

    .line 209
    iget-object v1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v2, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mSimId:I

    invoke-virtual {v1, p1, p2, v0, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getVtFacilityLockGemini(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;I)V

    .line 220
    :goto_1
    return-void

    .line 204
    .end local v0           #m:Landroid/os/Message;
    :cond_0
    iget-object v1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mHandler:Lcom/mediatek/settings/CallBarringBasePreference$MyHandler;

    const/4 v2, 0x1

    invoke-virtual {v1, v4, v4, v2, v6}, Lcom/mediatek/settings/CallBarringBasePreference$MyHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .restart local v0       #m:Landroid/os/Message;
    goto :goto_0

    .line 211
    :cond_1
    iget-object v1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v2, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mSimId:I

    invoke-virtual {v1, p1, p2, v0, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getFacilityLockGemini(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;I)V

    goto :goto_1

    .line 214
    :cond_2
    iget v1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mServiceClass:I

    if-ne v1, v5, :cond_3

    .line 215
    iget-object v1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1, p1, p2, v0}, Lcom/android/internal/telephony/Phone;->getVtFacilityLock(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    goto :goto_1

    .line 217
    :cond_3
    iget-object v1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1, p1, p2, v0}, Lcom/android/internal/telephony/Phone;->getFacilityLock(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    goto :goto_1
.end method

.method private setCallState(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 6
    .parameter "facility"
    .parameter "enable"
    .parameter "password"

    .prologue
    const/16 v5, 0x200

    const/4 v3, 0x1

    .line 224
    const-string v0, "Settings/CallBarringBasePreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setCallState() is called with facility is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "password is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "enable is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mHandler:Lcom/mediatek/settings/CallBarringBasePreference$MyHandler;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v3, v1, v3, v2}, Lcom/mediatek/settings/CallBarringBasePreference$MyHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    .line 232
    .local v4, m:Landroid/os/Message;
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 233
    iget v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mServiceClass:I

    if-ne v0, v5, :cond_0

    .line 234
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v5, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mSimId:I

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setVtFacilityLockGemini(Ljava/lang/String;ZLjava/lang/String;Landroid/os/Message;I)V

    .line 245
    :goto_0
    return-void

    .line 236
    :cond_0
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v5, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mSimId:I

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setFacilityLockGemini(Ljava/lang/String;ZLjava/lang/String;Landroid/os/Message;I)V

    goto :goto_0

    .line 239
    :cond_1
    iget v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mServiceClass:I

    if-ne v0, v5, :cond_2

    .line 240
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v0, p1, p2, p3, v4}, Lcom/android/internal/telephony/Phone;->setVtFacilityLock(Ljava/lang/String;ZLjava/lang/String;Landroid/os/Message;)V

    goto :goto_0

    .line 242
    :cond_2
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v0, p1, p2, p3, v4}, Lcom/android/internal/telephony/Phone;->setFacilityLock(Ljava/lang/String;ZLjava/lang/String;Landroid/os/Message;)V

    goto :goto_0
.end method

.method private validatePassword(Ljava/lang/String;)Z
    .locals 2
    .parameter "password"

    .prologue
    .line 262
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
.method init(Lcom/mediatek/phone/TimeConsumingPreferenceListener;ZI)V
    .locals 3
    .parameter "listener"
    .parameter "skipReading"
    .parameter "simId"

    .prologue
    const/4 v2, 0x1

    .line 248
    iput p3, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mSimId:I

    .line 250
    invoke-virtual {p0, p0}, Lcom/mediatek/settings/CallBarringBasePreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 251
    iput-object p1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    .line 252
    if-nez p2, :cond_1

    .line 253
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    if-eqz v0, :cond_0

    .line 254
    const-string v0, "Settings/CallBarringBasePreference"

    const-string v1, "init() is called"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    invoke-interface {v0, p0, v2}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onStarted(Landroid/preference/Preference;Z)V

    .line 257
    :cond_0
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mFacility:Ljava/lang/String;

    const-string v1, ""

    invoke-direct {p0, v0, v1, v2}, Lcom/mediatek/settings/CallBarringBasePreference;->getCallState(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 259
    :cond_1
    return-void
.end method

.method public isSuccess()Z
    .locals 1

    .prologue
    .line 388
    iget-boolean v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mResult:Z

    return v0
.end method

.method protected onBindView(Landroid/view/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 118
    invoke-super {p0, p1}, Landroid/preference/CheckBoxPreference;->onBindView(Landroid/view/View;)V

    .line 120
    const v1, 0x1020016

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 121
    .local v0, titleView:Landroid/view/View;
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/widget/TextView;

    if-eqz v1, :cond_0

    .line 122
    check-cast v0, Landroid/widget/TextView;

    .end local v0           #titleView:Landroid/view/View;
    const-string v1, "MIDDLE"

    invoke-static {v1}, Landroid/text/TextUtils$TruncateAt;->valueOf(Ljava/lang/String;)Landroid/text/TextUtils$TruncateAt;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 124
    :cond_0
    return-void
.end method

.method protected onClick()V
    .locals 1

    .prologue
    .line 113
    invoke-virtual {p0}, Lcom/mediatek/settings/CallBarringBasePreference;->isChecked()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mCurrentClickState:Z

    .line 114
    return-void

    .line 113
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 2
    .parameter "preference"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mContext:Landroid/content/Context;

    iget v1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mTitle:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/settings/CallBarringBasePreference;->doPreferenceClick(Ljava/lang/String;)V

    .line 128
    const/4 v0, 0x1

    return v0
.end method

.method public setCallState(Ljava/lang/String;)V
    .locals 2
    .parameter "password"

    .prologue
    const/4 v1, 0x0

    .line 132
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mFacility:Ljava/lang/String;

    invoke-direct {p0, v0, v1, p1}, Lcom/mediatek/settings/CallBarringBasePreference;->setCallState(Ljava/lang/String;ZLjava/lang/String;)V

    .line 133
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mTcpListener:Lcom/mediatek/phone/TimeConsumingPreferenceListener;

    invoke-interface {v0, p0, v1}, Lcom/mediatek/phone/TimeConsumingPreferenceListener;->onStarted(Landroid/preference/Preference;Z)V

    .line 136
    :cond_0
    return-void
.end method

.method public setRefreshInterface(Lcom/mediatek/settings/CallBarringInterface;)V
    .locals 0
    .parameter "i"

    .prologue
    .line 100
    iput-object p1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mCallBarringInterface:Lcom/mediatek/settings/CallBarringInterface;

    .line 101
    return-void
.end method

.method public setServiceClass(I)V
    .locals 0
    .parameter "serviceClass"

    .prologue
    .line 392
    iput p1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mServiceClass:I

    .line 393
    return-void
.end method

.method public setmFacility(Ljava/lang/String;)V
    .locals 0
    .parameter "facility"

    .prologue
    .line 108
    iput-object p1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mFacility:Ljava/lang/String;

    .line 109
    return-void
.end method

.method public setmTitle(I)V
    .locals 0
    .parameter "title"

    .prologue
    .line 104
    iput p1, p0, Lcom/mediatek/settings/CallBarringBasePreference;->mTitle:I

    .line 105
    return-void
.end method
