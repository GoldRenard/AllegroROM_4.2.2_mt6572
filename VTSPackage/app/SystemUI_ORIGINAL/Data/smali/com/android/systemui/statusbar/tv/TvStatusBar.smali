.class public Lcom/android/systemui/statusbar/tv/TvStatusBar;
.super Lcom/android/systemui/statusbar/BaseStatusBar;
.source "TvStatusBar.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/android/systemui/statusbar/BaseStatusBar;-><init>()V

    return-void
.end method


# virtual methods
.method public addIcon(Ljava/lang/String;IILcom/android/internal/statusbar/StatusBarIcon;)V
    .locals 0
    .parameter "slot"
    .parameter "index"
    .parameter "viewIndex"
    .parameter "icon"

    .prologue
    .line 36
    return-void
.end method

.method public addNotification(Landroid/os/IBinder;Lcom/android/internal/statusbar/StatusBarNotification;)V
    .locals 0
    .parameter "key"
    .parameter "notification"

    .prologue
    .line 49
    return-void
.end method

.method public animateCollapsePanels(I)V
    .locals 0
    .parameter "flags"

    .prologue
    .line 69
    return-void
.end method

.method public animateExpandNotificationsPanel()V
    .locals 0

    .prologue
    .line 65
    return-void
.end method

.method public animateExpandSettingsPanel()V
    .locals 0

    .prologue
    .line 147
    return-void
.end method

.method protected createAndAddWindows()V
    .locals 0

    .prologue
    .line 97
    return-void
.end method

.method public disable(I)V
    .locals 0
    .parameter "state"

    .prologue
    .line 61
    return-void
.end method

.method protected getExpandedViewMaxHeight()I
    .locals 1

    .prologue
    .line 133
    const/4 v0, 0x0

    return v0
.end method

.method protected getRecentsLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/WindowManager$LayoutParams;
    .locals 1
    .parameter "layoutParams"

    .prologue
    .line 102
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getSearchLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/WindowManager$LayoutParams;
    .locals 1
    .parameter "layoutParams"

    .prologue
    .line 108
    const/4 v0, 0x0

    return-object v0
.end method

.method public getStatusBarView()Landroid/view/View;
    .locals 1

    .prologue
    .line 142
    const/4 v0, 0x0

    return-object v0
.end method

.method protected haltTicker()V
    .locals 0

    .prologue
    .line 113
    return-void
.end method

.method public hideSimIndicator()V
    .locals 0

    .prologue
    .line 154
    return-void
.end method

.method public isExpanded()Z
    .locals 1

    .prologue
    .line 161
    const/4 v0, 0x0

    return v0
.end method

.method public removeIcon(Ljava/lang/String;II)V
    .locals 0
    .parameter "slot"
    .parameter "index"
    .parameter "viewIndex"

    .prologue
    .line 45
    return-void
.end method

.method public removeNotification(Landroid/os/IBinder;)V
    .locals 0
    .parameter "key"

    .prologue
    .line 57
    return-void
.end method

.method protected setAreThereNotifications()V
    .locals 0

    .prologue
    .line 117
    return-void
.end method

.method public setHardKeyboardStatus(ZZ)V
    .locals 0
    .parameter "available"
    .parameter "enabled"

    .prologue
    .line 85
    return-void
.end method

.method public setImeWindowStatus(Landroid/os/IBinder;II)V
    .locals 0
    .parameter "token"
    .parameter "vis"
    .parameter "backDisposition"

    .prologue
    .line 81
    return-void
.end method

.method public setNavigationIconHints(I)V
    .locals 0
    .parameter "hints"

    .prologue
    .line 93
    return-void
.end method

.method public setSystemUiVisibility(II)V
    .locals 0
    .parameter "vis"
    .parameter "mask"

    .prologue
    .line 73
    return-void
.end method

.method protected shouldDisableNavbarGestures()Z
    .locals 1

    .prologue
    .line 138
    const/4 v0, 0x1

    return v0
.end method

.method public showApplicationGuide(Ljava/lang/String;)V
    .locals 0
    .parameter "appName"

    .prologue
    .line 168
    return-void
.end method

.method public showSimIndicator(Ljava/lang/String;)V
    .locals 0
    .parameter "businessType"

    .prologue
    .line 152
    return-void
.end method

.method protected tick(Landroid/os/IBinder;Lcom/android/internal/statusbar/StatusBarNotification;Z)V
    .locals 0
    .parameter "key"
    .parameter "n"
    .parameter "firstTime"

    .prologue
    .line 125
    return-void
.end method

.method public toggleRecentApps()V
    .locals 0

    .prologue
    .line 89
    return-void
.end method

.method public topAppWindowChanged(Z)V
    .locals 0
    .parameter "visible"

    .prologue
    .line 77
    return-void
.end method

.method protected updateExpandedViewPos(I)V
    .locals 0
    .parameter "expandedPosition"

    .prologue
    .line 129
    return-void
.end method

.method public updateIcon(Ljava/lang/String;IILcom/android/internal/statusbar/StatusBarIcon;Lcom/android/internal/statusbar/StatusBarIcon;)V
    .locals 0
    .parameter "slot"
    .parameter "index"
    .parameter "viewIndex"
    .parameter "old"
    .parameter "icon"

    .prologue
    .line 41
    return-void
.end method

.method public updateNotification(Landroid/os/IBinder;Lcom/android/internal/statusbar/StatusBarNotification;)V
    .locals 0
    .parameter "key"
    .parameter "notification"

    .prologue
    .line 53
    return-void
.end method

.method protected updateNotificationIcons()V
    .locals 0

    .prologue
    .line 121
    return-void
.end method
