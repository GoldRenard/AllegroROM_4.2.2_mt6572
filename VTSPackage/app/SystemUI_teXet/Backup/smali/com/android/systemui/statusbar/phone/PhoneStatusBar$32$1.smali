.class Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32$1;
.super Ljava/lang/Object;
.source "PhoneStatusBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$intent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32;Landroid/content/Context;Landroid/content/Intent;)V
    .registers 4
    .parameter
    .parameter
    .parameter

    .prologue
    .line 3027
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32$1;->this$1:Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32;

    iput-object p2, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32$1;->val$intent:Landroid/content/Intent;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    .prologue
    .line 3029
    iget-object v3, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32$1;->val$context:Landroid/content/Context;

    invoke-static {v3}, Lcom/android/systemui/statusbar/util/SIMHelper;->updateSIMInfos(Landroid/content/Context;)V

    .line 3030
    iget-object v3, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32$1;->val$intent:Landroid/content/Intent;

    const-string v4, "type"

    const/4 v5, -0x1

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 3031
    .local v2, type:I
    iget-object v3, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32$1;->val$intent:Landroid/content/Intent;

    const-string v4, "simid"

    const-wide/16 v5, -0x1

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    .line 3032
    .local v0, simId:J
    if-eqz v2, :cond_1d

    const/4 v3, 0x1

    if-ne v2, v3, :cond_24

    .line 3034
    :cond_1d
    iget-object v3, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32$1;->this$1:Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32;

    iget-object v3, v3, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    invoke-static {v3, v0, v1}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->access$3900(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;J)V

    .line 3037
    :cond_24
    iget-object v3, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32$1;->this$1:Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32;

    iget-object v3, v3, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    invoke-static {v3}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->access$4000(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;)Lcom/android/systemui/statusbar/toolbar/ToolBarView;

    move-result-object v3

    iget-object v4, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32$1;->val$intent:Landroid/content/Intent;

    invoke-virtual {v3, v4}, Lcom/android/systemui/statusbar/toolbar/ToolBarView;->updateSimInfos(Landroid/content/Intent;)V

    .line 3038
    iget-object v3, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32$1;->this$1:Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32;

    iget-object v3, v3, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    iget-object v3, v3, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->mQS:Lcom/android/systemui/statusbar/phone/QuickSettings;

    if-eqz v3, :cond_44

    .line 3039
    iget-object v3, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32$1;->this$1:Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32;

    iget-object v3, v3, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    iget-object v3, v3, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->mQS:Lcom/android/systemui/statusbar/phone/QuickSettings;

    iget-object v4, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$32$1;->val$intent:Landroid/content/Intent;

    invoke-virtual {v3, v4}, Lcom/android/systemui/statusbar/phone/QuickSettings;->updateSimInfo(Landroid/content/Intent;)V

    .line 3041
    :cond_44
    return-void
.end method
