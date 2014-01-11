.class public abstract Landroid/view/InputEventReceiver;
.super Ljava/lang/Object;
.source "InputEventReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/view/InputEventReceiver$Factory;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "InputEventReceiver"


# instance fields
.field private final mCloseGuard:Ldalvik/system/CloseGuard;

.field private mInputChannel:Landroid/view/InputChannel;

.field private mMessageQueue:Landroid/os/MessageQueue;

.field private mReceiverPtr:I

.field private final mSeqMap:Landroid/util/SparseIntArray;


# direct methods
.method public constructor <init>(Landroid/view/InputChannel;Landroid/os/Looper;)V
    .locals 2
    .parameter "inputChannel"
    .parameter "looper"

    .prologue
    .line 58
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 33
    invoke-static {}, Ldalvik/system/CloseGuard;->get()Ldalvik/system/CloseGuard;

    move-result-object v0

    iput-object v0, p0, Landroid/view/InputEventReceiver;->mCloseGuard:Ldalvik/system/CloseGuard;

    .line 43
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroid/view/InputEventReceiver;->mSeqMap:Landroid/util/SparseIntArray;

    .line 59
    if-nez p1, :cond_0

    .line 60
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "inputChannel must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 62
    :cond_0
    if-nez p2, :cond_1

    .line 63
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "looper must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_1
    iput-object p1, p0, Landroid/view/InputEventReceiver;->mInputChannel:Landroid/view/InputChannel;

    .line 67
    invoke-virtual {p2}, Landroid/os/Looper;->getQueue()Landroid/os/MessageQueue;

    move-result-object v0

    iput-object v0, p0, Landroid/view/InputEventReceiver;->mMessageQueue:Landroid/os/MessageQueue;

    .line 68
    iget-object v0, p0, Landroid/view/InputEventReceiver;->mMessageQueue:Landroid/os/MessageQueue;

    invoke-static {p0, p1, v0}, Landroid/view/InputEventReceiver;->nativeInit(Landroid/view/InputEventReceiver;Landroid/view/InputChannel;Landroid/os/MessageQueue;)I

    move-result v0

    iput v0, p0, Landroid/view/InputEventReceiver;->mReceiverPtr:I

    .line 70
    iget-object v0, p0, Landroid/view/InputEventReceiver;->mCloseGuard:Ldalvik/system/CloseGuard;

    const-string v1, "dispose"

    invoke-virtual {v0, v1}, Ldalvik/system/CloseGuard;->open(Ljava/lang/String;)V

    .line 71
    return-void
.end method

.method private dispatchBatchedInputEventPending()V
    .locals 0

    .prologue
    .line 185
    invoke-virtual {p0}, Landroid/view/InputEventReceiver;->onBatchedInputEventPending()V

    .line 186
    return-void
.end method

.method private dispatchInputEvent(ILandroid/view/InputEvent;)V
    .locals 2
    .parameter "seq"
    .parameter "event"

    .prologue
    .line 178
    iget-object v0, p0, Landroid/view/InputEventReceiver;->mSeqMap:Landroid/util/SparseIntArray;

    invoke-virtual {p2}, Landroid/view/InputEvent;->getSequenceNumber()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/util/SparseIntArray;->put(II)V

    .line 179
    invoke-virtual {p0, p2}, Landroid/view/InputEventReceiver;->onInputEvent(Landroid/view/InputEvent;)V

    .line 180
    return-void
.end method

.method private dispose(Z)V
    .locals 2
    .parameter "finalized"

    .prologue
    const/4 v1, 0x0

    .line 90
    iget-object v0, p0, Landroid/view/InputEventReceiver;->mCloseGuard:Ldalvik/system/CloseGuard;

    if-eqz v0, :cond_1

    .line 91
    if-eqz p1, :cond_0

    .line 92
    iget-object v0, p0, Landroid/view/InputEventReceiver;->mCloseGuard:Ldalvik/system/CloseGuard;

    invoke-virtual {v0}, Ldalvik/system/CloseGuard;->warnIfOpen()V

    .line 94
    :cond_0
    iget-object v0, p0, Landroid/view/InputEventReceiver;->mCloseGuard:Ldalvik/system/CloseGuard;

    invoke-virtual {v0}, Ldalvik/system/CloseGuard;->close()V

    .line 97
    :cond_1
    iget v0, p0, Landroid/view/InputEventReceiver;->mReceiverPtr:I

    if-eqz v0, :cond_2

    .line 98
    iget v0, p0, Landroid/view/InputEventReceiver;->mReceiverPtr:I

    invoke-static {v0}, Landroid/view/InputEventReceiver;->nativeDispose(I)V

    .line 99
    const/4 v0, 0x0

    iput v0, p0, Landroid/view/InputEventReceiver;->mReceiverPtr:I

    .line 101
    :cond_2
    iput-object v1, p0, Landroid/view/InputEventReceiver;->mInputChannel:Landroid/view/InputChannel;

    .line 102
    iput-object v1, p0, Landroid/view/InputEventReceiver;->mMessageQueue:Landroid/os/MessageQueue;

    .line 103
    return-void
