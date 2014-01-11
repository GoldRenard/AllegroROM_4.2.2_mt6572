.class Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$3;
.super Ljava/lang/Object;
.source "AppsCustomizeTabHost.java"

# interfaces
.implements Ljava/lang/Runnable;


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

.field final synthetic val$animSet:Landroid/animation/AnimatorSet;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;Landroid/animation/AnimatorSet;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 308
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$3;->this$1:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$3;->val$animSet:Landroid/animation/AnimatorSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 310
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$4$3;->val$animSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 311
    return-void
.end method
