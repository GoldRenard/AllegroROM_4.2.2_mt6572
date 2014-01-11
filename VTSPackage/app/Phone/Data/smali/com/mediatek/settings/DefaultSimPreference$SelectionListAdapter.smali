.class Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;
.super Landroid/widget/BaseAdapter;
.source "DefaultSimPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/DefaultSimPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SelectionListAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/DefaultSimPreference;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/DefaultSimPreference;)V
    .locals 0
    .parameter

    .prologue
    .line 136
    iput-object p1, p0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;->this$0:Lcom/mediatek/settings/DefaultSimPreference;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 138
    return-void
.end method

.method private setImageSim(Landroid/widget/RelativeLayout;Lcom/mediatek/settings/SimItem;)V
    .locals 3
    .parameter "imageSim"
    .parameter "simItem"

    .prologue
    .line 226
    iget-boolean v1, p2, Lcom/mediatek/settings/SimItem;->mIsSim:Z

    if-eqz v1, :cond_1

    .line 227
    iget-object v1, p0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;->this$0:Lcom/mediatek/settings/DefaultSimPreference;

    iget-object v2, p2, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget v2, v2, Landroid/provider/Telephony$SIMInfo;->mColor:I

    #calls: Lcom/mediatek/settings/DefaultSimPreference;->getSimColorResource(I)I
    invoke-static {v1, v2}, Lcom/mediatek/settings/DefaultSimPreference;->access$400(Lcom/mediatek/settings/DefaultSimPreference;I)I

    move-result v0

    .line 228
    .local v0, resColor:I
    if-ltz v0, :cond_0

    .line 229
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 230
    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 235
    .end local v0           #resColor:I
    :cond_0
    :goto_0
    return-void

    .line 233
    :cond_1
    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method private setImageStatus(Landroid/widget/ImageView;Lcom/mediatek/settings/SimItem;)V
    .locals 3
    .parameter "imageStatus"
    .parameter "simItem"

    .prologue
    .line 214
    iget-boolean v1, p2, Lcom/mediatek/settings/SimItem;->mIsSim:Z

    if-eqz v1, :cond_0

    .line 215
    iget-object v1, p0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;->this$0:Lcom/mediatek/settings/DefaultSimPreference;

    iget v2, p2, Lcom/mediatek/settings/SimItem;->mState:I

    #calls: Lcom/mediatek/settings/DefaultSimPreference;->getStatusResource(I)I
    invoke-static {v1, v2}, Lcom/mediatek/settings/DefaultSimPreference;->access$300(Lcom/mediatek/settings/DefaultSimPreference;I)I

    move-result v0

    .line 216
    .local v0, res:I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 217
    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 223
    .end local v0           #res:I
    :cond_0
    :goto_0
    return-void

    .line 219
    .restart local v0       #res:I
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 220
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0
.end method

.method private setNameAndNum(Landroid/widget/TextView;Landroid/widget/TextView;Lcom/mediatek/settings/SimItem;)V
    .locals 3
    .parameter "textName"
    .parameter "textNum"
    .parameter "simItem"

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 247
    iget-object v0, p3, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    if-eqz v0, :cond_1

    .line 248
    iget-object v0, p3, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v0, v0, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 249
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 250
    iget-object v0, p3, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v0, v0, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 258
    :goto_0
    iget-boolean v0, p3, Lcom/mediatek/settings/SimItem;->mIsSim:Z

    if-eqz v0, :cond_2

    iget-object v0, p3, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v0, v0, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p3, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v0, v0, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_2

    .line 261
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 262
    iget-object v0, p3, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v0, v0, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 266
    :goto_1
    return-void

    .line 252
    :cond_0
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 255
    :cond_1
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 256
    const v0, 0x7f0d00a0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 264
    :cond_2
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1
.end method

