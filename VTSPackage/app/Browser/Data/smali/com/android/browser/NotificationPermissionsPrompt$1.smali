.class Lcom/android/browser/NotificationPermissionsPrompt$1;
.super Ljava/lang/Object;
.source "NotificationPermissionsPrompt.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/NotificationPermissionsPrompt;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/NotificationPermissionsPrompt;


# direct methods
.method constructor <init>(Lcom/android/browser/NotificationPermissionsPrompt;)V
    .locals 0
    .parameter

    .prologue
    .line 49
    iput-object p1, p0, Lcom/android/browser/NotificationPermissionsPrompt$1;->this$0:Lcom/android/browser/NotificationPermissionsPrompt;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 51
    iget-object v0, p0, Lcom/android/browser/NotificationPermissionsPrompt$1;->this$0:Lcom/android/browser/NotificationPermissionsPrompt;

    const/4 v1, 0x0

    #calls: Lcom/android/browser/NotificationPermissionsPrompt;->handleButtonClick(Z)V
    invoke-static {v0, v1}, Lcom/android/browser/NotificationPermissionsPrompt;->access$000(Lcom/android/browser/NotificationPermissionsPrompt;Z)V

    .line 52
    return-void
.end method
