.class Lcom/android/settings/ZonePicker$MyComparator;
.super Ljava/lang/Object;
.source "ZonePicker.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/ZonePicker;
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
    .line 313
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 314
    iput-object p1, p0, Lcom/android/settings/ZonePicker$MyComparator;->mSortingKey:Ljava/lang/String;

    .line 315
    return-void
.end method

.method private isComparable(Ljava/lang/Object;)Z
    .locals 1
    .parameter "value"

    .prologue
    .line 351
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
    .line 310
    check-cast p1, Ljava/util/HashMap;

    .end local p1
    check-cast p2, Ljava/util/HashMap;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/android/settings/ZonePicker$MyComparator;->compare(Ljava/util/HashMap;Ljava/util/HashMap;)I

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
    .line 323
    .local p1, map1:Ljava/util/HashMap;,"Ljava/util/HashMap<**>;"
    .local p2, map2:Ljava/util/HashMap;,"Ljava/util/HashMap<**>;"
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object v0

    .line 324
    .local v0, collator:Ljava/text/Collator;
    iget-object v5, p0, Lcom/android/settings/ZonePicker$MyComparator;->mSortingKey:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 325
    .local v3, value1:Ljava/lang/Object;
    iget-object v5, p0, Lcom/android/settings/ZonePicker$MyComparator;->mSortingKey:Ljava/lang/String;

    invoke-virtual {p2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 331
    .local v4, value2:Ljava/lang/Object;
    invoke-direct {p0, v3}, Lcom/android/settings/ZonePicker$MyComparator;->isComparable(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 332
    invoke-direct {p0, v4}, Lcom/android/settings/ZonePicker$MyComparator;->isComparable(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x1

    .line 346
    .end local v3           #value1:Ljava/lang/Object;
    :goto_0
    return v5

    .line 332
    .restart local v3       #value1:Ljava/lang/Object;
    :cond_0
    const/4 v5, 0x0

    goto :goto_0

    .line 333
    :cond_1
    invoke-direct {p0, v4}, Lcom/android/settings/ZonePicker$MyComparator;->isComparable(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 334
    const/4 v5, -0x1

    goto :goto_0

    .line 340
    :cond_2
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/text/Collator;->getCollationKey(Ljava/lang/String;)Ljava/text/CollationKey;

    move-result-object v1

    .line 341
    .local v1, key1:Ljava/text/CollationKey;
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/text/Collator;->getCollationKey(Ljava/lang/String;)Ljava/text/CollationKey;

    move-result-object v2

    .line 343
    .local v2, key2:Ljava/text/CollationKey;
    const-string v5, "name"

    iget-object v6, p0, Lcom/android/settings/ZonePicker$MyComparator;->mSortingKey:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 344
    invoke-virtual {v1, v2}, Ljava/text/CollationKey;->compareTo(Ljava/text/CollationKey;)I

    move-result v5

    goto :goto_0

    .line 346
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
    .line 318
    iput-object p1, p0, Lcom/android/settings/ZonePicker$MyComparator;->mSortingKey:Ljava/lang/String;

    .line 319
    return-void
.end method
