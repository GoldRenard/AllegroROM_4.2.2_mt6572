.class Lcom/android/internal/policy/impl/GlobalActions$12$2;
.super Ljava/lang/Object;
.source "GlobalActions.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/GlobalActions$12;->onPress()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/internal/policy/impl/GlobalActions$12;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/GlobalActions$12;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/internal/policy/impl/GlobalActions$12$2;->this$1:Lcom/android/internal/policy/impl/GlobalActions$12;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 6
    .parameter "dialog"

    .prologue
    .line 46
    iget-object v2, p0, Lcom/android/internal/policy/impl/GlobalActions$12$2;->this$1:Lcom/android/internal/policy/impl/GlobalActions$12;

    iget v2, v2, Lcom/android/internal/policy/impl/GlobalActions$12;->mSel:I

    if-ltz v2, :cond_0

    .line 47
    iget-object v2, p0, Lcom/android/internal/policy/impl/GlobalActions$12$2;->this$1:Lcom/android/internal/policy/impl/GlobalActions$12;

    #getter for: Lcom/android/internal/policy/impl/GlobalActions$12;->this$0:Lcom/android/internal/policy/impl/GlobalActions;
    invoke-static {v2}, Lcom/android/internal/policy/impl/GlobalActions$12;->access$0(Lcom/android/internal/policy/impl/GlobalActions$12;)Lcom/android/internal/policy/impl/GlobalActions;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/policy/impl/GlobalActions;->access$200(Lcom/android/internal/policy/impl/GlobalActions;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x1070039    # Замена id массива (array) reboot_modes

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/GlobalActions$12$2;->this$1:Lcom/android/internal/policy/impl/GlobalActions$12;

    iget v3, v3, Lcom/android/internal/policy/impl/GlobalActions$12;->mSel:I

    aget-object v0, v2, v3

    .line 48
    .local v0, mode:Ljava/lang/String;
    const-string v2, "hotboot"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 50
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "pkill"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "-TERM"

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-string v5, "-f"

    aput-object v5, v3, v4

    const/4 v4, 0x3

    const-string v5, "system_server"

    aput-object v5, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .end local v0           #mode:Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 53
    .restart local v0       #mode:Ljava/lang/String;
    :cond_1
    iget-object v2, p0, Lcom/android/internal/policy/impl/GlobalActions$12$2;->this$1:Lcom/android/internal/policy/impl/GlobalActions$12;

    #getter for: Lcom/android/internal/policy/impl/GlobalActions$12;->this$0:Lcom/android/internal/policy/impl/GlobalActions;
    invoke-static {v2}, Lcom/android/internal/policy/impl/GlobalActions$12;->access$0(Lcom/android/internal/policy/impl/GlobalActions$12;)Lcom/android/internal/policy/impl/GlobalActions;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/policy/impl/GlobalActions;->access$200(Lcom/android/internal/policy/impl/GlobalActions;)Landroid/content/Context;

    move-result-object v2

    const-string v3, "power"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    .line 54
    .local v1, pm:Landroid/os/PowerManager;
    invoke-virtual {v1, v0}, Landroid/os/PowerManager;->reboot(Ljava/lang/String;)V

    goto :goto_0

    .line 51
    .end local v1           #pm:Landroid/os/PowerManager;
    :catch_0
    move-exception v2

    goto :goto_0
.end method
