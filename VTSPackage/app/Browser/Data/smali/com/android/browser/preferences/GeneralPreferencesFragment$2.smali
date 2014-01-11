.class Lcom/android/browser/preferences/GeneralPreferencesFragment$2;
.super Ljava/lang/Object;
.source "GeneralPreferencesFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/preferences/GeneralPreferencesFragment;->promptForHomepage(Landroid/preference/ListPreference;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/preferences/GeneralPreferencesFragment;

.field final synthetic val$editText:Landroid/widget/EditText;

.field final synthetic val$keyValue:Ljava/lang/String;

.field final synthetic val$pref:Landroid/preference/ListPreference;

.field final synthetic val$settings:Lcom/android/browser/BrowserSettings;


# direct methods
.method constructor <init>(Lcom/android/browser/preferences/GeneralPreferencesFragment;Landroid/widget/EditText;Lcom/android/browser/BrowserSettings;Landroid/preference/ListPreference;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 154
    iput-object p1, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment$2;->this$0:Lcom/android/browser/preferences/GeneralPreferencesFragment;

    iput-object p2, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment$2;->val$editText:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment$2;->val$settings:Lcom/android/browser/BrowserSettings;

    iput-object p4, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment$2;->val$pref:Landroid/preference/ListPreference;

    iput-object p5, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment$2;->val$keyValue:Ljava/lang/String;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 157
    iget-object v1, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment$2;->val$editText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 158
    .local v0, homepage:Ljava/lang/String;
    invoke-static {v0}, Lcom/android/browser/UrlUtils;->smartUrlFilter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 159
    iget-object v1, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment$2;->val$settings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {v1, v0}, Lcom/android/browser/BrowserSettings;->setHomePage(Ljava/lang/String;)V

    .line 160
    iget-object v1, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment$2;->val$pref:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment$2;->val$keyValue:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 161
    iget-object v1, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment$2;->val$pref:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment$2;->this$0:Lcom/android/browser/preferences/GeneralPreferencesFragment;

    iget-object v3, p0, Lcom/android/browser/preferences/GeneralPreferencesFragment$2;->val$keyValue:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/android/browser/preferences/GeneralPreferencesFragment;->getHomepageSummary(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 162
    return-void
.end method
