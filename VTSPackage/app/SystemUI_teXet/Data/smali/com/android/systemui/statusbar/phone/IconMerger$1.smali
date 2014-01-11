.class Lcom/android/systemui/statusbar/phone/IconMerger$1;
.super Ljava/lang/Object;
.source "IconMerger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/phone/IconMerger;->checkOverflow(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/phone/IconMerger;

.field final synthetic val$moreRequired:Z


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/phone/IconMerger;Z)V
    .registers 3
    .parameter
    .parameter

    .prologue
    .line 80
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/IconMerger$1;->this$0:Lcom/android/systemui/statusbar/phone/IconMerger;

    iput-boolean p2, p0, Lcom/android/systemui/statusbar/phone/IconMerger$1;->val$moreRequired:Z

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 83
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/IconMerger$1;->this$0:Lcom/android/systemui/statusbar/phone/IconMerger;

    invoke-static {v0}, Lcom/android/systemui/statusbar/phone/IconMerger;->access$000(Lcom/android/systemui/statusbar/phone/IconMerger;)Landroid/view/View;

    move-result-object v1

    iget-boolean v0, p0, Lcom/android/systemui/statusbar/phone/IconMerger$1;->val$moreRequired:Z

    if-eqz v0, :cond_f

    const/4 v0, 0x0

    :goto_b
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 84
    return-void

    .line 83
    :cond_f
    const/16 v0, 0x8

    goto :goto_b
.end method
