.class public abstract Lcom/google/common/base/CharMatcher;
.super Ljava/lang/Object;
.source "CharMatcher.java"

# interfaces
.implements Lcom/google/common/base/Predicate;


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/base/CharMatcher$LookupTable;,
        Lcom/google/common/base/CharMatcher$Or;,
        Lcom/google/common/base/CharMatcher$And;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Predicate",
        "<",
        "Ljava/lang/Character;",
        ">;"
    }
.end annotation


# static fields
.field public static final ANY:Lcom/google/common/base/CharMatcher; = null

.field public static final ASCII:Lcom/google/common/base/CharMatcher; = null

.field public static final BREAKING_WHITESPACE:Lcom/google/common/base/CharMatcher; = null

.field private static final BREAKING_WHITESPACE_CHARS:Ljava/lang/String; = "\t\n\u000b\u000c\r \u0085\u1680\u2028\u2029\u205f\u3000"

.field public static final DIGIT:Lcom/google/common/base/CharMatcher; = null

.field public static final INVISIBLE:Lcom/google/common/base/CharMatcher; = null

.field public static final JAVA_DIGIT:Lcom/google/common/base/CharMatcher; = null

.field public static final JAVA_ISO_CONTROL:Lcom/google/common/base/CharMatcher; = null

.field public static final JAVA_LETTER:Lcom/google/common/base/CharMatcher; = null

.field public static final JAVA_LETTER_OR_DIGIT:Lcom/google/common/base/CharMatcher; = null

.field public static final JAVA_LOWER_CASE:Lcom/google/common/base/CharMatcher; = null

.field public static final JAVA_UPPER_CASE:Lcom/google/common/base/CharMatcher; = null

.field public static final NONE:Lcom/google/common/base/CharMatcher; = null

.field private static final NON_BREAKING_WHITESPACE_CHARS:Ljava/lang/String; = "\u00a0\u180e\u202f"

.field public static final SINGLE_WIDTH:Lcom/google/common/base/CharMatcher;

