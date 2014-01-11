.class Lcom/mediatek/calloption/VideoCallOptionHandler$4;
.super Ljava/lang/Object;
.source "VideoCallOptionHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/calloption/VideoCallOptionHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/calloption/VideoCallOptionHandler;


# direct methods
.method constructor <init>(Lcom/mediatek/calloption/VideoCallOptionHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 175
    iput-object p1, p0, Lcom/mediatek/calloption/VideoCallOptionHandler$4;->this$0:Lcom/mediatek/calloption/VideoCallOptionHandler;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 177
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onClick(), which = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/calloption/VideoCallOptionHandler;->log(Ljava/lang/String;)V
    invoke-static {v1}, Lcom/mediatek/calloption/VideoCallOptionHandler;->access$000(Ljava/lang/String;)V

    .line 178
    const/4 v1, -0x1

    if-ne v1, p2, :cond_1

    .line 179
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 180
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "com.android.phone"

    const-string v2, "com.mediatek.settings.Modem3GCapabilitySwitch"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 181
    iget-object v1, p0, Lcom/mediatek/calloption/VideoCallOptionHandler$4;->this$0:Lcom/mediatek/calloption/VideoCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/VideoCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;
    invoke-static {v1}, Lcom/mediatek/calloption/VideoCallOptionHandler;->access$100(Lcom/mediatek/calloption/VideoCallOptionHandler;)Lcom/mediatek/calloption/Request;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/calloption/Request;->getActivityContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 185
    .end local v0           #intent:Landroid/content/Intent;
    :cond_0
    :goto_0
    return-void

    .line 182
    :cond_1
    const/4 v1, -0x2

    if-ne v1, p2, :cond_0

    .line 183
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    goto :goto_0
.end method
