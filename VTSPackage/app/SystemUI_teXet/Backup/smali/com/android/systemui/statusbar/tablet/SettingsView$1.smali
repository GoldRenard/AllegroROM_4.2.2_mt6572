.class Lcom/android/systemui/statusbar/tablet/SettingsView$1;
.super Ljava/lang/Object;
.source "SettingsView.java"

# interfaces
.implements Lcom/android/systemui/statusbar/policy/AutoRotateController$RotationLockCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/tablet/SettingsView;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/tablet/SettingsView;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/tablet/SettingsView;)V
    .registers 2
    .parameter

    .prologue
    .line 72
    iput-object p1, p0, Lcom/android/systemui/statusbar/tablet/SettingsView$1;->this$0:Lcom/android/systemui/statusbar/tablet/SettingsView;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public setRotationLockControlVisibility(Z)V
    .registers 6
    .parameter "show"

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 75
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/SettingsView$1;->this$0:Lcom/android/systemui/statusbar/tablet/SettingsView;

    iget-object v3, v0, Lcom/android/systemui/statusbar/tablet/SettingsView;->mRotationLockContainer:Landroid/view/View;

    if-eqz p1, :cond_17

    move v0, v1

    :goto_a
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 76
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/SettingsView$1;->this$0:Lcom/android/systemui/statusbar/tablet/SettingsView;

    iget-object v0, v0, Lcom/android/systemui/statusbar/tablet/SettingsView;->mRotationLockSeparator:Landroid/view/View;

    if-eqz p1, :cond_19

    :goto_13
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 77
    return-void

    :cond_17
    move v0, v2

    .line 75
    goto :goto_a

    :cond_19
    move v1, v2

    .line 76
    goto :goto_13
.end method
