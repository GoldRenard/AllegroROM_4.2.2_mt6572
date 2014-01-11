.class Lcom/cyanogenmod/trebuchet/Launcher$31;
.super Landroid/animation/AnimatorListenerAdapter;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->dismissCling(Lcom/cyanogenmod/trebuchet/Cling;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;

.field final synthetic val$cling:Lcom/cyanogenmod/trebuchet/Cling;

.field final synthetic val$flag:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/Cling;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 4055
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$31;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Launcher$31;->val$cling:Lcom/cyanogenmod/trebuchet/Cling;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/Launcher$31;->val$flag:Ljava/lang/String;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 4057
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$31;->val$cling:Lcom/cyanogenmod/trebuchet/Cling;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Cling;->setVisibility(I)V

    .line 4058
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$31;->val$cling:Lcom/cyanogenmod/trebuchet/Cling;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Cling;->cleanup()V

    .line 4060
    new-instance v0, Lcom/cyanogenmod/trebuchet/Launcher$31$1;

    const-string v1, "dismissClingThread"

    invoke-direct {v0, p0, v1}, Lcom/cyanogenmod/trebuchet/Launcher$31$1;-><init>(Lcom/cyanogenmod/trebuchet/Launcher$31;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher$31$1;->start()V

    .line 4067
    return-void
.end method
