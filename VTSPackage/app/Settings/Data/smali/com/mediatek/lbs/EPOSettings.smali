.class public Lcom/mediatek/lbs/EPOSettings;
.super Lcom/android/settings/SettingsPreferenceFragment;
.source "EPOSettings.java"


# static fields
.field private static final ABOUT_DIALOG_ID:I = 0x2

.field private static final ALERT_DIALOG_ID:I = 0x1

.field private static final EPO_DOWNLAOD_INITATE_STATE:I = 0x0

.field private static final EPO_DOWNLOAD_COMPLETE_STATE:I = 0x64

.field private static final ERROR_DIALOG_ID:I = 0x0

.field private static final KEY_ABOUT_EPO:Ljava/lang/String; = "epo_about"

.field private static final KEY_AUTO_DOWNLOAD:Ljava/lang/String; = "auto_download"

.field private static final KEY_DOWNLOAD_TIME:Ljava/lang/String; = "download_time"

.field private static final KEY_EPO_INFO_CAT:Ljava/lang/String; = "epo_info_cat"

.field private static final KEY_EXPIRE_TIME:Ljava/lang/String; = "expire_time"

.field private static final KEY_START_TIME:Ljava/lang/String; = "start_time"

.field protected static final MENU_EPO_DOWNLOAD:I = 0x1

.field private static final XLOGTAG:Ljava/lang/String; = "Settings/EPO"


# instance fields
.field private mAutoDownloadPreference:Landroid/preference/CheckBoxPreference;

.field private mDownloadMenuItem:Landroid/view/MenuItem;

.field private mDownloadTimePreference:Landroid/preference/Preference;

.field private mEPOInfoCategory:Lcom/mediatek/lbs/EpoProgressCategory;

.field private mEpoMgr:Lcom/mediatek/common/epo/MtkEpoClientManager;

.field private mEpoStatus:Z

.field private final mEpoStatusListener:Lcom/mediatek/common/epo/MtkEpoStatusListener;

.field private mErrorMessage:Ljava/lang/String;

.field private mExpireTimePreference:Landroid/preference/Preference;

.field private mStartTimePreference:Landroid/preference/Preference;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/android/settings/SettingsPreferenceFragment;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoStatus:Z

    .line 125
    new-instance v0, Lcom/mediatek/lbs/EPOSettings$1;

    invoke-direct {v0, p0}, Lcom/mediatek/lbs/EPOSettings$1;-><init>(Lcom/mediatek/lbs/EPOSettings;)V

    iput-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoStatusListener:Lcom/mediatek/common/epo/MtkEpoStatusListener;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/lbs/EPOSettings;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/mediatek/lbs/EPOSettings;->updateEpoProgressToMmi(I)V

    return-void
.end method

.method private epoEnableAuto(Z)V
    .locals 2
    .parameter "enable"

    .prologue
    .line 170
    if-eqz p1, :cond_0

    .line 171
    iget-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoMgr:Lcom/mediatek/common/epo/MtkEpoClientManager;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/mediatek/common/epo/MtkEpoClientManager;->enableAutoDownload(Z)V

    .line 175
    :goto_0
    return-void

    .line 173
    :cond_0
    iget-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoMgr:Lcom/mediatek/common/epo/MtkEpoClientManager;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/mediatek/common/epo/MtkEpoClientManager;->enableAutoDownload(Z)V

    goto :goto_0
.end method

