.class public Lcom/android/launcher2/AddAdapter$ListItem;
.super Ljava/lang/Object;
.source "AddAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/AddAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ListItem"
.end annotation


# instance fields
.field public final actionTag:I

.field public final image:Landroid/graphics/drawable/Drawable;

.field public final text:Ljava/lang/CharSequence;

.field final synthetic this$0:Lcom/android/launcher2/AddAdapter;


# direct methods
.method public constructor <init>(Lcom/android/launcher2/AddAdapter;Landroid/content/res/Resources;III)V
    .locals 1
    .parameter
    .parameter "res"
    .parameter "textResourceId"
    .parameter "imageResourceId"
    .parameter "actionTag"

    .prologue
    .line 54
    iput-object p1, p0, Lcom/android/launcher2/AddAdapter$ListItem;->this$0:Lcom/android/launcher2/AddAdapter;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 55
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/AddAdapter$ListItem;->text:Ljava/lang/CharSequence;

    .line 56
    const/4 v0, -0x1

    if-eq p4, v0, :cond_0

    .line 57
    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/AddAdapter$ListItem;->image:Landroid/graphics/drawable/Drawable;

    .line 61
    :goto_0
    iput p5, p0, Lcom/android/launcher2/AddAdapter$ListItem;->actionTag:I

    .line 62
    return-void

    .line 59
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/launcher2/AddAdapter$ListItem;->image:Landroid/graphics/drawable/Drawable;

    goto :goto_0
.end method
