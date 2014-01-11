.class Lcom/android/systemui/recent/RecentsVerticalScrollView$5;
.super Ljava/lang/Object;
.source "RecentsVerticalScrollView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/recent/RecentsVerticalScrollView;->update()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/recent/RecentsVerticalScrollView;


# direct methods
.method constructor <init>(Lcom/android/systemui/recent/RecentsVerticalScrollView;)V
    .registers 2
    .parameter

    .prologue
    .line 169
    iput-object p1, p0, Lcom/android/systemui/recent/RecentsVerticalScrollView$5;->this$0:Lcom/android/systemui/recent/RecentsVerticalScrollView;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 5

    .prologue
    .line 171
    iget-object v1, p0, Lcom/android/systemui/recent/RecentsVerticalScrollView$5;->this$0:Lcom/android/systemui/recent/RecentsVerticalScrollView;

    iget-object v2, p0, Lcom/android/systemui/recent/RecentsVerticalScrollView$5;->this$0:Lcom/android/systemui/recent/RecentsVerticalScrollView;

    invoke-static {v2}, Lcom/android/systemui/recent/RecentsVerticalScrollView;->access$100(Lcom/android/systemui/recent/RecentsVerticalScrollView;)I

    move-result v2

    iput v2, v1, Lcom/android/systemui/recent/RecentsVerticalScrollView;->mLastScrollPosition:I

    .line 172
    iget-object v1, p0, Lcom/android/systemui/recent/RecentsVerticalScrollView$5;->this$0:Lcom/android/systemui/recent/RecentsVerticalScrollView;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/android/systemui/recent/RecentsVerticalScrollView$5;->this$0:Lcom/android/systemui/recent/RecentsVerticalScrollView;

    iget v3, v3, Lcom/android/systemui/recent/RecentsVerticalScrollView;->mLastScrollPosition:I

    invoke-virtual {v1, v2, v3}, Lcom/android/systemui/recent/RecentsVerticalScrollView;->scrollTo(II)V

    .line 173
    iget-object v1, p0, Lcom/android/systemui/recent/RecentsVerticalScrollView$5;->this$0:Lcom/android/systemui/recent/RecentsVerticalScrollView;

    invoke-virtual {v1}, Lcom/android/systemui/recent/RecentsVerticalScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 174
    .local v0, observer:Landroid/view/ViewTreeObserver;
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_23

    .line 175
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 177
    :cond_23
    return-void
.end method
