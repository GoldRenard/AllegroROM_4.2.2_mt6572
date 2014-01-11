.class public Landroid/app/MediaRouteActionProvider;
.super Landroid/view/ActionProvider;
.source "MediaRouteActionProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/app/MediaRouteActionProvider$RouterCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MediaRouteActionProvider"


# instance fields
.field private mCallback:Landroid/app/MediaRouteActionProvider$RouterCallback;

.field private mContext:Landroid/content/Context;

.field private mExtendedSettingsListener:Landroid/view/View$OnClickListener;

.field private mMenuItem:Landroid/view/MenuItem;

.field private mRouteTypes:I

.field private mRouter:Landroid/media/MediaRouter;

.field private mView:Landroid/app/MediaRouteButton;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 45
    invoke-direct {p0, p1}, Landroid/view/ActionProvider;-><init>(Landroid/content/Context;)V

    .line 46
    iput-object p1, p0, Landroid/app/MediaRouteActionProvider;->mContext:Landroid/content/Context;

    .line 47
    const-string v0, "media_router"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/MediaRouter;

    iput-object v0, p0, Landroid/app/MediaRouteActionProvider;->mRouter:Landroid/media/MediaRouter;

    .line 48
    new-instance v0, Landroid/app/MediaRouteActionProvider$RouterCallback;

    invoke-direct {v0, p0}, Landroid/app/MediaRouteActionProvider$RouterCallback;-><init>(Landroid/app/MediaRouteActionProvider;)V

    iput-object v0, p0, Landroid/app/MediaRouteActionProvider;->mCallback:Landroid/app/MediaRouteActionProvider$RouterCallback;

    .line 53
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/app/MediaRouteActionProvider;->setRouteTypes(I)V

    .line 54
    return-void
.end method

.method private getActivity()Landroid/app/Activity;
    .locals 3

    .prologue
    .line 113
    iget-object v0, p0, Landroid/app/MediaRouteActionProvider;->mContext:Landroid/content/Context;

    .line 114
    .local v0, context:Landroid/content/Context;
    :goto_0
    instance-of v1, v0, Landroid/content/ContextWrapper;

    if-eqz v1, :cond_0

    instance-of v1, v0, Landroid/app/Activity;

    if-nez v1, :cond_0

    .line 115
    check-cast v0, Landroid/content/ContextWrapper;

    .end local v0           #context:Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .restart local v0       #context:Landroid/content/Context;
    goto :goto_0

    .line 117
    :cond_0
    instance-of v1, v0, Landroid/app/Activity;

    if-nez v1, :cond_1

    .line 118
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "The MediaRouteActionProvider\'s Context is not an Activity."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 122
    :cond_1
    check-cast v0, Landroid/app/Activity;

    .end local v0           #context:Landroid/content/Context;
    return-object v0
.end method


