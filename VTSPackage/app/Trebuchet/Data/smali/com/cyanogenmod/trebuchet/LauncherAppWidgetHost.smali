.class public Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;
.super Landroid/appwidget/AppWidgetHost;
.source "LauncherAppWidgetHost.java"


# instance fields
.field mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;


# direct methods
.method public constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;I)V
    .locals 0
    .parameter "launcher"
    .parameter "hostId"

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Landroid/appwidget/AppWidgetHost;-><init>(Landroid/content/Context;I)V

    .line 35
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    .line 36
    return-void
.end method


# virtual methods
.method protected onCreateView(Landroid/content/Context;ILandroid/appwidget/AppWidgetProviderInfo;)Landroid/appwidget/AppWidgetHostView;
    .locals 1
    .parameter "context"
    .parameter "appWidgetId"
    .parameter "appWidget"

    .prologue
    .line 41
    new-instance v0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;

    invoke-direct {v0, p1}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method protected onProvidersChanged()V
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->bindPackagesUpdated()V

    .line 54
    return-void
.end method

.method public stopListening()V
    .locals 0

    .prologue
    .line 46
    invoke-super {p0}, Landroid/appwidget/AppWidgetHost;->stopListening()V

    .line 47
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;->clearViews()V

    .line 48
    return-void
.end method
