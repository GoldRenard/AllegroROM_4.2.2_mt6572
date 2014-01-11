.class Lcom/android/launcher2/Launcher$4;
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

.field final synthetic val$appWidgetId:I

.field final synthetic val$layout:Landroid/appwidget/AppWidgetHostView;

.field final synthetic val$resultCode:I


# direct methods
.method constructor <init>(Lcom/android/launcher2/Launcher;ILandroid/appwidget/AppWidgetHostView;I)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 795
    iput-object p1, p0, Lcom/android/launcher2/Launcher$4;->this$0:Lcom/android/launcher2/Launcher;

    iput p2, p0, Lcom/android/launcher2/Launcher$4;->val$appWidgetId:I

    iput-object p3, p0, Lcom/android/launcher2/Launcher$4;->val$layout:Landroid/appwidget/AppWidgetHostView;

    iput p4, p0, Lcom/android/launcher2/Launcher$4;->val$resultCode:I

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 798
    iget-object v0, p0, Lcom/android/launcher2/Launcher$4;->this$0:Lcom/android/launcher2/Launcher;

    iget v1, p0, Lcom/android/launcher2/Launcher$4;->val$appWidgetId:I

    iget-object v2, p0, Lcom/android/launcher2/Launcher$4;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;
    invoke-static {v2}, Lcom/android/launcher2/Launcher;->access$800(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/ItemInfo;

    move-result-object v2

    iget-wide v2, v2, Lcom/android/launcher2/ItemInfo;->container:J

    iget-object v4, p0, Lcom/android/launcher2/Launcher$4;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;
    invoke-static {v4}, Lcom/android/launcher2/Launcher;->access$800(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/ItemInfo;

    move-result-object v4

    iget v4, v4, Lcom/android/launcher2/ItemInfo;->screen:I

    iget-object v5, p0, Lcom/android/launcher2/Launcher$4;->val$layout:Landroid/appwidget/AppWidgetHostView;

    #calls: Lcom/android/launcher2/Launcher;->completeAddAppWidget(IJILandroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V
    invoke-static/range {v0 .. v6}, Lcom/android/launcher2/Launcher;->access$900(Lcom/android/launcher2/Launcher;IJILandroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V

    .line 800
    iget-object v1, p0, Lcom/android/launcher2/Launcher$4;->this$0:Lcom/android/launcher2/Launcher;

    iget v0, p0, Lcom/android/launcher2/Launcher$4;->val$resultCode:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0, v7, v6}, Lcom/android/launcher2/Launcher;->exitSpringLoadedDragModeDelayed(ZZLjava/lang/Runnable;)V

    .line 802
    return-void

    :cond_0
    move v0, v7

    .line 800
    goto :goto_0
.end method
