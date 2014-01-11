.class Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$CheckSimPuk$2;
.super Ljava/lang/Object;
.source "KeyguardSimPukView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$CheckSimPuk;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$CheckSimPuk;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$CheckSimPuk;)V
    .locals 0
    .parameter

    .prologue
    .line 203
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$CheckSimPuk$2;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$CheckSimPuk;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 205
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$CheckSimPuk$2;->this$1:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$CheckSimPuk;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$CheckSimPuk;->onSimLockChangedResponse(Z)V

    .line 206
    return-void
.end method
