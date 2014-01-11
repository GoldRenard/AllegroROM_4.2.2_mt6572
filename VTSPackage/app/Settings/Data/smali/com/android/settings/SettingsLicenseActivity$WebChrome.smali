.class Lcom/android/settings/SettingsLicenseActivity$WebChrome;
.super Landroid/webkit/WebChromeClient;
.source "SettingsLicenseActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/SettingsLicenseActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "WebChrome"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/SettingsLicenseActivity;


# direct methods
.method constructor <init>(Lcom/android/settings/SettingsLicenseActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 238
    iput-object p1, p0, Lcom/android/settings/SettingsLicenseActivity$WebChrome;->this$0:Lcom/android/settings/SettingsLicenseActivity;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 3
    .parameter "view"
    .parameter "newProgress"

    .prologue
    .line 248
    const-string v0, "SettingsLicenseActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onProgressChanged "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    const/16 v0, 0x64

    if-ne p2, v0, :cond_1

    .line 250
    iget-object v0, p0, Lcom/android/settings/SettingsLicenseActivity$WebChrome;->this$0:Lcom/android/settings/SettingsLicenseActivity;

    #getter for: Lcom/android/settings/SettingsLicenseActivity;->mSpinnerDlg:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/android/settings/SettingsLicenseActivity;->access$200(Lcom/android/settings/SettingsLicenseActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 251
    iget-object v0, p0, Lcom/android/settings/SettingsLicenseActivity$WebChrome;->this$0:Lcom/android/settings/SettingsLicenseActivity;

    #getter for: Lcom/android/settings/SettingsLicenseActivity;->mSpinnerDlg:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/android/settings/SettingsLicenseActivity;->access$200(Lcom/android/settings/SettingsLicenseActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 253
    :cond_0
    invoke-static {}, Landroid/webkit/CookieSyncManager;->getInstance()Landroid/webkit/CookieSyncManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/CookieSyncManager;->sync()V

    .line 254
    iget-object v0, p0, Lcom/android/settings/SettingsLicenseActivity$WebChrome;->this$0:Lcom/android/settings/SettingsLicenseActivity;

    iget-object v1, p0, Lcom/android/settings/SettingsLicenseActivity$WebChrome;->this$0:Lcom/android/settings/SettingsLicenseActivity;

    #getter for: Lcom/android/settings/SettingsLicenseActivity;->mWebView:Landroid/webkit/WebView;
    invoke-static {v1}, Lcom/android/settings/SettingsLicenseActivity;->access$300(Lcom/android/settings/SettingsLicenseActivity;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/settings/SettingsLicenseActivity;->setContentView(Landroid/view/View;)V

    .line 256
    :cond_1
    return-void
.end method

.method public onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1
    .parameter "view"
    .parameter "title"

    .prologue
    .line 242
    iget-object v0, p0, Lcom/android/settings/SettingsLicenseActivity$WebChrome;->this$0:Lcom/android/settings/SettingsLicenseActivity;

    invoke-virtual {v0, p2}, Lcom/android/settings/SettingsLicenseActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 243
    return-void
.end method
