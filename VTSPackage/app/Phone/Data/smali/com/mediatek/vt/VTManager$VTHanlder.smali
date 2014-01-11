.class Lcom/mediatek/vt/VTManager$VTHanlder;
.super Landroid/os/Handler;
.source "VTManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/vt/VTManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VTHanlder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/vt/VTManager;


# direct methods
.method private constructor <init>(Lcom/mediatek/vt/VTManager;)V
    .locals 0
    .parameter

    .prologue
    .line 593
    iput-object p1, p0, Lcom/mediatek/vt/VTManager$VTHanlder;->this$0:Lcom/mediatek/vt/VTManager;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/vt/VTManager;Lcom/mediatek/vt/VTManager$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 593
    invoke-direct {p0, p1}, Lcom/mediatek/vt/VTManager$VTHanlder;-><init>(Lcom/mediatek/vt/VTManager;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 596
    iget v0, p1, Landroid/os/Message;->what:I

    sparse-switch v0, :sswitch_data_0

    .line 612
    :goto_0
    return-void

    .line 598
    :sswitch_0
    iget-object v0, p0, Lcom/mediatek/vt/VTManager$VTHanlder;->this$0:Lcom/mediatek/vt/VTManager;

    #calls: Lcom/mediatek/vt/VTManager;->setVTCloseImpl()V
    invoke-static {v0}, Lcom/mediatek/vt/VTManager;->access$300(Lcom/mediatek/vt/VTManager;)V

    goto :goto_0

    .line 601
    :sswitch_1
    iget-object v0, p0, Lcom/mediatek/vt/VTManager$VTHanlder;->this$0:Lcom/mediatek/vt/VTManager;

    #calls: Lcom/mediatek/vt/VTManager;->setVTOpenImpl()V
    invoke-static {v0}, Lcom/mediatek/vt/VTManager;->access$400(Lcom/mediatek/vt/VTManager;)V

    goto :goto_0

    .line 604
    :sswitch_2
    iget-object v0, p0, Lcom/mediatek/vt/VTManager$VTHanlder;->this$0:Lcom/mediatek/vt/VTManager;

    #calls: Lcom/mediatek/vt/VTManager;->setVTReadyImpl()V
    invoke-static {v0}, Lcom/mediatek/vt/VTManager;->access$500(Lcom/mediatek/vt/VTManager;)V

    goto :goto_0

    .line 607
    :sswitch_3
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    goto :goto_0

    .line 596
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x8000000 -> :sswitch_3
    .end sparse-switch
.end method
