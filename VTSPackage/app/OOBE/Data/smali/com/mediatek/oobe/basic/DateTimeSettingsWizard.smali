.class public Lcom/mediatek/oobe/basic/DateTimeSettingsWizard;
.super Lcom/mediatek/oobe/utils/OOBEStepActivity;
.source "DateTimeSettingsWizard.java"


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
    .line 72
    const-string v0, "DateTimeSettingsWizard"

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .parameter "icicle"

    .prologue
    .line 52
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->onCreate(Landroid/os/Bundle;)V

    .line 55
    new-instance v0, Lcom/mediatek/oobe/basic/DateTimeSettings;

    invoke-direct {v0}, Lcom/mediatek/oobe/basic/DateTimeSettings;-><init>()V

    .line 56
    .local v0, dateTimeSettings:Lcom/mediatek/oobe/basic/DateTimeSettings;
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettingsWizard;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "oobe_step_total"

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 57
    .local v3, totalStep:I
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettingsWizard;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "oobe_step_index"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 59
    .local v2, stepIndex:I
    invoke-virtual {v0, v3, v2}, Lcom/mediatek/oobe/basic/DateTimeSettings;->initProgressBar(II)V

    .line 61
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/DateTimeSettingsWizard;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    .line 62
    .local v1, manager:Landroid/app/FragmentManager;
    invoke-virtual {v1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v4

    .line 63
    .local v4, transaction:Landroid/app/FragmentTransaction;
    const v5, 0x7f0b001a

    invoke-virtual {v4, v5, v0}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 64
    invoke-virtual {v4}, Landroid/app/FragmentTransaction;->commit()I

    .line 66
    const v5, 0x7f09005e

    const v6, 0x7f09005f

    invoke-virtual {p0, v5, v6}, Lcom/mediatek/oobe/basic/DateTimeSettingsWizard;->initSpecialLayout(II)V

    .line 68
    return-void
.end method
