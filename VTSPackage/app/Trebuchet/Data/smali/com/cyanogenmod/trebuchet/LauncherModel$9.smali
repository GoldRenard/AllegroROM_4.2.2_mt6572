.class final Lcom/cyanogenmod/trebuchet/LauncherModel$9;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/LauncherModel;->getWidgetNameComparator()Ljava/util/Comparator;
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
        "Landroid/appwidget/AppWidgetProviderInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$collator:Ljava/text/Collator;


# direct methods
.method constructor <init>(Ljava/text/Collator;)V
    .locals 0
    .parameter

    .prologue
    .line 2505
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$9;->val$collator:Ljava/text/Collator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Landroid/appwidget/AppWidgetProviderInfo;Landroid/appwidget/AppWidgetProviderInfo;)I
    .locals 3
    .parameter "a"
    .parameter "b"

    .prologue
    .line 2507
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$9;->val$collator:Ljava/text/Collator;

    iget-object v1, p1, Landroid/appwidget/AppWidgetProviderInfo;->label:Ljava/lang/String;

    iget-object v2, p2, Landroid/appwidget/AppWidgetProviderInfo;->label:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 2505
    check-cast p1, Landroid/appwidget/AppWidgetProviderInfo;

    .end local p1
    check-cast p2, Landroid/appwidget/AppWidgetProviderInfo;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/LauncherModel$9;->compare(Landroid/appwidget/AppWidgetProviderInfo;Landroid/appwidget/AppWidgetProviderInfo;)I

    move-result v0

    return v0
.end method
