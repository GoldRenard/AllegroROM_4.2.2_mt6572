.class public Lcom/android/browser/DataConnectionDialog;
.super Lcom/android/internal/app/AlertActivity;
.source "DataConnectionDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# static fields
.field public static final PREF_NOT_REMIND:Ljava/lang/String; = "pref_not_remind"


# instance fields
.field private mCb:Landroid/widget/CheckBox;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/android/internal/app/AlertActivity;-><init>()V

    return-void
.end method

.method private createView()Landroid/view/View;
    .locals 5

    .prologue
    .line 39
    invoke-virtual {p0}, Lcom/android/browser/DataConnectionDialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f040015

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 40
    .local v1, view:Landroid/view/View;
    const v2, 0x7f0d000a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 41
    .local v0, contentView:Landroid/widget/TextView;
    const v2, 0x7f0c0029

    invoke-virtual {p0, v2}, Lcom/android/browser/DataConnectionDialog;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    const v2, 0x7f0d0043

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    iput-object v2, p0, Lcom/android/browser/DataConnectionDialog;->mCb:Landroid/widget/CheckBox;

    .line 43
    return-object v1
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .parameter "dialog"
    .parameter "which"

    .prologue
    const/4 v4, 0x1

    .line 47
    const-string v3, "connectivity"

    invoke-virtual {p0, v3}, Lcom/android/browser/DataConnectionDialog;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 49
    .local v0, cm:Landroid/net/ConnectivityManager;
    packed-switch p2, :pswitch_data_0

    .line 82
    :goto_0
    return-void

    .line 52
    :pswitch_0
    if-eqz v0, :cond_0

    .line 53
    invoke-virtual {v0, v4}, Landroid/net/ConnectivityManager;->setMobileDataEnabled(Z)V

    .line 56
    :cond_0
    iget-object v3, p0, Lcom/android/browser/DataConnectionDialog;->mCb:Landroid/widget/CheckBox;

    invoke-virtual {v3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 57
    const-string v3, "data_connection"

    invoke-virtual {p0, v3, v4}, Lcom/android/browser/DataConnectionDialog;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 58
    .local v2, sh:Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 59
    .local v1, editor:Landroid/content/SharedPreferences$Editor;
    const-string v3, "pref_not_remind"

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 60
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 63
    .end local v1           #editor:Landroid/content/SharedPreferences$Editor;
    .end local v2           #sh:Landroid/content/SharedPreferences;
    :cond_1
    invoke-virtual {p0}, Lcom/android/browser/DataConnectionDialog;->finish()V

    goto :goto_0

    .line 67
    :pswitch_1
    if-eqz v0, :cond_2

    .line 68
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/net/ConnectivityManager;->setMobileDataEnabled(Z)V

    .line 70
    :cond_2
    iget-object v3, p0, Lcom/android/browser/DataConnectionDialog;->mCb:Landroid/widget/CheckBox;

    invoke-virtual {v3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 71
    const-string v3, "data_connection"

    invoke-virtual {p0, v3, v4}, Lcom/android/browser/DataConnectionDialog;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 72
    .restart local v2       #sh:Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 73
    .restart local v1       #editor:Landroid/content/SharedPreferences$Editor;
    const-string v3, "pref_not_remind"

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 74
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 77
    .end local v1           #editor:Landroid/content/SharedPreferences$Editor;
    .end local v2           #sh:Landroid/content/SharedPreferences;
    :cond_3
    invoke-virtual {p0}, Lcom/android/browser/DataConnectionDialog;->finish()V

    goto :goto_0

    .line 49
    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 24
    invoke-super {p0, p1}, Lcom/android/internal/app/AlertActivity;->onCreate(Landroid/os/Bundle;)V

    .line 27
    iget-object v0, p0, Lcom/android/browser/DataConnectionDialog;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    .line 28
    .local v0, p:Lcom/android/internal/app/AlertController$AlertParams;
    const v1, 0x1080027

    iput v1, v0, Lcom/android/internal/app/AlertController$AlertParams;->mIconId:I

    .line 29
    const v1, 0x7f0c0028

    invoke-virtual {p0, v1}, Lcom/android/browser/DataConnectionDialog;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/internal/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    .line 30
    invoke-direct {p0}, Lcom/android/browser/DataConnectionDialog;->createView()Landroid/view/View;

    move-result-object v1

    iput-object v1, v0, Lcom/android/internal/app/AlertController$AlertParams;->mView:Landroid/view/View;

    .line 31
    const v1, 0x104000a

    invoke-virtual {p0, v1}, Lcom/android/browser/DataConnectionDialog;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/internal/app/AlertController$AlertParams;->mPositiveButtonText:Ljava/lang/CharSequence;

    .line 32
    iput-object p0, v0, Lcom/android/internal/app/AlertController$AlertParams;->mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 33
    const/high16 v1, 0x104

    invoke-virtual {p0, v1}, Lcom/android/browser/DataConnectionDialog;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/internal/app/AlertController$AlertParams;->mNegativeButtonText:Ljava/lang/CharSequence;

    .line 34
    iput-object p0, v0, Lcom/android/internal/app/AlertController$AlertParams;->mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 35
    invoke-virtual {p0}, Lcom/android/browser/DataConnectionDialog;->setupAlert()V

    .line 36
    return-void
.end method
