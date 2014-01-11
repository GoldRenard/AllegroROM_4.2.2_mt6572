.class Lcom/mediatek/oobe/basic/wifi/WifiDialog;
.super Landroid/app/AlertDialog;
.source "WifiDialog.java"

# interfaces
.implements Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;


# static fields
.field static final BUTTON_FORGET:I = -0x3

.field static final BUTTON_SUBMIT:I = -0x1


# instance fields
.field private final mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

.field private mController:Lcom/mediatek/oobe/basic/wifi/WifiConfigController;

.field private final mEdit:Z

.field private final mListener:Landroid/content/DialogInterface$OnClickListener;

.field private mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Lcom/mediatek/oobe/basic/wifi/AccessPoint;Z)V
    .locals 1
    .parameter "context"
    .parameter "listener"
    .parameter "accessPoint"
    .parameter "edit"

    .prologue
    .line 77
    const v0, 0x7f0a0021

    invoke-direct {p0, p1, v0}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;I)V

    .line 78
    iput-boolean p4, p0, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->mEdit:Z

    .line 79
    iput-object p2, p0, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->mListener:Landroid/content/DialogInterface$OnClickListener;

    .line 80
    iput-object p3, p0, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    .line 81
    return-void
.end method

.method public static addQuote(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "s"

    .prologue
    .line 146
    invoke-static {p0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->addQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static makeNAI(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "imsi"
    .parameter "eapMethod"

    .prologue
    .line 140
    invoke-static {p0, p1}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->makeNAI(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public closeSpinnerDialog()V
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->mController:Lcom/mediatek/oobe/basic/wifi/WifiConfigController;

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->mController:Lcom/mediatek/oobe/basic/wifi/WifiConfigController;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->closeSpinnerDialog()V

    .line 153
    :cond_0
    return-void
.end method

.method public getCancelButton()Landroid/widget/Button;
    .locals 1

    .prologue
    .line 119
    const/4 v0, -0x2

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    return-object v0
.end method

.method public getController()Lcom/mediatek/oobe/basic/wifi/WifiConfigController;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->mController:Lcom/mediatek/oobe/basic/wifi/WifiConfigController;

    return-object v0
.end method

.method public getForgetButton()Landroid/widget/Button;
    .locals 1

    .prologue
    .line 114
    const/4 v0, -0x3

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    return-object v0
.end method

.method public getSubmitButton()Landroid/widget/Button;
    .locals 1

    .prologue
    .line 109
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    return-object v0
.end method

.method public isEdit()Z
    .locals 1

    .prologue
    .line 104
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->mEdit:Z

    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 90
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03001b

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->mView:Landroid/view/View;

    .line 91
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->mView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->setView(Landroid/view/View;)V

    .line 92
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->setInverseBackgroundForced(Z)V

    .line 93
    new-instance v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->mView:Landroid/view/View;

    iget-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget-boolean v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->mEdit:Z

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;Landroid/view/View;Lcom/mediatek/oobe/basic/wifi/AccessPoint;Z)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->mController:Lcom/mediatek/oobe/basic/wifi/WifiConfigController;

    .line 94
    invoke-super {p0, p1}, Landroid/app/AlertDialog;->onCreate(Landroid/os/Bundle;)V

    .line 99
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->mController:Lcom/mediatek/oobe/basic/wifi/WifiConfigController;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->enableSubmitIfAppropriate()V

    .line 100
    return-void
.end method

.method public setCancelButton(Ljava/lang/CharSequence;)V
    .locals 2
    .parameter "text"

    .prologue
    .line 134
    const/4 v0, -0x2

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->mListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p0, v0, p1, v1}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 135
    return-void
.end method

.method public setForgetButton(Ljava/lang/CharSequence;)V
    .locals 2
    .parameter "text"

    .prologue
    .line 129
    const/4 v0, -0x3

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->mListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p0, v0, p1, v1}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 130
    return-void
.end method

.method public setSubmitButton(Ljava/lang/CharSequence;)V
    .locals 2
    .parameter "text"

    .prologue
    .line 124
    const/4 v0, -0x1

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->mListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p0, v0, p1, v1}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 125
    return-void
.end method
