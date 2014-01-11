.class public Lcom/android/launcher2/LauncherModel$WidgetAndShortcutNameComparator;
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
    name = "WidgetAndShortcutNameComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/lang/Object;",
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
            "Ljava/lang/String;",
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
    .line 2770
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 2771
    iput-object p1, p0, Lcom/android/launcher2/LauncherModel$WidgetAndShortcutNameComparator;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 2772
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/LauncherModel$WidgetAndShortcutNameComparator;->mLabelCache:Ljava/util/HashMap;

    .line 2773
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/LauncherModel$WidgetAndShortcutNameComparator;->mCollator:Ljava/text/Collator;

    .line 2774
    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 4
    .parameter "a"
    .parameter "b"

    .prologue
    .line 2777
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$WidgetAndShortcutNameComparator;->mLabelCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2778
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$WidgetAndShortcutNameComparator;->mLabelCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2785
    .local v0, labelA:Ljava/lang/String;
    :goto_0
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$WidgetAndShortcutNameComparator;->mLabelCache:Ljava/util/HashMap;

    invoke-virtual {v2, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2786
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$WidgetAndShortcutNameComparator;->mLabelCache:Ljava/util/HashMap;

    invoke-virtual {v2, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 2793
    .local v1, labelB:Ljava/lang/String;
    :goto_1
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$WidgetAndShortcutNameComparator;->mCollator:Ljava/text/Collator;

    invoke-virtual {v2, v0, v1}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    return v2

    .line 2780
    .end local v0           #labelA:Ljava/lang/String;
    .end local v1           #labelB:Ljava/lang/String;
    :cond_0
    instance-of v2, p1, Landroid/appwidget/AppWidgetProviderInfo;

    if-eqz v2, :cond_1

    move-object v2, p1

    check-cast v2, Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v0, v2, Landroid/appwidget/AppWidgetProviderInfo;->label:Ljava/lang/String;

    .line 2783
    .restart local v0       #labelA:Ljava/lang/String;
    :goto_2
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$WidgetAndShortcutNameComparator;->mLabelCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .end local v0           #labelA:Ljava/lang/String;
    :cond_1
    move-object v2, p1

    .line 2780
    check-cast v2, Landroid/content/pm/ResolveInfo;

    iget-object v3, p0, Lcom/android/launcher2/LauncherModel$WidgetAndShortcutNameComparator;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v2, v3}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 2788
    .restart local v0       #labelA:Ljava/lang/String;
    :cond_2
    instance-of v2, p2, Landroid/appwidget/AppWidgetProviderInfo;

    if-eqz v2, :cond_3

    move-object v2, p2

    check-cast v2, Landroid/appwidget/AppWidgetProviderInfo;

    iget-object v1, v2, Landroid/appwidget/AppWidgetProviderInfo;->label:Ljava/lang/String;

    .line 2791
    .restart local v1       #labelB:Ljava/lang/String;
    :goto_3
    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$WidgetAndShortcutNameComparator;->mLabelCache:Ljava/util/HashMap;

    invoke-virtual {v2, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .end local v1           #labelB:Ljava/lang/String;
    :cond_3
    move-object v2, p2

    .line 2788
    check-cast v2, Landroid/content/pm/ResolveInfo;

    iget-object v3, p0, Lcom/android/launcher2/LauncherModel$WidgetAndShortcutNameComparator;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v2, v3}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_3
.end method
