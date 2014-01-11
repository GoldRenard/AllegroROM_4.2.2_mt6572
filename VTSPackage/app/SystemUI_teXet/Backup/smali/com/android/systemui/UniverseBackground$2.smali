.class Lcom/android/systemui/UniverseBackground$2;
.super Ljava/lang/Object;
.source "UniverseBackground.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/UniverseBackground;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/UniverseBackground;


# direct methods
.method constructor <init>(Lcom/android/systemui/UniverseBackground;)V
    .registers 2
    .parameter

    .prologue
    .line 103
    iput-object p1, p0, Lcom/android/systemui/UniverseBackground$2;->this$0:Lcom/android/systemui/UniverseBackground;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .parameter "v"

    .prologue
    .line 105
    iget-object v0, p0, Lcom/android/systemui/UniverseBackground$2;->this$0:Lcom/android/systemui/UniverseBackground;

    invoke-virtual {v0}, Lcom/android/systemui/UniverseBackground;->animateCollapse()V

    .line 106
    return-void
.end method
