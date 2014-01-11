.class Lcom/android/systemui/SearchPanelView$1;
.super Ljava/lang/Object;
.source "SearchPanelView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/SearchPanelView;->onAnimationStarted()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/SearchPanelView;


# direct methods
.method constructor <init>(Lcom/android/systemui/SearchPanelView;)V
    .locals 0
    .parameter

    .prologue
    .line 158
    iput-object p1, p0, Lcom/android/systemui/SearchPanelView$1;->this$0:Lcom/android/systemui/SearchPanelView;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 160
    iget-object v0, p0, Lcom/android/systemui/SearchPanelView$1;->this$0:Lcom/android/systemui/SearchPanelView;

    iget-object v0, v0, Lcom/android/systemui/SearchPanelView;->mGlowPadViewListener:Lcom/android/systemui/SearchPanelView$GlowPadTriggerListener;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/android/systemui/SearchPanelView$GlowPadTriggerListener;->mWaitingForLaunch:Z

    .line 161
    iget-object v0, p0, Lcom/android/systemui/SearchPanelView$1;->this$0:Lcom/android/systemui/SearchPanelView;

    #getter for: Lcom/android/systemui/SearchPanelView;->mBar:Lcom/android/systemui/statusbar/BaseStatusBar;
    invoke-static {v0}, Lcom/android/systemui/SearchPanelView;->access$000(Lcom/android/systemui/SearchPanelView;)Lcom/android/systemui/statusbar/BaseStatusBar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/BaseStatusBar;->hideSearchPanel()V

    .line 162
    return-void
.end method
