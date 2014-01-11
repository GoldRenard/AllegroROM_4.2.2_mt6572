.class Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;
.super Ljava/lang/Object;
.source "SimIconsListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/toolbar/SimIconsListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SimInfoViewHolder"
.end annotation


# instance fields
.field mSimBg:Landroid/widget/RelativeLayout;

.field mSimNumber:Landroid/widget/TextView;

.field mSimOpName:Landroid/widget/TextView;

.field mSimSelectedRadio:Landroid/widget/RadioButton;

.field mSimShortNumber:Landroid/widget/TextView;

.field mSimStatus:Landroid/widget/ImageView;

.field mSimType:Landroid/widget/TextView;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 73
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/systemui/statusbar/toolbar/SimIconsListView$1;)V
    .registers 2
    .parameter "x0"

    .prologue
    .line 73
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView$SimInfoViewHolder;-><init>()V

    return-void
.end method