.end method

.method private static native nativeConsumeBatchedInputEvents(IJ)V
.end method

.method private static native nativeDispose(I)V
.end method

.method private static native nativeFinishInputEvent(IIZ)V
.end method

.method private static native nativeInit(Landroid/view/InputEventReceiver;Landroid/view/InputChannel;Landroid/os/MessageQueue;)I
.end method


# virtual methods
.method public final consumeBatchedInputEvents(J)V
    .locals 2
    .parameter "frameTimeNanos"

    .prologue
    .line 167
    iget v0, p0, Landroid/view/InputEventReceiver;->mReceiverPtr:I

    if-nez v0, :cond_0

    .line 168
    const-string v0, "InputEventReceiver"

    const-string v1, "Attempted to consume batched input events but the input event receiver has already been disposed."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    :goto_0
    return-void

    .line 171
    :cond_0
    iget v0, p0, Landroid/view/InputEventReceiver;->mReceiverPtr:I

    invoke-static {v0, p1, p2}, Landroid/view/InputEventReceiver;->nativeConsumeBatchedInputEvents(IJ)V

    goto :goto_0
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 86
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/view/InputEventReceiver;->dispose(Z)V

    .line 87
    return-void
.end method

.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 76
    const/4 v0, 0x1

    :try_start_0
    invoke-direct {p0, v0}, Landroid/view/InputEventReceiver;->dispose(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 80
    return-void

    .line 78
    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public final finishInputEvent(Landroid/view/InputEvent;Z)V
    .locals 4
    .parameter "event"
    .parameter "handled"

    .prologue
    .line 137
    if-nez p1, :cond_0

    .line 138
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "event must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 140
    :cond_0
    iget v2, p0, Landroid/view/InputEventReceiver;->mReceiverPtr:I

    if-nez v2, :cond_1

    .line 141
    const-string v2, "InputEventReceiver"

    const-string v3, "Attempted to finish an input event but the input event receiver has already been disposed."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    :goto_0
    invoke-virtual {p1}, Landroid/view/InputEvent;->recycleIfNeededAfterDispatch()V

    .line 154
    return-void

    .line 144
    :cond_1
    iget-object v2, p0, Landroid/view/InputEventReceiver;->mSeqMap:Landroid/util/SparseIntArray;

    invoke-virtual {p1}, Landroid/view/InputEvent;->getSequenceNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v0

    .line 145
    .local v0, index:I
    if-gez v0, :cond_2

    .line 146
    const-string v2, "InputEventReceiver"

    const-string v3, "Attempted to finish an input event that is not in progress."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 148
    :cond_2
    iget-object v2, p0, Landroid/view/InputEventReceiver;->mSeqMap:Landroid/util/SparseIntArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v1

    .line 149
    .local v1, seq:I
    iget-object v2, p0, Landroid/view/InputEventReceiver;->mSeqMap:Landroid/util/SparseIntArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseIntArray;->removeAt(I)V

    .line 150
    iget v2, p0, Landroid/view/InputEventReceiver;->mReceiverPtr:I

    invoke-static {v2, v1, p2}, Landroid/view/InputEventReceiver;->nativeFinishInputEvent(IIZ)V

    goto :goto_0
.end method

.method public onBatchedInputEventPending()V
    .locals 2

    .prologue
    .line 126
    const-wide/16 v0, -0x1

    invoke-virtual {p0, v0, v1}, Landroid/view/InputEventReceiver;->consumeBatchedInputEvents(J)V

    .line 127
    return-void
.end method

.method public onInputEvent(Landroid/view/InputEvent;)V
    .locals 1
    .parameter "event"

    .prologue
    .line 114
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/view/InputEventReceiver;->finishInputEvent(Landroid/view/InputEvent;Z)V

    .line 115
    return-void
.end method
