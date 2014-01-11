.class public Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;
.super Ljava/lang/Object;
.source "ImportContactsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/ImportContactsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NamePhoneTypePair"
.end annotation


# instance fields
.field public mName:Ljava/lang/String;

.field public mPhoneType:I

.field public mPhoneTypeSuffix:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 5
    .parameter "nameWithPhoneType"

    .prologue
    const/4 v4, 0x7

    .line 290
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 293
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 294
    .local v1, nameLen:I
    add-int/lit8 v2, v1, -0x2

    if-ltz v2, :cond_4

    add-int/lit8 v2, v1, -0x2

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2f

    if-ne v2, v3, :cond_4

    .line 295
    add-int/lit8 v2, v1, -0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v0

    .line 296
    .local v0, c:C
    add-int/lit8 v2, v1, -0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;->mPhoneTypeSuffix:Ljava/lang/String;

    .line 297
    const/16 v2, 0x57

    if-ne v0, v2, :cond_0

    .line 298
    const/4 v2, 0x3

    iput v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;->mPhoneType:I

    .line 306
    :goto_0
    const/4 v2, 0x0

    add-int/lit8 v3, v1, -0x2

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;->mName:Ljava/lang/String;

    .line 312
    .end local v0           #c:C
    :goto_1
    return-void

    .line 299
    .restart local v0       #c:C
    :cond_0
    const/16 v2, 0x4d

    if-eq v0, v2, :cond_1

    const/16 v2, 0x4f

    if-ne v0, v2, :cond_2

    .line 300
    :cond_1
    const/4 v2, 0x2

    iput v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;->mPhoneType:I

    goto :goto_0

    .line 301
    :cond_2
    const/16 v2, 0x48

    if-ne v0, v2, :cond_3

    .line 302
    const/4 v2, 0x1

    iput v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;->mPhoneType:I

    goto :goto_0

    .line 304
    :cond_3
    iput v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;->mPhoneType:I

    goto :goto_0

    .line 308
    .end local v0           #c:C
    :cond_4
    const-string v2, ""

    iput-object v2, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;->mPhoneTypeSuffix:Ljava/lang/String;

    .line 309
    iput v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;->mPhoneType:I

    .line 310
    iput-object p1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;->mName:Ljava/lang/String;

    goto :goto_1
.end method
