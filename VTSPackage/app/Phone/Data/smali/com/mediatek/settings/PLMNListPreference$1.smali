.class Lcom/mediatek/settings/PLMNListPreference$1;
.super Landroid/telephony/PhoneStateListener;
.source "PLMNListPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/PLMNListPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/PLMNListPreference;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/PLMNListPreference;)V
    .locals 0
    .parameter

    .prologue
    .line 72
    iput-object p1, p0, Lcom/mediatek/settings/PLMNListPreference$1;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 3
    .parameter "state"
    .parameter "incomingNumber"

    .prologue
    .line 75
    invoke-super {p0, p1, p2}, Landroid/telephony/PhoneStateListener;->onCallStateChanged(ILjava/lang/String;)V

    .line 76
    const-string v0, "Settings/PLMNListPreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCallStateChanged ans state is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    packed-switch p1, :pswitch_data_0

    .line 84
    :goto_0
    return-void

    .line 79
    :pswitch_0
    iget-object v0, p0, Lcom/mediatek/settings/PLMNListPreference$1;->this$0:Lcom/mediatek/settings/PLMNListPreference;

    #calls: Lcom/mediatek/settings/PLMNListPreference;->setScreenEnabled()V
    invoke-static {v0}, Lcom/mediatek/settings/PLMNListPreference;->access$100(Lcom/mediatek/settings/PLMNListPreference;)V

    goto :goto_0

    .line 77
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
