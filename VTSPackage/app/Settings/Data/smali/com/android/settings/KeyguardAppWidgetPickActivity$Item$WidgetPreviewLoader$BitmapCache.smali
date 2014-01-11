.class Lcom/android/settings/KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader$BitmapCache;
.super Lcom/android/settings/KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader$WeakReferenceThreadLocal;
.source "KeyguardAppWidgetPickActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BitmapCache"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/settings/KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader$WeakReferenceThreadLocal",
        "<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/settings/KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader;


# direct methods
.method constructor <init>(Lcom/android/settings/KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader;)V
    .locals 0
    .parameter

    .prologue
    .line 283
    iput-object p1, p0, Lcom/android/settings/KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader$BitmapCache;->this$1:Lcom/android/settings/KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader;

    invoke-direct {p0, p1}, Lcom/android/settings/KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader$WeakReferenceThreadLocal;-><init>(Lcom/android/settings/KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader;)V

    return-void
.end method


# virtual methods
.method protected initialValue()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 286
    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 283
    invoke-virtual {p0}, Lcom/android/settings/KeyguardAppWidgetPickActivity$Item$WidgetPreviewLoader$BitmapCache;->initialValue()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method
