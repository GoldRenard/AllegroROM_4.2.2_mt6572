.class Lcom/mediatek/settings/MultipleSimActivity$1;
.super Landroid/telephony/PhoneStateListener;
.source "MultipleSimActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/MultipleSimActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/MultipleSimActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/MultipleSimActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 175
    iput-object p1, p0, Lcom/mediatek/settings/MultipleSimActivity$1;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 3
    .parameter "state"
    .parameter "incomingNumber"

    .prologue
    .line 178
    invoke-super {p0, p1, p2}, Landroid/telephony/PhoneStateListener;->onCallStateChanged(ILjava/lang/String;)V

    .line 179
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity$1;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCallStateChanged ans state is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/settings/MultipleSimActivity;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/settings/MultipleSimActivity;->access$100(Lcom/mediatek/settings/MultipleSimActivity;Ljava/lang/String;)V

    .line 180
    packed-switch p1, :pswitch_data_0

    .line 187
    :goto_0
    return-void

    .line 182
    :pswitch_0
    iget-object v0, p0, Lcom/mediatek/settings/MultipleSimActivity$1;->this$0:Lcom/mediatek/settings/MultipleSimActivity;

    #calls: Lcom/mediatek/settings/MultipleSimActivity;->updatePreferenceEnableState()V
    invoke-static {v0}, Lcom/mediatek/settings/MultipleSimActivity;->access$600(Lcom/mediatek/settings/MultipleSimActivity;)V

    goto :goto_0

    .line 180
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
