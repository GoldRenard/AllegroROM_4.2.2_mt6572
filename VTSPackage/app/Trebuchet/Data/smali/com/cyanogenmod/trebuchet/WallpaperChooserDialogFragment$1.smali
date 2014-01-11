.class Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment$1;
.super Ljava/lang/Object;
.source "WallpaperChooserDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment;

.field final synthetic val$gallery:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment;Lcom/cyanogenmod/trebuchet/widget/EcoGallery;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 146
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment$1;->this$0:Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment$1;->val$gallery:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 149
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment$1;->this$0:Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment$1;->val$gallery:Lcom/cyanogenmod/trebuchet/widget/EcoGallery;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getSelectedItemPosition()I

    move-result v1

    #calls: Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment;->selectWallpaper(I)V
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment;->access$000(Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment;I)V

    .line 150
    return-void
.end method
