.class Lcom/android/browser/Tab$7;
.super Ljava/lang/Object;
.source "Tab.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/Tab;->onTest(Ljava/lang/String;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/Tab;

.field final synthetic val$pointer:I


# direct methods
.method constructor <init>(Lcom/android/browser/Tab;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1356
    iput-object p1, p0, Lcom/android/browser/Tab$7;->this$0:Lcom/android/browser/Tab;

    iput p2, p0, Lcom/android/browser/Tab$7;->val$pointer:I

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 1359
    iget-object v0, p0, Lcom/android/browser/Tab$7;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotificationPermissions:Landroid/webkit/NotificationPermissions$Callback;
    invoke-static {v0}, Lcom/android/browser/Tab;->access$2100(Lcom/android/browser/Tab;)Landroid/webkit/NotificationPermissions$Callback;

    move-result-object v0

    const-string v1, "close"

    iget v2, p0, Lcom/android/browser/Tab$7;->val$pointer:I

    invoke-interface {v0, v1, v2}, Landroid/webkit/NotificationPermissions$Callback;->invokeEvent(Ljava/lang/String;I)V

    .line 1360
    return-void
.end method
