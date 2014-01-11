.class public abstract Lcom/mediatek/bluetooth/psm/PsmConnection;
.super Ljava/lang/Object;
.source "PsmConnection.java"


# instance fields
.field protected connId:I

.field protected currentState:I


# direct methods
.method protected constructor <init>(I)V
    .locals 1
    .parameter "defaultState"

    .prologue
    .line 56
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const/4 v0, -0x1

    iput v0, p0, Lcom/mediatek/bluetooth/psm/PsmConnection;->connId:I

    .line 57
    iput p1, p0, Lcom/mediatek/bluetooth/psm/PsmConnection;->currentState:I

    .line 58
    return-void
.end method


# virtual methods
.method public getConnId()I
    .locals 1

    .prologue
    .line 61
    iget v0, p0, Lcom/mediatek/bluetooth/psm/PsmConnection;->connId:I

    return v0
.end method

.method public getCurrentState()I
    .locals 1

    .prologue
    .line 67
    iget v0, p0, Lcom/mediatek/bluetooth/psm/PsmConnection;->currentState:I

    return v0
.end method

.method public setConnId(I)V
    .locals 0
    .parameter "connId"

    .prologue
    .line 64
    iput p1, p0, Lcom/mediatek/bluetooth/psm/PsmConnection;->connId:I

    .line 65
    return-void
.end method

.method public setCurrentState(I)V
    .locals 0
    .parameter "currentState"

    .prologue
    .line 70
    iput p1, p0, Lcom/mediatek/bluetooth/psm/PsmConnection;->currentState:I

    .line 71
    return-void
.end method
