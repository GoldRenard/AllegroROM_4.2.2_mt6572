.class public Lcom/android/systemui/BeanBagDream;
.super Landroid/service/dreams/DreamService;
.source "BeanBagDream.java"


# instance fields
.field private mBoard:Lcom/android/systemui/BeanBag$Board;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/service/dreams/DreamService;-><init>()V

    return-void
.end method


# virtual methods
.method public onAttachedToWindow()V
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 29
    invoke-super {p0}, Landroid/service/dreams/DreamService;->onAttachedToWindow()V

    .line 30
    invoke-virtual {p0, v0}, Lcom/android/systemui/BeanBagDream;->setInteractive(Z)V

    .line 31
    invoke-virtual {p0, v0}, Lcom/android/systemui/BeanBagDream;->setFullscreen(Z)V

    .line 32
    new-instance v0, Lcom/android/systemui/BeanBag$Board;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/systemui/BeanBag$Board;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v0, p0, Lcom/android/systemui/BeanBagDream;->mBoard:Lcom/android/systemui/BeanBag$Board;

    .line 33
    iget-object v0, p0, Lcom/android/systemui/BeanBagDream;->mBoard:Lcom/android/systemui/BeanBag$Board;

    invoke-virtual {p0, v0}, Lcom/android/systemui/BeanBagDream;->setContentView(Landroid/view/View;)V

    .line 34
    return-void
.end method

.method public onDreamingStarted()V
    .registers 2

    .prologue
    .line 38
    invoke-super {p0}, Landroid/service/dreams/DreamService;->onDreamingStarted()V

    .line 39
    iget-object v0, p0, Lcom/android/systemui/BeanBagDream;->mBoard:Lcom/android/systemui/BeanBag$Board;

    invoke-virtual {v0}, Lcom/android/systemui/BeanBag$Board;->startAnimation()V

    .line 40
    return-void
.end method

.method public onDreamingStopped()V
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lcom/android/systemui/BeanBagDream;->mBoard:Lcom/android/systemui/BeanBag$Board;

    invoke-virtual {v0}, Lcom/android/systemui/BeanBag$Board;->stopAnimation()V

    .line 45
    invoke-super {p0}, Landroid/service/dreams/DreamService;->onDreamingStopped()V

    .line 46
    return-void
.end method
