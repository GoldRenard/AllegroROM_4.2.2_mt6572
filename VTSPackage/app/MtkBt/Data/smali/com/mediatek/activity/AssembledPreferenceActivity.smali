.class public Lcom/mediatek/activity/AssembledPreferenceActivity;
.super Landroid/preference/PreferenceActivity;
.source "AssembledPreferenceActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;
    }
.end annotation


# instance fields
.field private registeredPreference:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Ljava/util/List;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 73
    .local p1, registeredPreference:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;>;"
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 75
    iput-object p1, p0, Lcom/mediatek/activity/AssembledPreferenceActivity;->registeredPreference:Ljava/util/List;

    .line 76
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 81
    const-string v2, "onCreate()[+]"

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 83
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 86
    iget-object v2, p0, Lcom/mediatek/activity/AssembledPreferenceActivity;->registeredPreference:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;

    .line 89
    .local v0, dp:Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;
    invoke-interface {v0}, Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;->getPreferenceResourceId()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/mediatek/activity/AssembledPreferenceActivity;->addPreferencesFromResource(I)V

    .line 92
    invoke-interface {v0, p0}, Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;->onCreate(Landroid/preference/PreferenceActivity;)V

    goto :goto_0

    .line 94
    .end local v0           #dp:Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;
    :cond_0
    return-void
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    .line 112
    const-string v2, "onDestroy()[+]"

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 115
    iget-object v2, p0, Lcom/mediatek/activity/AssembledPreferenceActivity;->registeredPreference:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;

    .line 116
    .local v0, dp:Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;
    invoke-interface {v0}, Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;->onDestroy()V

    goto :goto_0

    .line 119
    .end local v0           #dp:Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;
    :cond_0
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 120
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 3
    .parameter "state"

    .prologue
    .line 125
    const-string v2, "onRestoreInstanceState()[+]"

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 126
    iget-object v2, p0, Lcom/mediatek/activity/AssembledPreferenceActivity;->registeredPreference:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;

    .line 127
    .local v0, dp:Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;
    invoke-interface {v0, p1}, Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;->onRestoreInstanceState(Landroid/os/Bundle;)V

    goto :goto_0

    .line 129
    .end local v0           #dp:Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;
    :cond_0
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 131
    return-void
.end method

.method protected onResume()V
    .locals 3

    .prologue
    .line 99
    const-string v2, "onResume()[+]"

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 101
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 103
    iget-object v2, p0, Lcom/mediatek/activity/AssembledPreferenceActivity;->registeredPreference:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;

    .line 104
    .local v0, dp:Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;
    invoke-interface {v0}, Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;->onResume()V

    goto :goto_0

    .line 107
    .end local v0           #dp:Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;
    :cond_0
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3
    .parameter "outState"

    .prologue
    .line 136
    const-string v2, "onSaveInstanceState()[+]"

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 137
    iget-object v2, p0, Lcom/mediatek/activity/AssembledPreferenceActivity;->registeredPreference:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;

    .line 138
    .local v0, dp:Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;
    invoke-interface {v0, p1}, Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;->onSaveInstanceState(Landroid/os/Bundle;)V

    goto :goto_0

    .line 140
    .end local v0           #dp:Lcom/mediatek/activity/AssembledPreferenceActivity$AssemblyPreference;
    :cond_0
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 142
    return-void
.end method
