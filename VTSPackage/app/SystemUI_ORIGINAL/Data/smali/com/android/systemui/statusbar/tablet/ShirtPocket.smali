.class public Lcom/android/systemui/statusbar/tablet/ShirtPocket;
.super Landroid/widget/ImageView;
.source "ShirtPocket.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/statusbar/tablet/ShirtPocket$DropZone;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "StatusBar/ShirtPocket"


# instance fields
.field mAnimHide:Landroid/animation/ObjectAnimator;

.field mAnimShow:Landroid/animation/ObjectAnimator;

.field private mClipping:Landroid/content/ClipData;

.field private mPreviewIcon:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 125
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 47
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/systemui/statusbar/tablet/ShirtPocket;->mClipping:Landroid/content/ClipData;

    .line 126
    return-void
.end method

.method static synthetic access$000(Lcom/android/systemui/statusbar/tablet/ShirtPocket;Landroid/content/ClipData;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/tablet/ShirtPocket;->stash(Landroid/content/ClipData;)V

    return-void
.end method

.method private stash(Landroid/content/ClipData;)V
    .locals 2
    .parameter "clipping"

    .prologue
    .line 139
    iput-object p1, p0, Lcom/android/systemui/statusbar/tablet/ShirtPocket;->mClipping:Landroid/content/ClipData;

    .line 140
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/ShirtPocket;->mClipping:Landroid/content/ClipData;

    if-eqz v1, :cond_2

    .line 141
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/tablet/ShirtPocket;->setVisibility(I)V

    .line 142
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/ShirtPocket;->mClipping:Landroid/content/ClipData;

    invoke-virtual {v1}, Landroid/content/ClipData;->getIcon()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 144
    .local v0, icon:Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 145
    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/tablet/ShirtPocket;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 155
    .end local v0           #icon:Landroid/graphics/Bitmap;
    :cond_0
    :goto_0
    return-void

    .line 147
    .restart local v0       #icon:Landroid/graphics/Bitmap;
    :cond_1
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/ShirtPocket;->mClipping:Landroid/content/ClipData;

    invoke-virtual {v1}, Landroid/content/ClipData;->getItemCount()I

    move-result v1

    if-lez v1, :cond_0

    goto :goto_0

    .line 153
    .end local v0           #icon:Landroid/graphics/Bitmap;
    :cond_2
    const/16 v1, 0x8

    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/tablet/ShirtPocket;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method public holding()Z
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/ShirtPocket;->mClipping:Landroid/content/ClipData;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onAttachedToWindow()V
    .locals 0

    .prologue
    .line 132
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6
    .parameter "ev"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 159
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 160
    .local v0, action:I
    if-nez v0, :cond_0

    .line 161
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/ShirtPocket;->mClipping:Landroid/content/ClipData;

    .line 162
    .local v1, clip:Landroid/content/ClipData;
    if-eqz v1, :cond_0

    .line 163
    invoke-virtual {v1}, Landroid/content/ClipData;->getIcon()Landroid/graphics/Bitmap;

    move-result-object v2

    .line 165
    .local v2, icon:Landroid/graphics/Bitmap;
    if-eqz v2, :cond_1

    .line 166
    new-instance v3, Lcom/android/systemui/statusbar/tablet/ShirtPocket$1;

    invoke-direct {v3, p0, p0, v2}, Lcom/android/systemui/statusbar/tablet/ShirtPocket$1;-><init>(Lcom/android/systemui/statusbar/tablet/ShirtPocket;Landroid/view/View;Landroid/graphics/Bitmap;)V

    .line 180
    .local v3, shadow:Landroid/view/View$DragShadowBuilder;
    :goto_0
    invoke-virtual {p0, v1, v3, v5, v4}, Lcom/android/systemui/statusbar/tablet/ShirtPocket;->startDrag(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    .line 183
    invoke-direct {p0, v5}, Lcom/android/systemui/statusbar/tablet/ShirtPocket;->stash(Landroid/content/ClipData;)V

    .line 185
    const/4 v4, 0x1

    .line 188
    .end local v1           #clip:Landroid/content/ClipData;
    .end local v2           #icon:Landroid/graphics/Bitmap;
    .end local v3           #shadow:Landroid/view/View$DragShadowBuilder;
    :cond_0
    return v4

    .line 177
    .restart local v1       #clip:Landroid/content/ClipData;
    .restart local v2       #icon:Landroid/graphics/Bitmap;
    :cond_1
    new-instance v3, Landroid/view/View$DragShadowBuilder;

    invoke-direct {v3, p0}, Landroid/view/View$DragShadowBuilder;-><init>(Landroid/view/View;)V

    .restart local v3       #shadow:Landroid/view/View$DragShadowBuilder;
    goto :goto_0
.end method
