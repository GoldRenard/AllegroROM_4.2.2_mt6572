.class public Landroid/widget/RelativeLayout$LayoutParams;
.super Landroid/view/ViewGroup$MarginLayoutParams;
.source "RelativeLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/widget/RelativeLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# instance fields
.field public alignWithParent:Z
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "layout"
    .end annotation
.end field

.field private mBottom:I

.field private mEnd:I

.field private mInitialRules:[I

.field private mLeft:I

.field private mRight:I

.field private mRules:[I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "layout"
        indexMapping = {
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x2
                to = "above"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x4
                to = "alignBaseline"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x8
                to = "alignBottom"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x5
                to = "alignLeft"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0xc
                to = "alignParentBottom"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x9
                to = "alignParentLeft"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0xb
                to = "alignParentRight"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0xa
                to = "alignParentTop"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x7
                to = "alignRight"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x6
                to = "alignTop"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x3
                to = "below"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0xe
                to = "centerHorizontal"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0xd
                to = "center"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0xf
                to = "centerVertical"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x0
                to = "leftOf"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x1
                to = "rightOf"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x12
                to = "alignStart"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x13
                to = "alignEnd"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x14
                to = "alignParentStart"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x15
                to = "alignParentEnd"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x10
                to = "startOf"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x11
                to = "endOf"
            .end subannotation
        }
        mapping = {
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = -0x1
                to = "true"
            .end subannotation,
            .subannotation Landroid/view/ViewDebug$IntToString;
                from = 0x0
                to = "false/NO_ID"
            .end subannotation
        }
        resolveId = true
    .end annotation
.end field

.field private mRulesChanged:Z

.field private mStart:I

.field private mTop:I


# direct methods
.method public constructor <init>(II)V
    .locals 3
    .parameter "w"
    .parameter "h"

    .prologue
    const/16 v2, 0x16

    const/high16 v1, -0x8000

    .line 1282
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 1144
    new-array v0, v2, [I

    iput-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    .line 1173
    new-array v0, v2, [I

    iput-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mInitialRules:[I

    .line 1177
    iput v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mStart:I

    .line 1178
    iput v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mEnd:I

    .line 1180
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRulesChanged:Z

    .line 1283
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 12
    .parameter "c"
    .parameter "attrs"

    .prologue
    const/high16 v10, -0x8000

    const/16 v11, 0x16

    const/4 v8, -0x1

    const/4 v9, 0x0

    .line 1190
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 1144
    new-array v7, v11, [I

    iput-object v7, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    .line 1173
    new-array v7, v11, [I

    iput-object v7, p0, Landroid/widget/RelativeLayout$LayoutParams;->mInitialRules:[I

    .line 1177
    iput v10, p0, Landroid/widget/RelativeLayout$LayoutParams;->mStart:I

    .line 1178
    iput v10, p0, Landroid/widget/RelativeLayout$LayoutParams;->mEnd:I

    .line 1180
    iput-boolean v9, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRulesChanged:Z

    .line 1192
    sget-object v7, Lcom/android/internal/R$styleable;->RelativeLayout_Layout:[I

    invoke-virtual {p1, p2, v7}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 1195
    .local v1, a:Landroid/content/res/TypedArray;
    iget-object v6, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    .line 1196
    .local v6, rules:[I
    iget-object v4, p0, Landroid/widget/RelativeLayout$LayoutParams;->mInitialRules:[I

    .line 1198
    .local v4, initialRules:[I
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v0

    .line 1199
    .local v0, N:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v0, :cond_9

    .line 1200
    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v2

    .line 1201
    .local v2, attr:I
    packed-switch v2, :pswitch_data_0

    .line 1199
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1203
    :pswitch_0
    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    iput-boolean v7, p0, Landroid/widget/RelativeLayout$LayoutParams;->alignWithParent:Z

    goto :goto_1

    .line 1206
    :pswitch_1
    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v7

    aput v7, v6, v9

    goto :goto_1

    .line 1209
    :pswitch_2
    const/4 v7, 0x1

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    aput v10, v6, v7

    goto :goto_1

    .line 1212
    :pswitch_3
    const/4 v7, 0x2

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    aput v10, v6, v7

    goto :goto_1

    .line 1215
    :pswitch_4
    const/4 v7, 0x3

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    aput v10, v6, v7

    goto :goto_1

    .line 1218
    :pswitch_5
    const/4 v7, 0x4

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    aput v10, v6, v7

    goto :goto_1

    .line 1221
    :pswitch_6
    const/4 v7, 0x5

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    aput v10, v6, v7

    goto :goto_1

    .line 1224
    :pswitch_7
    const/4 v7, 0x6

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    aput v10, v6, v7

    goto :goto_1

    .line 1227
    :pswitch_8
    const/4 v7, 0x7

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    aput v10, v6, v7

    goto :goto_1

    .line 1230
    :pswitch_9
    const/16 v7, 0x8

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    aput v10, v6, v7

    goto :goto_1

    .line 1233
    :pswitch_a
    const/16 v10, 0x9

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    if-eqz v7, :cond_0

    move v7, v8

    :goto_2
    aput v7, v6, v10

    goto :goto_1

    :cond_0
    move v7, v9

    goto :goto_2

    .line 1236
    :pswitch_b
    const/16 v10, 0xa

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    if-eqz v7, :cond_1

    move v7, v8

    :goto_3
    aput v7, v6, v10

    goto :goto_1

    :cond_1
    move v7, v9

    goto :goto_3

    .line 1239
    :pswitch_c
    const/16 v10, 0xb

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    if-eqz v7, :cond_2

    move v7, v8

    :goto_4
    aput v7, v6, v10

    goto :goto_1

    :cond_2
    move v7, v9

    goto :goto_4

    .line 1242
    :pswitch_d
    const/16 v10, 0xc

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    if-eqz v7, :cond_3

    move v7, v8

    :goto_5
    aput v7, v6, v10

    goto/16 :goto_1

    :cond_3
    move v7, v9

    goto :goto_5

    .line 1245
    :pswitch_e
    const/16 v10, 0xd

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    if-eqz v7, :cond_4

    move v7, v8

    :goto_6
    aput v7, v6, v10

    goto/16 :goto_1

    :cond_4
    move v7, v9

    goto :goto_6

    .line 1248
    :pswitch_f
    const/16 v10, 0xe

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    if-eqz v7, :cond_5

    move v7, v8

    :goto_7
    aput v7, v6, v10

    goto/16 :goto_1

    :cond_5
    move v7, v9

    goto :goto_7

    .line 1251
    :pswitch_10
    const/16 v10, 0xf

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    if-eqz v7, :cond_6

    move v7, v8

    :goto_8
    aput v7, v6, v10

    goto/16 :goto_1

    :cond_6
    move v7, v9

    goto :goto_8

    .line 1254
    :pswitch_11
    const/16 v7, 0x10

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    aput v10, v6, v7

    goto/16 :goto_1

    .line 1257
    :pswitch_12
    const/16 v7, 0x11

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    aput v10, v6, v7

    goto/16 :goto_1

    .line 1260
    :pswitch_13
    const/16 v7, 0x12

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    aput v10, v6, v7

    goto/16 :goto_1

    .line 1263
    :pswitch_14
    const/16 v7, 0x13

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    aput v10, v6, v7

    goto/16 :goto_1

    .line 1266
    :pswitch_15
    const/16 v10, 0x14

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    if-eqz v7, :cond_7

    move v7, v8

    :goto_9
    aput v7, v6, v10

    goto/16 :goto_1

    :cond_7
    move v7, v9

    goto :goto_9

    .line 1269
    :pswitch_16
    const/16 v10, 0x15

    invoke-virtual {v1, v2, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    if-eqz v7, :cond_8

    move v7, v8

    :goto_a
    aput v7, v6, v10

    goto/16 :goto_1

    :cond_8
    move v7, v9

    goto :goto_a

    .line 1274
    .end local v2           #attr:I
    :cond_9
    const/4 v5, 0x0

    .local v5, n:I
    :goto_b
    if-ge v5, v11, :cond_a

    .line 1275
    aget v7, v6, v5

    aput v7, v4, v5

    .line 1274
    add-int/lit8 v5, v5, 0x1

    goto :goto_b

    .line 1278
    :cond_a
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 1279
    return-void

    .line 1201
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_0
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
    .end packed-switch
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .locals 3
    .parameter "source"

    .prologue
    const/16 v2, 0x16

    const/high16 v1, -0x8000

    .line 1289
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1144
    new-array v0, v2, [I

    iput-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    .line 1173
    new-array v0, v2, [I

    iput-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mInitialRules:[I

    .line 1177
    iput v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mStart:I

    .line 1178
    iput v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mEnd:I

    .line 1180
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRulesChanged:Z

    .line 1290
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$MarginLayoutParams;)V
    .locals 3
    .parameter "source"

    .prologue
    const/16 v2, 0x16

    const/high16 v1, -0x8000

    .line 1296
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 1144
    new-array v0, v2, [I

    iput-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    .line 1173
    new-array v0, v2, [I

    iput-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mInitialRules:[I

    .line 1177
    iput v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mStart:I

    .line 1178
    iput v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mEnd:I

    .line 1180
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRulesChanged:Z

    .line 1297
    return-void
.end method

.method static synthetic access$100(Landroid/widget/RelativeLayout$LayoutParams;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 1143
    iget v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRight:I

    return v0
.end method

.method static synthetic access$102(Landroid/widget/RelativeLayout$LayoutParams;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1143
    iput p1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRight:I

    return p1
.end method

.method static synthetic access$112(Landroid/widget/RelativeLayout$LayoutParams;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1143
    iget v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRight:I

    add-int/2addr v0, p1

    iput v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRight:I

    return v0
.end method

.method static synthetic access$200(Landroid/widget/RelativeLayout$LayoutParams;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 1143
    iget v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I

    return v0
.end method

.method static synthetic access$202(Landroid/widget/RelativeLayout$LayoutParams;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1143
    iput p1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I

    return p1
.end method

.method static synthetic access$212(Landroid/widget/RelativeLayout$LayoutParams;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1143
    iget v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I

    add-int/2addr v0, p1

    iput v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I

    return v0
.end method

.method static synthetic access$300(Landroid/widget/RelativeLayout$LayoutParams;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 1143
    iget v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I

    return v0
.end method

.method static synthetic access$302(Landroid/widget/RelativeLayout$LayoutParams;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1143
    iput p1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I

    return p1
.end method

.method static synthetic access$312(Landroid/widget/RelativeLayout$LayoutParams;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1143
    iget v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I

    add-int/2addr v0, p1

    iput v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I

    return v0
.end method

.method static synthetic access$400(Landroid/widget/RelativeLayout$LayoutParams;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 1143
    iget v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mTop:I

    return v0
.end method

.method static synthetic access$402(Landroid/widget/RelativeLayout$LayoutParams;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1143
    iput p1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mTop:I

    return p1
.end method

.method static synthetic access$412(Landroid/widget/RelativeLayout$LayoutParams;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1143
    iget v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mTop:I

    add-int/2addr v0, p1

    iput v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mTop:I

    return v0
.end method

.method static synthetic access$700(Landroid/widget/RelativeLayout$LayoutParams;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 1143
    iget-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    return-object v0
.end method

.method private hasRelativeRules()Z
    .locals 2

    .prologue
    .line 1359
    iget-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mInitialRules:[I

    const/16 v1, 0x10

    aget v0, v0, v1

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mInitialRules:[I

    const/16 v1, 0x11

    aget v0, v0, v1

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mInitialRules:[I

    const/16 v1, 0x12

    aget v0, v0, v1

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mInitialRules:[I

    const/16 v1, 0x13

    aget v0, v0, v1

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mInitialRules:[I

    const/16 v1, 0x14

    aget v0, v0, v1

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mInitialRules:[I

    const/16 v1, 0x15

    aget v0, v0, v1

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private resolveRules(I)V
    .locals 11
    .parameter "layoutDirection"

    .prologue
    const/16 v7, 0x9

    const/4 v5, 0x7

    const/4 v6, 0x5

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1365
    if-ne p1, v2, :cond_0

    move v0, v2

    .line 1367
    .local v0, isLayoutRtl:Z
    :goto_0
    const/4 v1, 0x0

    .local v1, n:I
    :goto_1
    const/16 v4, 0x16

    if-ge v1, v4, :cond_1

    .line 1368
    iget-object v4, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    iget-object v8, p0, Landroid/widget/RelativeLayout$LayoutParams;->mInitialRules:[I

    aget v8, v8, v1

    aput v8, v4, v1

    .line 1367
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .end local v0           #isLayoutRtl:Z
    .end local v1           #n:I
    :cond_0
    move v0, v3

    .line 1365
    goto :goto_0

    .line 1371
    .restart local v0       #isLayoutRtl:Z
    .restart local v1       #n:I
    :cond_1
    iget-object v4, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    const/16 v8, 0x12

    aget v4, v4, v8

    if-eqz v4, :cond_2

    .line 1372
    iget-object v8, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    if-eqz v0, :cond_9

    move v4, v5

    :goto_2
    iget-object v9, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    const/16 v10, 0x12

    aget v9, v9, v10

    aput v9, v8, v4

    .line 1374
    :cond_2
    iget-object v4, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    const/16 v8, 0x13

    aget v4, v4, v8

    if-eqz v4, :cond_3

    .line 1375
    iget-object v4, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    if-eqz v0, :cond_a

    :goto_3
    iget-object v5, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    const/16 v8, 0x13

    aget v5, v5, v8

    aput v5, v4, v6

    .line 1377
    :cond_3
    iget-object v4, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    const/16 v5, 0x10

    aget v4, v4, v5

    if-eqz v4, :cond_4

    .line 1378
    iget-object v5, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    if-eqz v0, :cond_b

    move v4, v2

    :goto_4
    iget-object v6, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    const/16 v8, 0x10

    aget v6, v6, v8

    aput v6, v5, v4

    .line 1380
    :cond_4
    iget-object v4, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    const/16 v5, 0x11

    aget v4, v4, v5

    if-eqz v4, :cond_6

    .line 1381
    iget-object v4, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    if-eqz v0, :cond_5

    move v2, v3

    :cond_5
    iget-object v5, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    const/16 v6, 0x11

    aget v5, v5, v6

    aput v5, v4, v2

    .line 1383
    :cond_6
    iget-object v2, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    const/16 v4, 0x14

    aget v2, v2, v4

    if-eqz v2, :cond_7

    .line 1384
    iget-object v4, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    if-eqz v0, :cond_c

    const/16 v2, 0xb

    :goto_5
    iget-object v5, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    const/16 v6, 0x14

    aget v5, v5, v6

    aput v5, v4, v2

    .line 1386
    :cond_7
    iget-object v2, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    const/16 v4, 0x15

    aget v2, v2, v4

    if-eqz v2, :cond_8

    .line 1387
    iget-object v2, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    if-eqz v0, :cond_d

    :goto_6
    iget-object v4, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    const/16 v5, 0x15

    aget v4, v4, v5

    aput v4, v2, v7

    .line 1389
    :cond_8
    iput-boolean v3, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRulesChanged:Z

    .line 1390
    return-void

    :cond_9
    move v4, v6

    .line 1372
    goto :goto_2

    :cond_a
    move v6, v5

    .line 1375
    goto :goto_3

    :cond_b
    move v4, v3

    .line 1378
    goto :goto_4

    :cond_c
    move v2, v7

    .line 1384
    goto :goto_5

    .line 1387
    :cond_d
    const/16 v7, 0xb

    goto :goto_6
.end method


# virtual methods
.method public addRule(I)V
    .locals 2
    .parameter "verb"

    .prologue
    const/4 v1, -0x1

    .line 1318
    iget-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    aput v1, v0, p1

    .line 1319
    iget-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mInitialRules:[I

    aput v1, v0, p1

    .line 1320
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRulesChanged:Z

    .line 1321
    return-void
.end method

.method public addRule(II)V
    .locals 1
    .parameter "verb"
    .parameter "anchor"

    .prologue
    .line 1338
    iget-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    aput p2, v0, p1

    .line 1339
    iget-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mInitialRules:[I

    aput p2, v0, p1

    .line 1340
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRulesChanged:Z

    .line 1341
    return-void
.end method

.method public debug(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "output"

    .prologue
    .line 1301
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "ViewGroup.LayoutParams={ width="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v1}, Landroid/widget/RelativeLayout$LayoutParams;->sizeToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v1}, Landroid/widget/RelativeLayout$LayoutParams;->sizeToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRules()[I
    .locals 1

    .prologue
    .line 1426
    iget-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    return-object v0
.end method

.method public getRules(I)[I
    .locals 1
    .parameter "layoutDirection"

    .prologue
    .line 1407
    invoke-direct {p0}, Landroid/widget/RelativeLayout$LayoutParams;->hasRelativeRules()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRulesChanged:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/widget/RelativeLayout$LayoutParams;->getLayoutDirection()I

    move-result v0

    if-eq p1, v0, :cond_1

    .line 1409
    :cond_0
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout$LayoutParams;->resolveRules(I)V

    .line 1410
    invoke-virtual {p0}, Landroid/widget/RelativeLayout$LayoutParams;->getLayoutDirection()I

    move-result v0

    if-eq p1, v0, :cond_1

    .line 1411
    invoke-virtual {p0, p1}, Landroid/widget/RelativeLayout$LayoutParams;->setLayoutDirection(I)V

    .line 1414
    :cond_1
    iget-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    return-object v0
.end method

.method public removeRule(I)V
    .locals 2
    .parameter "verb"

    .prologue
    const/4 v1, 0x0

    .line 1353
    iget-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRules:[I

    aput v1, v0, p1

    .line 1354
    iget-object v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mInitialRules:[I

    aput v1, v0, p1

    .line 1355
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRulesChanged:Z

    .line 1356
    return-void
.end method

.method public resolveLayoutDirection(I)V
    .locals 3
    .parameter "layoutDirection"

    .prologue
    const/high16 v2, -0x8000

    .line 1431
    invoke-virtual {p0}, Landroid/widget/RelativeLayout$LayoutParams;->isLayoutRtl()Z

    move-result v0

    .line 1432
    .local v0, isLayoutRtl:Z
    if-eqz v0, :cond_3

    .line 1433
    iget v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mStart:I

    if-eq v1, v2, :cond_0

    iget v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mStart:I

    iput v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRight:I

    .line 1434
    :cond_0
    iget v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mEnd:I

    if-eq v1, v2, :cond_1

    iget v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mEnd:I

    iput v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I

    .line 1440
    :cond_1
    :goto_0
    invoke-direct {p0}, Landroid/widget/RelativeLayout$LayoutParams;->hasRelativeRules()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Landroid/widget/RelativeLayout$LayoutParams;->getLayoutDirection()I

    move-result v1

    if-eq p1, v1, :cond_2

    .line 1441
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout$LayoutParams;->resolveRules(I)V

    .line 1444
    :cond_2
    invoke-super {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->resolveLayoutDirection(I)V

    .line 1445
    return-void

    .line 1436
    :cond_3
    iget v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mStart:I

    if-eq v1, v2, :cond_4

    iget v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mStart:I

    iput v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I

    .line 1437
    :cond_4
    iget v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mEnd:I

    if-eq v1, v2, :cond_1

    iget v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mEnd:I

    iput v1, p0, Landroid/widget/RelativeLayout$LayoutParams;->mRight:I

    goto :goto_0
.end method
