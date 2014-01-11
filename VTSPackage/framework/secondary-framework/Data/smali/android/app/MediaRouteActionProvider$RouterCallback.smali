.class Landroid/app/MediaRouteActionProvider$RouterCallback;
.super Landroid/media/MediaRouter$SimpleCallback;
.source "MediaRouteActionProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/app/MediaRouteActionProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RouterCallback"
.end annotation


# instance fields
.field private mAp:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/MediaRouteActionProvider;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/app/MediaRouteActionProvider;)V
    .locals 1
    .parameter "ap"

    .prologue
    .line 145
    invoke-direct {p0}, Landroid/media/MediaRouter$SimpleCallback;-><init>()V

    .line 146
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroid/app/MediaRouteActionProvider$RouterCallback;->mAp:Ljava/lang/ref/WeakReference;

    .line 147
    return-void
.end method


# virtual methods
.method public onRouteAdded(Landroid/media/MediaRouter;Landroid/media/MediaRouter$RouteInfo;)V
    .locals 2
    .parameter "router"
    .parameter "info"

    .prologue
    .line 151
    iget-object v1, p0, Landroid/app/MediaRouteActionProvider$RouterCallback;->mAp:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/MediaRouteActionProvider;

    .line 152
    .local v0, ap:Landroid/app/MediaRouteActionProvider;
    if-nez v0, :cond_0

    .line 153
    invoke-virtual {p1, p0}, Landroid/media/MediaRouter;->removeCallback(Landroid/media/MediaRouter$Callback;)V

    .line 158
    :goto_0
    return-void

    .line 157
    :cond_0
    invoke-virtual {v0}, Landroid/app/MediaRouteActionProvider;->refreshVisibility()V

    goto :goto_0
.end method

.method public onRouteRemoved(Landroid/media/MediaRouter;Landroid/media/MediaRouter$RouteInfo;)V
    .locals 2
    .parameter "router"
    .parameter "info"

    .prologue
    .line 162
    iget-object v1, p0, Landroid/app/MediaRouteActionProvider$RouterCallback;->mAp:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/MediaRouteActionProvider;

    .line 163
    .local v0, ap:Landroid/app/MediaRouteActionProvider;
    if-nez v0, :cond_0

    .line 164
    invoke-virtual {p1, p0}, Landroid/media/MediaRouter;->removeCallback(Landroid/media/MediaRouter$Callback;)V

    .line 169
    :goto_0
    return-void

    .line 168
    :cond_0
    invoke-virtual {v0}, Landroid/app/MediaRouteActionProvider;->refreshVisibility()V

    goto :goto_0
.end method
