.class Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;
.super Landroid/widget/BaseAdapter;
.source "SimIconsListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/toolbar/SimIconsListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SimInfotListAdapter"
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mInflater:Landroid/view/LayoutInflater;

.field final synthetic this$0:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;


# direct methods
.method public constructor <init>(Lcom/android/systemui/statusbar/toolbar/SimIconsListView;Landroid/content/Context;)V
    .registers 5
    .parameter
    .parameter "context"

    .prologue
    .line 85
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;->this$0:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 86
    iput-object p2, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;->mContext:Landroid/content/Context;

    .line 87
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;->mContext:Landroid/content/Context;

    const-string v1, "layout_inflater"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 88
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 194
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;->this$0:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    invoke-static {v0}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->access$100(Lcom/android/systemui/statusbar/toolbar/SimIconsListView;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;
    .registers 3
    .parameter "position"

    .prologue
    .line 199
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;->this$0:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    invoke-static {v0}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->access$100(Lcom/android/systemui/statusbar/toolbar/SimIconsListView;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .registers 3
    .parameter "x0"

    .prologue
    .line 84
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;->getItem(I)Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .parameter "position"

    .prologue
    .line 204
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 16
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 96
    if-nez p2, :cond_161

    .line 97
    iget-object v6, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v7, 0x7f040045

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 98
    new-instance v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;

    const/4 v6, 0x0

    invoke-direct {v2, v6}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;-><init>(Lcom/android/systemui/statusbar/toolbar/SimIconsListView$1;)V

    .line 99
    .local v2, simInfoViewHolder:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;
    const v6, 0x7f080116

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/RelativeLayout;

    iput-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimBg:Landroid/widget/RelativeLayout;

    .line 100
    const v6, 0x7f080118

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimType:Landroid/widget/TextView;

    .line 101
    const v6, 0x7f080119

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimShortNumber:Landroid/widget/TextView;

    .line 102
    const v6, 0x7f080117

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    iput-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimStatus:Landroid/widget/ImageView;

    .line 103
    const v6, 0x7f08011a

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimOpName:Landroid/widget/TextView;

    .line 104
    const v6, 0x7f08011b

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimNumber:Landroid/widget/TextView;

    .line 105
    const v6, 0x7f08011c

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/RadioButton;

    iput-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimSelectedRadio:Landroid/widget/RadioButton;

    .line 106
    invoke-virtual {p2, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 110
    :goto_62
    iget-object v6, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;->this$0:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    invoke-static {v6}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->access$100(Lcom/android/systemui/statusbar/toolbar/SimIconsListView;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;

    .line 111
    .local v3, simItem:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;
    iget-boolean v6, v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mIsSim:Z

    if-nez v6, :cond_172

    .line 112
    iget v6, v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mColor:I

    const/16 v7, 0x8

    if-ne v6, v7, :cond_169

    .line 113
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimBg:Landroid/widget/RelativeLayout;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 114
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimBg:Landroid/widget/RelativeLayout;

    const v7, 0x20200e6

    invoke-virtual {v6, v7}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 118
    :goto_86
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimOpName:Landroid/widget/TextView;

    iget-object v7, v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimNumber:Landroid/widget/TextView;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 120
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimBg:Landroid/widget/RelativeLayout;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 121
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimType:Landroid/widget/TextView;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 146
    :goto_a2
    iget-object v7, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimSelectedRadio:Landroid/widget/RadioButton;

    iget-wide v8, v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mSimID:J

    iget-object v6, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;->this$0:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    invoke-static {v6}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->access$300(Lcom/android/systemui/statusbar/toolbar/SimIconsListView;)J

    move-result-wide v10

    cmp-long v6, v8, v10

    if-nez v6, :cond_1ec

    const/4 v6, 0x1

    :goto_b1
    invoke-virtual {v7, v6}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 148
    const-string v6, "SimIconsListView"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getVIew called, simItem\'s simId is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-wide v8, v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mSimID:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", mSelectedSimId is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;->this$0:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    invoke-static {v8}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->access$300(Lcom/android/systemui/statusbar/toolbar/SimIconsListView;)J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    const-string v6, "SimIconsListView"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getVIew called, simItem\'s simColor is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mColor:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    iget-boolean v6, v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mIsSim:Z

    if-eqz v6, :cond_122

    .line 154
    iget v6, v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mSlot:I

    invoke-static {v6}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSimIndicatorStateGemini(I)I

    move-result v5

    .line 155
    .local v5, simState:I
    const/4 v6, 0x1

    if-ne v5, v6, :cond_1ef

    .line 156
    const-string v6, "SimIconsListView"

    const-string v7, "simItem is radio off"

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimOpName:Landroid/widget/TextView;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 158
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimNumber:Landroid/widget/TextView;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 159
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimSelectedRadio:Landroid/widget/RadioButton;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/RadioButton;->setEnabled(Z)V

    .line 160
    const/4 v6, 0x0

    invoke-virtual {p2, v6}, Landroid/view/View;->setEnabled(Z)V

    .line 170
    .end local v5           #simState:I
    :cond_122
    :goto_122
    iget-wide v6, v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mSimID:J

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-nez v6, :cond_160

    .line 171
    const/4 v1, 0x0

    .line 172
    .local v1, shouldEnable:Z
    const/4 v0, 0x0

    .local v0, i:I
    :goto_12c
    iget-object v6, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;->this$0:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    invoke-static {v6}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->access$100(Lcom/android/systemui/statusbar/toolbar/SimIconsListView;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v0, v6, :cond_14e

    .line 173
    iget-object v6, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;->this$0:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    invoke-static {v6}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->access$100(Lcom/android/systemui/statusbar/toolbar/SimIconsListView;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;

    .line 174
    .local v4, simItemTemp:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;
    iget-boolean v6, v4, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mIsSim:Z

    if-eqz v6, :cond_20e

    .line 175
    iget v6, v4, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mState:I

    const/4 v7, 0x1

    if-eq v6, v7, :cond_20e

    .line 176
    const/4 v1, 0x1

    .line 181
    .end local v4           #simItemTemp:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;
    :cond_14e
    if-nez v1, :cond_212

    .line 182
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimOpName:Landroid/widget/TextView;

    const v7, -0x777778

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 186
    :goto_158
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimSelectedRadio:Landroid/widget/RadioButton;

    invoke-virtual {v6, v1}, Landroid/widget/RadioButton;->setEnabled(Z)V

    .line 187
    invoke-virtual {p2, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 189
    .end local v0           #i:I
    .end local v1           #shouldEnable:Z
    :cond_160
    return-object p2

    .line 108
    .end local v2           #simInfoViewHolder:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;
    .end local v3           #simItem:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;
    :cond_161
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;

    .restart local v2       #simInfoViewHolder:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;
    goto/16 :goto_62

    .line 116
    .restart local v3       #simItem:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;
    :cond_169
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimBg:Landroid/widget/RelativeLayout;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_86

    .line 123
    :cond_172
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimBg:Landroid/widget/RelativeLayout;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 124
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimBg:Landroid/widget/RelativeLayout;

    iget v7, v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mColor:I

    invoke-virtual {v6, v7}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 125
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimOpName:Landroid/widget/TextView;

    iget-object v7, v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    iget v6, v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mState:I

    const/4 v7, 0x1

    if-ne v6, v7, :cond_1d6

    .line 127
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimOpName:Landroid/widget/TextView;

    const v7, -0x777778

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 131
    :goto_193
    iget-object v6, v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mNumber:Ljava/lang/String;

    if-eqz v6, :cond_1e4

    iget-object v6, v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_1e4

    .line 132
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimNumber:Landroid/widget/TextView;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 133
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimNumber:Landroid/widget/TextView;

    iget-object v7, v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mNumber:Ljava/lang/String;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 134
    iget v6, v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mState:I

    const/4 v7, 0x1

    if-ne v6, v7, :cond_1dd

    .line 135
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimNumber:Landroid/widget/TextView;

    const v7, -0x777778

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 142
    :goto_1b9
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimStatus:Landroid/widget/ImageView;

    iget v7, v3, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mState:I

    invoke-static {v7}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMStateIcon(I)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 143
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimShortNumber:Landroid/widget/TextView;

    invoke-static {v3}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->access$200(Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimType:Landroid/widget/TextView;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_a2

    .line 129
    :cond_1d6
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimOpName:Landroid/widget/TextView;

    const/4 v7, -0x1

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_193

    .line 137
    :cond_1dd
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimNumber:Landroid/widget/TextView;

    const/4 v7, -0x1

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1b9

    .line 140
    :cond_1e4
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimNumber:Landroid/widget/TextView;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1b9

    .line 146
    :cond_1ec
    const/4 v6, 0x0

    goto/16 :goto_b1

    .line 162
    .restart local v5       #simState:I
    :cond_1ef
    const-string v6, "SimIconsListView"

    const-string v7, "simItem is not radio off"

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimOpName:Landroid/widget/TextView;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 164
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimNumber:Landroid/widget/TextView;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 165
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimSelectedRadio:Landroid/widget/RadioButton;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/widget/RadioButton;->setEnabled(Z)V

    .line 166
    const/4 v6, 0x1

    invoke-virtual {p2, v6}, Landroid/view/View;->setEnabled(Z)V

    goto/16 :goto_122

    .line 172
    .end local v5           #simState:I
    .restart local v0       #i:I
    .restart local v1       #shouldEnable:Z
    .restart local v4       #simItemTemp:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;
    :cond_20e
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_12c

    .line 184
    .end local v4           #simItemTemp:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;
    :cond_212
    iget-object v6, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;->mSimOpName:Landroid/widget/TextView;

    const/4 v7, -0x1

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_158
.end method
