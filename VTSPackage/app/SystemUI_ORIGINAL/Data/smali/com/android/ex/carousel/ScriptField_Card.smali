.class public Lcom/android/ex/carousel/ScriptField_Card;
.super Landroid/renderscript/Script$FieldBase;
.source "ScriptField_Card.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/ex/carousel/ScriptField_Card$Item;
    }
.end annotation


# static fields
.field private static mElementCache:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/renderscript/Element;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mIOBuffer:Landroid/renderscript/FieldPacker;

.field private mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 49
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/android/ex/carousel/ScriptField_Card;->mElementCache:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private constructor <init>(Landroid/renderscript/RenderScript;)V
    .locals 1
    .parameter "rs"

    .prologue
    const/4 v0, 0x0

    .line 72
    invoke-direct {p0}, Landroid/renderscript/Script$FieldBase;-><init>()V

    .line 73
    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 74
    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 75
    invoke-static {p1}, Lcom/android/ex/carousel/ScriptField_Card;->createElement(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mElement:Landroid/renderscript/Element;

    .line 76
    return-void
.end method

.method public constructor <init>(Landroid/renderscript/RenderScript;I)V
    .locals 1
    .parameter "rs"
    .parameter "count"

    .prologue
    const/4 v0, 0x0

    .line 78
    invoke-direct {p0}, Landroid/renderscript/Script$FieldBase;-><init>()V

    .line 79
    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 80
    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 81
    invoke-static {p1}, Lcom/android/ex/carousel/ScriptField_Card;->createElement(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mElement:Landroid/renderscript/Element;

    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/android/ex/carousel/ScriptField_Card;->init(Landroid/renderscript/RenderScript;I)V

    .line 83
    return-void
.end method

.method public constructor <init>(Landroid/renderscript/RenderScript;II)V
    .locals 1
    .parameter "rs"
    .parameter "count"
    .parameter "usages"

    .prologue
    const/4 v0, 0x0

    .line 85
    invoke-direct {p0}, Landroid/renderscript/Script$FieldBase;-><init>()V

    .line 86
    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 87
    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 88
    invoke-static {p1}, Lcom/android/ex/carousel/ScriptField_Card;->createElement(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mElement:Landroid/renderscript/Element;

    .line 89
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/ex/carousel/ScriptField_Card;->init(Landroid/renderscript/RenderScript;II)V

    .line 90
    return-void
.end method

.method private copyToArray(Lcom/android/ex/carousel/ScriptField_Card$Item;I)V
    .locals 2
    .parameter "i"
    .parameter "index"

    .prologue
    .line 155
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v0, :cond_0

    new-instance v0, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    mul-int/lit16 v1, v1, 0xa0

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 156
    :cond_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit16 v1, p2, 0xa0

    invoke-virtual {v0, v1}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 157
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-direct {p0, p1, v0}, Lcom/android/ex/carousel/ScriptField_Card;->copyToArrayLocal(Lcom/android/ex/carousel/ScriptField_Card$Item;Landroid/renderscript/FieldPacker;)V

    .line 158
    return-void
.end method

.method private copyToArrayLocal(Lcom/android/ex/carousel/ScriptField_Card$Item;Landroid/renderscript/FieldPacker;)V
    .locals 3
    .parameter "i"
    .parameter "fp"

    .prologue
    .line 132
    iget-object v1, p1, Lcom/android/ex/carousel/ScriptField_Card$Item;->texture:Landroid/renderscript/Allocation;

    invoke-virtual {p2, v1}, Landroid/renderscript/FieldPacker;->addObj(Landroid/renderscript/BaseObj;)V

    .line 133
    iget-object v1, p1, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTexture:Landroid/renderscript/Allocation;

    invoke-virtual {p2, v1}, Landroid/renderscript/FieldPacker;->addObj(Landroid/renderscript/BaseObj;)V

    .line 134
    iget-object v1, p1, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTextureOffset:Landroid/renderscript/Float2;

    invoke-virtual {p2, v1}, Landroid/renderscript/FieldPacker;->addF32(Landroid/renderscript/Float2;)V

    .line 135
    iget-object v1, p1, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailLineOffset:Landroid/renderscript/Float2;

    invoke-virtual {p2, v1}, Landroid/renderscript/FieldPacker;->addF32(Landroid/renderscript/Float2;)V

    .line 136
    const/4 v0, 0x0

    .local v0, ct2:I
    :goto_0
    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 137
    iget-object v1, p1, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTexturePosition:[Landroid/renderscript/Float2;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Landroid/renderscript/FieldPacker;->addF32(Landroid/renderscript/Float2;)V

    .line 136
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 140
    :cond_0
    iget-object v1, p1, Lcom/android/ex/carousel/ScriptField_Card$Item;->geometry:Landroid/renderscript/Mesh;

    invoke-virtual {p2, v1}, Landroid/renderscript/FieldPacker;->addObj(Landroid/renderscript/BaseObj;)V

    .line 141
    iget-object v1, p1, Lcom/android/ex/carousel/ScriptField_Card$Item;->matrix:Landroid/renderscript/Matrix4f;

    invoke-virtual {p2, v1}, Landroid/renderscript/FieldPacker;->addMatrix(Landroid/renderscript/Matrix4f;)V

    .line 142
    iget v1, p1, Lcom/android/ex/carousel/ScriptField_Card$Item;->textureState:I

    invoke-virtual {p2, v1}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 143
    iget v1, p1, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTextureState:I

    invoke-virtual {p2, v1}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 144
    iget v1, p1, Lcom/android/ex/carousel/ScriptField_Card$Item;->geometryState:I

    invoke-virtual {p2, v1}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 145
    iget v1, p1, Lcom/android/ex/carousel/ScriptField_Card$Item;->cardVisible:I

    invoke-virtual {p2, v1}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 146
    iget v1, p1, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailVisible:I

    invoke-virtual {p2, v1}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 147
    iget v1, p1, Lcom/android/ex/carousel/ScriptField_Card$Item;->shouldPrefetch:I

    invoke-virtual {p2, v1}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 148
    const/4 v1, 0x4

    invoke-virtual {p2, v1}, Landroid/renderscript/FieldPacker;->skip(I)V

    .line 149
    iget-wide v1, p1, Lcom/android/ex/carousel/ScriptField_Card$Item;->textureTimeStamp:J

    invoke-virtual {p2, v1, v2}, Landroid/renderscript/FieldPacker;->addI64(J)V

    .line 150
    iget-wide v1, p1, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTextureTimeStamp:J

    invoke-virtual {p2, v1, v2}, Landroid/renderscript/FieldPacker;->addI64(J)V

    .line 151
    iget-wide v1, p1, Lcom/android/ex/carousel/ScriptField_Card$Item;->geometryTimeStamp:J

    invoke-virtual {p2, v1, v2}, Landroid/renderscript/FieldPacker;->addI64(J)V

    .line 152
    return-void
.end method

.method public static create1D(Landroid/renderscript/RenderScript;I)Lcom/android/ex/carousel/ScriptField_Card;
    .locals 1
    .parameter "rs"
    .parameter "dimX"

    .prologue
    .line 99
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/android/ex/carousel/ScriptField_Card;->create1D(Landroid/renderscript/RenderScript;II)Lcom/android/ex/carousel/ScriptField_Card;

    move-result-object v0

    return-object v0
.end method

.method public static create1D(Landroid/renderscript/RenderScript;II)Lcom/android/ex/carousel/ScriptField_Card;
    .locals 2
    .parameter "rs"
    .parameter "dimX"
    .parameter "usages"

    .prologue
    .line 93
    new-instance v0, Lcom/android/ex/carousel/ScriptField_Card;

    invoke-direct {v0, p0}, Lcom/android/ex/carousel/ScriptField_Card;-><init>(Landroid/renderscript/RenderScript;)V

    .line 94
    .local v0, obj:Lcom/android/ex/carousel/ScriptField_Card;
    iget-object v1, v0, Lcom/android/ex/carousel/ScriptField_Card;->mElement:Landroid/renderscript/Element;

    invoke-static {p0, v1, p1, p2}, Landroid/renderscript/Allocation;->createSized(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;II)Landroid/renderscript/Allocation;

    move-result-object v1

    iput-object v1, v0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    .line 95
    return-object v0
.end method

.method public static create2D(Landroid/renderscript/RenderScript;II)Lcom/android/ex/carousel/ScriptField_Card;
    .locals 1
    .parameter "rs"
    .parameter "dimX"
    .parameter "dimY"

    .prologue
    .line 103
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lcom/android/ex/carousel/ScriptField_Card;->create2D(Landroid/renderscript/RenderScript;III)Lcom/android/ex/carousel/ScriptField_Card;

    move-result-object v0

    return-object v0
.end method

.method public static create2D(Landroid/renderscript/RenderScript;III)Lcom/android/ex/carousel/ScriptField_Card;
    .locals 4
    .parameter "rs"
    .parameter "dimX"
    .parameter "dimY"
    .parameter "usages"

    .prologue
    .line 107
    new-instance v1, Lcom/android/ex/carousel/ScriptField_Card;

    invoke-direct {v1, p0}, Lcom/android/ex/carousel/ScriptField_Card;-><init>(Landroid/renderscript/RenderScript;)V

    .line 108
    .local v1, obj:Lcom/android/ex/carousel/ScriptField_Card;
    new-instance v0, Landroid/renderscript/Type$Builder;

    iget-object v3, v1, Lcom/android/ex/carousel/ScriptField_Card;->mElement:Landroid/renderscript/Element;

    invoke-direct {v0, p0, v3}, Landroid/renderscript/Type$Builder;-><init>(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)V

    .line 109
    .local v0, b:Landroid/renderscript/Type$Builder;
    invoke-virtual {v0, p1}, Landroid/renderscript/Type$Builder;->setX(I)Landroid/renderscript/Type$Builder;

    .line 110
    invoke-virtual {v0, p2}, Landroid/renderscript/Type$Builder;->setY(I)Landroid/renderscript/Type$Builder;

    .line 111
    invoke-virtual {v0}, Landroid/renderscript/Type$Builder;->create()Landroid/renderscript/Type;

    move-result-object v2

    .line 112
    .local v2, t:Landroid/renderscript/Type;
    invoke-static {p0, v2, p3}, Landroid/renderscript/Allocation;->createTyped(Landroid/renderscript/RenderScript;Landroid/renderscript/Type;I)Landroid/renderscript/Allocation;

    move-result-object v3

    iput-object v3, v1, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    .line 113
    return-object v1
.end method

.method public static createCustom(Landroid/renderscript/RenderScript;Landroid/renderscript/Type$Builder;I)Lcom/android/ex/carousel/ScriptField_Card;
    .locals 4
    .parameter "rs"
    .parameter "tb"
    .parameter "usages"

    .prologue
    .line 122
    new-instance v0, Lcom/android/ex/carousel/ScriptField_Card;

    invoke-direct {v0, p0}, Lcom/android/ex/carousel/ScriptField_Card;-><init>(Landroid/renderscript/RenderScript;)V

    .line 123
    .local v0, obj:Lcom/android/ex/carousel/ScriptField_Card;
    invoke-virtual {p1}, Landroid/renderscript/Type$Builder;->create()Landroid/renderscript/Type;

    move-result-object v1

    .line 124
    .local v1, t:Landroid/renderscript/Type;
    invoke-virtual {v1}, Landroid/renderscript/Type;->getElement()Landroid/renderscript/Element;

    move-result-object v2

    iget-object v3, v0, Lcom/android/ex/carousel/ScriptField_Card;->mElement:Landroid/renderscript/Element;

    if-eq v2, v3, :cond_0

    .line 125
    new-instance v2, Landroid/renderscript/RSIllegalArgumentException;

    const-string v3, "Type.Builder did not match expected element type."

    invoke-direct {v2, v3}, Landroid/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 127
    :cond_0
    invoke-static {p0, v1, p2}, Landroid/renderscript/Allocation;->createTyped(Landroid/renderscript/RenderScript;Landroid/renderscript/Type;I)Landroid/renderscript/Allocation;

    move-result-object v2

    iput-object v2, v0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    .line 128
    return-object v0
.end method

.method public static createElement(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;
    .locals 4
    .parameter "rs"

    .prologue
    .line 51
    new-instance v0, Landroid/renderscript/Element$Builder;

    invoke-direct {v0, p0}, Landroid/renderscript/Element$Builder;-><init>(Landroid/renderscript/RenderScript;)V

    .line 52
    .local v0, eb:Landroid/renderscript/Element$Builder;
    invoke-static {p0}, Landroid/renderscript/Element;->ALLOCATION(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "texture"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 53
    invoke-static {p0}, Landroid/renderscript/Element;->ALLOCATION(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "detailTexture"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 54
    invoke-static {p0}, Landroid/renderscript/Element;->F32_2(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "detailTextureOffset"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 55
    invoke-static {p0}, Landroid/renderscript/Element;->F32_2(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "detailLineOffset"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 56
    invoke-static {p0}, Landroid/renderscript/Element;->F32_2(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "detailTexturePosition"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;I)Landroid/renderscript/Element$Builder;

    .line 57
    invoke-static {p0}, Landroid/renderscript/Element;->MESH(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "geometry"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 58
    invoke-static {p0}, Landroid/renderscript/Element;->MATRIX_4X4(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "matrix"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 59
    invoke-static {p0}, Landroid/renderscript/Element;->I32(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "textureState"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 60
    invoke-static {p0}, Landroid/renderscript/Element;->I32(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "detailTextureState"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 61
    invoke-static {p0}, Landroid/renderscript/Element;->I32(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "geometryState"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 62
    invoke-static {p0}, Landroid/renderscript/Element;->I32(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "cardVisible"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 63
    invoke-static {p0}, Landroid/renderscript/Element;->I32(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "detailVisible"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 64
    invoke-static {p0}, Landroid/renderscript/Element;->I32(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "shouldPrefetch"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 65
    invoke-static {p0}, Landroid/renderscript/Element;->U32(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "#rs_padding_1"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 66
    invoke-static {p0}, Landroid/renderscript/Element;->I64(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "textureTimeStamp"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 67
    invoke-static {p0}, Landroid/renderscript/Element;->I64(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "detailTextureTimeStamp"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 68
    invoke-static {p0}, Landroid/renderscript/Element;->I64(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "geometryTimeStamp"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 69
    invoke-virtual {v0}, Landroid/renderscript/Element$Builder;->create()Landroid/renderscript/Element;

    move-result-object v1

    return-object v1
.end method

.method public static createTypeBuilder(Landroid/renderscript/RenderScript;)Landroid/renderscript/Type$Builder;
    .locals 2
    .parameter "rs"

    .prologue
    .line 117
    invoke-static {p0}, Lcom/android/ex/carousel/ScriptField_Card;->createElement(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    .line 118
    .local v0, e:Landroid/renderscript/Element;
    new-instance v1, Landroid/renderscript/Type$Builder;

    invoke-direct {v1, p0, v0}, Landroid/renderscript/Type$Builder;-><init>(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)V

    return-object v1
.end method


# virtual methods
.method public declared-synchronized copyAll()V
    .locals 4

    .prologue
    .line 504
    monitor-enter p0

    const/4 v0, 0x0

    .local v0, ct:I
    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, v0

    invoke-direct {p0, v1, v0}, Lcom/android/ex/carousel/ScriptField_Card;->copyToArray(Lcom/android/ex/carousel/ScriptField_Card$Item;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 505
    :cond_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, v2, v3}, Landroid/renderscript/Allocation;->setFromFieldPacker(ILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 506
    monitor-exit p0

    return-void

    .line 504
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized get(I)Lcom/android/ex/carousel/ScriptField_Card$Item;
    .locals 1
    .parameter "index"

    .prologue
    .line 173
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 174
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v0, v0, p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 173
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_cardVisible(I)I
    .locals 1
    .parameter "index"

    .prologue
    .line 474
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 475
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v0, v0, p1

    iget v0, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->cardVisible:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 474
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_detailLineOffset(I)Landroid/renderscript/Float2;
    .locals 1
    .parameter "index"

    .prologue
    .line 439
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 440
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailLineOffset:Landroid/renderscript/Float2;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 439
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_detailTexture(I)Landroid/renderscript/Allocation;
    .locals 1
    .parameter "index"

    .prologue
    .line 429
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 430
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTexture:Landroid/renderscript/Allocation;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 429
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_detailTextureOffset(I)Landroid/renderscript/Float2;
    .locals 1
    .parameter "index"

    .prologue
    .line 434
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 435
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTextureOffset:Landroid/renderscript/Float2;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 434
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_detailTexturePosition(I)[Landroid/renderscript/Float2;
    .locals 1
    .parameter "index"

    .prologue
    .line 444
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 445
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTexturePosition:[Landroid/renderscript/Float2;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 444
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_detailTextureState(I)I
    .locals 1
    .parameter "index"

    .prologue
    .line 464
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 465
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v0, v0, p1

    iget v0, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTextureState:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 464
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_detailTextureTimeStamp(I)J
    .locals 2
    .parameter "index"

    .prologue
    .line 494
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    .line 495
    :goto_0
    monitor-exit p0

    return-wide v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v0, v0, p1

    iget-wide v0, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTextureTimeStamp:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 494
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_detailVisible(I)I
    .locals 1
    .parameter "index"

    .prologue
    .line 479
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 480
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v0, v0, p1

    iget v0, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailVisible:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 479
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_geometry(I)Landroid/renderscript/Mesh;
    .locals 1
    .parameter "index"

    .prologue
    .line 449
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 450
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->geometry:Landroid/renderscript/Mesh;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 449
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_geometryState(I)I
    .locals 1
    .parameter "index"

    .prologue
    .line 469
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 470
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v0, v0, p1

    iget v0, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->geometryState:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 469
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_geometryTimeStamp(I)J
    .locals 2
    .parameter "index"

    .prologue
    .line 499
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    .line 500
    :goto_0
    monitor-exit p0

    return-wide v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v0, v0, p1

    iget-wide v0, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->geometryTimeStamp:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 499
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_matrix(I)Landroid/renderscript/Matrix4f;
    .locals 1
    .parameter "index"

    .prologue
    .line 454
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 455
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->matrix:Landroid/renderscript/Matrix4f;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 454
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_shouldPrefetch(I)I
    .locals 1
    .parameter "index"

    .prologue
    .line 484
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 485
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v0, v0, p1

    iget v0, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->shouldPrefetch:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 484
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_texture(I)Landroid/renderscript/Allocation;
    .locals 1
    .parameter "index"

    .prologue
    .line 424
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 425
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->texture:Landroid/renderscript/Allocation;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 424
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_textureState(I)I
    .locals 1
    .parameter "index"

    .prologue
    .line 459
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 460
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v0, v0, p1

    iget v0, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->textureState:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 459
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_textureTimeStamp(I)J
    .locals 2
    .parameter "index"

    .prologue
    .line 489
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    .line 490
    :goto_0
    monitor-exit p0

    return-wide v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v0, v0, p1

    iget-wide v0, v0, Lcom/android/ex/carousel/ScriptField_Card$Item;->textureTimeStamp:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 489
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized resize(I)V
    .locals 6
    .parameter "newSize"

    .prologue
    .line 509
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-eqz v3, :cond_2

    .line 510
    iget-object v3, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    array-length v2, v3

    .line 511
    .local v2, oldSize:I
    invoke-static {v2, p1}, Ljava/lang/Math;->min(II)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 512
    .local v0, copySize:I
    if-ne p1, v2, :cond_1

    .line 520
    .end local v0           #copySize:I
    .end local v2           #oldSize:I
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 513
    .restart local v0       #copySize:I
    .restart local v2       #oldSize:I
    :cond_1
    :try_start_1
    new-array v1, p1, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 514
    .local v1, ni:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    iget-object v3, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v3, v4, v1, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 515
    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 518
    .end local v0           #copySize:I
    .end local v1           #ni:[Lcom/android/ex/carousel/ScriptField_Card$Item;
    .end local v2           #oldSize:I
    :cond_2
    iget-object v3, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    invoke-virtual {v3, p1}, Landroid/renderscript/Allocation;->resize(I)V

    .line 519
    iget-object v3, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-eqz v3, :cond_0

    new-instance v3, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v4

    invoke-virtual {v4}, Landroid/renderscript/Type;->getX()I

    move-result v4

    mul-int/lit16 v4, v4, 0xa0

    invoke-direct {v3, v4}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v3, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 509
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized set(Lcom/android/ex/carousel/ScriptField_Card$Item;IZ)V
    .locals 2
    .parameter "i"
    .parameter "index"
    .parameter "copyNow"

    .prologue
    .line 161
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 162
    :cond_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aput-object p1, v1, p2

    .line 163
    if-eqz p3, :cond_1

    .line 164
    invoke-direct {p0, p1, p2}, Lcom/android/ex/carousel/ScriptField_Card;->copyToArray(Lcom/android/ex/carousel/ScriptField_Card$Item;I)V

    .line 165
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0xa0

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 166
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-direct {p0, p1, v0}, Lcom/android/ex/carousel/ScriptField_Card;->copyToArrayLocal(Lcom/android/ex/carousel/ScriptField_Card$Item;Landroid/renderscript/FieldPacker;)V

    .line 167
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    invoke-virtual {v1, p2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(ILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_1
    monitor-exit p0

    return-void

    .line 161
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_cardVisible(IIZ)V
    .locals 3
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    .line 334
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v1, :cond_0

    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    mul-int/lit16 v2, v2, 0xa0

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 335
    :cond_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 336
    :cond_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    new-instance v2, Lcom/android/ex/carousel/ScriptField_Card$Item;

    invoke-direct {v2}, Lcom/android/ex/carousel/ScriptField_Card$Item;-><init>()V

    aput-object v2, v1, p1

    .line 337
    :cond_2
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    iput p2, v1, Lcom/android/ex/carousel/ScriptField_Card$Item;->cardVisible:I

    .line 338
    if-eqz p3, :cond_3

    .line 339
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit16 v2, p1, 0xa0

    add-int/lit8 v2, v2, 0x78

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 340
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, p2}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 341
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 342
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 343
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    const/16 v2, 0xa

    invoke-virtual {v1, p1, v2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 346
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_3
    monitor-exit p0

    return-void

    .line 334
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_detailLineOffset(ILandroid/renderscript/Float2;Z)V
    .locals 3
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    .line 223
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v1, :cond_0

    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    mul-int/lit16 v2, v2, 0xa0

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 224
    :cond_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 225
    :cond_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    new-instance v2, Lcom/android/ex/carousel/ScriptField_Card$Item;

    invoke-direct {v2}, Lcom/android/ex/carousel/ScriptField_Card$Item;-><init>()V

    aput-object v2, v1, p1

    .line 226
    :cond_2
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    iput-object p2, v1, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailLineOffset:Landroid/renderscript/Float2;

    .line 227
    if-eqz p3, :cond_3

    .line 228
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit16 v2, p1, 0xa0

    add-int/lit8 v2, v2, 0x10

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 229
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, p2}, Landroid/renderscript/FieldPacker;->addF32(Landroid/renderscript/Float2;)V

    .line 230
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 231
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addF32(Landroid/renderscript/Float2;)V

    .line 232
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    const/4 v2, 0x3

    invoke-virtual {v1, p1, v2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 235
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_3
    monitor-exit p0

    return-void

    .line 223
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_detailTexture(ILandroid/renderscript/Allocation;Z)V
    .locals 3
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    .line 193
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v1, :cond_0

    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    mul-int/lit16 v2, v2, 0xa0

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 194
    :cond_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 195
    :cond_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    new-instance v2, Lcom/android/ex/carousel/ScriptField_Card$Item;

    invoke-direct {v2}, Lcom/android/ex/carousel/ScriptField_Card$Item;-><init>()V

    aput-object v2, v1, p1

    .line 196
    :cond_2
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    iput-object p2, v1, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTexture:Landroid/renderscript/Allocation;

    .line 197
    if-eqz p3, :cond_3

    .line 198
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit16 v2, p1, 0xa0

    add-int/lit8 v2, v2, 0x4

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 199
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, p2}, Landroid/renderscript/FieldPacker;->addObj(Landroid/renderscript/BaseObj;)V

    .line 200
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 201
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addObj(Landroid/renderscript/BaseObj;)V

    .line 202
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 205
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_3
    monitor-exit p0

    return-void

    .line 193
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_detailTextureOffset(ILandroid/renderscript/Float2;Z)V
    .locals 3
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    .line 208
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v1, :cond_0

    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    mul-int/lit16 v2, v2, 0xa0

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 209
    :cond_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 210
    :cond_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    new-instance v2, Lcom/android/ex/carousel/ScriptField_Card$Item;

    invoke-direct {v2}, Lcom/android/ex/carousel/ScriptField_Card$Item;-><init>()V

    aput-object v2, v1, p1

    .line 211
    :cond_2
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    iput-object p2, v1, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTextureOffset:Landroid/renderscript/Float2;

    .line 212
    if-eqz p3, :cond_3

    .line 213
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit16 v2, p1, 0xa0

    add-int/lit8 v2, v2, 0x8

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 214
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, p2}, Landroid/renderscript/FieldPacker;->addF32(Landroid/renderscript/Float2;)V

    .line 215
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 216
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addF32(Landroid/renderscript/Float2;)V

    .line 217
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    const/4 v2, 0x2

    invoke-virtual {v1, p1, v2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 220
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_3
    monitor-exit p0

    return-void

    .line 208
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_detailTexturePosition(I[Landroid/renderscript/Float2;Z)V
    .locals 5
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    const/4 v4, 0x2

    .line 238
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v2, :cond_0

    new-instance v2, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v3

    invoke-virtual {v3}, Landroid/renderscript/Type;->getX()I

    move-result v3

    mul-int/lit16 v3, v3, 0xa0

    invoke-direct {v2, v3}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v2, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 239
    :cond_0
    iget-object v2, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-nez v2, :cond_1

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    new-array v2, v2, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    iput-object v2, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 240
    :cond_1
    iget-object v2, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v2, v2, p1

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    new-instance v3, Lcom/android/ex/carousel/ScriptField_Card$Item;

    invoke-direct {v3}, Lcom/android/ex/carousel/ScriptField_Card$Item;-><init>()V

    aput-object v3, v2, p1

    .line 241
    :cond_2
    iget-object v2, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v2, v2, p1

    iput-object p2, v2, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTexturePosition:[Landroid/renderscript/Float2;

    .line 242
    if-eqz p3, :cond_5

    .line 243
    iget-object v2, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit16 v3, p1, 0xa0

    add-int/lit8 v3, v3, 0x18

    invoke-virtual {v2, v3}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 244
    const/4 v0, 0x0

    .local v0, ct1:I
    :goto_0
    if-ge v0, v4, :cond_3

    .line 245
    iget-object v2, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    aget-object v3, p2, v0

    invoke-virtual {v2, v3}, Landroid/renderscript/FieldPacker;->addF32(Landroid/renderscript/Float2;)V

    .line 244
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 248
    :cond_3
    new-instance v1, Landroid/renderscript/FieldPacker;

    const/16 v2, 0x10

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 249
    .local v1, fp:Landroid/renderscript/FieldPacker;
    const/4 v0, 0x0

    :goto_1
    if-ge v0, v4, :cond_4

    .line 250
    aget-object v2, p2, v0

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->addF32(Landroid/renderscript/Float2;)V

    .line 249
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 253
    :cond_4
    iget-object v2, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    const/4 v3, 0x4

    invoke-virtual {v2, p1, v3, v1}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 256
    .end local v0           #ct1:I
    .end local v1           #fp:Landroid/renderscript/FieldPacker;
    :cond_5
    monitor-exit p0

    return-void

    .line 238
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized set_detailTextureState(IIZ)V
    .locals 3
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    .line 304
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v1, :cond_0

    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    mul-int/lit16 v2, v2, 0xa0

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 305
    :cond_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 306
    :cond_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    new-instance v2, Lcom/android/ex/carousel/ScriptField_Card$Item;

    invoke-direct {v2}, Lcom/android/ex/carousel/ScriptField_Card$Item;-><init>()V

    aput-object v2, v1, p1

    .line 307
    :cond_2
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    iput p2, v1, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTextureState:I

    .line 308
    if-eqz p3, :cond_3

    .line 309
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit16 v2, p1, 0xa0

    add-int/lit8 v2, v2, 0x70

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 310
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, p2}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 311
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 312
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 313
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    const/16 v2, 0x8

    invoke-virtual {v1, p1, v2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 316
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_3
    monitor-exit p0

    return-void

    .line 304
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_detailTextureTimeStamp(IJZ)V
    .locals 3
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    .line 394
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v1, :cond_0

    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    mul-int/lit16 v2, v2, 0xa0

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 395
    :cond_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 396
    :cond_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    new-instance v2, Lcom/android/ex/carousel/ScriptField_Card$Item;

    invoke-direct {v2}, Lcom/android/ex/carousel/ScriptField_Card$Item;-><init>()V

    aput-object v2, v1, p1

    .line 397
    :cond_2
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    iput-wide p2, v1, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailTextureTimeStamp:J

    .line 398
    if-eqz p4, :cond_3

    .line 399
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit16 v2, p1, 0xa0

    add-int/lit16 v2, v2, 0x90

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 400
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, p2, p3}, Landroid/renderscript/FieldPacker;->addI64(J)V

    .line 401
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 402
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p2, p3}, Landroid/renderscript/FieldPacker;->addI64(J)V

    .line 403
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    const/16 v2, 0xf

    invoke-virtual {v1, p1, v2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 406
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_3
    monitor-exit p0

    return-void

    .line 394
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_detailVisible(IIZ)V
    .locals 3
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    .line 349
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v1, :cond_0

    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    mul-int/lit16 v2, v2, 0xa0

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 350
    :cond_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 351
    :cond_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    new-instance v2, Lcom/android/ex/carousel/ScriptField_Card$Item;

    invoke-direct {v2}, Lcom/android/ex/carousel/ScriptField_Card$Item;-><init>()V

    aput-object v2, v1, p1

    .line 352
    :cond_2
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    iput p2, v1, Lcom/android/ex/carousel/ScriptField_Card$Item;->detailVisible:I

    .line 353
    if-eqz p3, :cond_3

    .line 354
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit16 v2, p1, 0xa0

    add-int/lit8 v2, v2, 0x7c

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 355
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, p2}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 356
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 357
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 358
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    const/16 v2, 0xb

    invoke-virtual {v1, p1, v2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 361
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_3
    monitor-exit p0

    return-void

    .line 349
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_geometry(ILandroid/renderscript/Mesh;Z)V
    .locals 3
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    .line 259
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v1, :cond_0

    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    mul-int/lit16 v2, v2, 0xa0

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 260
    :cond_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 261
    :cond_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    new-instance v2, Lcom/android/ex/carousel/ScriptField_Card$Item;

    invoke-direct {v2}, Lcom/android/ex/carousel/ScriptField_Card$Item;-><init>()V

    aput-object v2, v1, p1

    .line 262
    :cond_2
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    iput-object p2, v1, Lcom/android/ex/carousel/ScriptField_Card$Item;->geometry:Landroid/renderscript/Mesh;

    .line 263
    if-eqz p3, :cond_3

    .line 264
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit16 v2, p1, 0xa0

    add-int/lit8 v2, v2, 0x28

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 265
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, p2}, Landroid/renderscript/FieldPacker;->addObj(Landroid/renderscript/BaseObj;)V

    .line 266
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 267
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addObj(Landroid/renderscript/BaseObj;)V

    .line 268
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    const/4 v2, 0x5

    invoke-virtual {v1, p1, v2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 271
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_3
    monitor-exit p0

    return-void

    .line 259
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_geometryState(IIZ)V
    .locals 3
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    .line 319
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v1, :cond_0

    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    mul-int/lit16 v2, v2, 0xa0

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 320
    :cond_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 321
    :cond_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    new-instance v2, Lcom/android/ex/carousel/ScriptField_Card$Item;

    invoke-direct {v2}, Lcom/android/ex/carousel/ScriptField_Card$Item;-><init>()V

    aput-object v2, v1, p1

    .line 322
    :cond_2
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    iput p2, v1, Lcom/android/ex/carousel/ScriptField_Card$Item;->geometryState:I

    .line 323
    if-eqz p3, :cond_3

    .line 324
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit16 v2, p1, 0xa0

    add-int/lit8 v2, v2, 0x74

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 325
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, p2}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 326
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 327
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 328
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    const/16 v2, 0x9

    invoke-virtual {v1, p1, v2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 331
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_3
    monitor-exit p0

    return-void

    .line 319
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_geometryTimeStamp(IJZ)V
    .locals 3
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    .line 409
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v1, :cond_0

    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    mul-int/lit16 v2, v2, 0xa0

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 410
    :cond_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 411
    :cond_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    new-instance v2, Lcom/android/ex/carousel/ScriptField_Card$Item;

    invoke-direct {v2}, Lcom/android/ex/carousel/ScriptField_Card$Item;-><init>()V

    aput-object v2, v1, p1

    .line 412
    :cond_2
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    iput-wide p2, v1, Lcom/android/ex/carousel/ScriptField_Card$Item;->geometryTimeStamp:J

    .line 413
    if-eqz p4, :cond_3

    .line 414
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit16 v2, p1, 0xa0

    add-int/lit16 v2, v2, 0x98

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 415
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, p2, p3}, Landroid/renderscript/FieldPacker;->addI64(J)V

    .line 416
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 417
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p2, p3}, Landroid/renderscript/FieldPacker;->addI64(J)V

    .line 418
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    const/16 v2, 0x10

    invoke-virtual {v1, p1, v2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 421
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_3
    monitor-exit p0

    return-void

    .line 409
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_matrix(ILandroid/renderscript/Matrix4f;Z)V
    .locals 3
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    .line 274
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v1, :cond_0

    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    mul-int/lit16 v2, v2, 0xa0

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 275
    :cond_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 276
    :cond_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    new-instance v2, Lcom/android/ex/carousel/ScriptField_Card$Item;

    invoke-direct {v2}, Lcom/android/ex/carousel/ScriptField_Card$Item;-><init>()V

    aput-object v2, v1, p1

    .line 277
    :cond_2
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    iput-object p2, v1, Lcom/android/ex/carousel/ScriptField_Card$Item;->matrix:Landroid/renderscript/Matrix4f;

    .line 278
    if-eqz p3, :cond_3

    .line 279
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit16 v2, p1, 0xa0

    add-int/lit8 v2, v2, 0x2c

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 280
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, p2}, Landroid/renderscript/FieldPacker;->addMatrix(Landroid/renderscript/Matrix4f;)V

    .line 281
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 282
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addMatrix(Landroid/renderscript/Matrix4f;)V

    .line 283
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    const/4 v2, 0x6

    invoke-virtual {v1, p1, v2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 286
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_3
    monitor-exit p0

    return-void

    .line 274
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_shouldPrefetch(IIZ)V
    .locals 3
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    .line 364
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v1, :cond_0

    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    mul-int/lit16 v2, v2, 0xa0

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 365
    :cond_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 366
    :cond_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    new-instance v2, Lcom/android/ex/carousel/ScriptField_Card$Item;

    invoke-direct {v2}, Lcom/android/ex/carousel/ScriptField_Card$Item;-><init>()V

    aput-object v2, v1, p1

    .line 367
    :cond_2
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    iput p2, v1, Lcom/android/ex/carousel/ScriptField_Card$Item;->shouldPrefetch:I

    .line 368
    if-eqz p3, :cond_3

    .line 369
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit16 v2, p1, 0xa0

    add-int/lit16 v2, v2, 0x80

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 370
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, p2}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 371
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 372
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 373
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    const/16 v2, 0xc

    invoke-virtual {v1, p1, v2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 376
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_3
    monitor-exit p0

    return-void

    .line 364
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_texture(ILandroid/renderscript/Allocation;Z)V
    .locals 3
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    .line 178
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v1, :cond_0

    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    mul-int/lit16 v2, v2, 0xa0

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 179
    :cond_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 180
    :cond_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    new-instance v2, Lcom/android/ex/carousel/ScriptField_Card$Item;

    invoke-direct {v2}, Lcom/android/ex/carousel/ScriptField_Card$Item;-><init>()V

    aput-object v2, v1, p1

    .line 181
    :cond_2
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    iput-object p2, v1, Lcom/android/ex/carousel/ScriptField_Card$Item;->texture:Landroid/renderscript/Allocation;

    .line 182
    if-eqz p3, :cond_3

    .line 183
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit16 v2, p1, 0xa0

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 184
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, p2}, Landroid/renderscript/FieldPacker;->addObj(Landroid/renderscript/BaseObj;)V

    .line 185
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 186
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addObj(Landroid/renderscript/BaseObj;)V

    .line 187
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 190
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_3
    monitor-exit p0

    return-void

    .line 178
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_textureState(IIZ)V
    .locals 3
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    .line 289
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v1, :cond_0

    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    mul-int/lit16 v2, v2, 0xa0

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 290
    :cond_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 291
    :cond_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    new-instance v2, Lcom/android/ex/carousel/ScriptField_Card$Item;

    invoke-direct {v2}, Lcom/android/ex/carousel/ScriptField_Card$Item;-><init>()V

    aput-object v2, v1, p1

    .line 292
    :cond_2
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    iput p2, v1, Lcom/android/ex/carousel/ScriptField_Card$Item;->textureState:I

    .line 293
    if-eqz p3, :cond_3

    .line 294
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit16 v2, p1, 0xa0

    add-int/lit8 v2, v2, 0x6c

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 295
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, p2}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 296
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 297
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addI32(I)V

    .line 298
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    const/4 v2, 0x7

    invoke-virtual {v1, p1, v2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 301
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_3
    monitor-exit p0

    return-void

    .line 289
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_textureTimeStamp(IJZ)V
    .locals 3
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    .line 379
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v1, :cond_0

    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    mul-int/lit16 v2, v2, 0xa0

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 380
    :cond_0
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_Card;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_Card$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    .line 381
    :cond_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    new-instance v2, Lcom/android/ex/carousel/ScriptField_Card$Item;

    invoke-direct {v2}, Lcom/android/ex/carousel/ScriptField_Card$Item;-><init>()V

    aput-object v2, v1, p1

    .line 382
    :cond_2
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mItemArray:[Lcom/android/ex/carousel/ScriptField_Card$Item;

    aget-object v1, v1, p1

    iput-wide p2, v1, Lcom/android/ex/carousel/ScriptField_Card$Item;->textureTimeStamp:J

    .line 383
    if-eqz p4, :cond_3

    .line 384
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit16 v2, p1, 0xa0

    add-int/lit16 v2, v2, 0x88

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 385
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, p2, p3}, Landroid/renderscript/FieldPacker;->addI64(J)V

    .line 386
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 387
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p2, p3}, Landroid/renderscript/FieldPacker;->addI64(J)V

    .line 388
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_Card;->mAllocation:Landroid/renderscript/Allocation;

    const/16 v2, 0xe

    invoke-virtual {v1, p1, v2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 391
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_3
    monitor-exit p0

    return-void

    .line 379
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
