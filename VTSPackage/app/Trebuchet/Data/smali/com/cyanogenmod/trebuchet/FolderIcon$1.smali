.class Lcom/cyanogenmod/trebuchet/FolderIcon$1;
.super Ljava/lang/Object;
.source "FolderIcon.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/FolderIcon;->onDrop(Lcom/cyanogenmod/trebuchet/ShortcutInfo;Lcom/cyanogenmod/trebuchet/DragView;Landroid/graphics/Rect;FILjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/FolderIcon;

.field final synthetic val$item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/FolderIcon;Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 390
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$1;->this$0:Lcom/cyanogenmod/trebuchet/FolderIcon;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$1;->val$item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 392
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$1;->this$0:Lcom/cyanogenmod/trebuchet/FolderIcon;

    #getter for: Lcom/cyanogenmod/trebuchet/FolderIcon;->mHiddenItems:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->access$300(Lcom/cyanogenmod/trebuchet/FolderIcon;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$1;->val$item:Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 393
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/FolderIcon$1;->this$0:Lcom/cyanogenmod/trebuchet/FolderIcon;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->invalidate()V

    .line 394
    return-void
.end method
