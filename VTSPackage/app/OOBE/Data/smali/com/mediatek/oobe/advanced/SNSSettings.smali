.class public Lcom/mediatek/oobe/advanced/SNSSettings;
.super Lcom/mediatek/oobe/advanced/AccountPreferenceBase;
.source "SNSSettings.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic getAuthoritiesForAccountType(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 47
    invoke-super {p0, p1}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->getAuthoritiesForAccountType(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method protected getStepSpecialTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    const-string v0, "SNSSettings"

    return-object v0
.end method

.method public bridge synthetic onAccountsUpdated([Landroid/accounts/Account;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 47
    invoke-super {p0, p1}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->onAccountsUpdated([Landroid/accounts/Account;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    const/4 v4, 0x1

    .line 51
    invoke-super {p0, p1}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->onCreate(Landroid/os/Bundle;)V

    .line 52
    iput-object p0, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mContext:Landroid/content/Context;

    .line 54
    const v1, 0x7f050005

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/advanced/SNSSettings;->addPreferencesFromResource(I)V

    .line 56
    const v1, 0x7f09007c

    const v2, 0x7f09007d

    invoke-virtual {p0, v1, v2}, Lcom/mediatek/oobe/advanced/SNSSettings;->initSpecialLayout(II)V

    .line 57
    const v1, 0x7f0b000d

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/advanced/SNSSettings;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    .line 58
    .local v0, spinner:Landroid/widget/Spinner;
    if-eqz v0, :cond_0

    .line 59
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setVisibility(I)V

    .line 61
    :cond_0
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "com.android.exchange"

    aput-object v3, v1, v2

    const-string v2, "com.google"

    aput-object v2, v1, v4

    iput-object v1, p0, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->mUnSupportedType:[Ljava/lang/String;

    .line 62
    invoke-virtual {p0}, Lcom/mediatek/oobe/advanced/SNSSettings;->updateAuthDescriptions()V

    .line 63
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p0, v2, v4}, Landroid/accounts/AccountManager;->addOnAccountsUpdatedListener(Landroid/accounts/OnAccountsUpdateListener;Landroid/os/Handler;Z)V

    .line 65
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 69
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/accounts/AccountManager;->removeOnAccountsUpdatedListener(Landroid/accounts/OnAccountsUpdateListener;)V

    .line 70
    invoke-super {p0}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->onDestroy()V

    .line 71
    return-void
.end method

.method public bridge synthetic onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 47
    invoke-super {p0, p1, p2}, Lcom/mediatek/oobe/advanced/AccountPreferenceBase;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v0

    return v0
.end method
