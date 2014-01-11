.class Lcom/mediatek/oobe/basic/LanguageSettingsWizard$2;
.super Ljava/lang/Object;
.source "LanguageSettingsWizard.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


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
    .line 232
    iput-object p1, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$2;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 237
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$2;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$2;->this$0:Lcom/mediatek/oobe/basic/LanguageSettingsWizard;

    #getter for: Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mLocales:[Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;
    invoke-static {v1}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->access$400(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;)[Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;

    move-result-object v1

    aget-object v1, v1, p3

    iget-object v1, v1, Lcom/mediatek/oobe/basic/LanguageSettingsWizard$Loc;->mLocale:Ljava/util/Locale;

    #setter for: Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->mSelectedLoc:Ljava/util/Locale;
    invoke-static {v0, v1}, Lcom/mediatek/oobe/basic/LanguageSettingsWizard;->access$302(Lcom/mediatek/oobe/basic/LanguageSettingsWizard;Ljava/util/Locale;)Ljava/util/Locale;

    .line 238
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 244
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    return-void
.end method
