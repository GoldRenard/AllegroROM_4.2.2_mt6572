.class Lcom/mediatek/settings/NetworkEditor$1;
.super Landroid/telephony/PhoneStateListener;
.source "NetworkEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/NetworkEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/NetworkEditor;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/NetworkEditor;)V
    .locals 0
    .parameter

    .prologue
    .line 88
    iput-object p1, p0, Lcom/mediatek/settings/NetworkEditor$1;->this$0:Lcom/mediatek/settings/NetworkEditor;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 1
    .parameter "state"
    .parameter "incomingNumber"

    .prologue
    .line 91
    invoke-super {p0, p1, p2}, Landroid/telephony/PhoneStateListener;->onCallStateChanged(ILjava/lang/String;)V

    .line 92
    packed-switch p1, :pswitch_data_0

    .line 99
    :goto_0
    return-void

    .line 94
    :pswitch_0
    iget-object v0, p0, Lcom/mediatek/settings/NetworkEditor$1;->this$0:Lcom/mediatek/settings/NetworkEditor;

    #calls: Lcom/mediatek/settings/NetworkEditor;->setScreenEnabled()V
    invoke-static {v0}, Lcom/mediatek/settings/NetworkEditor;->access$000(Lcom/mediatek/settings/NetworkEditor;)V

    goto :goto_0

    .line 92
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
