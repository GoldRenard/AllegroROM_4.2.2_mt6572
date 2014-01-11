.class Lcom/android/settings/MediaFormat$2;
.super Ljava/lang/Object;
.source "MediaFormat.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/MediaFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/MediaFormat;


# direct methods
.method constructor <init>(Lcom/android/settings/MediaFormat;)V
    .locals 0
    .parameter

    .prologue
    .line 131
    iput-object p1, p0, Lcom/android/settings/MediaFormat$2;->this$0:Lcom/android/settings/MediaFormat;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 133
    iget-object v0, p0, Lcom/android/settings/MediaFormat$2;->this$0:Lcom/android/settings/MediaFormat;

    #calls: Lcom/android/settings/MediaFormat;->getMtpStatus()Z
    invoke-static {v0}, Lcom/android/settings/MediaFormat;->access$000(Lcom/android/settings/MediaFormat;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 134
    iget-object v0, p0, Lcom/android/settings/MediaFormat$2;->this$0:Lcom/android/settings/MediaFormat;

    iget-object v1, p0, Lcom/android/settings/MediaFormat$2;->this$0:Lcom/android/settings/MediaFormat;

    const v2, 0x7f0b000c

    #calls: Lcom/android/settings/MediaFormat;->getVolumeString(I)Ljava/lang/String;
    invoke-static {v1, v2}, Lcom/android/settings/MediaFormat;->access$100(Lcom/android/settings/MediaFormat;I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 136
    iget-object v0, p0, Lcom/android/settings/MediaFormat$2;->this$0:Lcom/android/settings/MediaFormat;

    invoke-virtual {v0}, Lcom/android/settings/MediaFormat;->finish()V

    .line 142
    :cond_0
    :goto_0
    return-void

    .line 138
    :cond_1
    iget-object v0, p0, Lcom/android/settings/MediaFormat$2;->this$0:Lcom/android/settings/MediaFormat;

    const/16 v1, 0x37

    #calls: Lcom/android/settings/MediaFormat;->runKeyguardConfirmation(I)Z
    invoke-static {v0, v1}, Lcom/android/settings/MediaFormat;->access$300(Lcom/android/settings/MediaFormat;I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 139
    iget-object v0, p0, Lcom/android/settings/MediaFormat$2;->this$0:Lcom/android/settings/MediaFormat;

    #calls: Lcom/android/settings/MediaFormat;->establishFinalConfirmationState()V
    invoke-static {v0}, Lcom/android/settings/MediaFormat;->access$400(Lcom/android/settings/MediaFormat;)V

    goto :goto_0
.end method
