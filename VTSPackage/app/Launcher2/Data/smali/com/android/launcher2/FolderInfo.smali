.class Lcom/android/launcher2/FolderInfo;
.super Lcom/android/launcher2/ItemInfo;
.source "FolderInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/FolderInfo$FolderListener;
    }
.end annotation


# instance fields
.field contents:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ShortcutInfo;",
            ">;"
        }
    .end annotation
.end field

.field listeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/FolderInfo$FolderListener;",
            ">;"
        }
    .end annotation
.end field

.field opened:Z


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/android/launcher2/ItemInfo;-><init>()V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/FolderInfo;->contents:Ljava/util/ArrayList;

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/FolderInfo;->listeners:Ljava/util/ArrayList;

    .line 41
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/launcher2/ItemInfo;->itemType:I

    .line 42
    return-void
.end method


# virtual methods
.method public add(Lcom/android/launcher2/ShortcutInfo;)V
    .locals 2
    .parameter "item"

    .prologue
    .line 50
    iget-object v1, p0, Lcom/android/launcher2/FolderInfo;->contents:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/android/launcher2/FolderInfo;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 52
    iget-object v1, p0, Lcom/android/launcher2/FolderInfo;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/FolderInfo$FolderListener;

    invoke-interface {v1, p1}, Lcom/android/launcher2/FolderInfo$FolderListener;->onAdd(Lcom/android/launcher2/ShortcutInfo;)V

    .line 51
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 54
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/FolderInfo;->itemsChanged()V

    .line 55
    return-void
.end method

.method addListener(Lcom/android/launcher2/FolderInfo$FolderListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/android/launcher2/FolderInfo;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    return-void
.end method

.method itemsChanged()V
    .locals 2

    .prologue
    .line 94
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/android/launcher2/FolderInfo;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 95
    iget-object v1, p0, Lcom/android/launcher2/FolderInfo;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/FolderInfo$FolderListener;

    invoke-interface {v1}, Lcom/android/launcher2/FolderInfo$FolderListener;->onItemsChanged()V

    .line 94
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 97
    :cond_0
    return-void
.end method

.method onAddToDatabase(Landroid/content/ContentValues;)V
    .locals 2
    .parameter "values"

    .prologue
    .line 79
    invoke-super {p0, p1}, Lcom/android/launcher2/ItemInfo;->onAddToDatabase(Landroid/content/ContentValues;)V

    .line 80
    const-string v0, "title"

    iget-object v1, p0, Lcom/android/launcher2/ItemInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    return-void
.end method

.method public remove(Lcom/android/launcher2/ShortcutInfo;)V
    .locals 2
    .parameter "item"

    .prologue
    .line 63
    iget-object v1, p0, Lcom/android/launcher2/FolderInfo;->contents:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 64
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/android/launcher2/FolderInfo;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 65
    iget-object v1, p0, Lcom/android/launcher2/FolderInfo;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/FolderInfo$FolderListener;

    invoke-interface {v1, p1}, Lcom/android/launcher2/FolderInfo$FolderListener;->onRemove(Lcom/android/launcher2/ShortcutInfo;)V

    .line 64
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 67
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/FolderInfo;->itemsChanged()V

    .line 68
    return-void
.end method

.method removeListener(Lcom/android/launcher2/FolderInfo$FolderListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/android/launcher2/FolderInfo;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/android/launcher2/FolderInfo;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 91
    :cond_0
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 2
    .parameter "title"

    .prologue
    .line 71
    iput-object p1, p0, Lcom/android/launcher2/ItemInfo;->title:Ljava/lang/CharSequence;

    .line 72
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/android/launcher2/FolderInfo;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 73
    iget-object v1, p0, Lcom/android/launcher2/FolderInfo;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/FolderInfo$FolderListener;

    invoke-interface {v1, p1}, Lcom/android/launcher2/FolderInfo$FolderListener;->onTitleChanged(Ljava/lang/CharSequence;)V

    .line 72
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 75
    :cond_0
    return-void
.end method

.method unbind()V
    .locals 1

    .prologue
    .line 101
    invoke-super {p0}, Lcom/android/launcher2/ItemInfo;->unbind()V

    .line 102
    iget-object v0, p0, Lcom/android/launcher2/FolderInfo;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 103
    return-void
.end method
