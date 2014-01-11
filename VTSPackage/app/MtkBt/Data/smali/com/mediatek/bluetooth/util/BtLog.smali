.class public Lcom/mediatek/bluetooth/util/BtLog;
.super Ljava/lang/Object;
.source "BtLog.java"


# static fields
.field private static final DEVELOPMENT:Z = true

.field private static final LAYER:Ljava/lang/String; = "[MMI]"

.field private static final TAG:Ljava/lang/String; = "BT"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static d(Ljava/lang/String;)V
    .locals 3
    .parameter "message"

    .prologue
    const/4 v2, 0x3

    .line 109
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    aget-object v0, v0, v2

    const-string v1, "BT"

    invoke-static {v2, v0, v1, p0}, Lcom/mediatek/bluetooth/util/BtLog;->doLog(ILjava/lang/StackTraceElement;Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    return-void
.end method

.method public static doLog(ILjava/lang/StackTraceElement;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "priority"
    .parameter "stack"
    .parameter "tag"
    .parameter "message"

    .prologue
    .line 58
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    .line 59
    .local v0, classname:Ljava/lang/String;
    const/16 v2, 0x2e

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 60
    .local v1, idx:I
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 63
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[MMI]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 74
    move-object p2, v0

    .line 77
    invoke-static {p0, p2, p3}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 78
    return-void
.end method

.method public static e(Ljava/lang/String;)V
    .locals 3
    .parameter "message"

    .prologue
    .line 142
    const/4 v0, 0x6

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    const/4 v2, 0x3

    aget-object v1, v1, v2

    const-string v2, "BT"

    invoke-static {v0, v1, v2, p0}, Lcom/mediatek/bluetooth/util/BtLog;->doLog(ILjava/lang/StackTraceElement;Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3
    .parameter "message"
    .parameter "throwable"

    .prologue
    .line 151
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 155
    const/4 v0, 0x6

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    const/4 v2, 0x3

    aget-object v1, v1, v2

    const-string v2, "BT"

    invoke-static {v0, v1, v2, p0}, Lcom/mediatek/bluetooth/util/BtLog;->doLog(ILjava/lang/StackTraceElement;Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    return-void
.end method

.method public static i(Ljava/lang/String;)V
    .locals 3
    .parameter "message"

    .prologue
    .line 120
    const/4 v0, 0x4

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    const/4 v2, 0x3

    aget-object v1, v1, v2

    const-string v2, "BT"

    invoke-static {v0, v1, v2, p0}, Lcom/mediatek/bluetooth/util/BtLog;->doLog(ILjava/lang/StackTraceElement;Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    return-void
.end method

.method public static printStackTrace()V
    .locals 8

    .prologue
    .line 82
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v5

    .line 83
    .local v5, ste:[Ljava/lang/StackTraceElement;
    const-string v6, "=================== Stack Trace ====================="

    invoke-static {v6}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V

    .line 84
    move-object v0, v5

    .local v0, arr$:[Ljava/lang/StackTraceElement;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 86
    .local v1, e:Ljava/lang/StackTraceElement;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .local v4, msg:Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V

    .line 84
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 92
    .end local v1           #e:Ljava/lang/StackTraceElement;
    .end local v4           #msg:Ljava/lang/StringBuilder;
    :cond_0
    return-void
.end method

.method public static v(Ljava/lang/String;)V
    .locals 3
    .parameter "message"

    .prologue
    .line 98
    const/4 v0, 0x2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    const/4 v2, 0x3

    aget-object v1, v1, v2

    const-string v2, "BT"

    invoke-static {v0, v1, v2, p0}, Lcom/mediatek/bluetooth/util/BtLog;->doLog(ILjava/lang/StackTraceElement;Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    return-void
.end method

.method public static w(Ljava/lang/String;)V
    .locals 3
    .parameter "message"

    .prologue
    .line 131
    const/4 v0, 0x5

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    const/4 v2, 0x3

    aget-object v1, v1, v2

    const-string v2, "BT"

    invoke-static {v0, v1, v2, p0}, Lcom/mediatek/bluetooth/util/BtLog;->doLog(ILjava/lang/StackTraceElement;Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    return-void
.end method
