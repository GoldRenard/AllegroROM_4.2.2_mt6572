.class Lcom/google/common/eventbus/EventBus$EventWithHandler;
.super Ljava/lang/Object;
.source "EventBus.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/eventbus/EventBus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "EventWithHandler"
.end annotation


# instance fields
.field final event:Ljava/lang/Object;

.field final handler:Lcom/google/common/eventbus/EventHandler;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lcom/google/common/eventbus/EventHandler;)V
    .locals 0
    .parameter "event"
    .parameter "handler"

    .prologue
    .line 364
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 365
    iput-object p1, p0, Lcom/google/common/eventbus/EventBus$EventWithHandler;->event:Ljava/lang/Object;

    .line 366
    iput-object p2, p0, Lcom/google/common/eventbus/EventBus$EventWithHandler;->handler:Lcom/google/common/eventbus/EventHandler;

    .line 367
    return-void
.end method
