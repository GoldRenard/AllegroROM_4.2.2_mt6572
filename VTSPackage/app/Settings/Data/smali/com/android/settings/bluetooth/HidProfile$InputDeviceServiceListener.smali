.class final Lcom/android/settings/bluetooth/HidProfile$InputDeviceServiceListener;
.super Ljava/lang/Object;
.source "HidProfile.java"

# interfaces
.implements Landroid/bluetooth/BluetoothProfile$ServiceListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/bluetooth/HidProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "InputDeviceServiceListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/bluetooth/HidProfile;


# direct methods
.method private constructor <init>(Lcom/android/settings/bluetooth/HidProfile;)V
    .locals 0
    .parameter

    .prologue
    .line 51
    iput-object p1, p0, Lcom/android/settings/bluetooth/HidProfile$InputDeviceServiceListener;->this$0:Lcom/android/settings/bluetooth/HidProfile;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/settings/bluetooth/HidProfile;Lcom/android/settings/bluetooth/HidProfile$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/android/settings/bluetooth/HidProfile$InputDeviceServiceListener;-><init>(Lcom/android/settings/bluetooth/HidProfile;)V

    return-void
.end method


# virtual methods
.method public onServiceConnected(ILandroid/bluetooth/BluetoothProfile;)V
    .locals 8
    .parameter "profile"
    .parameter "proxy"

    .prologue
    .line 55
    invoke-static {}, Lcom/android/settings/bluetooth/HidProfile;->access$000()Z

    move-result v5

    if-eqz v5, :cond_0

    const-string v5, "HidProfile"

    const-string v6, "Bluetooth service connected"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    :cond_0
    iget-object v5, p0, Lcom/android/settings/bluetooth/HidProfile$InputDeviceServiceListener;->this$0:Lcom/android/settings/bluetooth/HidProfile;

    check-cast p2, Landroid/bluetooth/BluetoothInputDevice;

    .end local p2
    #setter for: Lcom/android/settings/bluetooth/HidProfile;->mService:Landroid/bluetooth/BluetoothInputDevice;
    invoke-static {v5, p2}, Lcom/android/settings/bluetooth/HidProfile;->access$102(Lcom/android/settings/bluetooth/HidProfile;Landroid/bluetooth/BluetoothInputDevice;)Landroid/bluetooth/BluetoothInputDevice;

    .line 60
    iget-object v5, p0, Lcom/android/settings/bluetooth/HidProfile$InputDeviceServiceListener;->this$0:Lcom/android/settings/bluetooth/HidProfile;

    #getter for: Lcom/android/settings/bluetooth/HidProfile;->mService:Landroid/bluetooth/BluetoothInputDevice;
    invoke-static {v5}, Lcom/android/settings/bluetooth/HidProfile;->access$100(Lcom/android/settings/bluetooth/HidProfile;)Landroid/bluetooth/BluetoothInputDevice;

    move-result-object v5

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothInputDevice;->getConnectedDevices()Ljava/util/List;

    move-result-object v2

    .line 61
    .local v2, deviceList:Ljava/util/List;,"Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    .line 62
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    .line 63
    .local v4, size:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v4, :cond_3

    .line 64
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    .line 65
    .local v0, bluetoothDevice:Landroid/bluetooth/BluetoothDevice;
    iget-object v5, p0, Lcom/android/settings/bluetooth/HidProfile$InputDeviceServiceListener;->this$0:Lcom/android/settings/bluetooth/HidProfile;

    #getter for: Lcom/android/settings/bluetooth/HidProfile;->mDeviceManager:Lcom/android/settings/bluetooth/CachedBluetoothDeviceManager;
    invoke-static {v5}, Lcom/android/settings/bluetooth/HidProfile;->access$200(Lcom/android/settings/bluetooth/HidProfile;)Lcom/android/settings/bluetooth/CachedBluetoothDeviceManager;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/android/settings/bluetooth/CachedBluetoothDeviceManager;->findDevice(Landroid/bluetooth/BluetoothDevice;)Lcom/android/settings/bluetooth/CachedBluetoothDevice;

    move-result-object v1

    .line 67
    .local v1, device:Lcom/android/settings/bluetooth/CachedBluetoothDevice;
    if-nez v1, :cond_1

    .line 68
    const-string v5, "HidProfile"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "HidProfile found new device: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    iget-object v5, p0, Lcom/android/settings/bluetooth/HidProfile$InputDeviceServiceListener;->this$0:Lcom/android/settings/bluetooth/HidProfile;

    #getter for: Lcom/android/settings/bluetooth/HidProfile;->mDeviceManager:Lcom/android/settings/bluetooth/CachedBluetoothDeviceManager;
    invoke-static {v5}, Lcom/android/settings/bluetooth/HidProfile;->access$200(Lcom/android/settings/bluetooth/HidProfile;)Lcom/android/settings/bluetooth/CachedBluetoothDeviceManager;

    move-result-object v5

    iget-object v6, p0, Lcom/android/settings/bluetooth/HidProfile$InputDeviceServiceListener;->this$0:Lcom/android/settings/bluetooth/HidProfile;

    #getter for: Lcom/android/settings/bluetooth/HidProfile;->mLocalAdapter:Lcom/android/settings/bluetooth/LocalBluetoothAdapter;
    invoke-static {v6}, Lcom/android/settings/bluetooth/HidProfile;->access$300(Lcom/android/settings/bluetooth/HidProfile;)Lcom/android/settings/bluetooth/LocalBluetoothAdapter;

    move-result-object v6

    iget-object v7, p0, Lcom/android/settings/bluetooth/HidProfile$InputDeviceServiceListener;->this$0:Lcom/android/settings/bluetooth/HidProfile;

    #getter for: Lcom/android/settings/bluetooth/HidProfile;->mProfileManager:Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;
    invoke-static {v7}, Lcom/android/settings/bluetooth/HidProfile;->access$400(Lcom/android/settings/bluetooth/HidProfile;)Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;

    move-result-object v7

    invoke-virtual {v5, v6, v7, v0}, Lcom/android/settings/bluetooth/CachedBluetoothDeviceManager;->addDevice(Lcom/android/settings/bluetooth/LocalBluetoothAdapter;Lcom/android/settings/bluetooth/LocalBluetoothProfileManager;Landroid/bluetooth/BluetoothDevice;)Lcom/android/settings/bluetooth/CachedBluetoothDevice;

    move-result-object v1

    .line 71
    :cond_1
    const-string v5, "HidProfile"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "HID, onServiceConnected, set device "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " state to connected"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    iget-object v5, p0, Lcom/android/settings/bluetooth/HidProfile$InputDeviceServiceListener;->this$0:Lcom/android/settings/bluetooth/HidProfile;

    const/4 v6, 0x2

    invoke-virtual {v1, v5, v6}, Lcom/android/settings/bluetooth/CachedBluetoothDevice;->onProfileStateChanged(Lcom/android/settings/bluetooth/LocalBluetoothProfile;I)V

    .line 63
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 76
    .end local v0           #bluetoothDevice:Landroid/bluetooth/BluetoothDevice;
    .end local v1           #device:Lcom/android/settings/bluetooth/CachedBluetoothDevice;
    .end local v3           #i:I
    .end local v4           #size:I
    :cond_2
    const-string v5, "HidProfile"

    const-string v6, "device list is empty"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    :cond_3
    iget-object v5, p0, Lcom/android/settings/bluetooth/HidProfile$InputDeviceServiceListener;->this$0:Lcom/android/settings/bluetooth/HidProfile;

    const/4 v6, 0x1

    #setter for: Lcom/android/settings/bluetooth/HidProfile;->mIsProfileReady:Z
    invoke-static {v5, v6}, Lcom/android/settings/bluetooth/HidProfile;->access$502(Lcom/android/settings/bluetooth/HidProfile;Z)Z

    .line 80
    return-void
.end method

.method public onServiceDisconnected(I)V
    .locals 2
    .parameter "profile"

    .prologue
    .line 83
    invoke-static {}, Lcom/android/settings/bluetooth/HidProfile;->access$000()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "HidProfile"

    const-string v1, "Bluetooth service disconnected"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    :cond_0
    iget-object v0, p0, Lcom/android/settings/bluetooth/HidProfile$InputDeviceServiceListener;->this$0:Lcom/android/settings/bluetooth/HidProfile;

    const/4 v1, 0x0

    #setter for: Lcom/android/settings/bluetooth/HidProfile;->mIsProfileReady:Z
    invoke-static {v0, v1}, Lcom/android/settings/bluetooth/HidProfile;->access$502(Lcom/android/settings/bluetooth/HidProfile;Z)Z

    .line 85
    return-void
.end method
