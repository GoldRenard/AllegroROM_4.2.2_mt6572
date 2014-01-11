.class Lcom/mediatek/lbs/AgpsEpoSettings$5;
.super Ljava/lang/Object;
.source "AgpsEpoSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/lbs/AgpsEpoSettings;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/lbs/AgpsEpoSettings;


# direct methods
.method constructor <init>(Lcom/mediatek/lbs/AgpsEpoSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 328
    iput-object p1, p0, Lcom/mediatek/lbs/AgpsEpoSettings$5;->this$0:Lcom/mediatek/lbs/AgpsEpoSettings;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialoginterface"
    .parameter "i"

    .prologue
    .line 331
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsEpoSettings$5;->this$0:Lcom/mediatek/lbs/AgpsEpoSettings;

    #getter for: Lcom/mediatek/lbs/AgpsEpoSettings;->mAgpsCB:Landroid/preference/CheckBoxPreference;
    invoke-static {v0}, Lcom/mediatek/lbs/AgpsEpoSettings;->access$400(Lcom/mediatek/lbs/AgpsEpoSettings;)Landroid/preference/CheckBoxPreference;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 332
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsEpoSettings$5;->this$0:Lcom/mediatek/lbs/AgpsEpoSettings;

    #getter for: Lcom/mediatek/lbs/AgpsEpoSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;
    invoke-static {v0}, Lcom/mediatek/lbs/AgpsEpoSettings;->access$300(Lcom/mediatek/lbs/AgpsEpoSettings;)Lcom/mediatek/common/agps/MtkAgpsManager;

    move-result-object v0

    invoke-interface {v0}, Lcom/mediatek/common/agps/MtkAgpsManager;->enable()V

    .line 333
    return-void
.end method
