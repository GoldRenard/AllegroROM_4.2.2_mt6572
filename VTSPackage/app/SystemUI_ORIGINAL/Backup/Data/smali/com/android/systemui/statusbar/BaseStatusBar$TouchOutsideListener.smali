.class public Lcom/android/systemui/statusbar/BaseStatusBar$TouchOutsideListener;
.super Ljava/lang/Object;
.source "BaseStatusBar.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/BaseStatusBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TouchOutsideListener"
.end annotation


# instance fields
.field private mMsg:I

.field private mPanel:Lcom/android/systemui/statusbar/tablet/StatusBarPanel;

.field final synthetic this$0:Lcom/android/systemui/statusbar/BaseStatusBar;


# direct methods
.method public constructor <init>(Lcom/android/systemui/statusbar/BaseStatusBar;ILcom/android/systemui/statusbar/tablet/StatusBarPanel;)V
    .locals 0
    .parameter
    .parameter "msg"
    .parameter "panel"

    .prologue
    .line 682
    iput-object p1, p0, Lcom/android/systemui/statusbar/BaseStatusBar$TouchOutsideListener;->this$0:Lcom/android/systemui/statusbar/BaseStatusBar;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 683
    iput p2, p0, Lcom/android/systemui/statusbar/BaseStatusBar$TouchOutsideListener;->mMsg:I

    .line 684
    iput-object p3, p0, Lcom/android/systemui/statusbar/BaseStatusBar$TouchOutsideListener;->mPanel:Lcom/android/systemui/statusbar/tablet/StatusBarPanel;

    .line 685
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .parameter "v"
    .parameter "ev"

    .prologue
    .line 688
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 689
    .local v0, action:I
    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    if-nez v0, :cond_1

    iget-object v1, p0, Lcom/android/systemui/statusbar/BaseStatusBar$TouchOutsideListener;->mPanel:Lcom/android/systemui/statusbar/tablet/StatusBarPanel;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    float-to-int v3, v3

    invoke-interface {v1, v2, v3}, Lcom/android/systemui/statusbar/tablet/StatusBarPanel;->isInContentArea(II)Z

    move-result v1

    if-nez v1, :cond_1

    .line 692
    :cond_0
    iget-object v1, p0, Lcom/android/systemui/statusbar/BaseStatusBar$TouchOutsideListener;->this$0:Lcom/android/systemui/statusbar/BaseStatusBar;

    iget-object v1, v1, Lcom/android/systemui/statusbar/BaseStatusBar;->mHandler:Lcom/android/systemui/statusbar/BaseStatusBar$H;

    iget v2, p0, Lcom/android/systemui/statusbar/BaseStatusBar$TouchOutsideListener;->mMsg:I

    invoke-virtual {v1, v2}, Lcom/android/systemui/statusbar/BaseStatusBar$H;->removeMessages(I)V

    .line 693
    iget-object v1, p0, Lcom/android/systemui/statusbar/BaseStatusBar$TouchOutsideListener;->this$0:Lcom/android/systemui/statusbar/BaseStatusBar;

    iget-object v1, v1, Lcom/android/systemui/statusbar/BaseStatusBar;->mHandler:Lcom/android/systemui/statusbar/BaseStatusBar$H;

    iget v2, p0, Lcom/android/systemui/statusbar/BaseStatusBar$TouchOutsideListener;->mMsg:I

    invoke-virtual {v1, v2}, Lcom/android/systemui/statusbar/BaseStatusBar$H;->sendEmptyMessage(I)Z

    .line 694
    const/4 v1, 0x1

    .line 696
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
