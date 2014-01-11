.class public Lcom/android/systemui/statusbar/GestureRecorder$Gesture;
.super Ljava/lang/Object;
.source "GestureRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/GestureRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Gesture"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/statusbar/GestureRecorder$Gesture$TagRecord;,
        Lcom/android/systemui/statusbar/GestureRecorder$Gesture$MotionEventRecord;,
        Lcom/android/systemui/statusbar/GestureRecorder$Gesture$Record;
    }
.end annotation


# instance fields
.field mComplete:Z

.field mDownTime:J

.field private mRecords:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/android/systemui/statusbar/GestureRecorder$Gesture$Record;",
            ">;"
        }
    .end annotation
.end field

.field private mTags:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/android/systemui/statusbar/GestureRecorder;


# direct methods
.method public constructor <init>(Lcom/android/systemui/statusbar/GestureRecorder;)V
    .locals 2
    .parameter

    .prologue
    .line 40
    iput-object p1, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture;->this$0:Lcom/android/systemui/statusbar/GestureRecorder;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 93
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture;->mRecords:Ljava/util/LinkedList;

    .line 94
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture;->mTags:Ljava/util/HashSet;

    .line 95
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture;->mDownTime:J

    .line 96
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture;->mComplete:Z

    return-void
.end method


# virtual methods
.method public add(Landroid/view/MotionEvent;)V
    .locals 4
    .parameter "ev"

    .prologue
    .line 99
    iget-object v0, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture;->mRecords:Ljava/util/LinkedList;

    new-instance v1, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$MotionEventRecord;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    invoke-direct {v1, p0, v2, v3, p1}, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$MotionEventRecord;-><init>(Lcom/android/systemui/statusbar/GestureRecorder$Gesture;JLandroid/view/MotionEvent;)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 100
    iget-wide v0, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture;->mDownTime:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    .line 101
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture;->mDownTime:J

    .line 108
    :cond_0
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 113
    :goto_1
    :pswitch_0
    return-void

    .line 103
    :cond_1
    iget-wide v0, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture;->mDownTime:J

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 104
    sget-object v0, Lcom/android/systemui/statusbar/GestureRecorder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Assertion failure in GestureRecorder: event downTime ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") does not match gesture downTime ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture;->mDownTime:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 111
    :pswitch_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture;->mComplete:Z

    goto :goto_1

    .line 108
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public isComplete()Z
    .locals 1

    .prologue
    .line 119
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture;->mComplete:Z

    return v0
.end method

.method public tag(JLjava/lang/String;Ljava/lang/String;)V
    .locals 7
    .parameter "when"
    .parameter "tag"
    .parameter "info"

    .prologue
    .line 115
    iget-object v6, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture;->mRecords:Ljava/util/LinkedList;

    new-instance v0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$TagRecord;

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$TagRecord;-><init>(Lcom/android/systemui/statusbar/GestureRecorder$Gesture;JLjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 116
    iget-object v0, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture;->mTags:Ljava/util/HashSet;

    invoke-virtual {v0, p3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 117
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 5

    .prologue
    .line 122
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 123
    .local v3, sb:Ljava/lang/StringBuilder;
    const/4 v0, 0x1

    .line 124
    .local v0, first:Z
    const-string v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    iget-object v4, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture;->mRecords:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$Record;

    .line 126
    .local v2, r:Lcom/android/systemui/statusbar/GestureRecorder$Gesture$Record;
    if-nez v0, :cond_0

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    :cond_0
    const/4 v0, 0x0

    .line 128
    invoke-virtual {v2}, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$Record;->toJson()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 130
    .end local v2           #r:Lcom/android/systemui/statusbar/GestureRecorder$Gesture$Record;
    :cond_1
    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
