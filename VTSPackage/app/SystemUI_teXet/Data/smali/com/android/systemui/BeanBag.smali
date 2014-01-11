.class public Lcom/android/systemui/BeanBag;
.super Landroid/app/Activity;
.source "BeanBag.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/BeanBag$Board;
    }
.end annotation


# static fields
.field static final DEBUG:Z


# instance fields
.field private mBoard:Lcom/android/systemui/BeanBag$Board;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 59
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 62
    return-void
.end method


# virtual methods
.method public onPause()V
    .registers 2

    .prologue
    .line 422
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 423
    iget-object v0, p0, Lcom/android/systemui/BeanBag;->mBoard:Lcom/android/systemui/BeanBag$Board;

    invoke-virtual {v0}, Lcom/android/systemui/BeanBag$Board;->stopAnimation()V

    .line 424
    return-void
.end method

.method public onResume()V
    .registers 2

    .prologue
    .line 428
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 429
    iget-object v0, p0, Lcom/android/systemui/BeanBag;->mBoard:Lcom/android/systemui/BeanBag$Board;

    invoke-virtual {v0}, Lcom/android/systemui/BeanBag$Board;->startAnimation()V

    .line 430
    return-void
.end method

.method public onStart()V
    .registers 5

    .prologue
    .line 405
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 408
    invoke-virtual {p0}, Lcom/android/systemui/BeanBag;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 409
    .local v0, pm:Landroid/content/pm/PackageManager;
    new-instance v1, Landroid/content/ComponentName;

    const-class v2, Lcom/android/systemui/BeanBagDream;

    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    .line 412
    invoke-virtual {p0}, Lcom/android/systemui/BeanBag;->getWindow()Landroid/view/Window;

    move-result-object v1

    const v2, 0x80001

    invoke-virtual {v1, v2}, Landroid/view/Window;->addFlags(I)V

    .line 416
    new-instance v1, Lcom/android/systemui/BeanBag$Board;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/systemui/BeanBag$Board;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v1, p0, Lcom/android/systemui/BeanBag;->mBoard:Lcom/android/systemui/BeanBag$Board;

    .line 417
    iget-object v1, p0, Lcom/android/systemui/BeanBag;->mBoard:Lcom/android/systemui/BeanBag$Board;

    invoke-virtual {p0, v1}, Lcom/android/systemui/BeanBag;->setContentView(Landroid/view/View;)V

    .line 418
    return-void
.end method
