.class Lcom/cyanogenmod/trebuchet/Workspace$ZoomOutInterpolator;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Landroid/animation/TimeInterpolator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/Workspace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ZoomOutInterpolator"
.end annotation


# instance fields
.field private final decelerate:Landroid/view/animation/DecelerateInterpolator;

.field private final zInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 2079
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2080
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v1, 0x3f40

    invoke-direct {v0, v1}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$ZoomOutInterpolator;->decelerate:Landroid/view/animation/DecelerateInterpolator;

    .line 2081
    new-instance v0, Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;

    const v1, 0x3e051eb8

    invoke-direct {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;-><init>(F)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$ZoomOutInterpolator;->zInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 2
    .parameter "input"

    .prologue
    .line 2084
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$ZoomOutInterpolator;->decelerate:Landroid/view/animation/DecelerateInterpolator;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace$ZoomOutInterpolator;->zInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;

    invoke-virtual {v1, p1}, Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;->getInterpolation(F)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/animation/DecelerateInterpolator;->getInterpolation(F)F

    move-result v0

    return v0
.end method
