.class public Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;
.super Landroid/preference/PreferenceActivity;
.source "OOBEStepPreferenceActivity.java"

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

.field private mWindowLayoutParams:Landroid/view/WindowManager$LayoutParams;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 58
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mLastStep:Z

    return-void
.end method


# virtual methods
.method protected finishActivityByResultCode(I)V
    .locals 4
    .parameter "resultCode"

    .prologue
    .line 184
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 185
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p0, p1, v0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->setResult(ILandroid/content/Intent;)V

    .line 186
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->finish()V

    .line 187
    const-string v1, "OOBE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Finish "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    return-void
.end method

.method protected getStepSpecialTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 216
    const-string v0, "OOBEStepPreferenceActivity"

    return-object v0
.end method

.method protected initLayout()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 111
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mStepSpecialTag:Ljava/lang/String;

    .line 112
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "oobe_step_total"

    invoke-virtual {v2, v3, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mTotalStep:I

    .line 113
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "oobe_step_index"

    invoke-virtual {v2, v3, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mStepIndex:I

    .line 114
    const-string v2, "OOBE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mStepSpecialTag:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " initLayout(), step index = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mStepIndex:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mTotalStep:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    const v2, 0x7f0b0057

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mSettingTitle:Landroid/widget/TextView;

    .line 117
    const v2, 0x7f0b0030

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    iput-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mProgressbarLayout:Landroid/widget/LinearLayout;

    .line 118
    const v2, 0x7f0b0006

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mBackBtn:Landroid/widget/Button;

    .line 119
    const v2, 0x7f0b0007

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mNextBtn:Landroid/widget/Button;

    .line 121
    iget v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mStepIndex:I

    if-ne v2, v5, :cond_0

    .line 122
    iget-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mBackBtn:Landroid/widget/Button;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 124
    :cond_0
    iget-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mBackBtn:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 125
    iget-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mNextBtn:Landroid/widget/Button;

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 127
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mTotalStep:I

    if-ge v1, v2, :cond_2

    .line 128
    iget-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mProgressbarLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 129
    .local v0, child:Landroid/widget/ImageView;
    iget v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mStepIndex:I

    add-int/lit8 v2, v2, -0x1

    if-ne v1, v2, :cond_1

    .line 130
    const v2, 0x7f020033

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 134
    :goto_1
    invoke-virtual {v0, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 127
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 132
    :cond_1
    const v2, 0x7f020032

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1

    .line 136
    .end local v0           #child:Landroid/widget/ImageView;
    :cond_2
    iget v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mTotalStep:I

    iget v3, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mStepIndex:I

    if-ne v2, v3, :cond_3

    .line 137
    const-string v2, "OOBE"

    const-string v3, "Get to last settings step"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    iput-boolean v5, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mLastStep:Z

    .line 139
    iget-object v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mNextBtn:Landroid/widget/Button;

    const v3, 0x7f090048

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(I)V

    .line 141
    :cond_3
    return-void
.end method

.method protected initSpecialLayout(II)V
    .locals 1
    .parameter "titleRes"
    .parameter "summaryRes"

    .prologue
    .line 147
    iget-object v0, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mSettingTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 148
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    const/4 v1, 0x1

    .line 152
    iget-object v0, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mBackBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_1

    .line 153
    iget v0, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mStepIndex:I

    if-ne v0, v1, :cond_0

    .line 154
    const/16 v0, 0x16

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->finishActivityByResultCode(I)V

    .line 163
    :goto_0
    return-void

    .line 156
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onNextStep(Z)V

    goto :goto_0

    .line 158
    :cond_1
    iget-object v0, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mNextBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_2

    .line 159
    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onNextStep(Z)V

    goto :goto_0

    .line 161
    :cond_2
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->getStepSpecialTag()Ljava/lang/String;

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
    .parameter "savedInstanceState"

    .prologue
    .line 77
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 78
    const v0, 0x7f030005

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->setContentView(I)V

    .line 79
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->initLayout()V

    .line 83
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 6
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 192
    packed-switch p1, :pswitch_data_0

    .line 212
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/preference/PreferenceActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v2

    :cond_0
    return v2

    .line 194
    :pswitch_0
    const-string v3, "OOBE"

    const-string v4, "Press back button to former settings"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "oobe_has_run"

    invoke-static {v3, v4, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 200
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

    .line 202
    if-eqz v0, :cond_0

    .line 206
    const/16 v1, 0x15

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->finishActivityByResultCode(I)V

    goto :goto_0

    .line 192
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
    .end packed-switch
.end method

.method public onNextStep(Z)V
    .locals 3
    .parameter "isNext"

    .prologue
    .line 170
    if-nez p1, :cond_0

    .line 171
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ">>Back to former settings, mStepIndex="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mStepIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    const/16 v0, 0x15

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->finishActivityByResultCode(I)V

    .line 181
    :goto_0
    return-void

    .line 174
    :cond_0
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ">>Forward to next settings"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->finishActivityByResultCode(I)V

    goto :goto_0
.end method

.method public setScreenOrientation()V
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 92
    new-instance v1, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v1}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    iput-object v1, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mWindowLayoutParams:Landroid/view/WindowManager$LayoutParams;

    .line 93
    const-string v1, "lockscreen.rot_override"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x1110027

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 96
    .local v0, enableScreenRotation:Z
    :cond_1
    if-nez v0, :cond_2

    .line 100
    const-string v1, "OOBE"

    const-string v2, "Rotation sensor for lock screen Off!"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    iget-object v1, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mWindowLayoutParams:Landroid/view/WindowManager$LayoutParams;

    const/4 v2, 0x5

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->screenOrientation:I

    .line 105
    :goto_0
    return-void

    .line 97
    :cond_2
    const-string v1, "OOBE"

    const-string v2, "Rotation sensor for lock screen On!"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    iget-object v1, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mWindowLayoutParams:Landroid/view/WindowManager$LayoutParams;

    const/4 v2, 0x4

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->screenOrientation:I

    goto :goto_0
.end method
