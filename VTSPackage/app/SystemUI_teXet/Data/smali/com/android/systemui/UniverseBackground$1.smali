.class Lcom/android/systemui/UniverseBackground$1;
.super Ljava/lang/Object;
.source "UniverseBackground.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/UniverseBackground;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/UniverseBackground;


# direct methods
.method constructor <init>(Lcom/android/systemui/UniverseBackground;)V
    .registers 2
    .parameter

    .prologue
    .line 49
    iput-object p1, p0, Lcom/android/systemui/UniverseBackground$1;->this$0:Lcom/android/systemui/UniverseBackground;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 52
    iget-object v0, p0, Lcom/android/systemui/UniverseBackground$1;->this$0:Lcom/android/systemui/UniverseBackground;

    iget-object v1, p0, Lcom/android/systemui/UniverseBackground$1;->this$0:Lcom/android/systemui/UniverseBackground;

    invoke-static {v1}, Lcom/android/systemui/UniverseBackground;->access$000(Lcom/android/systemui/UniverseBackground;)Landroid/view/Choreographer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Choreographer;->getFrameTimeNanos()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/android/systemui/UniverseBackground;->doAnimation(J)V

    .line 53
    return-void
.end method
