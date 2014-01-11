.class public final enum Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;
.super Ljava/lang/Enum;
.source "BluetoothShareTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/share/BluetoothShareTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Direction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

.field public static final enum in:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

.field public static final enum out:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 297
    new-instance v0, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    const-string v1, "in"

    invoke-direct {v0, v1, v2}, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->in:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    new-instance v0, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    const-string v1, "out"

    invoke-direct {v0, v1, v3}, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->out:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    .line 296
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    sget-object v1, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->in:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->out:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    aput-object v1, v0, v3

    sput-object v0, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->$VALUES:[Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 296
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;
    .locals 1
    .parameter "name"

    .prologue
    .line 296
    const-class v0, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    return-object v0
.end method

.method public static values()[Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;
    .locals 1

    .prologue
    .line 296
    sget-object v0, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->$VALUES:[Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    invoke-virtual {v0}, [Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    return-object v0
.end method
