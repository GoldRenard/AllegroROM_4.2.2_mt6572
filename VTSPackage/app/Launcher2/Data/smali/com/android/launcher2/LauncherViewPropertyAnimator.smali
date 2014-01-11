.class public Lcom/android/launcher2/LauncherViewPropertyAnimator;
.super Landroid/animation/Animator;
.source "LauncherViewPropertyAnimator.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;
    }
.end annotation


# instance fields
.field mAlpha:F

.field mDuration:J

.field mInterpolator:Landroid/animation/TimeInterpolator;

.field mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/animation/Animator$AnimatorListener;",
            ">;"
        }
    .end annotation
.end field

.field mPropertiesToSet:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet",
            "<",
            "Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;",
            ">;"
        }
    .end annotation
.end field

.field mRotationY:F

.field mRunning:Z

.field mScaleX:F

.field mScaleY:F

.field mStartDelay:J

.field mTarget:Landroid/view/View;

.field mTranslationX:F

.field mTranslationY:F

.field mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .parameter "target"

    .prologue
    .line 56
    invoke-direct {p0}, Landroid/animation/Animator;-><init>()V

    .line 40
    const-class v0, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-static {v0}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mRunning:Z

    .line 57
    iput-object p1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mTarget:Landroid/view/View;

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    .line 59
    return-void
.end method


# virtual methods
.method public addListener(Landroid/animation/Animator$AnimatorListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 63
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    return-void
.end method

.method public alpha(F)Lcom/android/launcher2/LauncherViewPropertyAnimator;
    .locals 2
    .parameter "value"

    .prologue
    .line 252
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->ALPHA:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 253
    iput p1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mAlpha:F

    .line 254
    return-object p0
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    if-eqz v0, :cond_0

    .line 69
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 71
    :cond_0
    return-void
.end method

.method public clone()Landroid/animation/Animator;
    .locals 2

    .prologue
    .line 75
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher2/LauncherViewPropertyAnimator;->clone()Landroid/animation/Animator;

    move-result-object v0

    return-object v0
.end method

.method public end()V
    .locals 2

    .prologue
    .line 80
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDuration()J
    .locals 2

    .prologue
    .line 85
    iget-wide v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mDuration:J

    return-wide v0
.end method

.method public getListeners()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/animation/Animator$AnimatorListener;",
            ">;"
        }
    .end annotation

    .prologue
    .line 90
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getStartDelay()J
    .locals 2

    .prologue
    .line 95
    iget-wide v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mStartDelay:J

    return-wide v0
.end method

.method public isRunning()Z
    .locals 1

    .prologue
    .line 135
    iget-boolean v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mRunning:Z

    return v0
.end method

.method public isStarted()Z
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 3
    .parameter "animation"

    .prologue
    .line 100
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 101
    iget-object v2, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/animation/Animator$AnimatorListener;

    .line 102
    .local v1, listener:Landroid/animation/Animator$AnimatorListener;
    invoke-interface {v1, p0}, Landroid/animation/Animator$AnimatorListener;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 100
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 104
    .end local v1           #listener:Landroid/animation/Animator$AnimatorListener;
    :cond_0
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mRunning:Z

    .line 105
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3
    .parameter "animation"

    .prologue
    .line 109
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 110
    iget-object v2, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/animation/Animator$AnimatorListener;

    .line 111
    .local v1, listener:Landroid/animation/Animator$AnimatorListener;
    invoke-interface {v1, p0}, Landroid/animation/Animator$AnimatorListener;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 109
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 113
    .end local v1           #listener:Landroid/animation/Animator$AnimatorListener;
    :cond_0
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mRunning:Z

    .line 114
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 3
    .parameter "animation"

    .prologue
    .line 118
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 119
    iget-object v2, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/animation/Animator$AnimatorListener;

    .line 120
    .local v1, listener:Landroid/animation/Animator$AnimatorListener;
    invoke-interface {v1, p0}, Landroid/animation/Animator$AnimatorListener;->onAnimationRepeat(Landroid/animation/Animator;)V

    .line 118
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 122
    .end local v1           #listener:Landroid/animation/Animator$AnimatorListener;
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 3
    .parameter "animation"

    .prologue
    .line 126
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 127
    iget-object v2, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/animation/Animator$AnimatorListener;

    .line 128
    .local v1, listener:Landroid/animation/Animator$AnimatorListener;
    invoke-interface {v1, p0}, Landroid/animation/Animator$AnimatorListener;->onAnimationStart(Landroid/animation/Animator;)V

    .line 126
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 130
    .end local v1           #listener:Landroid/animation/Animator$AnimatorListener;
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mRunning:Z

    .line 131
    return-void
