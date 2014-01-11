.class public Lcom/mediatek/oobe/basic/TimeZonePickerWizard;
.super Lcom/mediatek/oobe/utils/OOBEStepActivity;
.source "TimeZonePickerWizard.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/mediatek/oobe/utils/OOBEStepActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected getStepSpecialTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 81
    const-string v0, "TimeZonePickerWizard"

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "icicle"

    .prologue
    .line 53
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/OOBEStepActivity;->onCreate(Landroid/os/Bundle;)V

    .line 54
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/TimeZonePickerWizard;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    .line 55
    .local v0, manager:Landroid/app/FragmentManager;
    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 56
    .local v1, transaction:Landroid/app/FragmentTransaction;
    const v2, 0x7f0b001a

    new-instance v3, Lcom/mediatek/oobe/utils/ZonePicker;

    invoke-direct {v3}, Lcom/mediatek/oobe/utils/ZonePicker;-><init>()V

    invoke-virtual {v1, v2, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 57
    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commit()I

    .line 59
    const v2, 0x7f090086

    const v3, 0x7f090087

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/oobe/basic/TimeZonePickerWizard;->initSpecialLayout(II)V

    .line 60
    return-void
.end method

.method public onNextStep(Z)V
    .locals 2
    .parameter "isNext"

    .prologue
    .line 64
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/TimeZonePickerWizard;->finish()V

    .line 65
    if-eqz p1, :cond_0

    .line 66
    const v0, 0x7f040002

    const v1, 0x7f040001

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/oobe/basic/TimeZonePickerWizard;->overridePendingTransition(II)V

    .line 70
    :goto_0
    return-void

    .line 68
    :cond_0
    const/high16 v0, 0x7f04

    const v1, 0x7f040003

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/oobe/basic/TimeZonePickerWizard;->overridePendingTransition(II)V

    goto :goto_0
.end method
