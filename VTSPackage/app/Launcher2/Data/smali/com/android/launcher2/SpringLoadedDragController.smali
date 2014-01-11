.class public Lcom/android/launcher2/SpringLoadedDragController;
.super Ljava/lang/Object;
.source "SpringLoadedDragController.java"

# interfaces
.implements Lcom/android/launcher2/OnAlarmListener;


# instance fields
.field final ENTER_SPRING_LOAD_CANCEL_HOVER_TIME:J

.field final ENTER_SPRING_LOAD_HOVER_TIME:J

.field final EXIT_SPRING_LOAD_HOVER_TIME:J

.field mAlarm:Lcom/android/launcher2/Alarm;

.field private mLauncher:Lcom/android/launcher2/Launcher;

.field private mScreen:Lcom/android/launcher2/CellLayout;


# direct methods
.method public constructor <init>(Lcom/android/launcher2/Launcher;)V
    .locals 2
    .parameter "launcher"

    .prologue
    .line 31
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const-wide/16 v0, 0x1f4

    iput-wide v0, p0, Lcom/android/launcher2/SpringLoadedDragController;->ENTER_SPRING_LOAD_HOVER_TIME:J

    .line 22
    const-wide/16 v0, 0x3b6

    iput-wide v0, p0, Lcom/android/launcher2/SpringLoadedDragController;->ENTER_SPRING_LOAD_CANCEL_HOVER_TIME:J

    .line 23
    const-wide/16 v0, 0xc8

    iput-wide v0, p0, Lcom/android/launcher2/SpringLoadedDragController;->EXIT_SPRING_LOAD_HOVER_TIME:J

    .line 32
    iput-object p1, p0, Lcom/android/launcher2/SpringLoadedDragController;->mLauncher:Lcom/android/launcher2/Launcher;

    .line 33
    new-instance v0, Lcom/android/launcher2/Alarm;

    invoke-direct {v0}, Lcom/android/launcher2/Alarm;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/SpringLoadedDragController;->mAlarm:Lcom/android/launcher2/Alarm;

    .line 34
    iget-object v0, p0, Lcom/android/launcher2/SpringLoadedDragController;->mAlarm:Lcom/android/launcher2/Alarm;

    invoke-virtual {v0, p0}, Lcom/android/launcher2/Alarm;->setOnAlarmListener(Lcom/android/launcher2/OnAlarmListener;)V

    .line 35
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/android/launcher2/SpringLoadedDragController;->mAlarm:Lcom/android/launcher2/Alarm;

    invoke-virtual {v0}, Lcom/android/launcher2/Alarm;->cancelAlarm()V

    .line 39
    return-void
.end method

.method public onAlarm(Lcom/android/launcher2/Alarm;)V
    .locals 3
    .parameter "alarm"

    .prologue
    .line 51
    iget-object v2, p0, Lcom/android/launcher2/SpringLoadedDragController;->mScreen:Lcom/android/launcher2/CellLayout;

    if-eqz v2, :cond_1

    .line 53
    iget-object v2, p0, Lcom/android/launcher2/SpringLoadedDragController;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v1

    .line 54
    .local v1, w:Lcom/android/launcher2/Workspace;
    iget-object v2, p0, Lcom/android/launcher2/SpringLoadedDragController;->mScreen:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v1, v2}, Lcom/android/launcher2/Workspace;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 55
    .local v0, page:I
    invoke-virtual {v1}, Lcom/android/launcher2/Workspace;->getCurrentPage()I

    move-result v2

    if-eq v0, v2, :cond_0

    .line 56
    invoke-virtual {v1, v0}, Lcom/android/launcher2/Workspace;->snapToPage(I)V

    .line 61
    .end local v0           #page:I
    .end local v1           #w:Lcom/android/launcher2/Workspace;
    :cond_0
    :goto_0
    return-void

    .line 59
    :cond_1
    iget-object v2, p0, Lcom/android/launcher2/SpringLoadedDragController;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getDragController()Lcom/android/launcher2/DragController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/launcher2/DragController;->cancelDrag()V

    goto :goto_0
.end method

.method public setAlarm(Lcom/android/launcher2/CellLayout;)V
    .locals 3
    .parameter "cl"

    .prologue
    .line 43
    iget-object v0, p0, Lcom/android/launcher2/SpringLoadedDragController;->mAlarm:Lcom/android/launcher2/Alarm;

    invoke-virtual {v0}, Lcom/android/launcher2/Alarm;->cancelAlarm()V

    .line 44
    iget-object v2, p0, Lcom/android/launcher2/SpringLoadedDragController;->mAlarm:Lcom/android/launcher2/Alarm;

    if-nez p1, :cond_0

    const-wide/16 v0, 0x3b6

    :goto_0
    invoke-virtual {v2, v0, v1}, Lcom/android/launcher2/Alarm;->setAlarm(J)V

    .line 46
    iput-object p1, p0, Lcom/android/launcher2/SpringLoadedDragController;->mScreen:Lcom/android/launcher2/CellLayout;

    .line 47
    return-void

    .line 44
    :cond_0
    const-wide/16 v0, 0x1f4

    goto :goto_0
.end method
