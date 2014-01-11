.class public Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;
.super Landroid/preference/Preference;
.source "SimInfoPreference.java"


# static fields
.field private static final DISPLAY_FIRST_FOUR:I = 0x1

.field private static final DISPLAY_LAST_FOUR:I = 0x2

.field private static final DISPLAY_NONE:I = 0x0

.field private static final TAG:Ljava/lang/String; = "SimInfoPreference"

.field private static sListenerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mediatek/oobe/basic/ImportContactsActivity;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mChecked:Z

.field private mColor:I

.field private mContext:Landroid/content/Context;

.field private mFinishImporting:Z

.field private mIsImporting:Z

.field private mName:Ljava/lang/String;

.field private mNeedCheckbox:Z

.field private mNeedStatus:Z

.field private mNumDisplayFormat:I

.field private mProgressCurrNum:I

.field private mProgressTotalCount:I

.field private mSimNum:Ljava/lang/String;

.field protected final mSlotIndex:I

.field private mStatus:I

.field private mTextImportingProgress:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 410
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->sListenerList:Ljava/util/List;

    return-void
.end method

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
    .line 98
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

    invoke-direct/range {v0 .. v11}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIIIJZZ)V

    .line 100
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIIIJZZ)V
    .locals 3
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
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 118
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 68
    iput-boolean v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mChecked:Z

    .line 69
    iput-boolean v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mNeedCheckbox:Z

    .line 70
    iput-boolean v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mNeedStatus:Z

    .line 77
    iput v1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mProgressCurrNum:I

    .line 78
    iput v1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mProgressTotalCount:I

    .line 79
    const-string v0, ""

    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mTextImportingProgress:Ljava/lang/String;

    .line 81
    iput-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mIsImporting:Z

    .line 82
    iput-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mFinishImporting:Z

    .line 119
    iput-object p2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mName:Ljava/lang/String;

    .line 120
    iput-object p3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    .line 121
    iput p4, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSlotIndex:I

    .line 122
    iput p5, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mStatus:I

    .line 123
    iput p6, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mColor:I

    .line 124
    iput p7, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mNumDisplayFormat:I

    .line 125
    iput-boolean p10, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mNeedCheckbox:Z

    .line 126
    iput-boolean p11, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mNeedStatus:Z

    .line 127
    iput-object p1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mContext:Landroid/content/Context;

    .line 128
    invoke-static {p8, p9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setKey(Ljava/lang/String;)V

    .line 129
    if-eqz p10, :cond_2

    .line 130
    const v0, 0x7f03000d

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setLayoutResource(I)V

    .line 135
    :goto_0
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 136
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mName:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 138
    :cond_0
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_1

    .line 139
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 143
    :cond_1
    return-void

    .line 132
    :cond_2
    const v0, 0x7f030011

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setLayoutResource(I)V

    goto :goto_0
.end method

.method private notifyCallback()V
    .locals 4

    .prologue
    .line 413
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    sget-object v2, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->sListenerList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 414
    sget-object v2, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->sListenerList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;

    .line 415
    .local v0, activity:Lcom/mediatek/oobe/basic/ImportContactsActivity;
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mContext:Landroid/content/Context;

    if-ne v0, v2, :cond_0

    .line 416
    const-string v2, "SimInfoPreference"

    const-string v3, "Contact Import callback============self, do not notify=========="

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 413
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 419
    :cond_0
    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->refreshProgress()V

    goto :goto_1

    .line 421
    .end local v0           #activity:Lcom/mediatek/oobe/basic/ImportContactsActivity;
    :cond_1
    return-void
.end method

.method private notifyCancelImport()V
    .locals 4

    .prologue
    .line 424
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    sget-object v2, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->sListenerList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 425
    sget-object v2, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->sListenerList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/oobe/basic/ImportContactsActivity;

    .line 426
    .local v0, activity:Lcom/mediatek/oobe/basic/ImportContactsActivity;
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mContext:Landroid/content/Context;

    if-ne v0, v2, :cond_0

    .line 427
    const-string v2, "SimInfoPreference"

    const-string v3, "Contact Import cancel importing============self, do not notify=========="

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 424
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 430
    :cond_0
    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->refreshCancel()V

    goto :goto_1

    .line 432
    .end local v0           #activity:Lcom/mediatek/oobe/basic/ImportContactsActivity;
    :cond_1
    return-void
.end method

.method public static registerCallback(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 441
    sget-object v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->sListenerList:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 442
    return-void
.end method

.method public static unregisterCallback(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 451
    sget-object v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->sListenerList:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 452
    return-void
.end method


# virtual methods
.method public dealWithCancel()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 404
    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mFinishImporting:Z

    .line 405
    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mIsImporting:Z

    .line 406
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->notifyChanged()V

    .line 407
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->notifyCancelImport()V

    .line 408
    return-void
.end method

.method public finishProgressBar()V
    .locals 1

    .prologue
    .line 392
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mFinishImporting:Z

    if-eqz v0, :cond_0

    .line 398
    :goto_0
    return-void

    .line 395
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mFinishImporting:Z

    .line 396
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->notifyChanged()V

    .line 397
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->notifyCallback()V

    goto :goto_0
.end method

.method public getCheck()Z
    .locals 1

    .prologue
    .line 272
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mChecked:Z

    return v0
.end method

.method public getSlotIndex()I
    .locals 1

    .prologue
    .line 314
    iget v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSlotIndex:I

    return v0
.end method

.method public getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 18
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 148
    invoke-super/range {p0 .. p2}, Landroid/preference/Preference;->getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v13

    .line 150
    .local v13, view:Landroid/view/View;
    const v15, 0x1020016

    invoke-virtual {v13, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    .line 152
    .local v12, textTitle:Landroid/widget/TextView;
    if-eqz v12, :cond_0

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mName:Ljava/lang/String;

    if-eqz v15, :cond_0

    .line 153
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mName:Ljava/lang/String;

    invoke-virtual {v12, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 156
    :cond_0
    const v15, 0x1020010

    invoke-virtual {v13, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 157
    .local v10, textNum:Landroid/widget/TextView;
    if-eqz v10, :cond_1

    .line 158
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    if-eqz v15, :cond_b

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v15

    if-eqz v15, :cond_b

    .line 159
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {v10, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 167
    :cond_1
    :goto_0
    const v15, 0x7f0b001e

    invoke-virtual {v13, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 169
    .local v3, imageStatus:Landroid/widget/ImageView;
    if-eqz v3, :cond_2

    .line 171
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mNeedStatus:Z

    if-eqz v15, :cond_d

    .line 172
    move-object/from16 v0, p0

    iget v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mStatus:I

    invoke-static {v15}, Lcom/mediatek/oobe/basic/gemini/GeminiUtils;->getStatusResource(I)I

    move-result v7

    .line 174
    .local v7, res:I
    const/4 v15, -0x1

    if-ne v7, v15, :cond_c

    .line 175
    const/16 v15, 0x8

    invoke-virtual {v3, v15}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 184
    .end local v7           #res:I
    :cond_2
    :goto_1
    const v15, 0x7f0b001d

    invoke-virtual {v13, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/RelativeLayout;

    .line 186
    .local v14, viewSim:Landroid/widget/RelativeLayout;
    if-eqz v14, :cond_3

    .line 188
    move-object/from16 v0, p0

    iget v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mColor:I

    invoke-static {v15}, Lcom/mediatek/oobe/basic/gemini/GeminiUtils;->getSimColorResource(I)I

    move-result v7

    .line 190
    .restart local v7       #res:I
    if-gez v7, :cond_e

    .line 191
    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/widget/RelativeLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 199
    .end local v7           #res:I
    :cond_3
    :goto_2
    const v15, 0x7f0b0023

    invoke-virtual {v13, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    .line 200
    .local v1, ckRadioOn:Landroid/widget/CheckBox;
    const-string v15, "SimInfoPreference"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "ckRadioOn.setChecked "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mChecked:Z

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    if-eqz v1, :cond_5

    .line 202
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mNeedCheckbox:Z

    if-eqz v15, :cond_10

    .line 203
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mChecked:Z

    invoke-virtual {v1, v15}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 204
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mFinishImporting:Z

    if-nez v15, :cond_4

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mIsImporting:Z

    if-eqz v15, :cond_f

    :cond_4
    const/16 v15, 0x8

    :goto_3
    invoke-virtual {v1, v15}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 210
    :cond_5
    :goto_4
    const/4 v2, 0x4

    .line 211
    .local v2, formatNum:I
    const v15, 0x7f0b001f

    invoke-virtual {v13, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    .line 212
    .local v11, textNumForShort:Landroid/widget/TextView;
    if-eqz v10, :cond_6

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    if-eqz v15, :cond_6

    .line 214
    move-object/from16 v0, p0

    iget v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mNumDisplayFormat:I

    packed-switch v15, :pswitch_data_0

    .line 237
    :cond_6
    :goto_5
    const-string v15, "SimInfoPreference"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "mNeedCheckbox: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mNeedCheckbox:Z

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mNeedCheckbox:Z

    if-eqz v15, :cond_a

    .line 239
    const v15, 0x7f0b0018

    invoke-virtual {v13, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ProgressBar;

    .line 240
    .local v4, importingProgressBar:Landroid/widget/ProgressBar;
    const v15, 0x7f0b0021

    invoke-virtual {v13, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 241
    .local v6, importingProgressTextView:Landroid/widget/TextView;
    const v15, 0x7f0b0022

    invoke-virtual {v13, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 242
    .local v5, importingProgressFlag:Landroid/widget/ImageView;
    const v15, 0x1020010

    invoke-virtual {v13, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 243
    .local v9, summaryView:Landroid/widget/TextView;
    if-nez v9, :cond_13

    const-string v8, ""

    .line 245
    .local v8, summaryStr:Ljava/lang/String;
    :goto_6
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mFinishImporting:Z

    if-eqz v15, :cond_14

    const/4 v15, 0x0

    :goto_7
    invoke-virtual {v5, v15}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 246
    if-eqz v9, :cond_9

    .line 247
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mIsImporting:Z

    if-eqz v15, :cond_7

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mFinishImporting:Z

    if-eqz v15, :cond_8

    :cond_7
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-eqz v15, :cond_15

    :cond_8
    const/16 v15, 0x8

    :goto_8
    invoke-virtual {v9, v15}, Landroid/widget/TextView;->setVisibility(I)V

    .line 251
    :cond_9
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mIsImporting:Z

    if-eqz v15, :cond_16

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mFinishImporting:Z

    if-nez v15, :cond_16

    .line 252
    const/4 v15, 0x0

    invoke-virtual {v4, v15}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 253
    move-object/from16 v0, p0

    iget v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mProgressTotalCount:I

    invoke-virtual {v4, v15}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 254
    move-object/from16 v0, p0

    iget v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mProgressCurrNum:I

    invoke-virtual {v4, v15}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 256
    const/4 v15, 0x0

    invoke-virtual {v6, v15}, Landroid/widget/TextView;->setVisibility(I)V

    .line 257
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mTextImportingProgress:Ljava/lang/String;

    invoke-virtual {v6, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 263
    .end local v4           #importingProgressBar:Landroid/widget/ProgressBar;
    .end local v5           #importingProgressFlag:Landroid/widget/ImageView;
    .end local v6           #importingProgressTextView:Landroid/widget/TextView;
    .end local v8           #summaryStr:Ljava/lang/String;
    .end local v9           #summaryView:Landroid/widget/TextView;
    :cond_a
    :goto_9
    return-object v13

    .line 163
    .end local v1           #ckRadioOn:Landroid/widget/CheckBox;
    .end local v2           #formatNum:I
    .end local v3           #imageStatus:Landroid/widget/ImageView;
    .end local v11           #textNumForShort:Landroid/widget/TextView;
    .end local v14           #viewSim:Landroid/widget/RelativeLayout;
    :cond_b
    const/16 v15, 0x8

    invoke-virtual {v10, v15}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_0

    .line 177
    .restart local v3       #imageStatus:Landroid/widget/ImageView;
    .restart local v7       #res:I
    :cond_c
    invoke-virtual {v3, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_1

    .line 180
    .end local v7           #res:I
    :cond_d
    const/16 v15, 0x8

    invoke-virtual {v3, v15}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_1

    .line 193
    .restart local v7       #res:I
    .restart local v14       #viewSim:Landroid/widget/RelativeLayout;
    :cond_e
    invoke-virtual {v14, v7}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    goto/16 :goto_2

    .line 204
    .end local v7           #res:I
    .restart local v1       #ckRadioOn:Landroid/widget/CheckBox;
    :cond_f
    const/4 v15, 0x0

    goto/16 :goto_3

    .line 206
    :cond_10
    const/16 v15, 0x8

    invoke-virtual {v1, v15}, Landroid/widget/CheckBox;->setVisibility(I)V

    goto/16 :goto_4

    .line 216
    .restart local v2       #formatNum:I
    .restart local v11       #textNumForShort:Landroid/widget/TextView;
    :pswitch_0
    const/16 v15, 0x8

    invoke-virtual {v11, v15}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_5

    .line 219
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v15

    const/16 v16, 0x4

    move/from16 v0, v16

    if-lt v15, v0, :cond_11

    .line 220
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    const/16 v16, 0x0

    const/16 v17, 0x4

    invoke-virtual/range {v15 .. v17}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v11, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_5

    .line 222
    :cond_11
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {v11, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_5

    .line 226
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v15

    const/16 v16, 0x4

    move/from16 v0, v16

    if-lt v15, v0, :cond_12

    .line 227
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v16

    add-int/lit8 v16, v16, -0x4

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v11, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_5

    .line 229
    :cond_12
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    invoke-virtual {v11, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_5

    .line 243
    .restart local v4       #importingProgressBar:Landroid/widget/ProgressBar;
    .restart local v5       #importingProgressFlag:Landroid/widget/ImageView;
    .restart local v6       #importingProgressTextView:Landroid/widget/TextView;
    .restart local v9       #summaryView:Landroid/widget/TextView;
    :cond_13
    invoke-virtual {v9}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_6

    .line 245
    .restart local v8       #summaryStr:Ljava/lang/String;
    :cond_14
    const/16 v15, 0x8

    goto/16 :goto_7

    .line 247
    :cond_15
    const/4 v15, 0x0

    goto/16 :goto_8

    .line 259
    :cond_16
    const/16 v15, 0x8

    invoke-virtual {v4, v15}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 260
    const/16 v15, 0x8

    invoke-virtual {v6, v15}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_9

    .line 214
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public incrementProgressTo(I)V
    .locals 4
    .parameter "newProgress"

    .prologue
    .line 380
    const-string v0, "SimInfoPreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "--incrementProgressTo "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    iput p1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mProgressCurrNum:I

    .line 382
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f09006e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mProgressCurrNum:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mProgressTotalCount:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mTextImportingProgress:Ljava/lang/String;

    .line 384
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->notifyChanged()V

    .line 385
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->notifyCallback()V

    .line 386
    return-void
.end method

.method public initProgressBar(I)V
    .locals 3
    .parameter "totalCount"

    .prologue
    .line 363
    const-string v0, "SimInfoPreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "--initProgressBar, totalCount="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mIsImporting:Z

    .line 365
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mContext:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 366
    const-string v0, "SimInfoPreference"

    const-string v1, "mContext is null"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 367
    :cond_0
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f09006f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mTextImportingProgress:Ljava/lang/String;

    .line 368
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mProgressCurrNum:I

    .line 369
    iput p1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mProgressTotalCount:I

    .line 370
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->notifyChanged()V

    .line 371
    return-void
.end method

.method public isFinishImporting()Z
    .locals 1

    .prologue
    .line 342
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mFinishImporting:Z

    return v0
.end method

.method public isImporting()Z
    .locals 1

    .prologue
    .line 322
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mIsImporting:Z

    return v0
.end method

.method public setCheck(Z)V
    .locals 0
    .parameter "bCheck"

    .prologue
    .line 267
    iput-boolean p1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mChecked:Z

    .line 268
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->notifyChanged()V

    .line 269
    return-void
.end method

.method public setColor(I)V
    .locals 0
    .parameter "color"

    .prologue
    .line 288
    iput p1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mColor:I

    .line 289
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->notifyChanged()V

    .line 290
    return-void
.end method

.method public setFinishImporting(Z)V
    .locals 0
    .parameter "finish"

    .prologue
    .line 352
    iput-boolean p1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mFinishImporting:Z

    .line 353
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->notifyChanged()V

    .line 354
    return-void
.end method

.method public setImporting(Z)V
    .locals 0
    .parameter "isImporting"

    .prologue
    .line 332
    iput-boolean p1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mIsImporting:Z

    .line 333
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->notifyChanged()V

    .line 334
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .parameter "name"

    .prologue
    .line 282
    iput-object p1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mName:Ljava/lang/String;

    .line 283
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->notifyChanged()V

    .line 285
    return-void
.end method

.method public setNeedCheckBox(Z)V
    .locals 0
    .parameter "isNeed"

    .prologue
    .line 304
    iput-boolean p1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mNeedCheckbox:Z

    .line 305
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->notifyChanged()V

    .line 306
    return-void
.end method

.method public setNumDisplayFormat(I)V
    .locals 0
    .parameter "format"

    .prologue
    .line 293
    iput p1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mNumDisplayFormat:I

    .line 294
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->notifyChanged()V

    .line 295
    return-void
.end method

.method public setNumber(Ljava/lang/String;)V
    .locals 0
    .parameter "number"

    .prologue
    .line 298
    iput-object p1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mSimNum:Ljava/lang/String;

    .line 299
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->notifyChanged()V

    .line 300
    return-void
.end method

.method public setStatus(I)V
    .locals 0
    .parameter "status"

    .prologue
    .line 277
    iput p1, p0, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->mStatus:I

    .line 278
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->notifyChanged()V

    .line 279
    return-void
.end method
