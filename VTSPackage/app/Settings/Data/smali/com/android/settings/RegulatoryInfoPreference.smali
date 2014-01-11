.class public Lcom/android/settings/RegulatoryInfoPreference;
.super Landroid/preference/DialogPreference;
.source "RegulatoryInfoPreference.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 31
    const v0, 0x101008e

    invoke-direct {p0, p1, p2, v0}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    const v0, 0x7f04007f

    invoke-virtual {p0, v0}, Lcom/android/settings/RegulatoryInfoPreference;->setDialogLayoutResource(I)V

    .line 33
    return-void
.end method
