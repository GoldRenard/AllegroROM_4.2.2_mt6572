.class final Lcom/google/common/base/Optional$Present;
.super Lcom/google/common/base/Optional;
.source "Optional.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/Optional;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Present"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/base/Optional",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J


# instance fields
.field private final reference:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 201
    .local p0, this:Lcom/google/common/base/Optional$Present;,"Lcom/google/common/base/Optional$Present<TT;>;"
    .local p1, reference:Ljava/lang/Object;,"TT;"
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/common/base/Optional;-><init>(Lcom/google/common/base/Optional$1;)V

    .line 202
    iput-object p1, p0, Lcom/google/common/base/Optional$Present;->reference:Ljava/lang/Object;

    .line 203
    return-void
.end method


# virtual methods
.method public asSet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 233
    .local p0, this:Lcom/google/common/base/Optional$Present;,"Lcom/google/common/base/Optional$Present<TT;>;"
    iget-object v0, p0, Lcom/google/common/base/Optional$Present;->reference:Ljava/lang/Object;

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .parameter "object"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 237
    .local p0, this:Lcom/google/common/base/Optional$Present;,"Lcom/google/common/base/Optional$Present<TT;>;"
    instance-of v1, p1, Lcom/google/common/base/Optional$Present;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 238
    check-cast v0, Lcom/google/common/base/Optional$Present;

    .line 239
    .local v0, other:Lcom/google/common/base/Optional$Present;,"Lcom/google/common/base/Optional$Present<*>;"
    iget-object v1, p0, Lcom/google/common/base/Optional$Present;->reference:Ljava/lang/Object;

    iget-object v2, v0, Lcom/google/common/base/Optional$Present;->reference:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 241
    .end local v0           #other:Lcom/google/common/base/Optional$Present;,"Lcom/google/common/base/Optional$Present<*>;"
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 210
    .local p0, this:Lcom/google/common/base/Optional$Present;,"Lcom/google/common/base/Optional$Present<TT;>;"
    iget-object v0, p0, Lcom/google/common/base/Optional$Present;->reference:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 245
    .local p0, this:Lcom/google/common/base/Optional$Present;,"Lcom/google/common/base/Optional$Present<TT;>;"
    const v0, 0x598df91c

    iget-object v1, p0, Lcom/google/common/base/Optional$Present;->reference:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isPresent()Z
    .locals 1

    .prologue
    .line 206
    .local p0, this:Lcom/google/common/base/Optional$Present;,"Lcom/google/common/base/Optional$Present<TT;>;"
    const/4 v0, 0x1

    return v0
.end method

.method public or(Lcom/google/common/base/Optional;)Lcom/google/common/base/Optional;
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/base/Optional",
            "<+TT;>;)",
            "Lcom/google/common/base/Optional",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 219
    .local p0, this:Lcom/google/common/base/Optional$Present;,"Lcom/google/common/base/Optional$Present<TT;>;"
    .local p1, secondChoice:Lcom/google/common/base/Optional;,"Lcom/google/common/base/Optional<+TT;>;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    return-object p0
.end method

.method public or(Lcom/google/common/base/Supplier;)Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/base/Supplier",
            "<+TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 224
    .local p0, this:Lcom/google/common/base/Optional$Present;,"Lcom/google/common/base/Optional$Present<TT;>;"
    .local p1, supplier:Lcom/google/common/base/Supplier;,"Lcom/google/common/base/Supplier<+TT;>;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    iget-object v0, p0, Lcom/google/common/base/Optional$Present;->reference:Ljava/lang/Object;

    return-object v0
.end method

.method public or(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 214
    .local p0, this:Lcom/google/common/base/Optional$Present;,"Lcom/google/common/base/Optional$Present<TT;>;"
    .local p1, defaultValue:Ljava/lang/Object;,"TT;"
    const-string v0, "use orNull() instead of or(null)"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    iget-object v0, p0, Lcom/google/common/base/Optional$Present;->reference:Ljava/lang/Object;

    return-object v0
.end method

.method public orNull()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 229
    .local p0, this:Lcom/google/common/base/Optional$Present;,"Lcom/google/common/base/Optional$Present<TT;>;"
    iget-object v0, p0, Lcom/google/common/base/Optional$Present;->reference:Ljava/lang/Object;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 249
    .local p0, this:Lcom/google/common/base/Optional$Present;,"Lcom/google/common/base/Optional$Present<TT;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Optional.of("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/common/base/Optional$Present;->reference:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
