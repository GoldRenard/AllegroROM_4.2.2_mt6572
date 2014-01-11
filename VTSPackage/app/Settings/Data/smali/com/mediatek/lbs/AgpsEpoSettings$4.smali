.class Lcom/mediatek/lbs/AgpsEpoSettings$4;
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
    .line 336
    iput-object p1, p0, Lcom/mediatek/lbs/AgpsEpoSettings$4;->this$0:Lcom/mediatek/lbs/AgpsEpoSettings;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialoginterface"
    .parameter "i"

    .prologue
    .line 341
    const-string v0, "AgpsEpoSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "-->mAgpsMgr.getStatus()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/lbs/AgpsEpoSettings$4;->this$0:Lcom/mediatek/lbs/AgpsEpoSettings;

    #getter for: Lcom/mediatek/lbs/AgpsEpoSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;
    invoke-static {v2}, Lcom/mediatek/lbs/AgpsEpoSettings;->access$300(Lcom/mediatek/lbs/AgpsEpoSettings;)Lcom/mediatek/common/agps/MtkAgpsManager;

    move-result-object v2

    invoke-interface {v2}, Lcom/mediatek/common/agps/MtkAgpsManager;->getStatus()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 343
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsEpoSettings$4;->this$0:Lcom/mediatek/lbs/AgpsEpoSettings;

    #getter for: Lcom/mediatek/lbs/AgpsEpoSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;
    invoke-static {v0}, Lcom/mediatek/lbs/AgpsEpoSettings;->access$300(Lcom/mediatek/lbs/AgpsEpoSettings;)Lcom/mediatek/common/agps/MtkAgpsManager;

    move-result-object v0

    invoke-interface {v0}, Lcom/mediatek/common/agps/MtkAgpsManager;->getStatus()Z

    move-result v0

    if-nez v0, :cond_0

    .line 344
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsEpoSettings$4;->this$0:Lcom/mediatek/lbs/AgpsEpoSettings;

    #getter for: Lcom/mediatek/lbs/AgpsEpoSettings;->mAgpsCB:Landroid/preference/CheckBoxPreference;
    invoke-static {v0}, Lcom/mediatek/lbs/AgpsEpoSettings;->access$400(Lcom/mediatek/lbs/AgpsEpoSettings;)Landroid/preference/CheckBoxPreference;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 346
    :cond_0
    const-string v0, "AgpsEpoSettings"

    const-string v1, "DenyDenyDeny"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 347
    return-void
.end method
