.class Lcom/android/launcher2/PreloadReceiver$1;
.super Ljava/lang/Object;
.source "PreloadReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/PreloadReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/PreloadReceiver;

.field final synthetic val$provider:Lcom/android/launcher2/LauncherProvider;

.field final synthetic val$workspaceResId:I


# direct methods
.method constructor <init>(Lcom/android/launcher2/PreloadReceiver;Lcom/android/launcher2/LauncherProvider;I)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 43
    iput-object p1, p0, Lcom/android/launcher2/PreloadReceiver$1;->this$0:Lcom/android/launcher2/PreloadReceiver;

    iput-object p2, p0, Lcom/android/launcher2/PreloadReceiver$1;->val$provider:Lcom/android/launcher2/LauncherProvider;

    iput p3, p0, Lcom/android/launcher2/PreloadReceiver$1;->val$workspaceResId:I

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 46
    iget-object v0, p0, Lcom/android/launcher2/PreloadReceiver$1;->val$provider:Lcom/android/launcher2/LauncherProvider;

    iget v1, p0, Lcom/android/launcher2/PreloadReceiver$1;->val$workspaceResId:I

    invoke-virtual {v0, v1}, Lcom/android/launcher2/LauncherProvider;->loadDefaultFavoritesIfNecessary(I)V

    .line 47
    return-void
.end method
