.class Lcom/android/systemui/statusbar/policy/DeadZone$1;
.super Ljava/lang/Object;
.source "DeadZone.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/policy/DeadZone;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/policy/DeadZone;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/policy/DeadZone;)V
    .registers 2
    .parameter

    .prologue
    .line 51
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/DeadZone$1;->this$0:Lcom/android/systemui/statusbar/policy/DeadZone;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 54
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/DeadZone$1;->this$0:Lcom/android/systemui/statusbar/policy/DeadZone;

    const-string v1, "flash"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_18

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 55
    return-void

    .line 54
    :array_18
    .array-data 0x4
        0x0t 0x0t 0x80t 0x3ft
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method
