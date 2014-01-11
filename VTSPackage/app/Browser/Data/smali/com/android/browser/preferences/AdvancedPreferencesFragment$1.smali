.class Lcom/android/browser/preferences/AdvancedPreferencesFragment$1;
.super Ljava/lang/Object;
.source "AdvancedPreferencesFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/preferences/AdvancedPreferencesFragment;->clickDownloadDirectorySetting()Landroid/preference/Preference$OnPreferenceClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/preferences/AdvancedPreferencesFragment;


# direct methods
.method constructor <init>(Lcom/android/browser/preferences/AdvancedPreferencesFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 138
    iput-object p1, p0, Lcom/android/browser/preferences/AdvancedPreferencesFragment$1;->this$0:Lcom/android/browser/preferences/AdvancedPreferencesFragment;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 5
    .parameter "preference"

    .prologue
    .line 141
    new-instance v0, Landroid/content/Intent;

    const-string v2, "com.mediatek.filemanager.DOWNLOAD_LOCATION"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 142
    .local v0, i:Landroid/content/Intent;
    invoke-virtual {p1}, Landroid/preference/Preference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "download_directory_setting"

    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/browser/BrowserSettings;->getDefaultDownloadPathWithMultiSDcard()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 145
    .local v1, selectedPath:Ljava/lang/String;
    const-string v2, "download path"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 146
    iget-object v2, p0, Lcom/android/browser/preferences/AdvancedPreferencesFragment$1;->this$0:Lcom/android/browser/preferences/AdvancedPreferencesFragment;

    const/16 v3, 0x3e8

    invoke-virtual {v2, v0, v3}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 147
    const/4 v2, 0x1

    return v2
.end method