.method private handleStatusChanged()V
    .locals 5

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 101
    invoke-direct {p0}, Lcom/mediatek/lbs/EPOSettings;->isNetworkAvailable()Z

    move-result v4

    if-nez v4, :cond_0

    .line 102
    invoke-virtual {p0}, Lcom/mediatek/lbs/EPOSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0b0071

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/lbs/EPOSettings;->mErrorMessage:Ljava/lang/String;

    .line 103
    invoke-virtual {p0, v2}, Lcom/mediatek/lbs/EPOSettings;->showDialog(I)V

    .line 123
    :goto_0
    return-void

    .line 107
    :cond_0
    iget-boolean v4, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoStatus:Z

    if-nez v4, :cond_1

    move v2, v3

    :cond_1
    iput-boolean v2, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoStatus:Z

    .line 108
    iget-boolean v2, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoStatus:Z

    if-eqz v2, :cond_3

    .line 109
    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mDownloadMenuItem:Landroid/view/MenuItem;

    if-eqz v2, :cond_2

    .line 110
    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mDownloadMenuItem:Landroid/view/MenuItem;

    const v3, 0x7f0b0072

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 112
    :cond_2
    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoMgr:Lcom/mediatek/common/epo/MtkEpoClientManager;

    invoke-interface {v2}, Lcom/mediatek/common/epo/MtkEpoClientManager;->startDownload()I

    move-result v0

    .line 113
    .local v0, ret:I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "startDownload ret="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/lbs/EPOSettings;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 115
    .end local v0           #ret:I
    :cond_3
    invoke-virtual {p0}, Lcom/mediatek/lbs/EPOSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f0b0073

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 116
    .local v1, stoppingMsg:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mEPOInfoCategory:Lcom/mediatek/lbs/EpoProgressCategory;

    invoke-virtual {v2, v1}, Lcom/mediatek/lbs/EpoProgressCategory;->setText(Ljava/lang/String;)V

    .line 117
    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mEPOInfoCategory:Lcom/mediatek/lbs/EpoProgressCategory;

    invoke-virtual {v2, v3}, Lcom/mediatek/lbs/EpoProgressCategory;->setProgress(Z)V

    .line 118
    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mDownloadMenuItem:Landroid/view/MenuItem;

    if-eqz v2, :cond_4

    .line 119
    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mDownloadMenuItem:Landroid/view/MenuItem;

    const v3, 0x7f0b0070

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 121
    :cond_4
    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoMgr:Lcom/mediatek/common/epo/MtkEpoClientManager;

    invoke-interface {v2}, Lcom/mediatek/common/epo/MtkEpoClientManager;->stopDownload()V

    goto :goto_0
.end method

.method private handleStopDownload()V
    .locals 2

    .prologue
    .line 93
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoStatus:Z

    .line 94
    iget-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mDownloadMenuItem:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    .line 95
    iget-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mDownloadMenuItem:Landroid/view/MenuItem;

    const v1, 0x7f0b0070

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 97
    :cond_0
    return-void
.end method

