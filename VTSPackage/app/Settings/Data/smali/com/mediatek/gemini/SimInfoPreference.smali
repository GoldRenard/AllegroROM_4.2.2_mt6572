.class public Lcom/mediatek/gemini/SimInfoPreference;
.super Landroid/preference/Preference;
.source "SimInfoPreference.java"


# static fields
.field private static final DISPLAY_FIRST_FOUR:I = 0x1

.field private static final DISPLAY_LAST_FOUR:I = 0x2

.field private static final DISPLAY_NONE:I = 0x0

.field private static final NUMFORMAT:I = 0x4

.field private static final TAG:Ljava/lang/String; = "SimInfoPreference"


# instance fields
.field private mChecked:Z

.field private mColor:I

.field private mContext:Landroid/content/Context;

.field private mName:Ljava/lang/String;

.field private mNeedCheckbox:Z

.field private mNeedStatus:Z

.field private mNumDisplayFormat:I

.field private mSimNum:Ljava/lang/String;

.field protected final mSlotIndex:I

.field private mStatus:I

.field private mUseCheckBox:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIIIJZ)V
    .locals 12
    .parameter "context"
    .parameter "name"
    .parameter "number"
    .parameter "simSlot"
    .parameter "status"
    .parameter "color"
    .parameter "displayNumberFormat"
    .parameter "key"
    .parameter "needCheckBox"

    .prologue
    .line 63
    const/4 v11, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move-wide/from16 v8, p8

    move/from16 v10, p10

    invoke-direct/range {v0 .. v11}, Lcom/mediatek/gemini/SimInfoPreference;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIIIJZZ)V

    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIIIJZZ)V
    .locals 2
    .parameter "context"
    .parameter "name"
    .parameter "number"
    .parameter "simSlot"
    .parameter "status"
    .parameter "color"
    .parameter "displayNumberFormat"
    .parameter "key"
    .parameter "needCheckBox"
    .parameter "needStatus"

    .prologue
    const/4 v1, 0x1

    .line 153
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    iput-boolean v1, p0, Lcom/mediatek/gemini/SimInfoPreference;->mChecked:Z

    .line 28
    iput-boolean v1, p0, Lcom/mediatek/gemini/SimInfoPreference;->mNeedCheckbox:Z

    .line 29
    iput-boolean v1, p0, Lcom/mediatek/gemini/SimInfoPreference;->mNeedStatus:Z

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/gemini/SimInfoPreference;->mUseCheckBox:Z

    .line 154
    iput-object p2, p0, Lcom/mediatek/gemini/SimInfoPreference;->mName:Ljava/lang/String;

    .line 155
    iput-object p3, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    .line 156
    iput p4, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSlotIndex:I

    .line 157
    iput p5, p0, Lcom/mediatek/gemini/SimInfoPreference;->mStatus:I

    .line 158
    iput p6, p0, Lcom/mediatek/gemini/SimInfoPreference;->mColor:I

    .line 159
    iput p7, p0, Lcom/mediatek/gemini/SimInfoPreference;->mNumDisplayFormat:I

    .line 160
    iput-boolean p10, p0, Lcom/mediatek/gemini/SimInfoPreference;->mNeedCheckbox:Z

    .line 161
    iput-boolean p11, p0, Lcom/mediatek/gemini/SimInfoPreference;->mNeedStatus:Z

    .line 162
    iput-object p1, p0, Lcom/mediatek/gemini/SimInfoPreference;->mContext:Landroid/content/Context;

    .line 163
    invoke-static {p8, p9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/gemini/SimInfoPreference;->setKey(Ljava/lang/String;)V

    .line 165
    const v0, 0x7f040072

    invoke-virtual {p0, v0}, Lcom/mediatek/gemini/SimInfoPreference;->setLayoutResource(I)V

    .line 167
    iget-object v0, p0, Lcom/mediatek/gemini/SimInfoPreference;->mName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/mediatek/gemini/SimInfoPreference;->mName:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/mediatek/gemini/SimInfoPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 170
    :cond_0
    iget-object v0, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_1

    .line 171
    iget-object v0, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/mediatek/gemini/SimInfoPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 175
    :cond_1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIIIJZZZ)V
    .locals 2
    .parameter "context"
    .parameter "name"
    .parameter "number"
    .parameter "simSlot"
    .parameter "status"
    .parameter "color"
    .parameter "displayNumberFormat"
    .parameter "key"
    .parameter "needCheckBox"
    .parameter "needStatus"
    .parameter "useCheckBox"

    .prologue
    const/4 v1, 0x1

    .line 101
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    iput-boolean v1, p0, Lcom/mediatek/gemini/SimInfoPreference;->mChecked:Z

    .line 28
    iput-boolean v1, p0, Lcom/mediatek/gemini/SimInfoPreference;->mNeedCheckbox:Z

    .line 29
    iput-boolean v1, p0, Lcom/mediatek/gemini/SimInfoPreference;->mNeedStatus:Z

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/gemini/SimInfoPreference;->mUseCheckBox:Z

    .line 102
    iput-object p2, p0, Lcom/mediatek/gemini/SimInfoPreference;->mName:Ljava/lang/String;

    .line 103
    iput-object p3, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    .line 104
    iput p4, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSlotIndex:I

    .line 105
    iput p5, p0, Lcom/mediatek/gemini/SimInfoPreference;->mStatus:I

    .line 106
    iput p6, p0, Lcom/mediatek/gemini/SimInfoPreference;->mColor:I

    .line 107
    iput p7, p0, Lcom/mediatek/gemini/SimInfoPreference;->mNumDisplayFormat:I

    .line 108
    iput-boolean p10, p0, Lcom/mediatek/gemini/SimInfoPreference;->mNeedCheckbox:Z

    .line 109
    iput-boolean p11, p0, Lcom/mediatek/gemini/SimInfoPreference;->mNeedStatus:Z

    .line 110
    iput-object p1, p0, Lcom/mediatek/gemini/SimInfoPreference;->mContext:Landroid/content/Context;

    .line 111
    iput-boolean p12, p0, Lcom/mediatek/gemini/SimInfoPreference;->mUseCheckBox:Z

    .line 112
    invoke-static {p8, p9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/gemini/SimInfoPreference;->setKey(Ljava/lang/String;)V

    .line 114
    const v0, 0x7f040073

    invoke-virtual {p0, v0}, Lcom/mediatek/gemini/SimInfoPreference;->setLayoutResource(I)V

    .line 116
    iget-object v0, p0, Lcom/mediatek/gemini/SimInfoPreference;->mName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 117
    iget-object v0, p0, Lcom/mediatek/gemini/SimInfoPreference;->mName:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/mediatek/gemini/SimInfoPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 119
    :cond_0
    iget-object v0, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_1

    .line 120
    iget-object v0, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/mediatek/gemini/SimInfoPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 124
    :cond_1
    return-void
.end method


# virtual methods
.method getCheck()Z
    .locals 1

    .prologue
    .line 275
    iget-boolean v0, p0, Lcom/mediatek/gemini/SimInfoPreference;->mChecked:Z

    return v0
.end method

.method public getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 11
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 179
    invoke-super {p0, p1, p2}, Landroid/preference/Preference;->getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    .line 180
    .local v6, view:Landroid/view/View;
    const v8, 0x1020016

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 181
    .local v5, textTitle:Landroid/widget/TextView;
    if-eqz v5, :cond_0

    iget-object v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mName:Ljava/lang/String;

    if-eqz v8, :cond_0

    .line 182
    iget-object v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mName:Ljava/lang/String;

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    :cond_0
    const v8, 0x1020010

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 185
    .local v3, textNum:Landroid/widget/TextView;
    if-eqz v3, :cond_2

    .line 186
    iget-object v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    if-eqz v8, :cond_7

    iget-object v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_7

    .line 187
    invoke-virtual {v3}, Landroid/widget/TextView;->isShown()Z

    move-result v8

    if-nez v8, :cond_1

    .line 188
    const/4 v8, 0x0

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 190
    :cond_1
    iget-object v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 195
    :cond_2
    :goto_0
    const v8, 0x7f080119

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 196
    .local v1, imageStatus:Landroid/widget/ImageView;
    if-eqz v1, :cond_3

    .line 197
    iget-boolean v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mNeedStatus:Z

    if-eqz v8, :cond_9

    .line 198
    iget v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mStatus:I

    invoke-static {v8}, Lcom/mediatek/gemini/GeminiUtils;->getStatusResource(I)I

    move-result v2

    .line 199
    .local v2, res:I
    const/4 v8, -0x1

    if-ne v2, v8, :cond_8

    .line 200
    const/16 v8, 0x8

    invoke-virtual {v1, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 208
    .end local v2           #res:I
    :cond_3
    :goto_1
    const v8, 0x7f080118

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/RelativeLayout;

    .line 210
    .local v7, viewSim:Landroid/widget/RelativeLayout;
    if-eqz v7, :cond_4

    .line 211
    iget v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mColor:I

    invoke-static {v8}, Lcom/mediatek/gemini/GeminiUtils;->getSimColorResource(I)I

    move-result v2

    .line 213
    .restart local v2       #res:I
    if-gez v2, :cond_a

    .line 214
    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 219
    .end local v2           #res:I
    :cond_4
    :goto_2
    const-string v8, "SimInfoPreference"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "mUseCheckBox="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-boolean v10, p0, Lcom/mediatek/gemini/SimInfoPreference;->mUseCheckBox:Z

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " mChecked="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-boolean v10, p0, Lcom/mediatek/gemini/SimInfoPreference;->mChecked:Z

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    iget-boolean v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mUseCheckBox:Z

    if-nez v8, :cond_c

    .line 221
    const v8, 0x7f08011c

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    .line 222
    .local v0, ckRadioOn:Landroid/widget/Switch;
    if-eqz v0, :cond_5

    .line 223
    iget-boolean v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mNeedCheckbox:Z

    if-eqz v8, :cond_b

    .line 224
    iget-boolean v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mChecked:Z

    invoke-virtual {v0, v8}, Landroid/widget/Switch;->setChecked(Z)V

    .line 241
    .end local v0           #ckRadioOn:Landroid/widget/Switch;
    :cond_5
    :goto_3
    const v8, 0x7f08011a

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 242
    .local v4, textNumForShort:Landroid/widget/TextView;
    if-eqz v3, :cond_6

    iget-object v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    if-eqz v8, :cond_6

    .line 243
    iget v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mNumDisplayFormat:I

    packed-switch v8, :pswitch_data_0

    .line 266
    :cond_6
    :goto_4
    return-object v6

    .line 192
    .end local v1           #imageStatus:Landroid/widget/ImageView;
    .end local v4           #textNumForShort:Landroid/widget/TextView;
    .end local v7           #viewSim:Landroid/widget/RelativeLayout;
    :cond_7
    const/16 v8, 0x8

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_0

    .line 202
    .restart local v1       #imageStatus:Landroid/widget/ImageView;
    .restart local v2       #res:I
    :cond_8
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1

    .line 205
    .end local v2           #res:I
    :cond_9
    const/16 v8, 0x8

    invoke-virtual {v1, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1

    .line 216
    .restart local v2       #res:I
    .restart local v7       #viewSim:Landroid/widget/RelativeLayout;
    :cond_a
    invoke-virtual {v7, v2}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    goto :goto_2

    .line 226
    .end local v2           #res:I
    .restart local v0       #ckRadioOn:Landroid/widget/Switch;
    :cond_b
    const/16 v8, 0x8

    invoke-virtual {v0, v8}, Landroid/widget/Switch;->setVisibility(I)V

    goto :goto_3

    .line 230
    .end local v0           #ckRadioOn:Landroid/widget/Switch;
    :cond_c
    const v8, 0x7f08011c

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 232
    .local v0, ckRadioOn:Landroid/widget/CheckBox;
    if-eqz v0, :cond_5

    .line 233
    iget-boolean v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mNeedCheckbox:Z

    if-eqz v8, :cond_d

    .line 234
    iget-boolean v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mChecked:Z

    invoke-virtual {v0, v8}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto :goto_3

    .line 236
    :cond_d
    const/16 v8, 0x8

    invoke-virtual {v0, v8}, Landroid/widget/CheckBox;->setVisibility(I)V

    goto :goto_3

    .line 245
    .end local v0           #ckRadioOn:Landroid/widget/CheckBox;
    .restart local v4       #textNumForShort:Landroid/widget/TextView;
    :pswitch_0
    const/16 v8, 0x8

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_4

    .line 248
    :pswitch_1
    iget-object v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    const/4 v9, 0x4

    if-lt v8, v9, :cond_e

    .line 249
    iget-object v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    const/4 v9, 0x0

    const/4 v10, 0x4

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_4

    .line 251
    :cond_e
    iget-object v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_4

    .line 255
    :pswitch_2
    iget-object v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    const/4 v9, 0x4

    if-lt v8, v9, :cond_f

    .line 256
    iget-object v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    iget-object v9, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x4

    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_4

    .line 259
    :cond_f
    iget-object v8, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_4

    .line 243
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method setCheck(Z)V
    .locals 0
    .parameter "bCheck"

    .prologue
    .line 270
    iput-boolean p1, p0, Lcom/mediatek/gemini/SimInfoPreference;->mChecked:Z

    .line 271
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoPreference;->notifyChanged()V

    .line 272
    return-void
.end method

.method setColor(I)V
    .locals 0
    .parameter "color"

    .prologue
    .line 291
    iput p1, p0, Lcom/mediatek/gemini/SimInfoPreference;->mColor:I

    .line 292
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoPreference;->notifyChanged()V

    .line 293
    return-void
.end method

.method setName(Ljava/lang/String;)V
    .locals 0
    .parameter "name"

    .prologue
    .line 285
    iput-object p1, p0, Lcom/mediatek/gemini/SimInfoPreference;->mName:Ljava/lang/String;

    .line 286
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoPreference;->notifyChanged()V

    .line 288
    return-void
.end method

.method public setNeedCheckBox(Z)V
    .locals 0
    .parameter "isNeed"

    .prologue
    .line 311
    iput-boolean p1, p0, Lcom/mediatek/gemini/SimInfoPreference;->mNeedCheckbox:Z

    .line 312
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoPreference;->notifyChanged()V

    .line 313
    return-void
.end method

.method setNumDisplayFormat(I)V
    .locals 0
    .parameter "format"

    .prologue
    .line 296
    iput p1, p0, Lcom/mediatek/gemini/SimInfoPreference;->mNumDisplayFormat:I

    .line 297
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoPreference;->notifyChanged()V

    .line 298
    return-void
.end method

.method setNumber(Ljava/lang/String;)V
    .locals 0
    .parameter "number"

    .prologue
    .line 301
    iput-object p1, p0, Lcom/mediatek/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    .line 302
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoPreference;->notifyChanged()V

    .line 303
    return-void
.end method

.method setStatus(I)V
    .locals 0
    .parameter "status"

    .prologue
    .line 280
    iput p1, p0, Lcom/mediatek/gemini/SimInfoPreference;->mStatus:I

    .line 281
    invoke-virtual {p0}, Lcom/mediatek/gemini/SimInfoPreference;->notifyChanged()V

    .line 282
    return-void
.end method
