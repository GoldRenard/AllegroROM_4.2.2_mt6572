.class Lcom/cyanogenmod/trebuchet/Launcher$AppWidgetResetObserver;
.super Landroid/database/ContentObserver;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/Launcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AppWidgetResetObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;


# direct methods
.method public constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;)V
    .locals 1
    .parameter

    .prologue
    .line 3545
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$AppWidgetResetObserver;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    .line 3546
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 3547
    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1
    .parameter "selfChange"

    .prologue
    .line 3551
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$AppWidgetResetObserver;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #calls: Lcom/cyanogenmod/trebuchet/Launcher;->onAppWidgetReset()V
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$3000(Lcom/cyanogenmod/trebuchet/Launcher;)V

    .line 3552
    return-void
.end method