# virtual methods
.method public isVisible()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 139
    iget-object v1, p0, Landroid/app/MediaRouteActionProvider;->mRouter:Landroid/media/MediaRouter;

    invoke-virtual {v1}, Landroid/media/MediaRouter;->getRouteCount()I

    move-result v1

    if-le v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreateActionView()Landroid/view/View;
    .locals 2

    .prologue
    .line 72
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Use onCreateActionView(MenuItem) instead."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onCreateActionView(Landroid/view/MenuItem;)Landroid/view/View;
    .locals 4
    .parameter "item"

    .prologue
    .line 77
    iget-object v0, p0, Landroid/app/MediaRouteActionProvider;->mMenuItem:Landroid/view/MenuItem;

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/app/MediaRouteActionProvider;->mView:Landroid/app/MediaRouteButton;

    if-eqz v0, :cond_1

    .line 78
    :cond_0
    const-string v0, "MediaRouteActionProvider"

    const-string v1, "onCreateActionView: this ActionProvider is already associated with a menu item. Don\'t reuse MediaRouteActionProvider instances! Abandoning the old one..."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    :cond_1
    iput-object p1, p0, Landroid/app/MediaRouteActionProvider;->mMenuItem:Landroid/view/MenuItem;

    .line 83
    new-instance v0, Landroid/app/MediaRouteButton;

    iget-object v1, p0, Landroid/app/MediaRouteActionProvider;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/MediaRouteButton;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/app/MediaRouteActionProvider;->mView:Landroid/app/MediaRouteButton;

    .line 84
    iget-object v0, p0, Landroid/app/MediaRouteActionProvider;->mView:Landroid/app/MediaRouteButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/MediaRouteButton;->setCheatSheetEnabled(Z)V

    .line 85
    iget-object v0, p0, Landroid/app/MediaRouteActionProvider;->mView:Landroid/app/MediaRouteButton;

    iget v1, p0, Landroid/app/MediaRouteActionProvider;->mRouteTypes:I

    invoke-virtual {v0, v1}, Landroid/app/MediaRouteButton;->setRouteTypes(I)V

    .line 86
    iget-object v0, p0, Landroid/app/MediaRouteActionProvider;->mView:Landroid/app/MediaRouteButton;

    iget-object v1, p0, Landroid/app/MediaRouteActionProvider;->mExtendedSettingsListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/app/MediaRouteButton;->setExtendedSettingsClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    iget-object v0, p0, Landroid/app/MediaRouteActionProvider;->mView:Landroid/app/MediaRouteButton;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x2

    const/4 v3, -0x1

    invoke-direct {v1, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/app/MediaRouteButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    iget-object v0, p0, Landroid/app/MediaRouteActionProvider;->mView:Landroid/app/MediaRouteButton;

    return-object v0
.end method

.method public onPerformDefaultAction()Z
    .locals 4

    .prologue
    .line 94
    invoke-direct {p0}, Landroid/app/MediaRouteActionProvider;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    .line 96
    .local v1, fm:Landroid/app/FragmentManager;
    const-string v2, "android:MediaRouteChooserDialogFragment"

    invoke-virtual {v1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/android/internal/app/MediaRouteChooserDialogFragment;

    .line 99
    .local v0, dialogFragment:Lcom/android/internal/app/MediaRouteChooserDialogFragment;
    if-eqz v0, :cond_0

    .line 100
    const-string v2, "MediaRouteActionProvider"

    const-string v3, "onPerformDefaultAction(): Chooser dialog already showing!"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    const/4 v2, 0x0

    .line 108
    :goto_0
    return v2

    .line 104
    :cond_0
    new-instance v0, Lcom/android/internal/app/MediaRouteChooserDialogFragment;

    .end local v0           #dialogFragment:Lcom/android/internal/app/MediaRouteChooserDialogFragment;
    invoke-direct {v0}, Lcom/android/internal/app/MediaRouteChooserDialogFragment;-><init>()V

    .line 105
    .restart local v0       #dialogFragment:Lcom/android/internal/app/MediaRouteChooserDialogFragment;
    iget-object v2, p0, Landroid/app/MediaRouteActionProvider;->mExtendedSettingsListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v2}, Lcom/android/internal/app/MediaRouteChooserDialogFragment;->setExtendedSettingsClickListener(Landroid/view/View$OnClickListener;)V

    .line 106
    iget v2, p0, Landroid/app/MediaRouteActionProvider;->mRouteTypes:I

    invoke-virtual {v0, v2}, Lcom/android/internal/app/MediaRouteChooserDialogFragment;->setRouteTypes(I)V

    .line 107
    const-string v2, "android:MediaRouteChooserDialogFragment"

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/app/MediaRouteChooserDialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 108
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public overridesItemVisibility()Z
    .locals 1

    .prologue
    .line 134
    const/4 v0, 0x1

    return v0
.end method

.method public setExtendedSettingsClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 126
    iput-object p1, p0, Landroid/app/MediaRouteActionProvider;->mExtendedSettingsListener:Landroid/view/View$OnClickListener;

    .line 127
    iget-object v0, p0, Landroid/app/MediaRouteActionProvider;->mView:Landroid/app/MediaRouteButton;

    if-eqz v0, :cond_0

    .line 128
    iget-object v0, p0, Landroid/app/MediaRouteActionProvider;->mView:Landroid/app/MediaRouteButton;

    invoke-virtual {v0, p1}, Landroid/app/MediaRouteButton;->setExtendedSettingsClickListener(Landroid/view/View$OnClickListener;)V

    .line 130
    :cond_0
    return-void
.end method

.method public setRouteTypes(I)V
    .locals 2
    .parameter "types"

    .prologue
    .line 57
    iget v0, p0, Landroid/app/MediaRouteActionProvider;->mRouteTypes:I

    if-ne v0, p1, :cond_1

    .line 68
    :cond_0
    :goto_0
    return-void

    .line 58
    :cond_1
    iget v0, p0, Landroid/app/MediaRouteActionProvider;->mRouteTypes:I

    if-eqz v0, :cond_2

    .line 59
    iget-object v0, p0, Landroid/app/MediaRouteActionProvider;->mRouter:Landroid/media/MediaRouter;

    iget-object v1, p0, Landroid/app/MediaRouteActionProvider;->mCallback:Landroid/app/MediaRouteActionProvider$RouterCallback;

    invoke-virtual {v0, v1}, Landroid/media/MediaRouter;->removeCallback(Landroid/media/MediaRouter$Callback;)V

    .line 61
    :cond_2
    iput p1, p0, Landroid/app/MediaRouteActionProvider;->mRouteTypes:I

    .line 62
    if-eqz p1, :cond_3

    .line 63
    iget-object v0, p0, Landroid/app/MediaRouteActionProvider;->mRouter:Landroid/media/MediaRouter;

    iget-object v1, p0, Landroid/app/MediaRouteActionProvider;->mCallback:Landroid/app/MediaRouteActionProvider$RouterCallback;

    invoke-virtual {v0, p1, v1}, Landroid/media/MediaRouter;->addCallback(ILandroid/media/MediaRouter$Callback;)V

    .line 65
    :cond_3
    iget-object v0, p0, Landroid/app/MediaRouteActionProvider;->mView:Landroid/app/MediaRouteButton;

    if-eqz v0, :cond_0

    .line 66
    iget-object v0, p0, Landroid/app/MediaRouteActionProvider;->mView:Landroid/app/MediaRouteButton;

    iget v1, p0, Landroid/app/MediaRouteActionProvider;->mRouteTypes:I

    invoke-virtual {v0, v1}, Landroid/app/MediaRouteButton;->setRouteTypes(I)V

    goto :goto_0
.end method
