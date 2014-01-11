.class Lcom/cyanogenmod/trebuchet/BitmapCache;
.super Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal;
.source "AppsCustomizePagedView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal",
        "<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 206
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/WeakReferenceThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected initialValue()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 209
    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 206
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BitmapCache;->initialValue()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method
