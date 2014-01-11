.class Lcom/android/systemui/statusbar/tablet/NotificationPanel$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "NotificationPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/tablet/NotificationPanel;->swapPanels()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

.field final synthetic val$toHide:Landroid/view/View;

.field final synthetic val$toShow:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/tablet/NotificationPanel;Landroid/view/View;Landroid/view/View;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 265
    iput-object p1, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$3;->this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    iput-object p2, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$3;->val$toHide:Landroid/view/View;

    iput-object p3, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$3;->val$toShow:Landroid/view/View;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3
    .parameter "_a"

    .prologue
    .line 268
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$3;->val$toHide:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 269
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$3;->val$toShow:Landroid/view/View;

    if-eqz v0, :cond_2

    .line 270
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$3;->val$toShow:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 271
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$3;->val$toShow:Landroid/view/View;

    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$3;->this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    iget-object v1, v1, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->mSettingsView:Landroid/view/View;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$3;->this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    iget v0, v0, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->mNotificationCount:I

    if-lez v0, :cond_1

    .line 272
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$3;->val$toShow:Landroid/view/View;

    const-string v1, "alpha"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 277
    :cond_1
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$3;->val$toHide:Landroid/view/View;

    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$3;->this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    iget-object v1, v1, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->mSettingsView:Landroid/view/View;

    if-ne v0, v1, :cond_2

    .line 278
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$3;->this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->removeSettingsView()V

    .line 281
    :cond_2
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$3;->this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->updateClearButton()V

    .line 282
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$3;->this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->updatePanelModeButtons()V

    .line 283
    return-void

    .line 272
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method
