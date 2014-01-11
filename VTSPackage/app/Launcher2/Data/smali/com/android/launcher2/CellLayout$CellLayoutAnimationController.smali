.class public Lcom/android/launcher2/CellLayout$CellLayoutAnimationController;
.super Landroid/view/animation/LayoutAnimationController;
.source "CellLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/CellLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CellLayoutAnimationController"
.end annotation


# direct methods
.method public constructor <init>(Landroid/view/animation/Animation;F)V
    .locals 0
    .parameter "animation"
    .parameter "delay"

    .prologue
    .line 3162
    invoke-direct {p0, p1, p2}, Landroid/view/animation/LayoutAnimationController;-><init>(Landroid/view/animation/Animation;F)V

    .line 3163
    return-void
.end method


# virtual methods
.method protected getDelayForView(Landroid/view/View;)J
    .locals 4
    .parameter "view"

    .prologue
    .line 3167
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    const-wide v2, 0x4062c00000000000L

    mul-double/2addr v0, v2

    double-to-int v0, v0

    int-to-long v0, v0

    return-wide v0
.end method
