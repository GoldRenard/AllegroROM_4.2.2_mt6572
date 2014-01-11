.class public Lcom/mediatek/phone/calloption/PhoneInternationalDialogHandler;
.super Lcom/mediatek/calloption/InternationalDialogHandler;
.source "PhoneInternationalDialogHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PhoneInternationalDialogHandler"


# direct methods
.method public constructor <init>(Landroid/content/Context;IILcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;)V
    .locals 2
    .parameter "context"
    .parameter "type"
    .parameter "internationalDialOption"
    .parameter "prefixInfo"

    .prologue
    .line 25
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/mediatek/calloption/InternationalDialogHandler;-><init>(Landroid/content/Context;IILcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;)V

    .line 26
    new-instance v0, Lcom/mediatek/phone/calloption/PhoneInternationalCountrySelectDialogHandler;

    iget-object v1, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Lcom/mediatek/phone/calloption/PhoneInternationalCountrySelectDialogHandler;-><init>(Landroid/content/Context;Lcom/mediatek/calloption/InternationalCountrySelectDialogHandler$OnCountrySelectListener;)V

    iput-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mCountrySelectDialogHandler:Lcom/mediatek/calloption/InternationalCountrySelectDialogHandler;

    .line 27
    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 319
    const-string v0, "PhoneInternationalDialogHandler"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    return-void
.end method


