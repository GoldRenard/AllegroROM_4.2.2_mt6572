.class Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "ServiceSelectList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ViewHolder"
.end annotation


# instance fields
.field mCkRadioOn:Landroid/widget/RadioButton;

.field mImageSim:Landroid/widget/RelativeLayout;

.field mImageStatus:Landroid/widget/ImageView;

.field mTextName:Landroid/widget/TextView;

.field mTextNum:Landroid/widget/TextView;

.field mTextNumFormat:Landroid/widget/TextView;

.field final synthetic this$1:Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;)V
    .locals 0
    .parameter

    .prologue
    .line 398
    iput-object p1, p0, Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter$ViewHolder;->this$1:Lcom/mediatek/settings/ServiceSelectList$SelectionListAdapter;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
