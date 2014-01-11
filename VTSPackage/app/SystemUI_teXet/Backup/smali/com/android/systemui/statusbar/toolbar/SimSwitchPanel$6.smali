.class Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$6;
.super Ljava/lang/Object;
.source "SimSwitchPanel.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)V
    .registers 2
    .parameter

    .prologue
    .line 492
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$6;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 5
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 495
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$6;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-static {v0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$1300(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 496
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$6;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-static {v0}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$1300(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 498
    :cond_11
    packed-switch p2, :pswitch_data_2e

    .line 508
    :goto_14
    :pswitch_14
    return-void

    .line 500
    :pswitch_15
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$6;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$6;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-static {v1}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$1200(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;

    move-result-object v1

    iget v1, v1, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mSimSlotId:I

    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$1600(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;I)V

    .line 501
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$6;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$6;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-static {v1}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$1200(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$1500(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)V

    goto :goto_14

    .line 498
    :pswitch_data_2e
    .packed-switch -0x2
        :pswitch_14
        :pswitch_15
    .end packed-switch
.end method
