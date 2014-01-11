.class Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;
.super Ljava/lang/Object;
.source "PanelView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MotionEventCopy"
.end annotation


# instance fields
.field public t:J

.field public x:F

.field public y:F


# direct methods
.method public constructor <init>(FFJ)V
    .registers 5
    .parameter "x2"
    .parameter "y2"
    .parameter "eventTime"

    .prologue
    .line 94
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 95
    iput p1, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;->x:F

    .line 96
    iput p2, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;->y:F

    .line 97
    iput-wide p3, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;->t:J

    .line 98
    return-void
.end method
