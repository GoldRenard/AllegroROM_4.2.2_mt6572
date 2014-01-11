.class Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView$1;
.super Landroid/os/Handler;
.source "PowerOffAlarmView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView;)V
    .locals 0
    .parameter

    .prologue
    .line 100
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 103
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 113
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 105
    :pswitch_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView;

    #calls: Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView;->triggerPing()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView;->access$000(Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView;)V

    goto :goto_0

    .line 108
    :pswitch_2
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView;->titleView:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView;->access$100(Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView;)Landroid/widget/TextView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView$1;->this$0:Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView;->titleView:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView;->access$100(Lcom/android/internal/policy/impl/keyguard/PowerOffAlarmView;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "label"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 103
    :pswitch_data_0
    .packed-switch 0x63
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
