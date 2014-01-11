.class public Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer$Scrolling;
.super Ljava/lang/Object;
.source "PreferencesProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Drawer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Scrolling"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFadeInAdjacentScreens()Z
    .locals 2

    .prologue
    .line 177
    const-string v0, "ui_drawer_scrolling_fade_adjacent_screens"

    const/4 v1, 0x0

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$200(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getTransitionEffect(Ljava/lang/String;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;
    .locals 1
    .parameter "def"

    .prologue
    .line 162
    :try_start_0
    const-string v0, "ui_drawer_scrolling_transition_effect"

    #calls: Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0, p0}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->access$100(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->valueOf(Ljava/lang/String;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 174
    :goto_0
    return-object v0

    .line 164
    :catch_0
    move-exception v0

    .line 169
    :try_start_1
    invoke-static {p0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->valueOf(Ljava/lang/String;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    goto :goto_0

    .line 170
    :catch_1
    move-exception v0

    .line 174
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->Standard:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    goto :goto_0
.end method