.field public static final WHITESPACE:Lcom/google/common/base/CharMatcher;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .prologue
    const/16 v12, 0x200a

    const/16 v11, 0x600

    const/16 v10, 0x2000

    const/16 v8, 0x7f

    const/4 v9, 0x0

    .line 75
    const-string v6, "\t\n\u000b\u000c\r \u0085\u1680\u2028\u2029\u205f\u3000\u00a0\u180e\u202f"

    invoke-static {v6}, Lcom/google/common/base/CharMatcher;->anyOf(Ljava/lang/CharSequence;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    invoke-static {v10, v12}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/common/base/CharMatcher;->precomputed()Lcom/google/common/base/CharMatcher;

    move-result-object v6

    sput-object v6, Lcom/google/common/base/CharMatcher;->WHITESPACE:Lcom/google/common/base/CharMatcher;

    .line 87
    const-string v6, "\t\n\u000b\u000c\r \u0085\u1680\u2028\u2029\u205f\u3000"

    invoke-static {v6}, Lcom/google/common/base/CharMatcher;->anyOf(Ljava/lang/CharSequence;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0x2006

    invoke-static {v10, v7}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0x2008

    invoke-static {v7, v12}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/common/base/CharMatcher;->precomputed()Lcom/google/common/base/CharMatcher;

    move-result-object v6

    sput-object v6, Lcom/google/common/base/CharMatcher;->BREAKING_WHITESPACE:Lcom/google/common/base/CharMatcher;

    .line 96
    invoke-static {v9, v8}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    sput-object v6, Lcom/google/common/base/CharMatcher;->ASCII:Lcom/google/common/base/CharMatcher;

    .line 105
    const/16 v6, 0x30

    const/16 v7, 0x39

    invoke-static {v6, v7}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v2

    .line 106
    .local v2, digit:Lcom/google/common/base/CharMatcher;
    const-string v5, "\u0660\u06f0\u07c0\u0966\u09e6\u0a66\u0ae6\u0b66\u0be6\u0c66\u0ce6\u0d66\u0e50\u0ed0\u0f20\u1040\u1090\u17e0\u1810\u1946\u19d0\u1b50\u1bb0\u1c40\u1c50\ua620\ua8d0\ua900\uaa50\uff10"

    .line 110
    .local v5, zeroes:Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .local v0, arr$:[C
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-char v1, v0, v3

    .line 111
    .local v1, base:C
    add-int/lit8 v6, v1, 0x9

    int-to-char v6, v6

    invoke-static {v1, v6}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v2

    .line 110
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 113
    .end local v1           #base:C
    :cond_0
    invoke-virtual {v2}, Lcom/google/common/base/CharMatcher;->precomputed()Lcom/google/common/base/CharMatcher;

    move-result-object v6

    sput-object v6, Lcom/google/common/base/CharMatcher;->DIGIT:Lcom/google/common/base/CharMatcher;

    .line 120
    new-instance v6, Lcom/google/common/base/CharMatcher$1;

    invoke-direct {v6}, Lcom/google/common/base/CharMatcher$1;-><init>()V

    sput-object v6, Lcom/google/common/base/CharMatcher;->JAVA_DIGIT:Lcom/google/common/base/CharMatcher;

    .line 131
    new-instance v6, Lcom/google/common/base/CharMatcher$2;

    invoke-direct {v6}, Lcom/google/common/base/CharMatcher$2;-><init>()V

    sput-object v6, Lcom/google/common/base/CharMatcher;->JAVA_LETTER:Lcom/google/common/base/CharMatcher;

    .line 141
    new-instance v6, Lcom/google/common/base/CharMatcher$3;

    invoke-direct {v6}, Lcom/google/common/base/CharMatcher$3;-><init>()V

    sput-object v6, Lcom/google/common/base/CharMatcher;->JAVA_LETTER_OR_DIGIT:Lcom/google/common/base/CharMatcher;

    .line 151
    new-instance v6, Lcom/google/common/base/CharMatcher$4;

    invoke-direct {v6}, Lcom/google/common/base/CharMatcher$4;-><init>()V

    sput-object v6, Lcom/google/common/base/CharMatcher;->JAVA_UPPER_CASE:Lcom/google/common/base/CharMatcher;

    .line 161
    new-instance v6, Lcom/google/common/base/CharMatcher$5;

    invoke-direct {v6}, Lcom/google/common/base/CharMatcher$5;-><init>()V

    sput-object v6, Lcom/google/common/base/CharMatcher;->JAVA_LOWER_CASE:Lcom/google/common/base/CharMatcher;

    .line 171
    const/16 v6, 0x1f

    invoke-static {v9, v6}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0x9f

    invoke-static {v8, v7}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    sput-object v6, Lcom/google/common/base/CharMatcher;->JAVA_ISO_CONTROL:Lcom/google/common/base/CharMatcher;

    .line 179
    const/16 v6, 0x20

    invoke-static {v9, v6}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0xa0

    invoke-static {v8, v7}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0xad

    invoke-static {v7}, Lcom/google/common/base/CharMatcher;->is(C)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0x603

    invoke-static {v11, v7}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const-string v7, "\u06dd\u070f\u1680\u17b4\u17b5\u180e"

    invoke-static {v7}, Lcom/google/common/base/CharMatcher;->anyOf(Ljava/lang/CharSequence;)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0x200f

    invoke-static {v10, v7}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0x2028

    const/16 v8, 0x202f

    invoke-static {v7, v8}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0x205f

    const/16 v8, 0x2064

    invoke-static {v7, v8}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0x206a

    const/16 v8, 0x206f

    invoke-static {v7, v8}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0x3000

    invoke-static {v7}, Lcom/google/common/base/CharMatcher;->is(C)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const v7, 0xd800

    const v8, 0xf8ff

    invoke-static {v7, v8}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const-string v7, "\ufeff\ufff9\ufffa\ufffb"

    invoke-static {v7}, Lcom/google/common/base/CharMatcher;->anyOf(Ljava/lang/CharSequence;)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/common/base/CharMatcher;->precomputed()Lcom/google/common/base/CharMatcher;

    move-result-object v6

    sput-object v6, Lcom/google/common/base/CharMatcher;->INVISIBLE:Lcom/google/common/base/CharMatcher;

    .line 201
    const/16 v6, 0x4f9

    invoke-static {v9, v6}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0x5be

    invoke-static {v7}, Lcom/google/common/base/CharMatcher;->is(C)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0x5d0

    const/16 v8, 0x5ea

    invoke-static {v7, v8}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0x5f3

    invoke-static {v7}, Lcom/google/common/base/CharMatcher;->is(C)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0x5f4

    invoke-static {v7}, Lcom/google/common/base/CharMatcher;->is(C)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0x6ff

    invoke-static {v11, v7}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0x750

    const/16 v8, 0x77f

    invoke-static {v7, v8}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0xe00

    const/16 v8, 0xe7f

    invoke-static {v7, v8}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0x1e00

    const/16 v8, 0x20af

    invoke-static {v7, v8}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const/16 v7, 0x2100

    const/16 v8, 0x213a

    invoke-static {v7, v8}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const v7, 0xfb50

    const v8, 0xfdff

    invoke-static {v7, v8}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const v7, 0xfe70

    const v8, 0xfeff

    invoke-static {v7, v8}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    const v7, 0xff61

    const v8, 0xffdc

    invoke-static {v7, v8}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/base/CharMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/common/base/CharMatcher;->precomputed()Lcom/google/common/base/CharMatcher;

    move-result-object v6

    sput-object v6, Lcom/google/common/base/CharMatcher;->SINGLE_WIDTH:Lcom/google/common/base/CharMatcher;

    .line 217
    new-instance v6, Lcom/google/common/base/CharMatcher$6;

    invoke-direct {v6}, Lcom/google/common/base/CharMatcher$6;-><init>()V

    sput-object v6, Lcom/google/common/base/CharMatcher;->ANY:Lcom/google/common/base/CharMatcher;

    .line 297
    new-instance v6, Lcom/google/common/base/CharMatcher$7;

    invoke-direct {v6}, Lcom/google/common/base/CharMatcher$7;-><init>()V

    sput-object v6, Lcom/google/common/base/CharMatcher;->NONE:Lcom/google/common/base/CharMatcher;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 544
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static anyOf(Ljava/lang/CharSequence;)Lcom/google/common/base/CharMatcher;
    .locals 5
    .parameter "sequence"

    .prologue
    const/4 v4, 0x0

    .line 441
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 465
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 466
    .local v0, chars:[C
    invoke-static {v0}, Ljava/util/Arrays;->sort([C)V

    .line 468
    new-instance v3, Lcom/google/common/base/CharMatcher$11;

    invoke-direct {v3, v0}, Lcom/google/common/base/CharMatcher$11;-><init>([C)V

    .end local v0           #chars:[C
    :goto_0
    return-object v3

    .line 443
    :pswitch_0
    sget-object v3, Lcom/google/common/base/CharMatcher;->NONE:Lcom/google/common/base/CharMatcher;

    goto :goto_0

    .line 445
    :pswitch_1
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lcom/google/common/base/CharMatcher;->is(C)Lcom/google/common/base/CharMatcher;

    move-result-object v3

    goto :goto_0

    .line 447
    :pswitch_2
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 448
    .local v1, match1:C
    const/4 v3, 0x1

    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 449
    .local v2, match2:C
    new-instance v3, Lcom/google/common/base/CharMatcher$10;

    invoke-direct {v3, v1, v2}, Lcom/google/common/base/CharMatcher$10;-><init>(CC)V

    goto :goto_0

    .line 441
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static forPredicate(Lcom/google/common/base/Predicate;)Lcom/google/common/base/CharMatcher;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/base/Predicate",
            "<-",
            "Ljava/lang/Character;",
            ">;)",
            "Lcom/google/common/base/CharMatcher;"
        }
    .end annotation

    .prologue
    .line 524
    .local p0, predicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<-Ljava/lang/Character;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 525
    instance-of v0, p0, Lcom/google/common/base/CharMatcher;

    if-eqz v0, :cond_0

    .line 526
    check-cast p0, Lcom/google/common/base/CharMatcher;

    .line 528
    .end local p0           #predicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<-Ljava/lang/Character;>;"
    :goto_0
    return-object p0

    .restart local p0       #predicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<-Ljava/lang/Character;>;"
    :cond_0
    new-instance v0, Lcom/google/common/base/CharMatcher$13;

    invoke-direct {v0, p0}, Lcom/google/common/base/CharMatcher$13;-><init>(Lcom/google/common/base/Predicate;)V

    move-object p0, v0

    goto :goto_0
.end method

.method public static inRange(CC)Lcom/google/common/base/CharMatcher;
    .locals 1
    .parameter "startInclusive"
    .parameter "endInclusive"

    .prologue
    .line 497
    if-lt p1, p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 498
    new-instance v0, Lcom/google/common/base/CharMatcher$12;

    invoke-direct {v0, p0, p1}, Lcom/google/common/base/CharMatcher$12;-><init>(CC)V

    return-object v0

    .line 497
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static is(C)Lcom/google/common/base/CharMatcher;
    .locals 1
    .parameter "match"

    .prologue
    .line 380
    new-instance v0, Lcom/google/common/base/CharMatcher$8;

    invoke-direct {v0, p0}, Lcom/google/common/base/CharMatcher$8;-><init>(C)V

    return-object v0
.end method

.method public static isNot(C)Lcom/google/common/base/CharMatcher;
    .locals 1
    .parameter "match"

    .prologue
    .line 417
    new-instance v0, Lcom/google/common/base/CharMatcher$9;

    invoke-direct {v0, p0}, Lcom/google/common/base/CharMatcher$9;-><init>(C)V

    return-object v0
.end method

.method public static noneOf(Ljava/lang/CharSequence;)Lcom/google/common/base/CharMatcher;
    .locals 1
    .parameter "sequence"

    .prologue
    .line 486
    invoke-static {p0}, Lcom/google/common/base/CharMatcher;->anyOf(Ljava/lang/CharSequence;)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/base/CharMatcher;->negate()Lcom/google/common/base/CharMatcher;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public and(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;
    .locals 4
    .parameter "other"

    .prologue
    .line 585
    new-instance v1, Lcom/google/common/base/CharMatcher$And;

    const/4 v0, 0x2

    new-array v2, v0, [Lcom/google/common/base/CharMatcher;

    const/4 v0, 0x0

    aput-object p0, v2, v0

    const/4 v3, 0x1

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/base/CharMatcher;

    aput-object v0, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/google/common/base/CharMatcher$And;-><init>(Ljava/util/List;)V

    return-object v1
.end method

.method public apply(Ljava/lang/Character;)Z
    .locals 1
    .parameter "character"

    .prologue
    .line 1146
    invoke-virtual {p1}, Ljava/lang/Character;->charValue()C

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 51
    check-cast p1, Ljava/lang/Character;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/google/common/base/CharMatcher;->apply(Ljava/lang/Character;)Z

    move-result v0

    return v0
.end method

.method public collapseFrom(Ljava/lang/CharSequence;C)Ljava/lang/String;
    .locals 7
    .parameter "sequence"
    .parameter "replacement"
    .annotation runtime Ljavax/annotation/CheckReturnValue;
    .end annotation

    .prologue
    .line 1085
    invoke-virtual {p0, p1}, Lcom/google/common/base/CharMatcher;->indexIn(Ljava/lang/CharSequence;)I

    move-result v2

    .line 1086
    .local v2, first:I
    const/4 v5, -0x1

    if-ne v2, v5, :cond_0

    .line 1087
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1107
    :goto_0
    return-object v5

    .line 1091
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v6, 0x0

    invoke-interface {p1, v6, v2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1094
    .local v0, builder:Ljava/lang/StringBuilder;
    const/4 v4, 0x1

    .line 1095
    .local v4, in:Z
    add-int/lit8 v3, v2, 0x1

    .local v3, i:I
    :goto_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    if-ge v3, v5, :cond_3

    .line 1096
    invoke-interface {p1, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 1097
    .local v1, c:C
    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/google/common/base/CharMatcher;->apply(Ljava/lang/Character;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1098
    if-nez v4, :cond_1

    .line 1099
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1100
    const/4 v4, 0x1

    .line 1095
    :cond_1
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1103
    :cond_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1104
    const/4 v4, 0x0

    goto :goto_2

    .line 1107
    .end local v1           #c:C
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method

.method public countIn(Ljava/lang/CharSequence;)I
    .locals 3
    .parameter "sequence"

    .prologue
    .line 847
    const/4 v0, 0x0

    .line 848
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 849
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    invoke-virtual {p0, v2}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 850
    add-int/lit8 v0, v0, 0x1

    .line 848
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 853
    :cond_1
    return v0
.end method

.method public indexIn(Ljava/lang/CharSequence;)I
    .locals 3
    .parameter "sequence"

    .prologue
    .line 789
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 790
    .local v1, length:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 791
    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    invoke-virtual {p0, v2}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 795
    .end local v0           #i:I
    :goto_1
    return v0

    .line 790
    .restart local v0       #i:I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 795
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method public indexIn(Ljava/lang/CharSequence;I)I
    .locals 3
    .parameter "sequence"
    .parameter "start"

    .prologue
    .line 814
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 815
    .local v1, length:I
    invoke-static {p2, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndex(II)I

    .line 816
    move v0, p2

    .local v0, i:I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 817
    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    invoke-virtual {p0, v2}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 821
    .end local v0           #i:I
    :goto_1
    return v0

    .line 816
    .restart local v0       #i:I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 821
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method public lastIndexIn(Ljava/lang/CharSequence;)I
    .locals 2
    .parameter "sequence"

    .prologue
    .line 835
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_1

    .line 836
    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 840
    .end local v0           #i:I
    :goto_1
    return v0

    .line 835
    .restart local v0       #i:I
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 840
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method public abstract matches(C)Z
.end method

.method public matchesAllOf(Ljava/lang/CharSequence;)Z
    .locals 2
    .parameter "sequence"

    .prologue
    .line 753
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_1

    .line 754
    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v1

    if-nez v1, :cond_0

    .line 755
    const/4 v1, 0x0

    .line 758
    :goto_1
    return v1

    .line 753
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 758
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method public matchesAnyOf(Ljava/lang/CharSequence;)Z
    .locals 1
    .parameter "sequence"

    .prologue
    .line 739
    invoke-virtual {p0, p1}, Lcom/google/common/base/CharMatcher;->matchesNoneOf(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public matchesNoneOf(Ljava/lang/CharSequence;)Z
    .locals 2
    .parameter "sequence"

    .prologue
    .line 773
    invoke-virtual {p0, p1}, Lcom/google/common/base/CharMatcher;->indexIn(Ljava/lang/CharSequence;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public negate()Lcom/google/common/base/CharMatcher;
    .locals 2

    .prologue
    .line 557
    move-object v0, p0

    .line 558
    .local v0, original:Lcom/google/common/base/CharMatcher;
    new-instance v1, Lcom/google/common/base/CharMatcher$14;

    invoke-direct {v1, p0, v0}, Lcom/google/common/base/CharMatcher$14;-><init>(Lcom/google/common/base/CharMatcher;Lcom/google/common/base/CharMatcher;)V

    return-object v1
.end method

.method public or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;
    .locals 4
    .parameter "other"

    .prologue
    .line 615
    new-instance v1, Lcom/google/common/base/CharMatcher$Or;

    const/4 v0, 0x2

    new-array v2, v0, [Lcom/google/common/base/CharMatcher;

    const/4 v0, 0x0

    aput-object p0, v2, v0

    const/4 v3, 0x1

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/base/CharMatcher;

    aput-object v0, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/google/common/base/CharMatcher$Or;-><init>(Ljava/util/List;)V

    return-object v1
.end method

.method public precomputed()Lcom/google/common/base/CharMatcher;
    .locals 1

    .prologue
    .line 657
    invoke-static {p0}, Lcom/google/common/base/Platform;->precomputeCharMatcher(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    return-object v0
.end method

.method precomputedInternal()Lcom/google/common/base/CharMatcher;
    .locals 2

    .prologue
    .line 672
    new-instance v0, Lcom/google/common/base/CharMatcher$LookupTable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/common/base/CharMatcher$LookupTable;-><init>(Lcom/google/common/base/CharMatcher$1;)V

    .line 673
    .local v0, table:Lcom/google/common/base/CharMatcher$LookupTable;
    invoke-virtual {p0, v0}, Lcom/google/common/base/CharMatcher;->setBits(Lcom/google/common/base/CharMatcher$LookupTable;)V

    .line 675
    new-instance v1, Lcom/google/common/base/CharMatcher$15;

    invoke-direct {v1, p0, v0}, Lcom/google/common/base/CharMatcher$15;-><init>(Lcom/google/common/base/CharMatcher;Lcom/google/common/base/CharMatcher$LookupTable;)V

    return-object v1
.end method

.method public removeFrom(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 6
    .parameter "sequence"
    .annotation runtime Ljavax/annotation/CheckReturnValue;
    .end annotation

    .prologue
    .line 866
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 867
    .local v3, string:Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/google/common/base/CharMatcher;->indexIn(Ljava/lang/CharSequence;)I

    move-result v1

    .line 868
    .local v1, pos:I
    const/4 v4, -0x1

    if-ne v1, v4, :cond_0

    .line 890
    .end local v3           #string:Ljava/lang/String;
    :goto_0
    return-object v3

    .line 872
    .restart local v3       #string:Ljava/lang/String;
    :cond_0
    invoke-virtual {v3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 873
    .local v0, chars:[C
    const/4 v2, 0x1

    .line 877
    .local v2, spread:I
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 879
    :goto_2
    array-length v4, v0

    if-ne v1, v4, :cond_1

    .line 890
    new-instance v3, Ljava/lang/String;

    .end local v3           #string:Ljava/lang/String;
    const/4 v4, 0x0

    sub-int v5, v1, v2

    invoke-direct {v3, v0, v4, v5}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    .line 882
    .restart local v3       #string:Ljava/lang/String;
    :cond_1
    aget-char v4, v0, v1

    invoke-virtual {p0, v4}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 888
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 885
    :cond_2
    sub-int v4, v1, v2

    aget-char v5, v0, v1

    aput-char v5, v0, v4

    .line 886
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method public replaceFrom(Ljava/lang/CharSequence;C)Ljava/lang/String;
    .locals 5
    .parameter "sequence"
    .parameter "replacement"
    .annotation runtime Ljavax/annotation/CheckReturnValue;
    .end annotation

    .prologue
    .line 925
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 926
    .local v3, string:Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/google/common/base/CharMatcher;->indexIn(Ljava/lang/CharSequence;)I

    move-result v2

    .line 927
    .local v2, pos:I
    const/4 v4, -0x1

    if-ne v2, v4, :cond_0

    .line 937
    .end local v3           #string:Ljava/lang/String;
    :goto_0
    return-object v3

    .line 930
    .restart local v3       #string:Ljava/lang/String;
    :cond_0
    invoke-virtual {v3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 931
    .local v0, chars:[C
    aput-char p2, v0, v2

    .line 932
    add-int/lit8 v1, v2, 0x1

    .local v1, i:I
    :goto_1
    array-length v4, v0

    if-ge v1, v4, :cond_2

    .line 933
    aget-char v4, v0, v1

    invoke-virtual {p0, v4}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 934
    aput-char p2, v0, v1

    .line 932
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 937
    :cond_2
    new-instance v3, Ljava/lang/String;

    .end local v3           #string:Ljava/lang/String;
    invoke-direct {v3, v0}, Ljava/lang/String;-><init>([C)V

    goto :goto_0
.end method

.method public replaceFrom(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 8
    .parameter "sequence"
    .parameter "replacement"
    .annotation runtime Ljavax/annotation/CheckReturnValue;
    .end annotation

    .prologue
    const/4 v7, -0x1

    .line 958
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v4

    .line 959
    .local v4, replacementLen:I
    if-nez v4, :cond_1

    .line 960
    invoke-virtual {p0, p1}, Lcom/google/common/base/CharMatcher;->removeFrom(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    .line 984
    :cond_0
    :goto_0
    return-object v5

    .line 962
    :cond_1
    const/4 v6, 0x1

    if-ne v4, v6, :cond_2

    .line 963
    const/4 v6, 0x0

    invoke-interface {p2, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    invoke-virtual {p0, p1, v6}, Lcom/google/common/base/CharMatcher;->replaceFrom(Ljava/lang/CharSequence;C)Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 966
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 967
    .local v5, string:Ljava/lang/String;
    invoke-virtual {p0, v5}, Lcom/google/common/base/CharMatcher;->indexIn(Ljava/lang/CharSequence;)I

    move-result v3

    .line 968
    .local v3, pos:I
    if-eq v3, v7, :cond_0

    .line 972
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v1

    .line 973
    .local v1, len:I
    new-instance v0, Ljava/lang/StringBuilder;

    mul-int/lit8 v6, v1, 0x3

    div-int/lit8 v6, v6, 0x2

    add-int/lit8 v6, v6, 0x10

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 975
    .local v0, buf:Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 977
    .local v2, oldpos:I
    :cond_3
    invoke-virtual {v0, v5, v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 978
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 979
    add-int/lit8 v2, v3, 0x1

    .line 980
    invoke-virtual {p0, v5, v2}, Lcom/google/common/base/CharMatcher;->indexIn(Ljava/lang/CharSequence;I)I

    move-result v3

    .line 981
    if-ne v3, v7, :cond_3

    .line 983
    invoke-virtual {v0, v5, v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 984
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method

.method public retainFrom(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 1
    .parameter "sequence"
    .annotation runtime Ljavax/annotation/CheckReturnValue;
    .end annotation

    .prologue
    .line 903
    invoke-virtual {p0}, Lcom/google/common/base/CharMatcher;->negate()Lcom/google/common/base/CharMatcher;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/common/base/CharMatcher;->removeFrom(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method setBits(Lcom/google/common/base/CharMatcher$LookupTable;)V
    .locals 3
    .parameter "table"

    .prologue
    .line 696
    const/4 v0, 0x0

    .line 698
    .local v0, c:C
    :goto_0
    invoke-virtual {p0, v0}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 699
    invoke-virtual {p1, v0}, Lcom/google/common/base/CharMatcher$LookupTable;->set(C)V

    .line 701
    :cond_0
    add-int/lit8 v2, v0, 0x1

    int-to-char v1, v2

    .end local v0           #c:C
    .local v1, c:C
    const v2, 0xffff

    if-ne v0, v2, :cond_1

    .line 705
    return-void

    :cond_1
    move v0, v1

    .end local v1           #c:C
    .restart local v0       #c:C
    goto :goto_0
.end method

.method public trimAndCollapseFrom(Ljava/lang/CharSequence;C)Ljava/lang/String;
    .locals 6
    .parameter "sequence"
    .parameter "replacement"
    .annotation runtime Ljavax/annotation/CheckReturnValue;
    .end annotation

    .prologue
    .line 1117
    invoke-virtual {p0}, Lcom/google/common/base/CharMatcher;->negate()Lcom/google/common/base/CharMatcher;

    move-result-object v5

    invoke-virtual {v5, p1}, Lcom/google/common/base/CharMatcher;->indexIn(Ljava/lang/CharSequence;)I

    move-result v2

    .line 1118
    .local v2, first:I
    const/4 v5, -0x1

    if-ne v2, v5, :cond_0

    .line 1119
    const-string v5, ""

    .line 1135
    :goto_0
    return-object v5

    .line 1121
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1122
    .local v0, builder:Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .line 1123
    .local v4, inMatchingGroup:Z
    move v3, v2

    .local v3, i:I
    :goto_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    if-ge v3, v5, :cond_3

    .line 1124
    invoke-interface {p1, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 1125
    .local v1, c:C
    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/google/common/base/CharMatcher;->apply(Ljava/lang/Character;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1126
    const/4 v4, 0x1

    .line 1123
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1128
    :cond_1
    if-eqz v4, :cond_2

    .line 1129
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1130
    const/4 v4, 0x0

    .line 1132
    :cond_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1135
    .end local v1           #c:C
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method

.method public trimFrom(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 4
    .parameter "sequence"
    .annotation runtime Ljavax/annotation/CheckReturnValue;
    .end annotation

    .prologue
    .line 1003
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    .line 1007
    .local v2, len:I
    const/4 v0, 0x0

    .local v0, first:I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 1008
    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-virtual {p0, v3}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v3

    if-nez v3, :cond_2

    .line 1012
    :cond_0
    add-int/lit8 v1, v2, -0x1

    .local v1, last:I
    :goto_1
    if-le v1, v0, :cond_1

    .line 1013
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-virtual {p0, v3}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v3

    if-nez v3, :cond_3

    .line 1018
    :cond_1
    add-int/lit8 v3, v1, 0x1

    invoke-interface {p1, v0, v3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 1007
    .end local v1           #last:I
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1012
    .restart local v1       #last:I
    :cond_3
    add-int/lit8 v1, v1, -0x1

    goto :goto_1
.end method

.method public trimLeadingFrom(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 3
    .parameter "sequence"
    .annotation runtime Ljavax/annotation/CheckReturnValue;
    .end annotation

    .prologue
    .line 1031
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 1034
    .local v1, len:I
    const/4 v0, 0x0

    .local v0, first:I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 1035
    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    invoke-virtual {p0, v2}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1040
    :cond_0
    invoke-interface {p1, v0, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1034
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public trimTrailingFrom(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 4
    .parameter "sequence"
    .annotation runtime Ljavax/annotation/CheckReturnValue;
    .end annotation

    .prologue
    .line 1053
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 1056
    .local v1, len:I
    add-int/lit8 v0, v1, -0x1

    .local v0, last:I
    :goto_0
    if-ltz v0, :cond_0

    .line 1057
    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    invoke-virtual {p0, v2}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1062
    :cond_0
    const/4 v2, 0x0

    add-int/lit8 v3, v0, 0x1

    invoke-interface {p1, v2, v3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1056
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method
