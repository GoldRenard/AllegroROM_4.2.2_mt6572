.class Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter$1;
.super Ljava/lang/Object;
.source "HiddenAppsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;

.field final synthetic val$item:Landroid/view/View;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;ILandroid/view/View;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 218
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter$1;->this$1:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;

    iput p2, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter$1;->val$position:I

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter$1;->val$item:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "view"

    .prologue
    const/4 v1, 0x0

    .line 221
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter$1;->this$1:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;->this$0:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->getListView()Landroid/widget/ListView;

    move-result-object v2

    iget v3, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter$1;->val$position:I

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter$1;->val$item:Landroid/view/View;

    check-cast v0, Landroid/widget/Checkable;

    invoke-interface {v0}, Landroid/widget/Checkable;->isChecked()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v3, v0}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 222
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter$1;->this$1:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;->this$0:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;

    #setter for: Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mSaved:Z
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->access$402(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;Z)Z

    .line 223
    return-void

    :cond_0
    move v0, v1

    .line 221
    goto :goto_0
.end method
