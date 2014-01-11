.class public Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$General;
.super Ljava/lang/Object;
.source "PreferencesProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "General"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 221
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAutoRotate(Z)Z
    .locals 1
    .parameter "def"

    .prologue
    .line 223
    const-string v0, "ui_general_orientation"

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, p0}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getFullscreenMode()Z
    .locals 2

    .prologue
    .line 232
    const-string v0, "ui_general_fullscreen"

    const/4 v1, 0x0

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getLockWorkspace(Z)Z
    .locals 1
    .parameter "def"

    .prologue
    .line 226
    const-string v0, "ui_general_lock_workspace"

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, p0}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static setLockWorkspace(Landroid/content/Context;Z)V
    .locals 1
    .parameter "ctx"
    .parameter "value"

    .prologue
    .line 229
    const-string v0, "ui_general_lock_workspace"

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->setBoolean(Landroid/content/Context;Ljava/lang/String;Z)V
    invoke-static {p0, v0, p1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$300(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 230
    return-void
.end method
