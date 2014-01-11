.class public Lcom/mediatek/oobe/basic/gemini/SimManagementSettingsWizard;
.super Lcom/mediatek/oobe/utils/OOBEStepActivity;
.source "SimManagementSettingsWizard.java"


# instance fields
.field private mSubSimManagementSettings:Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;


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
    .line 73
    const-string v0, "SimManagementSettingsWizard"

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "icicle"

    .prologue
    .line 54
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagementSettingsWizard;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v5, "oobe_step_total"

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 55
    .local v2, totalStep:I
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagementSettingsWizard;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v5, "oobe_step_index"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 56
    .local v1, stepIndex:I
    new-instance v4, Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;

    invoke-direct {v4}, Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;-><init>()V

    iput-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagementSettingsWizard;->mSubSimManagementSettings:Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;

    .line 57
    invoke-static {v2, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->initProgressBar(II)V

    .line 61
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->onCreate(Landroid/os/Bundle;)V

    .line 62
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagementSettingsWizard;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    .line 63
    .local v0, manager:Landroid/app/FragmentManager;
    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v3

    .line 64
    .local v3, transaction:Landroid/app/FragmentTransaction;
    const v4, 0x7f0b001a

    iget-object v5, p0, Lcom/mediatek/oobe/basic/gemini/SimManagementSettingsWizard;->mSubSimManagementSettings:Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;

    invoke-virtual {v3, v4, v5}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 65
    invoke-virtual {v3}, Landroid/app/FragmentTransaction;->commit()I

    .line 67
    const v4, 0x7f090055

    const v5, 0x7f090056

    invoke-virtual {p0, v4, v5}, Lcom/mediatek/oobe/basic/gemini/SimManagementSettingsWizard;->initSpecialLayout(II)V

    .line 68
    const-string v4, "SimManagementSettingsWizard onCreate()"

    invoke-static {v4}, Lcom/mediatek/oobe/utils/OOBEConstants;->logd(Ljava/lang/String;)V

    .line 69
    return-void
.end method
