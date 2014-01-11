.class Lcom/mediatek/oobe/basic/LanguageSettingsWizard$3;
.super Ljava/lang/Object;
.source "LanguageSettingsWizard.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/LanguageSettingsWizard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;)V
    .locals 0
    .parameter

    .prologue
    .line 248
    iput-object p1, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$3;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 253
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.phone.EmergencyDialer.DIAL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 254
    .local v0, intent:Landroid/content/Intent;
    const/high16 v1, 0x1080

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 255
    iget-object v1, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$3;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    invoke-virtual {v1, v0}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->startActivity(Landroid/content/Intent;)V

    .line 256
    return-void
.end method
