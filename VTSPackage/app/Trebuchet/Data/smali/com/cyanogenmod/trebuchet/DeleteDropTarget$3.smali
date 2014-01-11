.class Lcom/cyanogenmod/trebuchet/DeleteDropTarget$3;
.super Ljava/lang/Thread;
.source "DeleteDropTarget.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->completeDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

.field final synthetic val$appWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

.field final synthetic val$launcherAppWidgetInfo:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;Ljava/lang/String;Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter
    .parameter

    .prologue
    .line 304
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$3;->this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$3;->val$appWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    iput-object p4, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$3;->val$launcherAppWidgetInfo:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 306
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$3;->val$appWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$3;->val$launcherAppWidgetInfo:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    iget v1, v1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->appWidgetId:I

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;->deleteAppWidgetId(I)V

    .line 307
    return-void
.end method
