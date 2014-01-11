.class public Lcom/android/phone/EditPinPreference;
.super Landroid/preference/EditTextPreference;
.source "EditPinPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/phone/EditPinPreference$OnPinEnteredListener;
    }
.end annotation


# static fields
.field public static final FDN_MODE_FLAG:I = 0xa

.field private static final LOG_TAG:Ljava/lang/String; = "Settings/EditPinPreference"


# instance fields
.field private mMode:I

.field private mPhone:Lcom/android/internal/telephony/Phone;

.field private mPinListener:Lcom/android/phone/EditPinPreference$OnPinEnteredListener;

.field private mShouldHideButtons:Z

.field private mSimId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 95
    invoke-direct {p0, p1, p2}, Landroid/preference/EditTextPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 96
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 99
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/EditTextPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 100
    return-void
.end method

.method private handleFdnModeClick()V
    .locals 5

    .prologue
    .line 196
    const-string v2, "Settings/EditPinPreference"

    const-string v3, "Enable or Disable the FDN state button is clicked"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    const/4 v1, 0x0

    .line 199
    .local v1, isPhoneBookReady:Z
    iget-object v2, p0, Lcom/android/phone/EditPinPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v2, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v3, p0, Lcom/android/phone/EditPinPreference;->mSimId:I

    invoke-virtual {v2, v3}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getIccCardGemini(I)Lcom/android/internal/telephony/IccCard;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/IccCard;->isPhbReady()Z

    move-result v1

    .line 204
    const-string v2, "Settings/EditPinPreference"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Phone book state from system is :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    if-nez v1, :cond_0

    .line 206
    invoke-virtual {p0}, Lcom/android/phone/EditPinPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 207
    .local v0, context:Landroid/content/Context;
    const v2, 0x7f0d00cc

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0d0086

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/android/phone/EditPinPreference;->showTipDialog(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    .end local v0           #context:Landroid/content/Context;
    :goto_0
    return-void

    .line 209
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/android/phone/EditPinPreference;->showDialog(Landroid/os/Bundle;)V

    goto :goto_0
.end method


# virtual methods
.method public initFdnModeData(Lcom/android/internal/telephony/Phone;II)V
    .locals 0
    .parameter "phone"
    .parameter "mode"
    .parameter "simId"

    .prologue
    .line 189
    iput-object p1, p0, Lcom/android/phone/EditPinPreference;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 190
    iput p2, p0, Lcom/android/phone/EditPinPreference;->mMode:I

    .line 191
    iput p3, p0, Lcom/android/phone/EditPinPreference;->mSimId:I

    .line 192
    return-void
.end method

.method protected onBindDialogView(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 132
    invoke-super {p0, p1}, Landroid/preference/EditTextPreference;->onBindDialogView(Landroid/view/View;)V

    .line 135
    const v0, 0x1020003

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/android/phone/EditPinPreference;->mShouldHideButtons:Z

    .line 136
    return-void

    .line 135
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onClick()V
    .locals 2

    .prologue
    .line 174
    invoke-virtual {p0}, Lcom/android/phone/EditPinPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 186
    :goto_0
    return-void

    .line 177
    :cond_0
    iget v0, p0, Lcom/android/phone/EditPinPreference;->mMode:I

    packed-switch v0, :pswitch_data_0

    .line 183
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/phone/EditPinPreference;->showDialog(Landroid/os/Bundle;)V

    goto :goto_0

    .line 179
    :pswitch_0
    const-string v0, "Settings/EditPinPreference"

    const-string v1, "onClick, FDN_MODE_FLAG"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    invoke-direct {p0}, Lcom/android/phone/EditPinPreference;->handleFdnModeClick()V

    goto :goto_0

    .line 177
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_0
    .end packed-switch
.end method

.method protected onCreateDialogView()Landroid/view/View;
    .locals 6

    .prologue
    .line 109
    const v3, 0x7f040031

    invoke-virtual {p0, v3}, Lcom/android/phone/EditPinPreference;->setDialogLayoutResource(I)V

    .line 111
    invoke-super {p0}, Landroid/preference/EditTextPreference;->onCreateDialogView()Landroid/view/View;

    move-result-object v0

    .line 116
    .local v0, dialog:Landroid/view/View;
    invoke-virtual {p0}, Lcom/android/phone/EditPinPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v2

    .line 119
    .local v2, textfield:Landroid/widget/EditText;
    const/16 v3, 0x12

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setInputType(I)V

    .line 121
    instance-of v3, p0, Lcom/mediatek/settings/CallBarringChangePassword;

    if-eqz v3, :cond_0

    .line 122
    const/4 v3, 0x1

    new-array v1, v3, [Landroid/text/InputFilter;

    .line 123
    .local v1, filters:[Landroid/text/InputFilter;
    const/4 v3, 0x0

    new-instance v4, Landroid/text/InputFilter$LengthFilter;

    const/4 v5, 0x4

    invoke-direct {v4, v5}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v4, v1, v3

    .line 124
    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 127
    .end local v1           #filters:[Landroid/text/InputFilter;
    :cond_0
    return-object v0
.end method

.method protected onDialogClosed(Z)V
    .locals 1
    .parameter "positiveResult"

    .prologue
    .line 151
    invoke-super {p0, p1}, Landroid/preference/EditTextPreference;->onDialogClosed(Z)V

    .line 152
    iget-object v0, p0, Lcom/android/phone/EditPinPreference;->mPinListener:Lcom/android/phone/EditPinPreference$OnPinEnteredListener;

    if-eqz v0, :cond_0

    .line 153
    iget-object v0, p0, Lcom/android/phone/EditPinPreference;->mPinListener:Lcom/android/phone/EditPinPreference$OnPinEnteredListener;

    invoke-interface {v0, p0, p1}, Lcom/android/phone/EditPinPreference$OnPinEnteredListener;->onPinEntered(Lcom/android/phone/EditPinPreference;Z)V

    .line 155
    :cond_0
    return-void
.end method

.method protected onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V
    .locals 2
    .parameter "builder"

    .prologue
    const/4 v1, 0x0

    .line 140
    invoke-super {p0, p1}, Landroid/preference/EditTextPreference;->onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V

    .line 143
    iget-boolean v0, p0, Lcom/android/phone/EditPinPreference;->mShouldHideButtons:Z

    if-eqz v0, :cond_0

    .line 144
    invoke-virtual {p1, v1, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 145
    invoke-virtual {p1, v1, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 147
    :cond_0
    return-void
.end method

.method public setOnPinEnteredListener(Lcom/android/phone/EditPinPreference$OnPinEnteredListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 91
    iput-object p1, p0, Lcom/android/phone/EditPinPreference;->mPinListener:Lcom/android/phone/EditPinPreference$OnPinEnteredListener;

    .line 92
    return-void
.end method

.method public showPinDialog()V
    .locals 1

    .prologue
    .line 164
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/phone/EditPinPreference;->showDialog(Landroid/os/Bundle;)V

    .line 165
    return-void
.end method

.method public showTipDialog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "title"
    .parameter "msg"

    .prologue
    .line 169
    invoke-virtual {p0}, Lcom/android/phone/EditPinPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 170
    return-void
.end method
