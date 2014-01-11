.class public Lcom/cyanogenmod/trebuchet/preference/Preferences$GeneralFragment;
.super Landroid/preference/PreferenceFragment;
.source "Preferences.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/preference/Preferences;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GeneralFragment"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 163
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 166
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 168
    const v0, 0x7f060004

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/preference/Preferences$GeneralFragment;->addPreferencesFromResource(I)V

    .line 169
    return-void
.end method
