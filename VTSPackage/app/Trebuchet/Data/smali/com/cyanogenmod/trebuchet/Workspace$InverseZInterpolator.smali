.class Lcom/cyanogenmod/trebuchet/Workspace$InverseZInterpolator;
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
    name = "InverseZInterpolator"
.end annotation


# instance fields
.field private zInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;


# direct methods
.method public constructor <init>(F)V
    .locals 1
    .parameter "foc"

    .prologue
    .line 2068
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2069
    new-instance v0, Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;

    invoke-direct {v0, p1}, Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;-><init>(F)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$InverseZInterpolator;->zInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;

    .line 2070
    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 3
    .parameter "input"

    .prologue
    const/high16 v2, 0x3f80

    .line 2072
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$InverseZInterpolator;->zInterpolator:Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;

    sub-float v1, v2, p1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace$ZInterpolator;->getInterpolation(F)F

    move-result v0

    sub-float v0, v2, v0

    return v0
.end method
