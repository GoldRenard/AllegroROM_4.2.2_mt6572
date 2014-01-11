.class Lcom/android/systemui/statusbar/phone/QuickSettings$1;
.super Lcom/android/internal/view/RotationPolicy$RotationPolicyListener;
.source "QuickSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/phone/QuickSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/phone/QuickSettings;)V
    .registers 2
    .parameter

    .prologue
    .line 132
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$1;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-direct {p0}, Lcom/android/internal/view/RotationPolicy$RotationPolicyListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onChange()V
    .registers 2

    .prologue
    .line 135
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$1;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-static {v0}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$000(Lcom/android/systemui/statusbar/phone/QuickSettings;)Lcom/android/systemui/statusbar/phone/QuickSettingsModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/phone/QuickSettingsModel;->onRotationLockChanged()V

    .line 136
    return-void
.end method
