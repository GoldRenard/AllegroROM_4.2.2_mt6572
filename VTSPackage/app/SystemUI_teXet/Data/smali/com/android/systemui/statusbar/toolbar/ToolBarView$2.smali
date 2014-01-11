.class Lcom/android/systemui/statusbar/toolbar/ToolBarView$2;
.super Ljava/lang/Object;
.source "ToolBarView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/toolbar/ToolBarView;->onAttachedToWindow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/toolbar/ToolBarView;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/toolbar/ToolBarView;)V
    .registers 2
    .parameter

    .prologue
    .line 321
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$2;->this$0:Lcom/android/systemui/statusbar/toolbar/ToolBarView;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 324
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$2;->this$0:Lcom/android/systemui/statusbar/toolbar/ToolBarView;

    invoke-static {v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->access$200(Lcom/android/systemui/statusbar/toolbar/ToolBarView;)V

    .line 325
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$2;->this$0:Lcom/android/systemui/statusbar/toolbar/ToolBarView;

    iget-object v0, v0, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->mSimSwitchPanelView:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->setUpdates(Z)V

    .line 326
    return-void
.end method
