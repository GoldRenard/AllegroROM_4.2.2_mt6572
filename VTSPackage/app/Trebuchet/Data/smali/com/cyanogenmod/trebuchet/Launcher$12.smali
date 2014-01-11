.class Lcom/cyanogenmod/trebuchet/Launcher$12;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->onLongClickAppsTab(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;)V
    .locals 0
    .parameter

    .prologue
    .line 2236
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$12;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 4
    .parameter "item"

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 2238
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 2252
    :goto_0
    return v1

    .line 2240
    :pswitch_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$12;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2200(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    move-result-object v0

    sget-object v2, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;->Title:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->setSortMode(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;)V

    goto :goto_0

    .line 2243
    :pswitch_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$12;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2200(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    move-result-object v0

    sget-object v2, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;->InstallDate:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->setSortMode(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;)V

    goto :goto_0

    .line 2246
    :pswitch_2
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher$12;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2200(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    move-result-object v2

    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v3

    if-nez v3, :cond_0

    move v0, v1

    :cond_0
    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->setShowSystemApps(Z)V

    goto :goto_0

    .line 2249
    :pswitch_3
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher$12;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2200(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    move-result-object v2

    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v3

    if-nez v3, :cond_1

    move v0, v1

    :cond_1
    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->setShowDownloadedApps(Z)V

    goto :goto_0

    .line 2238
    :pswitch_data_0
    .packed-switch 0x7f07004d
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
