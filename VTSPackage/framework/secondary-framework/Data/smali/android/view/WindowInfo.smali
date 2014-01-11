.class public Landroid/view/WindowInfo;
.super Ljava/lang/Object;
.source "WindowInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Landroid/view/WindowInfo;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAX_POOL_SIZE:I = 0x14

.field private static UNDEFINED:I

.field private static sPool:Landroid/view/WindowInfo;

.field private static sPoolLock:Ljava/lang/Object;

.field private static sPoolSize:I


# instance fields
.field public compatibilityScale:F

.field public displayId:I

.field public final frame:Landroid/graphics/Rect;

.field public layer:I

.field private mInPool:Z

.field private mNext:Landroid/view/WindowInfo;

.field public token:Landroid/os/IBinder;

.field public final touchableRegion:Landroid/graphics/Rect;

.field public type:I

.field public visible:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const/4 v0, -0x1

    sput v0, Landroid/view/WindowInfo;->UNDEFINED:I

    .line 35
    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/view/WindowInfo;->sPoolLock:Ljava/lang/Object;

    .line 163
    new-instance v0, Landroid/view/WindowInfo$1;

    invoke-direct {v0}, Landroid/view/WindowInfo$1;-><init>()V

    sput-object v0, Landroid/view/WindowInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 58
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/view/WindowInfo;->frame:Landroid/graphics/Rect;

    .line 46
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/view/WindowInfo;->touchableRegion:Landroid/graphics/Rect;

    .line 48
    sget v0, Landroid/view/WindowInfo;->UNDEFINED:I

    iput v0, p0, Landroid/view/WindowInfo;->type:I

    .line 50
    sget v0, Landroid/view/WindowInfo;->UNDEFINED:I

    int-to-float v0, v0

    iput v0, p0, Landroid/view/WindowInfo;->compatibilityScale:F

    .line 54
    sget v0, Landroid/view/WindowInfo;->UNDEFINED:I

    iput v0, p0, Landroid/view/WindowInfo;->displayId:I

    .line 56
    sget v0, Landroid/view/WindowInfo;->UNDEFINED:I

    iput v0, p0, Landroid/view/WindowInfo;->layer:I

    .line 60
    return-void
.end method

