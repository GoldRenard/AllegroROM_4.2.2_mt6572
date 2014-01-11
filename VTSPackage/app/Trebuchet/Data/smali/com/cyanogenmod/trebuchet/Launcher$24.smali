.class Lcom/cyanogenmod/trebuchet/Launcher$24;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->finishBindingItems()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;)V
    .locals 0
    .parameter

    .prologue
    .line 3755
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$24;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 3758
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$24;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    const/4 v1, 0x0

    #calls: Lcom/cyanogenmod/trebuchet/Launcher;->runNewAppsAnimation(Z)V
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->access$3100(Lcom/cyanogenmod/trebuchet/Launcher;Z)V

    .line 3759
    return-void
.end method
