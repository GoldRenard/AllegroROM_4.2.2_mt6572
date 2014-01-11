.class public Lcom/android/settings/TetherApnSettings;
.super Lcom/android/settings/ApnSettings;
.source "TetherApnSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# static fields
.field private static final PREFER_APN_TETHER_URI:Landroid/net/Uri; = null

.field static final TAG:Ljava/lang/String; = "TetherApnSettings"


# instance fields
.field private mConnManager:Landroid/net/ConnectivityManager;

.field private mIsSIMReady:Z

.field private mIsSwitching:Z

.field private mIsTetehred:Z

.field private final mTetheringStateReceiver:Landroid/content/BroadcastReceiver;

.field private mUsbRegexs:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 77
    const-string v0, "content://telephony/carriers/prefertetheringapn"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/settings/TetherApnSettings;->PREFER_APN_TETHER_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 73
    invoke-direct {p0}, Lcom/android/settings/ApnSettings;-><init>()V

    .line 79
    iput-boolean v1, p0, Lcom/android/settings/TetherApnSettings;->mIsSwitching:Z

    .line 80
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/settings/TetherApnSettings;->mIsSIMReady:Z

    .line 81
    iput-boolean v1, p0, Lcom/android/settings/TetherApnSettings;->mIsTetehred:Z

    .line 85
    new-instance v0, Lcom/android/settings/TetherApnSettings$1;

    invoke-direct {v0, p0}, Lcom/android/settings/TetherApnSettings$1;-><init>(Lcom/android/settings/TetherApnSettings;)V

    iput-object v0, p0, Lcom/android/settings/TetherApnSettings;->mTetheringStateReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$002(Lcom/android/settings/TetherApnSettings;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 73
    iput-boolean p1, p0, Lcom/android/settings/TetherApnSettings;->mIsSwitching:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/settings/TetherApnSettings;[Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 73
    invoke-direct {p0, p1}, Lcom/android/settings/TetherApnSettings;->updateTetheredState([Ljava/lang/Object;)V

    return-void
.end method

.method private updateTetheredState([Ljava/lang/Object;)V
    .locals 11
    .parameter "tethered"

    .prologue
    .line 202
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/android/settings/TetherApnSettings;->mIsTetehred:Z

    .line 203
    move-object v0, p1

    .local v0, arr$:[Ljava/lang/Object;
    array-length v4, v0

    .local v4, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    move v3, v2

    .end local v0           #arr$:[Ljava/lang/Object;
    .end local v2           #i$:I
    .end local v4           #len$:I
    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_2

    aget-object v6, v0, v3

    .local v6, o:Ljava/lang/Object;
    move-object v8, v6

    .line 204
    check-cast v8, Ljava/lang/String;

    .line 205
    .local v8, s:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/settings/TetherApnSettings;->mUsbRegexs:[Ljava/lang/String;

    .local v1, arr$:[Ljava/lang/String;
    array-length v5, v1

    .local v5, len$:I
    const/4 v2, 0x0

    .end local v3           #i$:I
    .restart local v2       #i$:I
    :goto_1
    if-ge v2, v5, :cond_1

    aget-object v7, v1, v2

    .line 206
    .local v7, regex:Ljava/lang/String;
    invoke-virtual {v8, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 207
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/android/settings/TetherApnSettings;->mIsTetehred:Z

    .line 205
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 203
    .end local v7           #regex:Ljava/lang/String;
    :cond_1
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    .end local v2           #i$:I
    .restart local v3       #i$:I
    goto :goto_0

    .line 212
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v5           #len$:I
    .end local v6           #o:Ljava/lang/Object;
    .end local v8           #s:Ljava/lang/String;
    :cond_2
    invoke-virtual {p0}, Lcom/android/settings/TetherApnSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v9

    invoke-virtual {p0}, Lcom/android/settings/TetherApnSettings;->getScreenEnableState()Z

    move-result v10

    invoke-virtual {v9, v10}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    .line 213
    return-void
.end method


# virtual methods
.method protected addMenu(Landroid/view/Menu;)V
    .locals 4
    .parameter "menu"

    .prologue
    const/4 v3, 0x0

    .line 172
    const-string v0, "20801"

    iget-object v1, p0, Lcom/android/settings/ApnSettings;->mNumeric:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "23430"

    iget-object v1, p0, Lcom/android/settings/ApnSettings;->mNumeric:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "23431"

    iget-object v1, p0, Lcom/android/settings/ApnSettings;->mNumeric:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "23432"

    iget-object v1, p0, Lcom/android/settings/ApnSettings;->mNumeric:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 179
    :cond_0
    :goto_0
    return-void

    .line 177
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/android/settings/TetherApnSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0b05a8

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v3, v0, v3, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080033

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    goto :goto_0
.end method

.method protected addNewApn()V
    .locals 3

    .prologue
    .line 194
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.INSERT"

    iget-object v2, p0, Lcom/android/settings/ApnSettings;->mUri:Landroid/net/Uri;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 195
    .local v0, it:Landroid/content/Intent;
    const-string v1, "simId"

    iget v2, p0, Lcom/android/settings/ApnSettings;->mSimId:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 196
    const-string v1, "apn_type"

    const-string v2, "tethering"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 197
    invoke-virtual {p0, v0}, Lcom/android/settings/TetherApnSettings;->startActivity(Landroid/content/Intent;)V

    .line 198
    return-void
.end method

.method protected getBroadcastReceiver()Landroid/content/BroadcastReceiver;
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lcom/android/settings/TetherApnSettings;->mTetheringStateReceiver:Landroid/content/BroadcastReceiver;

    return-object v0
.end method

.method protected getFillListQuery()Ljava/lang/String;
    .locals 2

    .prologue
    .line 157
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "numeric=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/settings/ApnSettings;->mNumeric:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\" AND type=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "tethering"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getIntentFilter()Landroid/content/IntentFilter;
    .locals 2

    .prologue
    .line 144
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 145
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.net.conn.TETHER_CHANGED_DONE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 146
    const-string v1, "android.net.conn.TETHER_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 147
    return-object v0
.end method

.method protected getScreenEnableState()Z
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 162
    iget-object v0, p0, Lcom/android/settings/ApnSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/android/settings/ApnSettings;->mIsCallStateIdle:Z

    .line 163
    const-string v0, "TetherApnSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mIsCallStateIdle : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/settings/ApnSettings;->mIsCallStateIdle:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " mAirplaneModeEnabled : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/settings/ApnSettings;->mAirplaneModeEnabled:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " mIsSIMReady :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/settings/TetherApnSettings;->mIsSIMReady:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " mIsSwitching: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/settings/TetherApnSettings;->mIsSwitching:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " mIsTetehred: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/settings/TetherApnSettings;->mIsTetehred:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    iget-boolean v0, p0, Lcom/android/settings/TetherApnSettings;->mIsTetehred:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/settings/ApnSettings;->mIsCallStateIdle:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/settings/ApnSettings;->mAirplaneModeEnabled:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/settings/TetherApnSettings;->mIsSIMReady:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/settings/TetherApnSettings;->mIsSwitching:Z

    if-nez v0, :cond_1

    :goto_1
    return v1

    :cond_0
    move v0, v2

    .line 162
    goto :goto_0

    :cond_1
    move v1, v2

    .line 166
    goto :goto_1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "icicle"

    .prologue
    const/4 v2, 0x1

    .line 115
    invoke-super {p0, p1}, Lcom/android/settings/ApnSettings;->onCreate(Landroid/os/Bundle;)V

    .line 116
    const-string v1, "connectivity"

    invoke-virtual {p0, v1}, Lcom/android/settings/TetherApnSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    iput-object v1, p0, Lcom/android/settings/TetherApnSettings;->mConnManager:Landroid/net/ConnectivityManager;

    .line 118
    iget-object v1, p0, Lcom/android/settings/TetherApnSettings;->mConnManager:Landroid/net/ConnectivityManager;

    if-eqz v1, :cond_0

    .line 119
    iget-object v1, p0, Lcom/android/settings/TetherApnSettings;->mConnManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getTetherableUsbRegexs()[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/TetherApnSettings;->mUsbRegexs:[Ljava/lang/String;

    .line 121
    :cond_0
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v0

    .line 123
    .local v0, telManager:Landroid/telephony/TelephonyManager;
    if-eqz v0, :cond_1

    .line 124
    const/4 v1, 0x5

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v3

    if-ne v1, v3, :cond_2

    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lcom/android/settings/TetherApnSettings;->mIsSIMReady:Z

    .line 127
    :cond_1
    iput-boolean v2, p0, Lcom/android/settings/ApnSettings;->mIsTetherApn:Z

    .line 128
    sget-object v1, Lcom/android/settings/TetherApnSettings;->PREFER_APN_TETHER_URI:Landroid/net/Uri;

    iput-object v1, p0, Lcom/android/settings/ApnSettings;->mRestoreCarrierUri:Landroid/net/Uri;

    .line 129
    return-void

    .line 124
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected onResume()V
    .locals 4

    .prologue
    .line 133
    invoke-super {p0}, Lcom/android/settings/ApnSettings;->onResume()V

    .line 134
    const-string v1, "TetherApnSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onResume , mIsSwitching = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/settings/TetherApnSettings;->mIsSwitching:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    iget-object v1, p0, Lcom/android/settings/TetherApnSettings;->mConnManager:Landroid/net/ConnectivityManager;

    if-eqz v1, :cond_0

    .line 136
    iget-object v1, p0, Lcom/android/settings/TetherApnSettings;->mConnManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->isTetheringChangeDone()Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    :goto_0
    iput-boolean v1, p0, Lcom/android/settings/TetherApnSettings;->mIsSwitching:Z

    .line 137
    iget-object v1, p0, Lcom/android/settings/TetherApnSettings;->mConnManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getTetheredIfaces()[Ljava/lang/String;

    move-result-object v0

    .line 138
    .local v0, tethered:[Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/android/settings/TetherApnSettings;->updateTetheredState([Ljava/lang/Object;)V

    .line 140
    .end local v0           #tethered:[Ljava/lang/String;
    :cond_0
    return-void

    .line 136
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected setSelectedApnKey(Ljava/lang/String;)V
    .locals 4
    .parameter "key"

    .prologue
    const/4 v3, 0x0

    .line 183
    iput-object p1, p0, Lcom/android/settings/ApnSettings;->mSelectedKey:Ljava/lang/String;

    .line 184
    invoke-virtual {p0}, Lcom/android/settings/TetherApnSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 185
    .local v0, resolver:Landroid/content/ContentResolver;
    sget-object v2, Lcom/android/settings/TetherApnSettings;->PREFER_APN_TETHER_URI:Landroid/net/Uri;

    invoke-virtual {v0, v2, v3, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 186
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 187
    .local v1, values:Landroid/content/ContentValues;
    const-string v2, "apn_id"

    iget-object v3, p0, Lcom/android/settings/ApnSettings;->mSelectedKey:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    sget-object v2, Lcom/android/settings/TetherApnSettings;->PREFER_APN_TETHER_URI:Landroid/net/Uri;

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 190
    return-void
.end method
