.class final Lcom/google/common/hash/MessageDigestHashFunction;
.super Lcom/google/common/hash/AbstractStreamingHashFunction;
.source "MessageDigestHashFunction.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/hash/MessageDigestHashFunction$1;,
        Lcom/google/common/hash/MessageDigestHashFunction$MessageDigestHasher;
    }
.end annotation


# instance fields
.field private final algorithmName:Ljava/lang/String;

.field private final bits:I


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "algorithmName"

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/google/common/hash/AbstractStreamingHashFunction;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/google/common/hash/MessageDigestHashFunction;->algorithmName:Ljava/lang/String;

    .line 43
    invoke-static {p1}, Lcom/google/common/hash/MessageDigestHashFunction;->getMessageDigest(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    invoke-virtual {v0}, Ljava/security/MessageDigest;->getDigestLength()I

    move-result v0

    mul-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/google/common/hash/MessageDigestHashFunction;->bits:I

    .line 44
    return-void
.end method

.method private static getMessageDigest(Ljava/lang/String;)Ljava/security/MessageDigest;
    .locals 2
    .parameter "algorithmName"

    .prologue
    .line 52
    :try_start_0
    invoke-static {p0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, e:Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method


# virtual methods
.method public bits()I
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lcom/google/common/hash/MessageDigestHashFunction;->bits:I

    return v0
.end method

.method public newHasher()Lcom/google/common/hash/Hasher;
    .locals 3

    .prologue
    .line 59
    new-instance v0, Lcom/google/common/hash/MessageDigestHashFunction$MessageDigestHasher;

    iget-object v1, p0, Lcom/google/common/hash/MessageDigestHashFunction;->algorithmName:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/common/hash/MessageDigestHashFunction;->getMessageDigest(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/common/hash/MessageDigestHashFunction$MessageDigestHasher;-><init>(Ljava/security/MessageDigest;Lcom/google/common/hash/MessageDigestHashFunction$1;)V

    return-object v0
.end method
