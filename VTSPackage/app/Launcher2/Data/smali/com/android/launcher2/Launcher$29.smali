.class Lcom/android/launcher2/Launcher$29;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Launcher;->removeCling(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Launcher;

.field final synthetic val$cling:Landroid/view/View;

.field final synthetic val$parent:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Lcom/android/launcher2/Launcher;Landroid/view/ViewGroup;Landroid/view/View;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 4301
    iput-object p1, p0, Lcom/android/launcher2/Launcher$29;->this$0:Lcom/android/launcher2/Launcher;

    iput-object p2, p0, Lcom/android/launcher2/Launcher$29;->val$parent:Landroid/view/ViewGroup;

    iput-object p3, p0, Lcom/android/launcher2/Launcher$29;->val$cling:Landroid/view/View;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 4304
    iget-object v0, p0, Lcom/android/launcher2/Launcher$29;->val$parent:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/android/launcher2/Launcher$29;->val$cling:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4305
    return-void
.end method
