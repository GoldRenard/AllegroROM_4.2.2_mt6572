.class Lcom/cyanogenmod/trebuchet/Launcher$13;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->startShortcutUninstallActivity(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;

.field final synthetic val$shortcutInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 2314
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$13;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Launcher$13;->val$shortcutInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 2317
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$13;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$13;->val$shortcutInfo:Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    #calls: Lcom/cyanogenmod/trebuchet/Launcher;->restoreShortcut(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2300(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    .line 2318
    return-void
.end method
