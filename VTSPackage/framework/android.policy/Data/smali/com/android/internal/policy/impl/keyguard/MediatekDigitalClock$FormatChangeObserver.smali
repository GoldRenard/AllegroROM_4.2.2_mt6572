.class Lcom/android/internal/policy/impl/keyguard/MediatekDigitalClock$FormatChangeObserver;
.super Landroid/database/ContentObserver;
.source "MediatekDigitalClock.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard/MediatekDigitalClock;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FormatChangeObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard/MediatekDigitalClock;


# direct methods
.method public constructor <init>(Lcom/android/internal/policy/impl/keyguard/MediatekDigitalClock;)V
    .locals 1
    .parameter

    .prologue
    .line 102
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekDigitalClock$FormatChangeObserver;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekDigitalClock;

    .line 103
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 104
    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1
    .parameter "selfChange"

    .prologue
    .line 107
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekDigitalClock$FormatChangeObserver;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekDigitalClock;

    #calls: Lcom/android/internal/policy/impl/keyguard/MediatekDigitalClock;->setDateFormat()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekDigitalClock;->access$400(Lcom/android/internal/policy/impl/keyguard/MediatekDigitalClock;)V

    .line 108
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekDigitalClock$FormatChangeObserver;->this$0:Lcom/android/internal/policy/impl/keyguard/MediatekDigitalClock;

    #calls: Lcom/android/internal/policy/impl/keyguard/MediatekDigitalClock;->updateTime()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekDigitalClock;->access$200(Lcom/android/internal/policy/impl/keyguard/MediatekDigitalClock;)V

    .line 109
    return-void
.end method