.method private setTextNumFormat(Landroid/widget/TextView;Lcom/mediatek/settings/SimItem;)V
    .locals 3
    .parameter "textNumFormat"
    .parameter "simItem"

    .prologue
    const/4 v2, 0x4

    const/4 v1, 0x0

    .line 184
    iget-boolean v0, p2, Lcom/mediatek/settings/SimItem;->mIsSim:Z

    if-eqz v0, :cond_0

    .line 185
    iget-object v0, p2, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v0, v0, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 186
    iget-object v0, p2, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget v0, v0, Landroid/provider/Telephony$SIMInfo;->mDispalyNumberFormat:I

    packed-switch v0, :pswitch_data_0

    .line 211
    :cond_0
    :goto_0
    return-void

    .line 188
    :pswitch_0
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 191
    :pswitch_1
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 192
    iget-object v0, p2, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v0, v0, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v2, :cond_1

    .line 193
    iget-object v0, p2, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v0, v0, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 195
    :cond_1
    iget-object v0, p2, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v0, v0, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 199
    :pswitch_2
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 200
    iget-object v0, p2, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v0, v0, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v2, :cond_2

    .line 201
    iget-object v0, p2, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v0, v0, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    iget-object v1, p2, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v1, v1, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x4

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 203
    :cond_2
    iget-object v0, p2, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget-object v0, v0, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 186
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private setViewHolderId(Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;Landroid/view/View;)V
    .locals 1
    .parameter "holder"
    .parameter "convertView"

    .prologue
    .line 238
    const v0, 0x7f0800dc

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextName:Landroid/widget/TextView;

    .line 239
    const v0, 0x7f0800dd

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextNum:Landroid/widget/TextView;

    .line 240
    const v0, 0x7f0800d9

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p1, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mImageStatus:Landroid/widget/ImageView;

    .line 241
    const v0, 0x7f0800da

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextNumFormat:Landroid/widget/TextView;

    .line 242
    const v0, 0x7f0800de

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p1, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mCkRadioOn:Landroid/widget/RadioButton;

    .line 243
    const v0, 0x7f0800d8

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p1, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mImageSim:Landroid/widget/RelativeLayout;

    .line 244
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;->this$0:Lcom/mediatek/settings/DefaultSimPreference;

    #getter for: Lcom/mediatek/settings/DefaultSimPreference;->mSimItemList:Ljava/util/List;
    invoke-static {v0}, Lcom/mediatek/settings/DefaultSimPreference;->access$000(Lcom/mediatek/settings/DefaultSimPreference;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "position"

    .prologue
    .line 144
    iget-object v0, p0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;->this$0:Lcom/mediatek/settings/DefaultSimPreference;

    #getter for: Lcom/mediatek/settings/DefaultSimPreference;->mSimItemList:Ljava/util/List;
    invoke-static {v0}, Lcom/mediatek/settings/DefaultSimPreference;->access$000(Lcom/mediatek/settings/DefaultSimPreference;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "position"

    .prologue
    .line 148
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

    .line 154
    if-nez p2, :cond_0

    .line 155
    iget-object v2, p0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;->this$0:Lcom/mediatek/settings/DefaultSimPreference;

    #getter for: Lcom/mediatek/settings/DefaultSimPreference;->mFlater:Landroid/view/LayoutInflater;
    invoke-static {v2}, Lcom/mediatek/settings/DefaultSimPreference;->access$100(Lcom/mediatek/settings/DefaultSimPreference;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v5, 0x7f040033

    const/4 v6, 0x0

    invoke-virtual {v2, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 156
    new-instance v0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;-><init>(Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;)V

    .line 157
    .local v0, holder:Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;
    invoke-direct {p0, v0, p2}, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;->setViewHolderId(Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;Landroid/view/View;)V

    .line 158
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 162
    :goto_0
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/settings/SimItem;

    .line 163
    .local v1, simItem:Lcom/mediatek/settings/SimItem;
    iget-object v2, v0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextName:Landroid/widget/TextView;

    iget-object v5, v0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextNum:Landroid/widget/TextView;

    invoke-direct {p0, v2, v5, v1}, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;->setNameAndNum(Landroid/widget/TextView;Landroid/widget/TextView;Lcom/mediatek/settings/SimItem;)V

    .line 164
    iget-object v2, v0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mImageSim:Landroid/widget/RelativeLayout;

    invoke-direct {p0, v2, v1}, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;->setImageSim(Landroid/widget/RelativeLayout;Lcom/mediatek/settings/SimItem;)V

    .line 165
    iget-object v2, v0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mImageStatus:Landroid/widget/ImageView;

    invoke-direct {p0, v2, v1}, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;->setImageStatus(Landroid/widget/ImageView;Lcom/mediatek/settings/SimItem;)V

    .line 166
    iget-object v2, v0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextNumFormat:Landroid/widget/TextView;

    invoke-direct {p0, v2, v1}, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;->setTextNumFormat(Landroid/widget/TextView;Lcom/mediatek/settings/SimItem;)V

    .line 167
    iget-object v5, v0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mCkRadioOn:Landroid/widget/RadioButton;

    iget-object v2, p0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;->this$0:Lcom/mediatek/settings/DefaultSimPreference;

    #getter for: Lcom/mediatek/settings/DefaultSimPreference;->mSelected:I
    invoke-static {v2}, Lcom/mediatek/settings/DefaultSimPreference;->access$200(Lcom/mediatek/settings/DefaultSimPreference;)I

    move-result v2

    if-ne v2, p1, :cond_1

    move v2, v3

    :goto_1
    invoke-virtual {v5, v2}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 168
    const-string v2, "DefaultSimPreference"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "DefaultSiminfo simItem.mState="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v1, Lcom/mediatek/settings/SimItem;->mState:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    iget v2, v1, Lcom/mediatek/settings/SimItem;->mState:I

    if-ne v2, v3, :cond_2

    .line 170
    invoke-virtual {p2, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 171
    iget-object v2, v0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextName:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 172
    iget-object v2, v0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextNum:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 173
    iget-object v2, v0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mCkRadioOn:Landroid/widget/RadioButton;

    invoke-virtual {v2, v4}, Landroid/widget/RadioButton;->setEnabled(Z)V

    .line 180
    :goto_2
    return-object p2

    .line 160
    .end local v0           #holder:Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;
    .end local v1           #simItem:Lcom/mediatek/settings/SimItem;
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;

    .restart local v0       #holder:Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;
    goto :goto_0

    .restart local v1       #simItem:Lcom/mediatek/settings/SimItem;
    :cond_1
    move v2, v4

    .line 167
    goto :goto_1

    .line 175
    :cond_2
    invoke-virtual {p2, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 176
    iget-object v2, v0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextName:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 177
    iget-object v2, v0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mTextNum:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 178
    iget-object v2, v0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter$ViewHolder;->mCkRadioOn:Landroid/widget/RadioButton;

    invoke-virtual {v2, v3}, Landroid/widget/RadioButton;->setEnabled(Z)V

    goto :goto_2
.end method
