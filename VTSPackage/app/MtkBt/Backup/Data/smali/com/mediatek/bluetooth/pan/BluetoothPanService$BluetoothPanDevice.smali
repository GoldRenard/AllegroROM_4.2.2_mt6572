.class Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
.super Ljava/lang/Object;
.source "BluetoothPanService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/pan/BluetoothPanService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BluetoothPanDevice"
.end annotation


# instance fields
.field private mLocalRole:I

.field private mState:I

.field final synthetic this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/pan/BluetoothPanService;II)V
    .locals 0
    .parameter
    .parameter "state"
    .parameter "localRole"

    .prologue
    .line 500
    iput-object p1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 501
    iput p2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I

    .line 502
    iput p3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I

    .line 503
    return-void
.end method

.method static synthetic access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 495
    iget v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I

    return v0
.end method

.method static synthetic access$702(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 495
    iput p1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I

    return p1
.end method

.method static synthetic access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 495
    iget v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I

    return v0
.end method

.method static synthetic access$802(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 495
    iput p1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I

    return p1
.end method
