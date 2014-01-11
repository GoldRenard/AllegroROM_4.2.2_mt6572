.class Lcom/android/systemui/statusbar/phone/QuickSettings$3;
.super Ljava/lang/Object;
.source "QuickSettings.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/phone/QuickSettings;->setupQuickSettings()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/phone/QuickSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 282
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$3;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 284
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$3;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    #calls: Lcom/android/systemui/statusbar/phone/QuickSettings;->setUpdate()V
    invoke-static {v0}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$300(Lcom/android/systemui/statusbar/phone/QuickSettings;)V

    .line 285
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$3;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    #getter for: Lcom/android/systemui/statusbar/phone/QuickSettings;->mQuickSettingsConnectionModel:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;
    invoke-static {v0}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$400(Lcom/android/systemui/statusbar/phone/QuickSettings;)Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->setUpdates(Z)V

    .line 286
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$3;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    #getter for: Lcom/android/systemui/statusbar/phone/QuickSettings;->mQuickSettingsConnectionModel:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;
    invoke-static {v0}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$400(Lcom/android/systemui/statusbar/phone/QuickSettings;)Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->initConfigurationState()V

    .line 287
    return-void
.end method
