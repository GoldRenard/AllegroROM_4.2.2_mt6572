.class Lcom/android/systemui/net/NetworkOverLimitActivity$1;
.super Ljava/lang/Object;
.source "NetworkOverLimitActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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

.field final synthetic val$template:Landroid/net/NetworkTemplate;


# direct methods
.method constructor <init>(Lcom/android/systemui/net/NetworkOverLimitActivity;Landroid/net/NetworkTemplate;)V
    .registers 3
    .parameter
    .parameter

    .prologue
    .line 63
    iput-object p1, p0, Lcom/android/systemui/net/NetworkOverLimitActivity$1;->this$0:Lcom/android/systemui/net/NetworkOverLimitActivity;

    iput-object p2, p0, Lcom/android/systemui/net/NetworkOverLimitActivity$1;->val$template:Landroid/net/NetworkTemplate;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 5
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 65
    iget-object v0, p0, Lcom/android/systemui/net/NetworkOverLimitActivity$1;->this$0:Lcom/android/systemui/net/NetworkOverLimitActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/systemui/net/NetworkOverLimitActivity;->access$002(Lcom/android/systemui/net/NetworkOverLimitActivity;Z)Z

    .line 66
    iget-object v0, p0, Lcom/android/systemui/net/NetworkOverLimitActivity$1;->this$0:Lcom/android/systemui/net/NetworkOverLimitActivity;

    iget-object v1, p0, Lcom/android/systemui/net/NetworkOverLimitActivity$1;->val$template:Landroid/net/NetworkTemplate;

    invoke-static {v0, v1}, Lcom/android/systemui/net/NetworkOverLimitActivity;->access$100(Lcom/android/systemui/net/NetworkOverLimitActivity;Landroid/net/NetworkTemplate;)V

    .line 67
    return-void
.end method
