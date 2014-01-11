.class public Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;
.super Landroid/app/Activity;
.source "AdvanceSettingsEnd.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "OOBE"


# instance fields
.field private mBackBtn:Landroid/widget/Button;

.field protected mLastStep:Z

.field private mNextBtn:Landroid/widget/Button;

.field private mProgressbarLayout:Landroid/widget/LinearLayout;

.field protected mStepIndex:I

.field private mStepSpecialTag:Ljava/lang/String;

.field protected mTotalStep:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 51
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 59
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->mLastStep:Z

    return-void
.end method


# virtual methods
.method protected getStepSpecialTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    const-string v0, "AdvanceSettingsEnd"

    return-object v0
.end method

.method protected initLayout()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 73
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->mStepSpecialTag:Ljava/lang/String;

    .line 75
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "oobe_step_total"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->mTotalStep:I

    .line 76
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "oobe_step_index"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->mStepIndex:I

    .line 77
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->mStepSpecialTag:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "initLayout(), step index = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->mStepIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->mTotalStep:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    const v0, 0x7f0b0006

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->mBackBtn:Landroid/widget/Button;

    .line 81
    const v0, 0x7f0b0007

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->mNextBtn:Landroid/widget/Button;

    .line 86
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->mBackBtn:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->mNextBtn:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    iget v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->mTotalStep:I

    iget v1, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->mStepIndex:I

    if-ne v0, v1, :cond_0

    .line 99
    const-string v0, "OOBE"

    const-string v1, "Get to last settings step"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    iput-boolean v3, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->mLastStep:Z

    .line 101
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->mNextBtn:Landroid/widget/Button;

    const v1, 0x7f09004a

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 104
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 108
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->mNextBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_1

    .line 109
    const-string v0, "OOBE"

    const-string v1, "Finish advance settings, exit now"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    const/16 v0, 0x16

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->setResult(I)V

    .line 111
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->finish()V

    .line 117
    :cond_0
    :goto_0
    return-void

    .line 112
    :cond_1
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->mBackBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_0

    .line 113
    const-string v0, "OOBE"

    const-string v1, "bact to previous OOBE"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    const/16 v0, 0x15

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->setResult(I)V

    .line 115
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->finish()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 63
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 64
    const v0, 0x7f030001

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->setContentView(I)V

    .line 66
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->initLayout()V

    .line 67
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 121
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 122
    const/16 v0, 0x16

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->setResult(I)V

    .line 123
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEnd;->finish()V

    .line 124
    const/4 v0, 0x1

    .line 126
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method
