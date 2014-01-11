.class Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;
.super Ljava/lang/Object;
.source "CellLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/CellLayout;
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
            "Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;",
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
            "Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;",
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

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/CellLayout;


# direct methods
.method private constructor <init>(Lcom/cyanogenmod/trebuchet/CellLayout;)V
    .locals 1
    .parameter

    .prologue
    .line 2676
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2677
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    .line 2678
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->savedMap:Ljava/util/HashMap;

    .line 2679
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->sortedViews:Ljava/util/ArrayList;

    .line 2680
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->isSolution:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/CellLayout$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 2676
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;-><init>(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    return-void
.end method


# virtual methods
.method add(Landroid/view/View;Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;)V
    .locals 3
    .parameter "v"
    .parameter "cs"

    .prologue
    .line 2698
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2699
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->savedMap:Ljava/util/HashMap;

    new-instance v1, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-direct {v1, v2}, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;-><init>(Lcom/cyanogenmod/trebuchet/CellLayout;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2700
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->sortedViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2701
    return-void
.end method

.method area()I
    .locals 2

    .prologue
    .line 2704
    iget v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewSpanX:I

    iget v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->dragViewSpanY:I

    mul-int/2addr v0, v1

    return v0
.end method

.method restore()V
    .locals 4

    .prologue
    .line 2692
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->savedMap:Ljava/util/HashMap;

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

    .line 2693
    .local v1, v:Landroid/view/View;
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->savedMap:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->copy(Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;)V

    goto :goto_0

    .line 2695
    .end local v1           #v:Landroid/view/View;
    :cond_0
    return-void
.end method

.method save()V
    .locals 4

    .prologue
    .line 2685
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

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
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->savedMap:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->copy(Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;)V

    goto :goto_0

    .line 2688
    .end local v1           #v:Landroid/view/View;
    :cond_0
    return-void
.end method
