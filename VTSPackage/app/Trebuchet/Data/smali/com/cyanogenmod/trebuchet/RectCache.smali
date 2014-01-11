.class Lcom/cyanogenmod/trebuchet/RectCache;
.super Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal;
.source "AppsCustomizePagedView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal",
        "<",
        "Landroid/graphics/Rect;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 213
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected initialValue()Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 216
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    return-object v0
.end method

.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 213
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/RectCache;->initialValue()Landroid/graphics/Rect;

    move-result-object v0

    return-object v0
.end method
