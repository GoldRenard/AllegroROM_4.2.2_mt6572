.class Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;
.super Landroid/widget/BaseAdapter;
.source "ServiceSelectList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/ServiceSelectList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SelectionListAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/ServiceSelectList;


# direct methods
.method public constructor <init>(Lcom/mediatek/settings/ServiceSelectList;Landroid/content/Context;)V
    .locals 0
    .parameter
    .parameter "ctx"

    .prologue
    .line 251
    iput-object p1, p0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;->this$0:Lcom/mediatek/settings/ServiceSelectList;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 253
    return-void
.end method

.method public constructor <init>(Lcom/mediatek/settings/ServiceSelectList;Ljava/util/List;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mediatek/settings/ServiceSelectList$SimItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 247
    .local p2, simItemList:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/settings/ServiceSelectList$SimItem;>;"
    iput-object p1, p0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;->this$0:Lcom/mediatek/settings/ServiceSelectList;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 248
    #setter for: Lcom/mediatek/settings/ServiceSelectList;->mSimItemList:Ljava/util/List;
    invoke-static {p1, p2}, Lcom/mediatek/settings/ServiceSelectList;->access$002(Lcom/mediatek/settings/ServiceSelectList;Ljava/util/List;)Ljava/util/List;

    .line 249
    return-void
.end method

.method private setImageSim(Landroid/widget/RelativeLayout;Lcom/mediatek/settings/ServiceSelectList$SimItem;)V
    .locals 4
    .parameter "imageSim"
    .parameter "simItem"

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 360
    iget-boolean v1, p2, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mIsSim:Z

    if-eqz v1, :cond_1

    .line 361
    iget v1, p2, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mColor:I

    invoke-static {v1}, Lcom/mediatek/phone/Utils;->getSimColorResource(I)I

    move-result v0

    .line 362
    .local v0, resColor:I
    if-ltz v0, :cond_0

    .line 363
    invoke-virtual {p1, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 364
    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 372
    .end local v0           #resColor:I
    :cond_0
    :goto_0
    return-void

    .line 366
    :cond_1
    iget v1, p2, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mColor:I

    if-ne v1, v3, :cond_2

    .line 367
    invoke-virtual {p1, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 368
    const v1, 0x20200e6

    invoke-virtual {p1, v1}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    goto :goto_0

    .line 370
    :cond_2
    invoke-virtual {p1, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method private setImageStatus(Landroid/widget/ImageView;Lcom/mediatek/settings/ServiceSelectList$SimItem;)V
    .locals 6
    .parameter "imageStatus"
    .parameter "simItem"

    .prologue
    const/16 v5, 0x8

    .line 342
    :try_start_0
    const-string v3, "phone"

    invoke-static {v3}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v1

    .line 343
    .local v1, iTelephony:Lcom/android/internal/telephony/ITelephony;
    if-eqz p1, :cond_1

    if-eqz v1, :cond_1

    .line 344
    const/4 v2, -0x1

    .line 345
    .local v2, res:I
    iget v3, p2, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mSlot:I

    if-ltz v3, :cond_0

    .line 346
    iget-object v3, p0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;->this$0:Lcom/mediatek/settings/ServiceSelectList;

    iget v4, p2, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mSlot:I

    invoke-interface {v1, v4}, Lcom/android/internal/telephony/ITelephony;->getSimIndicatorStateGemini(I)I

    move-result v4

    #calls: Lcom/mediatek/settings/ServiceSelectList;->getSimStatusImge(I)I
    invoke-static {v3, v4}, Lcom/mediatek/settings/ServiceSelectList;->access$300(Lcom/mediatek/settings/ServiceSelectList;I)I

    move-result v2

    .line 348
    :cond_0
    const/4 v3, -0x1

    if-ne v2, v3, :cond_2

    .line 349
    const/16 v3, 0x8

    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 358
    .end local v1           #iTelephony:Lcom/android/internal/telephony/ITelephony;
    .end local v2           #res:I
    :cond_1
    :goto_0
    return-void

    .line 351
    .restart local v1       #iTelephony:Lcom/android/internal/telephony/ITelephony;
    .restart local v2       #res:I
    :cond_2
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 352
    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setImageResource(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 355
    .end local v1           #iTelephony:Lcom/android/internal/telephony/ITelephony;
    .end local v2           #res:I
    :catch_0
    move-exception v0

    .line 356
    .local v0, e:Landroid/os/RemoteException;
    invoke-virtual {p1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method

.method private setNameAndNum(Landroid/widget/TextView;Landroid/widget/TextView;Lcom/mediatek/settings/ServiceSelectList$SimItem;)V
    .locals 3
    .parameter "textName"
    .parameter "textNum"
    .parameter "simItem"

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 384
    iget-object v0, p3, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 385
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 386
    iget-object v0, p3, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 391
    :goto_0
    iget-boolean v0, p3, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mIsSim:Z

    if-eqz v0, :cond_1

    iget-object v0, p3, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mNumber:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p3, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_1

    .line 392
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 393
    iget-object v0, p3, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 397
    :goto_1
    return-void

    .line 388
    :cond_0
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 395
    :cond_1
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1
.end method

.method private setTextNumFormat(Landroid/widget/TextView;Lcom/mediatek/settings/ServiceSelectList$SimItem;)V
    .locals 3
    .parameter "textNumFormat"
    .parameter "simItem"

    .prologue
    const/4 v2, 0x4

    const/4 v1, 0x0

    .line 310
    iget-boolean v0, p2, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mIsSim:Z

    if-eqz v0, :cond_0

    .line 311
    iget-object v0, p2, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mNumber:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 312
    iget v0, p2, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mDispalyNumberFormat:I

    packed-switch v0, :pswitch_data_0

    .line 339
    :cond_0
    :goto_0
    return-void

    .line 314
    :pswitch_0
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 317
    :pswitch_1
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 318
    iget-object v0, p2, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v2, :cond_1

    .line 319
    iget-object v0, p2, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 321
    :cond_1
    iget-object v0, p2, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 325
    :pswitch_2
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 326
    iget-object v0, p2, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v2, :cond_2

    .line 327
    iget-object v0, p2, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mNumber:Ljava/lang/String;

    iget-object v1, p2, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x4

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 330
    :cond_2
    iget-object v0, p2, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 312
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private setViewHolderId(Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;Landroid/view/View;)V
    .locals 1
    .parameter "holder"
    .parameter "convertView"

    .prologue
    .line 375
    const v0, 0x7f0800dc

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mTextName:Landroid/widget/TextView;

    .line 376
    const v0, 0x7f0800dd

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mTextNum:Landroid/widget/TextView;

    .line 377
    const v0, 0x7f0800d9

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p1, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mImageStatus:Landroid/widget/ImageView;

    .line 378
    const v0, 0x7f0800da

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mTextNumFormat:Landroid/widget/TextView;

    .line 379
    const v0, 0x7f0800de

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p1, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mCkRadioOn:Landroid/widget/RadioButton;

    .line 380
    const v0, 0x7f0800d8

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p1, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mImageSim:Landroid/widget/RelativeLayout;

    .line 381
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 256
    iget-object v0, p0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;->this$0:Lcom/mediatek/settings/ServiceSelectList;

    #getter for: Lcom/mediatek/settings/ServiceSelectList;->mSimItemList:Ljava/util/List;
    invoke-static {v0}, Lcom/mediatek/settings/ServiceSelectList;->access$000(Lcom/mediatek/settings/ServiceSelectList;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getHas3GService()I
    .locals 4

    .prologue
    .line 268
    const/4 v1, -0x1

    .line 269
    .local v1, index:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v3, p0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;->this$0:Lcom/mediatek/settings/ServiceSelectList;

    #getter for: Lcom/mediatek/settings/ServiceSelectList;->mSimItemList:Ljava/util/List;
    invoke-static {v3}, Lcom/mediatek/settings/ServiceSelectList;->access$000(Lcom/mediatek/settings/ServiceSelectList;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 270
    iget-object v3, p0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;->this$0:Lcom/mediatek/settings/ServiceSelectList;

    #getter for: Lcom/mediatek/settings/ServiceSelectList;->mSimItemList:Ljava/util/List;
    invoke-static {v3}, Lcom/mediatek/settings/ServiceSelectList;->access$000(Lcom/mediatek/settings/ServiceSelectList;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/settings/ServiceSelectList$SimItem;

    .line 271
    .local v2, item:Lcom/mediatek/settings/ServiceSelectList$SimItem;
    iget-boolean v3, v2, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mHas3GCapability:Z

    if-eqz v3, :cond_1

    .line 272
    move v1, v0

    .line 276
    .end local v2           #item:Lcom/mediatek/settings/ServiceSelectList$SimItem;
    :cond_0
    return v1

    .line 269
    .restart local v2       #item:Lcom/mediatek/settings/ServiceSelectList$SimItem;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "position"

    .prologue
    .line 260
    iget-object v0, p0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;->this$0:Lcom/mediatek/settings/ServiceSelectList;

    #getter for: Lcom/mediatek/settings/ServiceSelectList;->mSimItemList:Ljava/util/List;
    invoke-static {v0}, Lcom/mediatek/settings/ServiceSelectList;->access$000(Lcom/mediatek/settings/ServiceSelectList;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "position"

    .prologue
    .line 264
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 281
    if-nez p2, :cond_0

    .line 282
    iget-object v2, p0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;->this$0:Lcom/mediatek/settings/ServiceSelectList;

    #getter for: Lcom/mediatek/settings/ServiceSelectList;->mFlater:Landroid/view/LayoutInflater;
    invoke-static {v2}, Lcom/mediatek/settings/ServiceSelectList;->access$100(Lcom/mediatek/settings/ServiceSelectList;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v5, 0x7f040035

    const/4 v6, 0x0

    invoke-virtual {v2, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 283
    new-instance v0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;-><init>(Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;)V

    .line 284
    .local v0, holder:Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;
    invoke-direct {p0, v0, p2}, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;->setViewHolderId(Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;Landroid/view/View;)V

    .line 285
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 289
    :goto_0
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/settings/ServiceSelectList$SimItem;

    .line 290
    .local v1, simItem:Lcom/mediatek/settings/ServiceSelectList$SimItem;
    iget-object v2, v0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mTextName:Landroid/widget/TextView;

    iget-object v5, v0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mTextNum:Landroid/widget/TextView;

    invoke-direct {p0, v2, v5, v1}, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;->setNameAndNum(Landroid/widget/TextView;Landroid/widget/TextView;Lcom/mediatek/settings/ServiceSelectList$SimItem;)V

    .line 291
    iget-object v2, v0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mImageSim:Landroid/widget/RelativeLayout;

    invoke-direct {p0, v2, v1}, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;->setImageSim(Landroid/widget/RelativeLayout;Lcom/mediatek/settings/ServiceSelectList$SimItem;)V

    .line 292
    iget-object v2, v0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mImageStatus:Landroid/widget/ImageView;

    invoke-direct {p0, v2, v1}, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;->setImageStatus(Landroid/widget/ImageView;Lcom/mediatek/settings/ServiceSelectList$SimItem;)V

    .line 293
    iget-object v2, v0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mTextNumFormat:Landroid/widget/TextView;

    invoke-direct {p0, v2, v1}, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;->setTextNumFormat(Landroid/widget/TextView;Lcom/mediatek/settings/ServiceSelectList$SimItem;)V

    .line 294
    iget-object v5, v0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mCkRadioOn:Landroid/widget/RadioButton;

    iget-object v2, p0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;->this$0:Lcom/mediatek/settings/ServiceSelectList;

    #getter for: Lcom/mediatek/settings/ServiceSelectList;->mSelected:I
    invoke-static {v2}, Lcom/mediatek/settings/ServiceSelectList;->access$200(Lcom/mediatek/settings/ServiceSelectList;)I

    move-result v2

    if-ne v2, p1, :cond_1

    move v2, v3

    :goto_1
    invoke-virtual {v5, v2}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 295
    const-string v2, "Settings/ServiceSelectList"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getview, simItem.mState="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v1, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mState:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    iget v2, v1, Lcom/mediatek/settings/ServiceSelectList$SimItem;->mState:I

    if-ne v2, v3, :cond_2

    .line 297
    invoke-virtual {p2, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 298
    iget-object v2, v0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mTextName:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 299
    iget-object v2, v0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mTextNum:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 300
    iget-object v2, v0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mCkRadioOn:Landroid/widget/RadioButton;

    invoke-virtual {v2, v4}, Landroid/widget/RadioButton;->setEnabled(Z)V

    .line 307
    :goto_2
    return-object p2

    .line 287
    .end local v0           #holder:Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;
    .end local v1           #simItem:Lcom/mediatek/settings/ServiceSelectList$SimItem;
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;

    .restart local v0       #holder:Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;
    goto :goto_0

    .restart local v1       #simItem:Lcom/mediatek/settings/ServiceSelectList$SimItem;
    :cond_1
    move v2, v4

    .line 294
    goto :goto_1

    .line 302
    :cond_2
    invoke-virtual {p2, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 303
    iget-object v2, v0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mTextName:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 304
    iget-object v2, v0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mTextNum:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 305
    iget-object v2, v0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->mCkRadioOn:Landroid/widget/RadioButton;

    invoke-virtual {v2, v3}, Landroid/widget/RadioButton;->setEnabled(Z)V

    goto :goto_2
.end method
