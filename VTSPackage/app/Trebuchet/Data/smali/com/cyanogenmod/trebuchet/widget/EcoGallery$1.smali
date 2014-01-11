.class Lcom/cyanogenmod/trebuchet/widget/EcoGallery$1;
.super Ljava/lang/Object;
.source "EcoGallery.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/widget/EcoGallery;
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
    .line 105
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$1;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 107
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$1;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    const/4 v1, 0x0

    #setter for: Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSuppressSelectionChanged:Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->access$002(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;Z)Z

    .line 108
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$1;->this$0:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->selectionChanged()V

    .line 109
    return-void
.end method
