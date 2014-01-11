.class public final Lcom/google/common/net/InetAddresses$TeredoInfo;
.super Ljava/lang/Object;
.source "InetAddresses.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/net/InetAddresses;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TeredoInfo"
.end annotation


# instance fields
.field private final client:Ljava/net/Inet4Address;

.field private final flags:I

.field private final port:I

.field private final server:Ljava/net/Inet4Address;


# direct methods
.method public constructor <init>(Ljava/net/Inet4Address;Ljava/net/Inet4Address;II)V
    .locals 7
    .parameter "server"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .parameter "client"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .parameter "port"
    .end parameter
    .parameter "flags"
    .end parameter

    .prologue
    const v6, 0xffff

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 691
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 692
    if-ltz p3, :cond_0

    if-gt p3, v6, :cond_0

    move v0, v1

    :goto_0
    const-string v3, "port \'%s\' is out of range (0 <= port <= 0xffff)"

    new-array v4, v1, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-static {v0, v3, v4}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 694
    if-ltz p4, :cond_1

    if-gt p4, v6, :cond_1

    move v0, v1

    :goto_1
    const-string v3, "flags \'%s\' is out of range (0 <= flags <= 0xffff)"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 697
    if-eqz p1, :cond_2

    .line 698
    iput-object p1, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->server:Ljava/net/Inet4Address;

    .line 703
    :goto_2
    if-eqz p2, :cond_3

    .line 704
    iput-object p2, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->client:Ljava/net/Inet4Address;

    .line 709
    :goto_3
    iput p3, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->port:I

    .line 710
    iput p4, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->flags:I

    .line 711
    return-void

    :cond_0
    move v0, v2

    .line 692
    goto :goto_0

    :cond_1
    move v0, v2

    .line 694
    goto :goto_1

    .line 700
    :cond_2
    invoke-static {}, Lcom/google/common/net/InetAddresses;->access$000()Ljava/net/Inet4Address;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->server:Ljava/net/Inet4Address;

    goto :goto_2

    .line 706
    :cond_3
    invoke-static {}, Lcom/google/common/net/InetAddresses;->access$000()Ljava/net/Inet4Address;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->client:Ljava/net/Inet4Address;

    goto :goto_3
.end method


# virtual methods
.method public getClient()Ljava/net/Inet4Address;
    .locals 1

    .prologue
    .line 718
    iget-object v0, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->client:Ljava/net/Inet4Address;

    return-object v0
.end method

.method public getFlags()I
    .locals 1

    .prologue
    .line 726
    iget v0, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->flags:I

    return v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 722
    iget v0, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->port:I

    return v0
.end method

.method public getServer()Ljava/net/Inet4Address;
    .locals 1

    .prologue
    .line 714
    iget-object v0, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->server:Ljava/net/Inet4Address;

    return-object v0
.end method