.method private isGpsAvailable()Z
    .locals 2

    .prologue
    .line 178
    invoke-virtual {p0}, Lcom/mediatek/lbs/EPOSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "gps"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->isLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private isNetworkAvailable()Z
    .locals 3

    .prologue
    .line 182
    const-string v2, "connectivity"

    invoke-virtual {p0, v2}, Lcom/mediatek/lbs/EPOSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 183
    .local v0, cm:Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 184
    .local v1, networkInfo:Landroid/net/NetworkInfo;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 185
    const/4 v2, 0x1

    .line 187
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 292
    const-string v0, "Settings/EPO"

    invoke-static {v0, p1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    return-void
.end method

.method private updateEpoProgressToMmi(I)V
    .locals 6
    .parameter "status"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 132
    if-ltz p1, :cond_0

    const/16 v2, 0x64

    if-gt p1, v2, :cond_0

    .line 133
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "progress="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/lbs/EPOSettings;->log(Ljava/lang/String;)V

    .line 134
    invoke-virtual {p0}, Lcom/mediatek/lbs/EPOSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b0074

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 135
    .local v0, startingMsg:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mEPOInfoCategory:Lcom/mediatek/lbs/EpoProgressCategory;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "%)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mediatek/lbs/EpoProgressCategory;->setText(Ljava/lang/String;)V

    .line 136
    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mEPOInfoCategory:Lcom/mediatek/lbs/EpoProgressCategory;

    invoke-virtual {v2, v5}, Lcom/mediatek/lbs/EpoProgressCategory;->setProgress(Z)V

    .line 167
    .end local v0           #startingMsg:Ljava/lang/String;
    :goto_0
    return-void

    .line 137
    :cond_0
    const/16 v2, 0xc8

    if-ne p1, v2, :cond_1

    .line 138
    const-string v2, "epo started"

    invoke-direct {p0, v2}, Lcom/mediatek/lbs/EPOSettings;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 139
    :cond_1
    const/16 v2, 0xc9

    if-ne p1, v2, :cond_2

    .line 140
    const-string v2, "epo update success"

    invoke-direct {p0, v2}, Lcom/mediatek/lbs/EPOSettings;->log(Ljava/lang/String;)V

    .line 141
    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mEPOInfoCategory:Lcom/mediatek/lbs/EpoProgressCategory;

    invoke-virtual {v2, v4}, Lcom/mediatek/lbs/EpoProgressCategory;->setProgress(Z)V

    .line 142
    invoke-direct {p0}, Lcom/mediatek/lbs/EPOSettings;->handleStopDownload()V

    .line 143
    invoke-virtual {p0}, Lcom/mediatek/lbs/EPOSettings;->updatePage()V

    goto :goto_0

    .line 144
    :cond_2
    const/16 v2, 0xca

    if-ne p1, v2, :cond_3

    .line 145
    const-string v2, "epo update failure"

    invoke-direct {p0, v2}, Lcom/mediatek/lbs/EPOSettings;->log(Ljava/lang/String;)V

    .line 146
    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mEPOInfoCategory:Lcom/mediatek/lbs/EpoProgressCategory;

    invoke-virtual {v2, v4}, Lcom/mediatek/lbs/EpoProgressCategory;->setProgress(Z)V

    .line 147
    invoke-direct {p0}, Lcom/mediatek/lbs/EPOSettings;->handleStopDownload()V

    .line 149
    invoke-virtual {p0}, Lcom/mediatek/lbs/EPOSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b0075

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mErrorMessage:Ljava/lang/String;

    .line 150
    invoke-virtual {p0, v4}, Lcom/mediatek/lbs/EPOSettings;->showDialog(I)V

    goto :goto_0

    .line 151
    :cond_3
    const/16 v2, 0xcb

    if-ne p1, v2, :cond_4

    .line 152
    const-string v2, "epo update canceled"

    invoke-direct {p0, v2}, Lcom/mediatek/lbs/EPOSettings;->log(Ljava/lang/String;)V

    .line 153
    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mEPOInfoCategory:Lcom/mediatek/lbs/EpoProgressCategory;

    invoke-virtual {v2, v4}, Lcom/mediatek/lbs/EpoProgressCategory;->setProgress(Z)V

    .line 154
    invoke-direct {p0}, Lcom/mediatek/lbs/EPOSettings;->handleStopDownload()V

    goto :goto_0

    .line 155
    :cond_4
    const/16 v2, 0x12c

    if-ne p1, v2, :cond_5

    .line 156
    const-string v2, "epo is idle"

    invoke-direct {p0, v2}, Lcom/mediatek/lbs/EPOSettings;->log(Ljava/lang/String;)V

    .line 157
    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mEPOInfoCategory:Lcom/mediatek/lbs/EpoProgressCategory;

    invoke-virtual {v2, v4}, Lcom/mediatek/lbs/EpoProgressCategory;->setProgress(Z)V

    .line 158
    invoke-direct {p0}, Lcom/mediatek/lbs/EPOSettings;->handleStopDownload()V

    goto :goto_0

    .line 159
    :cond_5
    const/16 v2, 0xcc

    if-ne p1, v2, :cond_6

    .line 160
    const-string v2, "epo is canceling"

    invoke-direct {p0, v2}, Lcom/mediatek/lbs/EPOSettings;->log(Ljava/lang/String;)V

    .line 161
    invoke-virtual {p0}, Lcom/mediatek/lbs/EPOSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b0073

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 162
    .local v1, stoppingMsg:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mEPOInfoCategory:Lcom/mediatek/lbs/EpoProgressCategory;

    invoke-virtual {v2, v1}, Lcom/mediatek/lbs/EpoProgressCategory;->setText(Ljava/lang/String;)V

    .line 163
    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mEPOInfoCategory:Lcom/mediatek/lbs/EpoProgressCategory;

    invoke-virtual {v2, v5}, Lcom/mediatek/lbs/EpoProgressCategory;->setProgress(Z)V

    goto/16 :goto_0

    .line 165
    .end local v1           #stoppingMsg:Ljava/lang/String;
    :cond_6
    const-string v2, "WARNING: unknown status recv"

    invoke-direct {p0, v2}, Lcom/mediatek/lbs/EPOSettings;->log(Ljava/lang/String;)V

    goto/16 :goto_0
.end method


# virtual methods
.method public initPage()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 219
    const-string v0, "auto_download"

    invoke-virtual {p0, v0}, Lcom/mediatek/lbs/EPOSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mAutoDownloadPreference:Landroid/preference/CheckBoxPreference;

    .line 221
    const-string v0, "epo_info_cat"

    invoke-virtual {p0, v0}, Lcom/mediatek/lbs/EPOSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/mediatek/lbs/EpoProgressCategory;

    iput-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mEPOInfoCategory:Lcom/mediatek/lbs/EpoProgressCategory;

    .line 222
    const-string v0, "download_time"

    invoke-virtual {p0, v0}, Lcom/mediatek/lbs/EPOSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mDownloadTimePreference:Landroid/preference/Preference;

    .line 223
    const-string v0, "start_time"

    invoke-virtual {p0, v0}, Lcom/mediatek/lbs/EPOSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mStartTimePreference:Landroid/preference/Preference;

    .line 224
    const-string v0, "expire_time"

    invoke-virtual {p0, v0}, Lcom/mediatek/lbs/EPOSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mExpireTimePreference:Landroid/preference/Preference;

    .line 226
    iget-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mDownloadTimePreference:Landroid/preference/Preference;

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 227
    iget-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mStartTimePreference:Landroid/preference/Preference;

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 228
    iget-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mExpireTimePreference:Landroid/preference/Preference;

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 229
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 57
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 58
    const v0, 0x7f05001a

    invoke-virtual {p0, v0}, Lcom/mediatek/lbs/EPOSettings;->addPreferencesFromResource(I)V

    .line 59
    const-string v0, "onCreate"

    invoke-direct {p0, v0}, Lcom/mediatek/lbs/EPOSettings;->log(Ljava/lang/String;)V

    .line 61
    const-string v0, "mtk-epo-client"

    invoke-virtual {p0, v0}, Lcom/mediatek/lbs/EPOSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/common/epo/MtkEpoClientManager;

    iput-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoMgr:Lcom/mediatek/common/epo/MtkEpoClientManager;

    .line 62
    iget-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoMgr:Lcom/mediatek/common/epo/MtkEpoClientManager;

    if-nez v0, :cond_0

    .line 63
    const-string v0, "ERR: cannot get EPO client service"

    invoke-direct {p0, v0}, Lcom/mediatek/lbs/EPOSettings;->log(Ljava/lang/String;)V

    .line 66
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/lbs/EPOSettings;->initPage()V

    .line 67
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mediatek/lbs/EPOSettings;->setHasOptionsMenu(Z)V

    .line 68
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 5
    .parameter "id"

    .prologue
    const v3, 0x1080027

    const/4 v4, 0x0

    .line 266
    const/4 v0, 0x0

    .line 267
    .local v0, dialog:Landroid/app/Dialog;
    if-nez p1, :cond_0

    .line 268
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mediatek/lbs/EPOSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0b0076

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mErrorMessage:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0b0077

    invoke-virtual {v1, v2, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 288
    :goto_0
    return-object v0

    .line 271
    :cond_0
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 272
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mediatek/lbs/EPOSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0b0078

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0b0079

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x1040013

    new-instance v3, Lcom/mediatek/lbs/EPOSettings$2;

    invoke-direct {v3, p0}, Lcom/mediatek/lbs/EPOSettings$2;-><init>(Lcom/mediatek/lbs/EPOSettings;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x1040009

    invoke-virtual {v1, v2, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto :goto_0

    .line 281
    :cond_1
    const/4 v1, 0x2

    if-ne p1, v1, :cond_2

    .line 282
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mediatek/lbs/EPOSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0b0065

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x108009b

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0b0066

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x104000a

    invoke-virtual {v1, v2, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto :goto_0

    .line 286
    :cond_2
    const-string v1, "There is no such Dialog id"

    invoke-direct {p0, v1}, Lcom/mediatek/lbs/EPOSettings;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 4
    .parameter "menu"
    .parameter "inflater"

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 192
    invoke-super {p0, p1, p2}, Lcom/android/settings/SettingsPreferenceFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 193
    const-string v1, "onCreateOptionsMenu"

    invoke-direct {p0, v1}, Lcom/mediatek/lbs/EPOSettings;->log(Ljava/lang/String;)V

    .line 194
    const v1, 0x7f0b0070

    invoke-interface {p1, v2, v3, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 195
    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/lbs/EPOSettings;->mDownloadMenuItem:Landroid/view/MenuItem;

    .line 197
    iget-object v1, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoMgr:Lcom/mediatek/common/epo/MtkEpoClientManager;

    invoke-interface {v1}, Lcom/mediatek/common/epo/MtkEpoClientManager;->getProgress()I

    move-result v0

    .line 199
    .local v0, progress:I
    const/16 v1, 0x12c

    if-ne v0, v1, :cond_0

    const/16 v1, 0xcc

    if-eq v0, v1, :cond_1

    .line 200
    :cond_0
    iget-object v1, p0, Lcom/mediatek/lbs/EPOSettings;->mDownloadMenuItem:Landroid/view/MenuItem;

    const v2, 0x7f0b0072

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 201
    iput-boolean v3, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoStatus:Z

    .line 204
    :cond_1
    invoke-direct {p0, v0}, Lcom/mediatek/lbs/EPOSettings;->updateEpoProgressToMmi(I)V

    .line 205
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 88
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onDestroy()V

    .line 89
    const-string v0, "onDestroy"

    invoke-direct {p0, v0}, Lcom/mediatek/lbs/EPOSettings;->log(Ljava/lang/String;)V

    .line 90
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 209
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 210
    invoke-direct {p0}, Lcom/mediatek/lbs/EPOSettings;->handleStatusChanged()V

    .line 212
    :cond_0
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 81
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onPause()V

    .line 82
    const-string v0, "onPause"

    invoke-direct {p0, v0}, Lcom/mediatek/lbs/EPOSettings;->log(Ljava/lang/String;)V

    .line 83
    iget-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoMgr:Lcom/mediatek/common/epo/MtkEpoClientManager;

    iget-object v1, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoStatusListener:Lcom/mediatek/common/epo/MtkEpoStatusListener;

    invoke-interface {v0, v1}, Lcom/mediatek/common/epo/MtkEpoClientManager;->removeStatusListener(Lcom/mediatek/common/epo/MtkEpoStatusListener;)V

    .line 84
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 2
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    .line 247
    invoke-super {p0, p1, p2}, Lcom/android/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    .line 248
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 250
    .local v0, key:Ljava/lang/String;
    const-string v1, "auto_download"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 251
    check-cast p2, Landroid/preference/CheckBoxPreference;

    .end local p2
    invoke-virtual {p2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v1

    invoke-direct {p0, v1}, Lcom/mediatek/lbs/EPOSettings;->epoEnableAuto(Z)V

    .line 255
    :cond_0
    :goto_0
    const/4 v1, 0x0

    return v1

    .line 252
    .restart local p2
    :cond_1
    const-string v1, "epo_about"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 253
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/mediatek/lbs/EPOSettings;->showDialog(I)V

    goto :goto_0
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 72
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onResume()V

    .line 73
    const-string v0, "onResume"

    invoke-direct {p0, v0}, Lcom/mediatek/lbs/EPOSettings;->log(Ljava/lang/String;)V

    .line 74
    invoke-virtual {p0}, Lcom/mediatek/lbs/EPOSettings;->updatePage()V

    .line 75
    iget-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoMgr:Lcom/mediatek/common/epo/MtkEpoClientManager;

    iget-object v1, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoStatusListener:Lcom/mediatek/common/epo/MtkEpoStatusListener;

    invoke-interface {v0, v1}, Lcom/mediatek/common/epo/MtkEpoClientManager;->addStatusListener(Lcom/mediatek/common/epo/MtkEpoStatusListener;)V

    .line 76
    iget-object v0, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoMgr:Lcom/mediatek/common/epo/MtkEpoClientManager;

    invoke-interface {v0}, Lcom/mediatek/common/epo/MtkEpoClientManager;->getProgress()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/mediatek/lbs/EPOSettings;->updateEpoProgressToMmi(I)V

    .line 77
    return-void
.end method

.method public updatePage()V
    .locals 3

    .prologue
    .line 235
    iget-object v1, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoMgr:Lcom/mediatek/common/epo/MtkEpoClientManager;

    invoke-interface {v1}, Lcom/mediatek/common/epo/MtkEpoClientManager;->getEpoFileInfo()Lcom/mediatek/common/epo/MtkEpoFileInfo;

    move-result-object v0

    .line 236
    .local v0, epoFileInfo:Lcom/mediatek/common/epo/MtkEpoFileInfo;
    if-eqz v0, :cond_0

    .line 237
    iget-object v1, p0, Lcom/mediatek/lbs/EPOSettings;->mStartTimePreference:Landroid/preference/Preference;

    invoke-virtual {v0}, Lcom/mediatek/common/epo/MtkEpoFileInfo;->getStartTimeString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 238
    iget-object v1, p0, Lcom/mediatek/lbs/EPOSettings;->mDownloadTimePreference:Landroid/preference/Preference;

    invoke-virtual {v0}, Lcom/mediatek/common/epo/MtkEpoFileInfo;->getDownloadTimeString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 239
    iget-object v1, p0, Lcom/mediatek/lbs/EPOSettings;->mExpireTimePreference:Landroid/preference/Preference;

    invoke-virtual {v0}, Lcom/mediatek/common/epo/MtkEpoFileInfo;->getExpireTimeString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 242
    :cond_0
    iget-object v1, p0, Lcom/mediatek/lbs/EPOSettings;->mAutoDownloadPreference:Landroid/preference/CheckBoxPreference;

    iget-object v2, p0, Lcom/mediatek/lbs/EPOSettings;->mEpoMgr:Lcom/mediatek/common/epo/MtkEpoClientManager;

    invoke-interface {v2}, Lcom/mediatek/common/epo/MtkEpoClientManager;->getAutoDownloadStatus()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 243
    return-void
.end method
