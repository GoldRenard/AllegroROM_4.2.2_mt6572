.class Lcom/cyanogenmod/trebuchet/Launcher$29;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->unlockScreenOrientation(Z)V
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
    .line 4000
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$29;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 4002
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$29;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->setRequestedOrientation(I)V

    .line 4003
    return-void
.end method
