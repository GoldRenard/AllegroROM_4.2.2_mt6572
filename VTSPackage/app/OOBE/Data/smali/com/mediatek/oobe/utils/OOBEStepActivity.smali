.class public Lcom/mediatek/oobe/utils/OOBEStepActivity;
.super Landroid/app/Activity;
.source "OOBEStepActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field protected static final TAG:Ljava/lang/String; = "OOBE"


# instance fields
.field protected mBackBtn:Landroid/widget/Button;

.field protected mLastStep:Z

.field protected mNextBtn:Landroid/widget/Button;

.field protected mProgressbarLayout:Landroid/widget/LinearLayout;

.field private mSettingTitle:Landroid/widget/TextView;

.field protected mStepIndex:I

.field private mStepSpecialTag:Ljava/lang/String;

.field protected mTotalStep:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 54
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 61
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mLastStep:Z

    .line 63
    const-string v0, ""

    iput-object v0, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mStepSpecialTag:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected finishActivityByResultCode(I)V
    .locals 4
    .parameter "resultCode"

    .prologue
    .line 160
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 161
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p0, p1, v0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->setResult(ILandroid/content/Intent;)V

    .line 162
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->finish()V

    .line 163
    const-string v1, "OOBE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Finish "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    return-void
.end method

.method protected getStepSpecialTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 189
    const-string v0, "OOBEStepActivity"

    return-object v0
.end method

.method protected initLayout()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 77
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mStepSpecialTag:Ljava/lang/String;

    .line 78
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "oobe_step_total"

    invoke-virtual {v2, v3, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mTotalStep:I

    .line 79
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "oobe_step_index"

    invoke-virtual {v2, v3, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mStepIndex:I

    .line 80
    const-string v2, "OOBE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mStepSpecialTag:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "initLayout(), step index = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mStepIndex:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mTotalStep:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    const v2, 0x7f0b0057

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mSettingTitle:Landroid/widget/TextView;

    .line 83
    const v2, 0x7f0b0030

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    iput-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mProgressbarLayout:Landroid/widget/LinearLayout;

    .line 84
    const v2, 0x7f0b0006

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mBackBtn:Landroid/widget/Button;

    .line 85
    const v2, 0x7f0b0007

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mNextBtn:Landroid/widget/Button;

    .line 87
    iget v2, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mStepIndex:I

    if-ne v2, v5, :cond_0

    .line 88
    iget-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mBackBtn:Landroid/widget/Button;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 90
    :cond_0
    iget-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mBackBtn:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 91
    iget-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mNextBtn:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget v2, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mTotalStep:I

    if-ge v1, v2, :cond_2

    .line 94
    iget-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mProgressbarLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 95
    .local v0, child:Landroid/widget/ImageView;
    iget v2, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mStepIndex:I

    add-int/lit8 v2, v2, -0x1

    if-ne v1, v2, :cond_1

    .line 96
    const v2, 0x7f020033

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 100
    :goto_1
    invoke-virtual {v0, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 93
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 98
    :cond_1
    const v2, 0x7f020032

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1

    .line 102
    .end local v0           #child:Landroid/widget/ImageView;
    :cond_2
    iget v2, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mTotalStep:I

    iget v3, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mStepIndex:I

    if-ne v2, v3, :cond_3

    .line 103
    const-string v2, "OOBE"

    const-string v3, "Get to last settings step"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    iput-boolean v5, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mLastStep:Z

    .line 105
    iget-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mNextBtn:Landroid/widget/Button;

    const v3, 0x7f090048

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(I)V

    .line 107
    :cond_3
    return-void
.end method

.method protected initSpecialLayout(II)V
    .locals 1
    .parameter "titleRes"
    .parameter "summaryRes"

    .prologue
    .line 125
    iget-object v0, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mSettingTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 126
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 130
    iget-object v0, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mBackBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_0

    .line 131
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->onNextStep(Z)V

    .line 137
    :goto_0
    return-void

    .line 132
    :cond_0
    iget-object v0, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mNextBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_1

    .line 133
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->onNextStep(Z)V

    goto :goto_0

    .line 135
    :cond_1
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Which button is clicked??"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "icicle"

    .prologue
    .line 68
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 69
    const v0, 0x7f030009

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->setContentView(I)V

    .line 70
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->initLayout()V

    .line 71
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 6
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 168
    packed-switch p1, :pswitch_data_0

    .line 185
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v2

    :cond_0
    return v2

    .line 170
    :pswitch_0
    const-string v3, "OOBE"

    const-string v4, "Press back button to former settings"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "oobe_has_run"

    invoke-static {v3, v4, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 173
    .local v0, firstRunFlag:I
    const-string v3, "OOBE"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Is first started?"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-nez v0, :cond_1

    move v1, v2

    :cond_1
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    if-eqz v0, :cond_0

    .line 179
    const/16 v1, 0x15

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->finishActivityByResultCode(I)V

    goto :goto_0

    .line 168
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
    .end packed-switch
.end method

.method public onNextStep(Z)V
    .locals 3
    .parameter "isNext"

    .prologue
    .line 146
    if-nez p1, :cond_0

    .line 147
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ">>Back to former settings, mStepIndex="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/oobe/utils/OOBEStepActivity;->mStepIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    const/16 v0, 0x15

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->finishActivityByResultCode(I)V

    .line 157
    :goto_0
    return-void

    .line 150
    :cond_0
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ">>Forward to next settings"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->finishActivityByResultCode(I)V

    goto :goto_0
.end method
