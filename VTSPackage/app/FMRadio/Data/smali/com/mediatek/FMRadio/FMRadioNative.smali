.class public Lcom/mediatek/FMRadio/FMRadioNative;
.super Ljava/lang/Object;
.source "FMRadioNative.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const-string v0, "fmjni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 45
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static native activeAF()S
.end method

.method static native activeTA()S
.end method

.method static native autoscan()[S
.end method

.method static native closedev()Z
.end method

.method static native deactiveTA()S
.end method

.method static native getAFList()[S
.end method

.method static native getHardwareVersion()[I
.end method

.method static native getLRText()[B
.end method

.method static native getPI()S
.end method

.method static native getPS()[B
.end method

.method static native getPTY()B
.end method

.method static native getchipid()I
.end method

.method static native isFMPoweredUp()I
.end method

.method static native isRDSsupport()I
.end method

.method static native opendev()Z
.end method

.method static native powerdown(I)Z
.end method

.method static native powerup(F)Z
.end method

.method static native rdsset(Z)I
.end method

.method static native readCapArray()S
.end method

.method static native readRdsBler()S
.end method

.method static native readRssi()I
.end method

.method static native readrds()S
.end method

.method static native scannew(III)[S
.end method

.method static native seek(FZ)F
.end method

.method static native seeknew(IIIIII)I
.end method

.method static native setFMViaBTController(Z)Z
.end method

.method static native setStereoMono(Z)Z
.end method

.method static native setmute(Z)I
.end method

.method static native stereoMono()Z
.end method

.method static native stopscan()Z
.end method

.method static native switchAntenna(I)I
.end method

.method static native tune(F)Z
.end method

.method static native tunenew(IIII)Z
.end method
