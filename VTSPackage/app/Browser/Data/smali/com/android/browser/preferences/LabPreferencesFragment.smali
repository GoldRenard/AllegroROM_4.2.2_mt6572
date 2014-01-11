.class public Lcom/android/browser/preferences/LabPreferencesFragment;
.super Landroid/preference/PreferenceFragment;
.source "LabPreferencesFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 32
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 34
    const v0, 0x7f06000a

    invoke-virtual {p0, v0}, Lcom/android/browser/preferences/LabPreferencesFragment;->addPreferencesFromResource(I)V

    .line 35
    return-void
.end method
