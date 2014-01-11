.class Landroid/app/MediaRouteButton$MediaRouteCallback;
.super Landroid/media/MediaRouter$SimpleCallback;
.source "MediaRouteButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/app/MediaRouteButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MediaRouteCallback"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/app/MediaRouteButton;


# direct methods
.method private constructor <init>(Landroid/app/MediaRouteButton;)V
    .locals 0
    .parameter

    .prologue
    .line 441
    iput-object p1, p0, Landroid/app/MediaRouteButton$MediaRouteCallback;->this$0:Landroid/app/MediaRouteButton;

    invoke-direct {p0}, Landroid/media/MediaRouter$SimpleCallback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/app/MediaRouteButton;Landroid/app/MediaRouteButton$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 441
    invoke-direct {p0, p1}, Landroid/app/MediaRouteButton$MediaRouteCallback;-><init>(Landroid/app/MediaRouteButton;)V

    return-void
.end method


# virtual methods
.method public onRouteAdded(Landroid/media/MediaRouter;Landroid/media/MediaRouter$RouteInfo;)V
    .locals 1
    .parameter "router"
    .parameter "info"

    .prologue
    .line 459
    iget-object v0, p0, Landroid/app/MediaRouteButton$MediaRouteCallback;->this$0:Landroid/app/MediaRouteButton;

    invoke-virtual {v0}, Landroid/app/MediaRouteButton;->updateRouteCount()V

    .line 460
    return-void
.end method

.method public onRouteChanged(Landroid/media/MediaRouter;Landroid/media/MediaRouter$RouteInfo;)V
    .locals 1
    .parameter "router"
    .parameter "info"

    .prologue
    .line 454
    iget-object v0, p0, Landroid/app/MediaRouteButton$MediaRouteCallback;->this$0:Landroid/app/MediaRouteButton;

    invoke-virtual {v0}, Landroid/app/MediaRouteButton;->updateRemoteIndicator()V

    .line 455
    return-void
.end method

.method public onRouteGrouped(Landroid/media/MediaRouter;Landroid/media/MediaRouter$RouteInfo;Landroid/media/MediaRouter$RouteGroup;I)V
    .locals 1
    .parameter "router"
    .parameter "info"
    .parameter "group"
    .parameter "index"

    .prologue
    .line 470
    iget-object v0, p0, Landroid/app/MediaRouteButton$MediaRouteCallback;->this$0:Landroid/app/MediaRouteButton;

    invoke-virtual {v0}, Landroid/app/MediaRouteButton;->updateRouteCount()V

    .line 471
    return-void
.end method

.method public onRouteRemoved(Landroid/media/MediaRouter;Landroid/media/MediaRouter$RouteInfo;)V
    .locals 1
    .parameter "router"
    .parameter "info"

    .prologue
    .line 464
    iget-object v0, p0, Landroid/app/MediaRouteButton$MediaRouteCallback;->this$0:Landroid/app/MediaRouteButton;

    invoke-virtual {v0}, Landroid/app/MediaRouteButton;->updateRouteCount()V

    .line 465
    return-void
.end method

.method public onRouteSelected(Landroid/media/MediaRouter;ILandroid/media/MediaRouter$RouteInfo;)V
    .locals 1
    .parameter "router"
    .parameter "type"
    .parameter "info"

    .prologue
    .line 444
    iget-object v0, p0, Landroid/app/MediaRouteButton$MediaRouteCallback;->this$0:Landroid/app/MediaRouteButton;

    invoke-virtual {v0}, Landroid/app/MediaRouteButton;->updateRemoteIndicator()V

    .line 445
    return-void
.end method

.method public onRouteUngrouped(Landroid/media/MediaRouter;Landroid/media/MediaRouter$RouteInfo;Landroid/media/MediaRouter$RouteGroup;)V
    .locals 1
    .parameter "router"
    .parameter "info"
    .parameter "group"

    .prologue
    .line 475
    iget-object v0, p0, Landroid/app/MediaRouteButton$MediaRouteCallback;->this$0:Landroid/app/MediaRouteButton;

    invoke-virtual {v0}, Landroid/app/MediaRouteButton;->updateRouteCount()V

    .line 476
    return-void
.end method

.method public onRouteUnselected(Landroid/media/MediaRouter;ILandroid/media/MediaRouter$RouteInfo;)V
    .locals 1
    .parameter "router"
    .parameter "type"
    .parameter "info"

    .prologue
    .line 449
    iget-object v0, p0, Landroid/app/MediaRouteButton$MediaRouteCallback;->this$0:Landroid/app/MediaRouteButton;

    invoke-virtual {v0}, Landroid/app/MediaRouteButton;->updateRemoteIndicator()V

    .line 450
    return-void
.end method
