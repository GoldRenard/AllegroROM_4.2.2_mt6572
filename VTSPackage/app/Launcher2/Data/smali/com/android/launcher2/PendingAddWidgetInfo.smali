.class Lcom/android/launcher2/PendingAddWidgetInfo;
.super Lcom/android/launcher2/PendingAddItemInfo;
.source "PendingAddItemInfo.java"


# instance fields
.field bindOptions:Landroid/os/Bundle;

.field boundWidget:Landroid/appwidget/AppWidgetHostView;

.field configurationData:Landroid/os/Parcelable;

.field icon:I

.field info:Landroid/appwidget/AppWidgetProviderInfo;

.field mimeType:Ljava/lang/String;

.field minHeight:I

.field minResizeHeight:I

.field minResizeWidth:I

.field minWidth:I

.field previewImage:I


# direct methods
.method public constructor <init>(Landroid/appwidget/AppWidgetProviderInfo;Ljava/lang/String;Landroid/os/Parcelable;)V
    .locals 1
    .parameter "i"
    .parameter "dataMimeType"
    .parameter "data"

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/android/launcher2/PendingAddItemInfo;-><init>()V

    .line 59
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->bindOptions:Landroid/os/Bundle;

    .line 67
    const/4 v0, 0x4

    iput v0, p0, Lcom/android/launcher2/ItemInfo;->itemType:I

    .line 68
    iput-object p1, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->info:Landroid/appwidget/AppWidgetProviderInfo;

    .line 69
    iget-object v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    iput-object v0, p0, Lcom/android/launcher2/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    .line 70
    iget v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    iput v0, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->minWidth:I

    .line 71
    iget v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    iput v0, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->minHeight:I

    .line 72
    iget v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minResizeWidth:I

    iput v0, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->minResizeWidth:I

    .line 73
    iget v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minResizeHeight:I

    iput v0, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->minResizeHeight:I

    .line 74
    iget v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->previewImage:I

    iput v0, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->previewImage:I

    .line 75
    iget v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->icon:I

    iput v0, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->icon:I

    .line 76
    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    .line 77
    iput-object p2, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->mimeType:Ljava/lang/String;

    .line 78
    iput-object p3, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->configurationData:Landroid/os/Parcelable;

    .line 80
    :cond_0
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher2/PendingAddWidgetInfo;)V
    .locals 2
    .parameter "copy"

    .prologue
    const/4 v0, 0x0

    .line 83
    invoke-direct {p0}, Lcom/android/launcher2/PendingAddItemInfo;-><init>()V

    .line 59
    iput-object v0, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->bindOptions:Landroid/os/Bundle;

    .line 84
    iget v1, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->minWidth:I

    iput v1, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->minWidth:I

    .line 85
    iget v1, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->minHeight:I

    iput v1, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->minHeight:I

    .line 86
    iget v1, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->minResizeWidth:I

    iput v1, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->minResizeWidth:I

    .line 87
    iget v1, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->minResizeHeight:I

    iput v1, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->minResizeHeight:I

    .line 88
    iget v1, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->previewImage:I

    iput v1, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->previewImage:I

    .line 89
    iget v1, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->icon:I

    iput v1, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->icon:I

    .line 90
    iget-object v1, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iput-object v1, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->info:Landroid/appwidget/AppWidgetProviderInfo;

    .line 91
    iget-object v1, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->boundWidget:Landroid/appwidget/AppWidgetHostView;

    iput-object v1, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->boundWidget:Landroid/appwidget/AppWidgetHostView;

    .line 92
    iget-object v1, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->mimeType:Ljava/lang/String;

    iput-object v1, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->mimeType:Ljava/lang/String;

    .line 93
    iget-object v1, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->configurationData:Landroid/os/Parcelable;

    iput-object v1, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->configurationData:Landroid/os/Parcelable;

    .line 94
    iget-object v1, p1, Lcom/android/launcher2/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    iput-object v1, p0, Lcom/android/launcher2/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    .line 95
    iget v1, p1, Lcom/android/launcher2/ItemInfo;->itemType:I

    iput v1, p0, Lcom/android/launcher2/ItemInfo;->itemType:I

    .line 96
    iget v1, p1, Lcom/android/launcher2/ItemInfo;->spanX:I

    iput v1, p0, Lcom/android/launcher2/ItemInfo;->spanX:I

    .line 97
    iget v1, p1, Lcom/android/launcher2/ItemInfo;->spanY:I

    iput v1, p0, Lcom/android/launcher2/ItemInfo;->spanY:I

    .line 98
    iget v1, p1, Lcom/android/launcher2/ItemInfo;->minSpanX:I

    iput v1, p0, Lcom/android/launcher2/ItemInfo;->minSpanX:I

    .line 99
    iget v1, p1, Lcom/android/launcher2/ItemInfo;->minSpanY:I

    iput v1, p0, Lcom/android/launcher2/ItemInfo;->minSpanY:I

    .line 100
    iget-object v1, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->bindOptions:Landroid/os/Bundle;

    if-nez v1, :cond_0

    :goto_0
    iput-object v0, p0, Lcom/android/launcher2/PendingAddWidgetInfo;->bindOptions:Landroid/os/Bundle;

    .line 101
    return-void

    .line 100
    :cond_0
    iget-object v0, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->bindOptions:Landroid/os/Bundle;

    invoke-virtual {v0}, Landroid/os/Bundle;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    goto :goto_0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Widget: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/launcher2/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v1}, Landroid/content/ComponentName;->toShortString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
