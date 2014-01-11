.class public Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen$Indicator;
.super Ljava/lang/Object;
.source "PreferencesProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Indicator"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFadeScrollingIndicator()Z
    .locals 2

    .prologue
    .line 135
    const-string v0, "ui_homescreen_indicator_fade"

    const/4 v1, 0x1

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getScrollingIndicatorPosition()I
    .locals 2

    .prologue
    .line 138
    const-string v0, "ui_homescreen_indicator_position"

    const-string v1, "0"

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$100(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getShowScrollingIndicator()Z
    .locals 2

    .prologue
    .line 132
    const-string v0, "ui_homescreen_indicator_enable"

    const/4 v1, 0x1

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method
