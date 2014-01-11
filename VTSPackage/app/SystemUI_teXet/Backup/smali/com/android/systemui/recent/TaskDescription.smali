.class public final Lcom/android/systemui/recent/TaskDescription;
.super Ljava/lang/Object;
.source "TaskDescription.java"


# instance fields
.field final description:Ljava/lang/CharSequence;

.field final intent:Landroid/content/Intent;

.field private mIcon:Landroid/graphics/drawable/Drawable;

.field private mLabel:Ljava/lang/CharSequence;

.field private mLoaded:Z

.field private mThumbnail:Landroid/graphics/Bitmap;

.field final packageName:Ljava/lang/String;

.field final persistentTaskId:I

.field final resolveInfo:Landroid/content/pm/ResolveInfo;

.field final taskId:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, -0x1

    const/4 v0, 0x0

    .line 49
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object v0, p0, Lcom/android/systemui/recent/TaskDescription;->resolveInfo:Landroid/content/pm/ResolveInfo;

    .line 51
    iput-object v0, p0, Lcom/android/systemui/recent/TaskDescription;->intent:Landroid/content/Intent;

    .line 52
    iput v1, p0, Lcom/android/systemui/recent/TaskDescription;->taskId:I

    .line 53
    iput v1, p0, Lcom/android/systemui/recent/TaskDescription;->persistentTaskId:I

    .line 55
    iput-object v0, p0, Lcom/android/systemui/recent/TaskDescription;->description:Ljava/lang/CharSequence;

    .line 56
    iput-object v0, p0, Lcom/android/systemui/recent/TaskDescription;->packageName:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public constructor <init>(IILandroid/content/pm/ResolveInfo;Landroid/content/Intent;Ljava/lang/String;Ljava/lang/CharSequence;)V
    .registers 7
    .parameter "_taskId"
    .parameter "_persistentTaskId"
    .parameter "_resolveInfo"
    .parameter "_intent"
    .parameter "_packageName"
    .parameter "_description"

    .prologue
    .line 39
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p3, p0, Lcom/android/systemui/recent/TaskDescription;->resolveInfo:Landroid/content/pm/ResolveInfo;

    .line 41
    iput-object p4, p0, Lcom/android/systemui/recent/TaskDescription;->intent:Landroid/content/Intent;

    .line 42
    iput p1, p0, Lcom/android/systemui/recent/TaskDescription;->taskId:I

    .line 43
    iput p2, p0, Lcom/android/systemui/recent/TaskDescription;->persistentTaskId:I

    .line 45
    iput-object p6, p0, Lcom/android/systemui/recent/TaskDescription;->description:Ljava/lang/CharSequence;

    .line 46
    iput-object p5, p0, Lcom/android/systemui/recent/TaskDescription;->packageName:Ljava/lang/String;

    .line 47
    return-void
.end method


# virtual methods
.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/systemui/recent/TaskDescription;->mIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getLabel()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/android/systemui/recent/TaskDescription;->mLabel:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getThumbnail()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lcom/android/systemui/recent/TaskDescription;->mThumbnail:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public isLoaded()Z
    .registers 2

    .prologue
    .line 64
    iget-boolean v0, p0, Lcom/android/systemui/recent/TaskDescription;->mLoaded:Z

    return v0
.end method

.method public isNull()Z
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/android/systemui/recent/TaskDescription;->resolveInfo:Landroid/content/pm/ResolveInfo;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .parameter "icon"

    .prologue
    .line 85
    iput-object p1, p0, Lcom/android/systemui/recent/TaskDescription;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 86
    return-void
.end method

.method public setLabel(Ljava/lang/CharSequence;)V
    .registers 2
    .parameter "label"

    .prologue
    .line 77
    iput-object p1, p0, Lcom/android/systemui/recent/TaskDescription;->mLabel:Ljava/lang/CharSequence;

    .line 78
    return-void
.end method

.method public setLoaded(Z)V
    .registers 2
    .parameter "loaded"

    .prologue
    .line 60
    iput-boolean p1, p0, Lcom/android/systemui/recent/TaskDescription;->mLoaded:Z

    .line 61
    return-void
.end method

.method public setThumbnail(Landroid/graphics/Bitmap;)V
    .registers 2
    .parameter "thumbnail"

    .prologue
    .line 89
    iput-object p1, p0, Lcom/android/systemui/recent/TaskDescription;->mThumbnail:Landroid/graphics/Bitmap;

    .line 90
    return-void
.end method
