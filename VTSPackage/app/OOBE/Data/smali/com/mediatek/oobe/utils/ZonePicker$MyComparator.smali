.class Lcom/mediatek/oobe/utils/ZonePicker$MyComparator;
.super Ljava/lang/Object;
.source "ZonePicker.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/utils/ZonePicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MyComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/util/HashMap",
        "<**>;>;"
    }
.end annotation


# instance fields
.field private mSortingKey:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "sortingKey"

    .prologue
    .line 355
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 356
    iput-object p1, p0, Lcom/mediatek/oobe/utils/ZonePicker$MyComparator;->mSortingKey:Ljava/lang/String;

    .line 357
    return-void
.end method

.method private isComparable(Ljava/lang/Object;)Z
    .locals 1
    .parameter "value"

    .prologue
    .line 387
    if-eqz p1, :cond_0

    instance-of v0, p1, Ljava/lang/Comparable;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 352
    check-cast p1, Ljava/util/HashMap;

    .end local p1
    check-cast p2, Ljava/util/HashMap;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/mediatek/oobe/utils/ZonePicker$MyComparator;->compare(Ljava/util/HashMap;Ljava/util/HashMap;)I

    move-result v0

    return v0
.end method

.method public compare(Ljava/util/HashMap;Ljava/util/HashMap;)I
    .locals 7
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<**>;",
            "Ljava/util/HashMap",
            "<**>;)I"
        }
    .end annotation

    .prologue
    .line 365
    .local p1, map1:Ljava/util/HashMap;,"Ljava/util/HashMap<**>;"
    .local p2, map2:Ljava/util/HashMap;,"Ljava/util/HashMap<**>;"
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object v0

    .line 366
    .local v0, collator:Ljava/text/Collator;
    iget-object v5, p0, Lcom/mediatek/oobe/utils/ZonePicker$MyComparator;->mSortingKey:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 367
    .local v3, value1:Ljava/lang/Object;
    iget-object v5, p0, Lcom/mediatek/oobe/utils/ZonePicker$MyComparator;->mSortingKey:Ljava/lang/String;

    invoke-virtual {p2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 372
    .local v4, value2:Ljava/lang/Object;
    invoke-direct {p0, v3}, Lcom/mediatek/oobe/utils/ZonePicker$MyComparator;->isComparable(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 373
    invoke-direct {p0, v4}, Lcom/mediatek/oobe/utils/ZonePicker$MyComparator;->isComparable(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x1

    .line 382
    .end local v3           #value1:Ljava/lang/Object;
    :goto_0
    return v5

    .line 373
    .restart local v3       #value1:Ljava/lang/Object;
    :cond_0
    const/4 v5, 0x0

    goto :goto_0

    .line 374
    :cond_1
    invoke-direct {p0, v4}, Lcom/mediatek/oobe/utils/ZonePicker$MyComparator;->isComparable(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 375
    const/4 v5, -0x1

    goto :goto_0

    .line 377
    :cond_2
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/text/Collator;->getCollationKey(Ljava/lang/String;)Ljava/text/CollationKey;

    move-result-object v1

    .line 378
    .local v1, key1:Ljava/text/CollationKey;
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/text/Collator;->getCollationKey(Ljava/lang/String;)Ljava/text/CollationKey;

    move-result-object v2

    .line 379
    .local v2, key2:Ljava/text/CollationKey;
    const-string v5, "name"

    iget-object v6, p0, Lcom/mediatek/oobe/utils/ZonePicker$MyComparator;->mSortingKey:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 380
    invoke-virtual {v1, v2}, Ljava/text/CollationKey;->compareTo(Ljava/text/CollationKey;)I

    move-result v5

    goto :goto_0

    .line 382
    :cond_3
    check-cast v3, Ljava/lang/Comparable;

    .end local v3           #value1:Ljava/lang/Object;
    invoke-interface {v3, v4}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v5

    goto :goto_0
.end method

.method public setSortingKey(Ljava/lang/String;)V
    .locals 0
    .parameter "sortingKey"

    .prologue
    .line 360
    iput-object p1, p0, Lcom/mediatek/oobe/utils/ZonePicker$MyComparator;->mSortingKey:Ljava/lang/String;

    .line 361
    return-void
.end method
