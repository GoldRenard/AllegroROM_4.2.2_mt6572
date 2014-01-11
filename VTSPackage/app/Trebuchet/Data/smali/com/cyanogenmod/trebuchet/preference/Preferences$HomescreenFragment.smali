.class public Lcom/cyanogenmod/trebuchet/preference/Preferences$HomescreenFragment;
.super Landroid/preference/PreferenceFragment;
.source "Preferences.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/preference/Preferences;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HomescreenFragment"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 121
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .parameter "savedInstanceState"

    .prologue
    .line 124
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 126
    const v4, 0x7f060006

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/preference/Preferences$HomescreenFragment;->addPreferencesFromResource(I)V

    .line 128
    const-string v4, "ui_homescreen_general"

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/preference/Preferences$HomescreenFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceCategory;

    .line 129
    .local v0, general:Landroid/preference/PreferenceCategory;
    if-eqz v0, :cond_1

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 130
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/Preferences$HomescreenFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0b0007

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    .line 131
    .local v3, workspaceTabletGrid:Z
    if-nez v3, :cond_1

    .line 132
    const-string v4, "ui_homescreen_grid"

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/preference/Preferences$HomescreenFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 133
    .local v1, grid:Landroid/preference/Preference;
    if-eqz v1, :cond_0

    .line 134
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 136
    :cond_0
    const-string v4, "ui_homescreen_stretch_screens"

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/preference/Preferences$HomescreenFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    .line 137
    .local v2, stretch:Landroid/preference/Preference;
    if-eqz v2, :cond_1

    .line 138
    invoke-virtual {v0, v2}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 142
    .end local v1           #grid:Landroid/preference/Preference;
    .end local v2           #stretch:Landroid/preference/Preference;
    .end local v3           #workspaceTabletGrid:Z
    :cond_1
    return-void
.end method
