.class Lcom/android/systemui/LoadAverageService$LoadView$1;
.super Landroid/os/Handler;
.source "LoadAverageService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/LoadAverageService$LoadView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/systemui/LoadAverageService$LoadView;


# direct methods
.method constructor <init>(Lcom/android/systemui/LoadAverageService$LoadView;)V
    .locals 0
    .parameter

    .prologue
    .line 72
    iput-object p1, p0, Lcom/android/systemui/LoadAverageService$LoadView$1;->this$1:Lcom/android/systemui/LoadAverageService$LoadView;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .parameter "msg"

    .prologue
    const/4 v2, 0x1

    .line 75
    iget v1, p1, Landroid/os/Message;->what:I

    if-ne v1, v2, :cond_1

    .line 76
    iget-object v1, p0, Lcom/android/systemui/LoadAverageService$LoadView$1;->this$1:Lcom/android/systemui/LoadAverageService$LoadView;

    #getter for: Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I
    invoke-static {v1}, Lcom/android/systemui/LoadAverageService$LoadView;->access$000(Lcom/android/systemui/LoadAverageService$LoadView;)I

    move-result v1

    if-nez v1, :cond_0

    .line 78
    iget-object v1, p0, Lcom/android/systemui/LoadAverageService$LoadView$1;->this$1:Lcom/android/systemui/LoadAverageService$LoadView;

    #getter for: Lcom/android/systemui/LoadAverageService$LoadView;->mStats:Lcom/android/systemui/LoadAverageService$Stats;
    invoke-static {v1}, Lcom/android/systemui/LoadAverageService$LoadView;->access$100(Lcom/android/systemui/LoadAverageService$LoadView;)Lcom/android/systemui/LoadAverageService$Stats;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/systemui/LoadAverageService$Stats;->update()V

    .line 80
    :cond_0
    iget-object v1, p0, Lcom/android/systemui/LoadAverageService$LoadView$1;->this$1:Lcom/android/systemui/LoadAverageService$LoadView;

    invoke-virtual {v1}, Lcom/android/systemui/LoadAverageService$LoadView;->updateThermalInfo()V

    .line 81
    iget-object v1, p0, Lcom/android/systemui/LoadAverageService$LoadView$1;->this$1:Lcom/android/systemui/LoadAverageService$LoadView;

    invoke-virtual {v1}, Lcom/android/systemui/LoadAverageService$LoadView;->updateDisplay()V

    .line 82
    invoke-virtual {p0, v2}, Lcom/android/systemui/LoadAverageService$LoadView$1;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 84
    .local v0, m:Landroid/os/Message;
    iget-object v1, p0, Lcom/android/systemui/LoadAverageService$LoadView$1;->this$1:Lcom/android/systemui/LoadAverageService$LoadView;

    #getter for: Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I
    invoke-static {v1}, Lcom/android/systemui/LoadAverageService$LoadView;->access$000(Lcom/android/systemui/LoadAverageService$LoadView;)I

    move-result v1

    if-lez v1, :cond_2

    iget-object v1, p0, Lcom/android/systemui/LoadAverageService$LoadView$1;->this$1:Lcom/android/systemui/LoadAverageService$LoadView;

    #getter for: Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorDelay:I
    invoke-static {v1}, Lcom/android/systemui/LoadAverageService$LoadView;->access$200(Lcom/android/systemui/LoadAverageService$LoadView;)I

    move-result v1

    const/16 v2, 0x7d0

    if-lt v1, v2, :cond_2

    .line 86
    iget-object v1, p0, Lcom/android/systemui/LoadAverageService$LoadView$1;->this$1:Lcom/android/systemui/LoadAverageService$LoadView;

    #getter for: Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorDelay:I
    invoke-static {v1}, Lcom/android/systemui/LoadAverageService$LoadView;->access$200(Lcom/android/systemui/LoadAverageService$LoadView;)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/systemui/LoadAverageService$LoadView$1;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 95
    .end local v0           #m:Landroid/os/Message;
    :cond_1
    :goto_0
    return-void

    .line 87
    .restart local v0       #m:Landroid/os/Message;
    :cond_2
    iget-object v1, p0, Lcom/android/systemui/LoadAverageService$LoadView$1;->this$1:Lcom/android/systemui/LoadAverageService$LoadView;

    #getter for: Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I
    invoke-static {v1}, Lcom/android/systemui/LoadAverageService$LoadView;->access$000(Lcom/android/systemui/LoadAverageService$LoadView;)I

    move-result v1

    const/16 v2, 0x63

    if-ne v1, v2, :cond_3

    iget-object v1, p0, Lcom/android/systemui/LoadAverageService$LoadView$1;->this$1:Lcom/android/systemui/LoadAverageService$LoadView;

    #getter for: Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorDelay:I
    invoke-static {v1}, Lcom/android/systemui/LoadAverageService$LoadView;->access$200(Lcom/android/systemui/LoadAverageService$LoadView;)I

    move-result v1

    const/16 v2, 0x1f4

    if-lt v1, v2, :cond_3

    .line 89
    iget-object v1, p0, Lcom/android/systemui/LoadAverageService$LoadView$1;->this$1:Lcom/android/systemui/LoadAverageService$LoadView;

    #getter for: Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorDelay:I
    invoke-static {v1}, Lcom/android/systemui/LoadAverageService$LoadView;->access$200(Lcom/android/systemui/LoadAverageService$LoadView;)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/systemui/LoadAverageService$LoadView$1;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0

    .line 92
    :cond_3
    const-wide/16 v1, 0x7d0

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/systemui/LoadAverageService$LoadView$1;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0
.end method
