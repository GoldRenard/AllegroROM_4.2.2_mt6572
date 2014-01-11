.class public Lcom/android/launcher2/SmoothPagedView$OvershootInterpolator;
.super Ljava/lang/Object;
.source "SmoothPagedView.java"

# interfaces
.implements Landroid/view/animation/Interpolator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/SmoothPagedView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OvershootInterpolator"
.end annotation


# static fields
.field private static final DEFAULT_TENSION:F = 1.3f


# instance fields
.field private mTension:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const v0, 0x3fa66666

    iput v0, p0, Lcom/android/launcher2/SmoothPagedView$OvershootInterpolator;->mTension:F

    .line 44
    return-void
.end method


# virtual methods
.method public disableSettle()V
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/launcher2/SmoothPagedView$OvershootInterpolator;->mTension:F

    .line 52
    return-void
.end method

.method public getInterpolation(F)F
    .locals 4
    .parameter "t"

    .prologue
    const/high16 v3, 0x3f80

    .line 57
    sub-float/2addr p1, v3

    .line 58
    mul-float v0, p1, p1

    iget v1, p0, Lcom/android/launcher2/SmoothPagedView$OvershootInterpolator;->mTension:F

    add-float/2addr v1, v3

    mul-float/2addr v1, p1

    iget v2, p0, Lcom/android/launcher2/SmoothPagedView$OvershootInterpolator;->mTension:F

    add-float/2addr v1, v2

    mul-float/2addr v0, v1

    add-float/2addr v0, v3

    return v0
.end method

.method public setDistance(I)V
    .locals 2
    .parameter "distance"

    .prologue
    const v0, 0x3fa66666

    .line 47
    if-lez p1, :cond_0

    int-to-float v1, p1

    div-float/2addr v0, v1

    :cond_0
    iput v0, p0, Lcom/android/launcher2/SmoothPagedView$OvershootInterpolator;->mTension:F

    .line 48
    return-void
.end method
