.class public abstract Lcom/android/systemui/statusbar/util/StateTracker;
.super Ljava/lang/Object;
.source "StateTracker.java"


# static fields
.field private static final DBG:Z = true

.field public static final STATE_DISABLED:I = 0x0

.field public static final STATE_ENABLED:I = 0x1

.field public static final STATE_INTERMEDIATE:I = -0x1

.field public static final STATE_TURNING_OFF:I = 0x3

.field public static final STATE_TURNING_ON:I = 0x2

.field public static final STATE_UNKNOWN:I = -0x2

.field private static final TAG:Ljava/lang/String; = "StateTracker"


# instance fields
.field private mActualState:Ljava/lang/Boolean;

.field private mDeferredStateChangeRequestNeeded:Z

.field protected mInTransition:Z

.field private mIntendedState:Ljava/lang/Boolean;

.field protected mIsUserSwitching:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 20
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-boolean v0, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mInTransition:Z

    .line 31
    iput-object v1, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mActualState:Ljava/lang/Boolean;

    .line 32
    iput-object v1, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIntendedState:Ljava/lang/Boolean;

    .line 38
    iput-boolean v0, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mDeferredStateChangeRequestNeeded:Z

    .line 42
    iput-boolean v0, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIsUserSwitching:Z

    return-void
.end method


# virtual methods
.method public abstract getActualState(Landroid/content/Context;)I
.end method

.method public abstract getDisabledResource()I
.end method

.method public abstract getEnabledResource()I
.end method

.method public abstract getImageButtonView()Landroid/widget/ImageView;
.end method

.method public abstract getIndicatorView()Landroid/widget/ImageView;
.end method

.method public getInterMedateResource()I
    .registers 2

    .prologue
    .line 127
    const/4 v0, -0x1

    return v0
.end method

.method public getIsUserSwitching()Z
    .registers 2

    .prologue
    .line 54
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIsUserSwitching:Z

    return v0
.end method

.method public getSwitchingGifView()Landroid/widget/ImageView;
    .registers 2

    .prologue
    .line 119
    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract getTileView()Landroid/view/View;
.end method

.method public final getTriState(Landroid/content/Context;)I
    .registers 4
    .parameter "context"

    .prologue
    const/4 v0, -0x1

    .line 270
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mInTransition:Z

    if-eqz v1, :cond_6

    .line 286
    :goto_5
    return v0

    .line 280
    :cond_6
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/util/StateTracker;->getActualState(Landroid/content/Context;)I

    move-result v1

    packed-switch v1, :pswitch_data_12

    goto :goto_5

    .line 282
    :pswitch_e
    const/4 v0, 0x0

    goto :goto_5

    .line 284
    :pswitch_10
    const/4 v0, 0x1

    goto :goto_5

    .line 280
    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_e
        :pswitch_10
    .end packed-switch
.end method

.method public isClickable()Z
    .registers 4

    .prologue
    .line 45
    const-string v0, "StateTracker"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " mIsUserSwitching is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIsUserSwitching:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIsUserSwitching:Z

    if-nez v0, :cond_24

    const/4 v0, 0x1

    :goto_23
    return v0

    :cond_24
    const/4 v0, 0x0

    goto :goto_23
.end method

.method public final isTurningOn()Z
    .registers 2

    .prologue
    .line 260
    iget-object v0, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIntendedState:Ljava/lang/Boolean;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIntendedState:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public abstract onActualStateChange(Landroid/content/Context;Landroid/content/Intent;)V
.end method

.method protected abstract requestStateChange(Landroid/content/Context;Z)V
.end method

