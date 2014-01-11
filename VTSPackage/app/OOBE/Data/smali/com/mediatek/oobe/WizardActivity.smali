.class public Lcom/mediatek/oobe/WizardActivity;
.super Landroid/app/Activity;
.source "WizardActivity.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "OOBE"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public initOOBE()V
    .locals 3

    .prologue
    .line 63
    const-string v1, "OOBE"

    const-string v2, "WizardActivity.initOOBE()"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/oobe/basic/MainActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 66
    .local v0, oobeMainIntent:Landroid/content/Intent;
    const/high16 v1, 0x1000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 67
    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/WizardActivity;->startActivity(Landroid/content/Intent;)V

    .line 68
    invoke-virtual {p0}, Lcom/mediatek/oobe/WizardActivity;->finish()V

    .line 69
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 53
    const-string v0, "OOBE"

    const-string v1, "WizardActivity.onCreate()"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 56
    invoke-virtual {p0}, Lcom/mediatek/oobe/WizardActivity;->initOOBE()V

    .line 57
    return-void
.end method
