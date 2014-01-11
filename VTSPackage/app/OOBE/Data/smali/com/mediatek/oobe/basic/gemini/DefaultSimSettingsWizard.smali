.class public Lcom/mediatek/oobe/basic/gemini/DefaultSimSettingsWizard;
.super Lcom/mediatek/oobe/utils/OOBEStepActivity;
.source "DefaultSimSettingsWizard.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected getStepSpecialTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    const-string v0, "DefaultSimSettingsWizard"

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "icicle"

    .prologue
    .line 52
    const-string v2, "DefaultSimSettingsWizard, +++++++onCreate() begin++++++++"

    invoke-static {v2}, Lcom/mediatek/oobe/utils/OOBEConstants;->logi(Ljava/lang/String;)V

    .line 55
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->onCreate(Landroid/os/Bundle;)V

    .line 57
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/DefaultSimSettingsWizard;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    .line 58
    .local v0, manager:Landroid/app/FragmentManager;
    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 59
    .local v1, transaction:Landroid/app/FragmentTransaction;
    const v2, 0x7f0b001a

    new-instance v3, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;

    invoke-direct {v3}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;-><init>()V

    invoke-virtual {v1, v2, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 60
    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commit()I

    .line 62
    const v2, 0x7f090059

    const v3, 0x7f09005a

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/oobe/basic/gemini/DefaultSimSettingsWizard;->initSpecialLayout(II)V

    .line 63
    const-string v2, "DefaultSimSettingsWizard, +++++++onCreate() finish++++++++"

    invoke-static {v2}, Lcom/mediatek/oobe/utils/OOBEConstants;->logi(Ljava/lang/String;)V

    .line 64
    return-void
.end method