.method public final setCurrentState(Landroid/content/Context;I)V
    .registers 9
    .parameter "context"
    .parameter "newState"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 217
    const-string v1, "StateTracker"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setCurrentState: newState is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mInTransition:Z

    .line 219
    .local v0, wasInTransition:Z
    packed-switch p2, :pswitch_data_80

    .line 240
    :goto_1f
    if-eqz v0, :cond_4b

    iget-boolean v1, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mInTransition:Z

    if-nez v1, :cond_4b

    .line 241
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mDeferredStateChangeRequestNeeded:Z

    if-eqz v1, :cond_4b

    .line 242
    const-string v1, "StateTracker"

    const-string v2, "processing deferred state change"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    iget-object v1, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mActualState:Ljava/lang/Boolean;

    if-eqz v1, :cond_70

    iget-object v1, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIntendedState:Ljava/lang/Boolean;

    if-eqz v1, :cond_70

    iget-object v1, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIntendedState:Ljava/lang/Boolean;

    iget-object v2, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mActualState:Ljava/lang/Boolean;

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_70

    .line 245
    const-string v1, "StateTracker"

    const-string v2, "... but intended state matches, so no changes."

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    :cond_49
    :goto_49
    iput-boolean v4, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mDeferredStateChangeRequestNeeded:Z

    .line 253
    :cond_4b
    return-void

    .line 221
    :pswitch_4c
    iput-boolean v4, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mInTransition:Z

    .line 222
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mActualState:Ljava/lang/Boolean;

    goto :goto_1f

    .line 225
    :pswitch_55
    iput-boolean v4, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mInTransition:Z

    .line 226
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mActualState:Ljava/lang/Boolean;

    goto :goto_1f

    .line 229
    :pswitch_5e
    iput-boolean v5, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mInTransition:Z

    .line 230
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mActualState:Ljava/lang/Boolean;

    goto :goto_1f

    .line 233
    :pswitch_67
    iput-boolean v5, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mInTransition:Z

    .line 234
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mActualState:Ljava/lang/Boolean;

    goto :goto_1f

    .line 246
    :cond_70
    iget-object v1, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIntendedState:Ljava/lang/Boolean;

    if-eqz v1, :cond_49

    .line 247
    iput-boolean v5, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mInTransition:Z

    .line 248
    iget-object v1, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIntendedState:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {p0, p1, v1}, Lcom/android/systemui/statusbar/util/StateTracker;->requestStateChange(Landroid/content/Context;Z)V

    goto :goto_49

    .line 219
    :pswitch_data_80
    .packed-switch 0x0
        :pswitch_4c
        :pswitch_55
        :pswitch_5e
        :pswitch_67
    .end packed-switch
.end method

