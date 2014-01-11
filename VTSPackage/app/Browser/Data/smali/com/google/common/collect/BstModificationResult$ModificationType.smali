.class final enum Lcom/google/common/collect/BstModificationResult$ModificationType;
.super Ljava/lang/Enum;
.source "BstModificationResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/BstModificationResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "ModificationType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/google/common/collect/BstModificationResult$ModificationType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/common/collect/BstModificationResult$ModificationType;

.field public static final enum IDENTITY:Lcom/google/common/collect/BstModificationResult$ModificationType;

.field public static final enum REBALANCING_CHANGE:Lcom/google/common/collect/BstModificationResult$ModificationType;

.field public static final enum REBUILDING_CHANGE:Lcom/google/common/collect/BstModificationResult$ModificationType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 31
    new-instance v0, Lcom/google/common/collect/BstModificationResult$ModificationType;

    const-string v1, "IDENTITY"

    invoke-direct {v0, v1, v2}, Lcom/google/common/collect/BstModificationResult$ModificationType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/collect/BstModificationResult$ModificationType;->IDENTITY:Lcom/google/common/collect/BstModificationResult$ModificationType;

    new-instance v0, Lcom/google/common/collect/BstModificationResult$ModificationType;

    const-string v1, "REBUILDING_CHANGE"

    invoke-direct {v0, v1, v3}, Lcom/google/common/collect/BstModificationResult$ModificationType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/collect/BstModificationResult$ModificationType;->REBUILDING_CHANGE:Lcom/google/common/collect/BstModificationResult$ModificationType;

    new-instance v0, Lcom/google/common/collect/BstModificationResult$ModificationType;

    const-string v1, "REBALANCING_CHANGE"

    invoke-direct {v0, v1, v4}, Lcom/google/common/collect/BstModificationResult$ModificationType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/collect/BstModificationResult$ModificationType;->REBALANCING_CHANGE:Lcom/google/common/collect/BstModificationResult$ModificationType;

    .line 30
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/google/common/collect/BstModificationResult$ModificationType;

    sget-object v1, Lcom/google/common/collect/BstModificationResult$ModificationType;->IDENTITY:Lcom/google/common/collect/BstModificationResult$ModificationType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/common/collect/BstModificationResult$ModificationType;->REBUILDING_CHANGE:Lcom/google/common/collect/BstModificationResult$ModificationType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/google/common/collect/BstModificationResult$ModificationType;->REBALANCING_CHANGE:Lcom/google/common/collect/BstModificationResult$ModificationType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/google/common/collect/BstModificationResult$ModificationType;->$VALUES:[Lcom/google/common/collect/BstModificationResult$ModificationType;

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
    .line 30
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/common/collect/BstModificationResult$ModificationType;
    .locals 1
    .parameter "name"

    .prologue
    .line 30
    const-class v0, Lcom/google/common/collect/BstModificationResult$ModificationType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/BstModificationResult$ModificationType;

    return-object v0
.end method

.method public static values()[Lcom/google/common/collect/BstModificationResult$ModificationType;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcom/google/common/collect/BstModificationResult$ModificationType;->$VALUES:[Lcom/google/common/collect/BstModificationResult$ModificationType;

    invoke-virtual {v0}, [Lcom/google/common/collect/BstModificationResult$ModificationType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/common/collect/BstModificationResult$ModificationType;

    return-object v0
.end method
