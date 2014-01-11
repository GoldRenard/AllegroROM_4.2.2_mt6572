.class Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$TransientTextManager$Data;
.super Ljava/lang/Object;
.source "KeyguardStatusViewManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$TransientTextManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Data"
.end annotation


# instance fields
.field final icon:I

.field final text:Ljava/lang/CharSequence;

.field final synthetic this$1:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$TransientTextManager;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$TransientTextManager;Ljava/lang/CharSequence;I)V
    .locals 0
    .parameter
    .parameter "t"
    .parameter "i"

    .prologue
    .line 116
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$TransientTextManager$Data;->this$1:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$TransientTextManager;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 117
    iput-object p2, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$TransientTextManager$Data;->text:Ljava/lang/CharSequence;

    .line 118
    iput p3, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardStatusViewManager$TransientTextManager$Data;->icon:I

    .line 119
    return-void
.end method
