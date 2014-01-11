.class Lcom/android/systemui/statusbar/policy/CircleBattery$1;
.super Ljava/lang/Object;
.source "CircleBattery.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/policy/CircleBattery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/policy/CircleBattery;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/policy/CircleBattery;)V
    .locals 0
    .parameter

    .prologue
    .line 59
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery$1;->this$0:Lcom/android/systemui/statusbar/policy/CircleBattery;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery$1;->this$0:Lcom/android/systemui/statusbar/policy/CircleBattery;

    #getter for: Lcom/android/systemui/statusbar/policy/CircleBattery;->mActivated:Z
    invoke-static {v0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->access$000(Lcom/android/systemui/statusbar/policy/CircleBattery;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery$1;->this$0:Lcom/android/systemui/statusbar/policy/CircleBattery;

    #getter for: Lcom/android/systemui/statusbar/policy/CircleBattery;->mAttached:Z
    invoke-static {v0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->access$100(Lcom/android/systemui/statusbar/policy/CircleBattery;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery$1;->this$0:Lcom/android/systemui/statusbar/policy/CircleBattery;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->invalidate()V

    .line 64
    :cond_0
    return-void
.end method
