.class public Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;
.super Ljava/lang/Object;
.source "HideFromAccessibilityHelper.java"

# interfaces
.implements Landroid/view/ViewGroup$OnHierarchyChangeListener;


# instance fields
.field mHide:Z

.field mOnlyAllApps:Z

.field private mPreviousValues:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->mPreviousValues:Ljava/util/HashMap;

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->mHide:Z

    .line 33
    return-void
.end method

.method private hasAncestorOfType(Landroid/view/View;Ljava/lang/Class;)Z
    .locals 1
    .parameter "v"
    .parameter "c"

    .prologue
    .line 108
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-direct {p0, v0, p2}, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->hasAncestorOfType(Landroid/view/View;Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private includeView(Landroid/view/View;)Z
    .locals 1
    .parameter "v"

    .prologue
    .line 103
    const-class v0, Lcom/cyanogenmod/trebuchet/Cling;

    invoke-direct {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->hasAncestorOfType(Landroid/view/View;Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->mOnlyAllApps:Z

    if-eqz v0, :cond_0

    const-class v0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    invoke-direct {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->hasAncestorOfType(Landroid/view/View;Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private restoreImportantForAccessibilityHelper(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    .line 67
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->mPreviousValues:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p1, v3}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 68
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->mPreviousValues:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    instance-of v3, p1, Landroid/view/ViewGroup;

    if-eqz v3, :cond_2

    move-object v2, p1

    .line 72
    check-cast v2, Landroid/view/ViewGroup;

    .line 76
    .local v2, vg:Landroid/view/ViewGroup;
    instance-of v3, v2, Landroid/view/ViewGroup$OnHierarchyChangeListener;

    if-eqz v3, :cond_1

    move-object v3, v2

    .line 77
    check-cast v3, Landroid/view/ViewGroup$OnHierarchyChangeListener;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    .line 81
    :goto_0
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 82
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 83
    .local v0, child:Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->includeView(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 84
    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->restoreImportantForAccessibilityHelper(Landroid/view/View;)V

    .line 81
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 79
    .end local v0           #child:Landroid/view/View;
    .end local v1           #i:I
    :cond_1
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    goto :goto_0

    .line 88
    .end local v2           #vg:Landroid/view/ViewGroup;
    :cond_2
    return-void
.end method

.method private setImportantForAccessibilityToNoHelper(Landroid/view/View;)V
    .locals 5
    .parameter "v"

    .prologue
    .line 42
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->mPreviousValues:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/view/View;->getImportantForAccessibility()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, p1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    const/4 v3, 0x2

    invoke-virtual {p1, v3}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 46
    instance-of v3, p1, Landroid/view/ViewGroup;

    if-eqz v3, :cond_1

    move-object v2, p1

    .line 47
    check-cast v2, Landroid/view/ViewGroup;

    .line 48
    .local v2, vg:Landroid/view/ViewGroup;
    invoke-virtual {v2, p0}, Landroid/view/ViewGroup;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    .line 49
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 50
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 52
    .local v0, child:Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->includeView(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 53
    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->setImportantForAccessibilityToNoHelper(Landroid/view/View;)V

    .line 49
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 57
    .end local v0           #child:Landroid/view/View;
    .end local v1           #i:I
    .end local v2           #vg:Landroid/view/ViewGroup;
    :cond_1
    return-void
.end method


# virtual methods
.method public onChildViewAdded(Landroid/view/View;Landroid/view/View;)V
    .locals 1
    .parameter "parent"
    .parameter "child"

    .prologue
    .line 91
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->mHide:Z

    if-eqz v0, :cond_0

    invoke-direct {p0, p2}, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->includeView(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 92
    invoke-direct {p0, p2}, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->setImportantForAccessibilityToNoHelper(Landroid/view/View;)V

    .line 94
    :cond_0
    return-void
.end method

.method public onChildViewRemoved(Landroid/view/View;Landroid/view/View;)V
    .locals 1
    .parameter "parent"
    .parameter "child"

    .prologue
    .line 97
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->mHide:Z

    if-eqz v0, :cond_0

    invoke-direct {p0, p2}, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->includeView(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    invoke-direct {p0, p2}, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->restoreImportantForAccessibilityHelper(Landroid/view/View;)V

    .line 100
    :cond_0
    return-void
.end method

.method public restoreImportantForAccessibility(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 60
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->mHide:Z

    if-eqz v0, :cond_0

    .line 61
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->restoreImportantForAccessibilityHelper(Landroid/view/View;)V

    .line 63
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->mHide:Z

    .line 64
    return-void
.end method

.method public setImportantForAccessibilityToNo(Landroid/view/View;Z)V
    .locals 1
    .parameter "v"
    .parameter "onlyAllApps"

    .prologue
    .line 36
    iput-boolean p2, p0, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->mOnlyAllApps:Z

    .line 37
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->setImportantForAccessibilityToNoHelper(Landroid/view/View;)V

    .line 38
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->mHide:Z

    .line 39
    return-void
.end method
