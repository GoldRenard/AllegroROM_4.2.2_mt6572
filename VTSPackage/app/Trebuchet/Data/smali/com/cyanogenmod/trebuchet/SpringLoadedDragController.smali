.class public Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;
.super Ljava/lang/Object;
.source "SpringLoadedDragController.java"

# interfaces
.implements Lcom/cyanogenmod/trebuchet/OnAlarmListener;


# instance fields
.field final ENTER_SPRING_LOAD_CANCEL_HOVER_TIME:J

.field final ENTER_SPRING_LOAD_HOVER_TIME:J

.field final EXIT_SPRING_LOAD_HOVER_TIME:J

.field mAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

.field private mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

.field private mScreen:Lcom/cyanogenmod/trebuchet/CellLayout;


# direct methods
.method public constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;)V
    .locals 2
    .parameter "launcher"

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const-wide/16 v0, 0x1f4

    iput-wide v0, p0, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;->ENTER_SPRING_LOAD_HOVER_TIME:J

    .line 24
    const-wide/16 v0, 0x3b6

    iput-wide v0, p0, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;->ENTER_SPRING_LOAD_CANCEL_HOVER_TIME:J

    .line 25
    const-wide/16 v0, 0xc8

    iput-wide v0, p0, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;->EXIT_SPRING_LOAD_HOVER_TIME:J

    .line 34
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    .line 35
    new-instance v0, Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-direct {v0}, Lcom/cyanogenmod/trebuchet/Alarm;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;->mAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    .line 36
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;->mAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-virtual {v0, p0}, Lcom/cyanogenmod/trebuchet/Alarm;->setOnAlarmListener(Lcom/cyanogenmod/trebuchet/OnAlarmListener;)V

    .line 37
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;->mAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Alarm;->cancelAlarm()V

    .line 41
    return-void
.end method

.method public onAlarm(Lcom/cyanogenmod/trebuchet/Alarm;)V
    .locals 3
    .parameter "alarm"

    .prologue
    .line 53
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;->mScreen:Lcom/cyanogenmod/trebuchet/CellLayout;

    if-eqz v2, :cond_1

    .line 55
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;->mScreen:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/PagedView;

    .line 56
    .local v1, pagedView:Lcom/cyanogenmod/trebuchet/PagedView;
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;->mScreen:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/PagedView;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 57
    .local v0, page:I
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/PagedView;->getCurrentPage()I

    move-result v2

    if-eq v0, v2, :cond_0

    .line 58
    invoke-virtual {v1, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(I)V

    .line 63
    .end local v0           #page:I
    .end local v1           #pagedView:Lcom/cyanogenmod/trebuchet/PagedView;
    :cond_0
    :goto_0
    return-void

    .line 61
    :cond_1
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragController()Lcom/cyanogenmod/trebuchet/DragController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/DragController;->cancelDrag()V

    goto :goto_0
.end method

.method public setAlarm(Lcom/cyanogenmod/trebuchet/CellLayout;)V
    .locals 3
    .parameter "cl"

    .prologue
    .line 45
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;->mAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Alarm;->cancelAlarm()V

    .line 46
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;->mAlarm:Lcom/cyanogenmod/trebuchet/Alarm;

    if-nez p1, :cond_0

    const-wide/16 v0, 0x3b6

    :goto_0
    invoke-virtual {v2, v0, v1}, Lcom/cyanogenmod/trebuchet/Alarm;->setAlarm(J)V

    .line 48
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/SpringLoadedDragController;->mScreen:Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 49
    return-void

    .line 46
    :cond_0
    const-wide/16 v0, 0x1f4

    goto :goto_0
.end method
