.class Lcom/android/systemui/recent/RecentsHorizontalScrollView$6;
.super Ljava/lang/Object;
.source "RecentsHorizontalScrollView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/recent/RecentsHorizontalScrollView;->onSizeChanged(IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/recent/RecentsHorizontalScrollView;


# direct methods
.method constructor <init>(Lcom/android/systemui/recent/RecentsHorizontalScrollView;)V
    .registers 2
    .parameter

    .prologue
    .line 335
    iput-object p1, p0, Lcom/android/systemui/recent/RecentsHorizontalScrollView$6;->this$0:Lcom/android/systemui/recent/RecentsHorizontalScrollView;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 339
    iget-object v1, p0, Lcom/android/systemui/recent/RecentsHorizontalScrollView$6;->this$0:Lcom/android/systemui/recent/RecentsHorizontalScrollView;

    invoke-static {v1}, Lcom/android/systemui/recent/RecentsHorizontalScrollView;->access$200(Lcom/android/systemui/recent/RecentsHorizontalScrollView;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v0

    .line 340
    .local v0, transition:Landroid/animation/LayoutTransition;
    if-eqz v0, :cond_12

    invoke-virtual {v0}, Landroid/animation/LayoutTransition;->isRunning()Z

    move-result v1

    if-nez v1, :cond_1c

    .line 341
    :cond_12
    iget-object v1, p0, Lcom/android/systemui/recent/RecentsHorizontalScrollView$6;->this$0:Lcom/android/systemui/recent/RecentsHorizontalScrollView;

    iget-object v2, p0, Lcom/android/systemui/recent/RecentsHorizontalScrollView$6;->this$0:Lcom/android/systemui/recent/RecentsHorizontalScrollView;

    iget v2, v2, Lcom/android/systemui/recent/RecentsHorizontalScrollView;->mLastScrollPosition:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/android/systemui/recent/RecentsHorizontalScrollView;->scrollTo(II)V

    .line 343
    :cond_1c
    return-void
.end method
