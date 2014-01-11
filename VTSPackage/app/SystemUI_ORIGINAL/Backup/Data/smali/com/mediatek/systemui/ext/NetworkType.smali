.class public final enum Lcom/mediatek/systemui/ext/NetworkType;
.super Ljava/lang/Enum;
.source "NetworkType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mediatek/systemui/ext/NetworkType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mediatek/systemui/ext/NetworkType;

.field public static final enum Type_1X:Lcom/mediatek/systemui/ext/NetworkType;

.field public static final enum Type_1X3G:Lcom/mediatek/systemui/ext/NetworkType;

.field public static final enum Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

.field public static final enum Type_G:Lcom/mediatek/systemui/ext/NetworkType;


# instance fields
.field private mTypeId:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 8
    new-instance v0, Lcom/mediatek/systemui/ext/NetworkType;

    const-string v1, "Type_G"

    invoke-direct {v0, v1, v2, v2}, Lcom/mediatek/systemui/ext/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mediatek/systemui/ext/NetworkType;->Type_G:Lcom/mediatek/systemui/ext/NetworkType;

    new-instance v0, Lcom/mediatek/systemui/ext/NetworkType;

    const-string v1, "Type_3G"

    invoke-direct {v0, v1, v3, v3}, Lcom/mediatek/systemui/ext/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    new-instance v0, Lcom/mediatek/systemui/ext/NetworkType;

    const-string v1, "Type_1X"

    invoke-direct {v0, v1, v4, v4}, Lcom/mediatek/systemui/ext/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X:Lcom/mediatek/systemui/ext/NetworkType;

    new-instance v0, Lcom/mediatek/systemui/ext/NetworkType;

    const-string v1, "Type_1X3G"

    invoke-direct {v0, v1, v5, v5}, Lcom/mediatek/systemui/ext/NetworkType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X3G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 6
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/mediatek/systemui/ext/NetworkType;

    sget-object v1, Lcom/mediatek/systemui/ext/NetworkType;->Type_G:Lcom/mediatek/systemui/ext/NetworkType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X:Lcom/mediatek/systemui/ext/NetworkType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X3G:Lcom/mediatek/systemui/ext/NetworkType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/mediatek/systemui/ext/NetworkType;->$VALUES:[Lcom/mediatek/systemui/ext/NetworkType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .parameter
    .parameter
    .parameter "typeId"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 12
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 13
    iput p3, p0, Lcom/mediatek/systemui/ext/NetworkType;->mTypeId:I

    .line 14
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mediatek/systemui/ext/NetworkType;
    .locals 1
    .parameter "name"

    .prologue
    .line 6
    const-class v0, Lcom/mediatek/systemui/ext/NetworkType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mediatek/systemui/ext/NetworkType;

    return-object v0
.end method

.method public static values()[Lcom/mediatek/systemui/ext/NetworkType;
    .locals 1

    .prologue
    .line 6
    sget-object v0, Lcom/mediatek/systemui/ext/NetworkType;->$VALUES:[Lcom/mediatek/systemui/ext/NetworkType;

    invoke-virtual {v0}, [Lcom/mediatek/systemui/ext/NetworkType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mediatek/systemui/ext/NetworkType;

    return-object v0
.end method


# virtual methods
.method public getTypeId()I
    .locals 1

    .prologue
    .line 17
    iget v0, p0, Lcom/mediatek/systemui/ext/NetworkType;->mTypeId:I

    return v0
.end method
