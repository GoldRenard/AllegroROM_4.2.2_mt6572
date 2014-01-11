.class public Lcom/mediatek/settings/DefaultSimPreference;
.super Landroid/preference/DialogPreference;
.source "DefaultSimPreference.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;
    }
.end annotation


# static fields
.field private static final DISPLAY_FIRST_FOUR:I = 0x1

.field private static final DISPLAY_LAST_FOUR:I = 0x2

.field private static final DISPLAY_NONE:I = 0x0

.field private static final PIN1_REQUEST_CODE:I = 0x12e

.field private static final TAG:Ljava/lang/String; = "DefaultSimPreference"


# instance fields
.field private mAdapter:Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;

.field private mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

.field private mContext:Landroid/content/Context;

.field private mFlater:Landroid/view/LayoutInflater;

.field private mIcon:Landroid/graphics/drawable/Drawable;

.field private mInitValue:I

.field private mListView:Landroid/widget/ListView;

.field private mSelected:I

.field private mSimItemList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mediatek/settings/SimItem;",
            ">;"
        }
    .end annotation
.end field

.field private mValue:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 53
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/mediatek/settings/DefaultSimPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v0, -0x1

    .line 56
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    iput v0, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSelected:I

    .line 41
    iput v0, p0, Lcom/mediatek/settings/DefaultSimPreference;->mInitValue:I

    .line 57
    iput-object p1, p0, Lcom/mediatek/settings/DefaultSimPreference;->mContext:Landroid/content/Context;

    .line 58
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/settings/DefaultSimPreference;->mFlater:Landroid/view/LayoutInflater;

    .line 60
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/settings/DefaultSimPreference;)Ljava/util/List;
    .locals 1
    .parameter "x0"

    .prologue
    .line 30
    iget-object v0, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSimItemList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mediatek/settings/DefaultSimPreference;)Landroid/view/LayoutInflater;
    .locals 1
    .parameter "x0"

    .prologue
    .line 30
    iget-object v0, p0, Lcom/mediatek/settings/DefaultSimPreference;->mFlater:Landroid/view/LayoutInflater;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mediatek/settings/DefaultSimPreference;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 30
    iget v0, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSelected:I

    return v0
.end method

