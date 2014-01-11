.class interface abstract Lcom/cyanogenmod/trebuchet/FolderInfo$FolderListener;
.super Ljava/lang/Object;
.source "FolderInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/FolderInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "FolderListener"
.end annotation


# virtual methods
.method public abstract onAdd(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V
.end method

.method public abstract onItemsChanged()V
.end method

.method public abstract onRemove(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V
.end method

.method public abstract onTitleChanged(Ljava/lang/CharSequence;)V
.end method
