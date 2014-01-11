.class Lcom/android/launcher2/CellLayout$ItemConfiguration;
.super Ljava/lang/Object;
.source "CellLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/CellLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ItemConfiguration"
.end annotation


# instance fields
.field dragViewSpanX:I

.field dragViewSpanY:I

.field dragViewX:I

.field dragViewY:I

.field isSolution:Z

.field map:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/view/View;",
            "Lcom/android/launcher2/CellLayout$CellAndSpan;",
            ">;"
        }
    .end annotation
.end field

.field private savedMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/view/View;",
            "Lcom/android/launcher2/CellLayout$CellAndSpan;",
            ">;"
        }
    .end annotation
.end field

.field sortedViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/android/launcher2/CellLayout;


# direct methods
.method private constructor <init>(Lcom/android/launcher2/CellLayout;)V
    .locals 1
    .parameter

    .prologue
    .line 2669
    iput-object p1, p0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->this$0:Lcom/android/launcher2/CellLayout;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 2670
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    .line 2671
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->savedMap:Ljava/util/HashMap;

    .line 2672
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->sortedViews:Ljava/util/ArrayList;

    .line 2673
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->isSolution:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/CellLayout$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 2669
    invoke-direct {p0, p1}, Lcom/android/launcher2/CellLayout$ItemConfiguration;-><init>(Lcom/android/launcher2/CellLayout;)V

    return-void
.end method


# virtual methods
.method add(Landroid/view/View;Lcom/android/launcher2/CellLayout$CellAndSpan;)V
    .locals 3
    .parameter "v"
    .parameter "cs"

    .prologue
    .line 2691
    iget-object v0, p0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2692
    iget-object v0, p0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->savedMap:Ljava/util/HashMap;

    new-instance v1, Lcom/android/launcher2/CellLayout$CellAndSpan;

    iget-object v2, p0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->this$0:Lcom/android/launcher2/CellLayout;

    invoke-direct {v1, v2}, Lcom/android/launcher2/CellLayout$CellAndSpan;-><init>(Lcom/android/launcher2/CellLayout;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2693
    iget-object v0, p0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->sortedViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2694
    return-void
.end method

.method area()I
    .locals 2

    .prologue
    .line 2697
    iget v0, p0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewSpanX:I

    iget v1, p0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->dragViewSpanY:I

    mul-int/2addr v0, v1

    return v0
.end method

.method restore()V
    .locals 4

    .prologue
    .line 2685
    iget-object v2, p0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->savedMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 2686
    .local v1, v:Landroid/view/View;
    iget-object v2, p0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->savedMap:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/CellLayout$CellAndSpan;

    iget-object v3, p0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/CellLayout$CellAndSpan;

    invoke-virtual {v2, v3}, Lcom/android/launcher2/CellLayout$CellAndSpan;->copy(Lcom/android/launcher2/CellLayout$CellAndSpan;)V

    goto :goto_0

    .line 2688
    .end local v1           #v:Landroid/view/View;
    :cond_0
    return-void
.end method

.method save()V
    .locals 4

    .prologue
    .line 2678
    iget-object v2, p0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 2679
    .local v1, v:Landroid/view/View;
    iget-object v2, p0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/CellLayout$CellAndSpan;

    iget-object v3, p0, Lcom/android/launcher2/CellLayout$ItemConfiguration;->savedMap:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/CellLayout$CellAndSpan;

    invoke-virtual {v2, v3}, Lcom/android/launcher2/CellLayout$CellAndSpan;->copy(Lcom/android/launcher2/CellLayout$CellAndSpan;)V

    goto :goto_0

    .line 2681
    .end local v1           #v:Landroid/view/View;
    :cond_0
    return-void
.end method
