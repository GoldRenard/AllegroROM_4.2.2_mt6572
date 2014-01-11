.class Lcom/android/systemui/statusbar/GestureRecorder$1;
.super Landroid/os/Handler;
.source "GestureRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/GestureRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/GestureRecorder;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/GestureRecorder;)V
    .registers 2
    .parameter

    .prologue
    .line 145
    iput-object p1, p0, Lcom/android/systemui/statusbar/GestureRecorder$1;->this$0:Lcom/android/systemui/statusbar/GestureRecorder;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 4
    .parameter "msg"

    .prologue
    .line 148
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x18cf

    if-ne v0, v1, :cond_b

    .line 149
    iget-object v0, p0, Lcom/android/systemui/statusbar/GestureRecorder$1;->this$0:Lcom/android/systemui/statusbar/GestureRecorder;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/GestureRecorder;->save()V

    .line 151
    :cond_b
    return-void
.end method