.method public setImageViewResources(Landroid/content/Context;)V
    .registers 10
    .parameter "context"

    .prologue
    const/16 v7, 0x8

    const/4 v6, 0x0

    .line 138
    const-string v3, "StateTracker"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "setImageViewResources state is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/util/StateTracker;->getTriState(Landroid/content/Context;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->getIndicatorView()Landroid/widget/ImageView;

    move-result-object v0

    .line 143
    .local v0, indicatorView:Landroid/widget/ImageView;
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/util/StateTracker;->getTriState(Landroid/content/Context;)I

    move-result v3

    packed-switch v3, :pswitch_data_ec

    .line 204
    :cond_2e
    :goto_2e
    return-void

    .line 145
    :pswitch_2f
    iput-boolean v6, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIsUserSwitching:Z

    .line 146
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->getTileView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->isClickable()Z

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 147
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->getImageButtonView()Landroid/widget/ImageView;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 148
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->getImageButtonView()Landroid/widget/ImageView;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->getDisabledResource()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 149
    if-eqz v0, :cond_53

    .line 150
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 152
    :cond_53
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->getSwitchingGifView()Landroid/widget/ImageView;

    move-result-object v2

    .line 153
    .local v2, mtkImageView:Landroid/widget/ImageView;
    if-eqz v2, :cond_2e

    .line 154
    invoke-virtual {v2, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 155
    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/AnimationDrawable;

    .line 156
    .local v1, mFrameAnimation:Landroid/graphics/drawable/AnimationDrawable;
    if-eqz v1, :cond_2e

    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->isRunning()Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 157
    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    goto :goto_2e

    .line 162
    .end local v1           #mFrameAnimation:Landroid/graphics/drawable/AnimationDrawable;
    .end local v2           #mtkImageView:Landroid/widget/ImageView;
    :pswitch_6e
    iput-boolean v6, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIsUserSwitching:Z

    .line 163
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->getTileView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->isClickable()Z

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 164
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->getImageButtonView()Landroid/widget/ImageView;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 165
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->getImageButtonView()Landroid/widget/ImageView;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->getEnabledResource()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 166
    if-eqz v0, :cond_92

    .line 167
    invoke-virtual {v0, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 169
    :cond_92
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->getSwitchingGifView()Landroid/widget/ImageView;

    move-result-object v2

    .line 170
    .restart local v2       #mtkImageView:Landroid/widget/ImageView;
    if-eqz v2, :cond_2e

    .line 171
    invoke-virtual {v2, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 172
    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/AnimationDrawable;

    .line 173
    .restart local v1       #mFrameAnimation:Landroid/graphics/drawable/AnimationDrawable;
    if-eqz v1, :cond_2e

    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->isRunning()Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 174
    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    goto :goto_2e

    .line 184
    .end local v1           #mFrameAnimation:Landroid/graphics/drawable/AnimationDrawable;
    .end local v2           #mtkImageView:Landroid/widget/ImageView;
    :pswitch_ad
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->getTileView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/view/View;->setEnabled(Z)V

    .line 185
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->getSwitchingGifView()Landroid/widget/ImageView;

    move-result-object v2

    .line 186
    .restart local v2       #mtkImageView:Landroid/widget/ImageView;
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->getInterMedateResource()I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_2e

    if-eqz v2, :cond_2e

    .line 187
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->getImageButtonView()Landroid/widget/ImageView;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 188
    if-eqz v0, :cond_cd

    .line 189
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 191
    :cond_cd
    if-eqz v2, :cond_2e

    .line 192
    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 193
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->getInterMedateResource()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 194
    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/AnimationDrawable;

    .line 195
    .restart local v1       #mFrameAnimation:Landroid/graphics/drawable/AnimationDrawable;
    if-eqz v1, :cond_2e

    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->isRunning()Z

    move-result v3

    if-nez v3, :cond_2e

    .line 196
    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    goto/16 :goto_2e

    .line 143
    :pswitch_data_ec
    .packed-switch -0x1
        :pswitch_ad
        :pswitch_2f
        :pswitch_6e
    .end packed-switch
.end method

.method public setIsUserSwitching(Z)V
    .registers 2
    .parameter "enable"

    .prologue
    .line 50
    iput-boolean p1, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIsUserSwitching:Z

    .line 51
    return-void
.end method

.method public toggleState(Landroid/content/Context;)V
    .registers 7
    .parameter "context"

    .prologue
    const/4 v2, 0x1

    .line 63
    const-string v3, "ClickEvent"

    const-string v4, "toggleState"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    iput-boolean v2, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIsUserSwitching:Z

    .line 65
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->getTileView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/util/StateTracker;->isClickable()Z

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 66
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/util/StateTracker;->getTriState(Landroid/content/Context;)I

    move-result v0

    .line 67
    .local v0, currentState:I
    const/4 v1, 0x0

    .line 68
    .local v1, newState:Z
    packed-switch v0, :pswitch_data_44

    .line 83
    :cond_1d
    :goto_1d
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIntendedState:Ljava/lang/Boolean;

    .line 84
    iget-boolean v3, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mInTransition:Z

    if-eqz v3, :cond_3e

    .line 89
    iput-boolean v2, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mDeferredStateChangeRequestNeeded:Z

    .line 94
    :goto_29
    return-void

    .line 70
    :pswitch_2a
    const/4 v1, 0x0

    .line 71
    goto :goto_1d

    .line 73
    :pswitch_2c
    const/4 v1, 0x1

    .line 74
    goto :goto_1d

    .line 76
    :pswitch_2e
    iget-object v3, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIntendedState:Ljava/lang/Boolean;

    if-eqz v3, :cond_1d

    .line 77
    iget-object v3, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mIntendedState:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_3c

    move v1, v2

    :goto_3b
    goto :goto_1d

    :cond_3c
    const/4 v1, 0x0

    goto :goto_3b

    .line 91
    :cond_3e
    iput-boolean v2, p0, Lcom/android/systemui/statusbar/util/StateTracker;->mInTransition:Z

    .line 92
    invoke-virtual {p0, p1, v1}, Lcom/android/systemui/statusbar/util/StateTracker;->requestStateChange(Landroid/content/Context;Z)V

    goto :goto_29

    .line 68
    :pswitch_data_44
    .packed-switch -0x1
        :pswitch_2e
        :pswitch_2c
        :pswitch_2a
    .end packed-switch
.end method
