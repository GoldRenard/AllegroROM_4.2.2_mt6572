.class Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;
.super Landroid/view/View$BaseSavedState;
.source "ToolBarView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/toolbar/ToolBarView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field mCurrentScreen:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 764
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState$1;

    invoke-direct {v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState$1;-><init>()V

    sput-object v0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .parameter "in"

    .prologue
    .line 754
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 747
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;->mCurrentScreen:I

    .line 755
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;->mCurrentScreen:I

    .line 756
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/android/systemui/statusbar/toolbar/ToolBarView$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 746
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method constructor <init>(Landroid/os/Parcelable;)V
    .locals 1
    .parameter "superState"

    .prologue
    .line 750
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 747
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;->mCurrentScreen:I

    .line 751
    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .parameter "out"
    .parameter "flags"

    .prologue
    .line 760
    invoke-super {p0, p1, p2}, Landroid/view/View$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 761
    iget v0, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarView$SavedState;->mCurrentScreen:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 762
    return-void
.end method
