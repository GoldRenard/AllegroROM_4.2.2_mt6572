.class public Lcom/mediatek/oobe/basic/InternetConnectionActivity;
.super Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;
.source "InternetConnectionActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "OOBE"


# instance fields
.field private mDataConnectionOpen:Z

.field private mWifiNGprsPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

.field private mWifiOnlyPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;-><init>()V

    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->mDataConnectionOpen:Z

    return-void
.end method

.method private isDataConnection()Z
    .locals 2

    .prologue
    .line 115
    const-string v1, "connectivity"

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 116
    .local v0, cm:Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getMobileDataEnabled()Z

    move-result v1

    return v1
.end method

.method private setDataConnection(Z)V
    .locals 3
    .parameter "bEnable"

    .prologue
    .line 104
    const-string v1, "connectivity"

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 105
    .local v0, cm:Landroid/net/ConnectivityManager;
    invoke-virtual {v0, p1}, Landroid/net/ConnectivityManager;->setMobileDataEnabled(Z)V

    .line 107
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->isDataConnection()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 108
    const-string v1, "OOBE"

    const-string v2, "mobile data enabled"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    :goto_0
    return-void

    .line 110
    :cond_0
    const-string v1, "OOBE"

    const-string v2, "mobile data disabled"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method protected initSpecialLayout()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 70
    const v0, 0x7f090053

    const v1, 0x7f090054

    invoke-super {p0, v0, v1}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->initSpecialLayout(II)V

    .line 71
    const-string v0, "wifi_and_gprs"

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/mediatek/oobe/utils/RadioButtonPreference;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->mWifiNGprsPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

    .line 72
    const-string v0, "wifi_only"

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/mediatek/oobe/utils/RadioButtonPreference;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->mWifiOnlyPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

    .line 73
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->isDataConnection()Z

    move-result v0

    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->mDataConnectionOpen:Z

    .line 74
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->mDataConnectionOpen:Z

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->mWifiNGprsPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

    invoke-virtual {v0, v3}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->setChecked(Z)V

    .line 76
    iget-object v0, p0, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->mWifiOnlyPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

    invoke-virtual {v0, v2}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->setChecked(Z)V

    .line 81
    :goto_0
    return-void

    .line 78
    :cond_0
    iget-object v0, p0, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->mWifiNGprsPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

    invoke-virtual {v0, v2}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->setChecked(Z)V

    .line 79
    iget-object v0, p0, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->mWifiOnlyPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

    invoke-virtual {v0, v3}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->setChecked(Z)V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 61
    const-string v0, "OOBE"

    const-string v1, "OnCreate InternetConnectionActivity"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 64
    const v0, 0x7f050003

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->addPreferencesFromResource(I)V

    .line 66
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->initSpecialLayout()V

    .line 67
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 122
    invoke-super {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onDestroy()V

    .line 123
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 128
    invoke-super {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onPause()V

    .line 129
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 4
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 85
    iget-object v2, p0, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->mWifiNGprsPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

    if-ne p2, v2, :cond_1

    .line 86
    iget-object v2, p0, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->mWifiNGprsPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

    invoke-virtual {v2, v1}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->setChecked(Z)V

    .line 87
    iget-object v2, p0, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->mWifiOnlyPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

    invoke-virtual {v2, v0}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->setChecked(Z)V

    .line 88
    const-string v0, "OOBE"

    const-string v2, "Enable mobile data"

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    invoke-direct {p0, v1}, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->setDataConnection(Z)V

    .line 90
    iput-boolean v1, p0, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->mDataConnectionOpen:Z

    :goto_0
    move v0, v1

    .line 100
    :cond_0
    return v0

    .line 91
    :cond_1
    iget-object v2, p0, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->mWifiOnlyPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

    if-ne p2, v2, :cond_0

    .line 92
    iget-object v2, p0, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->mWifiNGprsPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

    invoke-virtual {v2, v0}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->setChecked(Z)V

    .line 93
    iget-object v2, p0, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->mWifiOnlyPref:Lcom/mediatek/oobe/utils/RadioButtonPreference;

    invoke-virtual {v2, v1}, Lcom/mediatek/oobe/utils/RadioButtonPreference;->setChecked(Z)V

    .line 94
    const-string v2, "OOBE"

    const-string v3, "Disable mobile data"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->setDataConnection(Z)V

    .line 96
    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/InternetConnectionActivity;->mDataConnectionOpen:Z

    goto :goto_0
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 134
    invoke-super {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onResume()V

    .line 135
    return-void
.end method
