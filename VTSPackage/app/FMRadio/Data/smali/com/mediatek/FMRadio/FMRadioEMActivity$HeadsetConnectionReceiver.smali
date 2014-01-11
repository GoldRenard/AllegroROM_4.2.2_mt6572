.class Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;
.super Landroid/content/BroadcastReceiver;
.source "FMRadioEMActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/FMRadio/FMRadioEMActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HeadsetConnectionReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;


# direct methods
.method private constructor <init>(Lcom/mediatek/FMRadio/FMRadioEMActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 157
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/FMRadio/FMRadioEMActivity;Lcom/mediatek/FMRadio/FMRadioEMActivity$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 157
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;-><init>(Lcom/mediatek/FMRadio/FMRadioEMActivity;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .parameter "context"
    .parameter "intent"

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 159
    const-string v0, "state"

    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    if-nez v0, :cond_4

    .line 160
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsPlaying:Z
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$000(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 161
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRgAntenna:Landroid/widget/RadioGroup;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$100(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/RadioGroup;

    move-result-object v0

    const v1, 0x7f060027

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    .line 162
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$200(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Lcom/mediatek/FMRadio/FMRadioService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->powerDownAsync()V

    .line 163
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #setter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsPlaying:Z
    invoke-static {v0, v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$002(Lcom/mediatek/FMRadio/FMRadioEMActivity;Z)Z

    .line 166
    :cond_0
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMinfo:Landroid/widget/Button;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 167
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMinfo:Landroid/widget/Button;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setClickable(Z)V

    .line 168
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMinfo:Landroid/widget/Button;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 169
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMinfo:Landroid/widget/Button;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/Button;

    move-result-object v0

    const v1, 0x7f040060

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 171
    :cond_1
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMStationList:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$400(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/ListView;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 172
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMStationList:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$400(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/widget/ListView;->setVisibility(I)V

    .line 174
    :cond_2
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditLayout:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$500(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 175
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditLayout:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$500(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 199
    :cond_3
    :goto_0
    return-void

    .line 179
    :cond_4
    const-string v0, "state"

    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v3, :cond_3

    .line 180
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsPlaying:Z
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$000(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 181
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRgAntenna:Landroid/widget/RadioGroup;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$100(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/RadioGroup;

    move-result-object v0

    const v1, 0x7f060028

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    .line 184
    :cond_5
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMinfo:Landroid/widget/Button;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 185
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMinfo:Landroid/widget/Button;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setClickable(Z)V

    .line 186
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMinfo:Landroid/widget/Button;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 187
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMinfo:Landroid/widget/Button;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/Button;

    move-result-object v0

    const v1, 0x7f040066

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 189
    :cond_6
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMStationList:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$400(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/ListView;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 190
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mFMStationList:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$400(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setVisibility(I)V

    .line 193
    :cond_7
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditLayout:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$500(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 194
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$HeadsetConnectionReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditLayout:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$500(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0
.end method
