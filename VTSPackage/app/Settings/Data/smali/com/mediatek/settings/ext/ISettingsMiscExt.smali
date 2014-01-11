.class public interface abstract Lcom/mediatek/settings/ext/ISettingsMiscExt;
.super Ljava/lang/Object;
.source "ISettingsMiscExt.java"


# virtual methods
.method public abstract DataUsageUpdateSimText(ILandroid/widget/TextView;)V
.end method

.method public abstract DataUsageUpdateTabInfo(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/TabHost$TabSpec;Landroid/widget/TabWidget;Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;
.end method

.method public abstract getApnPref(Landroid/preference/PreferenceGroup;I[I)Landroid/preference/Preference;
.end method

.method public abstract getDataUsageBackgroundStrByTag(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getTetherWifiSSID(Landroid/content/Context;)Ljava/lang/String;
.end method

.method public abstract isAllowEditPresetApn(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public abstract isWifiToggleCouldDisabled(Landroid/content/Context;)Z
.end method

.method public abstract removeTetherApnSettings(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)V
.end method

.method public abstract setTimeoutPrefTitle(Landroid/preference/Preference;)V
.end method
