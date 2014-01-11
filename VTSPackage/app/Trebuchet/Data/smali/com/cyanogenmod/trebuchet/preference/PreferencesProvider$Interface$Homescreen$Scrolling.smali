.class public Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen$Scrolling;
.super Ljava/lang/Object;
.source "PreferencesProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Scrolling"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFadeInAdjacentScreens(Z)Z
    .locals 1
    .parameter "def"

    .prologue
    .line 124
    const-string v0, "ui_homescreen_scrolling_fade_adjacent_screens"

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, p0}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getScrollWallpaper()Z
    .locals 2

    .prologue
    .line 115
    const-string v0, "ui_homescreen_scrolling_scroll_wallpaper"

    const/4 v1, 0x1

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getShowOutlines(Z)Z
    .locals 1
    .parameter "def"

    .prologue
    .line 127
    const-string v0, "ui_homescreen_scrolling_show_outlines"

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, p0}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getTransitionEffect(Ljava/lang/String;)Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;
    .locals 1
    .parameter "def"

    .prologue
    .line 100
    :try_start_0
    const-string v0, "ui_homescreen_scrolling_transition_effect"

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0, p0}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$100(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->valueOf(Ljava/lang/String;)Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 112
    :goto_0
    return-object v0

    .line 102
    :catch_0
    move-exception v0

    .line 107
    :try_start_1
    invoke-static {p0}, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->valueOf(Ljava/lang/String;)Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    goto :goto_0

    .line 108
    :catch_1
    move-exception v0

    .line 112
    sget-object v0, Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;->Standard:Lcom/cyanogenmod/trebuchet/Workspace$TransitionEffect;

    goto :goto_0
.end method

.method public static getWallpaperHack(Z)Z
    .locals 1
    .parameter "def"

    .prologue
    .line 118
    const-string v0, "ui_homescreen_scrolling_wallpaper_hack"

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, p0}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getWallpaperSize()I
    .locals 2

    .prologue
    .line 121
    const-string v0, "ui_homescreen_scrolling_wallpaper_size"

    const/4 v1, 0x2

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getInt(Ljava/lang/String;I)I
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$000(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method
