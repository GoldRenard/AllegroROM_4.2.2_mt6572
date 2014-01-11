.class public Lcom/cyanogenmod/trebuchet/InstallWidgetReceiver;
.super Ljava/lang/Object;
.source "InstallWidgetReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/InstallWidgetReceiver$WidgetListAdapter;,
        Lcom/cyanogenmod/trebuchet/InstallWidgetReceiver$WidgetMimeTypeHandlerData;
    }
.end annotation


# static fields
.field public static final ACTION_INSTALL_WIDGET:Ljava/lang/String; = "com.cyanogenmod.trebuchet.action.INSTALL_WIDGET"

.field public static final ACTION_SUPPORTS_CLIPDATA_MIMETYPE:Ljava/lang/String; = "com.cyanogenmod.trebuchet.action.SUPPORTS_CLIPDATA_MIMETYPE"

.field public static final EXTRA_APPWIDGET_COMPONENT:Ljava/lang/String; = "com.cyanogenmod.trebuchet.extra.widget.COMPONENT"

.field public static final EXTRA_APPWIDGET_CONFIGURATION_DATA:Ljava/lang/String; = "com.cyanogenmod.trebuchet.extra.widget.CONFIGURATION_DATA"

.field public static final EXTRA_APPWIDGET_CONFIGURATION_DATA_MIME_TYPE:Ljava/lang/String; = "com.cyanogenmod.trebuchet.extra.widget.CONFIGURATION_DATA_MIME_TYPE"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    return-void
.end method
