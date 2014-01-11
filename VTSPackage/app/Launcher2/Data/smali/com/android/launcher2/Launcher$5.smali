.class Lcom/android/launcher2/Launcher$5;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Launcher;->completeTwoStageWidgetDrop(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Launcher;

.field final synthetic val$resultCode:I


# direct methods
.method constructor <init>(Lcom/android/launcher2/Launcher;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 806
    iput-object p1, p0, Lcom/android/launcher2/Launcher$5;->this$0:Lcom/android/launcher2/Launcher;

    iput p2, p0, Lcom/android/launcher2/Launcher$5;->val$resultCode:I

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 809
    iget-object v2, p0, Lcom/android/launcher2/Launcher$5;->this$0:Lcom/android/launcher2/Launcher;

    iget v0, p0, Lcom/android/launcher2/Launcher$5;->val$resultCode:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const/4 v3, 0x0

    invoke-virtual {v2, v0, v1, v3}, Lcom/android/launcher2/Launcher;->exitSpringLoadedDragModeDelayed(ZZLjava/lang/Runnable;)V

    .line 811
    return-void

    :cond_0
    move v0, v1

    .line 809
    goto :goto_0
.end method
