.class public Lcom/mediatek/bluetooth/opp/mmi/OppLog;
.super Ljava/lang/Object;
.source "OppLog.java"


# static fields
.field private static final DEVELOPMENT:Z = false

.field private static final TAG:Ljava/lang/String; = "Bluetooth.OPP"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static d(Ljava/lang/String;)V
    .locals 2
    .parameter "message"

    .prologue
    .line 56
    const/4 v0, 0x3

    const-string v1, "Bluetooth.OPP"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 58
    return-void
.end method

.method public static e(Ljava/lang/String;)V
    .locals 2
    .parameter "message"

    .prologue
    .line 89
    const/4 v0, 0x6

    const-string v1, "Bluetooth.OPP"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 91
    return-void
.end method

.method public static i(Ljava/lang/String;)V
    .locals 2
    .parameter "message"

    .prologue
    .line 67
    const/4 v0, 0x4

    const-string v1, "Bluetooth.OPP"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 69
    return-void
.end method

.method public static w(Ljava/lang/String;)V
    .locals 2
    .parameter "message"

    .prologue
    .line 78
    const/4 v0, 0x5

    const-string v1, "Bluetooth.OPP"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 80
    return-void
.end method
