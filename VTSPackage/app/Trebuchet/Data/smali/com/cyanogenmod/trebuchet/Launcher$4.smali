.class Lcom/cyanogenmod/trebuchet/Launcher$4;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->completeTwoStageWidgetDrop(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;

.field final synthetic val$appWidgetId:I

.field final synthetic val$layout:Landroid/appwidget/AppWidgetHostView;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;ILandroid/appwidget/AppWidgetHostView;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 713
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$4;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput p2, p0, Lcom/cyanogenmod/trebuchet/Launcher$4;->val$appWidgetId:I

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/Launcher$4;->val$layout:Landroid/appwidget/AppWidgetHostView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 716
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$4;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$4;->val$appWidgetId:I

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher$4;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->access$800(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/ItemInfo;

    move-result-object v2

    iget-wide v2, v2, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher$4;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;
    invoke-static {v4}, Lcom/cyanogenmod/trebuchet/Launcher;->access$800(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/ItemInfo;

    move-result-object v4

    iget v4, v4, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher$4;->val$layout:Landroid/appwidget/AppWidgetHostView;

    #calls: Lcom/cyanogenmod/trebuchet/Launcher;->completeAddAppWidget(IJILandroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V
    invoke-static/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/Launcher;->access$900(Lcom/cyanogenmod/trebuchet/Launcher;IJILandroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V

    .line 718
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$4;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v6}, Lcom/cyanogenmod/trebuchet/Launcher;->exitSpringLoadedDragModeDelayed(ZZLjava/lang/Runnable;)V

    .line 719
    return-void
.end method
