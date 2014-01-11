.class public Lcom/android/systemui/statusbar/GestureRecorder$Gesture$MotionEventRecord;
.super Lcom/android/systemui/statusbar/GestureRecorder$Gesture$Record;
.source "GestureRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/GestureRecorder$Gesture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MotionEventRecord"
.end annotation


# instance fields
.field public event:Landroid/view/MotionEvent;

.field final synthetic this$1:Lcom/android/systemui/statusbar/GestureRecorder$Gesture;


# direct methods
.method public constructor <init>(Lcom/android/systemui/statusbar/GestureRecorder$Gesture;JLandroid/view/MotionEvent;)V
    .registers 6
    .parameter
    .parameter "when"
    .parameter "event"

    .prologue
    .line 47
    iput-object p1, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$MotionEventRecord;->this$1:Lcom/android/systemui/statusbar/GestureRecorder$Gesture;

    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$Record;-><init>(Lcom/android/systemui/statusbar/GestureRecorder$Gesture;)V

    .line 48
    iput-wide p2, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$Record;->time:J

    .line 49
    invoke-virtual {p4}, Landroid/view/MotionEvent;->copy()Landroid/view/MotionEvent;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$MotionEventRecord;->event:Landroid/view/MotionEvent;

    .line 50
    return-void
.end method


# virtual methods
.method actionName(I)Ljava/lang/String;
    .registers 3
    .parameter "action"

    .prologue
    .line 52
    packed-switch p1, :pswitch_data_14

    .line 62
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 54
    :pswitch_8
    const-string v0, "down"

    goto :goto_7

    .line 56
    :pswitch_b
    const-string v0, "up"

    goto :goto_7

    .line 58
    :pswitch_e
    const-string v0, "move"

    goto :goto_7

    .line 60
    :pswitch_11
    const-string v0, "cancel"

    goto :goto_7

    .line 52
    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_8
        :pswitch_b
        :pswitch_e
        :pswitch_11
    .end packed-switch
.end method

.method public toJson()Ljava/lang/String;
    .registers 6

    .prologue
    .line 66
    const-string v0, "{\"type\":\"motion\", \"time\":%d, \"action\":\"%s\", \"x\":%.2f, \"y\":%.2f, \"s\":%.2f, \"p\":%.2f}"

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-wide v3, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$Record;->time:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$MotionEventRecord;->event:Landroid/view/MotionEvent;

    invoke-virtual {v3}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$MotionEventRecord;->actionName(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$MotionEventRecord;->event:Landroid/view/MotionEvent;

    invoke-virtual {v3}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$MotionEventRecord;->event:Landroid/view/MotionEvent;

    invoke-virtual {v3}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$MotionEventRecord;->event:Landroid/view/MotionEvent;

    invoke-virtual {v3}, Landroid/view/MotionEvent;->getSize()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    iget-object v3, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$MotionEventRecord;->event:Landroid/view/MotionEvent;

    invoke-virtual {v3}, Landroid/view/MotionEvent;->getPressure()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
