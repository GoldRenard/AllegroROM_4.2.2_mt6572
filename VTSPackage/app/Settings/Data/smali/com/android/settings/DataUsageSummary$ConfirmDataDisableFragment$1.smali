.class Lcom/android/settings/DataUsageSummary$ConfirmDataDisableFragment$1;
.super Ljava/lang/Object;
.source "DataUsageSummary.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/DataUsageSummary$ConfirmDataDisableFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/DataUsageSummary$ConfirmDataDisableFragment;


# direct methods
.method constructor <init>(Lcom/android/settings/DataUsageSummary$ConfirmDataDisableFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 2628
    iput-object p1, p0, Lcom/android/settings/DataUsageSummary$ConfirmDataDisableFragment$1;->this$0:Lcom/android/settings/DataUsageSummary$ConfirmDataDisableFragment;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .parameter "dialog"
    .parameter "which"

    .prologue
    const/4 v3, 0x0

    .line 2631
    iget-object v2, p0, Lcom/android/settings/DataUsageSummary$ConfirmDataDisableFragment$1;->this$0:Lcom/android/settings/DataUsageSummary$ConfirmDataDisableFragment;

    invoke-virtual {v2}, Lcom/android/settings/DataUsageSummary$ConfirmDataDisableFragment;->getTargetFragment()Landroid/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/android/settings/DataUsageSummary;

    .line 2633
    .local v1, target:Lcom/android/settings/DataUsageSummary;
    iget-object v2, p0, Lcom/android/settings/DataUsageSummary$ConfirmDataDisableFragment$1;->this$0:Lcom/android/settings/DataUsageSummary$ConfirmDataDisableFragment;

    invoke-virtual {v2}, Lcom/android/settings/DataUsageSummary$ConfirmDataDisableFragment;->getTargetRequestCode()I

    move-result v0

    .line 2634
    .local v0, slotId:I
    if-eqz v1, :cond_0

    .line 2636
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    .line 2637
    #calls: Lcom/android/settings/DataUsageSummary;->setMobileDataEnabled(IZ)V
    invoke-static {v1, v0, v3}, Lcom/android/settings/DataUsageSummary;->access$3900(Lcom/android/settings/DataUsageSummary;IZ)V

    .line 2643
    :cond_0
    :goto_0
    return-void

    .line 2639
    :cond_1
    #calls: Lcom/android/settings/DataUsageSummary;->setMobileDataEnabled(Z)V
    invoke-static {v1, v3}, Lcom/android/settings/DataUsageSummary;->access$4000(Lcom/android/settings/DataUsageSummary;Z)V

    goto :goto_0
.end method
