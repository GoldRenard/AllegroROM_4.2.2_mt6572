.class public final enum Lcom/mediatek/beam/BeamShareTask$Direction;
.super Ljava/lang/Enum;
.source "BeamShareTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/beam/BeamShareTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Direction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mediatek/beam/BeamShareTask$Direction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mediatek/beam/BeamShareTask$Direction;

.field public static final enum in:Lcom/mediatek/beam/BeamShareTask$Direction;

.field public static final enum out:Lcom/mediatek/beam/BeamShareTask$Direction;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 187
    new-instance v0, Lcom/mediatek/beam/BeamShareTask$Direction;

    const-string v1, "in"

    invoke-direct {v0, v1, v2}, Lcom/mediatek/beam/BeamShareTask$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mediatek/beam/BeamShareTask$Direction;->in:Lcom/mediatek/beam/BeamShareTask$Direction;

    new-instance v0, Lcom/mediatek/beam/BeamShareTask$Direction;

    const-string v1, "out"

    invoke-direct {v0, v1, v3}, Lcom/mediatek/beam/BeamShareTask$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mediatek/beam/BeamShareTask$Direction;->out:Lcom/mediatek/beam/BeamShareTask$Direction;

    .line 186
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/mediatek/beam/BeamShareTask$Direction;

    sget-object v1, Lcom/mediatek/beam/BeamShareTask$Direction;->in:Lcom/mediatek/beam/BeamShareTask$Direction;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mediatek/beam/BeamShareTask$Direction;->out:Lcom/mediatek/beam/BeamShareTask$Direction;

    aput-object v1, v0, v3

    sput-object v0, Lcom/mediatek/beam/BeamShareTask$Direction;->$VALUES:[Lcom/mediatek/beam/BeamShareTask$Direction;

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
    .line 186
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mediatek/beam/BeamShareTask$Direction;
    .locals 1
    .parameter "name"

    .prologue
    .line 186
    const-class v0, Lcom/mediatek/beam/BeamShareTask$Direction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mediatek/beam/BeamShareTask$Direction;

    return-object v0
.end method

.method public static values()[Lcom/mediatek/beam/BeamShareTask$Direction;
    .locals 1

    .prologue
    .line 186
    sget-object v0, Lcom/mediatek/beam/BeamShareTask$Direction;->$VALUES:[Lcom/mediatek/beam/BeamShareTask$Direction;

    invoke-virtual {v0}, [Lcom/mediatek/beam/BeamShareTask$Direction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mediatek/beam/BeamShareTask$Direction;

    return-object v0
.end method
