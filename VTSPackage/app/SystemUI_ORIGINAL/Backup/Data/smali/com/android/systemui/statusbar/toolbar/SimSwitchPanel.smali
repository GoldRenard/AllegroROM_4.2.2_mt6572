.class public Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;
.super Landroid/widget/LinearLayout;
.source "SimSwitchPanel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$7;
    }
.end annotation


# static fields
.field private static final ALWAYS_ASK:Ljava/lang/String; = "ALWAYS_ASK"

.field private static final ALWAYS_ASK_COLOR:I = 0x5

.field private static final AUTO:Ljava/lang/String; = "AUTO"

.field private static final AUTO_COLOR:I = 0x6

.field private static final DBG:Z = true

.field private static final SIP_CALL:Ljava/lang/String; = "SIP_CALL"

.field private static final SIP_CALL_COLOR:I = 0x4

.field private static final TAG:Ljava/lang/String; = "SimSwitchPanelView"


# instance fields
.field private mAlwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

.field private mAutoIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

.field private mChooseSIMInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;

.field private mCurrentBussinessType:Ljava/lang/String;

.field private mCurrentServiceType:Ljava/lang/String;

.field private mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mPanelShowing:Z

.field private mRadioOffListener:Landroid/content/DialogInterface$OnClickListener;

.field private mSIMInfoList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;",
            ">;"
        }
    .end annotation
.end field

.field private mSimIconInflated:Z

.field private mSimInconViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/systemui/statusbar/toolbar/SimIconView;",
            ">;"
        }
    .end annotation
.end field

.field private mSimSwitchListener:Landroid/view/View$OnClickListener;

.field private mSipCallIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

.field private mSwitchDialog:Landroid/app/AlertDialog;

.field private mToolBarView:Lcom/android/systemui/statusbar/toolbar/ToolBarView;

