.class Lcom/cyanogenmod/trebuchet/DeleteDropTarget$4;
.super Ljava/lang/Object;
.source "DeleteDropTarget.java"

# interfaces
.implements Landroid/animation/TimeInterpolator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->createFlingToTrashAnimatorListener(Lcom/cyanogenmod/trebuchet/DragLayer;Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;Landroid/graphics/PointF;Landroid/view/ViewConfiguration;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;)V
    .locals 0
    .parameter

    .prologue
    .line 351
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$4;->this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 1
    .parameter "t"

    .prologue
    .line 354
    mul-float v0, p1, p1

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    return v0
.end method
