.class Lcom/android/systemui/ImageWallpaper$DrawableEngine$WallpaperObserver;
.super Landroid/content/BroadcastReceiver;
.source "ImageWallpaper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/ImageWallpaper$DrawableEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "WallpaperObserver"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/systemui/ImageWallpaper$DrawableEngine;


# direct methods
.method constructor <init>(Lcom/android/systemui/ImageWallpaper$DrawableEngine;)V
    .registers 2
    .parameter

    .prologue
    .line 155
    iput-object p1, p0, Lcom/android/systemui/ImageWallpaper$DrawableEngine$WallpaperObserver;->this$1:Lcom/android/systemui/ImageWallpaper$DrawableEngine;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 7
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 161
    iget-object v0, p0, Lcom/android/systemui/ImageWallpaper$DrawableEngine$WallpaperObserver;->this$1:Lcom/android/systemui/ImageWallpaper$DrawableEngine;

    invoke-static {v0}, Lcom/android/systemui/ImageWallpaper$DrawableEngine;->access$000(Lcom/android/systemui/ImageWallpaper$DrawableEngine;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 162
    :try_start_7
    iget-object v0, p0, Lcom/android/systemui/ImageWallpaper$DrawableEngine$WallpaperObserver;->this$1:Lcom/android/systemui/ImageWallpaper$DrawableEngine;

    iget-object v2, p0, Lcom/android/systemui/ImageWallpaper$DrawableEngine$WallpaperObserver;->this$1:Lcom/android/systemui/ImageWallpaper$DrawableEngine;

    const/4 v3, -0x1

    iput v3, v2, Lcom/android/systemui/ImageWallpaper$DrawableEngine;->mLastSurfaceHeight:I

    iput v3, v0, Lcom/android/systemui/ImageWallpaper$DrawableEngine;->mLastSurfaceWidth:I

    .line 163
    iget-object v0, p0, Lcom/android/systemui/ImageWallpaper$DrawableEngine$WallpaperObserver;->this$1:Lcom/android/systemui/ImageWallpaper$DrawableEngine;

    const/4 v2, 0x0

    iput-object v2, v0, Lcom/android/systemui/ImageWallpaper$DrawableEngine;->mBackground:Landroid/graphics/Bitmap;

    .line 164
    iget-object v0, p0, Lcom/android/systemui/ImageWallpaper$DrawableEngine$WallpaperObserver;->this$1:Lcom/android/systemui/ImageWallpaper$DrawableEngine;

    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/android/systemui/ImageWallpaper$DrawableEngine;->mRedrawNeeded:Z

    .line 165
    iget-object v0, p0, Lcom/android/systemui/ImageWallpaper$DrawableEngine$WallpaperObserver;->this$1:Lcom/android/systemui/ImageWallpaper$DrawableEngine;

    invoke-virtual {v0}, Lcom/android/systemui/ImageWallpaper$DrawableEngine;->drawFrameLocked()V

    .line 166
    monitor-exit v1

    .line 167
    return-void

    .line 166
    :catchall_21
    move-exception v0

    monitor-exit v1
    :try_end_23
    .catchall {:try_start_7 .. :try_end_23} :catchall_21

    throw v0
.end method
