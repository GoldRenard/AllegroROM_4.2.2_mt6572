.class Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$9;
.super Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe;
.source "KeyguardSimPinPukView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;->checkMe(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 804
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$9;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;

    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$CheckSimMe;-><init>(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method onSimMeCheckResponse(I)V
    .locals 2
    .parameter "ret"

    .prologue
    .line 806
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$9;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;

    new-instance v1, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$9$1;

    invoke-direct {v1, p0, p1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$9$1;-><init>(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView$9;I)V

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPinPukView;->post(Ljava/lang/Runnable;)Z

    .line 846
    return-void
.end method
