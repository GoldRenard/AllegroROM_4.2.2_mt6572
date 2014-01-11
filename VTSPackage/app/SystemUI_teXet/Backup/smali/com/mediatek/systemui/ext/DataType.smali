.class public final enum Lcom/mediatek/systemui/ext/DataType;
.super Ljava/lang/Enum;
.source "DataType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mediatek/systemui/ext/DataType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mediatek/systemui/ext/DataType;

.field public static final enum Type_1X:Lcom/mediatek/systemui/ext/DataType;

.field public static final enum Type_3G:Lcom/mediatek/systemui/ext/DataType;

.field public static final enum Type_3G_PLUS:Lcom/mediatek/systemui/ext/DataType;

.field public static final enum Type_4G:Lcom/mediatek/systemui/ext/DataType;

.field public static final enum Type_E:Lcom/mediatek/systemui/ext/DataType;

.field public static final enum Type_G:Lcom/mediatek/systemui/ext/DataType;

.field public static final enum Type_H:Lcom/mediatek/systemui/ext/DataType;

.field public static final enum Type_H_PLUS:Lcom/mediatek/systemui/ext/DataType;


# instance fields
.field private mTypeId:I


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 8
    new-instance v0, Lcom/mediatek/systemui/ext/DataType;

    const-string v1, "Type_1X"

    invoke-direct {v0, v1, v4, v4}, Lcom/mediatek/systemui/ext/DataType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mediatek/systemui/ext/DataType;->Type_1X:Lcom/mediatek/systemui/ext/DataType;

    new-instance v0, Lcom/mediatek/systemui/ext/DataType;

    const-string v1, "Type_3G"

    invoke-direct {v0, v1, v5, v5}, Lcom/mediatek/systemui/ext/DataType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mediatek/systemui/ext/DataType;->Type_3G:Lcom/mediatek/systemui/ext/DataType;

    new-instance v0, Lcom/mediatek/systemui/ext/DataType;

    const-string v1, "Type_4G"

    invoke-direct {v0, v1, v6, v6}, Lcom/mediatek/systemui/ext/DataType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mediatek/systemui/ext/DataType;->Type_4G:Lcom/mediatek/systemui/ext/DataType;

    new-instance v0, Lcom/mediatek/systemui/ext/DataType;

    const-string v1, "Type_E"

    invoke-direct {v0, v1, v7, v7}, Lcom/mediatek/systemui/ext/DataType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mediatek/systemui/ext/DataType;->Type_E:Lcom/mediatek/systemui/ext/DataType;

    new-instance v0, Lcom/mediatek/systemui/ext/DataType;

    const-string v1, "Type_G"

    invoke-direct {v0, v1, v8, v8}, Lcom/mediatek/systemui/ext/DataType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mediatek/systemui/ext/DataType;->Type_G:Lcom/mediatek/systemui/ext/DataType;

    new-instance v0, Lcom/mediatek/systemui/ext/DataType;

    const-string v1, "Type_H"

    const/4 v2, 0x5

    const/4 v3, 0x5

    invoke-direct {v0, v1, v2, v3}, Lcom/mediatek/systemui/ext/DataType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mediatek/systemui/ext/DataType;->Type_H:Lcom/mediatek/systemui/ext/DataType;

    new-instance v0, Lcom/mediatek/systemui/ext/DataType;

    const-string v1, "Type_H_PLUS"

    const/4 v2, 0x6

    const/4 v3, 0x6

    invoke-direct {v0, v1, v2, v3}, Lcom/mediatek/systemui/ext/DataType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mediatek/systemui/ext/DataType;->Type_H_PLUS:Lcom/mediatek/systemui/ext/DataType;

    new-instance v0, Lcom/mediatek/systemui/ext/DataType;

    const-string v1, "Type_3G_PLUS"

    const/4 v2, 0x7

    const/4 v3, 0x7

    invoke-direct {v0, v1, v2, v3}, Lcom/mediatek/systemui/ext/DataType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mediatek/systemui/ext/DataType;->Type_3G_PLUS:Lcom/mediatek/systemui/ext/DataType;

    .line 6
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/mediatek/systemui/ext/DataType;

    sget-object v1, Lcom/mediatek/systemui/ext/DataType;->Type_1X:Lcom/mediatek/systemui/ext/DataType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/mediatek/systemui/ext/DataType;->Type_3G:Lcom/mediatek/systemui/ext/DataType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/mediatek/systemui/ext/DataType;->Type_4G:Lcom/mediatek/systemui/ext/DataType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/mediatek/systemui/ext/DataType;->Type_E:Lcom/mediatek/systemui/ext/DataType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/mediatek/systemui/ext/DataType;->Type_G:Lcom/mediatek/systemui/ext/DataType;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/mediatek/systemui/ext/DataType;->Type_H:Lcom/mediatek/systemui/ext/DataType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/mediatek/systemui/ext/DataType;->Type_H_PLUS:Lcom/mediatek/systemui/ext/DataType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/mediatek/systemui/ext/DataType;->Type_3G_PLUS:Lcom/mediatek/systemui/ext/DataType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/mediatek/systemui/ext/DataType;->$VALUES:[Lcom/mediatek/systemui/ext/DataType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
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
    iput p3, p0, Lcom/mediatek/systemui/ext/DataType;->mTypeId:I

    .line 14
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mediatek/systemui/ext/DataType;
    .registers 2
    .parameter "name"

    .prologue
    .line 6
    const-class v0, Lcom/mediatek/systemui/ext/DataType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mediatek/systemui/ext/DataType;

    return-object v0
.end method

.method public static values()[Lcom/mediatek/systemui/ext/DataType;
    .registers 1

    .prologue
    .line 6
    sget-object v0, Lcom/mediatek/systemui/ext/DataType;->$VALUES:[Lcom/mediatek/systemui/ext/DataType;

    invoke-virtual {v0}, [Lcom/mediatek/systemui/ext/DataType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mediatek/systemui/ext/DataType;

    return-object v0
.end method


# virtual methods
.method public getTypeId()I
    .registers 2

    .prologue
    .line 17
    iget v0, p0, Lcom/mediatek/systemui/ext/DataType;->mTypeId:I

    return v0
.end method
