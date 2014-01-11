.class Lcom/mediatek/wifi/hotspot/BandwidthUsage$5;
.super Ljava/lang/Object;
.source "BandwidthUsage.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/wifi/hotspot/BandwidthUsage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/wifi/hotspot/BandwidthUsage;


# direct methods
.method constructor <init>(Lcom/mediatek/wifi/hotspot/BandwidthUsage;)V
    .locals 0
    .parameter

    .prologue
    .line 251
    iput-object p1, p0, Lcom/mediatek/wifi/hotspot/BandwidthUsage$5;->this$0:Lcom/mediatek/wifi/hotspot/BandwidthUsage;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7
    .parameter "v"

    .prologue
    const/4 v4, 0x0

    const/4 v6, 0x1

    .line 255
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/BandwidthUsage$5;->this$0:Lcom/mediatek/wifi/hotspot/BandwidthUsage;

    #getter for: Lcom/mediatek/wifi/hotspot/BandwidthUsage;->mEnableThrottling:Landroid/widget/CheckBox;
    invoke-static {v3}, Lcom/mediatek/wifi/hotspot/BandwidthUsage;->access$600(Lcom/mediatek/wifi/hotspot/BandwidthUsage;)Landroid/widget/CheckBox;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 256
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/BandwidthUsage$5;->this$0:Lcom/mediatek/wifi/hotspot/BandwidthUsage;

    #getter for: Lcom/mediatek/wifi/hotspot/BandwidthUsage;->mEnableThrottling:Landroid/widget/CheckBox;
    invoke-static {v3}, Lcom/mediatek/wifi/hotspot/BandwidthUsage;->access$600(Lcom/mediatek/wifi/hotspot/BandwidthUsage;)Landroid/widget/CheckBox;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 257
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/BandwidthUsage$5;->this$0:Lcom/mediatek/wifi/hotspot/BandwidthUsage;

    #calls: Lcom/mediatek/wifi/hotspot/BandwidthUsage;->setThrottleEnabled(Z)V
    invoke-static {v3, v4}, Lcom/mediatek/wifi/hotspot/BandwidthUsage;->access$700(Lcom/mediatek/wifi/hotspot/BandwidthUsage;Z)V

    .line 258
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/BandwidthUsage$5;->this$0:Lcom/mediatek/wifi/hotspot/BandwidthUsage;

    #getter for: Lcom/mediatek/wifi/hotspot/BandwidthUsage;->mChart:Lcom/mediatek/widget/ChartBandwidthUsageView;
    invoke-static {v3}, Lcom/mediatek/wifi/hotspot/BandwidthUsage;->access$400(Lcom/mediatek/wifi/hotspot/BandwidthUsage;)Lcom/mediatek/widget/ChartBandwidthUsageView;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/mediatek/widget/ChartBandwidthUsageView;->setLimitState(Z)V

    .line 259
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/BandwidthUsage$5;->this$0:Lcom/mediatek/wifi/hotspot/BandwidthUsage;

    #calls: Lcom/mediatek/wifi/hotspot/BandwidthUsage;->setLimitData(Z)V
    invoke-static {v3, v4}, Lcom/mediatek/wifi/hotspot/BandwidthUsage;->access$500(Lcom/mediatek/wifi/hotspot/BandwidthUsage;Z)V

    .line 272
    :goto_0
    return-void

    .line 261
    :cond_0
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/BandwidthUsage$5;->this$0:Lcom/mediatek/wifi/hotspot/BandwidthUsage;

    #getter for: Lcom/mediatek/wifi/hotspot/BandwidthUsage;->mEnableThrottling:Landroid/widget/CheckBox;
    invoke-static {v3}, Lcom/mediatek/wifi/hotspot/BandwidthUsage;->access$600(Lcom/mediatek/wifi/hotspot/BandwidthUsage;)Landroid/widget/CheckBox;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 262
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/BandwidthUsage$5;->this$0:Lcom/mediatek/wifi/hotspot/BandwidthUsage;

    #calls: Lcom/mediatek/wifi/hotspot/BandwidthUsage;->setThrottleEnabled(Z)V
    invoke-static {v3, v6}, Lcom/mediatek/wifi/hotspot/BandwidthUsage;->access$700(Lcom/mediatek/wifi/hotspot/BandwidthUsage;Z)V

    .line 263
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/BandwidthUsage$5;->this$0:Lcom/mediatek/wifi/hotspot/BandwidthUsage;

    #getter for: Lcom/mediatek/wifi/hotspot/BandwidthUsage;->mChart:Lcom/mediatek/widget/ChartBandwidthUsageView;
    invoke-static {v3}, Lcom/mediatek/wifi/hotspot/BandwidthUsage;->access$400(Lcom/mediatek/wifi/hotspot/BandwidthUsage;)Lcom/mediatek/widget/ChartBandwidthUsageView;

    move-result-object v3

    invoke-virtual {v3, v6}, Lcom/mediatek/widget/ChartBandwidthUsageView;->setLimitState(Z)V

    .line 264
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/BandwidthUsage$5;->this$0:Lcom/mediatek/wifi/hotspot/BandwidthUsage;

    invoke-virtual {v3}, Lcom/mediatek/wifi/hotspot/BandwidthUsage;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-string v4, "network_info"

    iget-object v5, p0, Lcom/mediatek/wifi/hotspot/BandwidthUsage$5;->this$0:Lcom/mediatek/wifi/hotspot/BandwidthUsage;

    invoke-virtual {v5}, Lcom/mediatek/wifi/hotspot/BandwidthUsage;->getActivity()Landroid/app/Activity;

    invoke-virtual {v3, v4, v6}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 266
    .local v0, pre:Landroid/content/SharedPreferences;
    const-string v3, "network_limit"

    const-wide/16 v4, 0x1

    invoke-interface {v0, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    .line 267
    .local v1, value:J
    const-string v3, "BandwidthUsage"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "init limit value="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/BandwidthUsage$5;->this$0:Lcom/mediatek/wifi/hotspot/BandwidthUsage;

    #getter for: Lcom/mediatek/wifi/hotspot/BandwidthUsage;->mChart:Lcom/mediatek/widget/ChartBandwidthUsageView;
    invoke-static {v3}, Lcom/mediatek/wifi/hotspot/BandwidthUsage;->access$400(Lcom/mediatek/wifi/hotspot/BandwidthUsage;)Lcom/mediatek/widget/ChartBandwidthUsageView;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Lcom/mediatek/widget/ChartBandwidthUsageView;->setLimitBytes(J)V

    .line 270
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/BandwidthUsage$5;->this$0:Lcom/mediatek/wifi/hotspot/BandwidthUsage;

    #calls: Lcom/mediatek/wifi/hotspot/BandwidthUsage;->setLimitData(Z)V
    invoke-static {v3, v6}, Lcom/mediatek/wifi/hotspot/BandwidthUsage;->access$500(Lcom/mediatek/wifi/hotspot/BandwidthUsage;Z)V

    goto :goto_0
.end method
