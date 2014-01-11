.class Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter;
.super Landroid/widget/ArrayAdapter;
.source "Preferences.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/preference/Preferences;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HeaderAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter$HeaderViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Landroid/preference/PreferenceActivity$Header;",
        ">;"
    }
.end annotation


# static fields
.field private static final HEADER_TYPE_CATEGORY:I = 0x1

.field private static final HEADER_TYPE_COUNT:I = 0x2

.field private static final HEADER_TYPE_NORMAL:I


# instance fields
.field private mInflater:Landroid/view/LayoutInflater;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 1
    .parameter "context"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Landroid/preference/PreferenceActivity$Header;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 221
    .local p2, objects:Ljava/util/List;,"Ljava/util/List<Landroid/preference/PreferenceActivity$Header;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 223
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 224
    return-void
.end method

.method static getHeaderType(Landroid/preference/PreferenceActivity$Header;)I
    .locals 4
    .parameter "header"

    .prologue
    .line 187
    iget-wide v0, p0, Landroid/preference/PreferenceActivity$Header;->id:J

    const-wide/32 v2, 0x7f07004b

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 188
    const/4 v0, 0x1

    .line 190
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .locals 1

    .prologue
    .line 202
    const/4 v0, 0x0

    return v0
.end method

.method public getItemViewType(I)I
    .locals 2
    .parameter "position"

    .prologue
    .line 196
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity$Header;

    .line 197
    .local v0, header:Landroid/preference/PreferenceActivity$Header;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter;->getHeaderType(Landroid/preference/PreferenceActivity$Header;)I

    move-result v1

    return v1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 229
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity$Header;

    .line 230
    .local v0, header:Landroid/preference/PreferenceActivity$Header;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter;->getHeaderType(Landroid/preference/PreferenceActivity$Header;)I

    move-result v1

    .line 231
    .local v1, headerType:I
    const/4 v4, 0x0

    .line 233
    .local v4, view:Landroid/view/View;
    if-nez p2, :cond_0

    .line 234
    new-instance v2, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter$HeaderViewHolder;

    invoke-direct {v2, v8}, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter$HeaderViewHolder;-><init>(Lcom/cyanogenmod/trebuchet/preference/Preferences$1;)V

    .line 235
    .local v2, holder:Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter$HeaderViewHolder;
    packed-switch v1, :pswitch_data_0

    .line 253
    :goto_0
    invoke-virtual {v4, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 260
    :goto_1
    packed-switch v1, :pswitch_data_1

    .line 278
    :goto_2
    return-object v4

    .line 237
    :pswitch_0
    new-instance v4, Landroid/widget/TextView;

    .end local v4           #view:Landroid/view/View;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter;->getContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x1010208

    invoke-direct {v4, v5, v8, v6}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .restart local v4       #view:Landroid/view/View;
    move-object v5, v4

    .line 239
    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v2, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter$HeaderViewHolder;->title:Landroid/widget/TextView;

    goto :goto_0

    .line 243
    :pswitch_1
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v6, 0x7f040018

    invoke-virtual {v5, v6, p3, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 246
    const v5, 0x7f070027

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, v2, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter$HeaderViewHolder;->icon:Landroid/widget/ImageView;

    .line 247
    const v5, 0x1020016

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v2, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter$HeaderViewHolder;->title:Landroid/widget/TextView;

    .line 249
    const v5, 0x1020010

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v2, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter$HeaderViewHolder;->summary:Landroid/widget/TextView;

    goto :goto_0

    .line 255
    .end local v2           #holder:Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter$HeaderViewHolder;
    :cond_0
    move-object v4, p2

    .line 256
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter$HeaderViewHolder;

    .restart local v2       #holder:Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter$HeaderViewHolder;
    goto :goto_1

    .line 262
    :pswitch_2
    iget-object v5, v2, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter$HeaderViewHolder;->title:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/preference/PreferenceActivity$Header;->getTitle(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 266
    :pswitch_3
    iget-object v5, v2, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter$HeaderViewHolder;->icon:Landroid/widget/ImageView;

    iget v6, v0, Landroid/preference/PreferenceActivity$Header;->iconRes:I

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 267
    iget-object v5, v2, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter$HeaderViewHolder;->title:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/preference/PreferenceActivity$Header;->getTitle(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 268
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/preference/PreferenceActivity$Header;->getSummary(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v3

    .line 269
    .local v3, summary:Ljava/lang/CharSequence;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 270
    iget-object v5, v2, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter$HeaderViewHolder;->summary:Landroid/widget/TextView;

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 271
    iget-object v5, v2, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter$HeaderViewHolder;->summary:Landroid/widget/TextView;

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 273
    :cond_1
    iget-object v5, v2, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter$HeaderViewHolder;->summary:Landroid/widget/TextView;

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_2

    .line 235
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 260
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 212
    const/4 v0, 0x2

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    .prologue
    .line 217
    const/4 v0, 0x1

    return v0
.end method

.method public isEnabled(I)Z
    .locals 2
    .parameter "position"

    .prologue
    const/4 v0, 0x1

    .line 207
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/preference/Preferences$HeaderAdapter;->getItemViewType(I)I

    move-result v1

    if-eq v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
