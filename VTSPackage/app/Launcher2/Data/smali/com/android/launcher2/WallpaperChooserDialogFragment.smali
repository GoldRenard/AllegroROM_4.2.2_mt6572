.class public Lcom/android/launcher2/WallpaperChooserDialogFragment;
.super Landroid/app/DialogFragment;
.source "WallpaperChooserDialogFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;,
        Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;,
        Lcom/android/launcher2/WallpaperChooserDialogFragment$ImageAdapter;
    }
.end annotation


# static fields
.field private static final EMBEDDED_KEY:Ljava/lang/String; = "com.android.launcher2.WallpaperChooserDialogFragment.EMBEDDED_KEY"

.field private static final TAG:Ljava/lang/String; = "WallpaperChooserDialogFragment"


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mEmbedded:Z

.field private mImages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mLoader:Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;

.field private mThumbs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mWallpaperDrawable:Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 52
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 59
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mBitmap:Landroid/graphics/Bitmap;

    .line 64
    new-instance v0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;

    invoke-direct {v0}, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mWallpaperDrawable:Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;

    .line 355
    return-void
.end method

.method static synthetic access$000(Lcom/android/launcher2/WallpaperChooserDialogFragment;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/android/launcher2/WallpaperChooserDialogFragment;->selectWallpaper(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/launcher2/WallpaperChooserDialogFragment;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mThumbs:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/launcher2/WallpaperChooserDialogFragment;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mImages:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/launcher2/WallpaperChooserDialogFragment;)Landroid/graphics/Bitmap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method static synthetic access$302(Lcom/android/launcher2/WallpaperChooserDialogFragment;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 52
    iput-object p1, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mBitmap:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$400(Lcom/android/launcher2/WallpaperChooserDialogFragment;)Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mWallpaperDrawable:Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;

    return-object v0
.end method

.method static synthetic access$502(Lcom/android/launcher2/WallpaperChooserDialogFragment;Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;)Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 52
    iput-object p1, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mLoader:Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;

    return-object p1
.end method

.method private addWallpapers(Landroid/content/res/Resources;Ljava/lang/String;I)V
    .locals 9
    .parameter "resources"
    .parameter "packageName"
    .parameter "list"

    .prologue
    .line 233
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    .line 234
    .local v2, extras:[Ljava/lang/String;
    move-object v0, v2

    .local v0, arr$:[Ljava/lang/String;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v1, v0, v3

    .line 235
    .local v1, extra:Ljava/lang/String;
    const-string v7, "drawable"

    invoke-virtual {p1, v1, v7, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 236
    .local v5, res:I
    if-eqz v5, :cond_0

    .line 237
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "_small"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "drawable"

    invoke-virtual {p1, v7, v8, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    .line 240
    .local v6, thumbRes:I
    if-eqz v6, :cond_0

    .line 241
    iget-object v7, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mThumbs:Ljava/util/ArrayList;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 242
    iget-object v7, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mImages:Ljava/util/ArrayList;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 234
    .end local v6           #thumbRes:I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 247
    .end local v1           #extra:Ljava/lang/String;
    .end local v5           #res:I
    :cond_1
    return-void
.end method

.method private cancelLoader()V
    .locals 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mLoader:Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mLoader:Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;

    invoke-virtual {v0}, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask$Status;->FINISHED:Landroid/os/AsyncTask$Status;

    if-eq v0, v1, :cond_0

    .line 96
    iget-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mLoader:Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;->cancel(Z)Z

    .line 97
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mLoader:Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;

    .line 99
    :cond_0
    return-void
.end method

.method private findWallpapers()V
    .locals 5

    .prologue
    const v4, 0x7f0c0001

    const/16 v3, 0x18

    .line 218
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mThumbs:Ljava/util/ArrayList;

    .line 219
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mImages:Ljava/util/ArrayList;

    .line 221
    invoke-virtual {p0}, Lcom/android/launcher2/WallpaperChooserDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 226
    .local v1, resources:Landroid/content/res/Resources;
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getResourcePackageName(I)Ljava/lang/String;

    move-result-object v0

    .line 228
    .local v0, packageName:Ljava/lang/String;
    invoke-direct {p0, v1, v0, v4}, Lcom/android/launcher2/WallpaperChooserDialogFragment;->addWallpapers(Landroid/content/res/Resources;Ljava/lang/String;I)V

    .line 229
    const/high16 v2, 0x7f0c

    invoke-direct {p0, v1, v0, v2}, Lcom/android/launcher2/WallpaperChooserDialogFragment;->addWallpapers(Landroid/content/res/Resources;Ljava/lang/String;I)V

    .line 230
    return-void
.end method

.method public static newInstance()Lcom/android/launcher2/WallpaperChooserDialogFragment;
    .locals 2

    .prologue
    .line 67
    new-instance v0, Lcom/android/launcher2/WallpaperChooserDialogFragment;

    invoke-direct {v0}, Lcom/android/launcher2/WallpaperChooserDialogFragment;-><init>()V

    .line 68
    .local v0, fragment:Lcom/android/launcher2/WallpaperChooserDialogFragment;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/launcher2/WallpaperChooserDialogFragment;->setCancelable(Z)V

    .line 69
    return-object v0
.end method

.method private selectWallpaper(I)V
    .locals 6
    .parameter "position"

    .prologue
    .line 184
    const-string v3, "WallpaperChooserDialogFragment"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "selectWallpaper: position = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", this = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    :try_start_0
    invoke-virtual {p0}, Lcom/android/launcher2/WallpaperChooserDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-string v4, "wallpaper"

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/WallpaperManager;

    .line 189
    .local v2, wpm:Landroid/app/WallpaperManager;
    iget-object v3, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mImages:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/app/WallpaperManager;->setResource(I)V

    .line 190
    invoke-virtual {p0}, Lcom/android/launcher2/WallpaperChooserDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 191
    .local v0, activity:Landroid/app/Activity;
    const/4 v3, -0x1

    invoke-virtual {v0, v3}, Landroid/app/Activity;->setResult(I)V

    .line 192
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 196
    .end local v0           #activity:Landroid/app/Activity;
    .end local v2           #wpm:Landroid/app/WallpaperManager;
    :goto_0
    return-void

    .line 193
    :catch_0
    move-exception v1

    .line 194
    .local v1, e:Ljava/io/IOException;
    const-string v3, "WallpaperChooserDialogFragment"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to set wallpaper: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 74
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 75
    if-eqz p1, :cond_0

    const-string v0, "com.android.launcher2.WallpaperChooserDialogFragment.EMBEDDED_KEY"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    const-string v0, "com.android.launcher2.WallpaperChooserDialogFragment.EMBEDDED_KEY"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mEmbedded:Z

    .line 81
    :goto_0
    const-string v0, "WallpaperChooserDialogFragment"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCreate: savedInstanceState = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mEmbedded = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mEmbedded:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    return-void

    .line 78
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/WallpaperChooserDialogFragment;->isInLayout()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mEmbedded:Z

    goto :goto_0
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 141
    const-string v0, "WallpaperChooserDialogFragment"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCreateDialog: savedInstanceState = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    invoke-direct {p0}, Lcom/android/launcher2/WallpaperChooserDialogFragment;->findWallpapers()V

    .line 145
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 7
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    const/4 v6, 0x0

    .line 152
    const-string v3, "WallpaperChooserDialogFragment"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onCreateView: mEmbedded = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mEmbedded:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", container = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    invoke-direct {p0}, Lcom/android/launcher2/WallpaperChooserDialogFragment;->findWallpapers()V

    .line 161
    iget-boolean v3, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mEmbedded:Z

    if-eqz v3, :cond_0

    .line 162
    const v3, 0x7f040017

    invoke-virtual {p1, v3, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 163
    .local v2, view:Landroid/view/View;
    iget-object v3, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mWallpaperDrawable:Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperDrawable;

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 165
    const v3, 0x7f070036

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Gallery;

    .line 166
    .local v0, gallery:Landroid/widget/Gallery;
    invoke-virtual {v0, v6}, Landroid/widget/Gallery;->setCallbackDuringFling(Z)V

    .line 167
    invoke-virtual {v0, p0}, Landroid/widget/Gallery;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 168
    new-instance v3, Lcom/android/launcher2/WallpaperChooserDialogFragment$ImageAdapter;

    invoke-virtual {p0}, Lcom/android/launcher2/WallpaperChooserDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, p0, v4}, Lcom/android/launcher2/WallpaperChooserDialogFragment$ImageAdapter;-><init>(Lcom/android/launcher2/WallpaperChooserDialogFragment;Landroid/app/Activity;)V

    invoke-virtual {v0, v3}, Landroid/widget/Gallery;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 170
    const v3, 0x7f070037

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 171
    .local v1, setButton:Landroid/view/View;
    new-instance v3, Lcom/android/launcher2/WallpaperChooserDialogFragment$1;

    invoke-direct {v3, p0, v0}, Lcom/android/launcher2/WallpaperChooserDialogFragment$1;-><init>(Lcom/android/launcher2/WallpaperChooserDialogFragment;Landroid/widget/Gallery;)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 179
    .end local v0           #gallery:Landroid/widget/Gallery;
    .end local v1           #setButton:Landroid/view/View;
    .end local v2           #view:Landroid/view/View;
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 112
    invoke-super {p0}, Landroid/app/DialogFragment;->onDestroy()V

    .line 114
    const-string v0, "WallpaperChooserDialogFragment"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDestroy: mLoader = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mLoader:Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    invoke-direct {p0}, Lcom/android/launcher2/WallpaperChooserDialogFragment;->cancelLoader()V

    .line 117
    return-void
.end method

.method public onDetach()V
    .locals 2

    .prologue
    .line 103
    invoke-super {p0}, Landroid/app/DialogFragment;->onDetach()V

    .line 105
    const-string v0, "WallpaperChooserDialogFragment"

    const-string v1, "onDetach."

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    invoke-direct {p0}, Lcom/android/launcher2/WallpaperChooserDialogFragment;->cancelLoader()V

    .line 108
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 4
    .parameter "dialog"

    .prologue
    .line 121
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 126
    invoke-virtual {p0}, Lcom/android/launcher2/WallpaperChooserDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 128
    .local v0, activity:Landroid/app/Activity;
    const-string v1, "WallpaperChooserDialogFragment"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onDismiss: activity = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", dialog = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    if-eqz v0, :cond_0

    .line 131
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 133
    :cond_0
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 201
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    invoke-direct {p0, p3}, Lcom/android/launcher2/WallpaperChooserDialogFragment;->selectWallpaper(I)V

    .line 202
    return-void
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 207
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mLoader:Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mLoader:Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;

    invoke-virtual {v0}, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask$Status;->FINISHED:Landroid/os/AsyncTask$Status;

    if-eq v0, v1, :cond_0

    .line 208
    iget-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mLoader:Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;

    invoke-virtual {v0}, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;->cancel()V

    .line 210
    :cond_0
    new-instance v0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;

    invoke-direct {v0, p0}, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;-><init>(Lcom/android/launcher2/WallpaperChooserDialogFragment;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Integer;

    const/4 v2, 0x0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;

    iput-object v0, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mLoader:Lcom/android/launcher2/WallpaperChooserDialogFragment$WallpaperLoader;

    .line 211
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 215
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3
    .parameter "outState"

    .prologue
    .line 88
    const-string v0, "com.android.launcher2.WallpaperChooserDialogFragment.EMBEDDED_KEY"

    iget-boolean v1, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mEmbedded:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 90
    const-string v0, "WallpaperChooserDialogFragment"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSaveInstanceState: outState = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mEmbedded = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/launcher2/WallpaperChooserDialogFragment;->mEmbedded:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    return-void
.end method
