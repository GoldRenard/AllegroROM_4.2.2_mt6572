.class Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$1;
.super Landroid/os/Handler;
.source "KeyguardUpdateMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;)V
    .locals 0
    .parameter

    .prologue
    .line 100
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 103
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 138
    :goto_0
    return-void

    .line 105
    :pswitch_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->handleTimeUpdate()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->access$000(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;)V

    goto :goto_0

    .line 108
    :pswitch_1
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$BatteryStatus;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->handleBatteryUpdate(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$BatteryStatus;)V
    invoke-static {v1, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->access$100(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$BatteryStatus;)V

    goto :goto_0

    .line 111
    :pswitch_2
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->handleCarrierInfoUpdate()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->access$200(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;)V

    goto :goto_0

    .line 114
    :pswitch_3
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$SimArgs;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->handleSimStateChange(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$SimArgs;)V
    invoke-static {v1, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->access$300(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$SimArgs;)V

    goto :goto_0

    .line 117
    :pswitch_4
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;

    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->handleRingerModeChange(I)V

    goto :goto_0

    .line 120
    :pswitch_5
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->handlePhoneStateChanged(Ljava/lang/String;)V

    goto :goto_0

    .line 123
    :pswitch_6
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->handleClockVisibilityChanged()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->access$400(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;)V

    goto :goto_0

    .line 126
    :pswitch_7
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->handleDeviceProvisioned()V

    goto :goto_0

    .line 129
    :pswitch_8
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->handleDevicePolicyManagerStateChanged()V

    goto :goto_0

    .line 132
    :pswitch_9
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;

    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->handleUserSwitched(I)V

    goto :goto_0

    .line 135
    :pswitch_a
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;

    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardUpdateMonitor;->handleUserRemoved(I)V

    goto :goto_0

    .line 103
    :pswitch_data_0
    .packed-switch 0x12d
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method
