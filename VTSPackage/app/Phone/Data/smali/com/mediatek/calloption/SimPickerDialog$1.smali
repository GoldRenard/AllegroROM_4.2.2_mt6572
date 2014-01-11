.class final Lcom/mediatek/calloption/SimPickerDialog$1;
.super Ljava/lang/Object;
.source "SimPickerDialog.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/calloption/SimPickerDialog;->createItemHolder(Landroid/content/Context;ZZ)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Landroid/provider/Telephony$SIMInfo;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 65
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Landroid/provider/Telephony$SIMInfo;Landroid/provider/Telephony$SIMInfo;)I
    .locals 2
    .parameter "arg0"
    .parameter "arg1"

    .prologue
    .line 68
    iget v0, p1, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    iget v1, p2, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 65
    check-cast p1, Landroid/provider/Telephony$SIMInfo;

    .end local p1
    check-cast p2, Landroid/provider/Telephony$SIMInfo;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/mediatek/calloption/SimPickerDialog$1;->compare(Landroid/provider/Telephony$SIMInfo;Landroid/provider/Telephony$SIMInfo;)I

    move-result v0

    return v0
.end method
