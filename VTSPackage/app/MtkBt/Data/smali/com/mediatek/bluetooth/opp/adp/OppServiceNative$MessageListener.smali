.class Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$MessageListener;
.super Ljava/lang/Thread;
.source "OppServiceNative.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MessageListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;


# direct methods
.method public constructor <init>(Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;)V
    .locals 1
    .parameter

    .prologue
    .line 986
    iput-object p1, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$MessageListener;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;

    .line 988
    const-string v0, "BtOppMessageListener"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 989
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 994
    const-string v0, "BtTask MessageListener thread starting..."

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 997
    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 999
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$MessageListener;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->startListenNative()V

    .line 1001
    const-string v0, "BtTask MessageListener thread stopped."

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 1002
    return-void
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 1013
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$MessageListener;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->stopListenNative()V

    .line 1014
    return-void
.end method

.method public startup()V
    .locals 0

    .prologue
    .line 1006
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$MessageListener;->start()V

    .line 1007
    return-void
.end method
