.class public Lcom/mediatek/vt/PeerAndLocalSurfaceMng;
.super Ljava/lang/Object;
.source "PeerAndLocalSurfaceMng.java"


# static fields
.field public static final QCIF_HEIGHT:I = 0x90

.field public static final QCIF_WIDTH:I = 0xb0


# instance fields
.field public camera:Landroid/hardware/Camera;

.field mBigOne:Landroid/view/SurfaceHolder;

.field mSmallOne:Landroid/view/SurfaceHolder;

.field mSurfaceCallback:Landroid/view/SurfaceHolder$Callback;


# direct methods
.method public constructor <init>(Landroid/view/SurfaceHolder;Landroid/view/SurfaceHolder;)V
    .locals 1
    .parameter "big"
    .parameter "small"

    .prologue
    .line 51
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng$1;

    invoke-direct {v0, p0}, Lcom/mediatek/vt/PeerAndLocalSurfaceMng$1;-><init>(Lcom/mediatek/vt/PeerAndLocalSurfaceMng;)V

    iput-object v0, p0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng;->mSurfaceCallback:Landroid/view/SurfaceHolder$Callback;

    .line 52
    iput-object p1, p0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng;->mBigOne:Landroid/view/SurfaceHolder;

    .line 53
    iput-object p2, p0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng;->mSmallOne:Landroid/view/SurfaceHolder;

    .line 54
    invoke-virtual {p0}, Lcom/mediatek/vt/PeerAndLocalSurfaceMng;->openCamera()V

    .line 55
    return-void
.end method


# virtual methods
.method openCamera()V
    .locals 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng;->mBigOne:Landroid/view/SurfaceHolder;

    iget-object v1, p0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng;->mSurfaceCallback:Landroid/view/SurfaceHolder$Callback;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 92
    iget-object v0, p0, Lcom/mediatek/vt/PeerAndLocalSurfaceMng;->mBigOne:Landroid/view/SurfaceHolder;

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 93
    return-void
.end method
