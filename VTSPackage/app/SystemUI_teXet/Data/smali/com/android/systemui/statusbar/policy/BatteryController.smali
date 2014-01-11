.class public Lcom/android/systemui/statusbar/policy/BatteryController;
.super Landroid/content/BroadcastReceiver;
.source "BatteryController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/statusbar/policy/BatteryController$BatteryStateChangeCallback;,
        Lcom/android/systemui/statusbar/policy/BatteryController$SettingsObserver;
    }
.end annotation


# static fields
.field private static final ACTION_BATTERY_PERCENTAGE_SWITCH:Ljava/lang/String; = "mediatek.intent.action.BATTERY_PERCENTAGE_SWITCH"

.field public static final BATTERY_STYLE_CIRCLE:I = 0x2

.field public static final BATTERY_STYLE_CIRCLE_PERCENT:I = 0x3

.field public static final BATTERY_STYLE_GONE:I = 0x4

.field public static final BATTERY_STYLE_NORMAL:I = 0x0

.field public static final BATTERY_STYLE_PERCENT:I = 0x1

.field private static final BATTERY_TEXT_STYLE_MIN:I = 0x7f0b00ef

.field private static final BATTERY_TEXT_STYLE_NORMAL:I = 0x7f0b005b

.field private static final STATUS_BAR_BATTERY_PREF:Ljava/lang/String; = "status_bar_battery"

.field private static final TAG:Ljava/lang/String; = "StatusBar.BatteryController"


# instance fields
.field private mBatteryLevel:I

.field private mBatteryPercentage:Ljava/lang/String;

.field private mBatteryPlugged:Z

.field private mBatteryProtection:Z

.field private mBatteryStatus:I

.field private mBatteryStyle:I

.field private mChangeCallbacks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/systemui/statusbar/policy/BatteryController$BatteryStateChangeCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field mHandler:Landroid/os/Handler;

.field private mIconViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mLabelViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field private mShouldShowBatteryPercentage:Z

