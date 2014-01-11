.class Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$1;
.super Landroid/os/Handler;
.source "BTAvrcpMusicAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)V
    .locals 0
    .parameter

    .prologue
    .line 1095
    iput-object p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$1;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 1098
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$1;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    invoke-virtual {v0, p1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->passToHandleMessage(Landroid/os/Message;)V

    .line 1099
    return-void
.end method
