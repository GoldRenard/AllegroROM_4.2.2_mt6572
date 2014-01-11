.class abstract enum Lcom/google/common/collect/BstSide;
.super Ljava/lang/Enum;
.source "BstSide.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/google/common/collect/BstSide;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/common/collect/BstSide;

.field public static final enum LEFT:Lcom/google/common/collect/BstSide;

.field public static final enum RIGHT:Lcom/google/common/collect/BstSide;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 26
    new-instance v0, Lcom/google/common/collect/BstSide$1;

    const-string v1, "LEFT"

    invoke-direct {v0, v1, v2}, Lcom/google/common/collect/BstSide$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/collect/BstSide;->LEFT:Lcom/google/common/collect/BstSide;

    .line 32
    new-instance v0, Lcom/google/common/collect/BstSide$2;

    const-string v1, "RIGHT"

    invoke-direct {v0, v1, v3}, Lcom/google/common/collect/BstSide$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/collect/BstSide;->RIGHT:Lcom/google/common/collect/BstSide;

    .line 24
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/google/common/collect/BstSide;

    sget-object v1, Lcom/google/common/collect/BstSide;->LEFT:Lcom/google/common/collect/BstSide;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/common/collect/BstSide;->RIGHT:Lcom/google/common/collect/BstSide;

    aput-object v1, v0, v3

    sput-object v0, Lcom/google/common/collect/BstSide;->$VALUES:[Lcom/google/common/collect/BstSide;

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
    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILcom/google/common/collect/BstSide$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/BstSide;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/common/collect/BstSide;
    .locals 1
    .parameter "name"

    .prologue
    .line 24
    const-class v0, Lcom/google/common/collect/BstSide;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/BstSide;

    return-object v0
.end method

.method public static values()[Lcom/google/common/collect/BstSide;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/google/common/collect/BstSide;->$VALUES:[Lcom/google/common/collect/BstSide;

    invoke-virtual {v0}, [Lcom/google/common/collect/BstSide;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/common/collect/BstSide;

    return-object v0
.end method


# virtual methods
.method abstract other()Lcom/google/common/collect/BstSide;
.end method
