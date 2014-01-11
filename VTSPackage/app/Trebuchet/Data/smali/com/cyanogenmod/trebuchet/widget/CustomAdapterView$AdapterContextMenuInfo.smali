.class public Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterContextMenuInfo;
.super Ljava/lang/Object;
.source "CustomAdapterView.java"

# interfaces
.implements Landroid/view/ContextMenu$ContextMenuInfo;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AdapterContextMenuInfo"
.end annotation


# instance fields
.field public id:J

.field public position:I

.field public targetView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;IJ)V
    .locals 0
    .parameter "targetView"
    .parameter "position"
    .parameter "id"

    .prologue
    .line 376
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 377
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterContextMenuInfo;->targetView:Landroid/view/View;

    .line 378
    iput p2, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterContextMenuInfo;->position:I

    .line 379
    iput-wide p3, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterContextMenuInfo;->id:J

    .line 380
    return-void
.end method
