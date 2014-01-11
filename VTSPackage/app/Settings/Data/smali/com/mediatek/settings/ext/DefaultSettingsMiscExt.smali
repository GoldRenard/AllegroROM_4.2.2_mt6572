.class public Lcom/mediatek/settings/ext/DefaultSettingsMiscExt;
.super Ljava/lang/Object;
.source "DefaultSettingsMiscExt.java"

# interfaces
.implements Lcom/mediatek/settings/ext/ISettingsMiscExt;


# static fields
.field private static final SIM_CARD_1:I = 0x0

.field private static final SIM_CARD_2:I = 0x1

.field private static final SIM_CARD_SINGLE:I = 0x2

.field private static final TAG:Ljava/lang/String; = "DefaultSettingsMiscExt"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public DataUsageUpdateSimText(ILandroid/widget/TextView;)V
    .locals 0
    .parameter "simColor"
    .parameter "title"

    .prologue
    .line 66
    return-void
.end method

.method public DataUsageUpdateTabInfo(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/TabHost$TabSpec;Landroid/widget/TabWidget;Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;
    .locals 0
    .parameter "activity"
    .parameter "tag"
    .parameter "tab"
    .parameter "tabWidget"
    .parameter "title"

    .prologue
    .line 62
    return-object p3
.end method

.method public getApnPref(Landroid/preference/PreferenceGroup;I[I)Landroid/preference/Preference;
    .locals 1
    .parameter "apnList"
    .parameter "count"
    .parameter "array"

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v0

    return-object v0
.end method

.method public getDataUsageBackgroundStrByTag(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "defStr"
    .parameter "tag"

    .prologue
    .line 57
    return-object p1
.end method

.method public getTetherWifiSSID(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .parameter "ctx"

    .prologue
    .line 48
    const v0, 0x104040c

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isAllowEditPresetApn(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter "type"
    .parameter "apn"
    .parameter "numeric"

    .prologue
    .line 32
    const/4 v0, 0x1

    return v0
.end method

.method public isWifiToggleCouldDisabled(Landroid/content/Context;)Z
    .locals 1
    .parameter "context"

    .prologue
    .line 44
    const/4 v0, 0x1

    return v0
.end method

.method public removeTetherApnSettings(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)V
    .locals 0
    .parameter "prefSc"
    .parameter "preference"

    .prologue
    .line 40
    invoke-virtual {p1, p2}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 41
    return-void
.end method

.method public setTimeoutPrefTitle(Landroid/preference/Preference;)V
    .locals 0
    .parameter "pref"

    .prologue
    .line 53
    return-void
.end method
