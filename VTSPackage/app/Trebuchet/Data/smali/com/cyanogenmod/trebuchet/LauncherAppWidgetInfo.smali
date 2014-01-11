.class Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
.super Lcom/cyanogenmod/trebuchet/ItemInfo;
.source "LauncherAppWidgetInfo.java"


# static fields
.field static final NO_ID:I = -0x1


# instance fields
.field appWidgetId:I

.field hostView:Landroid/appwidget/AppWidgetHostView;

.field private mHasNotifiedInitialWidgetSizeChanged:Z

.field minHeight:I

.field minWidth:I

.field providerName:Landroid/content/ComponentName;


# direct methods
.method constructor <init>(ILandroid/content/ComponentName;)V
    .locals 2
    .parameter "appWidgetId"
    .parameter "providerName"

    .prologue
    const/4 v1, -0x1

    .line 53
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/ItemInfo;-><init>()V

    .line 37
    iput v1, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->appWidgetId:I

    .line 42
    iput v1, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->minWidth:I

    .line 43
    iput v1, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->minHeight:I

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    .line 54
    const/4 v0, 0x4

    iput v0, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->itemType:I

    .line 55
    iput p1, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->appWidgetId:I

    .line 56
    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->providerName:Landroid/content/ComponentName;

    .line 60
    iput v1, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->spanX:I

    .line 61
    iput v1, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->spanY:I

    .line 62
    return-void
.end method


# virtual methods
.method notifyWidgetSizeChanged(Lcom/cyanogenmod/trebuchet/Launcher;)V
    .locals 3
    .parameter "launcher"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->spanX:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->spanY:I

    invoke-static {v0, p1, v1, v2}, Lcom/cyanogenmod/trebuchet/AppWidgetResizeFrame;->updateWidgetSizeRanges(Landroid/appwidget/AppWidgetHostView;Lcom/cyanogenmod/trebuchet/Launcher;II)V

    .line 85
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->mHasNotifiedInitialWidgetSizeChanged:Z

    .line 86
    return-void
.end method

.method onAddToDatabase(Landroid/content/ContentValues;)V
    .locals 2
    .parameter "values"

    .prologue
    .line 66
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/ItemInfo;->onAddToDatabase(Landroid/content/ContentValues;)V

    .line 67
    const-string v0, "appWidgetId"

    iget v1, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->appWidgetId:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 68
    return-void
.end method

.method onBindAppWidget(Lcom/cyanogenmod/trebuchet/Launcher;)V
    .locals 1
    .parameter "launcher"

    .prologue
    .line 75
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->mHasNotifiedInitialWidgetSizeChanged:Z

    if-nez v0, :cond_0

    .line 76
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->notifyWidgetSizeChanged(Lcom/cyanogenmod/trebuchet/Launcher;)V

    .line 78
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AppWidget(id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->appWidgetId:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method unbind()V
    .locals 1

    .prologue
    .line 95
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/ItemInfo;->unbind()V

    .line 96
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    .line 97
    return-void
.end method
