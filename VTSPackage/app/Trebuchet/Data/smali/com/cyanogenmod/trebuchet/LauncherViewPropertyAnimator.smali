.class public Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
.super Landroid/animation/Animator;
.source "LauncherViewPropertyAnimator.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;
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
            "Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;",
            ">;"
        }
    .end annotation
.end field

.field mRotation:F

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
    .line 58
    invoke-direct {p0}, Landroid/animation/Animator;-><init>()V

    .line 41
    const-class v0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-static {v0}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mRunning:Z

    .line 59
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mTarget:Landroid/view/View;

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    .line 61
    return-void
.end method


# virtual methods
.method public addListener(Landroid/animation/Animator$AnimatorListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 65
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    return-void
.end method

.method public alpha(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
    .locals 2
    .parameter "value"

    .prologue
    .line 263
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->ALPHA:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 264
    iput p1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mAlpha:F

    .line 265
    return-object p0
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    if-eqz v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 73
    :cond_0
    return-void
.end method

.method public clone()Landroid/animation/Animator;
    .locals 2

    .prologue
    .line 77
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
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->clone()Landroid/animation/Animator;

    move-result-object v0

    return-object v0
.end method

.method public end()V
    .locals 2

    .prologue
    .line 82
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDuration()J
    .locals 2

    .prologue
    .line 87
    iget-wide v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mDuration:J

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
    .line 92
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getStartDelay()J
    .locals 2

    .prologue
    .line 97
    iget-wide v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mStartDelay:J

    return-wide v0
.end method

.method public isRunning()Z
    .locals 1

    .prologue
    .line 137
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mRunning:Z

    return v0
.end method

.method public isStarted()Z
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

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
    .line 102
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 103
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/animation/Animator$AnimatorListener;

    .line 104
    .local v1, listener:Landroid/animation/Animator$AnimatorListener;
    invoke-interface {v1, p0}, Landroid/animation/Animator$AnimatorListener;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 102
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 106
    .end local v1           #listener:Landroid/animation/Animator$AnimatorListener;
    :cond_0
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mRunning:Z

    .line 107
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3
    .parameter "animation"

    .prologue
    .line 111
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 112
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/animation/Animator$AnimatorListener;

    .line 113
    .local v1, listener:Landroid/animation/Animator$AnimatorListener;
    invoke-interface {v1, p0}, Landroid/animation/Animator$AnimatorListener;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 111
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 115
    .end local v1           #listener:Landroid/animation/Animator$AnimatorListener;
    :cond_0
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mRunning:Z

    .line 116
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 3
    .parameter "animation"

    .prologue
    .line 120
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 121
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/animation/Animator$AnimatorListener;

    .line 122
    .local v1, listener:Landroid/animation/Animator$AnimatorListener;
    invoke-interface {v1, p0}, Landroid/animation/Animator$AnimatorListener;->onAnimationRepeat(Landroid/animation/Animator;)V

    .line 120
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 124
    .end local v1           #listener:Landroid/animation/Animator$AnimatorListener;
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 3
    .parameter "animation"

    .prologue
    .line 128
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 129
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/animation/Animator$AnimatorListener;

    .line 130
    .local v1, listener:Landroid/animation/Animator$AnimatorListener;
    invoke-interface {v1, p0}, Landroid/animation/Animator$AnimatorListener;->onAnimationStart(Landroid/animation/Animator;)V

    .line 128
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 132
    .end local v1           #listener:Landroid/animation/Animator$AnimatorListener;
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mRunning:Z

    .line 133
    return-void
.end method

.method public removeAllListeners()V
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 148
    return-void
.end method

.method public removeListener(Landroid/animation/Animator$AnimatorListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 152
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 153
    return-void
.end method

.method public rotation(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
    .locals 2
    .parameter "value"

    .prologue
    .line 251
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->ROTATION:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 252
    iput p1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mRotation:F

    .line 253
    return-object p0
.end method

.method public rotationY(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
    .locals 2
    .parameter "value"

    .prologue
    .line 257
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->ROTATION_Y:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 258
    iput p1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mRotationY:F

    .line 259
    return-object p0
.end method

.method public scaleX(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
    .locals 2
    .parameter "value"

    .prologue
    .line 239
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->SCALE_X:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 240
    iput p1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mScaleX:F

    .line 241
    return-object p0
.end method

.method public scaleY(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
    .locals 2
    .parameter "value"

    .prologue
    .line 245
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->SCALE_Y:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 246
    iput p1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mScaleY:F

    .line 247
    return-object p0
.end method

.method public setDuration(J)Landroid/animation/Animator;
    .locals 2
    .parameter "duration"

    .prologue
    .line 157
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->DURATION:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 158
    iput-wide p1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mDuration:J

    .line 159
    return-object p0
.end method

.method public setInterpolator(Landroid/animation/TimeInterpolator;)V
    .locals 2
    .parameter "value"

    .prologue
    .line 164
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->INTERPOLATOR:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 165
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mInterpolator:Landroid/animation/TimeInterpolator;

    .line 166
    return-void
.end method

.method public setStartDelay(J)V
    .locals 2
    .parameter "startDelay"

    .prologue
    .line 170
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->START_DELAY:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 171
    iput-wide p1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mStartDelay:J

    .line 172
    return-void
.end method

.method public setTarget(Ljava/lang/Object;)V
    .locals 2
    .parameter "target"

    .prologue
    .line 176
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setupEndValues()V
    .locals 0

    .prologue
    .line 182
    return-void
.end method

.method public setupStartValues()V
    .locals 0

    .prologue
    .line 186
    return-void
.end method

.method public start()V
    .locals 3

    .prologue
    .line 190
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mTarget:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    .line 191
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->TRANSLATION_X:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 192
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mTranslationX:F

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 194
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->TRANSLATION_Y:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 195
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mTranslationY:F

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 197
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->SCALE_X:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 198
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mScaleX:F

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 200
    :cond_2
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->ROTATION:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 201
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mRotation:F

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->rotation(F)Landroid/view/ViewPropertyAnimator;

    .line 203
    :cond_3
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->ROTATION_Y:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 204
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mRotationY:F

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;

    .line 206
    :cond_4
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->SCALE_Y:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 207
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mScaleY:F

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 209
    :cond_5
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->ALPHA:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 210
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mAlpha:F

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 212
    :cond_6
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->START_DELAY:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 213
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget-wide v1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mStartDelay:J

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    .line 215
    :cond_7
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->DURATION:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 216
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget-wide v1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mDuration:J

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 218
    :cond_8
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->INTERPOLATOR:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 219
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mInterpolator:Landroid/animation/TimeInterpolator;

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 221
    :cond_9
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v0, p0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 222
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mViewPropertyAnimator:Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 223
    invoke-static {p0}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->cancelOnDestroyActivity(Landroid/animation/Animator;)V

    .line 224
    return-void
.end method

.method public translationX(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
    .locals 2
    .parameter "value"

    .prologue
    .line 227
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->TRANSLATION_X:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 228
    iput p1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mTranslationX:F

    .line 229
    return-object p0
.end method

.method public translationY(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
    .locals 2
    .parameter "value"

    .prologue
    .line 233
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mPropertiesToSet:Ljava/util/EnumSet;

    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;->TRANSLATION_Y:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator$Properties;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    .line 234
    iput p1, p0, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->mTranslationY:F

    .line 235
    return-object p0
.end method
