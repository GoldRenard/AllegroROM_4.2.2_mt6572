.class Lcom/android/browser/BrowserYesNoPreference;
.super Lcom/android/internal/preference/YesNoPreference;
.source "BrowserYesNoPreference.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Lcom/android/internal/preference/YesNoPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    return-void
.end method


# virtual methods
.method protected onDialogClosed(Z)V
    .locals 3
    .parameter "positiveResult"

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/android/internal/preference/YesNoPreference;->onDialogClosed(Z)V

    .line 38
    if-eqz p1, :cond_0

    .line 39
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/android/browser/BrowserYesNoPreference;->setEnabled(Z)V

    .line 41
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v0

    .line 42
    .local v0, settings:Lcom/android/browser/BrowserSettings;
    const-string v1, "privacy_clear_cache"

    invoke-virtual {p0}, Lcom/android/browser/BrowserYesNoPreference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 43
    invoke-virtual {v0}, Lcom/android/browser/BrowserSettings;->clearCache()V

    .line 44
    invoke-virtual {v0}, Lcom/android/browser/BrowserSettings;->clearDatabases()V

    .line 68
    .end local v0           #settings:Lcom/android/browser/BrowserSettings;
    :cond_0
    :goto_0
    return-void

    .line 45
    .restart local v0       #settings:Lcom/android/browser/BrowserSettings;
    :cond_1
    const-string v1, "privacy_clear_cookies"

    invoke-virtual {p0}, Lcom/android/browser/BrowserYesNoPreference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 46
    invoke-virtual {v0}, Lcom/android/browser/BrowserSettings;->clearCookies()V

    goto :goto_0

    .line 47
    :cond_2
    const-string v1, "privacy_clear_history"

    invoke-virtual {p0}, Lcom/android/browser/BrowserYesNoPreference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 48
    invoke-virtual {v0}, Lcom/android/browser/BrowserSettings;->clearHistory()V

    goto :goto_0

    .line 49
    :cond_3
    const-string v1, "privacy_clear_form_data"

    invoke-virtual {p0}, Lcom/android/browser/BrowserYesNoPreference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 50
    invoke-virtual {v0}, Lcom/android/browser/BrowserSettings;->clearFormData()V

    goto :goto_0

    .line 51
    :cond_4
    const-string v1, "privacy_clear_passwords"

    invoke-virtual {p0}, Lcom/android/browser/BrowserYesNoPreference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 52
    invoke-virtual {v0}, Lcom/android/browser/BrowserSettings;->clearPasswords()V

    goto :goto_0

    .line 53
    :cond_5
    const-string v1, "reset_default_preferences"

    invoke-virtual {p0}, Lcom/android/browser/BrowserYesNoPreference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 55
    invoke-virtual {v0}, Lcom/android/browser/BrowserSettings;->resetDefaultPreferences()V

    .line 56
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/browser/BrowserYesNoPreference;->setEnabled(Z)V

    goto :goto_0

    .line 57
    :cond_6
    const-string v1, "privacy_clear_geolocation_access"

    invoke-virtual {p0}, Lcom/android/browser/BrowserYesNoPreference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 59
    invoke-virtual {v0}, Lcom/android/browser/BrowserSettings;->clearLocationAccess()V

    goto :goto_0

    .line 61
    :cond_7
    const-string v1, "privacy_clear_notification"

    invoke-virtual {p0}, Lcom/android/browser/BrowserYesNoPreference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 63
    invoke-virtual {v0}, Lcom/android/browser/BrowserSettings;->clearWebNotifications()V

    goto :goto_0
.end method
