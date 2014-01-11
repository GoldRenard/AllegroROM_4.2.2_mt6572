.class public Lcom/mediatek/oobe/basic/wifi/WifiSettingsWizard;
.super Lcom/mediatek/oobe/utils/OOBEStepActivity;
.source "WifiSettingsWizard.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected getStepSpecialTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    const-string v0, "WifiSettingsWizard"

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "icicle"

    .prologue
    .line 51
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->onCreate(Landroid/os/Bundle;)V

    .line 53
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettingsWizard;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    .line 54
    .local v0, manager:Landroid/app/FragmentManager;
    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 55
    .local v1, transaction:Landroid/app/FragmentTransaction;
    const v2, 0x7f0b001a

    new-instance v3, Lcom/mediatek/oobe/basic/wifi/WifiSettings;

    invoke-direct {v3}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;-><init>()V

    invoke-virtual {v1, v2, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 56
    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commit()I

    .line 58
    const v2, 0x7f09005b

    const v3, 0x7f09005d

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/oobe/basic/wifi/WifiSettingsWizard;->initSpecialLayout(II)V

    .line 59
    return-void
.end method