.method static synthetic access$300(Lcom/mediatek/settings/DefaultSimPreference;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/mediatek/settings/DefaultSimPreference;->getStatusResource(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/mediatek/settings/DefaultSimPreference;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/mediatek/settings/DefaultSimPreference;->getSimColorResource(I)I

    move-result v0

    return v0
.end method

.method private getSimColorResource(I)I
    .locals 1
    .parameter "color"

    .prologue
    .line 343
    if-ltz p1, :cond_0

    const/4 v0, 0x4

    if-gt p1, v0, :cond_0

    .line 344
    sget-object v0, Landroid/provider/Telephony;->SIMBackgroundDarkRes:[I

    aget v0, v0, p1

    .line 346
    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method private getStatusResource(I)I
    .locals 1
    .parameter "state"

    .prologue
    .line 312
    const/4 v0, 0x0

    .line 313
    .local v0, iconId:I
    packed-switch p1, :pswitch_data_0

    .line 336
    :pswitch_0
    const/4 v0, -0x1

    .line 339
    :goto_0
    return v0

    .line 315
    :pswitch_1
    const v0, 0x2020112

    .line 316
    goto :goto_0

    .line 318
    :pswitch_2
    const v0, 0x20200ff

    .line 319
    goto :goto_0

    .line 321
    :pswitch_3
    const v0, 0x20200f8

    .line 322
    goto :goto_0

    .line 324
    :pswitch_4
    const v0, 0x2020119

    .line 325
    goto :goto_0

    .line 327
    :pswitch_5
    const v0, 0x2020117

    .line 328
    goto :goto_0

    .line 330
    :pswitch_6
    const v0, 0x20200ef

    .line 331
    goto :goto_0

    .line 333
    :pswitch_7
    const v0, 0x2020118

    .line 334
    goto :goto_0

    .line 313
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method private updateData()V
    .locals 8

    .prologue
    .line 298
    const/4 v1, 0x0

    .line 299
    .local v1, location:I
    iget-object v5, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSimItemList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mediatek/settings/SimItem;

    .line 300
    .local v3, simitem:Lcom/mediatek/settings/SimItem;
    iget-boolean v5, v3, Lcom/mediatek/settings/SimItem;->mIsSim:Z

    if-eqz v5, :cond_0

    .line 301
    iget-object v5, p0, Lcom/mediatek/settings/DefaultSimPreference;->mContext:Landroid/content/Context;

    iget-object v6, v3, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget-wide v6, v6, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-static {v5, v6, v7}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoById(Landroid/content/Context;J)Landroid/provider/Telephony$SIMInfo;

    move-result-object v2

    .line 302
    .local v2, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v2, :cond_0

    .line 303
    new-instance v4, Lcom/mediatek/settings/SimItem;

    invoke-direct {v4, v2}, Lcom/mediatek/settings/SimItem;-><init>(Landroid/provider/Telephony$SIMInfo;)V

    .line 304
    .local v4, simitemCopy:Lcom/mediatek/settings/SimItem;
    iget-object v5, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSimItemList:Ljava/util/List;

    invoke-interface {v5, v1, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 307
    .end local v2           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v4           #simitemCopy:Lcom/mediatek/settings/SimItem;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 309
    .end local v3           #simitem:Lcom/mediatek/settings/SimItem;
    :cond_1
    return-void
.end method


# virtual methods
.method getValue()J
    .locals 2

    .prologue
    .line 285
    iget-object v0, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSimItemList:Ljava/util/List;

    iget v1, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSelected:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/SimItem;

    iget-object v0, v0, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget-wide v0, v0, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    return-wide v0
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 4
    .parameter "view"

    .prologue
    .line 68
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onBindView(Landroid/view/View;)V

    .line 69
    const v1, 0x1020010

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 71
    .local v0, textSummary:Landroid/widget/TextView;
    if-eqz v0, :cond_0

    .line 72
    invoke-virtual {v0}, Landroid/widget/TextView;->setSingleLine()V

    .line 73
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->MIDDLE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 75
    :cond_0
    const-string v1, "DefaultSimPreference"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "summary is +"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mediatek/settings/DefaultSimPreference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    return-void
.end method

.method protected onDialogClosed(Z)V
    .locals 5
    .parameter "positiveResult"

    .prologue
    .line 95
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onDialogClosed(Z)V

    .line 97
    const-string v2, "DefaultSimPreference"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onDialogClosed---mSelected = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSelected:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    const-string v2, "DefaultSimPreference"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onDialogClosed---mInitValue = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/mediatek/settings/DefaultSimPreference;->mInitValue:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    if-eqz p1, :cond_0

    iget v2, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSelected:I

    if-ltz v2, :cond_0

    iget v2, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSelected:I

    iget v3, p0, Lcom/mediatek/settings/DefaultSimPreference;->mInitValue:I

    if-eq v2, v3, :cond_0

    .line 101
    const-string v2, "DefaultSimPreference"

    const-string v3, "callChangeListener"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    iget-object v2, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSimItemList:Ljava/util/List;

    iget v3, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSelected:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/settings/SimItem;

    iget-object v2, v2, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    if-eqz v2, :cond_1

    .line 104
    iget-object v2, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSimItemList:Ljava/util/List;

    iget v3, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSelected:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/settings/SimItem;

    iget-object v2, v2, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget-wide v0, v2, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    .line 108
    .local v0, value:J
    :goto_0
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/DefaultSimPreference;->callChangeListener(Ljava/lang/Object;)Z

    .line 109
    iget v2, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSelected:I

    iput v2, p0, Lcom/mediatek/settings/DefaultSimPreference;->mInitValue:I

    .line 111
    .end local v0           #value:J
    :cond_0
    return-void

    .line 106
    :cond_1
    const-wide/16 v0, 0x0

    .restart local v0       #value:J
    goto :goto_0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .parameter
    .parameter "v"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 115
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const-string v1, "DefaultSimPreference"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "positon is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    if-eqz p2, :cond_0

    .line 118
    invoke-virtual {p2}, Landroid/view/View;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_1

    .line 133
    :cond_0
    :goto_0
    return-void

    .line 121
    :cond_1
    iget-object v1, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSimItemList:Ljava/util/List;

    invoke-interface {v1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/SimItem;

    .line 122
    .local v0, simItem:Lcom/mediatek/settings/SimItem;
    iget-boolean v1, v0, Lcom/mediatek/settings/SimItem;->mIsSim:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/mediatek/settings/DefaultSimPreference;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    if-eqz v1, :cond_2

    iget v1, v0, Lcom/mediatek/settings/SimItem;->mState:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 125
    iget-object v1, p0, Lcom/mediatek/settings/DefaultSimPreference;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    iget-object v2, v0, Lcom/mediatek/settings/SimItem;->mSiminfo:Landroid/provider/Telephony$SIMInfo;

    iget v2, v2, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    const/16 v3, 0x12e

    invoke-virtual {v1, v2, v3}, Lcom/mediatek/CellConnService/CellConnMgr;->handleCellConn(II)I

    goto :goto_0

    .line 127
    :cond_2
    iput p3, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSelected:I

    .line 128
    invoke-virtual {p0}, Lcom/mediatek/settings/DefaultSimPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {p0, v1, v2}, Lcom/mediatek/settings/DefaultSimPreference;->onClick(Landroid/content/DialogInterface;I)V

    .line 129
    invoke-virtual {p0}, Lcom/mediatek/settings/DefaultSimPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    goto :goto_0
.end method

.method protected onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V
    .locals 6
    .parameter "builder"

    .prologue
    const/4 v2, 0x0

    .line 80
    const-string v0, "DefaultSimPreference"

    const-string v1, "onPrepareDialogBuilder"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    iget-object v0, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSimItemList:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 82
    new-instance v0, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;-><init>(Lcom/mediatek/settings/DefaultSimPreference;)V

    iput-object v0, p0, Lcom/mediatek/settings/DefaultSimPreference;->mAdapter:Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;

    .line 83
    new-instance v0, Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mediatek/settings/DefaultSimPreference;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mediatek/settings/DefaultSimPreference;->mListView:Landroid/widget/ListView;

    .line 84
    iget-object v0, p0, Lcom/mediatek/settings/DefaultSimPreference;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mediatek/settings/DefaultSimPreference;->mAdapter:Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 85
    iget-object v0, p0, Lcom/mediatek/settings/DefaultSimPreference;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 86
    iget-object v0, p0, Lcom/mediatek/settings/DefaultSimPreference;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    .line 87
    iget-object v1, p0, Lcom/mediatek/settings/DefaultSimPreference;->mListView:Landroid/widget/ListView;

    move-object v0, p1

    move v3, v2

    move v4, v2

    move v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;IIII)Landroid/app/AlertDialog$Builder;

    .line 88
    const/high16 v0, 0x104

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 90
    :cond_0
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V

    .line 91
    return-void
.end method

.method public setCellConnMgr(Lcom/mediatek/CellConnService/CellConnMgr;)V
    .locals 0
    .parameter "cellConnmgr"

    .prologue
    .line 63
    iput-object p1, p0, Lcom/mediatek/settings/DefaultSimPreference;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    .line 64
    return-void
.end method

.method public setInitData(Ljava/util/List;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mediatek/settings/SimItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 289
    .local p1, simItemList:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/settings/SimItem;>;"
    const-string v0, "DefaultSimPreference"

    const-string v1, "setInitData()"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    iput-object p1, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSimItemList:Ljava/util/List;

    .line 291
    iget-object v0, p0, Lcom/mediatek/settings/DefaultSimPreference;->mAdapter:Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;

    if-eqz v0, :cond_0

    .line 292
    const-string v0, "DefaultSimPreference"

    const-string v1, "setInitData()+mAdapter!=null"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    iget-object v0, p0, Lcom/mediatek/settings/DefaultSimPreference;->mAdapter:Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;

    invoke-virtual {v0}, Lcom/mediatek/settings/DefaultSimPreference$SelectionListAdapter;->notifyDataSetChanged()V

    .line 295
    :cond_0
    return-void
.end method

.method public setInitValue(I)V
    .locals 0
    .parameter "value"

    .prologue
    .line 280
    iput p1, p0, Lcom/mediatek/settings/DefaultSimPreference;->mInitValue:I

    .line 281
    iput p1, p0, Lcom/mediatek/settings/DefaultSimPreference;->mSelected:I

    .line 282
    return-void
.end method
