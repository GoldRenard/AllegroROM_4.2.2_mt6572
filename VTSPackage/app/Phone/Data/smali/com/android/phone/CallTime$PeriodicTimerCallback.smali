.class Lcom/android/phone/CallTime$PeriodicTimerCallback;
.super Ljava/lang/Object;
.source "CallTime.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/CallTime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PeriodicTimerCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/CallTime;


# direct methods
.method constructor <init>(Lcom/android/phone/CallTime;)V
    .locals 0
    .parameter

    .prologue
    .line 289
    iput-object p1, p0, Lcom/android/phone/CallTime$PeriodicTimerCallback;->this$0:Lcom/android/phone/CallTime;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 291
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 294
    const-string v0, "PeriodicTimerCallback\'s run() is called"

    #calls: Lcom/android/phone/CallTime;->log(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/android/phone/CallTime;->access$000(Ljava/lang/String;)V

    .line 295
    iget-object v0, p0, Lcom/android/phone/CallTime$PeriodicTimerCallback;->this$0:Lcom/android/phone/CallTime;

    iget-object v1, p0, Lcom/android/phone/CallTime$PeriodicTimerCallback;->this$0:Lcom/android/phone/CallTime;

    const/16 v2, 0x6f

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/phone/CallTime;->sendMessageAtFrontOfQueue(Landroid/os/Message;)Z

    .line 296
    return-void
.end method
