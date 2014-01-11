.class Lcom/android/systemui/statusbar/phone/QuickSettings$8;
.super Ljava/lang/Object;
.source "QuickSettings.java"

# interfaces
.implements Lcom/android/systemui/statusbar/phone/QuickSettingsModel$RefreshCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/phone/QuickSettings;->addSystemTiles(Landroid/view/ViewGroup;Landroid/view/LayoutInflater;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/phone/QuickSettings;)V
    .registers 2
    .parameter

    .prologue
    .line 461
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$8;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public refreshView(Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;Lcom/android/systemui/statusbar/phone/QuickSettingsModel$State;)V
    .registers 14
    .parameter "view"
    .parameter "state"

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 464
    move-object v0, p2

    check-cast v0, Lcom/android/systemui/statusbar/phone/QuickSettingsModel$BatteryState;

    .line 466
    .local v0, batteryState:Lcom/android/systemui/statusbar/phone/QuickSettingsModel$BatteryState;
    const v5, 0x7f080088

    invoke-virtual {p1, v5}, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 467
    .local v4, tv:Landroid/widget/TextView;
    const v5, 0x7f080087

    invoke-virtual {p1, v5}, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 468
    .local v2, iv:Landroid/widget/ImageView;
    iget-boolean v5, v0, Lcom/android/systemui/statusbar/phone/QuickSettingsModel$BatteryState;->pluggedIn:Z

    if-eqz v5, :cond_54

    iget-object v5, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$8;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-static {v5}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$900(Lcom/android/systemui/statusbar/phone/QuickSettings;)Landroid/graphics/drawable/LevelListDrawable;

    move-result-object v1

    .line 472
    .local v1, d:Landroid/graphics/drawable/Drawable;
    :goto_21
    iget v5, v0, Lcom/android/systemui/statusbar/phone/QuickSettingsModel$BatteryState;->batteryLevel:I

    const/16 v6, 0x64

    if-ne v5, v6, :cond_5b

    .line 473
    iget-object v5, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$8;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-static {v5}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$100(Lcom/android/systemui/statusbar/phone/QuickSettings;)Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f0b00d5

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 481
    .local v3, t:Ljava/lang/String;
    :goto_34
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 482
    iget v5, v0, Lcom/android/systemui/statusbar/phone/QuickSettingsModel$BatteryState;->batteryLevel:I

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setImageLevel(I)V

    .line 483
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 484
    iget-object v5, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$8;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-static {v5}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$100(Lcom/android/systemui/statusbar/phone/QuickSettings;)Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f0b00cb

    new-array v7, v10, [Ljava/lang/Object;

    aput-object v3, v7, v9

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 486
    return-void

    .line 468
    .end local v1           #d:Landroid/graphics/drawable/Drawable;
    .end local v3           #t:Ljava/lang/String;
    :cond_54
    iget-object v5, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$8;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-static {v5}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$1000(Lcom/android/systemui/statusbar/phone/QuickSettings;)Landroid/graphics/drawable/LevelListDrawable;

    move-result-object v1

    goto :goto_21

    .line 475
    .restart local v1       #d:Landroid/graphics/drawable/Drawable;
    :cond_5b
    iget-boolean v5, v0, Lcom/android/systemui/statusbar/phone/QuickSettingsModel$BatteryState;->pluggedIn:Z

    if-eqz v5, :cond_77

    iget-object v5, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$8;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-static {v5}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$100(Lcom/android/systemui/statusbar/phone/QuickSettings;)Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f0b00d4

    new-array v7, v10, [Ljava/lang/Object;

    iget v8, v0, Lcom/android/systemui/statusbar/phone/QuickSettingsModel$BatteryState;->batteryLevel:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .restart local v3       #t:Ljava/lang/String;
    :goto_76
    goto :goto_34

    .end local v3           #t:Ljava/lang/String;
    :cond_77
    iget-object v5, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$8;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-static {v5}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$100(Lcom/android/systemui/statusbar/phone/QuickSettings;)Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f0b005b

    new-array v7, v10, [Ljava/lang/Object;

    iget v8, v0, Lcom/android/systemui/statusbar/phone/QuickSettingsModel$BatteryState;->batteryLevel:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_76
.end method
