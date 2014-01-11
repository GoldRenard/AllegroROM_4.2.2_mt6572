.class Lcom/android/systemui/statusbar/phone/QuickSettings$31;
.super Ljava/lang/Object;
.source "QuickSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/phone/QuickSettings;->showBrightnessDialog()V
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
    .line 912
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$31;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 4
    .parameter "dialog"

    .prologue
    .line 915
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$31;->this$0:Lcom/android/systemui/statusbar/phone/QuickSettings;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/phone/QuickSettings;->access$1802(Lcom/android/systemui/statusbar/phone/QuickSettings;Lcom/android/systemui/statusbar/policy/BrightnessController;)Lcom/android/systemui/statusbar/policy/BrightnessController;

    .line 916
    return-void
.end method
