.class public Lcom/mediatek/oobe/advanced/AccountSettings;
.super Lcom/mediatek/oobe/advanced/AccountPreferenceBase;
.source "AccountSettings.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic getAuthoritiesForAccountType(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 45
    invoke-super {p0, p1}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->getAuthoritiesForAccountType(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method protected getStepSpecialTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    const-string v0, "AccountSettings"

    return-object v0
.end method

.method public bridge synthetic onAccountsUpdated([Landroid/accounts/Account;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 45
    invoke-super {p0, p1}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->onAccountsUpdated([Landroid/accounts/Account;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    const/4 v3, 0x1

    .line 48
    invoke-super {p0, p1}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->onCreate(Landroid/os/Bundle;)V

    .line 49
    iput-object p0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mContext:Landroid/content/Context;

    .line 50
    const v0, 0x7f050001

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/advanced/AccountSettings;->addPreferencesFromResource(I)V

    .line 51
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AccountSettings;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "authorities"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mAuthorities:[Ljava/lang/String;

    .line 52
    const v0, 0x7f090078

    const v1, 0x7f090079

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/oobe/advanced/AccountSettings;->initSpecialLayout(II)V

    .line 54
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "com.android.exchange"

    aput-object v2, v0, v1

    const-string v1, "com.android.email"

    aput-object v1, v0, v3

    iput-object v0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mSupportedType:[Ljava/lang/String;

    .line 55
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/AccountSettings;->updateAuthDescriptions()V

    .line 56
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1, v3}, Landroid/accounts/AccountManager;->addOnAccountsUpdatedListener(Landroid/accounts/OnAccountsUpdateListener;Landroid/os/Handler;Z)V

    .line 58
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 62
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/accounts/AccountManager;->removeOnAccountsUpdatedListener(Landroid/accounts/OnAccountsUpdateListener;)V

    .line 63
    invoke-super {p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->onDestroy()V

    .line 64
    return-void
.end method

.method public bridge synthetic onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 45
    invoke-super {p0, p1, p2}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v0

    return v0
.end method
