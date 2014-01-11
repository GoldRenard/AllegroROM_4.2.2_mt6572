.class Lcom/mtk/vtautoanswer/VTAutoAnswerEnable$CustomTimerTask;
.super Ljava/util/TimerTask;
.source "VTAutoAnswerEnable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mtk/vtautoanswer/VTAutoAnswerEnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CustomTimerTask"
.end annotation


# instance fields
.field private activity:Landroid/app/Activity;

.field final synthetic this$0:Lcom/mtk/vtautoanswer/VTAutoAnswerEnable;


# direct methods
.method public constructor <init>(Lcom/mtk/vtautoanswer/VTAutoAnswerEnable;Landroid/app/Activity;)V
    .locals 0
    .parameter
    .parameter "activity"

    .prologue
    .line 52
    iput-object p1, p0, Lcom/mtk/vtautoanswer/VTAutoAnswerEnable$CustomTimerTask;->this$0:Lcom/mtk/vtautoanswer/VTAutoAnswerEnable;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 53
    iput-object p2, p0, Lcom/mtk/vtautoanswer/VTAutoAnswerEnable$CustomTimerTask;->activity:Landroid/app/Activity;

    .line 54
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/mtk/vtautoanswer/VTAutoAnswerEnable$CustomTimerTask;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 60
    return-void
.end method