.field private mUpdating:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 169
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 170
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v0, 0x0

    .line 173
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 44
    iput-boolean v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mUpdating:Z

    .line 45
    iput-boolean v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mPanelShowing:Z

    .line 49
    iput-boolean v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimIconInflated:Z

    .line 60
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;-><init>(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 441
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$5;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$5;-><init>(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimSwitchListener:Landroid/view/View$OnClickListener;

    .line 492
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$6;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$6;-><init>(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mRadioOffListener:Landroid/content/DialogInterface$OnClickListener;

    .line 174
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    .line 175
    return-void
.end method

.method static synthetic access$000(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/util/List;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$002(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 34
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$100(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;I)Lcom/android/systemui/statusbar/toolbar/SimIconView;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->findViewBySlotId(I)Lcom/android/systemui/statusbar/toolbar/SimIconView;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mChooseSIMInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;

    return-object v0
.end method

.method static synthetic access$1202(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 34
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mChooseSIMInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;

    return-object p1
.end method

.method static synthetic access$1300(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSwitchDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$1302(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 34
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSwitchDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$1400(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->createDialog(Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1500(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->changeDefaultSim(Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->radioOnBySlot(I)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    invoke-static {p0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->getMobileDataState(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->updateMobileConnection()V

    return-void
.end method

.method static synthetic access$500(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/util/List;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$900(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Lcom/android/systemui/statusbar/toolbar/ToolBarView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mToolBarView:Lcom/android/systemui/statusbar/toolbar/ToolBarView;

    return-object v0
.end method

.method private buildSimIconViews()V
    .locals 11

    .prologue
    .line 273
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->removeAllViews()V

    .line 274
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    if-eqz v8, :cond_0

    .line 275
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->clear()V

    .line 277
    :cond_0
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-static {v8}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMInfoList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v8

    iput-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;

    .line 278
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v1

    .line 279
    .local v1, count:I
    const-string v8, "SimSwitchPanelView"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "buildSimIconViews call, mSIMInfoList size is "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 280
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, 0x0

    const/4 v9, -0x1

    const/high16 v10, 0x3f80

    invoke-direct {v3, v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 281
    .local v3, layutparams:Landroid/widget/LinearLayout$LayoutParams;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 282
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;

    .line 283
    .local v7, simInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    const v9, 0x7f04004c

    const/4 v10, 0x0

    invoke-static {v8, v9, v10}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    .line 284
    .local v4, simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    const/4 v8, 0x1

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setOrientation(I)V

    .line 285
    invoke-virtual {p0, v4, v3}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 286
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 287
    if-eqz v7, :cond_1

    .line 288
    iget v8, v7, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mSimSlotId:I

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSlotId(I)V

    .line 289
    iget v8, v7, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mColor:I

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSimColor(I)V

    .line 291
    :cond_1
    invoke-virtual {v4, v7}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setTag(Ljava/lang/Object;)V

    .line 292
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimSwitchListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 293
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->updateSimIcon(Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)V

    .line 281
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 295
    .end local v4           #simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    .end local v7           #simInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;
    :cond_2
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-static {v8}, Landroid/net/sip/SipManager;->isVoipSupported(Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 296
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    const v9, 0x7f04004d

    const/4 v10, 0x0

    invoke-static {v8, v9, v10}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    .line 298
    .restart local v4       #simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    const v8, 0x7f020257

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSimIconViewResource(I)V

    .line 299
    const v8, 0x7f0b001c

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setOpName(I)V

    .line 300
    const-string v8, "SIP_CALL"

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setTag(Ljava/lang/Object;)V

    .line 301
    const/4 v8, 0x1

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setOrientation(I)V

    .line 302
    invoke-virtual {p0, v4, v3}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 303
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 304
    const/4 v8, 0x4

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSimColor(I)V

    .line 305
    new-instance v8, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$2;

    invoke-direct {v8, p0, v4}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$2;-><init>(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;Lcom/android/systemui/statusbar/toolbar/SimIconView;)V

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 322
    iput-object v4, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSipCallIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    .line 325
    iget-boolean v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mPanelShowing:Z

    if-eqz v8, :cond_3

    .line 326
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentBussinessType:Ljava/lang/String;

    .line 327
    .local v0, bussinessType:Ljava/lang/String;
    const-string v8, "voice_call_sim_setting"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->isInternetCallEnabled(Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 329
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSipCallIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setVisibility(I)V

    .line 333
    :goto_1
    const-wide/16 v5, -0x1

    .line 334
    .local v5, simId:J
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-wide/16 v9, -0x1

    invoke-static {v8, v0, v9, v10}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v5

    .line 335
    invoke-direct {p0, v5, v6}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->switchSimId(J)V

    .line 340
    .end local v0           #bussinessType:Ljava/lang/String;
    .end local v4           #simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    .end local v5           #simId:J
    :cond_3
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    const v9, 0x7f04004d

    const/4 v10, 0x0

    invoke-static {v8, v9, v10}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    .line 342
    .restart local v4       #simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    const v8, 0x7f020252

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSimIconViewResource(I)V

    .line 343
    const v8, 0x7f0b0004

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setOpName(I)V

    .line 344
    const-string v8, "ALWAYS_ASK"

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setTag(Ljava/lang/Object;)V

    .line 345
    const/4 v8, 0x1

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setOrientation(I)V

    .line 346
    invoke-virtual {p0, v4, v3}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 347
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 348
    const/4 v8, 0x5

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSimColor(I)V

    .line 349
    new-instance v8, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$3;

    invoke-direct {v8, p0, v4}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$3;-><init>(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;Lcom/android/systemui/statusbar/toolbar/SimIconView;)V

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 371
    iput-object v4, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAlwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    .line 376
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-static {v8}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v8

    invoke-interface {v8}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->supportDataTypeAlwaysDisplayWhileOn()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 377
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    const v9, 0x7f04004d

    const/4 v10, 0x0

    invoke-static {v8, v9, v10}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .end local v4           #simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    check-cast v4, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    .line 379
    .restart local v4       #simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    const v8, 0x7f020254

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSimIconViewResource(I)V

    .line 380
    const v8, 0x7f0b0005

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setOpName(I)V

    .line 381
    const-string v8, "AUTO"

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setTag(Ljava/lang/Object;)V

    .line 382
    const/4 v8, 0x1

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setOrientation(I)V

    .line 383
    invoke-virtual {p0, v4, v3}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 384
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 385
    const/4 v8, 0x6

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSimColor(I)V

    .line 386
    new-instance v8, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$4;

    invoke-direct {v8, p0, v4}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$4;-><init>(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;Lcom/android/systemui/statusbar/toolbar/SimIconView;)V

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 406
    iput-object v4, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAutoIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    .line 410
    :cond_4
    iget-boolean v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mPanelShowing:Z

    if-eqz v8, :cond_8

    .line 411
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentBussinessType:Ljava/lang/String;

    .line 412
    .restart local v0       #bussinessType:Ljava/lang/String;
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    const/4 v9, 0x2

    if-ge v8, v9, :cond_5

    const-string v8, "voice_call_sim_setting"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a

    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_a

    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-static {v8}, Landroid/net/sip/SipManager;->isVoipSupported(Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_a

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->isInternetCallEnabled(Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 417
    :cond_5
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAlwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setVisibility(I)V

    .line 421
    :goto_2
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_6

    const-string v8, "sms_sim_setting"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 422
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAlwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setVisibility(I)V

    .line 424
    :cond_6
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-static {v8}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v8

    invoke-interface {v8}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->supportDataTypeAlwaysDisplayWhileOn()Z

    move-result v8

    if-eqz v8, :cond_7

    .line 425
    const-string v8, "sms_sim_setting"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_b

    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    const/4 v9, 0x1

    if-lt v8, v9, :cond_b

    .line 428
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAutoIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setVisibility(I)V

    .line 433
    :cond_7
    :goto_3
    const-wide/16 v5, -0x1

    .line 434
    .restart local v5       #simId:J
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-wide/16 v9, -0x1

    invoke-static {v8, v0, v9, v10}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v5

    .line 435
    invoke-direct {p0, v5, v6}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->switchSimId(J)V

    .line 438
    .end local v0           #bussinessType:Ljava/lang/String;
    .end local v5           #simId:J
    :cond_8
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimIconInflated:Z

    .line 439
    return-void

    .line 331
    .restart local v0       #bussinessType:Ljava/lang/String;
    :cond_9
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSipCallIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setVisibility(I)V

    goto/16 :goto_1

    .line 419
    :cond_a
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAlwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setVisibility(I)V

    goto :goto_2

    .line 430
    :cond_b
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAutoIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setVisibility(I)V

    goto :goto_3
.end method

.method private changeDefaultSim(Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)V
    .locals 8
    .parameter "simInfo"

    .prologue
    const/4 v7, 0x0

    .line 565
    iget-wide v1, p1, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mSimInfoId:J

    .line 566
    .local v1, simId:J
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;

    const-wide/16 v5, -0x1

    invoke-static {v3, v4, v5, v6}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v3

    cmp-long v3, v1, v3

    if-nez v3, :cond_0

    .line 567
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mToolBarView:Lcom/android/systemui/statusbar/toolbar/ToolBarView;

    invoke-virtual {v3}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getStatusBarService()Lcom/android/systemui/statusbar/BaseStatusBar;

    move-result-object v3

    invoke-virtual {v3, v7}, Lcom/android/systemui/statusbar/BaseStatusBar;->animateCollapsePanels(I)V

    .line 588
    :goto_0
    return-void

    .line 570
    :cond_0
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;

    const-string v4, "gprs_connection_sim_setting"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 571
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;

    invoke-static {v3, v4, v1, v2}, Landroid/provider/Settings$System;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    .line 573
    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 574
    .local v0, intent:Landroid/content/Intent;
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;

    const-string v4, "voice_call_sim_setting"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 575
    const-string v3, "simid"

    invoke-virtual {v0, v3, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 576
    const-string v3, "android.intent.action.VOICE_CALL_DEFAULT_SIM"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 584
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 585
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->updateSimSelectState(Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)V

    .line 586
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mToolBarView:Lcom/android/systemui/statusbar/toolbar/ToolBarView;

    invoke-virtual {v3}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->getStatusBarService()Lcom/android/systemui/statusbar/BaseStatusBar;

    move-result-object v3

    invoke-virtual {v3, v7}, Lcom/android/systemui/statusbar/BaseStatusBar;->animateCollapsePanels(I)V

    goto :goto_0

    .line 577
    :cond_3
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;

    const-string v4, "sms_sim_setting"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 578
    const-string v3, "simid"

    invoke-virtual {v0, v3, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 579
    const-string v3, "android.intent.action.SMS_DEFAULT_SIM"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1

    .line 580
    :cond_4
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;

    const-string v4, "gprs_connection_sim_setting"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 581
    const-string v3, "simid"

    invoke-virtual {v0, v3, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 582
    const-string v3, "android.intent.action.DATA_DEFAULT_SIM"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1
.end method

.method private createDialog(Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)Landroid/app/AlertDialog;
    .locals 9
    .parameter "simInfo"

    .prologue
    const/4 v8, 0x1

    .line 472
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0b0027

    new-array v5, v8, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p1, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mDisplayName:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 476
    .local v2, mText:Ljava/lang/String;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-direct {v1, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 477
    .local v1, b:Landroid/app/AlertDialog$Builder;
    invoke-virtual {v1, v8}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f0b0026

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v8}, Landroid/app/AlertDialog$Builder;->setInverseBackgroundForced(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const/high16 v4, 0x104

    iget-object v5, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mRadioOffListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f0b0029

    iget-object v5, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mRadioOffListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 481
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 482
    .local v0, alertDialog:Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/16 v4, 0x7de

    invoke-virtual {v3, v4}, Landroid/view/Window;->setType(I)V

    .line 483
    return-object v0
.end method

.method private findViewBySlotId(I)Lcom/android/systemui/statusbar/toolbar/SimIconView;
    .locals 3
    .parameter "slotId"

    .prologue
    .line 661
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    .line 662
    .local v1, simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    invoke-virtual {v1}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->getSlotId()I

    move-result v2

    if-ne v2, p1, :cond_0

    .line 666
    .end local v1           #simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    :goto_0
    return-object v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static getMobileDataState(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;
    .locals 2
    .parameter "intent"

    .prologue
    .line 145
    const-string v1, "state"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 146
    .local v0, str:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 147
    const-class v1, Lcom/android/internal/telephony/PhoneConstants$DataState;

    invoke-static {v1, v0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/PhoneConstants$DataState;

    .line 149
    :goto_0
    return-object v1

    :cond_0
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$DataState;->DISCONNECTED:Lcom/android/internal/telephony/PhoneConstants$DataState;

    goto :goto_0
.end method

.method private static isInternetCallEnabled(Landroid/content/Context;)Z
    .locals 4
    .parameter "context"

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 203
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "enable_internet_call_value"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method private radioOnBySlot(I)V
    .locals 6
    .parameter "slot"

    .prologue
    const/4 v5, 0x0

    .line 546
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 548
    .local v0, cr:Landroid/content/ContentResolver;
    const/4 v1, 0x0

    .line 549
    .local v1, dualSimMode:I
    const/4 v2, 0x1

    const-string v3, "airplane_mode_on"

    const/4 v4, -0x1

    invoke-static {v0, v3, v4}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 550
    const-string v2, "SimSwitchPanelView"

    const-string v3, "radioOnBySlot powerRadioOn airplane mode on"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 551
    const-string v2, "airplane_mode_on"

    invoke-static {v0, v2, v5}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 552
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v4, "state"

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 556
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->switchSimRadioState(I)V

    .line 562
    return-void

    .line 554
    :cond_0
    const-string v2, "SimSwitchPanelView"

    const-string v3, "radioOnBySlot powerRadioOn: airplane mode is off"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private showSimIconViews(Ljava/lang/String;)Z
    .locals 6
    .parameter "bussinessType"

    .prologue
    const/16 v5, 0x8

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 207
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentBussinessType:Ljava/lang/String;

    .line 209
    const-string v0, "video_call_sim_setting"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 261
    :goto_0
    return v2

    .line 213
    :cond_0
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimIconInflated:Z

    if-nez v0, :cond_1

    .line 214
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->buildSimIconViews()V

    .line 216
    :cond_1
    const-string v0, "voice_call_sim_setting"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSipCallIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    if-eqz v0, :cond_7

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->isInternetCallEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 219
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSipCallIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-virtual {v0, v2}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setVisibility(I)V

    .line 220
    const-string v3, "SimSwitchPanelView"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mSIMInfoList.size() 220 "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " mAlwaysAskIconView != null is "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAlwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    if-eqz v0, :cond_5

    move v0, v1

    :goto_1
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt v0, v1, :cond_6

    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAlwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    if-eqz v0, :cond_6

    .line 223
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAlwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-virtual {v0, v2}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setVisibility(I)V

    .line 237
    :cond_2
    :goto_2
    const-string v0, "sms_sim_setting"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 238
    const-string v3, "SimSwitchPanelView"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mSIMInfoList.size() 238 "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " mAlwaysAskIconView != null is "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAlwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    if-eqz v0, :cond_9

    move v0, v1

    :goto_3
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, v1, :cond_a

    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAlwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    if-eqz v0, :cond_a

    .line 241
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAlwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-virtual {v0, v2}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setVisibility(I)V

    .line 247
    :cond_3
    :goto_4
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v0

    invoke-interface {v0}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->supportDataTypeAlwaysDisplayWhileOn()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 248
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, v1, :cond_b

    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAutoIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    if-eqz v0, :cond_b

    .line 249
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAutoIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-virtual {v0, v2}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setVisibility(I)V

    :cond_4
    :goto_5
    move v2, v1

    .line 261
    goto/16 :goto_0

    :cond_5
    move v0, v2

    .line 220
    goto/16 :goto_1

    .line 225
    :cond_6
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAlwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    if-eqz v0, :cond_2

    .line 226
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAlwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-virtual {v0, v5}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setVisibility(I)V

    goto :goto_2

    .line 230
    :cond_7
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSipCallIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    if-eqz v0, :cond_8

    .line 231
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSipCallIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-virtual {v0, v5}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setVisibility(I)V

    .line 233
    :cond_8
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gt v0, v1, :cond_2

    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAlwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    if-eqz v0, :cond_2

    .line 234
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAlwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-virtual {v0, v5}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setVisibility(I)V

    goto/16 :goto_2

    :cond_9
    move v0, v2

    .line 238
    goto :goto_3

    .line 243
    :cond_a
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAlwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    if-eqz v0, :cond_3

    .line 244
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAlwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-virtual {v0, v5}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setVisibility(I)V

    goto :goto_4

    .line 251
    :cond_b
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAutoIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    if-eqz v0, :cond_4

    .line 252
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAutoIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-virtual {v0, v5}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setVisibility(I)V

    goto :goto_5

    .line 257
    :cond_c
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAutoIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    if-eqz v0, :cond_4

    .line 258
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mAutoIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-virtual {v0, v5}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setVisibility(I)V

    goto :goto_5
.end method

.method private switchSimId(J)V
    .locals 8
    .parameter "simId"

    .prologue
    const-wide/16 v6, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 603
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;

    if-nez v2, :cond_1

    .line 651
    :cond_0
    :goto_0
    return-void

    .line 608
    :cond_1
    cmp-long v2, p1, v6

    if-lez v2, :cond_2

    .line 609
    invoke-direct {p0, p1, p2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->updateSimIcons(J)V

    goto :goto_0

    .line 610
    :cond_2
    cmp-long v2, p1, v6

    if-nez v2, :cond_3

    .line 611
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 612
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-virtual {v2, v4}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSelected(Z)V

    .line 611
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 614
    .end local v0           #i:I
    :cond_3
    const-wide/16 v2, -0x2

    cmp-long v2, p1, v2

    if-nez v2, :cond_6

    .line 615
    const/4 v0, 0x0

    .restart local v0       #i:I
    :goto_2
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_4

    .line 616
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-virtual {v2, v4}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSelected(Z)V

    .line 615
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 618
    :cond_4
    const-string v2, "SIP_CALL"

    invoke-virtual {p0, v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    .line 619
    .local v1, selectedSimIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    if-nez v1, :cond_5

    .line 621
    const-string v2, "SimSwitchPanelView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "switchSimId failed, bussinessType is: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", simId is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 624
    :cond_5
    invoke-virtual {v1, v5}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSelected(Z)V

    goto :goto_0

    .line 626
    .end local v0           #i:I
    .end local v1           #selectedSimIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    :cond_6
    const-wide/16 v2, -0x1

    cmp-long v2, p1, v2

    if-nez v2, :cond_9

    .line 627
    const/4 v0, 0x0

    .restart local v0       #i:I
    :goto_3
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_7

    .line 628
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-virtual {v2, v4}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSelected(Z)V

    .line 627
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 630
    :cond_7
    const-string v2, "ALWAYS_ASK"

    invoke-virtual {p0, v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    .line 631
    .restart local v1       #selectedSimIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    if-nez v1, :cond_8

    .line 633
    const-string v2, "SimSwitchPanelView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "switchSimId failed, bussinessType is: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", simId is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 636
    :cond_8
    invoke-virtual {v1, v5}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSelected(Z)V

    goto/16 :goto_0

    .line 638
    .end local v0           #i:I
    .end local v1           #selectedSimIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    :cond_9
    const-wide/16 v2, -0x3

    cmp-long v2, p1, v2

    if-nez v2, :cond_0

    .line 639
    const/4 v0, 0x0

    .restart local v0       #i:I
    :goto_4
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_a

    .line 640
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    invoke-virtual {v2, v4}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSelected(Z)V

    .line 639
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 642
    :cond_a
    const-string v2, "AUTO"

    invoke-virtual {p0, v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    .line 643
    .restart local v1       #selectedSimIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    if-nez v1, :cond_b

    .line 645
    const-string v2, "SimSwitchPanelView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "switchSimId failed, bussinessType is: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", simId is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 648
    :cond_b
    invoke-virtual {v1, v5}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSelected(Z)V

    goto/16 :goto_0
.end method

.method private switchSimRadioState(I)V
    .locals 7
    .parameter "slot"

    .prologue
    .line 513
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "dual_sim_mode_setting"

    const/4 v6, -0x1

    invoke-static {v4, v5, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 515
    .local v0, dualSimMode:I
    move v3, p1

    .line 518
    .local v3, modeSlot:I
    const-string v4, "SimSwitchPanelView"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "The current dual sim mode is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " with slot = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 519
    packed-switch p1, :pswitch_data_0

    .line 533
    const-string v4, "SimSwitchPanelView"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "error of the slot = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 536
    :goto_0
    or-int v1, v0, v3

    .line 537
    .local v1, dualState:I
    const-string v4, "SimSwitchPanelView"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "dualState = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " to RadioOn"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 538
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "dual_sim_mode_setting"

    invoke-static {v4, v5, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 540
    new-instance v2, Landroid/content/Intent;

    const-string v4, "android.intent.action.DUAL_SIM_MODE"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 541
    .local v2, intent:Landroid/content/Intent;
    const-string v4, "mode"

    invoke-virtual {v2, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 542
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 543
    return-void

    .line 521
    .end local v1           #dualState:I
    .end local v2           #intent:Landroid/content/Intent;
    :pswitch_0
    const/4 v3, 0x1

    .line 522
    goto :goto_0

    .line 524
    :pswitch_1
    const/4 v3, 0x2

    .line 525
    goto :goto_0

    .line 527
    :pswitch_2
    const/4 v3, 0x4

    .line 528
    goto :goto_0

    .line 530
    :pswitch_3
    const/16 v3, 0x8

    .line 531
    goto :goto_0

    .line 519
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private updateMobileConnection()V
    .locals 5

    .prologue
    .line 161
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    const-string v3, "gprs_connection_sim_setting"

    invoke-static {v2, v3}, Lcom/android/systemui/statusbar/util/SIMHelper;->getDefaultSIM(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v0

    .line 163
    .local v0, simId:J
    const-string v2, "SimSwitchPanelView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateMobileConnection, simId is"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    invoke-direct {p0, v0, v1}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->switchSimId(J)V

    .line 166
    return-void
.end method

.method private updateSimIcons(J)V
    .locals 2
    .parameter "simId"

    .prologue
    .line 654
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-static {v1, p1, p2}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMInfo(Landroid/content/Context;J)Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;

    move-result-object v0

    .line 655
    .local v0, simInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;
    if-eqz v0, :cond_0

    .line 656
    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->updateSimSelectState(Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)V

    .line 658
    :cond_0
    return-void
.end method

.method private updateSimSelectState(Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)V
    .locals 6
    .parameter "simInfo"

    .prologue
    .line 670
    if-nez p1, :cond_0

    .line 671
    const-string v2, "SimSwitchPanelView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateSimSelectState failed for simInfo is null, bussinessType is: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 686
    :goto_0
    return-void

    .line 674
    :cond_0
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 675
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSelected(Z)V

    .line 674
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 677
    :cond_1
    iget v2, p1, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mSimSlotId:I

    invoke-direct {p0, v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->findViewBySlotId(I)Lcom/android/systemui/statusbar/toolbar/SimIconView;

    move-result-object v1

    .line 678
    .local v1, selectedSimIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    if-eqz v1, :cond_2

    .line 679
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSelected(Z)V

    goto :goto_0

    .line 682
    :cond_2
    const-string v2, "SimSwitchPanelView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateSimSelectState failed, bussinessType is: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", simId is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p1, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mSimInfoId:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public dismissDialogs()V
    .locals 1

    .prologue
    .line 487
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSwitchDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 488
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSwitchDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 490
    :cond_0
    return-void
.end method

.method protected getSuggestedMinimumWidth()I
    .locals 1

    .prologue
    .line 179
    const/4 v0, 0x0

    return v0
.end method

.method public isPanelShowing()Z
    .locals 1

    .prologue
    .line 269
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mPanelShowing:Z

    return v0
.end method

.method public setPanelShowing(Z)V
    .locals 0
    .parameter "showing"

    .prologue
    .line 265
    iput-boolean p1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mPanelShowing:Z

    .line 266
    return-void
.end method

.method public setToolBar(Lcom/android/systemui/statusbar/toolbar/ToolBarView;)V
    .locals 0
    .parameter "toolBarView"

    .prologue
    .line 199
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mToolBarView:Lcom/android/systemui/statusbar/toolbar/ToolBarView;

    .line 200
    return-void
.end method

.method setUpdates(Z)V
    .locals 4
    .parameter "update"

    .prologue
    const/4 v3, 0x0

    .line 183
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mUpdating:Z

    if-eq p1, v1, :cond_0

    .line 184
    iput-boolean p1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mUpdating:Z

    .line 185
    if-eqz p1, :cond_1

    .line 187
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 188
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 189
    const-string v1, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 190
    const-string v1, "android.intent.action.ANY_DATA_STATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 191
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0, v3, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 196
    .end local v0           #filter:Landroid/content/IntentFilter;
    :cond_0
    :goto_0
    return-void

    .line 193
    :cond_1
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    goto :goto_0
.end method

.method public updateResources()V
    .locals 9

    .prologue
    .line 689
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-eqz v3, :cond_2

    .line 690
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSimInconViews:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x2

    if-lt v3, v4, :cond_0

    .line 691
    const-string v3, "SIP_CALL"

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    .line 692
    .local v2, sipIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    if-eqz v2, :cond_0

    .line 693
    const v3, 0x7f0b001c

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setOpName(I)V

    .line 697
    .end local v2           #sipIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    :cond_0
    const-string v3, "ALWAYS_ASK"

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    .line 698
    .local v0, alwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    if-eqz v0, :cond_1

    .line 699
    const v3, 0x7f0b0004

    invoke-virtual {v0, v3}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setOpName(I)V

    .line 703
    :cond_1
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v3

    invoke-interface {v3}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->supportDataTypeAlwaysDisplayWhileOn()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 704
    const-string v3, "AUTO"

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/systemui/statusbar/toolbar/SimIconView;

    .line 705
    .local v1, autoIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    if-eqz v1, :cond_2

    .line 706
    const v3, 0x7f0b0005

    invoke-virtual {v1, v3}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setOpName(I)V

    .line 711
    .end local v0           #alwaysAskIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    .end local v1           #autoIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    :cond_2
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSwitchDialog:Landroid/app/AlertDialog;

    if-eqz v3, :cond_3

    .line 712
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSwitchDialog:Landroid/app/AlertDialog;

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0b0026

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 713
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSwitchDialog:Landroid/app/AlertDialog;

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v3

    const v4, 0x7f0b0029

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(I)V

    .line 714
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSwitchDialog:Landroid/app/AlertDialog;

    const/4 v4, -0x2

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v3

    const/high16 v4, 0x104

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(I)V

    .line 715
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mChooseSIMInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;

    if-eqz v3, :cond_3

    .line 717
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSwitchDialog:Landroid/app/AlertDialog;

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0b0027

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mChooseSIMInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;

    iget-object v8, v8, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mDisplayName:Ljava/lang/String;

    aput-object v8, v6, v7

    invoke-virtual {v4, v5, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 724
    :cond_3
    return-void
.end method

.method public updateSimInfo()V
    .locals 0

    .prologue
    .line 157
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->buildSimIconViews()V

    .line 158
    return-void
.end method

.method public final updateSimService(Ljava/lang/String;)Z
    .locals 6
    .parameter "bussinessType"

    .prologue
    .line 591
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;

    .line 592
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->showSimIconViews(Ljava/lang/String;)Z

    move-result v0

    .line 593
    .local v0, shouldShowSim:Z
    const-wide/16 v1, -0x1

    .line 594
    .local v1, simId:J
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-wide/16 v4, -0x1

    invoke-static {v3, p1, v4, v5}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v1

    .line 596
    const-string v3, "SimSwitchPanelView"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "updateSimService, bussinessType is: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", simId is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 598
    invoke-direct {p0, v1, v2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->switchSimId(J)V

    .line 599
    const/4 v3, 0x1

    return v3
.end method
