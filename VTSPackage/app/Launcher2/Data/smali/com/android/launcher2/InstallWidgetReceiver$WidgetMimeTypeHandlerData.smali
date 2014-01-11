.class public Lcom/android/launcher2/InstallWidgetReceiver$WidgetMimeTypeHandlerData;
.super Ljava/lang/Object;
.source "InstallWidgetReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/InstallWidgetReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WidgetMimeTypeHandlerData"
.end annotation


# instance fields
.field public resolveInfo:Landroid/content/pm/ResolveInfo;

.field public widgetInfo:Landroid/appwidget/AppWidgetProviderInfo;


# direct methods
.method public constructor <init>(Landroid/content/pm/ResolveInfo;Landroid/appwidget/AppWidgetProviderInfo;)V
    .locals 0
    .parameter "rInfo"
    .parameter "wInfo"

    .prologue
    .line 65
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetMimeTypeHandlerData;->resolveInfo:Landroid/content/pm/ResolveInfo;

    .line 67
    iput-object p2, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetMimeTypeHandlerData;->widgetInfo:Landroid/appwidget/AppWidgetProviderInfo;

    .line 68
    return-void
.end method
