.class Lcom/android/systemui/net/NetworkOverLimitActivity$2;
.super Ljava/lang/Object;
.source "NetworkOverLimitActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/net/NetworkOverLimitActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/net/NetworkOverLimitActivity;


# direct methods
.method constructor <init>(Lcom/android/systemui/net/NetworkOverLimitActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 71
    iput-object p1, p0, Lcom/android/systemui/net/NetworkOverLimitActivity$2;->this$0:Lcom/android/systemui/net/NetworkOverLimitActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "dialog"

    .prologue
    .line 74
    iget-object v0, p0, Lcom/android/systemui/net/NetworkOverLimitActivity$2;->this$0:Lcom/android/systemui/net/NetworkOverLimitActivity;

    #getter for: Lcom/android/systemui/net/NetworkOverLimitActivity;->isReenabled:Z
    invoke-static {v0}, Lcom/android/systemui/net/NetworkOverLimitActivity;->access$000(Lcom/android/systemui/net/NetworkOverLimitActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/net/NetworkOverLimitActivity$2;->this$0:Lcom/android/systemui/net/NetworkOverLimitActivity;

    #calls: Lcom/android/systemui/net/NetworkOverLimitActivity;->sendBroadcast()V
    invoke-static {v0}, Lcom/android/systemui/net/NetworkOverLimitActivity;->access$200(Lcom/android/systemui/net/NetworkOverLimitActivity;)V

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/net/NetworkOverLimitActivity$2;->this$0:Lcom/android/systemui/net/NetworkOverLimitActivity;

    invoke-virtual {v0}, Lcom/android/systemui/net/NetworkOverLimitActivity;->finish()V

    .line 76
    return-void
.end method
