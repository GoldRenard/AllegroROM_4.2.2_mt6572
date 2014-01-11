.class public Lcom/android/launcher2/InstallWidgetReceiver;
.super Ljava/lang/Object;
.source "InstallWidgetReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;,
        Lcom/android/launcher2/InstallWidgetReceiver$WidgetMimeTypeHandlerData;
    }
.end annotation


# static fields
.field public static final ACTION_INSTALL_WIDGET:Ljava/lang/String; = "com.android.launcher.action.INSTALL_WIDGET"

.field public static final ACTION_SUPPORTS_CLIPDATA_MIMETYPE:Ljava/lang/String; = "com.android.launcher.action.SUPPORTS_CLIPDATA_MIMETYPE"

.field public static final EXTRA_APPWIDGET_COMPONENT:Ljava/lang/String; = "com.android.launcher.extra.widget.COMPONENT"

.field public static final EXTRA_APPWIDGET_CONFIGURATION_DATA:Ljava/lang/String; = "com.android.launcher.extra.widget.CONFIGURATION_DATA"

.field public static final EXTRA_APPWIDGET_CONFIGURATION_DATA_MIME_TYPE:Ljava/lang/String; = "com.android.launcher.extra.widget.CONFIGURATION_DATA_MIME_TYPE"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 74
    return-void
.end method
