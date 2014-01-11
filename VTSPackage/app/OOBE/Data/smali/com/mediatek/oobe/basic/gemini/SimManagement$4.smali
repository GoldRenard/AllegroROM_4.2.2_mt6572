.class Lcom/mediatek/oobe/basic/gemini/SimManagement$4;
.super Landroid/database/ContentObserver;
.source "SimManagement.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/oobe/basic/gemini/SimManagement;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;Landroid/os/Handler;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 566
    iput-object p1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$4;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 6
    .parameter "selfChange"

    .prologue
    .line 570
    const-string v2, "SimManagementSettings"

    const-string v3, "Gprs connection SIM changed"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 571
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$4;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #calls: Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;
    invoke-static {v2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1700(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "gprs_connection_sim_setting"

    const-wide/16 v4, -0x5

    invoke-static {v2, v3, v4, v5}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    .line 574
    .local v0, dataconnectionID:J
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$4;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    const/4 v3, 0x4

    #calls: Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateDefaultSimValue(IJ)V
    invoke-static {v2, v3, v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1800(Lcom/mediatek/oobe/basic/gemini/SimManagement;IJ)V

    .line 575
    return-void
.end method
