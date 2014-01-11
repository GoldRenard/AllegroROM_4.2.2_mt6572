.class public Lcom/cyanogenmod/trebuchet/preference/Preferences;
.super Landroid/preference/PreferenceActivity;
.source "Preferences.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/preference/Preferences$1;,
        Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter;,
        Lcom/cyanogenmod/trebuchet/preference/Preferences$GeneralFragment;,
        Lcom/cyanogenmod/trebuchet/preference/Preferences$DockFragment;,
        Lcom/cyanogenmod/trebuchet/preference/Preferences$DrawerFragment;,
        Lcom/cyanogenmod/trebuchet/preference/Preferences$HomescreenFragment;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Trebuchet.Preferences"


# instance fields
.field private mPreferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 172
    return-void
.end method

.method private updateHeaders(Ljava/util/List;)V
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/preference/PreferenceActivity$Header;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p1, headers:Ljava/util/List;,"Ljava/util/List<Landroid/preference/PreferenceActivity$Header;>;"
    const/4 v1, 0x0

    .line 90
    .local v1, i:I
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 91
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity$Header;

    .line 94
    .local v0, header:Landroid/preference/PreferenceActivity$Header;
    iget-wide v2, v0, Landroid/preference/PreferenceActivity$Header;->id:J

    const-wide/32 v4, 0x7f07004c

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    .line 95
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const v3, 0x7f09007b

    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/preference/Preferences;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const v3, 0x7f090001

    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/preference/Preferences;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Landroid/preference/PreferenceActivity$Header;->title:Ljava/lang/CharSequence;

    .line 99
    :cond_1
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v0, :cond_0

    .line 100
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 103
    .end local v0           #header:Landroid/preference/PreferenceActivity$Header;
    :cond_2
    return-void
.end method


# virtual methods
.method public onBuildHeaders(Ljava/util/List;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/preference/PreferenceActivity$Header;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 84
    .local p1, target:Ljava/util/List;,"Ljava/util/List<Landroid/preference/PreferenceActivity$Header;>;"
    const v0, 0x7f060005

    invoke-virtual {p0, v0, p1}, Lcom/cyanogenmod/trebuchet/preference/Preferences;->loadHeadersFromResource(ILjava/util/List;)V

    .line 85
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/preference/Preferences;->updateHeaders(Ljava/util/List;)V

    .line 86
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 50
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 51
    const-string v0, "com.cyanogenmod.trebuchet_preferences"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/preference/Preferences;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/Preferences;->mPreferences:Landroid/content/SharedPreferences;

    .line 54
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/Preferences;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 55
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 59
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 67
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 61
    :pswitch_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/Preferences;->onBackPressed()V

    .line 62
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/Preferences;->finish()V

    .line 63
    const/4 v0, 0x1

    goto :goto_0

    .line 59
    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 78
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onPause()V

    .line 79
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/Preferences;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 80
    return-void
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 72
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 73
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/Preferences;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 74
    return-void
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 3
    .parameter "sharedPreferences"
    .parameter "key"

    .prologue
    .line 116
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/preference/Preferences;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 117
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v1, "preferences_changed"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 118
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 119
    return-void
.end method

.method public setListAdapter(Landroid/widget/ListAdapter;)V
    .locals 2
    .parameter "adapter"

    .prologue
    .line 107
    if-nez p1, :cond_0

    .line 108
    const/4 v0, 0x0

    invoke-super {p0, v0}, Landroid/preference/PreferenceActivity;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 112
    :goto_0
    return-void

    .line 110
    :cond_0
    new-instance v0, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/Preferences;->getHeaders()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    invoke-super {p0, v0}, Landroid/preference/PreferenceActivity;->setListAdapter(Landroid/widget/ListAdapter;)V

    goto :goto_0
.end method
