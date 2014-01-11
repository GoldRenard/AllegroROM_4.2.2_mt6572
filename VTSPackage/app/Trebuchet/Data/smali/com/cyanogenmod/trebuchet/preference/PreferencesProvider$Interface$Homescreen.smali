.class public Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen;
.super Ljava/lang/Object;
.source "PreferencesProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Homescreen"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen$Indicator;,
        Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen$Scrolling;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    return-void
.end method

.method public static getCellCountX(I)I
    .locals 5
    .parameter "def"

    .prologue
    .line 73
    const-string v2, "ui_homescreen_grid"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "0|"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$100(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "\\|"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 75
    .local v1, values:[Ljava/lang/String;
    const/4 v2, 0x1

    :try_start_0
    aget-object v2, v1, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p0

    .line 77
    .end local p0
    :goto_0
    return p0

    .line 76
    .restart local p0
    :catch_0
    move-exception v0

    .line 77
    .local v0, e:Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method public static getCellCountY(I)I
    .locals 5
    .parameter "def"

    .prologue
    .line 81
    const-string v2, "ui_homescreen_grid"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "|0"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$100(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "\\|"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 83
    .local v1, values:[Ljava/lang/String;
    const/4 v2, 0x0

    :try_start_0
    aget-object v2, v1, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p0

    .line 85
    .end local p0
    :goto_0
    return p0

    .line 84
    .restart local p0
    :catch_0
    move-exception v0

    .line 85
    .local v0, e:Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method public static getDefaultHomescreen(I)I
    .locals 2
    .parameter "def"

    .prologue
    .line 70
    const-string v0, "ui_homescreen_default_screen"

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
    .line 95
    const-string v0, "ui_homescreen_general_hide_icon_labels"

    const/4 v1, 0x0

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getNumberHomescreens()I
    .locals 2

    .prologue
    .line 67
    const-string v0, "ui_homescreen_screens"

    const/4 v1, 0x5

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getInt(Ljava/lang/String;I)I
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$000(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getShowSearchBar()Z
    .locals 2

    .prologue
    .line 92
    const-string v0, "ui_homescreen_general_search"

    const/4 v1, 0x1

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getStretchScreens()Z
    .locals 2

    .prologue
    .line 89
    const-string v0, "ui_homescreen_stretch_screens"

    const/4 v1, 0x1

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method
