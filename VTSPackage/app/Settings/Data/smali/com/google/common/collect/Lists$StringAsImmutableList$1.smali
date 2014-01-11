.class Lcom/google/common/collect/Lists$StringAsImmutableList$1;
.super Lcom/google/common/collect/AbstractIndexedListIterator;
.source "Lists.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Lists$StringAsImmutableList;->listIterator(I)Lcom/google/common/collect/UnmodifiableListIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/AbstractIndexedListIterator",
        "<",
        "Ljava/lang/Character;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/Lists$StringAsImmutableList;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Lists$StringAsImmutableList;II)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 565
    iput-object p1, p0, Lcom/google/common/collect/Lists$StringAsImmutableList$1;->this$0:Lcom/google/common/collect/Lists$StringAsImmutableList;

    invoke-direct {p0, p2, p3}, Lcom/google/common/collect/AbstractIndexedListIterator;-><init>(II)V

    return-void
.end method


# virtual methods
.method protected get(I)Ljava/lang/Character;
    .locals 1
    .parameter "index"

    .prologue
    .line 567
    iget-object v0, p0, Lcom/google/common/collect/Lists$StringAsImmutableList$1;->this$0:Lcom/google/common/collect/Lists$StringAsImmutableList;

    #getter for: Lcom/google/common/collect/Lists$StringAsImmutableList;->string:Ljava/lang/String;
    invoke-static {v0}, Lcom/google/common/collect/Lists$StringAsImmutableList;->access$000(Lcom/google/common/collect/Lists$StringAsImmutableList;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic get(I)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 565
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Lists$StringAsImmutableList$1;->get(I)Ljava/lang/Character;

    move-result-object v0

    return-object v0
.end method
