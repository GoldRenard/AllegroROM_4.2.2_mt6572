.class public Lcom/android/settings/NsdEnabler;
.super Ljava/lang/Object;
.source "NsdEnabler.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private final mCheckbox:Landroid/preference/CheckBoxPreference;

.field private final mContext:Landroid/content/Context;

.field private final mIntentFilter:Landroid/content/IntentFilter;

.field private mNsdManager:Landroid/net/nsd/NsdManager;

.field private final mReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/preference/CheckBoxPreference;)V
    .locals 2
    .parameter "context"
    .parameter "checkBoxPreference"

    .prologue
    .line 50
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Lcom/android/settings/NsdEnabler$1;

    invoke-direct {v0, p0}, Lcom/android/settings/NsdEnabler$1;-><init>(Lcom/android/settings/NsdEnabler;)V

    iput-object v0, p0, Lcom/android/settings/NsdEnabler;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 51
    iput-object p1, p0, Lcom/android/settings/NsdEnabler;->mContext:Landroid/content/Context;

    .line 52
    iput-object p2, p0, Lcom/android/settings/NsdEnabler;->mCheckbox:Landroid/preference/CheckBoxPreference;

    .line 53
    iget-object v0, p0, Lcom/android/settings/NsdEnabler;->mContext:Landroid/content/Context;

    const-string v1, "servicediscovery"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/nsd/NsdManager;

    iput-object v0, p0, Lcom/android/settings/NsdEnabler;->mNsdManager:Landroid/net/nsd/NsdManager;

    .line 54
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.net.nsd.STATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/settings/NsdEnabler;->mIntentFilter:Landroid/content/IntentFilter;

    .line 55
    return-void
.end method

.method static synthetic access$000(Lcom/android/settings/NsdEnabler;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/android/settings/NsdEnabler;->handleNsdStateChanged(I)V

    return-void
.end method

.method private handleNsdStateChanged(I)V
    .locals 3
    .parameter "newState"

    .prologue
    const/4 v2, 0x1

    .line 76
    packed-switch p1, :pswitch_data_0

    .line 86
    :goto_0
    return-void

    .line 78
    :pswitch_0
    iget-object v0, p0, Lcom/android/settings/NsdEnabler;->mCheckbox:Landroid/preference/CheckBoxPreference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 79
    iget-object v0, p0, Lcom/android/settings/NsdEnabler;->mCheckbox:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, v2}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    goto :goto_0

    .line 82
    :pswitch_1
    iget-object v0, p0, Lcom/android/settings/NsdEnabler;->mCheckbox:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 83
    iget-object v0, p0, Lcom/android/settings/NsdEnabler;->mCheckbox:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, v2}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    goto :goto_0

    .line 76
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 3
    .parameter "preference"
    .parameter "value"

    .prologue
    const/4 v2, 0x0

    .line 69
    check-cast p2, Ljava/lang/Boolean;

    .end local p2
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 70
    .local v0, desiredState:Z
    iget-object v1, p0, Lcom/android/settings/NsdEnabler;->mCheckbox:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 71
    iget-object v1, p0, Lcom/android/settings/NsdEnabler;->mNsdManager:Landroid/net/nsd/NsdManager;

    invoke-virtual {v1, v0}, Landroid/net/nsd/NsdManager;->setEnabled(Z)V

    .line 72
    return v2
.end method

.method public pause()V
    .locals 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/android/settings/NsdEnabler;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/settings/NsdEnabler;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 64
    iget-object v0, p0, Lcom/android/settings/NsdEnabler;->mCheckbox:Landroid/preference/CheckBoxPreference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 65
    return-void
.end method

.method public resume()V
    .locals 3

    .prologue
    .line 58
    iget-object v0, p0, Lcom/android/settings/NsdEnabler;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/settings/NsdEnabler;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/android/settings/NsdEnabler;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 59
    iget-object v0, p0, Lcom/android/settings/NsdEnabler;->mCheckbox:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 60
    return-void
.end method
