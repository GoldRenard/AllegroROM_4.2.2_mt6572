.class Lcom/mediatek/phone/VoiceCommandHandler$1;
.super Lcom/mediatek/common/voicecommand/VoiceCommandListener;
.source "VoiceCommandHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/phone/VoiceCommandHandler;-><init>(Landroid/content/Context;Lcom/mediatek/phone/VoiceCommandHandler$Listener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/phone/VoiceCommandHandler;


# direct methods
.method constructor <init>(Lcom/mediatek/phone/VoiceCommandHandler;Landroid/content/Context;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 34
    iput-object p1, p0, Lcom/mediatek/phone/VoiceCommandHandler$1;->this$0:Lcom/mediatek/phone/VoiceCommandHandler;

    invoke-direct {p0, p2}, Lcom/mediatek/common/voicecommand/VoiceCommandListener;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onVoiceCommandNotified(IILandroid/os/Bundle;)V
    .locals 1
    .parameter "mainAction"
    .parameter "subAction"
    .parameter "extraData"

    .prologue
    .line 37
    const/4 v0, 0x1

    if-ne v0, p1, :cond_1

    .line 38
    iget-object v0, p0, Lcom/mediatek/phone/VoiceCommandHandler$1;->this$0:Lcom/mediatek/phone/VoiceCommandHandler;

    #calls: Lcom/mediatek/phone/VoiceCommandHandler;->handleCommonVoiceCommand(ILandroid/os/Bundle;)V
    invoke-static {v0, p2, p3}, Lcom/mediatek/phone/VoiceCommandHandler;->access$000(Lcom/mediatek/phone/VoiceCommandHandler;ILandroid/os/Bundle;)V

    .line 42
    :cond_0
    :goto_0
    return-void

    .line 39
    :cond_1
    const/4 v0, 0x2

    if-ne v0, p1, :cond_0

    .line 40
    iget-object v0, p0, Lcom/mediatek/phone/VoiceCommandHandler$1;->this$0:Lcom/mediatek/phone/VoiceCommandHandler;

    #calls: Lcom/mediatek/phone/VoiceCommandHandler;->handleUIVoiceCommand(ILandroid/os/Bundle;)V
    invoke-static {v0, p2, p3}, Lcom/mediatek/phone/VoiceCommandHandler;->access$100(Lcom/mediatek/phone/VoiceCommandHandler;ILandroid/os/Bundle;)V

    goto :goto_0
.end method
