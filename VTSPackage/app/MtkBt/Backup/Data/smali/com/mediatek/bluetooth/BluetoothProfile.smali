.class public Lcom/mediatek/bluetooth/BluetoothProfile;
.super Ljava/lang/Object;
.source "BluetoothProfile.java"


# static fields
.field public static final BT_PROFILE_RANGE:I = 0xf4240

.field public static final BT_PROFILE_START:I = 0x0

.field public static final ID_A2DP:I = 0x1

.field public static final ID_AVRCP:I = 0x2

.field public static final ID_BIP:I = 0x3

.field public static final ID_BPP:I = 0x4

.field public static final ID_CHN:I = 0x5

.field public static final ID_COMMON:I = 0x0

.field public static final ID_END:I = 0x15

.field public static final ID_FTP:I = 0x6

.field public static final ID_GAP:I = 0x7

.field public static final ID_GOEP:I = 0x8

.field public static final ID_HFG:I = 0x9

.field public static final ID_HID:I = 0xa

.field public static final ID_MAP:I = 0xb

.field public static final ID_OPP:I = 0xc

.field public static final ID_PAN:I = 0x10

.field public static final ID_PBAP:I = 0xd

.field public static final ID_PRXM:I = 0x11

.field public static final ID_PRXR:I = 0x12

.field public static final ID_SIMAP:I = 0xe

.field public static final ID_SPP:I = 0xf

.field public static final ID_TIMEC:I = 0x13

.field public static final ID_TIMES:I = 0x14

.field public static final PROFILE_START:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/16 v3, 0x15

    .line 88
    new-array v1, v3, [I

    sput-object v1, Lcom/mediatek/bluetooth/BluetoothProfile;->PROFILE_START:[I

    .line 90
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v3, :cond_0

    .line 92
    sget-object v1, Lcom/mediatek/bluetooth/BluetoothProfile;->PROFILE_START:[I

    const v2, 0xf4240

    mul-int/2addr v2, v0

    add-int/lit8 v2, v2, 0x0

    aput v2, v1, v0

    .line 90
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 94
    :cond_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getProfileStart(I)I
    .locals 1
    .parameter "profileId"

    .prologue
    .line 98
    sget-object v0, Lcom/mediatek/bluetooth/BluetoothProfile;->PROFILE_START:[I

    aget v0, v0, p0

    return v0
.end method
