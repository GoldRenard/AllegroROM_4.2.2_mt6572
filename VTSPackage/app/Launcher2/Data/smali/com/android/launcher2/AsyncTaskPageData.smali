.class Lcom/android/launcher2/AsyncTaskPageData;
.super Ljava/lang/Object;
.source "AppsCustomizePagedView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/AsyncTaskPageData$Type;
    }
.end annotation


# instance fields
.field doInBackgroundCallback:Lcom/android/launcher2/AsyncTaskCallback;

.field generatedImages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field maxImageHeight:I

.field maxImageWidth:I

.field page:I

.field postExecuteCallback:Lcom/android/launcher2/AsyncTaskCallback;

.field sourceImages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(ILjava/util/ArrayList;IILcom/android/launcher2/AsyncTaskCallback;Lcom/android/launcher2/AsyncTaskCallback;)V
    .locals 1
    .parameter "p"
    .parameter
    .parameter "cw"
    .parameter "ch"
    .parameter "bgR"
    .parameter "postR"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;II",
            "Lcom/android/launcher2/AsyncTaskCallback;",
            "Lcom/android/launcher2/AsyncTaskCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 103
    .local p2, l:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 104
    iput p1, p0, Lcom/android/launcher2/AsyncTaskPageData;->page:I

    .line 105
    iput-object p2, p0, Lcom/android/launcher2/AsyncTaskPageData;->items:Ljava/util/ArrayList;

    .line 106
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/AsyncTaskPageData;->generatedImages:Ljava/util/ArrayList;

    .line 107
    iput p3, p0, Lcom/android/launcher2/AsyncTaskPageData;->maxImageWidth:I

    .line 108
    iput p4, p0, Lcom/android/launcher2/AsyncTaskPageData;->maxImageHeight:I

    .line 109
    iput-object p5, p0, Lcom/android/launcher2/AsyncTaskPageData;->doInBackgroundCallback:Lcom/android/launcher2/AsyncTaskCallback;

    .line 110
    iput-object p6, p0, Lcom/android/launcher2/AsyncTaskPageData;->postExecuteCallback:Lcom/android/launcher2/AsyncTaskCallback;

    .line 111
    return-void
.end method

.method constructor <init>(ILjava/util/ArrayList;Ljava/util/ArrayList;Lcom/android/launcher2/AsyncTaskCallback;Lcom/android/launcher2/AsyncTaskCallback;)V
    .locals 1
    .parameter "p"
    .parameter
    .parameter
    .parameter "bgR"
    .parameter "postR"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Lcom/android/launcher2/AsyncTaskCallback;",
            "Lcom/android/launcher2/AsyncTaskCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 93
    .local p2, l:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p3, si:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/graphics/Bitmap;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput p1, p0, Lcom/android/launcher2/AsyncTaskPageData;->page:I

    .line 95
    iput-object p2, p0, Lcom/android/launcher2/AsyncTaskPageData;->items:Ljava/util/ArrayList;

    .line 96
    iput-object p3, p0, Lcom/android/launcher2/AsyncTaskPageData;->sourceImages:Ljava/util/ArrayList;

    .line 97
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/AsyncTaskPageData;->generatedImages:Ljava/util/ArrayList;

    .line 98
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/launcher2/AsyncTaskPageData;->maxImageHeight:I

    iput v0, p0, Lcom/android/launcher2/AsyncTaskPageData;->maxImageWidth:I

    .line 99
    iput-object p4, p0, Lcom/android/launcher2/AsyncTaskPageData;->doInBackgroundCallback:Lcom/android/launcher2/AsyncTaskCallback;

    .line 100
    iput-object p5, p0, Lcom/android/launcher2/AsyncTaskPageData;->postExecuteCallback:Lcom/android/launcher2/AsyncTaskCallback;

    .line 101
    return-void
.end method


# virtual methods
.method cleanup(Z)V
    .locals 3
    .parameter "cancelled"

    .prologue
    .line 114
    iget-object v2, p0, Lcom/android/launcher2/AsyncTaskPageData;->sourceImages:Ljava/util/ArrayList;

    if-eqz v2, :cond_1

    .line 115
    if-eqz p1, :cond_0

    .line 116
    iget-object v2, p0, Lcom/android/launcher2/AsyncTaskPageData;->sourceImages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 117
    .local v0, b:Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_0

    .line 120
    .end local v0           #b:Landroid/graphics/Bitmap;
    .end local v1           #i$:Ljava/util/Iterator;
    :cond_0
    iget-object v2, p0, Lcom/android/launcher2/AsyncTaskPageData;->sourceImages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 122
    :cond_1
    iget-object v2, p0, Lcom/android/launcher2/AsyncTaskPageData;->generatedImages:Ljava/util/ArrayList;

    if-eqz v2, :cond_3

    .line 123
    if-eqz p1, :cond_2

    .line 124
    iget-object v2, p0, Lcom/android/launcher2/AsyncTaskPageData;->generatedImages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .restart local v1       #i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 125
    .restart local v0       #b:Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_1

    .line 128
    .end local v0           #b:Landroid/graphics/Bitmap;
    .end local v1           #i$:Ljava/util/Iterator;
    :cond_2
    iget-object v2, p0, Lcom/android/launcher2/AsyncTaskPageData;->generatedImages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 130
    :cond_3
    return-void
.end method
