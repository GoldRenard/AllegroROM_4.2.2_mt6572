.class public Lcom/android/browser/preferences/GeneralPreferencesFragment;
.super Landroid/preference/PreferenceFragment;
.source "GeneralPreferencesFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# static fields
.field public static final BLANK:Ljava/lang/String; = "blank"

.field public static final BLANK_URL:Ljava/lang/String; = "about:blank"

.field public static final CURRENT:Ljava/lang/String; = "current"

.field public static final DEFAULT:Ljava/lang/String; = "default"

.field public static final MOST_VISITED:Ljava/lang/String; = "most_visited"

.field public static final OTHER:Ljava/lang/String; = "other"

.field public static final PREF_HOMEPAGE_PICKER:Ljava/lang/String; = "homepage_picker"

.field public static final SITE_NAVIGATION:Ljava/lang/String; = "site_navigation"

.field static final TAG:Ljava/lang/String; = "PersonalPreferencesFragment"


# instance fields
.field mChoices:[Ljava/lang/String;

.field mCurrentPage:Ljava/lang/String;

.field mValues:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    return-void
.end method


# virtual methods
.method getHomepageLabel(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "value"

    .prologue
    .line 235
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment;->mValues:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 236
    iget-object v1, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment;->mValues:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 237
    iget-object v1, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment;->mChoices:[Ljava/lang/String;

    aget-object v1, v1, v0

    .line 240
    :goto_1
    return-object v1

    .line 235
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 240
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method getHomepageSummary(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "keyValue"

    .prologue
    .line 218
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-gtz v2, :cond_2

    .line 219
    :cond_0
    const/4 v0, 0x0

    .line 231
    :cond_1
    :goto_0
    return-object v0

    .line 222
    :cond_2
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v1

    .line 223
    .local v1, settings:Lcom/android/browser/BrowserSettings;
    invoke-virtual {v1}, Lcom/android/browser/BrowserSettings;->getHomePage()Ljava/lang/String;

    move-result-object v0

    .line 224
    .local v0, homepage:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "about:blank"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 225
    :cond_3
    const-string p1, "blank"

    .line 227
    :cond_4
    const-string v2, "current"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "other"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 231
    invoke-virtual {p0, p1}, Lcom/android/browser/preferences/GeneralPreferencesFragment;->getHomepageLabel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method getHomepageValue()Ljava/lang/String;
    .locals 4

    .prologue
    .line 191
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v2

    .line 192
    .local v2, settings:Lcom/android/browser/BrowserSettings;
    invoke-virtual {v2}, Lcom/android/browser/BrowserSettings;->getHomePage()Ljava/lang/String;

    move-result-object v1

    .line 193
    .local v1, homepage:Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "about:blank"

    invoke-virtual {v3, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 194
    :cond_0
    const-string v3, "blank"

    .line 213
    :goto_0
    return-object v3

    .line 196
    :cond_1
    const-string v3, "content://com.android.browser.home/"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 197
    const-string v3, "most_visited"

    goto :goto_0

    .line 200
    :cond_2
    const-string v3, "content://com.android.browser.site_navigation/websites"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 202
    const-string v3, "site_navigation"

    goto :goto_0

    .line 205
    :cond_3
    invoke-virtual {p0}, Lcom/android/browser/preferences/GeneralPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3}, Lcom/android/browser/BrowserSettings;->getFactoryResetHomeUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 207
    .local v0, defaultHomepage:Ljava/lang/String;
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 208
    const-string v3, "default"

    goto :goto_0

    .line 210
    :cond_4
    iget-object v3, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment;->mCurrentPage:Ljava/lang/String;

    invoke-static {v3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 211
    const-string v3, "current"

    goto :goto_0

    .line 213
    :cond_5
    const-string v3, "other"

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    .line 71
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 72
    invoke-virtual {p0}, Lcom/android/browser/preferences/GeneralPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 75
    .local v2, res:Landroid/content/res/Resources;
    const v3, 0x7f080065

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment;->mChoices:[Ljava/lang/String;

    .line 76
    const v3, 0x7f080066

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment;->mValues:[Ljava/lang/String;

    .line 82
    invoke-virtual {p0}, Lcom/android/browser/preferences/GeneralPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "currentPage"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment;->mCurrentPage:Ljava/lang/String;

    .line 88
    const v3, 0x7f060009

    invoke-virtual {p0, v3}, Lcom/android/browser/preferences/GeneralPreferencesFragment;->addPreferencesFromResource(I)V

    .line 93
    const-string v3, "homepage_picker"

    invoke-virtual {p0, v3}, Lcom/android/browser/preferences/GeneralPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/ListPreference;

    .line 94
    .local v1, pref:Landroid/preference/ListPreference;
    invoke-virtual {v1}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, keyValue:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 96
    const-string v3, "default"

    invoke-virtual {v1, v3}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 99
    :cond_0
    invoke-virtual {v1}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 100
    invoke-virtual {p0, v0}, Lcom/android/browser/preferences/GeneralPreferencesFragment;->getHomepageSummary(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 101
    invoke-virtual {v1, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 102
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 4
    .parameter "pref"
    .parameter "objValue"

    .prologue
    const/4 v1, 0x0

    .line 109
    invoke-virtual {p0}, Lcom/android/browser/preferences/GeneralPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    if-nez v2, :cond_0

    .line 112
    const-string v2, "PageContentPreferencesFragment"

    const-string v3, "onPreferenceChange called from detached fragment!"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    .end local p1
    .end local p2
    :goto_0
    return v1

    .line 116
    .restart local p1
    .restart local p2
    :cond_0
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    const-string v3, "homepage_picker"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 117
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v0

    .line 118
    .local v0, settings:Lcom/android/browser/BrowserSettings;
    const-string v2, "current"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 119
    iget-object v1, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment;->mCurrentPage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/android/browser/BrowserSettings;->setHomePage(Ljava/lang/String;)V

    .line 136
    :cond_1
    :goto_1
    check-cast p2, Ljava/lang/String;

    .end local p2
    invoke-virtual {p0, p2}, Lcom/android/browser/preferences/GeneralPreferencesFragment;->getHomepageSummary(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 139
    .end local v0           #settings:Lcom/android/browser/BrowserSettings;
    :cond_2
    const/4 v1, 0x1

    goto :goto_0

    .line 120
    .restart local v0       #settings:Lcom/android/browser/BrowserSettings;
    .restart local p2
    :cond_3
    const-string v2, "blank"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 121
    const-string v1, "about:blank"

    invoke-virtual {v0, v1}, Lcom/android/browser/BrowserSettings;->setHomePage(Ljava/lang/String;)V

    goto :goto_1

    .line 122
    :cond_4
    const-string v2, "default"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 123
    invoke-virtual {p0}, Lcom/android/browser/preferences/GeneralPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/android/browser/BrowserSettings;->getFactoryResetHomeUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/browser/BrowserSettings;->setHomePage(Ljava/lang/String;)V

    goto :goto_1

    .line 125
    :cond_5
    const-string v2, "most_visited"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 126
    const-string v1, "content://com.android.browser.home/"

    invoke-virtual {v0, v1}, Lcom/android/browser/BrowserSettings;->setHomePage(Ljava/lang/String;)V

    goto :goto_1

    .line 128
    :cond_6
    const-string v2, "site_navigation"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 130
    const-string v1, "content://com.android.browser.site_navigation/websites"

    invoke-virtual {v0, v1}, Lcom/android/browser/BrowserSettings;->setHomePage(Ljava/lang/String;)V

    goto :goto_1

    .line 132
    :cond_7
    const-string v2, "other"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 133
    check-cast p1, Landroid/preference/ListPreference;

    .end local p1
    check-cast p2, Ljava/lang/String;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/android/browser/preferences/GeneralPreferencesFragment;->promptForHomepage(Landroid/preference/ListPreference;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 245
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onResume()V

    .line 247
    invoke-virtual {p0}, Lcom/android/browser/preferences/GeneralPreferencesFragment;->refreshUi()V

    .line 248
    return-void
.end method

.method promptForHomepage(Landroid/preference/ListPreference;Ljava/lang/String;)V
    .locals 9
    .parameter "pref"
    .parameter "keyValue"

    .prologue
    const/4 v1, 0x1

    .line 143
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v3

    .line 144
    .local v3, settings:Lcom/android/browser/BrowserSettings;
    new-instance v2, Landroid/widget/EditText;

    invoke-virtual {p0}, Lcom/android/browser/preferences/GeneralPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {v2, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 145
    .local v2, editText:Landroid/widget/EditText;
    const/16 v0, 0x11

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setInputType(I)V

    .line 147
    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setLongClickable(Z)V

    .line 148
    invoke-virtual {v3}, Lcom/android/browser/BrowserSettings;->getHomePage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 149
    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setSelectAllOnFocus(Z)V

    .line 150
    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 151
    const/4 v0, 0x0

    const/4 v1, 0x6

    invoke-virtual {v2, v0, v1}, Landroid/widget/EditText;->setImeActionLabel(Ljava/lang/CharSequence;I)V

    .line 152
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/android/browser/preferences/GeneralPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x104000a

    new-instance v0, Lcom/android/browser/preferences/GeneralPreferencesFragment$2;

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/android/browser/preferences/GeneralPreferencesFragment$2;-><init>(Lcom/android/browser/preferences/GeneralPreferencesFragment;Landroid/widget/EditText;Lcom/android/browser/BrowserSettings;Landroid/preference/ListPreference;Ljava/lang/String;)V

    invoke-virtual {v7, v8, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x104

    new-instance v4, Lcom/android/browser/preferences/GeneralPreferencesFragment$1;

    invoke-direct {v4, p0}, Lcom/android/browser/preferences/GeneralPreferencesFragment$1;-><init>(Lcom/android/browser/preferences/GeneralPreferencesFragment;)V

    invoke-virtual {v0, v1, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0c00bf

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v6

    .line 172
    .local v6, dialog:Landroid/app/AlertDialog;
    new-instance v0, Lcom/android/browser/preferences/GeneralPreferencesFragment$3;

    invoke-direct {v0, p0, v6}, Lcom/android/browser/preferences/GeneralPreferencesFragment$3;-><init>(Lcom/android/browser/preferences/GeneralPreferencesFragment;Landroid/app/AlertDialog;)V

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 182
    invoke-virtual {v6}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 184
    invoke-virtual {v6}, Landroid/app/AlertDialog;->show()V

    .line 185
    return-void
.end method

.method refreshUi()V
    .locals 2

    .prologue
    .line 251
    const-string v1, "autofill_profile"

    invoke-virtual {p0, v1}, Lcom/android/browser/preferences/GeneralPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceScreen;

    .line 253
    .local v0, autoFillSettings:Landroid/preference/PreferenceScreen;
    const-string v1, "autofill_enabled"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->setDependency(Ljava/lang/String;)V

    .line 254
    return-void
.end method
