.class Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;
.super Ljava/lang/Object;
.source "BluetoothHeadsetService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/BluetoothHeadsetService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BluetoothRemoteHeadset"
.end annotation


# instance fields
.field private mAudioState:I

.field private mHeadsetType:I

.field private mIncomingInfo:Landroid/bluetooth/BluetoothAudioGateway$IncomingConnectionInfo;

.field private mState:I

.field final synthetic this$0:Lcom/android/phone/BluetoothHeadsetService;


# direct methods
.method constructor <init>(Lcom/android/phone/BluetoothHeadsetService;)V
    .locals 1
    .parameter

    .prologue
    const/4 v0, 0x0

    .line 143
    iput-object p1, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->this$0:Lcom/android/phone/BluetoothHeadsetService;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 144
    iput v0, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->mState:I

    .line 145
    iput v0, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->mHeadsetType:I

    .line 149
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->mIncomingInfo:Landroid/bluetooth/BluetoothAudioGateway$IncomingConnectionInfo;

    .line 150
    const/16 v0, 0xa

    iput v0, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->mAudioState:I

    .line 151
    return-void
.end method

.method constructor <init>(Lcom/android/phone/BluetoothHeadsetService;ILandroid/bluetooth/BluetoothAudioGateway$IncomingConnectionInfo;)V
    .locals 1
    .parameter
    .parameter "headsetType"
    .parameter "incomingInfo"

    .prologue
    .line 153
    iput-object p1, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->this$0:Lcom/android/phone/BluetoothHeadsetService;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 154
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->mState:I

    .line 155
    iput p2, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->mHeadsetType:I

    .line 159
    iput-object p3, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->mIncomingInfo:Landroid/bluetooth/BluetoothAudioGateway$IncomingConnectionInfo;

    .line 160
    const/16 v0, 0xa

    iput v0, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->mAudioState:I

    .line 161
    return-void
.end method

.method static synthetic access$000(Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 134
    iget v0, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->mState:I

    return v0
.end method

.method static synthetic access$002(Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 134
    iput p1, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->mState:I

    return p1
.end method

.method static synthetic access$1200(Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;)Landroid/bluetooth/BluetoothAudioGateway$IncomingConnectionInfo;
    .locals 1
    .parameter "x0"

    .prologue
    .line 134
    iget-object v0, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->mIncomingInfo:Landroid/bluetooth/BluetoothAudioGateway$IncomingConnectionInfo;

    return-object v0
.end method

.method static synthetic access$1202(Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;Landroid/bluetooth/BluetoothAudioGateway$IncomingConnectionInfo;)Landroid/bluetooth/BluetoothAudioGateway$IncomingConnectionInfo;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 134
    iput-object p1, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->mIncomingInfo:Landroid/bluetooth/BluetoothAudioGateway$IncomingConnectionInfo;

    return-object p1
.end method

.method static synthetic access$2300(Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 134
    iget v0, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->mAudioState:I

    return v0
.end method

.method static synthetic access$2302(Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 134
    iput p1, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->mAudioState:I

    return p1
.end method

.method static synthetic access$600(Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 134
    iget v0, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->mHeadsetType:I

    return v0
.end method

.method static synthetic access$602(Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 134
    iput p1, p0, Lcom/android/phone/BluetoothHeadsetService$BluetoothRemoteHeadset;->mHeadsetType:I

    return p1
.end method
