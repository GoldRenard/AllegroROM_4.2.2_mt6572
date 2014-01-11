.class public Lcom/mediatek/settings/CallRejectListAdapter;
.super Landroid/widget/BaseAdapter;
.source "CallRejectListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/CallRejectListAdapter$CheckSelectCallBack;,
        Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "CallRejectListAdapter"


# instance fields
.field private mCheckSelectCallBack:Lcom/mediatek/settings/CallRejectListAdapter$CheckSelectCallBack;

.field private mContext:Landroid/content/Context;

.field private mDataList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mediatek/settings/CallRejectListItem;",
            ">;"
        }
    .end annotation
.end field

.field private mInflater:Landroid/view/LayoutInflater;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 2
    .parameter "context"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mediatek/settings/CallRejectListItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p2, data:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/mediatek/settings/CallRejectListItem;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/settings/CallRejectListAdapter;->mCheckSelectCallBack:Lcom/mediatek/settings/CallRejectListAdapter$CheckSelectCallBack;

    .line 25
    iput-object p1, p0, Lcom/mediatek/settings/CallRejectListAdapter;->mContext:Landroid/content/Context;

    .line 26
    iput-object p2, p0, Lcom/mediatek/settings/CallRejectListAdapter;->mDataList:Ljava/util/ArrayList;

    .line 27
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListAdapter;->mContext:Landroid/content/Context;

    const-string v1, "layout_inflater"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/mediatek/settings/CallRejectListAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 28
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/settings/CallRejectListAdapter;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 16
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListAdapter;->mDataList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mediatek/settings/CallRejectListAdapter;)Lcom/mediatek/settings/CallRejectListAdapter$CheckSelectCallBack;
    .locals 1
    .parameter "x0"

    .prologue
    .line 16
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListAdapter;->mCheckSelectCallBack:Lcom/mediatek/settings/CallRejectListAdapter$CheckSelectCallBack;

    return-object v0
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListAdapter;->mDataList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListAdapter;->mDataList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "position"

    .prologue
    .line 75
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListAdapter;->mDataList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListAdapter;->mDataList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/CallRejectListItem;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "position"

    .prologue
    .line 80
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 34
    if-nez p2, :cond_3

    .line 35
    new-instance v0, Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;

    invoke-direct {v0}, Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;-><init>()V

    .line 36
    .local v0, holder:Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;
    iget-object v1, p0, Lcom/mediatek/settings/CallRejectListAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v2, 0x7f040006

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 38
    const v1, 0x7f080016

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v0, Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;->mName:Landroid/widget/TextView;

    .line 39
    const v1, 0x7f080015

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iput-object v1, v0, Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;->mCheckBox:Landroid/widget/CheckBox;

    .line 40
    iput p1, v0, Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;->mId:I

    .line 41
    iget-object v1, v0, Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;->mCheckBox:Landroid/widget/CheckBox;

    new-instance v2, Lcom/mediatek/settings/CallRejectListAdapter$1;

    invoke-direct {v2, p0, v0}, Lcom/mediatek/settings/CallRejectListAdapter$1;-><init>(Lcom/mediatek/settings/CallRejectListAdapter;Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;)V

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 48
    const v1, 0x7f080017

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v0, Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;->mPhoneNum:Landroid/widget/TextView;

    .line 50
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 56
    :goto_0
    iget-object v1, v0, Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;->mName:Landroid/widget/TextView;

    if-eqz v1, :cond_0

    .line 57
    iget-object v2, v0, Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;->mName:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mediatek/settings/CallRejectListAdapter;->mDataList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/settings/CallRejectListItem;

    invoke-virtual {v1}, Lcom/mediatek/settings/CallRejectListItem;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    :cond_0
    iget-object v1, v0, Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;->mCheckBox:Landroid/widget/CheckBox;

    if-eqz v1, :cond_1

    .line 60
    iget-object v2, v0, Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;->mCheckBox:Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/mediatek/settings/CallRejectListAdapter;->mDataList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/settings/CallRejectListItem;

    invoke-virtual {v1}, Lcom/mediatek/settings/CallRejectListItem;->getIsChecked()Z

    move-result v1

    invoke-virtual {v2, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 62
    :cond_1
    iget-object v1, v0, Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;->mPhoneNum:Landroid/widget/TextView;

    if-eqz v1, :cond_2

    .line 63
    iget-object v2, v0, Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;->mPhoneNum:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mediatek/settings/CallRejectListAdapter;->mDataList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/settings/CallRejectListItem;

    invoke-virtual {v1}, Lcom/mediatek/settings/CallRejectListItem;->getPhoneNum()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    :cond_2
    return-object p2

    .line 52
    .end local v0           #holder:Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;
    :cond_3
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;

    .line 53
    .restart local v0       #holder:Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;
    iput p1, v0, Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;->mId:I

    goto :goto_0
.end method

.method public setCheckSelectCallBack(Lcom/mediatek/settings/CallRejectListAdapter$CheckSelectCallBack;)V
    .locals 0
    .parameter "callBack"

    .prologue
    .line 84
    iput-object p1, p0, Lcom/mediatek/settings/CallRejectListAdapter;->mCheckSelectCallBack:Lcom/mediatek/settings/CallRejectListAdapter$CheckSelectCallBack;

    .line 85
    return-void
.end method
