.class public Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;
.super Landroid/preference/PreferenceFragment;
.source "SettingsPreferenceFragment.java"

# interfaces
.implements Lcom/mediatek/oobe/utils/DialogCreatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SettingsPreferenceFragment"


# instance fields
.field private mDialogFragment:Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 74
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    .line 184
    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;)Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;
    .locals 1
    .parameter "x0"

    .prologue
    .line 74
    iget-object v0, p0, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->mDialogFragment:Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;

    return-object v0
.end method

.method static synthetic access$102(Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;)Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 74
    iput-object p1, p0, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->mDialogFragment:Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;

    return-object p1
.end method


# virtual methods
.method public finish()V
    .locals 1

    .prologue
    .line 296
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->onBackPressed()V

    .line 297
    return-void
.end method

.method public final finishFragment()V
    .locals 1

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->onBackPressed()V

    .line 90
    return-void
.end method

.method protected getContentResolver()Landroid/content/ContentResolver;
    .locals 1

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    return-object v0
.end method

.method protected getNextButton()Landroid/widget/Button;
    .locals 1

    .prologue
    .line 289
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/mediatek/oobe/utils/ButtonBarHandler;

    invoke-interface {v0}, Lcom/mediatek/oobe/utils/ButtonBarHandler;->getNextButton()Landroid/widget/Button;

    move-result-object v0

    return-object v0
.end method

.method protected getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .parameter "name"

    .prologue
    .line 105
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected hasNextButton()Z
    .locals 1

    .prologue
    .line 285
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/mediatek/oobe/utils/ButtonBarHandler;

    invoke-interface {v0}, Lcom/mediatek/oobe/utils/ButtonBarHandler;->hasNextButton()Z

    move-result v0

    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0
    .parameter "savedInstanceState"

    .prologue
    .line 82
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 83
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 1
    .parameter "dialogId"

    .prologue
    .line 139
    const/4 v0, 0x0

    return-object v0
.end method

.method public onDetach()V
    .locals 1

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->isRemoving()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    iget-object v0, p0, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->mDialogFragment:Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;

    if-eqz v0, :cond_0

    .line 119
    iget-object v0, p0, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->mDialogFragment:Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;

    invoke-virtual {v0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;->dismiss()V

    .line 120
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->mDialogFragment:Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;

    .line 123
    :cond_0
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onDetach()V

    .line 124
    return-void
.end method

.method protected removeDialog(I)V
    .locals 1
    .parameter "dialogId"

    .prologue
    .line 146
    iget-object v0, p0, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->mDialogFragment:Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->mDialogFragment:Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;

    invoke-virtual {v0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;->getDialogId()I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 147
    iget-object v0, p0, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->mDialogFragment:Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;

    invoke-virtual {v0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;->dismiss()V

    .line 148
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->mDialogFragment:Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;

    .line 150
    :cond_0
    return-void
.end method

.method protected setCancelable(Z)V
    .locals 1
    .parameter "cancelable"

    .prologue
    .line 159
    iget-object v0, p0, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->mDialogFragment:Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;

    if-eqz v0, :cond_0

    .line 160
    iget-object v0, p0, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->mDialogFragment:Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;

    invoke-virtual {v0, p1}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;->setCancelable(Z)V

    .line 162
    :cond_0
    return-void
.end method

.method protected setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 169
    iget-object v0, p0, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->mDialogFragment:Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;

    if-eqz v0, :cond_0

    .line 170
    iget-object v0, p0, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->mDialogFragment:Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;

    #setter for: Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;->mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;
    invoke-static {v0, p1}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;->access$002(Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;Landroid/content/DialogInterface$OnCancelListener;)Landroid/content/DialogInterface$OnCancelListener;

    .line 172
    :cond_0
    return-void
.end method

.method protected showDialog(I)V
    .locals 3
    .parameter "dialogId"

    .prologue
    .line 129
    iget-object v0, p0, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->mDialogFragment:Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;

    if-eqz v0, :cond_0

    .line 130
    const-string v0, "SettingsPreferenceFragment"

    const-string v1, "Old dialog fragment not null!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    :goto_0
    return-void

    .line 132
    :cond_0
    new-instance v0, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;

    invoke-direct {v0, p0, p1}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;-><init>(Lcom/mediatek/oobe/utils/DialogCreatable;I)V

    iput-object v0, p0, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->mDialogFragment:Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;

    .line 133
    iget-object v0, p0, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->mDialogFragment:Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;

    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment$SettingsDialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_0
.end method
