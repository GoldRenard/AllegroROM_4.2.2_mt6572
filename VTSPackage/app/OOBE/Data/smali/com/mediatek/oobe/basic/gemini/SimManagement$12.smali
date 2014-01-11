.class Lcom/mediatek/oobe/basic/gemini/SimManagement$12;
.super Ljava/lang/Object;
.source "SimManagement.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/oobe/basic/gemini/SimManagement;->addSimInfoPreference()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V
    .locals 0
    .parameter

    .prologue
    .line 1188
    iput-object p1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$12;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    const/4 v1, 0x1

    .line 1191
    const-string v2, "SimManagementSettings"

    const-string v3, "receive sim2 click intent!"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1192
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$12;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSlot2SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    invoke-static {v2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$2700(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->getCheck()Z

    move-result v0

    .line 1193
    .local v0, bChecked:Z
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$12;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSIMModeSwitching:Z
    invoke-static {v2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$2500(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1194
    const-string v1, "SimManagementSettings"

    const-string v2, "mIsSIMModeSwitching == true"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1195
    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$12;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSlot2SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    invoke-static {v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$2700(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setCheck(Z)V

    .line 1205
    :goto_0
    return-void

    .line 1198
    :cond_0
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$12;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #setter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSIMModeSwitching:Z
    invoke-static {v2, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$2502(Lcom/mediatek/oobe/basic/gemini/SimManagement;Z)Z

    .line 1199
    const-string v2, "SimManagementSettings"

    const-string v3, "set mIsSIMModeSwitching true"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1200
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$12;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSlot2SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    invoke-static {v2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$2700(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    move-result-object v2

    if-nez v0, :cond_1

    :goto_1
    invoke-virtual {v2, v1}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setCheck(Z)V

    .line 1203
    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$12;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #calls: Lcom/mediatek/oobe/basic/gemini/SimManagement;->dealSim2Change()V
    invoke-static {v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$2800(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V

    goto :goto_0

    .line 1200
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method
