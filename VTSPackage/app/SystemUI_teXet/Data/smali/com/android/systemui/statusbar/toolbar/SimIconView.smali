.class public Lcom/android/systemui/statusbar/toolbar/SimIconView;
.super Landroid/widget/LinearLayout;
.source "SimIconView.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SimIconView"


# instance fields
.field private mOnIndicator:Landroid/widget/ImageView;

.field private mSelected:Z

.field private mSelectedIconColor:I

.field private mSimBackground:I

.field private mSimIcon:Landroid/widget/ImageView;

.field private mSimName:Landroid/widget/TextView;

.field private mSimOpName:Landroid/widget/TextView;

.field private mSimStateView:Landroid/widget/ImageView;

.field private mSimType:Landroid/widget/TextView;

.field private mSlotId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .parameter "context"

    .prologue
    .line 38
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/systemui/statusbar/toolbar/SimIconView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v1, 0x0

    .line 42
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 26
    iput v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSelectedIconColor:I

    .line 27
    iput v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimBackground:I

    .line 35
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSlotId:I

    .line 43
    iput-boolean v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSelected:Z

    .line 44
    return-void
.end method

.method private getFormatedNumber(Ljava/lang/String;I)Ljava/lang/String;
    .registers 5
    .parameter "number"
    .parameter "format"

    .prologue
    const/4 v1, 0x4

    .line 96
    packed-switch p2, :pswitch_data_2c

    .line 110
    const-string p1, ""

    .end local p1
    :cond_6
    :goto_6
    return-object p1

    .line 98
    .restart local p1
    :pswitch_7
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_6

    .line 101
    const/4 v0, 0x0

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto :goto_6

    .line 103
    :pswitch_13
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_6

    .line 106
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto :goto_6

    .line 108
    :pswitch_28
    const-string p1, ""

    goto :goto_6

    .line 96
    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_28
        :pswitch_7
        :pswitch_13
    .end packed-switch
.end method


# virtual methods
.method public getOpName()Landroid/widget/TextView;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimOpName:Landroid/widget/TextView;

    return-object v0
.end method

.method public getSimIcon()Landroid/widget/ImageView;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimIcon:Landroid/widget/ImageView;

    return-object v0
.end method

.method public getSlotId()I
    .registers 2

    .prologue
    .line 144
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSlotId:I

    return v0
.end method

.method public isSelected()Z
    .registers 2

    .prologue
    .line 120
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSelected:Z

    return v0
.end method

.method protected onFinishInflate()V
    .registers 2

    .prologue
    .line 47
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 48
    const v0, 0x7f08011f

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimIcon:Landroid/widget/ImageView;

    .line 49
    const v0, 0x7f080121

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimName:Landroid/widget/TextView;

    .line 50
    const v0, 0x7f080118

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimType:Landroid/widget/TextView;

    .line 51
    const v0, 0x7f080120

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimStateView:Landroid/widget/ImageView;

    .line 52
    const v0, 0x7f08011a

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimOpName:Landroid/widget/TextView;

    .line 53
    const v0, 0x7f08009a

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mOnIndicator:Landroid/widget/ImageView;

    .line 54
    return-void
.end method

.method public set3GIconVisibility(Z)V
    .registers 4
    .parameter "visible"

    .prologue
    .line 80
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimType:Landroid/widget/TextView;

    if-eqz p1, :cond_9

    const/4 v0, 0x0

    :goto_5
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 81
    return-void

    .line 80
    :cond_9
    const/16 v0, 0x8

    goto :goto_5
.end method

.method public setOpName(I)V
    .registers 3
    .parameter "resId"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimOpName:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 85
    return-void
.end method

.method public setSelected(Z)V
    .registers 5
    .parameter "selected"

    .prologue
    const/4 v2, 0x3

    .line 125
    iput-boolean p1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSelected:Z

    .line 126
    if-eqz p1, :cond_3a

    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSelectedIconColor:I

    if-ltz v0, :cond_3a

    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSelectedIconColor:I

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIcons;->SIM_INDICATOR_BACKGROUND:[I

    array-length v1, v1

    if-ge v0, v1, :cond_3a

    .line 127
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSelectedIconColor:I

    if-le v0, v2, :cond_26

    .line 128
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimIcon:Landroid/widget/ImageView;

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIcons;->SIM_INDICATOR_BACKGROUND:[I

    iget v2, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSelectedIconColor:I

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 132
    :cond_1f
    :goto_1f
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mOnIndicator:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 137
    :goto_25
    return-void

    .line 129
    :cond_26
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSelectedIconColor:I

    if-gt v0, v2, :cond_1f

    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSelectedIconColor:I

    if-ltz v0, :cond_1f

    .line 130
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mOnIndicator:Landroid/widget/ImageView;

    sget-object v1, Lcom/android/systemui/statusbar/policy/TelephonyIcons;->SIM_INDICATOR_BACKGROUND:[I

    iget v2, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSelectedIconColor:I

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1f

    .line 134
    :cond_3a
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimIcon:Landroid/widget/ImageView;

    iget v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimBackground:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 135
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mOnIndicator:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_25
.end method

.method public setSimColor(I)V
    .registers 2
    .parameter "color"

    .prologue
    .line 148
    iput p1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSelectedIconColor:I

    .line 149
    return-void
.end method

.method public setSimIconViewResource(I)V
    .registers 3
    .parameter "resId"

    .prologue
    .line 115
    iput p1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimBackground:I

    .line 116
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSelected:Z

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSelected(Z)V

    .line 117
    return-void
.end method

.method public setSlotId(I)V
    .registers 2
    .parameter "id"

    .prologue
    .line 140
    iput p1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSlotId:I

    .line 141
    return-void
.end method

.method public updateSimIcon(Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)V
    .registers 7
    .parameter "info"

    .prologue
    .line 57
    const-string v2, "SimIconView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateSimIcon called, simName is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", simNumber is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mNumber:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    iget-object v2, p1, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mNumber:Ljava/lang/String;

    if-eqz v2, :cond_7b

    iget-object v2, p1, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mNumber:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_7b

    .line 59
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimName:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mNumber:Ljava/lang/String;

    iget v4, p1, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mDispalyNumberFormat:I

    invoke-direct {p0, v3, v4}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->getFormatedNumber(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    :goto_3f
    iget v2, p1, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mSimBackgroundDarkRes:I

    iput v2, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimBackground:I

    .line 64
    iget-boolean v2, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSelected:Z

    invoke-virtual {p0, v2}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSelected(Z)V

    .line 65
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimOpName:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    iget v1, p1, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mSimSlotId:I

    .line 67
    .local v1, slotId:I
    invoke-static {v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSimIndicatorStateGemini(I)I

    move-result v0

    .line 68
    .local v0, simState:I
    const-string v2, "SimIconView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateSimIcon called, simState is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", slotId is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->updateSimState(I)V

    .line 70
    return-void

    .line 61
    .end local v0           #simState:I
    .end local v1           #slotId:I
    :cond_7b
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimName:Landroid/widget/TextView;

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3f
.end method

.method public updateSimState(I)V
    .registers 4
    .parameter "simState"

    .prologue
    .line 73
    invoke-static {p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMStateIcon(I)I

    move-result v0

    .line 74
    .local v0, resId:I
    const/4 v1, -0x1

    if-le v0, v1, :cond_c

    .line 75
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimIconView;->mSimStateView:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 77
    :cond_c
    return-void
.end method
