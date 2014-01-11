.class public Lcom/android/settings/wifi/WifiAPITest;
.super Landroid/preference/PreferenceActivity;
.source "WifiAPITest.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# static fields
.field private static final KEY_DISABLE_NETWORK:Ljava/lang/String; = "disable_network"

.field private static final KEY_DISCONNECT:Ljava/lang/String; = "disconnect"

.field private static final KEY_ENABLE_NETWORK:Ljava/lang/String; = "enable_network"

.field private static final TAG:Ljava/lang/String; = "WifiAPITest"


# instance fields
.field private mWifiDisableNetwork:Landroid/preference/Preference;

.field private mWifiDisconnect:Landroid/preference/Preference;

.field private mWifiEnableNetwork:Landroid/preference/Preference;

.field private mWifiManager:Landroid/net/wifi/WifiManager;

.field private netid:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/settings/wifi/WifiAPITest;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 38
    iget v0, p0, Lcom/android/settings/wifi/WifiAPITest;->netid:I

    return v0
.end method

.method static synthetic access$002(Lcom/android/settings/wifi/WifiAPITest;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 38
    iput p1, p0, Lcom/android/settings/wifi/WifiAPITest;->netid:I

    return p1
.end method

.method static synthetic access$100(Lcom/android/settings/wifi/WifiAPITest;)Landroid/net/wifi/WifiManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 38
    iget-object v0, p0, Lcom/android/settings/wifi/WifiAPITest;->mWifiManager:Landroid/net/wifi/WifiManager;

    return-object v0
.end method

.method private onCreatePreferences()V
    .locals 2

    .prologue
    .line 76
    const v1, 0x7f0400a7

    invoke-virtual {p0, v1}, Lcom/android/settings/wifi/WifiAPITest;->addPreferencesFromResource(I)V

    .line 78
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiAPITest;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    .line 80
    .local v0, preferenceScreen:Landroid/preference/PreferenceScreen;
    const-string v1, "disconnect"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/wifi/WifiAPITest;->mWifiDisconnect:Landroid/preference/Preference;

    .line 81
    iget-object v1, p0, Lcom/android/settings/wifi/WifiAPITest;->mWifiDisconnect:Landroid/preference/Preference;

    invoke-virtual {v1, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 83
    const-string v1, "disable_network"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/wifi/WifiAPITest;->mWifiDisableNetwork:Landroid/preference/Preference;

    .line 84
    iget-object v1, p0, Lcom/android/settings/wifi/WifiAPITest;->mWifiDisableNetwork:Landroid/preference/Preference;

    invoke-virtual {v1, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 86
    const-string v1, "enable_network"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/wifi/WifiAPITest;->mWifiEnableNetwork:Landroid/preference/Preference;

    .line 87
    iget-object v1, p0, Lcom/android/settings/wifi/WifiAPITest;->mWifiEnableNetwork:Landroid/preference/Preference;

    invoke-virtual {v1, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 89
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 65
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 67
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiAPITest;->onCreatePreferences()V

    .line 70
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiAPITest;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "wifi"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    iput-object v0, p0, Lcom/android/settings/wifi/WifiAPITest;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 72
    return-void
.end method

.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 4
    .parameter "pref"

    .prologue
    const/4 v3, 0x3

    .line 105
    iget-object v2, p0, Lcom/android/settings/wifi/WifiAPITest;->mWifiDisconnect:Landroid/preference/Preference;

    if-ne p1, v2, :cond_1

    .line 106
    iget-object v2, p0, Lcom/android/settings/wifi/WifiAPITest;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->disconnect()Z

    .line 168
    :cond_0
    :goto_0
    const/4 v2, 0x1

    return v2

    .line 107
    :cond_1
    iget-object v2, p0, Lcom/android/settings/wifi/WifiAPITest;->mWifiDisableNetwork:Landroid/preference/Preference;

    if-ne p1, v2, :cond_2

    .line 108
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 109
    .local v0, alert:Landroid/app/AlertDialog$Builder;
    const-string v2, "Input"

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 110
    const-string v2, "Enter Network ID"

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 112
    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 114
    .local v1, input:Landroid/widget/EditText;
    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setInputType(I)V

    .line 116
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 117
    const-string v2, "Ok"

    new-instance v3, Lcom/android/settings/wifi/WifiAPITest$1;

    invoke-direct {v3, p0, v1}, Lcom/android/settings/wifi/WifiAPITest$1;-><init>(Lcom/android/settings/wifi/WifiAPITest;Landroid/widget/EditText;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 131
    const-string v2, "Cancel"

    new-instance v3, Lcom/android/settings/wifi/WifiAPITest$2;

    invoke-direct {v3, p0}, Lcom/android/settings/wifi/WifiAPITest$2;-><init>(Lcom/android/settings/wifi/WifiAPITest;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 136
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 137
    .end local v0           #alert:Landroid/app/AlertDialog$Builder;
    .end local v1           #input:Landroid/widget/EditText;
    :cond_2
    iget-object v2, p0, Lcom/android/settings/wifi/WifiAPITest;->mWifiEnableNetwork:Landroid/preference/Preference;

    if-ne p1, v2, :cond_0

    .line 138
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 139
    .restart local v0       #alert:Landroid/app/AlertDialog$Builder;
    const-string v2, "Input"

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 140
    const-string v2, "Enter Network ID"

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 142
    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 144
    .restart local v1       #input:Landroid/widget/EditText;
    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setInputType(I)V

    .line 146
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 147
    const-string v2, "Ok"

    new-instance v3, Lcom/android/settings/wifi/WifiAPITest$3;

    invoke-direct {v3, p0, v1}, Lcom/android/settings/wifi/WifiAPITest$3;-><init>(Lcom/android/settings/wifi/WifiAPITest;Landroid/widget/EditText;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 161
    const-string v2, "Cancel"

    new-instance v3, Lcom/android/settings/wifi/WifiAPITest$4;

    invoke-direct {v3, p0}, Lcom/android/settings/wifi/WifiAPITest$4;-><init>(Lcom/android/settings/wifi/WifiAPITest;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 166
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 1
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    .line 97
    invoke-super {p0, p1, p2}, Landroid/preference/PreferenceActivity;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    .line 98
    const/4 v0, 0x0

    return v0
.end method
