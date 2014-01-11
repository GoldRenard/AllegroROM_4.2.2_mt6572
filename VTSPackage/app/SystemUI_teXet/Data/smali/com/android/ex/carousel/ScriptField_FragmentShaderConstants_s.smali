.class public Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;
.super Landroid/renderscript/Script$FieldBase;
.source "ScriptField_FragmentShaderConstants_s.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;
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

.field private mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 27
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mElementCache:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private constructor <init>(Landroid/renderscript/RenderScript;)V
    .registers 3
    .parameter "rs"

    .prologue
    const/4 v0, 0x0

    .line 35
    invoke-direct {p0}, Landroid/renderscript/Script$FieldBase;-><init>()V

    .line 36
    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    .line 37
    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 38
    invoke-static {p1}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->createElement(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mElement:Landroid/renderscript/Element;

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/renderscript/RenderScript;I)V
    .registers 4
    .parameter "rs"
    .parameter "count"

    .prologue
    const/4 v0, 0x0

    .line 41
    invoke-direct {p0}, Landroid/renderscript/Script$FieldBase;-><init>()V

    .line 42
    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    .line 43
    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 44
    invoke-static {p1}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->createElement(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mElement:Landroid/renderscript/Element;

    .line 45
    invoke-virtual {p0, p1, p2}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->init(Landroid/renderscript/RenderScript;I)V

    .line 46
    return-void
.end method

.method public constructor <init>(Landroid/renderscript/RenderScript;II)V
    .registers 5
    .parameter "rs"
    .parameter "count"
    .parameter "usages"

    .prologue
    const/4 v0, 0x0

    .line 48
    invoke-direct {p0}, Landroid/renderscript/Script$FieldBase;-><init>()V

    .line 49
    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    .line 50
    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 51
    invoke-static {p1}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->createElement(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mElement:Landroid/renderscript/Element;

    .line 52
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->init(Landroid/renderscript/RenderScript;II)V

    .line 53
    return-void
.end method

.method private copyToArray(Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;I)V
    .registers 5
    .parameter "i"
    .parameter "index"

    .prologue
    .line 100
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v0, :cond_15

    new-instance v0, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    mul-int/lit8 v1, v1, 0x8

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 101
    :cond_15
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit8 v1, p2, 0x8

    invoke-virtual {v0, v1}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 102
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-direct {p0, p1, v0}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->copyToArrayLocal(Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;Landroid/renderscript/FieldPacker;)V

    .line 103
    return-void
.end method

.method private copyToArrayLocal(Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;Landroid/renderscript/FieldPacker;)V
    .registers 4
    .parameter "i"
    .parameter "fp"

    .prologue
    .line 95
    iget v0, p1, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;->fadeAmount:F

    invoke-virtual {p2, v0}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 96
    iget v0, p1, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;->overallAlpha:F

    invoke-virtual {p2, v0}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 97
    return-void
.end method

.method public static create1D(Landroid/renderscript/RenderScript;I)Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;
    .registers 3
    .parameter "rs"
    .parameter "dimX"

    .prologue
    .line 62
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->create1D(Landroid/renderscript/RenderScript;II)Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

    move-result-object v0

    return-object v0
.end method

.method public static create1D(Landroid/renderscript/RenderScript;II)Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;
    .registers 5
    .parameter "rs"
    .parameter "dimX"
    .parameter "usages"

    .prologue
    .line 56
    new-instance v0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

    invoke-direct {v0, p0}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;-><init>(Landroid/renderscript/RenderScript;)V

    .line 57
    .local v0, obj:Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;
    iget-object v1, v0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mElement:Landroid/renderscript/Element;

    invoke-static {p0, v1, p1, p2}, Landroid/renderscript/Allocation;->createSized(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;II)Landroid/renderscript/Allocation;

    move-result-object v1

    iput-object v1, v0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mAllocation:Landroid/renderscript/Allocation;

    .line 58
    return-object v0
.end method

.method public static create2D(Landroid/renderscript/RenderScript;II)Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;
    .registers 4
    .parameter "rs"
    .parameter "dimX"
    .parameter "dimY"

    .prologue
    .line 66
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->create2D(Landroid/renderscript/RenderScript;III)Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

    move-result-object v0

    return-object v0
.end method

.method public static create2D(Landroid/renderscript/RenderScript;III)Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;
    .registers 8
    .parameter "rs"
    .parameter "dimX"
    .parameter "dimY"
    .parameter "usages"

    .prologue
    .line 70
    new-instance v1, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

    invoke-direct {v1, p0}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;-><init>(Landroid/renderscript/RenderScript;)V

    .line 71
    .local v1, obj:Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;
    new-instance v0, Landroid/renderscript/Type$Builder;

    iget-object v3, v1, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mElement:Landroid/renderscript/Element;

    invoke-direct {v0, p0, v3}, Landroid/renderscript/Type$Builder;-><init>(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)V

    .line 72
    .local v0, b:Landroid/renderscript/Type$Builder;
    invoke-virtual {v0, p1}, Landroid/renderscript/Type$Builder;->setX(I)Landroid/renderscript/Type$Builder;

    .line 73
    invoke-virtual {v0, p2}, Landroid/renderscript/Type$Builder;->setY(I)Landroid/renderscript/Type$Builder;

    .line 74
    invoke-virtual {v0}, Landroid/renderscript/Type$Builder;->create()Landroid/renderscript/Type;

    move-result-object v2

    .line 75
    .local v2, t:Landroid/renderscript/Type;
    invoke-static {p0, v2, p3}, Landroid/renderscript/Allocation;->createTyped(Landroid/renderscript/RenderScript;Landroid/renderscript/Type;I)Landroid/renderscript/Allocation;

    move-result-object v3

    iput-object v3, v1, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mAllocation:Landroid/renderscript/Allocation;

    .line 76
    return-object v1
.end method

.method public static createCustom(Landroid/renderscript/RenderScript;Landroid/renderscript/Type$Builder;I)Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;
    .registers 7
    .parameter "rs"
    .parameter "tb"
    .parameter "usages"

    .prologue
    .line 85
    new-instance v0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;

    invoke-direct {v0, p0}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;-><init>(Landroid/renderscript/RenderScript;)V

    .line 86
    .local v0, obj:Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;
    invoke-virtual {p1}, Landroid/renderscript/Type$Builder;->create()Landroid/renderscript/Type;

    move-result-object v1

    .line 87
    .local v1, t:Landroid/renderscript/Type;
    invoke-virtual {v1}, Landroid/renderscript/Type;->getElement()Landroid/renderscript/Element;

    move-result-object v2

    iget-object v3, v0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mElement:Landroid/renderscript/Element;

    if-eq v2, v3, :cond_19

    .line 88
    new-instance v2, Landroid/renderscript/RSIllegalArgumentException;

    const-string v3, "Type.Builder did not match expected element type."

    invoke-direct {v2, v3}, Landroid/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 90
    :cond_19
    invoke-static {p0, v1, p2}, Landroid/renderscript/Allocation;->createTyped(Landroid/renderscript/RenderScript;Landroid/renderscript/Type;I)Landroid/renderscript/Allocation;

    move-result-object v2

    iput-object v2, v0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mAllocation:Landroid/renderscript/Allocation;

    .line 91
    return-object v0
.end method

.method public static createElement(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;
    .registers 4
    .parameter "rs"

    .prologue
    .line 29
    new-instance v0, Landroid/renderscript/Element$Builder;

    invoke-direct {v0, p0}, Landroid/renderscript/Element$Builder;-><init>(Landroid/renderscript/RenderScript;)V

    .line 30
    .local v0, eb:Landroid/renderscript/Element$Builder;
    invoke-static {p0}, Landroid/renderscript/Element;->F32(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "fadeAmount"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 31
    invoke-static {p0}, Landroid/renderscript/Element;->F32(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v1

    const-string v2, "overallAlpha"

    invoke-virtual {v0, v1, v2}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;)Landroid/renderscript/Element$Builder;

    .line 32
    invoke-virtual {v0}, Landroid/renderscript/Element$Builder;->create()Landroid/renderscript/Element;

    move-result-object v1

    return-object v1
.end method

.method public static createTypeBuilder(Landroid/renderscript/RenderScript;)Landroid/renderscript/Type$Builder;
    .registers 3
    .parameter "rs"

    .prologue
    .line 80
    invoke-static {p0}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->createElement(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    .line 81
    .local v0, e:Landroid/renderscript/Element;
    new-instance v1, Landroid/renderscript/Type$Builder;

    invoke-direct {v1, p0, v0}, Landroid/renderscript/Type$Builder;-><init>(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)V

    return-object v1
.end method


# virtual methods
.method public declared-synchronized copyAll()V
    .registers 5

    .prologue
    .line 163
    monitor-enter p0

    const/4 v0, 0x0

    .local v0, ct:I
    :goto_2
    :try_start_2
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    array-length v1, v1

    if-ge v0, v1, :cond_11

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    aget-object v1, v1, v0

    invoke-direct {p0, v1, v0}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->copyToArray(Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 164
    :cond_11
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mAllocation:Landroid/renderscript/Allocation;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, v2, v3}, Landroid/renderscript/Allocation;->setFromFieldPacker(ILandroid/renderscript/FieldPacker;)V
    :try_end_19
    .catchall {:try_start_2 .. :try_end_19} :catchall_1b

    .line 165
    monitor-exit p0

    return-void

    .line 163
    :catchall_1b
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized get(I)Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;
    .registers 3
    .parameter "index"

    .prologue
    .line 118
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_d

    if-nez v0, :cond_8

    const/4 v0, 0x0

    .line 119
    :goto_6
    monitor-exit p0

    return-object v0

    :cond_8
    :try_start_8
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    aget-object v0, v0, p1
    :try_end_c
    .catchall {:try_start_8 .. :try_end_c} :catchall_d

    goto :goto_6

    .line 118
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_fadeAmount(I)F
    .registers 3
    .parameter "index"

    .prologue
    .line 153
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_f

    if-nez v0, :cond_8

    const/4 v0, 0x0

    .line 154
    :goto_6
    monitor-exit p0

    return v0

    :cond_8
    :try_start_8
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    aget-object v0, v0, p1

    iget v0, v0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;->fadeAmount:F
    :try_end_e
    .catchall {:try_start_8 .. :try_end_e} :catchall_f

    goto :goto_6

    .line 153
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get_overallAlpha(I)F
    .registers 3
    .parameter "index"

    .prologue
    .line 158
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_f

    if-nez v0, :cond_8

    const/4 v0, 0x0

    .line 159
    :goto_6
    monitor-exit p0

    return v0

    :cond_8
    :try_start_8
    iget-object v0, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    aget-object v0, v0, p1

    iget v0, v0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;->overallAlpha:F
    :try_end_e
    .catchall {:try_start_8 .. :try_end_e} :catchall_f

    goto :goto_6

    .line 158
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized resize(I)V
    .registers 8
    .parameter "newSize"

    .prologue
    .line 168
    monitor-enter p0

    :try_start_1
    iget-object v3, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    if-eqz v3, :cond_1b

    .line 169
    iget-object v3, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    array-length v2, v3

    .line 170
    .local v2, oldSize:I
    invoke-static {v2, p1}, Ljava/lang/Math;->min(II)I
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_36

    move-result v0

    .line 171
    .local v0, copySize:I
    if-ne p1, v2, :cond_10

    .line 179
    .end local v0           #copySize:I
    .end local v2           #oldSize:I
    :cond_e
    :goto_e
    monitor-exit p0

    return-void

    .line 172
    .restart local v0       #copySize:I
    .restart local v2       #oldSize:I
    :cond_10
    :try_start_10
    new-array v1, p1, [Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    .line 173
    .local v1, ni:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;
    iget-object v3, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v3, v4, v1, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 174
    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    .line 177
    .end local v0           #copySize:I
    .end local v1           #ni:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;
    .end local v2           #oldSize:I
    :cond_1b
    iget-object v3, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mAllocation:Landroid/renderscript/Allocation;

    invoke-virtual {v3, p1}, Landroid/renderscript/Allocation;->resize(I)V

    .line 178
    iget-object v3, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-eqz v3, :cond_e

    new-instance v3, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->getType()Landroid/renderscript/Type;

    move-result-object v4

    invoke-virtual {v4}, Landroid/renderscript/Type;->getX()I

    move-result v4

    mul-int/lit8 v4, v4, 0x8

    invoke-direct {v3, v4}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v3, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;
    :try_end_35
    .catchall {:try_start_10 .. :try_end_35} :catchall_36

    goto :goto_e

    .line 168
    :catchall_36
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized set(Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;IZ)V
    .registers 6
    .parameter "i"
    .parameter "index"
    .parameter "copyNow"

    .prologue
    .line 106
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    if-nez v1, :cond_11

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    .line 107
    :cond_11
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    aput-object p1, v1, p2

    .line 108
    if-eqz p3, :cond_29

    .line 109
    invoke-direct {p0, p1, p2}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->copyToArray(Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;I)V

    .line 110
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 111
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-direct {p0, p1, v0}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->copyToArrayLocal(Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;Landroid/renderscript/FieldPacker;)V

    .line 112
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mAllocation:Landroid/renderscript/Allocation;

    invoke-virtual {v1, p2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(ILandroid/renderscript/FieldPacker;)V
    :try_end_29
    .catchall {:try_start_1 .. :try_end_29} :catchall_2b

    .line 115
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_29
    monitor-exit p0

    return-void

    .line 106
    :catchall_2b
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_fadeAmount(IFZ)V
    .registers 7
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    .line 123
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v1, :cond_16

    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    mul-int/lit8 v2, v2, 0x8

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 124
    :cond_16
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    if-nez v1, :cond_26

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    .line 125
    :cond_26
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    aget-object v1, v1, p1

    if-nez v1, :cond_35

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    new-instance v2, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    invoke-direct {v2}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;-><init>()V

    aput-object v2, v1, p1

    .line 126
    :cond_35
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    aget-object v1, v1, p1

    iput p2, v1, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;->fadeAmount:F

    .line 127
    if-eqz p3, :cond_58

    .line 128
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit8 v2, p1, 0x8

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 129
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, p2}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 130
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 131
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 132
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mAllocation:Landroid/renderscript/Allocation;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_58
    .catchall {:try_start_1 .. :try_end_58} :catchall_5a

    .line 135
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_58
    monitor-exit p0

    return-void

    .line 123
    :catchall_5a
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized set_overallAlpha(IFZ)V
    .registers 7
    .parameter "index"
    .parameter "v"
    .parameter "copyNow"

    .prologue
    .line 138
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;

    if-nez v1, :cond_16

    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-virtual {v2}, Landroid/renderscript/Type;->getX()I

    move-result v2

    mul-int/lit8 v2, v2, 0x8

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>(I)V

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;

    .line 139
    :cond_16
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    if-nez v1, :cond_26

    invoke-virtual {p0}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-virtual {v1}, Landroid/renderscript/Type;->getX()I

    move-result v1

    new-array v1, v1, [Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    iput-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    .line 140
    :cond_26
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    aget-object v1, v1, p1

    if-nez v1, :cond_35

    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    new-instance v2, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    invoke-direct {v2}, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;-><init>()V

    aput-object v2, v1, p1

    .line 141
    :cond_35
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mItemArray:[Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;

    aget-object v1, v1, p1

    iput p2, v1, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s$Item;->overallAlpha:F

    .line 142
    if-eqz p3, :cond_5a

    .line 143
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;

    mul-int/lit8 v2, p1, 0x8

    add-int/lit8 v2, v2, 0x4

    invoke-virtual {v1, v2}, Landroid/renderscript/FieldPacker;->reset(I)V

    .line 144
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mIOBuffer:Landroid/renderscript/FieldPacker;

    invoke-virtual {v1, p2}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 145
    new-instance v0, Landroid/renderscript/FieldPacker;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>(I)V

    .line 146
    .local v0, fp:Landroid/renderscript/FieldPacker;
    invoke-virtual {v0, p2}, Landroid/renderscript/FieldPacker;->addF32(F)V

    .line 147
    iget-object v1, p0, Lcom/android/ex/carousel/ScriptField_FragmentShaderConstants_s;->mAllocation:Landroid/renderscript/Allocation;

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V
    :try_end_5a
    .catchall {:try_start_1 .. :try_end_5a} :catchall_5c

    .line 150
    .end local v0           #fp:Landroid/renderscript/FieldPacker;
    :cond_5a
    monitor-exit p0

    return-void

    .line 138
    :catchall_5c
    move-exception v1

    monitor-exit p0

    throw v1
.end method
