.class public Lcom/android/systemui/statusbar/GestureRecorder$Gesture$TagRecord;
.super Lcom/android/systemui/statusbar/GestureRecorder$Gesture$Record;
.source "GestureRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/GestureRecorder$Gesture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TagRecord"
.end annotation


# instance fields
.field public info:Ljava/lang/String;

.field public tag:Ljava/lang/String;

.field final synthetic this$1:Lcom/android/systemui/statusbar/GestureRecorder$Gesture;


# direct methods
.method public constructor <init>(Lcom/android/systemui/statusbar/GestureRecorder$Gesture;JLjava/lang/String;Ljava/lang/String;)V
    .registers 6
    .parameter
    .parameter "when"
    .parameter "tag"
    .parameter "info"

    .prologue
    .line 80
    iput-object p1, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$TagRecord;->this$1:Lcom/android/systemui/statusbar/GestureRecorder$Gesture;

    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$Record;-><init>(Lcom/android/systemui/statusbar/GestureRecorder$Gesture;)V

    .line 81
    iput-wide p2, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$Record;->time:J

    .line 82
    iput-object p4, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$TagRecord;->tag:Ljava/lang/String;

    .line 83
    iput-object p5, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$TagRecord;->info:Ljava/lang/String;

    .line 84
    return-void
.end method


# virtual methods
.method public toJson()Ljava/lang/String;
    .registers 6

    .prologue
    .line 86
    const-string v0, "{\"type\":\"tag\", \"time\":%d, \"tag\":\"%s\", \"info\":\"%s\"}"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-wide v3, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$Record;->time:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$TagRecord;->tag:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/android/systemui/statusbar/GestureRecorder$Gesture$TagRecord;->info:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
