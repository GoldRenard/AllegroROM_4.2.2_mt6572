.class Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AppsCustomizeTabHost.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;)V
    .locals 0
    .parameter

    .prologue
    .line 298
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$2;->this$1:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1
    .parameter "animation"

    .prologue
    .line 301
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$2;->this$1:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #calls: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->reloadCurrentPage()V
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$300(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)V

    .line 302
    return-void
.end method
