.class Lcom/cyanogenmod/trebuchet/Launcher$18;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->showAppsCustomizeHelper(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;

.field final synthetic val$observer:Landroid/view/ViewTreeObserver;

.field final synthetic val$startAnimRunnable:Ljava/lang/Runnable;

.field final synthetic val$toView:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;Ljava/lang/Runnable;Landroid/view/ViewTreeObserver;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 2902
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$18;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Launcher$18;->val$toView:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/Launcher$18;->val$startAnimRunnable:Ljava/lang/Runnable;

    iput-object p4, p0, Lcom/cyanogenmod/trebuchet/Launcher$18;->val$observer:Landroid/view/ViewTreeObserver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 2

    .prologue
    .line 2904
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$18;->val$toView:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$18;->val$startAnimRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->post(Ljava/lang/Runnable;)Z

    .line 2905
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$18;->val$observer:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 2906
    return-void
.end method
