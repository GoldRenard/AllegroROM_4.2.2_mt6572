.class Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;
.super Ljava/lang/Object;
.source "QuickSettingsConnectionModel.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;)V
    .registers 2
    .parameter

    .prologue
    .line 1224
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 16
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
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const-wide/16 v8, 0x0

    const/4 v3, -0x1

    .line 1227
    const-string v4, "QuickSettingsConnectionModel"

    const-string v5, "toggleState, onItemClick"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1228
    if-eqz p2, :cond_1a

    invoke-virtual {p2}, Landroid/view/View;->isEnabled()Z

    move-result v4

    if-nez v4, :cond_1a

    .line 1229
    const-string v3, "QuickSettingsConnectionModel"

    const-string v4, "toggleState, click item is not enabled"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1292
    :goto_19
    return-void

    .line 1232
    :cond_1a
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;

    .line 1233
    .local v2, simItem:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;
    if-eqz v2, :cond_111

    .line 1234
    iget v4, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mState:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_31

    .line 1235
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;->this$1:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget v4, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mSlot:I

    invoke-static {v3, v4}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->access$4300(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;I)V

    goto :goto_19

    .line 1237
    :cond_31
    iget-boolean v4, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mIsSim:Z

    if-eqz v4, :cond_55

    iget-wide v4, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mSimID:J

    iget-object v6, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;

    iget-object v6, v6, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;->this$1:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v6, v6, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->this$0:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;

    invoke-static {v6}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->access$000(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/content/Context;

    move-result-object v6

    const-string v7, "gprs_connection_sim_setting"

    invoke-static {v6, v7}, Lcom/android/systemui/statusbar/util/SIMHelper;->getDefaultSIM(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-nez v4, :cond_55

    .line 1240
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;->this$1:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->this$0:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;

    invoke-virtual {v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->dismissDialogs()V

    goto :goto_19

    .line 1242
    :cond_55
    iget-boolean v4, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mIsSim:Z

    if-nez v4, :cond_77

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;

    iget-object v4, v4, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;->this$1:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v4, v4, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->this$0:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;

    invoke-static {v4}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->access$000(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/content/Context;

    move-result-object v4

    const-string v5, "gprs_connection_sim_setting"

    invoke-static {v4, v5}, Lcom/android/systemui/statusbar/util/SIMHelper;->getDefaultSIM(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v4

    cmp-long v4, v4, v8

    if-nez v4, :cond_77

    .line 1246
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;->this$1:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->this$0:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;

    invoke-virtual {v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->dismissDialogs()V

    goto :goto_19

    .line 1250
    :cond_77
    iget-wide v4, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mSimID:J

    cmp-long v4, v4, v8

    if-lez v4, :cond_91

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;

    iget-object v4, v4, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;->this$1:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-wide v5, v2, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mSimID:J

    invoke-static {v4, v5, v6}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->access$4400(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;J)I

    move-result v1

    .line 1253
    .local v1, mDataSwitchMsgIndex:I
    :goto_87
    if-ne v1, v3, :cond_93

    .line 1254
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;->this$1:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    invoke-static {v3, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->access$4500(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;)V

    goto :goto_19

    .end local v1           #mDataSwitchMsgIndex:I
    :cond_91
    move v1, v3

    .line 1250
    goto :goto_87

    .line 1256
    .restart local v1       #mDataSwitchMsgIndex:I
    :cond_93
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;->this$1:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->this$0:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;

    invoke-static {v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->access$000(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1257
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    const v3, 0x1040014

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1258
    const v3, 0x1080027

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 1259
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;->this$1:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->this$0:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;

    invoke-static {v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->access$000(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1261
    const v3, 0x1040013

    new-instance v4, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1$1;

    invoke-direct {v4, p0, v1, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1$1;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;ILcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;)V

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1275
    const v3, 0x1040009

    new-instance v4, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1$2;

    invoke-direct {v4, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1$2;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;)V

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1282
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;->this$1:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->this$0:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;

    invoke-virtual {v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->dismissDialogs()V

    .line 1283
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;->this$1:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->this$0:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->access$1602(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 1284
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;->this$1:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->this$0:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;

    invoke-static {v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->access$1600(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/app/AlertDialog;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/16 v4, 0x7de

    invoke-virtual {v3, v4}, Landroid/view/Window;->setType(I)V

    .line 1286
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;->this$1:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v3, v3, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->this$0:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;

    invoke-static {v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->access$1600(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/app/AlertDialog;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_19

    .line 1289
    .end local v0           #builder:Landroid/app/AlertDialog$Builder;
    .end local v1           #mDataSwitchMsgIndex:I
    :cond_111
    const-string v3, "QuickSettingsConnectionModel"

    const-string v4, "MobileIcon clicked and clicked a null sim item"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_19
.end method