.field private mUiController:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 81
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/systemui/statusbar/policy/BatteryController;-><init>(Landroid/content/Context;Z)V

    .line 82
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 4
    .parameter "context"
    .parameter "ui"

    .prologue
    const/4 v3, 0x0

    .line 84
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 26
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mIconViews:Ljava/util/ArrayList;

    .line 27
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mLabelViews:Ljava/util/ArrayList;

    .line 45
    iput-boolean v3, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mBatteryPlugged:Z

    .line 46
    const/4 v2, 0x1

    iput v2, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mBatteryStatus:I

    .line 47
    iput v3, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mBatteryLevel:I

    .line 51
    iput-boolean v3, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mUiController:Z

    .line 73
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mChangeCallbacks:Ljava/util/ArrayList;

    .line 85
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mContext:Landroid/content/Context;

    .line 86
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    iput-object v2, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mHandler:Landroid/os/Handler;

    .line 87
    iput-boolean p2, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mUiController:Z

    .line 89
    iget-boolean v2, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mUiController:Z

    if-eqz v2, :cond_0

    .line 90
    new-instance v1, Lcom/android/systemui/statusbar/policy/BatteryController$SettingsObserver;

    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mHandler:Landroid/os/Handler;

    invoke-direct {v1, p0, v2}, Lcom/android/systemui/statusbar/policy/BatteryController$SettingsObserver;-><init>(Lcom/android/systemui/statusbar/policy/BatteryController;Landroid/os/Handler;)V

    .line 91
    .local v1, settingsObserver:Lcom/android/systemui/statusbar/policy/BatteryController$SettingsObserver;
    invoke-virtual {v1}, Lcom/android/systemui/statusbar/policy/BatteryController$SettingsObserver;->observe()V

    .line 92
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->updateSettings()V

    .line 95
    .end local v1           #settingsObserver:Lcom/android/systemui/statusbar/policy/BatteryController$SettingsObserver;
    :cond_0
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 96
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 97
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mContext:Landroid/content/Context;

    invoke-virtual {v2, p0, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 98
    return-void
.end method

.method static synthetic access$000(Lcom/android/systemui/statusbar/policy/BatteryController;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 20
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mContext:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public addIconView(Landroid/widget/ImageView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 101
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    return-void
.end method

.method public addLabelView(Landroid/widget/TextView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 105
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 106
    return-void
.end method

.method public addStateChangedCallback(Lcom/android/systemui/statusbar/policy/BatteryController$BatteryStateChangeCallback;)V
    .locals 2
    .parameter "cb"

    .prologue
    .line 109
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mChangeCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 111
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->getBatteryLevel()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->getBatteryStatus()I

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/android/systemui/statusbar/policy/BatteryController$BatteryStateChangeCallback;->onBatteryLevelChanged(II)V

    .line 112
    return-void
.end method

.method protected getBatteryLevel()I
    .locals 1

    .prologue
    .line 136
    iget v0, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mBatteryLevel:I

    return v0
.end method

.method protected getBatteryStatus()I
    .locals 1

    .prologue
    .line 144
    iget v0, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mBatteryStatus:I

    return v0
.end method

.method protected getBatteryStyle()I
    .locals 1

    .prologue
    .line 140
    iget v0, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mBatteryStyle:I

    return v0
.end method

.method public getIconStyleCharge()I
    .locals 1

    .prologue
    .line 126
    const v0, 0x7f020145

    return v0
.end method

.method public getIconStyleChargeMin()I
    .locals 1

    .prologue
    .line 132
    const v0, 0x7f02025f

    return v0
.end method

.method public getIconStyleNormal()I
    .locals 1

    .prologue
    .line 123
    const v0, 0x7f02013c

    return v0
.end method

.method public getIconStyleNormalMin()I
    .locals 1

    .prologue
    .line 129
    const v0, 0x7f020260

    return v0
.end method

.method public getIconStyleUnknown()I
    .locals 1

    .prologue
    .line 120
    const v0, 0x7f02013c

    return v0
.end method

.method protected isBatteryPlugged()Z
    .locals 1

    .prologue
    .line 148
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mBatteryPlugged:Z

    return v0
.end method

.method protected isBatteryPresent()Z
    .locals 1

    .prologue
    .line 153
    const/4 v0, 0x1

    return v0
.end method

.method protected isBatteryStatusCharging()Z
    .locals 2

    .prologue
    .line 161
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->getBatteryStatus()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isBatteryStatusUnknown()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 157
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->getBatteryStatus()I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isUiController()Z
    .locals 1

    .prologue
    .line 165
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mUiController:Z

    return v0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 170
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 172
    .local v0, action:Ljava/lang/String;
    const-string v3, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 173
    const-string v3, "level"

    invoke-virtual {p2, v3, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mBatteryLevel:I

    .line 174
    const-string v3, "plugged"

    invoke-virtual {p2, v3, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    if-eqz v3, :cond_0

    move v1, v2

    :cond_0
    iput-boolean v1, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mBatteryPlugged:Z

    .line 175
    const-string v1, "status"

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mBatteryStatus:I

    .line 176
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->updateViews()V

    .line 177
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mUiController:Z

    if-eqz v1, :cond_1

    .line 178
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->updateBattery()V

    .line 181
    :cond_1
    return-void
.end method

.method public removeStateChangedCallback(Lcom/android/systemui/statusbar/policy/BatteryController$BatteryStateChangeCallback;)V
    .locals 1
    .parameter "cb"

    .prologue
    .line 115
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mChangeCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 116
    return-void
.end method

.method protected updateBattery()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    .line 205
    const/16 v2, 0x8

    .line 206
    .local v2, mIcon:I
    const/16 v4, 0x8

    .line 207
    .local v4, mText:I
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->getIconStyleNormal()I

    move-result v3

    .line 209
    .local v3, mIconStyle:I
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->isBatteryPresent()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 210
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->isBatteryStatusUnknown()Z

    move-result v6

    if-eqz v6, :cond_2

    iget v6, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mBatteryStyle:I

    if-eqz v6, :cond_0

    iget v6, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mBatteryStyle:I

    if-ne v6, v7, :cond_2

    .line 212
    :cond_0
    const/4 v2, 0x0

    .line 213
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->getIconStyleUnknown()I

    move-result v3

    .line 224
    :cond_1
    :goto_0
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mIconViews:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 225
    .local v0, N:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v0, :cond_6

    .line 226
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mIconViews:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 227
    .local v5, v:Landroid/widget/ImageView;
    invoke-virtual {v5, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 228
    invoke-virtual {v5, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 225
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 214
    .end local v0           #N:I
    .end local v1           #i:I
    .end local v5           #v:Landroid/widget/ImageView;
    :cond_2
    iget v6, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mBatteryStyle:I

    if-nez v6, :cond_4

    .line 215
    const/4 v2, 0x0

    .line 216
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->isBatteryStatusCharging()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->getIconStyleCharge()I

    move-result v3

    :goto_2
    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->getIconStyleNormal()I

    move-result v3

    goto :goto_2

    .line 217
    :cond_4
    iget v6, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mBatteryStyle:I

    if-ne v6, v7, :cond_1

    .line 218
    const/4 v2, 0x0

    .line 219
    const/4 v4, 0x0

    .line 220
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->isBatteryStatusCharging()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->getIconStyleChargeMin()I

    move-result v3

    :goto_3
    goto :goto_0

    :cond_5
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->getIconStyleNormalMin()I

    move-result v3

    goto :goto_3

    .line 230
    .restart local v0       #N:I
    .restart local v1       #i:I
    :cond_6
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 231
    const/4 v1, 0x0

    :goto_4
    if-ge v1, v0, :cond_7

    .line 232
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 233
    .local v5, v:Landroid/widget/TextView;
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 231
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 235
    .end local v5           #v:Landroid/widget/TextView;
    :cond_7
    return-void
.end method

.method public updateSettings()V
    .locals 3

    .prologue
    .line 238
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 239
    .local v0, resolver:Landroid/content/ContentResolver;
    const-string v1, "status_bar_battery"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mBatteryStyle:I

    .line 240
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->updateBattery()V

    .line 241
    return-void
.end method

.method protected updateViews()V
    .locals 12

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 184
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->getBatteryLevel()I

    move-result v4

    .line 185
    .local v4, level:I
    iget-boolean v6, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mUiController:Z

    if-eqz v6, :cond_1

    .line 186
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mIconViews:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 187
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 188
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mIconViews:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 189
    .local v5, v:Landroid/widget/ImageView;
    invoke-virtual {v5, v4}, Landroid/widget/ImageView;->setImageLevel(I)V

    .line 190
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mContext:Landroid/content/Context;

    const v7, 0x7f0b009d

    new-array v8, v11, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-virtual {v6, v7, v8}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 187
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 192
    .end local v5           #v:Landroid/widget/ImageView;
    :cond_0
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 193
    const/4 v2, 0x0

    :goto_1
    if-ge v2, v0, :cond_1

    .line 194
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 195
    .local v5, v:Landroid/widget/TextView;
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mContext:Landroid/content/Context;

    const v7, 0x7f0b00ef

    new-array v8, v11, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-virtual {v6, v7, v8}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 193
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 199
    .end local v0           #N:I
    .end local v2           #i:I
    .end local v5           #v:Landroid/widget/TextView;
    :cond_1
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/BatteryController;->mChangeCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/systemui/statusbar/policy/BatteryController$BatteryStateChangeCallback;

    .line 200
    .local v1, cb:Lcom/android/systemui/statusbar/policy/BatteryController$BatteryStateChangeCallback;
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BatteryController;->getBatteryStatus()I

    move-result v6

    invoke-interface {v1, v4, v6}, Lcom/android/systemui/statusbar/policy/BatteryController$BatteryStateChangeCallback;->onBatteryLevelChanged(II)V

    goto :goto_2

    .line 202
    .end local v1           #cb:Lcom/android/systemui/statusbar/policy/BatteryController$BatteryStateChangeCallback;
    :cond_2
    return-void
.end method
