.class public Lcom/android/systemui/statusbar/policy/BluetoothController;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothController.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "StatusBar.BluetoothController"


# instance fields
.field private mBondedDevices:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Landroid/bluetooth/BluetoothDevice;",
            ">;"
        }
    .end annotation
.end field

.field private mChangeCallbacks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/bluetooth/BluetoothAdapter$BluetoothStateChangeCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mContentDescriptionId:I

.field private mContext:Landroid/content/Context;

.field private mEnabled:Z

.field private mIconId:I

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


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 6
    .parameter "context"

    .prologue
    const/4 v3, 0x0

    .line 50
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 39
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mIconViews:Ljava/util/ArrayList;

    .line 41
    const v2, 0x7f02014e

    iput v2, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mIconId:I

    .line 42
    iput v3, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mContentDescriptionId:I

    .line 43
    iput-boolean v3, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mEnabled:Z

    .line 45
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mBondedDevices:Ljava/util/Set;

    .line 47
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mChangeCallbacks:Ljava/util/ArrayList;

    .line 51
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mContext:Landroid/content/Context;

    .line 53
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 54
    .local v1, filter:Landroid/content/IntentFilter;
    const-string v2, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 55
    const-string v2, "android.bluetooth.adapter.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 56
    const-string v2, "android.bluetooth.device.action.BOND_STATE_CHANGED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 57
    invoke-virtual {p1, p0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 59
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    .line 60
    .local v0, adapter:Landroid/bluetooth/BluetoothAdapter;
    if-eqz v0, :cond_4f

    .line 61
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getState()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/android/systemui/statusbar/policy/BluetoothController;->handleAdapterStateChange(I)V

    .line 62
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getConnectionState()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/android/systemui/statusbar/policy/BluetoothController;->handleConnectionStateChange(I)V

    .line 64
    :cond_4f
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BluetoothController;->refreshViews()V

    .line 65
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/BluetoothController;->updateBondedBluetoothDevices()V

    .line 66
    return-void
.end method

.method private updateBondedBluetoothDevices()V
    .registers 7

    .prologue
    .line 99
    iget-object v4, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mBondedDevices:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->clear()V

    .line 101
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    .line 102
    .local v0, adapter:Landroid/bluetooth/BluetoothAdapter;
    if-eqz v0, :cond_2f

    .line 103
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v2

    .line 104
    .local v2, devices:Ljava/util/Set;,"Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    if-eqz v2, :cond_2f

    .line 105
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_15
    :goto_15
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothDevice;

    .line 106
    .local v1, device:Landroid/bluetooth/BluetoothDevice;
    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    move-result v4

    const/16 v5, 0xa

    if-eq v4, v5, :cond_15

    .line 107
    iget-object v4, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mBondedDevices:Ljava/util/Set;

    invoke-interface {v4, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_15

    .line 112
    .end local v1           #device:Landroid/bluetooth/BluetoothDevice;
    .end local v2           #devices:Ljava/util/Set;,"Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    .end local v3           #i$:Ljava/util/Iterator;
    :cond_2f
    return-void
.end method


# virtual methods
.method public addIconView(Landroid/widget/ImageView;)V
    .registers 3
    .parameter "v"

    .prologue
    .line 69
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    return-void
.end method

.method public addStateChangedCallback(Landroid/bluetooth/BluetoothAdapter$BluetoothStateChangeCallback;)V
    .registers 3
    .parameter "cb"

    .prologue
    .line 73
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mChangeCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    return-void
.end method

.method public getBondedBluetoothDevices()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Landroid/bluetooth/BluetoothDevice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 77
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mBondedDevices:Ljava/util/Set;

    return-object v0
.end method

.method public handleAdapterStateChange(I)V
    .registers 3
    .parameter "adapterState"

    .prologue
    .line 115
    const/16 v0, 0xc

    if-ne p1, v0, :cond_8

    const/4 v0, 0x1

    :goto_5
    iput-boolean v0, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mEnabled:Z

    .line 116
    return-void

    .line 115
    :cond_8
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public handleConnectionStateChange(I)V
    .registers 4
    .parameter "connectionState"

    .prologue
    .line 119
    const/4 v1, 0x2

    if-ne p1, v1, :cond_11

    const/4 v0, 0x1

    .line 120
    .local v0, connected:Z
    :goto_4
    if-eqz v0, :cond_13

    .line 121
    const v1, 0x7f02014f

    iput v1, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mIconId:I

    .line 122
    const v1, 0x7f0b0078

    iput v1, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mContentDescriptionId:I

    .line 127
    :goto_10
    return-void

    .line 119
    .end local v0           #connected:Z
    :cond_11
    const/4 v0, 0x0

    goto :goto_4

    .line 124
    .restart local v0       #connected:Z
    :cond_13
    const v1, 0x7f02014e

    iput v1, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mIconId:I

    .line 125
    const v1, 0x7f0b0079

    iput v1, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mContentDescriptionId:I

    goto :goto_10
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 6
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 82
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 84
    .local v0, action:Ljava/lang/String;
    const-string v1, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 85
    const-string v1, "android.bluetooth.adapter.extra.STATE"

    const/high16 v2, -0x8000

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/policy/BluetoothController;->handleAdapterStateChange(I)V

    .line 94
    :cond_17
    :goto_17
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/BluetoothController;->refreshViews()V

    .line 95
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/BluetoothController;->updateBondedBluetoothDevices()V

    .line 96
    return-void

    .line 87
    :cond_1e
    const-string v1, "android.bluetooth.adapter.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_31

    .line 88
    const-string v1, "android.bluetooth.adapter.extra.CONNECTION_STATE"

    const/4 v2, 0x0

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/policy/BluetoothController;->handleConnectionStateChange(I)V

    goto :goto_17

    .line 91
    :cond_31
    const-string v1, "android.bluetooth.device.action.BOND_STATE_CHANGED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17

    goto :goto_17
.end method

.method public refreshViews()V
    .registers 8

    .prologue
    .line 130
    iget-object v5, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mIconViews:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 131
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_7
    if-ge v2, v0, :cond_35

    .line 132
    iget-object v5, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mIconViews:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 133
    .local v4, v:Landroid/widget/ImageView;
    iget v5, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mIconId:I

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 134
    iget-boolean v5, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mEnabled:Z

    if-eqz v5, :cond_29

    const/4 v5, 0x0

    :goto_1b
    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 135
    iget v5, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mContentDescriptionId:I

    if-nez v5, :cond_2c

    const/4 v5, 0x0

    :goto_23
    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 131
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 134
    :cond_29
    const/16 v5, 0x8

    goto :goto_1b

    .line 135
    :cond_2c
    iget-object v5, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mContext:Landroid/content/Context;

    iget v6, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mContentDescriptionId:I

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_23

    .line 139
    .end local v4           #v:Landroid/widget/ImageView;
    :cond_35
    iget-object v5, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mChangeCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_3b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothAdapter$BluetoothStateChangeCallback;

    .line 140
    .local v1, cb:Landroid/bluetooth/BluetoothAdapter$BluetoothStateChangeCallback;
    iget-boolean v5, p0, Lcom/android/systemui/statusbar/policy/BluetoothController;->mEnabled:Z

    invoke-interface {v1, v5}, Landroid/bluetooth/BluetoothAdapter$BluetoothStateChangeCallback;->onBluetoothStateChange(Z)V

    goto :goto_3b

    .line 142
    .end local v1           #cb:Landroid/bluetooth/BluetoothAdapter$BluetoothStateChangeCallback;
    :cond_4d
    return-void
.end method
