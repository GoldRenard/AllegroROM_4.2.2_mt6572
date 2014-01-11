.class Lcom/android/systemui/statusbar/phone/QuickSettings$32;
.super Ljava/lang/Object;
.source "QuickSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/phone/QuickSettings;->showBugreportDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/phone/QuickSettings;)V
    .registers 2
    .parameter

    .prologue
    .line 943
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$32;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 7
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 946
    const/4 v0, -0x1

    if-ne p2, v0, :cond_13

    .line 950
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$32;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-static {v0}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$1900(Lcom/android/systemui/statusbar/phone/QuickSettings;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/systemui/statusbar/phone/QuickSettings$32$1;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/phone/QuickSettings$32$1;-><init>(Lcom/android/systemui/statusbar/phone/QuickSettings$32;)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 960
    :cond_13
    return-void
.end method
