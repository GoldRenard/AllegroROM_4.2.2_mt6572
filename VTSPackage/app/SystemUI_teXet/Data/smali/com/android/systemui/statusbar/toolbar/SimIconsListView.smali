.class public Lcom/android/systemui/statusbar/toolbar/SimIconsListView;
.super Landroid/widget/ListView;
.source "SimIconsListView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;,
        Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;,
        Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;
    }
.end annotation


# static fields
.field private static final CUMCCMNC:Ljava/lang/String; = "46001"

.field private static final DBG:Z = true

.field private static final TAG:Ljava/lang/String; = "SimIconsListView"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mSelectedSimId:J

.field private mServiceType:Ljava/lang/String;

.field private mSimInfotListAdapter:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;

.field private mSimItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4
    .parameter "context"
    .parameter "serviceType"

    .prologue
    .line 57
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mSimItems:Ljava/util/List;

    .line 46
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$1;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$1;-><init>(Lcom/android/systemui/statusbar/toolbar/SimIconsListView;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 58
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mContext:Landroid/content/Context;

    .line 59
    iput-object p2, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mServiceType:Ljava/lang/String;

    .line 60
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->initListViews()V

    .line 61
    return-void
.end method

.method static synthetic access$100(Lcom/android/systemui/statusbar/toolbar/SimIconsListView;)Ljava/util/List;
    .registers 2
    .parameter "x0"

    .prologue
    .line 35
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mSimItems:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/systemui/statusbar/toolbar/SimIconsListView;)J
    .registers 3
    .parameter "x0"

    .prologue
    .line 35
    iget-wide v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mSelectedSimId:J

    return-wide v0
.end method

.method private initListViews()V
    .registers 4

    .prologue
    .line 64
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 65
    .local v0, mIntentFilter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 66
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 67
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->setCacheColorHint(I)V

    .line 68
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->initSimList()V

    .line 69
    new-instance v1, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;

    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mContext:Landroid/content/Context;

    invoke-direct {v1, p0, v2}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;-><init>(Lcom/android/systemui/statusbar/toolbar/SimIconsListView;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mSimInfotListAdapter:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;

    .line 70
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mSimInfotListAdapter:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;

    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 71
    return-void
.end method


# virtual methods
.method public initSimList()V
    .registers 12

    .prologue
    .line 265
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mServiceType:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/android/systemui/statusbar/util/SIMHelper;->getDefaultSIM(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mSelectedSimId:J

    .line 267
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mSimItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 271
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMInfoList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v9

    .line 272
    .local v9, simList:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;>;"
    if-eqz v9, :cond_1d

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_1e

    .line 319
    :cond_1d
    :goto_1d
    return-void

    .line 275
    :cond_1e
    const/4 v6, 0x0

    .local v6, i:I
    :goto_1f
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v1

    if-ge v6, v1, :cond_5b

    .line 276
    invoke-interface {v9, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;

    .line 277
    .local v8, simInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;
    const-string v7, ""

    .line 279
    .local v7, numeric:Ljava/lang/String;
    iget v1, v8, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mSimSlotId:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_4a

    .line 280
    const-string v1, "gsm.sim.operator.numeric.2"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 288
    :cond_38
    :goto_38
    const-string v1, "46001"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_47

    .line 289
    const-string v1, "SimIconsListView"

    const-string v2, "IsAllCUCard = true;"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    :cond_47
    add-int/lit8 v6, v6, 0x1

    goto :goto_1f

    .line 281
    :cond_4a
    iget v1, v8, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mSimSlotId:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_38

    .line 283
    iget v1, v8, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mSimSlotId:I

    const/4 v2, 0x3

    if-eq v1, v2, :cond_38

    .line 286
    const-string v1, "gsm.sim.operator.numeric"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_38

    .line 293
    .end local v7           #numeric:Ljava/lang/String;
    .end local v8           #simInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;
    :cond_5b
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mServiceType:Ljava/lang/String;

    const-string v2, "video_call_sim_setting"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_81

    .line 294
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mContext:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/mediatek/telephony/SimInfoManager;->getSimInfoBySlot(Landroid/content/Context;I)Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;

    move-result-object v8

    .line 295
    .restart local v8       #simInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;
    if-eqz v8, :cond_1d

    .line 296
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;

    invoke-direct {v0, p0, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;-><init>(Lcom/android/systemui/statusbar/toolbar/SimIconsListView;Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)V

    .line 297
    .local v0, simitem:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;
    iget v1, v8, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mSimSlotId:I

    invoke-static {v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSimIndicatorStateGemini(I)I

    move-result v10

    .line 298
    .local v10, state:I
    iput v10, v0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mState:I

    .line 299
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mSimItems:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 304
    .end local v0           #simitem:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;
    .end local v8           #simInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;
    .end local v10           #state:I
    :cond_81
    const/4 v6, 0x0

    :goto_82
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v1

    if-ge v6, v1, :cond_a5

    .line 305
    invoke-interface {v9, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;

    .line 306
    .restart local v8       #simInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;
    if-eqz v8, :cond_a2

    .line 307
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;

    invoke-direct {v0, p0, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;-><init>(Lcom/android/systemui/statusbar/toolbar/SimIconsListView;Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)V

    .line 308
    .restart local v0       #simitem:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;
    iget v1, v8, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mSimSlotId:I

    invoke-static {v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSimIndicatorStateGemini(I)I

    move-result v10

    .line 309
    .restart local v10       #state:I
    iput v10, v0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mState:I

    .line 310
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mSimItems:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 304
    .end local v0           #simitem:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;
    .end local v10           #state:I
    :cond_a2
    add-int/lit8 v6, v6, 0x1

    goto :goto_82

    .line 314
    .end local v8           #simInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;
    :cond_a5
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mServiceType:Ljava/lang/String;

    const-string v2, "gprs_connection_sim_setting"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 315
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;

    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mContext:Landroid/content/Context;

    const v2, 0x7f0b001d

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, -0x1

    const-wide/16 v4, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;-><init>(Lcom/android/systemui/statusbar/toolbar/SimIconsListView;Ljava/lang/String;IJ)V

    .line 317
    .restart local v0       #simitem:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mSimItems:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1d
.end method

.method public notifyDataChange()V
    .registers 2

    .prologue
    .line 322
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mSimInfotListAdapter:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;

    if-eqz v0, :cond_9

    .line 323
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mSimInfotListAdapter:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfotListAdapter;->notifyDataSetChanged()V

    .line 325
    :cond_9
    return-void
.end method

.method public updateResources()V
    .registers 4

    .prologue
    .line 328
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mSimItems:Ljava/util/List;

    if-eqz v0, :cond_31

    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mSimItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_31

    .line 329
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mServiceType:Ljava/lang/String;

    const-string v1, "gprs_connection_sim_setting"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 330
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mSimItems:Ljava/util/List;

    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mSimItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;

    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->mContext:Landroid/content/Context;

    const v2, 0x7f0b001d

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mName:Ljava/lang/String;

    .line 333
    :cond_31
    return-void
.end method
