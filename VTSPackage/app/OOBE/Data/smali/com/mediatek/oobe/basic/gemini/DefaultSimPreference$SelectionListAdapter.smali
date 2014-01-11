.class Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;
.super Landroid/widget/BaseAdapter;
.source "DefaultSimPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SelectionListAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field mSimItemList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mediatek/oobe/basic/gemini/SimItem;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;


# direct methods
.method public constructor <init>(Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;Ljava/util/List;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mediatek/oobe/basic/gemini/SimItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 245
    .local p2, simItemList:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/oobe/basic/gemini/SimItem;>;"
    iput-object p1, p0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;->this$0:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 246
    iput-object p2, p0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;->mSimItemList:Ljava/util/List;

    .line 247
    return-void
.end method

.method private setImageSim(Landroid/widget/RelativeLayout;Lcom/mediatek/oobe/basic/gemini/SimItem;)V
    .locals 4
    .parameter "imageSim"
    .parameter "simItem"

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 353
    iget-boolean v1, p2, Lcom/mediatek/oobe/basic/gemini/SimItem;->mIsSim:Z

    if-eqz v1, :cond_1

    .line 354
    iget v1, p2, Lcom/mediatek/oobe/basic/gemini/SimItem;->mColor:I

    invoke-static {v1}, Lcom/mediatek/oobe/basic/gemini/GeminiUtils;->getSimColorResource(I)I

    move-result v0

    .line 355
    .local v0, resColor:I
    if-ltz v0, :cond_0

    .line 356
    invoke-virtual {p1, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 357
    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 366
    .end local v0           #resColor:I
    :cond_0
    :goto_0
    return-void

    .line 359
    :cond_1
    iget v1, p2, Lcom/mediatek/oobe/basic/gemini/SimItem;->mColor:I

    if-ne v1, v3, :cond_2

    .line 360
    invoke-virtual {p1, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 361
    const v1, 0x20200e6

    invoke-virtual {p1, v1}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    goto :goto_0

    .line 364
    :cond_2
    invoke-virtual {p1, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method private setImageStatus(Landroid/widget/ImageView;Lcom/mediatek/oobe/basic/gemini/SimItem;)V
    .locals 3
    .parameter "imageStatus"
    .parameter "simItem"

    .prologue
    const/16 v2, 0x8

    .line 338
    iget-boolean v1, p2, Lcom/mediatek/oobe/basic/gemini/SimItem;->mIsSim:Z

    if-eqz v1, :cond_1

    .line 339
    iget v1, p2, Lcom/mediatek/oobe/basic/gemini/SimItem;->mState:I

    invoke-static {v1}, Lcom/mediatek/oobe/basic/gemini/GeminiUtils;->getStatusResource(I)I

    move-result v0

    .line 340
    .local v0, res:I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 341
    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 350
    .end local v0           #res:I
    :goto_0
    return-void

    .line 343
    .restart local v0       #res:I
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 344
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 347
    .end local v0           #res:I
    :cond_1
    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method

.method private setNameAndNum(Landroid/widget/TextView;Landroid/widget/TextView;Lcom/mediatek/oobe/basic/gemini/SimItem;)V
    .locals 3
    .parameter "textName"
    .parameter "textNum"
    .parameter "simItem"

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 385
    iget-object v0, p3, Lcom/mediatek/oobe/basic/gemini/SimItem;->mName:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 386
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 391
    :goto_0
    iget-boolean v0, p3, Lcom/mediatek/oobe/basic/gemini/SimItem;->mIsSim:Z

    if-eqz v0, :cond_1

    iget-object v0, p3, Lcom/mediatek/oobe/basic/gemini/SimItem;->mNumber:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p3, Lcom/mediatek/oobe/basic/gemini/SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_1

    .line 393
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 394
    iget-object v0, p3, Lcom/mediatek/oobe/basic/gemini/SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 398
    :goto_1
    return-void

    .line 388
    :cond_0
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 389
    iget-object v0, p3, Lcom/mediatek/oobe/basic/gemini/SimItem;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 396
    :cond_1
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1
.end method

.method private setTextNumFormat(Landroid/widget/TextView;Lcom/mediatek/oobe/basic/gemini/SimItem;)V
    .locals 4
    .parameter "textNumFormat"
    .parameter "simItem"

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x4

    const/4 v1, 0x0

    .line 299
    iget-boolean v0, p2, Lcom/mediatek/oobe/basic/gemini/SimItem;->mIsSim:Z

    if-eqz v0, :cond_3

    .line 300
    iget-object v0, p2, Lcom/mediatek/oobe/basic/gemini/SimItem;->mNumber:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 301
    iget v0, p2, Lcom/mediatek/oobe/basic/gemini/SimItem;->mDispalyNumberFormat:I

    packed-switch v0, :pswitch_data_0

    .line 335
    :goto_0
    return-void

    .line 303
    :pswitch_0
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 306
    :pswitch_1
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 307
    iget-object v0, p2, Lcom/mediatek/oobe/basic/gemini/SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v2, :cond_0

    .line 308
    iget-object v0, p2, Lcom/mediatek/oobe/basic/gemini/SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 311
    :cond_0
    iget-object v0, p2, Lcom/mediatek/oobe/basic/gemini/SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 315
    :pswitch_2
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 316
    iget-object v0, p2, Lcom/mediatek/oobe/basic/gemini/SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v2, :cond_1

    .line 317
    iget-object v0, p2, Lcom/mediatek/oobe/basic/gemini/SimItem;->mNumber:Ljava/lang/String;

    iget-object v1, p2, Lcom/mediatek/oobe/basic/gemini/SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x4

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 321
    :cond_1
    iget-object v0, p2, Lcom/mediatek/oobe/basic/gemini/SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 328
    :cond_2
    const-string v0, "DefaultSimPreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "simItem.mNumber="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/mediatek/oobe/basic/gemini/SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 329
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 332
    :cond_3
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 301
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private setViewHolderId(Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;Landroid/view/View;)V
    .locals 1
    .parameter "holder"
    .parameter "convertView"

    .prologue
    .line 369
    const v0, 0x7f0b0029

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextName:Landroid/widget/TextView;

    .line 371
    const v0, 0x7f0b002a

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextNum:Landroid/widget/TextView;

    .line 373
    const v0, 0x7f0b0026

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p1, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mImageStatus:Landroid/widget/ImageView;

    .line 375
    const v0, 0x7f0b0027

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextNumFormat:Landroid/widget/TextView;

    .line 377
    const v0, 0x7f0b002b

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p1, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mCkRadioOn:Landroid/widget/RadioButton;

    .line 379
    const v0, 0x7f0b0025

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p1, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mImageSim:Landroid/widget/RelativeLayout;

    .line 381
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 250
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;->mSimItemList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "position"

    .prologue
    .line 254
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;->mSimItemList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "position"

    .prologue
    .line 258
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    const-wide/16 v8, -0x1

    const/4 v7, 0x2

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 264
    if-nez p2, :cond_3

    .line 265
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;->this$0:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    #getter for: Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->mFlater:Landroid/view/LayoutInflater;
    invoke-static {v2}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->access$000(Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v5, 0x7f030010

    const/4 v6, 0x0

    invoke-virtual {v2, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 267
    new-instance v0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;-><init>(Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;)V

    .line 268
    .local v0, holder:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;
    invoke-direct {p0, v0, p2}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;->setViewHolderId(Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;Landroid/view/View;)V

    .line 269
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 273
    :goto_0
    invoke-virtual {p0, p1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/oobe/basic/gemini/SimItem;

    .line 274
    .local v1, simItem:Lcom/mediatek/oobe/basic/gemini/SimItem;
    iget-object v2, v0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextName:Landroid/widget/TextView;

    iget-object v5, v0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextNum:Landroid/widget/TextView;

    invoke-direct {p0, v2, v5, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;->setNameAndNum(Landroid/widget/TextView;Landroid/widget/TextView;Lcom/mediatek/oobe/basic/gemini/SimItem;)V

    .line 275
    iget-object v2, v0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mImageSim:Landroid/widget/RelativeLayout;

    invoke-direct {p0, v2, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;->setImageSim(Landroid/widget/RelativeLayout;Lcom/mediatek/oobe/basic/gemini/SimItem;)V

    .line 276
    iget-object v2, v0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mImageStatus:Landroid/widget/ImageView;

    invoke-direct {p0, v2, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;->setImageStatus(Landroid/widget/ImageView;Lcom/mediatek/oobe/basic/gemini/SimItem;)V

    .line 277
    iget-object v2, v0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextNumFormat:Landroid/widget/TextView;

    invoke-direct {p0, v2, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;->setTextNumFormat(Landroid/widget/TextView;Lcom/mediatek/oobe/basic/gemini/SimItem;)V

    .line 278
    iget-object v5, v0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mCkRadioOn:Landroid/widget/RadioButton;

    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;->this$0:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    #getter for: Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->mSelected:I
    invoke-static {v2}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->access$100(Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;)I

    move-result v2

    if-ne v2, p1, :cond_4

    move v2, v3

    :goto_1
    invoke-virtual {v5, v2}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 279
    iget v2, v1, Lcom/mediatek/oobe/basic/gemini/SimItem;->mState:I

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;->this$0:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    #getter for: Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->mType:I
    invoke-static {v2}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->access$200(Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;)I

    move-result v2

    const/4 v5, 0x3

    if-ne v2, v5, :cond_0

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;->getCount()I

    move-result v2

    if-ne v2, v7, :cond_0

    iget-wide v5, v1, Lcom/mediatek/oobe/basic/gemini/SimItem;->mSimID:J

    cmp-long v2, v5, v8

    if-eqz v2, :cond_2

    :cond_0
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;->this$0:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    #getter for: Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->mType:I
    invoke-static {v2}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->access$200(Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;)I

    move-result v2

    if-ne v2, v3, :cond_5

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;->getCount()I

    move-result v2

    if-eq v2, v7, :cond_1

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter;->getCount()I

    move-result v2

    if-ne v2, v3, :cond_5

    :cond_1
    iget-wide v5, v1, Lcom/mediatek/oobe/basic/gemini/SimItem;->mSimID:J

    cmp-long v2, v5, v8

    if-nez v2, :cond_5

    .line 284
    :cond_2
    invoke-virtual {p2, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 285
    iget-object v2, v0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextName:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 286
    iget-object v2, v0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextNum:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 287
    iget-object v2, v0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mCkRadioOn:Landroid/widget/RadioButton;

    invoke-virtual {v2, v4}, Landroid/widget/RadioButton;->setEnabled(Z)V

    .line 295
    :goto_2
    return-object p2

    .line 271
    .end local v0           #holder:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;
    .end local v1           #simItem:Lcom/mediatek/oobe/basic/gemini/SimItem;
    :cond_3
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;

    .restart local v0       #holder:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;
    goto :goto_0

    .restart local v1       #simItem:Lcom/mediatek/oobe/basic/gemini/SimItem;
    :cond_4
    move v2, v4

    .line 278
    goto :goto_1

    .line 289
    :cond_5
    invoke-virtual {p2, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 290
    iget-object v2, v0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextName:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 291
    iget-object v2, v0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextNum:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 292
    iget-object v2, v0, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mCkRadioOn:Landroid/widget/RadioButton;

    invoke-virtual {v2, v3}, Landroid/widget/RadioButton;->setEnabled(Z)V

    goto :goto_2
.end method
