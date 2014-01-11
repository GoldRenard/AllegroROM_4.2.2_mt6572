.class Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1$1;
.super Ljava/lang/Object;
.source "QuickSettingsConnectionModel.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$3:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;

.field final synthetic val$mDataSwitchMsgIndex:I

.field final synthetic val$simItem:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;ILcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1316
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1$1;->this$3:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;

    iput p2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1$1;->val$mDataSwitchMsgIndex:I

    iput-object p3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1$1;->val$simItem:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 1319
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1$1;->val$mDataSwitchMsgIndex:I

    const v1, 0x7f0b0021

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1$1;->val$mDataSwitchMsgIndex:I

    const v1, 0x7f0b0023

    if-ne v0, v1, :cond_1

    .line 1324
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1$1;->this$3:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;

    iget-object v0, v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;

    iget-object v0, v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;->this$1:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1$1;->val$simItem:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;

    iget-wide v1, v1, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;->mSimID:J

    #calls: Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->enableDataRoaming(J)V
    invoke-static {v0, v1, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->access$4600(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;J)V

    .line 1326
    :cond_1
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1$1;->this$3:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;

    iget-object v0, v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;

    iget-object v0, v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;->this$1:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1$1;->val$simItem:Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;

    #calls: Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->switchDataConnectionMode(Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;)V
    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->access$4500(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimItem;)V

    .line 1327
    return-void
.end method