.end method

.method public removeAllListeners()V
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 146
    return-void
.end method

.method public removeListener(Landroid/animation/Animator$AnimatorListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 150
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 151
    return-void
.end method

.method public rotationY(F)Lcom/android/launcher2/LauncherViewPropertyAnimator;
    .locals 2
    .parameter "value"

    .prologue
    .line 246
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->ROTATION_Y:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 247
    iput p1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mRotationY:F

    .line 248
    return-object p0
.end method

.method public scaleX(F)Lcom/android/launcher2/LauncherViewPropertyAnimator;
    .locals 2
    .parameter "value"

    .prologue
    .line 234
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->SCALE_X:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 235
    iput p1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mScaleX:F

    .line 236
    return-object p0
.end method

.method public scaleY(F)Lcom/android/launcher2/LauncherViewPropertyAnimator;
    .locals 2
    .parameter "value"

    .prologue
    .line 240
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->SCALE_Y:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 241
    iput p1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mScaleY:F

    .line 242
    return-object p0
.end method

.method public setDuration(J)Landroid/animation/Animator;
    .locals 2
    .parameter "duration"

    .prologue
    .line 155
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->DURATION:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 156
    iput-wide p1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mDuration:J

    .line 157
    return-object p0
.end method

.method public setInterpolator(Landroid/animation/TimeInterpolator;)V
    .locals 2
    .parameter "value"

    .prologue
    .line 162
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->INTERPOLATOR:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 163
    iput-object p1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mInterpolator:Landroid/animation/TimeInterpolator;

    .line 164
    return-void
.end method

.method public setStartDelay(J)V
    .locals 2
    .parameter "startDelay"

    .prologue
    .line 168
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->START_DELAY:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 169
    iput-wide p1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mStartDelay:J

    .line 170
    return-void
.end method

.method public setTarget(Ljava/lang/Object;)V
    .locals 2
    .parameter "target"

    .prologue
    .line 174
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setupEndValues()V
    .locals 0

    .prologue
    .line 180
    return-void
.end method

.method public setupStartValues()V
    .locals 0

    .prologue
    .line 184
    return-void
.end method

.method public start()V
    .locals 3

    .prologue
    .line 188
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mTarget:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    .line 189
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->TRANSLATION_X:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 190
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget v1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mTranslationX:F

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 192
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->TRANSLATION_Y:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 193
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget v1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mTranslationY:F

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 195
    :cond_1
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->SCALE_X:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 196
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget v1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mScaleX:F

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 198
    :cond_2
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->ROTATION_Y:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 199
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget v1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mRotationY:F

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;

    .line 201
    :cond_3
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->SCALE_Y:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 202
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget v1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mScaleY:F

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 204
    :cond_4
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->ALPHA:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 205
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget v1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mAlpha:F

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 207
    :cond_5
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->START_DELAY:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 208
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget-wide v1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mStartDelay:J

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    .line 210
    :cond_6
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->DURATION:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 211
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget-wide v1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mDuration:J

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 213
    :cond_7
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->INTERPOLATOR:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 214
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget-object v1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mInterpolator:Landroid/animation/TimeInterpolator;

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 216
    :cond_8
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v0, p0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 217
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 218
    invoke-static {p0}, Lcom/android/launcher2/LauncherAnimUtils;->cancelOnDestroyActivity(Landroid/animation/Animator;)V

    .line 219
    return-void
.end method

.method public translationX(F)Lcom/android/launcher2/LauncherViewPropertyAnimator;
    .locals 2
    .parameter "value"

    .prologue
    .line 222
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->TRANSLATION_X:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 223
    iput p1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mTranslationX:F

    .line 224
    return-object p0
.end method

.method public translationY(F)Lcom/android/launcher2/LauncherViewPropertyAnimator;
    .locals 2
    .parameter "value"

    .prologue
    .line 228
    iget-object v0, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;->TRANSLATION_Y:Lcom/android/launcher2/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 229
    iput p1, p0, Lcom/android/launcher2/LauncherViewPropertyAnimator;->mTranslationY:F

    .line 230
    return-object p0
.end method
