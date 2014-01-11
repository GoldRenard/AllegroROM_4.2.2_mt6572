.class Lcom/mediatek/wifi/WifiGprsSelector$SelectionListAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "WifiGprsSelector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/wifi/WifiGprsSelector$SelectionListAdapter;
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

.field final synthetic this$1:Lcom/mediatek/wifi/WifiGprsSelector$SelectionListAdapter;


# direct methods
.method constructor <init>(Lcom/mediatek/wifi/WifiGprsSelector$SelectionListAdapter;)V
    .locals 0
    .parameter

    .prologue
    .line 968
    iput-object p1, p0, Lcom/mediatek/wifi/WifiGprsSelector$SelectionListAdapter$ViewHolder;->this$1:Lcom/mediatek/wifi/WifiGprsSelector$SelectionListAdapter;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
