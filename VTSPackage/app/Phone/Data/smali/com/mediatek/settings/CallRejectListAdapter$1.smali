.class Lcom/mediatek/settings/CallRejectListAdapter$1;
.super Ljava/lang/Object;
.source "CallRejectListAdapter.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/settings/CallRejectListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/CallRejectListAdapter;

.field final synthetic val$holder:Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/CallRejectListAdapter;Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 41
    iput-object p1, p0, Lcom/mediatek/settings/CallRejectListAdapter$1;->this$0:Lcom/mediatek/settings/CallRejectListAdapter;

    iput-object p2, p0, Lcom/mediatek/settings/CallRejectListAdapter$1;->val$holder:Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 44
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListAdapter$1;->this$0:Lcom/mediatek/settings/CallRejectListAdapter;

    #getter for: Lcom/mediatek/settings/CallRejectListAdapter;->mDataList:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/mediatek/settings/CallRejectListAdapter;->access$000(Lcom/mediatek/settings/CallRejectListAdapter;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/settings/CallRejectListAdapter$1;->val$holder:Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;

    iget v1, v1, Lcom/mediatek/settings/CallRejectListAdapter$ItemViewHolder;->mId:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/CallRejectListItem;

    invoke-virtual {v0, p2}, Lcom/mediatek/settings/CallRejectListItem;->setIsChecked(Z)V

    .line 45
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListAdapter$1;->this$0:Lcom/mediatek/settings/CallRejectListAdapter;

    #getter for: Lcom/mediatek/settings/CallRejectListAdapter;->mCheckSelectCallBack:Lcom/mediatek/settings/CallRejectListAdapter$CheckSelectCallBack;
    invoke-static {v0}, Lcom/mediatek/settings/CallRejectListAdapter;->access$100(Lcom/mediatek/settings/CallRejectListAdapter;)Lcom/mediatek/settings/CallRejectListAdapter$CheckSelectCallBack;

    move-result-object v0

    invoke-interface {v0, p2}, Lcom/mediatek/settings/CallRejectListAdapter$CheckSelectCallBack;->setChecked(Z)V

    .line 46
    return-void
.end method
