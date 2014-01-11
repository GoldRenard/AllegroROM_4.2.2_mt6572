.class public Lcom/mediatek/settings/CellBroadcastChannel;
.super Ljava/lang/Object;
.source "CellBroadcastChannel.java"


# instance fields
.field private mChannelId:I

.field private mChannelName:Ljava/lang/String;

.field private mChannelState:Z

.field private mKeyId:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Z)V
    .locals 0
    .parameter "keyId"
    .parameter "numberId"
    .parameter "name"
    .parameter "state"

    .prologue
    .line 48
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput p1, p0, Lcom/mediatek/settings/CellBroadcastChannel;->mKeyId:I

    .line 50
    iput p2, p0, Lcom/mediatek/settings/CellBroadcastChannel;->mChannelId:I

    .line 51
    iput-object p3, p0, Lcom/mediatek/settings/CellBroadcastChannel;->mChannelName:Ljava/lang/String;

    .line 52
    iput-boolean p4, p0, Lcom/mediatek/settings/CellBroadcastChannel;->mChannelState:Z

    .line 53
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Z)V
    .locals 0
    .parameter "numberId"
    .parameter "name"
    .parameter "state"

    .prologue
    .line 55
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput p1, p0, Lcom/mediatek/settings/CellBroadcastChannel;->mChannelId:I

    .line 57
    iput-object p2, p0, Lcom/mediatek/settings/CellBroadcastChannel;->mChannelName:Ljava/lang/String;

    .line 58
    iput-boolean p3, p0, Lcom/mediatek/settings/CellBroadcastChannel;->mChannelState:Z

    .line 59
    return-void
.end method


# virtual methods
.method public getChannelId()I
    .locals 1

    .prologue
    .line 70
    iget v0, p0, Lcom/mediatek/settings/CellBroadcastChannel;->mChannelId:I

    return v0
.end method

.method public getChannelName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/mediatek/settings/CellBroadcastChannel;->mChannelName:Ljava/lang/String;

    return-object v0
.end method

.method public getChannelState()Z
    .locals 1

    .prologue
    .line 86
    iget-boolean v0, p0, Lcom/mediatek/settings/CellBroadcastChannel;->mChannelState:Z

    return v0
.end method

.method public getKeyId()I
    .locals 1

    .prologue
    .line 62
    iget v0, p0, Lcom/mediatek/settings/CellBroadcastChannel;->mKeyId:I

    return v0
.end method

.method public setChannelId(I)V
    .locals 0
    .parameter "id"

    .prologue
    .line 74
    iput p1, p0, Lcom/mediatek/settings/CellBroadcastChannel;->mChannelId:I

    .line 75
    return-void
.end method

.method public setChannelName(Ljava/lang/String;)V
    .locals 0
    .parameter "name"

    .prologue
    .line 82
    iput-object p1, p0, Lcom/mediatek/settings/CellBroadcastChannel;->mChannelName:Ljava/lang/String;

    .line 83
    return-void
.end method

.method public setChannelState(Z)V
    .locals 0
    .parameter "state"

    .prologue
    .line 90
    iput-boolean p1, p0, Lcom/mediatek/settings/CellBroadcastChannel;->mChannelState:Z

    .line 91
    return-void
.end method

.method public setKeyId(I)V
    .locals 0
    .parameter "id"

    .prologue
    .line 66
    iput p1, p0, Lcom/mediatek/settings/CellBroadcastChannel;->mKeyId:I

    .line 67
    return-void
.end method
