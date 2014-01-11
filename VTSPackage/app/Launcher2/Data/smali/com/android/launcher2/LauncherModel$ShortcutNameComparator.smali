.class public Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/LauncherModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ShortcutNameComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Landroid/content/pm/ResolveInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private mCollator:Ljava/text/Collator;

.field private mLabelCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field

.field private mPackageManager:Landroid/content/pm/PackageManager;


# direct methods
.method constructor <init>(Landroid/content/pm/PackageManager;)V
    .locals 1
    .parameter "pm"

    .prologue
    .line 2735
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 2736
    iput-object p1, p0, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 2737
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;->mLabelCache:Ljava/util/HashMap;

    .line 2738
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;->mCollator:Ljava/text/Collator;

    .line 2739
    return-void
.end method

.method constructor <init>(Landroid/content/pm/PackageManager;Ljava/util/HashMap;)V
    .locals 1
    .parameter "pm"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/pm/PackageManager;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/CharSequence;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2740
    .local p2, labelCache:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Object;Ljava/lang/CharSequence;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 2741
    iput-object p1, p0, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 2742
    iput-object p2, p0, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;->mLabelCache:Ljava/util/HashMap;

    .line 2743
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;->mCollator:Ljava/text/Collator;

    .line 2744
    return-void
.end method


# virtual methods
.method public final compare(Landroid/content/pm/ResolveInfo;Landroid/content/pm/ResolveInfo;)I
    .locals 5
    .parameter "a"
    .parameter "b"

    .prologue
    .line 2747
    invoke-static {p1}, Lcom/android/launcher2/LauncherModel;->getComponentNameFromResolveInfo(Landroid/content/pm/ResolveInfo;)Landroid/content/ComponentName;

    move-result-object v0

    .line 2748
    .local v0, keyA:Landroid/content/ComponentName;
    invoke-static {p2}, Lcom/android/launcher2/LauncherModel;->getComponentNameFromResolveInfo(Landroid/content/pm/ResolveInfo;)Landroid/content/ComponentName;

    move-result-object v1

    .line 2749
    .local v1, keyB:Landroid/content/ComponentName;
    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;->mLabelCache:Ljava/util/HashMap;

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2750
    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;->mLabelCache:Ljava/util/HashMap;

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    .line 2756
    .local v2, labelA:Ljava/lang/CharSequence;
    :goto_0
    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;->mLabelCache:Ljava/util/HashMap;

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 2757
    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;->mLabelCache:Ljava/util/HashMap;

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    .line 2763
    .local v3, labelB:Ljava/lang/CharSequence;
    :goto_1
    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;->mCollator:Ljava/text/Collator;

    invoke-virtual {v4, v2, v3}, Ljava/text/Collator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v4

    return v4

    .line 2752
    .end local v2           #labelA:Ljava/lang/CharSequence;
    .end local v3           #labelB:Ljava/lang/CharSequence;
    :cond_0
    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {p1, v4}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2754
    .restart local v2       #labelA:Ljava/lang/CharSequence;
    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;->mLabelCache:Ljava/util/HashMap;

    invoke-virtual {v4, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 2759
    :cond_1
    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {p2, v4}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2761
    .restart local v3       #labelB:Ljava/lang/CharSequence;
    iget-object v4, p0, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;->mLabelCache:Ljava/util/HashMap;

    invoke-virtual {v4, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 2731
    check-cast p1, Landroid/content/pm/ResolveInfo;

    .end local p1
    check-cast p2, Landroid/content/pm/ResolveInfo;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher2/LauncherModel$ShortcutNameComparator;->compare(Landroid/content/pm/ResolveInfo;Landroid/content/pm/ResolveInfo;)I

    move-result v0

    return v0
.end method
