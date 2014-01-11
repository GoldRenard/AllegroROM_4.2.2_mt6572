.class Lcom/cyanogenmod/trebuchet/Launcher$30;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->initCling(I[IZI)Lcom/cyanogenmod/trebuchet/Cling;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;

.field final synthetic val$cling:Lcom/cyanogenmod/trebuchet/Cling;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/Cling;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 4037
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$30;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Launcher$30;->val$cling:Lcom/cyanogenmod/trebuchet/Cling;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 4039
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$30;->val$cling:Lcom/cyanogenmod/trebuchet/Cling;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Cling;->setFocusable(Z)V

    .line 4040
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$30;->val$cling:Lcom/cyanogenmod/trebuchet/Cling;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Cling;->requestFocus()Z

    .line 4041
    return-void
.end method
