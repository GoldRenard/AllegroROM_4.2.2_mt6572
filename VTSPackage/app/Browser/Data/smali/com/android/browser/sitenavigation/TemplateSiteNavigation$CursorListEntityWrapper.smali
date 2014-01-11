.class public abstract Lcom/android/browser/sitenavigation/TemplateSiteNavigation$CursorListEntityWrapper;
.super Ljava/lang/Object;
.source "TemplateSiteNavigation.java"

# interfaces
.implements Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntityIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/sitenavigation/TemplateSiteNavigation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "CursorListEntityWrapper"
.end annotation


# instance fields
.field private mCursor:Landroid/database/Cursor;


# direct methods
.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 0
    .parameter "cursor"

    .prologue
    .line 143
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 144
    iput-object p1, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$CursorListEntityWrapper;->mCursor:Landroid/database/Cursor;

    .line 145
    return-void
.end method


# virtual methods
.method public getCursor()Landroid/database/Cursor;
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$CursorListEntityWrapper;->mCursor:Landroid/database/Cursor;

    return-object v0
.end method

.method public getListIterator(Ljava/lang/String;)Lcom/android/browser/sitenavigation/TemplateSiteNavigation$ListEntityIterator;
    .locals 1
    .parameter "key"

    .prologue
    .line 159
    const/4 v0, 0x0

    return-object v0
.end method

.method public moveToNext()Z
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$CursorListEntityWrapper;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    return v0
.end method

.method public reset()V
    .locals 2

    .prologue
    .line 154
    iget-object v0, p0, Lcom/android/browser/sitenavigation/TemplateSiteNavigation$CursorListEntityWrapper;->mCursor:Landroid/database/Cursor;

    const/4 v1, -0x1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 155
    return-void
.end method
