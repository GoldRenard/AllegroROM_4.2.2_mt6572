.class public interface abstract Lcom/mediatek/settings/ext/ISimManagementExt;
.super Ljava/lang/Object;
.source "ISimManagementExt.java"


# virtual methods
.method public abstract dealWithDataConnChanged(Landroid/content/Intent;Z)V
.end method

.method public abstract getAutoString()Ljava/lang/String;
.end method

.method public abstract isNeedsetAutoItem()Z
.end method

.method public abstract setPrefProperty(Landroid/preference/DialogPreference;J)V
.end method

.method public abstract setToClosedSimSlot(I)V
.end method

.method public abstract showChangeDataConnDialog(Landroid/preference/PreferenceFragment;Z)V
.end method

.method public abstract updateDefaultSIMSummary(Landroid/preference/DialogPreference;Ljava/lang/Long;)V
.end method

.method public abstract updateSimEditorPref(Landroid/preference/PreferenceFragment;)V
.end method

.method public abstract updateSimManagementPref(Landroid/preference/PreferenceGroup;)V
.end method
