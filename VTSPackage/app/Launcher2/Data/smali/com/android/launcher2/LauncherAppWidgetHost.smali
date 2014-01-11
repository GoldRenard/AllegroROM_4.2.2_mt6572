.class public Lcom/android/launcher2/LauncherAppWidgetHost;
.super Landroid/appwidget/AppWidgetHost;
.source "LauncherAppWidgetHost.java"


# instance fields
.field mLauncher:Lcom/android/launcher2/Launcher;


# direct methods
.method public constructor <init>(Lcom/android/launcher2/Launcher;I)V
    .locals 0
    .parameter "launcher"
    .parameter "hostId"

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Landroid/appwidget/AppWidgetHost;-><init>(Landroid/content/Context;I)V

    .line 34
    iput-object p1, p0, Lcom/android/launcher2/LauncherAppWidgetHost;->mLauncher:Lcom/android/launcher2/Launcher;

    .line 35
    return-void
.end method


# virtual methods
.method protected onCreateView(Landroid/content/Context;ILandroid/appwidget/AppWidgetProviderInfo;)Landroid/appwidget/AppWidgetHostView;
    .locals 1
    .parameter "context"
    .parameter "appWidgetId"
    .parameter "appWidget"

    .prologue
    .line 40
    new-instance v0, Lcom/android/launcher2/LauncherAppWidgetHostView;

    invoke-direct {v0, p1}, Lcom/android/launcher2/LauncherAppWidgetHostView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method protected onProvidersChanged()V
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/android/launcher2/LauncherAppWidgetHost;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->bindPackagesUpdated()V

    .line 53
    return-void
.end method

.method public stopListening()V
    .locals 0

    .prologue
    .line 45
    invoke-super {p0}, Landroid/appwidget/AppWidgetHost;->stopListening()V

    .line 46
    invoke-virtual {p0}, Lcom/android/launcher2/LauncherAppWidgetHost;->clearViews()V

    .line 47
    return-void
.end method
