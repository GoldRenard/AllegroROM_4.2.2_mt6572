.class Lcom/mediatek/FMRadio/FMRadioFavorite$2;
.super Ljava/lang/Object;
.source "FMRadioFavorite.java"

# interfaces
.implements Landroid/view/View$OnCreateContextMenuListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/FMRadio/FMRadioFavorite;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/FMRadioFavorite;


# direct methods
.method constructor <init>(Lcom/mediatek/FMRadio/FMRadioFavorite;)V
    .locals 0
    .parameter

    .prologue
    .line 167
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioFavorite$2;->this$0:Lcom/mediatek/FMRadio/FMRadioFavorite;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 8
    .parameter "menu"
    .parameter "view"
    .parameter "menuInfo"

    .prologue
    const/4 v6, 0x3

    const/4 v7, 0x0

    .line 169
    const v2, 0x7f040006

    invoke-interface {p1, v2}, Landroid/view/ContextMenu;->setHeaderTitle(I)Landroid/view/ContextMenu;

    .line 170
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioFavorite$2;->this$0:Lcom/mediatek/FMRadio/FMRadioFavorite;

    #getter for: Lcom/mediatek/FMRadio/FMRadioFavorite;->mAdapter:Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;
    invoke-static {v2}, Lcom/mediatek/FMRadio/FMRadioFavorite;->access$000(Lcom/mediatek/FMRadio/FMRadioFavorite;)Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 171
    .local v0, cursor:Landroid/database/Cursor;
    check-cast p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .end local p3
    iget v2, p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-interface {v0, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 172
    const-string v2, "COLUMN_STATION_TYPE"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    .line 173
    .local v1, stationType:I
    if-ne v6, v1, :cond_0

    .line 175
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioFavorite$2;->this$0:Lcom/mediatek/FMRadio/FMRadioFavorite;

    iget-object v2, v2, Lcom/mediatek/FMRadio/FMRadioFavorite;->mProjectStringExt:Lcom/mediatek/FMRadio/ext/IProjectStringExt;

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioFavorite$2;->this$0:Lcom/mediatek/FMRadio/FMRadioFavorite;

    #getter for: Lcom/mediatek/FMRadio/FMRadioFavorite;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioFavorite;->access$100(Lcom/mediatek/FMRadio/FMRadioFavorite;)Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f040002

    const v5, 0x7f040003

    invoke-interface {v2, v3, v4, v5}, Lcom/mediatek/FMRadio/ext/IProjectStringExt;->getProjectString(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v7, v6, v7, v2}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 183
    :goto_0
    return-void

    .line 179
    :cond_0
    const/4 v2, 0x1

    const v3, 0x7f040007

    invoke-interface {p1, v7, v2, v7, v3}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 180
    const/4 v2, 0x2

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioFavorite$2;->this$0:Lcom/mediatek/FMRadio/FMRadioFavorite;

    iget-object v3, v3, Lcom/mediatek/FMRadio/FMRadioFavorite;->mProjectStringExt:Lcom/mediatek/FMRadio/ext/IProjectStringExt;

    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioFavorite$2;->this$0:Lcom/mediatek/FMRadio/FMRadioFavorite;

    #getter for: Lcom/mediatek/FMRadio/FMRadioFavorite;->mContext:Landroid/content/Context;
    invoke-static {v4}, Lcom/mediatek/FMRadio/FMRadioFavorite;->access$100(Lcom/mediatek/FMRadio/FMRadioFavorite;)Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f040008

    const v6, 0x7f040009

    invoke-interface {v3, v4, v5, v6}, Lcom/mediatek/FMRadio/ext/IProjectStringExt;->getProjectString(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v7, v2, v7, v3}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_0
.end method
