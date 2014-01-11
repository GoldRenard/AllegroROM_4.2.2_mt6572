.class public Lcom/cyanogenmod/trebuchet/PagedView$QuintInterpolator;
.super Ljava/lang/Object;
.source "PagedView.java"

# interfaces
.implements Landroid/view/animation/Interpolator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/PagedView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "QuintInterpolator"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1685
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1686
    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 2
    .parameter "t"

    .prologue
    const/high16 v1, 0x3f80

    .line 1689
    sub-float/2addr p1, v1

    .line 1690
    mul-float v0, p1, p1

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    add-float/2addr v0, v1

    return v0
.end method
