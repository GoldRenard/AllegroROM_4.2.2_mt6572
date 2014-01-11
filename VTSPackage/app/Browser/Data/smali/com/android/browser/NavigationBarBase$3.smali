.class Lcom/android/browser/NavigationBarBase$3;
.super Ljava/lang/Object;
.source "NavigationBarBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/NavigationBarBase;->onDismiss()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/NavigationBarBase;

.field final synthetic val$currentTab:Lcom/android/browser/Tab;


# direct methods
.method constructor <init>(Lcom/android/browser/NavigationBarBase;Lcom/android/browser/Tab;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 285
    iput-object p1, p0, Lcom/android/browser/NavigationBarBase$3;->this$0:Lcom/android/browser/NavigationBarBase;

    iput-object p2, p0, Lcom/android/browser/NavigationBarBase$3;->val$currentTab:Lcom/android/browser/Tab;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 287
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase$3;->this$0:Lcom/android/browser/NavigationBarBase;

    invoke-virtual {v0}, Lcom/android/browser/NavigationBarBase;->clearFocus()V

    .line 288
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase$3;->val$currentTab:Lcom/android/browser/Tab;

    if-eqz v0, :cond_0

    .line 289
    iget-object v0, p0, Lcom/android/browser/NavigationBarBase$3;->this$0:Lcom/android/browser/NavigationBarBase;

    iget-object v1, p0, Lcom/android/browser/NavigationBarBase$3;->val$currentTab:Lcom/android/browser/Tab;

    invoke-virtual {v1}, Lcom/android/browser/Tab;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/browser/NavigationBarBase;->setDisplayTitle(Ljava/lang/String;)V

    .line 291
    :cond_0
    return-void
.end method
