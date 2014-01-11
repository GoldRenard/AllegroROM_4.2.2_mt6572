.class Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;
.super Landroid/widget/ArrayAdapter;
.source "HiddenAppsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AppsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Landroid/content/pm/ResolveInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private final mInfaltor:Landroid/view/LayoutInflater;

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;


# direct methods
.method public constructor <init>(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;Landroid/content/Context;I)V
    .locals 1
    .parameter
    .parameter "context"
    .parameter "textViewResourceId"

    .prologue
    .line 188
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;->this$0:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;

    .line 189
    invoke-direct {p0, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 191
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;->mInfaltor:Landroid/view/LayoutInflater;

    .line 193
    return-void
.end method


# virtual methods
.method public getItemId(I)J
    .locals 2
    .parameter "id"

    .prologue
    .line 197
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 202
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    .line 204
    .local v1, info:Landroid/content/pm/ResolveInfo;
    if-nez p2, :cond_0

    .line 205
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;->mInfaltor:Landroid/view/LayoutInflater;

    const v5, 0x7f040011

    const/4 v6, 0x0

    invoke-virtual {v4, v5, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 208
    :cond_0
    move-object v2, p2

    .line 210
    .local v2, item:Landroid/view/View;
    const v4, 0x7f070027

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 211
    .local v0, icon:Landroid/widget/ImageView;
    const v4, 0x7f070028

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 213
    .local v3, title:Landroid/widget/TextView;
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;->this$0:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;

    #getter for: Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static {v4}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->access$300(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;)Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/content/pm/ResolveInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 214
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;->this$0:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;

    #getter for: Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static {v4}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->access$300(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;)Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 216
    iget-object v4, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v4, v4, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 218
    new-instance v4, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter$1;

    invoke-direct {v4, p0, p1, v2}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter$1;-><init>(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;ILandroid/view/View;)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 226
    return-object p2
.end method

.method public hasStableIds()Z
    .locals 1

    .prologue
    .line 231
    const/4 v0, 0x1

    return v0
.end method
