.class public Lcom/android/systemui/statusbar/tablet/ShirtPocket$DropZone;
.super Landroid/view/View;
.source "ShirtPocket.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/tablet/ShirtPocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DropZone"
.end annotation


# instance fields
.field mPocket:Lcom/android/systemui/statusbar/tablet/ShirtPocket;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 54
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 55
    return-void
.end method

.method private hide(Z)V
    .registers 8
    .parameter "animate"

    .prologue
    .line 81
    new-instance v1, Lcom/android/systemui/statusbar/tablet/ShirtPocket$DropZone$1;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/tablet/ShirtPocket$DropZone$1;-><init>(Lcom/android/systemui/statusbar/tablet/ShirtPocket$DropZone;)V

    .line 88
    .local v1, onEnd:Landroid/animation/AnimatorListenerAdapter;
    if-eqz p1, :cond_22

    .line 89
    const-string v2, "alpha"

    const/4 v3, 0x2

    new-array v3, v3, [F

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/tablet/ShirtPocket$DropZone;->getAlpha()F

    move-result v5

    aput v5, v3, v4

    const/4 v4, 0x1

    const/4 v5, 0x0

    aput v5, v3, v4

    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 90
    .local v0, a:Landroid/animation/Animator;
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 91
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 95
    .end local v0           #a:Landroid/animation/Animator;
    :goto_21
    return-void

    .line 93
    :cond_22
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/systemui/statusbar/tablet/ShirtPocket$DropZone$1;->onAnimationEnd(Landroid/animation/Animator;)V

    goto :goto_21
.end method

.method private show(Z)V
    .registers 4
    .parameter "animate"

    .prologue
    const/4 v0, 0x0

    .line 71
    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/tablet/ShirtPocket$DropZone;->setTranslationY(F)V

    .line 72
    if-eqz p1, :cond_19

    .line 73
    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/tablet/ShirtPocket$DropZone;->setAlpha(F)V

    .line 74
    const-string v0, "alpha"

    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_20

    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 78
    :goto_18
    return-void

    .line 76
    :cond_19
    const/high16 v0, 0x3f80

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/tablet/ShirtPocket$DropZone;->setAlpha(F)V

    goto :goto_18

    .line 74
    nop

    :array_20
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method


# virtual methods
.method public onAttachedToWindow()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 61
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 62
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/ShirtPocket$DropZone;->mPocket:Lcom/android/systemui/statusbar/tablet/ShirtPocket;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/tablet/ShirtPocket;->holding()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 63
    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/tablet/ShirtPocket$DropZone;->show(Z)V

    .line 67
    :goto_f
    return-void

    .line 65
    :cond_10
    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/tablet/ShirtPocket$DropZone;->hide(Z)V

    goto :goto_f
.end method

.method public onDragEvent(Landroid/view/DragEvent;)Z
    .registers 5
    .parameter "event"

    .prologue
    const/4 v2, 0x1

    .line 100
    invoke-virtual {p1}, Landroid/view/DragEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_1c

    .line 120
    :goto_8
    :pswitch_8
    return v2

    .line 103
    :pswitch_9
    invoke-direct {p0, v2}, Lcom/android/systemui/statusbar/tablet/ShirtPocket$DropZone;->show(Z)V

    goto :goto_8

    .line 114
    :pswitch_d
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/ShirtPocket$DropZone;->mPocket:Lcom/android/systemui/statusbar/tablet/ShirtPocket;

    invoke-virtual {p1}, Landroid/view/DragEvent;->getClipData()Landroid/content/ClipData;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/tablet/ShirtPocket;->access$000(Lcom/android/systemui/statusbar/tablet/ShirtPocket;Landroid/content/ClipData;)V

    goto :goto_8

    .line 117
    :pswitch_17
    invoke-direct {p0, v2}, Lcom/android/systemui/statusbar/tablet/ShirtPocket$DropZone;->hide(Z)V

    goto :goto_8

    .line 100
    nop

    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_d
        :pswitch_17
        :pswitch_8
        :pswitch_8
    .end packed-switch
.end method

.method public setPocket(Lcom/android/systemui/statusbar/tablet/ShirtPocket;)V
    .registers 2
    .parameter "p"

    .prologue
    .line 57
    iput-object p1, p0, Lcom/android/systemui/statusbar/tablet/ShirtPocket$DropZone;->mPocket:Lcom/android/systemui/statusbar/tablet/ShirtPocket;

    .line 58
    return-void
.end method
