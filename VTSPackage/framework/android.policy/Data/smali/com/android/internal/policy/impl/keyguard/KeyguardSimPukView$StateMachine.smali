.class Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;
.super Ljava/lang/Object;
.source "KeyguardSimPukView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StateMachine"
.end annotation


# instance fields
.field final CONFIRM_PIN:I

.field final DONE:I

.field final ENTER_PIN:I

.field final ENTER_PUK:I

.field private state:I

.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;


# direct methods
.method private constructor <init>(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;)V
    .locals 2
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 49
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->ENTER_PUK:I

    .line 51
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->ENTER_PIN:I

    .line 52
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->CONFIRM_PIN:I

    .line 53
    const/4 v0, 0x3

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->DONE:I

    .line 54
    iput v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->state:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;-><init>(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;)V

    return-void
.end method


# virtual methods
.method public next()V
    .locals 4

    .prologue
    const/4 v2, 0x2

    const/4 v3, 0x1

    .line 57
    const/4 v0, 0x0

    .line 58
    .local v0, msg:I
    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->state:I

    if-nez v1, :cond_3

    .line 59
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->checkPuk()Z
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->access$100(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 60
    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->state:I

    .line 61
    const v0, 0x104052d

    .line 83
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    iget-object v1, v1, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->mPasswordEntry:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    if-eqz v0, :cond_1

    .line 85
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    iget-object v1, v1, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->mSecurityMessageDisplay:Lcom/android/internal/policy/impl/keyguard/SecurityMessageDisplay;

    invoke-interface {v1, v0, v3}, Lcom/android/internal/policy/impl/keyguard/SecurityMessageDisplay;->setMessage(IZ)V

    .line 87
    :cond_1
    return-void

    .line 63
    :cond_2
    const v0, 0x1040532

    goto :goto_0

    .line 65
    :cond_3
    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->state:I

    if-ne v1, v3, :cond_5

    .line 66
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->checkPin()Z
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->access$200(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 67
    iput v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->state:I

    .line 68
    const v0, 0x104052e

    goto :goto_0

    .line 70
    :cond_4
    const v0, 0x1040531

    goto :goto_0

    .line 72
    :cond_5
    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->state:I

    if-ne v1, v2, :cond_0

    .line 73
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->confirmPin()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 74
    const/4 v1, 0x3

    iput v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->state:I

    .line 75
    const v0, 0x1040305

    .line 77
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->updateSim()V
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->access$300(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;)V

    goto :goto_0

    .line 79
    :cond_6
    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->state:I

    .line 80
    const v0, 0x1040534

    goto :goto_0
.end method

.method reset()V
    .locals 3

    .prologue
    .line 90
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    const-string v1, ""

    #setter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->mPinText:Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->access$402(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;Ljava/lang/String;)Ljava/lang/String;

    .line 91
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    const-string v1, ""

    #setter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->mPukText:Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->access$502(Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;Ljava/lang/String;)Ljava/lang/String;

    .line 92
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->state:I

    .line 93
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->mSecurityMessageDisplay:Lcom/android/internal/policy/impl/keyguard/SecurityMessageDisplay;

    const v1, 0x104052c

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/SecurityMessageDisplay;->setMessage(IZ)V

    .line 94
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView$StateMachine;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSimPukView;->mPasswordEntry:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->requestFocus()Z

    .line 95
    return-void
.end method
