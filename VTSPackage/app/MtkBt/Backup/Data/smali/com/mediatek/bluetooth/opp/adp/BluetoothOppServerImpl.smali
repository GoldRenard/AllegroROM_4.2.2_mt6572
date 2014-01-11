.class Lcom/mediatek/bluetooth/opp/adp/BluetoothOppServerImpl;
.super Landroid/bluetooth/IBluetoothOpp$Stub;
.source "BluetoothOppService.java"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 191
    invoke-direct {p0}, Landroid/bluetooth/IBluetoothOpp$Stub;-><init>()V

    .line 193
    iput-object p1, p0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppServerImpl;->mContext:Landroid/content/Context;

    .line 194
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppServerImpl;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->getInstance(Landroid/content/Context;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppServerImpl;->mManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    .line 195
    return-void
.end method


# virtual methods
.method public disconnect(Landroid/bluetooth/BluetoothDevice;)V
    .locals 2
    .parameter "device"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 199
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppServerImpl;->mManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppAbortDeviceTasks(Ljava/lang/String;)V

    .line 200
    return-void
.end method

.method public getConnectedDevice()Landroid/bluetooth/BluetoothDevice;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 204
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppServerImpl;->mManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    invoke-virtual {v1}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppsGetCurrentTask()Landroid/net/Uri;

    move-result-object v0

    .line 205
    .local v0, uri:Landroid/net/Uri;
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppServerImpl;->mManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    invoke-virtual {v1, v0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppQueryTaskDevice(Landroid/net/Uri;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    return-object v1
.end method

.method public getState()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 210
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppServerImpl;->mManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppsGetCurrentTask()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 212
    const/4 v0, 0x1

    .line 215
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x2

    goto :goto_0
.end method
