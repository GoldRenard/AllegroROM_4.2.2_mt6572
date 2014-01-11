.class Lcom/android/launcher2/Workspace$InverseZInterpolator;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Landroid/animation/TimeInterpolator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/Workspace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "InverseZInterpolator"
.end annotation


# instance fields
.field private zInterpolator:Lcom/android/launcher2/Workspace$ZInterpolator;


# direct methods
.method public constructor <init>(F)V
    .locals 1
    .parameter "foc"

    .prologue
    .line 1546
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 1547
    new-instance v0, Lcom/android/launcher2/Workspace$ZInterpolator;

    invoke-direct {v0, p1}, Lcom/android/launcher2/Workspace$ZInterpolator;-><init>(F)V

    iput-object v0, p0, Lcom/android/launcher2/Workspace$InverseZInterpolator;->zInterpolator:Lcom/android/launcher2/Workspace$ZInterpolator;

    .line 1548
    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 3
    .parameter "input"

    .prologue
    const/high16 v2, 0x3f80

    .line 1550
    iget-object v0, p0, Lcom/android/launcher2/Workspace$InverseZInterpolator;->zInterpolator:Lcom/android/launcher2/Workspace$ZInterpolator;

    sub-float v1, v2, p1

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace$ZInterpolator;->getInterpolation(F)F

    move-result v0

    sub-float v0, v2, v0

    return v0
.end method
