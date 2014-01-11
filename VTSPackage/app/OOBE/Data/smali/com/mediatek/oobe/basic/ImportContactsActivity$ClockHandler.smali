.class Lcom/mediatek/oobe/basic/ImportContactsActivity$ClockHandler;
.super Landroid/os/Handler;
.source "ImportContactsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/ImportContactsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ClockHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;


# direct methods
.method private constructor <init>(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 267
    iput-object p1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$ClockHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 270
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 278
    :goto_0
    return-void

    .line 272
    :pswitch_0
    const-string v0, "ClockHandler"

    const-string v1, "Time out"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$ClockHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #calls: Lcom/mediatek/oobe/basic/ImportContactsActivity;->startQuery()V
    invoke-static {v0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$500(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V

    goto :goto_0

    .line 270
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
