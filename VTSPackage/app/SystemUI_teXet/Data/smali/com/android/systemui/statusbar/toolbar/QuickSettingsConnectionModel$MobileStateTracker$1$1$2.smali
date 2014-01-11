.class Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1$2;
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


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;)V
    .registers 2
    .parameter

    .prologue
    .line 1276
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1$2;->this$3:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 1279
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1$2;->this$3:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;

    iget-object v0, v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1$1;->this$2:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;

    iget-object v0, v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker$1;->this$1:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v0, v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->this$0:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->dismissDialogs()V

    .line 1280
    return-void
.end method
