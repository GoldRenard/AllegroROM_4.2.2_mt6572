.class Lcom/android/launcher2/DeleteDropTarget$2;
.super Ljava/lang/Thread;
.source "DeleteDropTarget.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/DeleteDropTarget;->completeDrop(Lcom/android/launcher2/DropTarget$DragObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/DeleteDropTarget;

.field final synthetic val$appWidgetHost:Lcom/android/launcher2/LauncherAppWidgetHost;

.field final synthetic val$launcherAppWidgetInfo:Lcom/android/launcher2/LauncherAppWidgetInfo;


# direct methods
.method constructor <init>(Lcom/android/launcher2/DeleteDropTarget;Ljava/lang/String;Lcom/android/launcher2/LauncherAppWidgetHost;Lcom/android/launcher2/LauncherAppWidgetInfo;)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter
    .parameter

    .prologue
    .line 250
    iput-object p1, p0, Lcom/android/launcher2/DeleteDropTarget$2;->this$0:Lcom/android/launcher2/DeleteDropTarget;

    iput-object p3, p0, Lcom/android/launcher2/DeleteDropTarget$2;->val$appWidgetHost:Lcom/android/launcher2/LauncherAppWidgetHost;

    iput-object p4, p0, Lcom/android/launcher2/DeleteDropTarget$2;->val$launcherAppWidgetInfo:Lcom/android/launcher2/LauncherAppWidgetInfo;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 252
    iget-object v0, p0, Lcom/android/launcher2/DeleteDropTarget$2;->val$appWidgetHost:Lcom/android/launcher2/LauncherAppWidgetHost;

    iget-object v1, p0, Lcom/android/launcher2/DeleteDropTarget$2;->val$launcherAppWidgetInfo:Lcom/android/launcher2/LauncherAppWidgetInfo;

    iget v1, v1, Lcom/android/launcher2/LauncherAppWidgetInfo;->appWidgetId:I

    invoke-virtual {v0, v1}, Lcom/android/launcher2/LauncherAppWidgetHost;->deleteAppWidgetId(I)V

    .line 253
    return-void
.end method
