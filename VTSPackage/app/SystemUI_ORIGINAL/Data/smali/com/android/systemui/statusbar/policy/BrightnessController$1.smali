.class Lcom/android/systemui/statusbar/policy/BrightnessController$1;
.super Ljava/lang/Object;
.source "BrightnessController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/policy/BrightnessController;->onChanged(Lcom/android/systemui/statusbar/policy/ToggleSlider;ZZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/policy/BrightnessController;

.field final synthetic val$val:I


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/policy/BrightnessController;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 141
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/BrightnessController$1;->this$0:Lcom/android/systemui/statusbar/policy/BrightnessController;

    iput p2, p0, Lcom/android/systemui/statusbar/policy/BrightnessController$1;->val$val:I

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 143
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/BrightnessController$1;->this$0:Lcom/android/systemui/statusbar/policy/BrightnessController;

    #getter for: Lcom/android/systemui/statusbar/policy/BrightnessController;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/android/systemui/statusbar/policy/BrightnessController;->access$000(Lcom/android/systemui/statusbar/policy/BrightnessController;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "screen_brightness"

    iget v2, p0, Lcom/android/systemui/statusbar/policy/BrightnessController$1;->val$val:I

    iget-object v3, p0, Lcom/android/systemui/statusbar/policy/BrightnessController$1;->this$0:Lcom/android/systemui/statusbar/policy/BrightnessController;

    #getter for: Lcom/android/systemui/statusbar/policy/BrightnessController;->mUserTracker:Lcom/android/systemui/statusbar/policy/CurrentUserTracker;
    invoke-static {v3}, Lcom/android/systemui/statusbar/policy/BrightnessController;->access$100(Lcom/android/systemui/statusbar/policy/BrightnessController;)Lcom/android/systemui/statusbar/policy/CurrentUserTracker;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/systemui/statusbar/policy/CurrentUserTracker;->getCurrentUserId()I

    move-result v3

    invoke-static {v0, v1, v2, v3}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    .line 146
    return-void
.end method