# virtual methods
.method protected createAreaInputSingleSelectDialogItems()Landroid/view/View;
    .locals 12

    .prologue
    .line 158
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d0129

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v11, v11, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryName:Ljava/lang/String;

    aput-object v11, v9, v10

    invoke-virtual {v0, v8, v9}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 161
    .local v1, description1:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d012c

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 162
    .local v2, editText:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d0135

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 164
    .local v3, description2:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d0130

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 165
    .local v4, messageYes:Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "+"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, " ("

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v9, 0x7f0d0133

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, ") "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberOrigin:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 168
    .local v5, numberYes:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d0131

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 169
    .local v6, messageNo:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v0, v0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberOrigin:Ljava/lang/String;

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCurrentCountryISO:Ljava/lang/String;

    invoke-static {v0, v8}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 170
    .local v7, numberNo:Ljava/lang/String;
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v7, v0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberOrigin:Ljava/lang/String;

    :cond_0
    move-object v0, p0

    .line 173
    invoke-virtual/range {v0 .. v7}, Lcom/mediatek/phone/calloption/PhoneInternationalDialogHandler;->createEditTextSingleSelectItems(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected createButtonEditTextItems(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    .locals 6
    .parameter "description1"
    .parameter "buttonText"
    .parameter "description2"
    .parameter "editText"
    .parameter "isEditShow"
    .parameter "numberMessage"
    .parameter "number"
    .parameter "textAreaCode"
    .parameter "textInputCodeHere"

    .prologue
    const/16 v5, 0x8

    const/4 v4, 0x0

    .line 206
    iput-object p7, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mOriginSuggestNumber:Ljava/lang/String;

    .line 207
    iput-object p8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mTextAreaCode:Ljava/lang/String;

    .line 208
    iput-object p9, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mTextInputCodeHere:Ljava/lang/String;

    .line 210
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const-string v3, "layout_inflater"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 212
    .local v1, inflater:Landroid/view/LayoutInflater;
    const v2, 0x7f040022

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 214
    .local v0, dialogView:Landroid/view/View;
    const v2, 0x7f080098

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mDescriptionText:Landroid/widget/TextView;

    .line 215
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mDescriptionText:Landroid/widget/TextView;

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    const v2, 0x7f080038

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mCountrySelectButton:Landroid/widget/Button;

    .line 218
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mCountrySelectButton:Landroid/widget/Button;

    invoke-virtual {v2, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 219
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mCountrySelectButton:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 221
    const v2, 0x7f080099

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mAreaCodeDescription:Landroid/widget/TextView;

    .line 222
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mAreaCodeDescription:Landroid/widget/TextView;

    invoke-virtual {v2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 224
    const v2, 0x7f08009a

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mInputAreaEditText:Landroid/widget/EditText;

    .line 225
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mInputAreaEditText:Landroid/widget/EditText;

    invoke-virtual {v2, p4}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 226
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mInputAreaEditText:Landroid/widget/EditText;

    invoke-virtual {v2, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 228
    if-eqz p5, :cond_0

    .line 229
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mAreaCodeDescription:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 230
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mInputAreaEditText:Landroid/widget/EditText;

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setVisibility(I)V

    .line 236
    :goto_0
    const v2, 0x7f08009b

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mMessageYesText:Landroid/widget/TextView;

    .line 237
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mMessageYesText:Landroid/widget/TextView;

    invoke-virtual {v2, p6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 239
    const v2, 0x7f08009c

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSuggestNumberText:Landroid/widget/TextView;

    .line 240
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSuggestNumberText:Landroid/widget/TextView;

    invoke-virtual {v2, p7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 242
    return-object v0

    .line 232
    :cond_0
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mAreaCodeDescription:Landroid/widget/TextView;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 233
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mInputAreaEditText:Landroid/widget/EditText;

    invoke-virtual {v2, v5}, Landroid/widget/EditText;->setVisibility(I)V

    goto :goto_0
.end method

.method protected createCountryAreaSingleSelectDialogItems()Landroid/view/View;
    .locals 11

    .prologue
    .line 48
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v6, 0x7f0d0127

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v9, v9, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaName:Ljava/lang/String;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    iget-object v9, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v9, v9, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryName:Ljava/lang/String;

    aput-object v9, v7, v8

    const/4 v8, 0x2

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v10, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v10, v10, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v10, v10, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaCode:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v0, v6, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 51
    .local v1, description:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v6, 0x7f0d0130

    invoke-virtual {v0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 52
    .local v2, messageYes:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v6, 0x7f0d0131

    invoke-virtual {v0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 53
    .local v4, messageNo:Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "+"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaCode:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberSubscriber:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mSuggestCountryISO:Ljava/lang/String;

    invoke-static {v0, v6}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 56
    .local v3, numberYes:Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "+"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaCode:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberSubscriber:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v0, v0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberOrigin:Ljava/lang/String;

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCurrentCountryISO:Ljava/lang/String;

    invoke-static {v0, v6}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 60
    .local v5, numberNo:Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 61
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v5, v0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberOrigin:Ljava/lang/String;

    :cond_1
    move-object v0, p0

    .line 63
    invoke-virtual/range {v0 .. v5}, Lcom/mediatek/phone/calloption/PhoneInternationalDialogHandler;->createSingleSelectItems(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected createCountrySelectAreaInputDialogItems(I)Landroid/view/View;
    .locals 11
    .parameter "internationalDialOption"

    .prologue
    const v10, 0x7f0d0133

    const v9, 0x7f0d012c

    const/4 v5, 0x1

    .line 110
    const-string v1, ""

    .line 111
    .local v1, description:Ljava/lang/String;
    if-ne v5, p1, :cond_0

    .line 112
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d012f

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 116
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryName:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, "(+"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, ")"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 117
    .local v2, messageButton:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d012b

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 118
    .local v3, editTextMessage:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 119
    .local v4, editTextAreaCode:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d012d

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 120
    .local v6, numberMessage:Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "+"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, " ("

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v8, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, ") "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberOrigin:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 123
    .local v7, numberDisplay:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    move-object v0, p0

    invoke-virtual/range {v0 .. v9}, Lcom/mediatek/phone/calloption/PhoneInternationalDialogHandler;->createButtonEditTextItems(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0

    .line 114
    .end local v2           #messageButton:Ljava/lang/String;
    .end local v3           #editTextMessage:Ljava/lang/String;
    .end local v4           #editTextAreaCode:Ljava/lang/String;
    .end local v6           #numberMessage:Ljava/lang/String;
    .end local v7           #numberDisplay:Ljava/lang/String;
    :cond_0
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d0125

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0
.end method

.method protected createCountrySelectDefaultAreaInputDialogItems(I)Landroid/view/View;
    .locals 12
    .parameter "internationalDialOption"

    .prologue
    const/4 v5, 0x1

    .line 130
    const-string v1, ""

    .line 131
    .local v1, description:Ljava/lang/String;
    if-ne v5, p1, :cond_2

    .line 132
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d012f

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 136
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryName:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, " (+"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, ") "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 137
    .local v2, messageButton:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d012e

    new-array v9, v5, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v11, v11, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaName:Ljava/lang/String;

    aput-object v11, v9, v10

    invoke-virtual {v0, v8, v9}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 140
    .local v3, editTextMessage:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v4, v0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaCode:Ljava/lang/String;

    .line 141
    .local v4, editTextAreaCode:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v0, v0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, " ("

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaName:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, ") "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 144
    :cond_0
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d012d

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 145
    .local v6, numberMessage:Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "+"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, " "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaCode:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, " "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberOrigin:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mSuggestCountryISO:Ljava/lang/String;

    invoke-static {v0, v8}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 148
    .local v7, numberDisplay:Ljava/lang/String;
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "+"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaCode:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberOrigin:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 151
    :cond_1
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d0133

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v9, 0x7f0d012c

    invoke-virtual {v0, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    move-object v0, p0

    invoke-virtual/range {v0 .. v9}, Lcom/mediatek/phone/calloption/PhoneInternationalDialogHandler;->createButtonEditTextItems(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0

    .line 134
    .end local v2           #messageButton:Ljava/lang/String;
    .end local v3           #editTextMessage:Ljava/lang/String;
    .end local v4           #editTextAreaCode:Ljava/lang/String;
    .end local v6           #numberMessage:Ljava/lang/String;
    .end local v7           #numberDisplay:Ljava/lang/String;
    :cond_2
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d0125

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0
.end method

.method protected createCountrySelectDialogItems(I)Landroid/view/View;
    .locals 10
    .parameter "internationalDialOption"

    .prologue
    const v9, 0x7f0d012c

    .line 86
    const-string v1, ""

    .line 87
    .local v1, description:Ljava/lang/String;
    const/4 v0, 0x1

    if-ne v0, p1, :cond_1

    .line 88
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v5, 0x7f0d012f

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 92
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v5, v5, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryName:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, "(+"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v5, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v5, v5, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, ")"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 93
    .local v2, messageButton:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v5, 0x7f0d012b

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 94
    .local v3, editTextMessage:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 95
    .local v4, editTextAreaCode:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v5, 0x7f0d012d

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 96
    .local v6, numberMessage:Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "+"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v5, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v5, v5, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v5, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v5, v5, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaCode:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v5, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v5, v5, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberSubscriber:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v5, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v5, v5, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mSuggestCountryISO:Ljava/lang/String;

    invoke-static {v0, v5}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 100
    .local v7, numberDisplay:Ljava/lang/String;
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "+"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v5, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v5, v5, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v5, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v5, v5, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaCode:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v5, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v5, v5, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberSubscriber:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 103
    :cond_0
    const/4 v5, 0x0

    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d0133

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    move-object v0, p0

    invoke-virtual/range {v0 .. v9}, Lcom/mediatek/phone/calloption/PhoneInternationalDialogHandler;->createButtonEditTextItems(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0

    .line 90
    .end local v2           #messageButton:Ljava/lang/String;
    .end local v3           #editTextMessage:Ljava/lang/String;
    .end local v4           #editTextAreaCode:Ljava/lang/String;
    .end local v6           #numberMessage:Ljava/lang/String;
    .end local v7           #numberDisplay:Ljava/lang/String;
    :cond_1
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v5, 0x7f0d0125

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0
.end method

.method protected createCountrySingleSelectDialogItems()Landroid/view/View;
    .locals 10

    .prologue
    .line 67
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v6, 0x7f0d0126

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v9, v9, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryName:Ljava/lang/String;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    iget-object v9, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v9, v9, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    aput-object v9, v7, v8

    invoke-virtual {v0, v6, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 70
    .local v1, description:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v6, 0x7f0d0130

    invoke-virtual {v0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 71
    .local v2, messageYes:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v6, 0x7f0d0131

    invoke-virtual {v0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 72
    .local v4, messageNo:Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "+"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaCode:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberSubscriber:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mSuggestCountryISO:Ljava/lang/String;

    invoke-static {v0, v6}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 75
    .local v3, numberYes:Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "+"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaCode:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberSubscriber:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 78
    :cond_0
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v0, v0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberOrigin:Ljava/lang/String;

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCurrentCountryISO:Ljava/lang/String;

    invoke-static {v0, v6}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 79
    .local v5, numberNo:Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 80
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v5, v0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberOrigin:Ljava/lang/String;

    :cond_1
    move-object v0, p0

    .line 82
    invoke-virtual/range {v0 .. v5}, Lcom/mediatek/phone/calloption/PhoneInternationalDialogHandler;->createSingleSelectItems(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected createDefaultAreaInputSingleSelectDialogItems()Landroid/view/View;
    .locals 12

    .prologue
    .line 178
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d012a

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v11, v11, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryName:Ljava/lang/String;

    aput-object v11, v9, v10

    const/4 v10, 0x1

    iget-object v11, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v11, v11, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaName:Ljava/lang/String;

    aput-object v11, v9, v10

    invoke-virtual {v0, v8, v9}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 181
    .local v1, description1:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v2, v0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaCode:Ljava/lang/String;

    .line 182
    .local v2, editText:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v0, v0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 183
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, " ("

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaName:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, ") "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 185
    :cond_0
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d0135

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 187
    .local v3, description2:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d0130

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 188
    .local v4, messageYes:Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "+"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryCode:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mAreaCode:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberOrigin:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mSuggestCountryISO:Ljava/lang/String;

    invoke-static {v0, v8}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 191
    .local v5, numberYes:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v8, 0x7f0d0131

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 192
    .local v6, messageNo:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v0, v0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberOrigin:Ljava/lang/String;

    iget-object v8, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v8, v8, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCurrentCountryISO:Ljava/lang/String;

    invoke-static {v0, v8}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 193
    .local v7, numberNo:Ljava/lang/String;
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 194
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v7, v0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberOrigin:Ljava/lang/String;

    :cond_1
    move-object v0, p0

    .line 196
    invoke-virtual/range {v0 .. v7}, Lcom/mediatek/phone/calloption/PhoneInternationalDialogHandler;->createEditTextSingleSelectItems(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected createEditTextSingleSelectItems(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    .locals 7
    .parameter "description1"
    .parameter "editText"
    .parameter "description2"
    .parameter "messageYes"
    .parameter "numberYes"
    .parameter "messageNo"
    .parameter "numberNo"

    .prologue
    const v6, 0x7f0800a0

    const v5, 0x7f080099

    const v4, 0x7f080098

    .line 250
    iput-object p5, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mOriginSuggestNumber:Ljava/lang/String;

    .line 252
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const-string v3, "layout_inflater"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 254
    .local v1, inflater:Landroid/view/LayoutInflater;
    const v2, 0x7f040023

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 256
    .local v0, dialogView:Landroid/view/View;
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mDescriptionText:Landroid/widget/TextView;

    .line 257
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mDescriptionText:Landroid/widget/TextView;

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 259
    const v2, 0x7f08009a

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mInputAreaEditText:Landroid/widget/EditText;

    .line 260
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mInputAreaEditText:Landroid/widget/EditText;

    invoke-virtual {v2, p2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 261
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mInputAreaEditText:Landroid/widget/EditText;

    invoke-virtual {v2, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 263
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mAreaCodeDescription:Landroid/widget/TextView;

    .line 264
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mAreaCodeDescription:Landroid/widget/TextView;

    invoke-virtual {v2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 266
    const v2, 0x7f08009d

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup1:Landroid/view/ViewGroup;

    .line 267
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup1:Landroid/view/ViewGroup;

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mMessageYesText:Landroid/widget/TextView;

    .line 268
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mMessageYesText:Landroid/widget/TextView;

    invoke-virtual {v2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 269
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup1:Landroid/view/ViewGroup;

    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSuggestNumberText:Landroid/widget/TextView;

    .line 270
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSuggestNumberText:Landroid/widget/TextView;

    invoke-virtual {v2, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 271
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup1:Landroid/view/ViewGroup;

    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioButton;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mRadioButton1:Landroid/widget/RadioButton;

    .line 272
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mRadioButton1:Landroid/widget/RadioButton;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 273
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup1:Landroid/view/ViewGroup;

    invoke-virtual {v2, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 275
    const v2, 0x7f08009e

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup2:Landroid/view/ViewGroup;

    .line 276
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup2:Landroid/view/ViewGroup;

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mMessageNoText:Landroid/widget/TextView;

    .line 277
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mMessageNoText:Landroid/widget/TextView;

    invoke-virtual {v2, p6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 278
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup2:Landroid/view/ViewGroup;

    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mOriginNumberText:Landroid/widget/TextView;

    .line 279
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mOriginNumberText:Landroid/widget/TextView;

    invoke-virtual {v2, p7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 280
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup2:Landroid/view/ViewGroup;

    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioButton;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mRadioButton2:Landroid/widget/RadioButton;

    .line 281
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup2:Landroid/view/ViewGroup;

    invoke-virtual {v2, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 283
    return-object v0
.end method

.method protected createPrefixConfirmDialogItems()Landroid/view/View;
    .locals 10

    .prologue
    .line 30
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v6, 0x7f0d0128

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v9, v9, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCountryName:Ljava/lang/String;

    aput-object v9, v7, v8

    invoke-virtual {v0, v6, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 33
    .local v1, description:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v6, 0x7f0d0130

    invoke-virtual {v0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 34
    .local v2, messageYes:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const v6, 0x7f0d0131

    invoke-virtual {v0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 35
    .local v4, messageNo:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v0, v0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberReplaceInterPrefix:Ljava/lang/String;

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mSuggestCountryISO:Ljava/lang/String;

    invoke-static {v0, v6}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 37
    .local v3, numberYes:Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 38
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v3, v0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberReplaceInterPrefix:Ljava/lang/String;

    .line 40
    :cond_0
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v0, v0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberOrigin:Ljava/lang/String;

    iget-object v6, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v6, v6, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mCurrentCountryISO:Ljava/lang/String;

    invoke-static {v0, v6}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 41
    .local v5, numberNo:Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 42
    iget-object v0, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mPrefixInfo:Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;

    iget-object v5, v0, Lcom/mediatek/calloption/InternationalDialogHandler$PrefixInfo;->mNumberOrigin:Ljava/lang/String;

    :cond_1
    move-object v0, p0

    .line 44
    invoke-virtual/range {v0 .. v5}, Lcom/mediatek/phone/calloption/PhoneInternationalDialogHandler;->createSingleSelectItems(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected createSingleSelectItems(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    .locals 7
    .parameter "description"
    .parameter "messageYes"
    .parameter "numberYes"
    .parameter "messageNo"
    .parameter "numberNo"

    .prologue
    const v6, 0x7f0800a0

    const v5, 0x7f080099

    const v4, 0x7f080098

    .line 289
    iput-object p3, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mOriginSuggestNumber:Ljava/lang/String;

    .line 291
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mContext:Landroid/content/Context;

    const-string v3, "layout_inflater"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 293
    .local v1, inflater:Landroid/view/LayoutInflater;
    const v2, 0x7f040024

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 295
    .local v0, dialogView:Landroid/view/View;
    const v2, 0x7f08009f

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mDescriptionText:Landroid/widget/TextView;

    .line 296
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mDescriptionText:Landroid/widget/TextView;

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 298
    const v2, 0x7f08009d

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup1:Landroid/view/ViewGroup;

    .line 299
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup1:Landroid/view/ViewGroup;

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mMessageYesText:Landroid/widget/TextView;

    .line 300
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mMessageYesText:Landroid/widget/TextView;

    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 301
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup1:Landroid/view/ViewGroup;

    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSuggestNumberText:Landroid/widget/TextView;

    .line 302
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSuggestNumberText:Landroid/widget/TextView;

    invoke-virtual {v2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 303
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup1:Landroid/view/ViewGroup;

    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioButton;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mRadioButton1:Landroid/widget/RadioButton;

    .line 304
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mRadioButton1:Landroid/widget/RadioButton;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 305
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup1:Landroid/view/ViewGroup;

    invoke-virtual {v2, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 307
    const v2, 0x7f08009e

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup2:Landroid/view/ViewGroup;

    .line 308
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup2:Landroid/view/ViewGroup;

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mMessageNoText:Landroid/widget/TextView;

    .line 309
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mMessageNoText:Landroid/widget/TextView;

    invoke-virtual {v2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 310
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup2:Landroid/view/ViewGroup;

    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mOriginNumberText:Landroid/widget/TextView;

    .line 311
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mOriginNumberText:Landroid/widget/TextView;

    invoke-virtual {v2, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 312
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup2:Landroid/view/ViewGroup;

    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioButton;

    iput-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mRadioButton2:Landroid/widget/RadioButton;

    .line 313
    iget-object v2, p0, Lcom/mediatek/calloption/InternationalDialogHandler;->mSingleGroup2:Landroid/view/ViewGroup;

    invoke-virtual {v2, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 315
    return-object v0
.end method
