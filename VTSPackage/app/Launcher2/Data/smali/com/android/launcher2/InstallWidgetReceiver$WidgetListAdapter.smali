.class public Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;
.super Ljava/lang/Object;
.source "InstallWidgetReceiver.java"

# interfaces
.implements Landroid/widget/ListAdapter;
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/InstallWidgetReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WidgetListAdapter"
.end annotation


# instance fields
.field private mActivities:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/launcher2/InstallWidgetReceiver$WidgetMimeTypeHandlerData;",
            ">;"
        }
    .end annotation
.end field

.field private mClipData:Landroid/content/ClipData;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mLauncher:Lcom/android/launcher2/Launcher;

.field private mMimeType:Ljava/lang/String;

.field private mTargetLayout:Lcom/android/launcher2/CellLayout;

.field private mTargetLayoutPos:[I

.field private mTargetLayoutScreen:I


# direct methods
.method public constructor <init>(Lcom/android/launcher2/Launcher;Ljava/lang/String;Landroid/content/ClipData;Ljava/util/List;Lcom/android/launcher2/CellLayout;I[I)V
    .locals 0
    .parameter "l"
    .parameter "mimeType"
    .parameter "data"
    .parameter
    .parameter "target"
    .parameter "targetScreen"
    .parameter "targetPos"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher2/Launcher;",
            "Ljava/lang/String;",
            "Landroid/content/ClipData;",
            "Ljava/util/List",
            "<",
            "Lcom/android/launcher2/InstallWidgetReceiver$WidgetMimeTypeHandlerData;",
            ">;",
            "Lcom/android/launcher2/CellLayout;",
            "I[I)V"
        }
    .end annotation

    .prologue
    .line 86
    .local p4, list:Ljava/util/List;,"Ljava/util/List<Lcom/android/launcher2/InstallWidgetReceiver$WidgetMimeTypeHandlerData;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-object p1, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mLauncher:Lcom/android/launcher2/Launcher;

    .line 88
    iput-object p2, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mMimeType:Ljava/lang/String;

    .line 89
    iput-object p3, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mClipData:Landroid/content/ClipData;

    .line 90
    iput-object p4, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mActivities:Ljava/util/List;

    .line 91
    iput-object p5, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mTargetLayout:Lcom/android/launcher2/CellLayout;

    .line 92
    iput p6, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mTargetLayoutScreen:I

    .line 93
    iput-object p7, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mTargetLayoutPos:[I

    .line 94
    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .locals 1

    .prologue
    .line 177
    const/4 v0, 0x0

    return v0
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mActivities:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "position"

    .prologue
    .line 111
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "position"

    .prologue
    .line 116
    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .parameter "position"

    .prologue
    .line 162
    const/4 v0, 0x0

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 15
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 126
    invoke-virtual/range {p3 .. p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 127
    .local v2, context:Landroid/content/Context;
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 130
    .local v6, packageManager:Landroid/content/pm/PackageManager;
    iget-object v11, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mInflater:Landroid/view/LayoutInflater;

    if-nez v11, :cond_0

    .line 131
    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v11

    iput-object v11, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 135
    :cond_0
    if-nez p2, :cond_1

    .line 136
    iget-object v11, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v12, 0x7f04000a

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v11, v12, v0, v13}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 140
    :cond_1
    iget-object v11, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mActivities:Ljava/util/List;

    move/from16 v0, p1

    invoke-interface {v11, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/launcher2/InstallWidgetReceiver$WidgetMimeTypeHandlerData;

    .line 141
    .local v4, data:Lcom/android/launcher2/InstallWidgetReceiver$WidgetMimeTypeHandlerData;
    iget-object v7, v4, Lcom/android/launcher2/InstallWidgetReceiver$WidgetMimeTypeHandlerData;->resolveInfo:Landroid/content/pm/ResolveInfo;

    .line 142
    .local v7, resolveInfo:Landroid/content/pm/ResolveInfo;
    iget-object v9, v4, Lcom/android/launcher2/InstallWidgetReceiver$WidgetMimeTypeHandlerData;->widgetInfo:Landroid/appwidget/AppWidgetProviderInfo;

    .line 145
    .local v9, widgetInfo:Landroid/appwidget/AppWidgetProviderInfo;
    invoke-virtual {v7, v6}, Landroid/content/pm/ResolveInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 146
    .local v3, d:Landroid/graphics/drawable/Drawable;
    const v11, 0x7f070013

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 147
    .local v5, i:Landroid/widget/ImageView;
    invoke-virtual {v5, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 150
    invoke-virtual {v7, v6}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v1

    .line 151
    .local v1, component:Ljava/lang/CharSequence;
    const/4 v11, 0x2

    new-array v10, v11, [I

    .line 152
    .local v10, widgetSpan:[I
    iget-object v11, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mTargetLayout:Lcom/android/launcher2/CellLayout;

    iget v12, v9, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    iget v13, v9, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    invoke-virtual {v11, v12, v13, v10}, Lcom/android/launcher2/CellLayout;->rectToCell(II[I)[I

    .line 153
    const v11, 0x7f070014

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 154
    .local v8, t:Landroid/widget/TextView;
    const v11, 0x7f0d0019

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v1, v12, v13

    const/4 v13, 0x1

    const/4 v14, 0x0

    aget v14, v10, v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x2

    const/4 v14, 0x1

    aget v14, v10, v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-virtual {v2, v11, v12}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 157
    return-object p2
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 167
    const/4 v0, 0x1

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    .prologue
    .line 121
    const/4 v0, 0x1

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mActivities:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public isEnabled(I)Z
    .locals 1
    .parameter "position"

    .prologue
    .line 182
    const/4 v0, 0x1

    return v0
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 9
    .parameter "dialog"
    .parameter "which"

    .prologue
    const/4 v5, 0x0

    .line 187
    iget-object v0, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mActivities:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetMimeTypeHandlerData;

    iget-object v8, v0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetMimeTypeHandlerData;->widgetInfo:Landroid/appwidget/AppWidgetProviderInfo;

    .line 189
    .local v8, widgetInfo:Landroid/appwidget/AppWidgetProviderInfo;
    new-instance v1, Lcom/android/launcher2/PendingAddWidgetInfo;

    iget-object v0, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mMimeType:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mClipData:Landroid/content/ClipData;

    invoke-direct {v1, v8, v0, v2}, Lcom/android/launcher2/PendingAddWidgetInfo;-><init>(Landroid/appwidget/AppWidgetProviderInfo;Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 191
    .local v1, createInfo:Lcom/android/launcher2/PendingAddWidgetInfo;
    iget-object v0, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mLauncher:Lcom/android/launcher2/Launcher;

    const-wide/16 v2, -0x64

    iget v4, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mTargetLayoutScreen:I

    iget-object v7, p0, Lcom/android/launcher2/InstallWidgetReceiver$WidgetListAdapter;->mTargetLayoutPos:[I

    move-object v6, v5

    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher2/Launcher;->addAppWidgetFromDrop(Lcom/android/launcher2/PendingAddWidgetInfo;JI[I[I[I)V

    .line 193
    return-void
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 0
    .parameter "observer"

    .prologue
    .line 98
    return-void
.end method

.method public unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 0
    .parameter "observer"

    .prologue
    .line 102
    return-void
.end method
