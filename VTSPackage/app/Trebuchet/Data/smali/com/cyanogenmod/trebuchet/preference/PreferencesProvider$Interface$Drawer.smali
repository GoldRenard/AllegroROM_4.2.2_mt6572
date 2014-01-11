.class public Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer;
.super Ljava/lang/Object;
.source "PreferencesProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Drawer"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer$Indicator;,
        Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer$Scrolling;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 180
    return-void
.end method

.method public static getHiddenApps()Ljava/lang/String;
    .locals 2

    .prologue
    .line 148
    const-string v0, "ui_drawer_hidden_apps"

    const-string v1, ""

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$100(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getJoinWidgetsApps()Z
    .locals 2

    .prologue
    .line 157
    const-string v0, "ui_drawer_widgets_join_apps"

    const/4 v1, 0x1

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getRemoveShortcutsOfHiddenApps()Z
    .locals 2

    .prologue
    .line 151
    const-string v0, "ui_drawer_remove_hidden_apps_shortcuts"

    const/4 v1, 0x1

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getRemoveWidgetsOfHiddenApps()Z
    .locals 2

    .prologue
    .line 154
    const-string v0, "ui_drawer_remove_hidden_apps_widgets"

    const/4 v1, 0x1

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getVertical()Z
    .locals 2

    .prologue
    .line 145
    const-string v0, "ui_drawer_orientation"

    const-string v1, "horizontal"

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$100(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "vertical"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
