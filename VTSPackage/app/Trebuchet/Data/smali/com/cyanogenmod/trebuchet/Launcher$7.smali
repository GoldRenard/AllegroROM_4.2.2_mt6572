.class Lcom/cyanogenmod/trebuchet/Launcher$7;
.super Ljava/lang/Thread;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->completeAddAppWidget(IJILandroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;

.field final synthetic val$appWidgetId:I


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter

    .prologue
    .line 1324
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$7;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput p3, p0, Lcom/cyanogenmod/trebuchet/Launcher$7;->val$appWidgetId:I

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1326
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$7;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mAppWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1000(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$7;->val$appWidgetId:I

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;->deleteAppWidgetId(I)V

    .line 1327
    return-void
.end method
