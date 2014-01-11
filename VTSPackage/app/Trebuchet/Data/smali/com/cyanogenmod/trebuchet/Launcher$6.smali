.class Lcom/cyanogenmod/trebuchet/Launcher$6;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->updateShortcut(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;

.field final synthetic val$info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;

.field final synthetic val$title:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/ShortcutInfo;Landroid/widget/EditText;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1038
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$6;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Launcher$6;->val$info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/Launcher$6;->val$title:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "id"

    .prologue
    .line 1041
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$6;->val$info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$6;->val$title:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->setTitle(Ljava/lang/CharSequence;)V

    .line 1042
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$6;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$6;->val$info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/LauncherModel;->updateItemInDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 1043
    return-void
.end method
