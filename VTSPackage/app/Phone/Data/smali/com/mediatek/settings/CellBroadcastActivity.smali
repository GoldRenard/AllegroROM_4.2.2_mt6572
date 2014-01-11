.class public Lcom/mediatek/settings/CellBroadcastActivity;
.super Lcom/android/phone/TimeConsumingPreferenceActivity;
.source "CellBroadcastActivity.java"


# static fields
.field private static final BUTTON_CB_CHECKBOX_KEY:Ljava/lang/String; = "enable_cellBroadcast"

.field private static final BUTTON_CB_SETTINGS_KEY:Ljava/lang/String; = "cbsettings"

.field private static final LOG_TAG:Ljava/lang/String; = "Settings/CellBroadcastActivity"


# instance fields
.field private mCBCheckBox:Lcom/mediatek/settings/CellBroadcastCheckBox;

.field private mCBSetting:Landroid/preference/Preference;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field mSimId:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 23
    invoke-direct {p0}, Lcom/android/phone/TimeConsumingPreferenceActivity;-><init>()V

    .line 27
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/settings/CellBroadcastActivity;->mSimId:I

    .line 29
    iput-object v1, p0, Lcom/mediatek/settings/CellBroadcastActivity;->mCBCheckBox:Lcom/mediatek/settings/CellBroadcastCheckBox;

    .line 30
    iput-object v1, p0, Lcom/mediatek/settings/CellBroadcastActivity;->mCBSetting:Landroid/preference/Preference;

    .line 32
    new-instance v0, Lcom/mediatek/settings/CellBroadcastActivity$1;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/CellBroadcastActivity$1;-><init>(Lcom/mediatek/settings/CellBroadcastActivity;)V

    iput-object v0, p0, Lcom/mediatek/settings/CellBroadcastActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/settings/CellBroadcastActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/mediatek/settings/CellBroadcastActivity;->setScreenEnabled()V

    return-void
.end method

.method private setScreenEnabled()V
    .locals 3

    .prologue
    .line 103
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 104
    .local v0, insertSim:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 105
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastActivity;->finish()V

    .line 111
    :cond_0
    :goto_0
    return-void

    .line 106
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 107
    iget v2, p0, Lcom/mediatek/settings/CellBroadcastActivity;->mSimId:I

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/provider/Telephony$SIMInfo;

    iget v1, v1, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    if-eq v2, v1, :cond_0

    .line 108
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastActivity;->finish()V

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "icicle"

    .prologue
    const/4 v4, 0x0

    .line 45
    invoke-super {p0, p1}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 46
    const v2, 0x7f06000a

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/CellBroadcastActivity;->addPreferencesFromResource(I)V

    .line 47
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "simId"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/mediatek/settings/CellBroadcastActivity;->mSimId:I

    .line 49
    const-string v2, "enable_cellBroadcast"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/CellBroadcastActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Lcom/mediatek/settings/CellBroadcastCheckBox;

    iput-object v2, p0, Lcom/mediatek/settings/CellBroadcastActivity;->mCBCheckBox:Lcom/mediatek/settings/CellBroadcastCheckBox;

    .line 50
    const-string v2, "cbsettings"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/CellBroadcastActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/CellBroadcastActivity;->mCBSetting:Landroid/preference/Preference;

    .line 51
    iget-object v3, p0, Lcom/mediatek/settings/CellBroadcastActivity;->mCBCheckBox:Lcom/mediatek/settings/CellBroadcastCheckBox;

    iget-object v2, p0, Lcom/mediatek/settings/CellBroadcastActivity;->mCBCheckBox:Lcom/mediatek/settings/CellBroadcastCheckBox;

    invoke-virtual {v2}, Lcom/mediatek/settings/CellBroadcastCheckBox;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_3

    const v2, 0x7f0d00f2

    :goto_0
    invoke-virtual {v3, v2}, Lcom/mediatek/settings/CellBroadcastCheckBox;->setSummary(I)V

    .line 54
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "sub_title_name"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 55
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "sub_title_name"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/CellBroadcastActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 58
    :cond_0
    iget-object v2, p0, Lcom/mediatek/settings/CellBroadcastActivity;->mCBCheckBox:Lcom/mediatek/settings/CellBroadcastCheckBox;

    if-eqz v2, :cond_1

    .line 59
    iget-object v2, p0, Lcom/mediatek/settings/CellBroadcastActivity;->mCBCheckBox:Lcom/mediatek/settings/CellBroadcastCheckBox;

    iget v3, p0, Lcom/mediatek/settings/CellBroadcastActivity;->mSimId:I

    invoke-virtual {v2, p0, v4, v3}, Lcom/mediatek/settings/CellBroadcastCheckBox;->init(Lcom/mediatek/phone/TimeConsumingPreferenceListener;ZI)V

    .line 62
    :cond_1
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.SIM_INFO_UPDATE"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 63
    .local v1, intentFilter:Landroid/content/IntentFilter;
    iget-object v2, p0, Lcom/mediatek/settings/CellBroadcastActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2, v1}, Lcom/mediatek/settings/CellBroadcastActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 65
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 66
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_2

    .line 68
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 70
    :cond_2
    return-void

    .line 51
    .end local v0           #actionBar:Landroid/app/ActionBar;
    .end local v1           #intentFilter:Landroid/content/IntentFilter;
    :cond_3
    const v2, 0x7f0d00f3

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 98
    invoke-super {p0}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onDestroy()V

    .line 99
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CellBroadcastActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 100
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 86
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 87
    .local v0, itemId:I
    packed-switch v0, :pswitch_data_0

    .line 94
    invoke-super {p0, p1}, Lcom/android/phone/TimeConsumingPreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 89
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/settings/CellBroadcastActivity;->finish()V

    .line 90
    const/4 v1, 0x1

    goto :goto_0

    .line 87
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 3
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    .line 75
    iget-object v1, p0, Lcom/mediatek/settings/CellBroadcastActivity;->mCBSetting:Landroid/preference/Preference;

    if-ne p2, v1, :cond_0

    .line 76
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/settings/CellBroadcastSettings;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 77
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "simId"

    iget v2, p0, Lcom/mediatek/settings/CellBroadcastActivity;->mSimId:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 78
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CellBroadcastActivity;->startActivity(Landroid/content/Intent;)V

    .line 79
    const/4 v1, 0x1

    .line 81
    .end local v0           #intent:Landroid/content/Intent;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
