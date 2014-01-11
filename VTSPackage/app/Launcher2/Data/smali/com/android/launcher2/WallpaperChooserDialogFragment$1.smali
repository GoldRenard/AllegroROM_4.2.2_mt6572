.class Lcom/android/launcher2/WallpaperChooserDialogFragment$1;
.super Ljava/lang/Object;
.source "WallpaperChooserDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/WallpaperChooserDialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/WallpaperChooserDialogFragment;

.field final synthetic val$gallery:Landroid/widget/Gallery;


# direct methods
.method constructor <init>(Lcom/android/launcher2/WallpaperChooserDialogFragment;Landroid/widget/Gallery;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 171
    iput-object p1, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$1;->this$0:Lcom/android/launcher2/WallpaperChooserDialogFragment;

    iput-object p2, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$1;->val$gallery:Landroid/widget/Gallery;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 174
    iget-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$1;->this$0:Lcom/android/launcher2/WallpaperChooserDialogFragment;

    iget-object v1, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment$1;->val$gallery:Landroid/widget/Gallery;

    invoke-virtual {v1}, Landroid/widget/Gallery;->getSelectedItemPosition()I

    move-result v1

    #calls: Lcom/android/launcher2/WallpaperChooserDialogFragment;->selectWallpaper(I)V
    invoke-static {v0, v1}, Lcom/android/launcher2/WallpaperChooserDialogFragment;->access$000(Lcom/android/launcher2/WallpaperChooserDialogFragment;I)V

    .line 175
    return-void
.end method
