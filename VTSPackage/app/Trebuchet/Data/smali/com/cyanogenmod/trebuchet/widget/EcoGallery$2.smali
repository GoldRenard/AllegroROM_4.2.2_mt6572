.class Lcom/cyanogenmod/trebuchet/widget/EcoGallery$2;
.super Ljava/lang/Object;
.source "EcoGallery.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->onKeyUp(ILandroid/view/KeyEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;)V
    .locals 0
    .parameter

    .prologue
    .line 1096
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$2;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1098
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$2;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    #calls: Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->dispatchUnpress()V
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->access$300(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;)V

    .line 1099
    return-void
.end method
