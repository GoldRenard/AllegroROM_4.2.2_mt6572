.class public Lcom/mediatek/calloption/SimPickerAdapter$ItemHolder;
.super Ljava/lang/Object;
.source "SimPickerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/calloption/SimPickerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ItemHolder"
.end annotation


# instance fields
.field public mData:Ljava/lang/Object;

.field public mType:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;I)V
    .locals 0
    .parameter "data"
    .parameter "type"

    .prologue
    .line 54
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lcom/mediatek/calloption/SimPickerAdapter$ItemHolder;->mData:Ljava/lang/Object;

    .line 56
    iput p2, p0, Lcom/mediatek/calloption/SimPickerAdapter$ItemHolder;->mType:I

    .line 57
    return-void
.end method