.method static synthetic access$000(Landroid/view/WindowInfo;Landroid/os/Parcel;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 29
    invoke-direct {p0, p1}, Landroid/view/WindowInfo;->initFromParcel(Landroid/os/Parcel;)V

    return-void
.end method

.method private clear()V
    .locals 1

    .prologue
    .line 135
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/view/WindowInfo;->token:Landroid/os/IBinder;

    .line 136
    iget-object v0, p0, Landroid/view/WindowInfo;->frame:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    .line 137
    iget-object v0, p0, Landroid/view/WindowInfo;->touchableRegion:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    .line 138
    sget v0, Landroid/view/WindowInfo;->UNDEFINED:I

    iput v0, p0, Landroid/view/WindowInfo;->type:I

    .line 139
    sget v0, Landroid/view/WindowInfo;->UNDEFINED:I

    int-to-float v0, v0

    iput v0, p0, Landroid/view/WindowInfo;->compatibilityScale:F

    .line 140
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/view/WindowInfo;->visible:Z

    .line 141
    sget v0, Landroid/view/WindowInfo;->UNDEFINED:I

    iput v0, p0, Landroid/view/WindowInfo;->displayId:I

    .line 142
    sget v0, Landroid/view/WindowInfo;->UNDEFINED:I

    iput v0, p0, Landroid/view/WindowInfo;->layer:I

    .line 143
    return-void
.end method

.method private initFromParcel(Landroid/os/Parcel;)V
    .locals 4
    .parameter "parcel"

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x1

    .line 81
    invoke-virtual {p1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v0

    iput-object v0, p0, Landroid/view/WindowInfo;->token:Landroid/os/IBinder;

    .line 82
    iget-object v2, p0, Landroid/view/WindowInfo;->frame:Landroid/graphics/Rect;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    invoke-virtual {v2, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 83
    iget-object v2, p0, Landroid/view/WindowInfo;->touchableRegion:Landroid/graphics/Rect;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    invoke-virtual {v2, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 84
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/view/WindowInfo;->type:I

    .line 85
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Landroid/view/WindowInfo;->compatibilityScale:F

    .line 86
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Landroid/view/WindowInfo;->visible:Z

    .line 87
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/view/WindowInfo;->displayId:I

    .line 88
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/view/WindowInfo;->layer:I

    .line 89
    return-void

    .line 86
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static obtain()Landroid/view/WindowInfo;
    .locals 3

    .prologue
    .line 105
    sget-object v2, Landroid/view/WindowInfo;->sPoolLock:Ljava/lang/Object;

    monitor-enter v2

    .line 106
    :try_start_0
    sget v1, Landroid/view/WindowInfo;->sPoolSize:I

    if-lez v1, :cond_0

    .line 107
    sget-object v0, Landroid/view/WindowInfo;->sPool:Landroid/view/WindowInfo;

    .line 108
    .local v0, info:Landroid/view/WindowInfo;
    iget-object v1, v0, Landroid/view/WindowInfo;->mNext:Landroid/view/WindowInfo;

    sput-object v1, Landroid/view/WindowInfo;->sPool:Landroid/view/WindowInfo;

    .line 109
    const/4 v1, 0x0

    iput-object v1, v0, Landroid/view/WindowInfo;->mNext:Landroid/view/WindowInfo;

    .line 110
    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/view/WindowInfo;->mInPool:Z

    .line 111
    sget v1, Landroid/view/WindowInfo;->sPoolSize:I

    add-int/lit8 v1, v1, -0x1

    sput v1, Landroid/view/WindowInfo;->sPoolSize:I

    .line 112
    monitor-exit v2

    .line 114
    .end local v0           #info:Landroid/view/WindowInfo;
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Landroid/view/WindowInfo;

    invoke-direct {v0}, Landroid/view/WindowInfo;-><init>()V

    monitor-exit v2

    goto :goto_0

    .line 116
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static obtain(Landroid/view/WindowInfo;)Landroid/view/WindowInfo;
    .locals 3
    .parameter "other"

    .prologue
    .line 92
    invoke-static {}, Landroid/view/WindowInfo;->obtain()Landroid/view/WindowInfo;

    move-result-object v0

    .line 93
    .local v0, info:Landroid/view/WindowInfo;
    iget-object v1, p0, Landroid/view/WindowInfo;->token:Landroid/os/IBinder;

    iput-object v1, v0, Landroid/view/WindowInfo;->token:Landroid/os/IBinder;

    .line 94
    iget-object v1, v0, Landroid/view/WindowInfo;->frame:Landroid/graphics/Rect;

    iget-object v2, p0, Landroid/view/WindowInfo;->frame:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 95
    iget-object v1, v0, Landroid/view/WindowInfo;->touchableRegion:Landroid/graphics/Rect;

    iget-object v2, p0, Landroid/view/WindowInfo;->touchableRegion:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 96
    iget v1, p0, Landroid/view/WindowInfo;->type:I

    iput v1, v0, Landroid/view/WindowInfo;->type:I

    .line 97
    iget v1, p0, Landroid/view/WindowInfo;->compatibilityScale:F

    iput v1, v0, Landroid/view/WindowInfo;->compatibilityScale:F

    .line 98
    iget-boolean v1, p0, Landroid/view/WindowInfo;->visible:Z

    iput-boolean v1, v0, Landroid/view/WindowInfo;->visible:Z

    .line 99
    iget v1, p0, Landroid/view/WindowInfo;->displayId:I

    iput v1, v0, Landroid/view/WindowInfo;->displayId:I

    .line 100
    iget v1, p0, Landroid/view/WindowInfo;->layer:I

    iput v1, v0, Landroid/view/WindowInfo;->layer:I

    .line 101
    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 64
    const/4 v0, 0x0

    return v0
.end method

.method public recycle()V
    .locals 3

    .prologue
    .line 120
    iget-boolean v0, p0, Landroid/view/WindowInfo;->mInPool:Z

    if-eqz v0, :cond_0

    .line 121
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already recycled."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 123
    :cond_0
    invoke-direct {p0}, Landroid/view/WindowInfo;->clear()V

    .line 124
    sget-object v1, Landroid/view/WindowInfo;->sPoolLock:Ljava/lang/Object;

    monitor-enter v1

    .line 125
    :try_start_0
    sget v0, Landroid/view/WindowInfo;->sPoolSize:I

    const/16 v2, 0x14

    if-ge v0, v2, :cond_1

    .line 126
    sget-object v0, Landroid/view/WindowInfo;->sPool:Landroid/view/WindowInfo;

    iput-object v0, p0, Landroid/view/WindowInfo;->mNext:Landroid/view/WindowInfo;

    .line 127
    sput-object p0, Landroid/view/WindowInfo;->sPool:Landroid/view/WindowInfo;

    .line 128
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/view/WindowInfo;->mInPool:Z

    .line 129
    sget v0, Landroid/view/WindowInfo;->sPoolSize:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Landroid/view/WindowInfo;->sPoolSize:I

    .line 131
    :cond_1
    monitor-exit v1

    .line 132
    return-void

    .line 131
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 148
    .local v0, builder:Ljava/lang/StringBuilder;
    const-string v1, "Window [token:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v1, p0, Landroid/view/WindowInfo;->token:Landroid/os/IBinder;

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/view/WindowInfo;->token:Landroid/os/IBinder;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :goto_0
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 149
    const-string v1, ", displayId:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/view/WindowInfo;->displayId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 150
    const-string v1, ", type:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/view/WindowInfo;->type:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    const-string v1, ", visible:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Landroid/view/WindowInfo;->visible:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 152
    const-string v1, ", layer:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/view/WindowInfo;->layer:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 153
    const-string v1, ", compatibilityScale:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/view/WindowInfo;->compatibilityScale:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 154
    const-string v1, ", frame:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/view/WindowInfo;->frame:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 155
    const-string v1, ", touchableRegion:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/view/WindowInfo;->touchableRegion:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 156
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 148
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .parameter "parcel"
    .parameter "flags"

    .prologue
    const/4 v0, 0x0

    .line 69
    iget-object v1, p0, Landroid/view/WindowInfo;->token:Landroid/os/IBinder;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    .line 70
    iget-object v1, p0, Landroid/view/WindowInfo;->frame:Landroid/graphics/Rect;

    invoke-virtual {p1, v1, v0}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 71
    iget-object v1, p0, Landroid/view/WindowInfo;->touchableRegion:Landroid/graphics/Rect;

    invoke-virtual {p1, v1, v0}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 72
    iget v1, p0, Landroid/view/WindowInfo;->type:I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 73
    iget v1, p0, Landroid/view/WindowInfo;->compatibilityScale:F

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeFloat(F)V

    .line 74
    iget-boolean v1, p0, Landroid/view/WindowInfo;->visible:Z

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 75
    iget v0, p0, Landroid/view/WindowInfo;->displayId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 76
    iget v0, p0, Landroid/view/WindowInfo;->layer:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 77
    invoke-virtual {p0}, Landroid/view/WindowInfo;->recycle()V

    .line 78
    return-void
.end method
