.class public Lcom/android/settings/DataUsageSummary$ConfirmDataRoamingFragment;
.super Landroid/app/DialogFragment;
.source "DataUsageSummary.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/DataUsageSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ConfirmDataRoamingFragment"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 2655
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    return-void
.end method

.method public static show(Lcom/android/settings/DataUsageSummary;)V
    .locals 1
    .parameter "parent"

    .prologue
    .line 2658
    const/4 v0, -0x1

    invoke-static {p0, v0}, Lcom/android/settings/DataUsageSummary$ConfirmDataRoamingFragment;->show(Lcom/android/settings/DataUsageSummary;I)V

    .line 2659
    return-void
.end method

.method public static show(Lcom/android/settings/DataUsageSummary;I)V
    .locals 3
    .parameter "parent"
    .parameter "slotId"

    .prologue
    .line 2661
    invoke-virtual {p0}, Lcom/android/settings/DataUsageSummary;->isAdded()Z

    move-result v1

    if-nez v1, :cond_0

    .line 2666
    :goto_0
    return-void

    .line 2663
    :cond_0
    new-instance v0, Lcom/android/settings/DataUsageSummary$ConfirmDataRoamingFragment;

    invoke-direct {v0}, Lcom/android/settings/DataUsageSummary$ConfirmDataRoamingFragment;-><init>()V

    .line 2664
    .local v0, dialog:Lcom/android/settings/DataUsageSummary$ConfirmDataRoamingFragment;
    invoke-virtual {v0, p0, p1}, Lcom/android/settings/DataUsageSummary$ConfirmDataRoamingFragment;->setTargetFragment(Landroid/app/Fragment;I)V

    .line 2665
    invoke-virtual {p0}, Lcom/android/settings/DataUsageSummary;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "confirmDataRoaming"

    invoke-virtual {v0, v1, v2}, Lcom/android/settings/DataUsageSummary$ConfirmDataRoamingFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 6
    .parameter "savedInstanceState"

    .prologue
    .line 2671
    invoke-virtual {p0}, Lcom/android/settings/DataUsageSummary$ConfirmDataRoamingFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    .line 2673
    .local v1, context:Landroid/content/Context;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 2674
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    invoke-static {}, Lcom/android/settings/DataUsageSummary;->access$4100()Lcom/mediatek/settings/ext/ISimRoamingExt;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/settings/DataUsageSummary$ConfirmDataRoamingFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f0b0358

    invoke-interface {v3, v4, v5}, Lcom/mediatek/settings/ext/ISimRoamingExt;->getRoamingWarningMsg(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    .line 2675
    .local v2, msg:Ljava/lang/String;
    const v3, 0x7f0b035a

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 2676
    invoke-static {v1}, Lcom/android/settings/Utils;->hasMultipleUsers(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2677
    const v3, 0x7f0b0359

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 2682
    :goto_0
    const v3, 0x104000a

    new-instance v4, Lcom/android/settings/DataUsageSummary$ConfirmDataRoamingFragment$1;

    invoke-direct {v4, p0}, Lcom/android/settings/DataUsageSummary$ConfirmDataRoamingFragment$1;-><init>(Lcom/android/settings/DataUsageSummary$ConfirmDataRoamingFragment;)V

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 2698
    const/high16 v3, 0x104

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 2700
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    return-object v3

    .line 2679
    :cond_0
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    goto :goto_0
.end method
