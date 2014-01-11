.class Lcom/cyanogenmod/trebuchet/Folder$3;
.super Ljava/lang/Object;
.source "Folder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Folder;->animateOpen()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Folder;

.field final synthetic val$oa:Landroid/animation/ObjectAnimator;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Folder;Landroid/animation/ObjectAnimator;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 461
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Folder$3;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Folder$3;->val$oa:Landroid/animation/ObjectAnimator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 464
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder$3;->val$oa:Landroid/animation/ObjectAnimator;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Folder$3;->this$0:Lcom/cyanogenmod/trebuchet/Folder;

    #getter for: Lcom/cyanogenmod/trebuchet/Folder;->mOpenCloseAnimator:Landroid/animation/ObjectAnimator;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Folder;->access$300(Lcom/cyanogenmod/trebuchet/Folder;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 467
    :goto_0
    return-void

    .line 466
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Folder$3;->val$oa:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_0
.end method
