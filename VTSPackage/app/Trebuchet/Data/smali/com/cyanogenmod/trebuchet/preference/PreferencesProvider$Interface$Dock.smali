.class public Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Dock;
.super Ljava/lang/Object;
.source "PreferencesProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Dock"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDefaultPage(I)I
    .locals 2
    .parameter "def"

    .prologue
    .line 201
    const-string v0, "ui_dock_default_page"

    add-int/lit8 v1, p0, 0x1

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getInt(Ljava/lang/String;I)I
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$000(Ljava/lang/String;I)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public static getHideIconLabels()Z
    .locals 2

    .prologue
    .line 207
    const-string v0, "ui_dock_hide_icon_labels"

    const/4 v1, 0x1

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getIconScale(I)I
    .locals 1
    .parameter "def"

    .prologue
    .line 210
    const-string v0, "ui_dock_icon_scale"

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getInt(Ljava/lang/String;I)I
    invoke-static {v0, p0}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$000(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getNumberIcons(I)I
    .locals 1
    .parameter "def"

    .prologue
    .line 204
    const-string v0, "ui_dock_icons"

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getInt(Ljava/lang/String;I)I
    invoke-static {v0, p0}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$000(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getNumberPages()I
    .locals 2

    .prologue
    .line 198
    const-string v0, "ui_dock_pages"

    const/4 v1, 0x1

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getInt(Ljava/lang/String;I)I
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$000(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getShowDivider()Z
    .locals 2

    .prologue
    .line 213
    const-string v0, "ui_dock_divider"

    const/4 v1, 0x1

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getShowDock()Z
    .locals 2

    .prologue
    .line 195
    const-string v0, "ui_dock_enabled"

    const/4 v1, 0x1

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method
