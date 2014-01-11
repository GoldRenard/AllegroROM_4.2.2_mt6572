.class Lcom/cyanogenmod/trebuchet/CanvasCache;
.super Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal;
.source "AppsCustomizePagedView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal",
        "<",
        "Landroid/graphics/Canvas;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 192
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected initialValue()Landroid/graphics/Canvas;
    .locals 1

    .prologue
    .line 195
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    return-object v0
.end method

.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 192
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CanvasCache;->initialValue()Landroid/graphics/Canvas;

    move-result-object v0

    return-object v0
.end method
