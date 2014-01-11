.class Lcom/android/browser/Controller$3;
.super Ljava/lang/Object;
.source "Controller.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/Controller;->doStart(Landroid/os/Bundle;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/Controller;

.field final synthetic val$currentTabId:J

.field final synthetic val$icicle:Landroid/os/Bundle;

.field final synthetic val$intent:Landroid/content/Intent;

.field final synthetic val$restoreIncognitoTabs:Z


# direct methods
.method constructor <init>(Lcom/android/browser/Controller;Landroid/os/Bundle;Landroid/content/Intent;JZ)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 328
    iput-object p1, p0, Lcom/android/browser/Controller$3;->this$0:Lcom/android/browser/Controller;

    iput-object p2, p0, Lcom/android/browser/Controller$3;->val$icicle:Landroid/os/Bundle;

    iput-object p3, p0, Lcom/android/browser/Controller$3;->val$intent:Landroid/content/Intent;

    iput-wide p4, p0, Lcom/android/browser/Controller$3;->val$currentTabId:J

    iput-boolean p6, p0, Lcom/android/browser/Controller$3;->val$restoreIncognitoTabs:Z

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 330
    iget-object v0, p0, Lcom/android/browser/Controller$3;->this$0:Lcom/android/browser/Controller;

    iget-object v1, p0, Lcom/android/browser/Controller$3;->val$icicle:Landroid/os/Bundle;

    iget-object v2, p0, Lcom/android/browser/Controller$3;->val$intent:Landroid/content/Intent;

    iget-wide v3, p0, Lcom/android/browser/Controller$3;->val$currentTabId:J

    iget-boolean v5, p0, Lcom/android/browser/Controller$3;->val$restoreIncognitoTabs:Z

    #calls: Lcom/android/browser/Controller;->onPreloginFinished(Landroid/os/Bundle;Landroid/content/Intent;JZ)V
    invoke-static/range {v0 .. v5}, Lcom/android/browser/Controller;->access$100(Lcom/android/browser/Controller;Landroid/os/Bundle;Landroid/content/Intent;JZ)V

    .line 332
    return-void
.end method
