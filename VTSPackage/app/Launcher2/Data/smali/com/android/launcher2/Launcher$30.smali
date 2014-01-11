.class Lcom/android/launcher2/Launcher$30;
.super Landroid/view/OrientationEventListener;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Launcher;->registerOrientationListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Launcher;


# direct methods
.method constructor <init>(Lcom/android/launcher2/Launcher;Landroid/content/Context;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 4470
    iput-object p1, p0, Lcom/android/launcher2/Launcher$30;->this$0:Lcom/android/launcher2/Launcher;

    invoke-direct {p0, p2}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 4
    .parameter "orientation"

    .prologue
    const/4 v1, 0x1

    .line 4473
    iget-object v2, p0, Lcom/android/launcher2/Launcher$30;->this$0:Lcom/android/launcher2/Launcher;

    #calls: Lcom/android/launcher2/Launcher;->roundOrientation(I)I
    invoke-static {v2, p1}, Lcom/android/launcher2/Launcher;->access$3100(Lcom/android/launcher2/Launcher;I)I

    move-result p1

    .line 4474
    iget-object v2, p0, Lcom/android/launcher2/Launcher$30;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mLastOrientation:I
    invoke-static {v2}, Lcom/android/launcher2/Launcher;->access$3200(Lcom/android/launcher2/Launcher;)I

    move-result v2

    if-eq p1, v2, :cond_3

    .line 4475
    iget-object v2, p0, Lcom/android/launcher2/Launcher$30;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mLastOrientation:I
    invoke-static {v2}, Lcom/android/launcher2/Launcher;->access$3200(Lcom/android/launcher2/Launcher;)I

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/launcher2/Launcher$30;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mLastOrientation:I
    invoke-static {v2}, Lcom/android/launcher2/Launcher;->access$3200(Lcom/android/launcher2/Launcher;)I

    move-result v2

    const/16 v3, 0xb4

    if-ne v2, v3, :cond_2

    .line 4476
    :cond_0
    const/16 v2, 0x10e

    if-eq p1, v2, :cond_1

    const/16 v2, 0x5a

    if-ne p1, v2, :cond_2

    .line 4477
    :cond_1
    iget-object v2, p0, Lcom/android/launcher2/Launcher$30;->this$0:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "accelerometer_rotation"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_4

    .line 4479
    .local v1, isRotateEnabled:Z
    :goto_0
    if-eqz v1, :cond_2

    .line 4480
    iget-object v2, p0, Lcom/android/launcher2/Launcher$30;->this$0:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "landscape_launcher"

    invoke-static {v2, v3}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 4482
    .local v0, cmpName:Ljava/lang/String;
    if-eqz v0, :cond_2

    const-string v2, "none"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 4483
    iget-object v2, p0, Lcom/android/launcher2/Launcher$30;->this$0:Lcom/android/launcher2/Launcher;

    #calls: Lcom/android/launcher2/Launcher;->fireAppRotated(Ljava/lang/String;)V
    invoke-static {v2, v0}, Lcom/android/launcher2/Launcher;->access$3300(Lcom/android/launcher2/Launcher;Ljava/lang/String;)V

    .line 4488
    .end local v0           #cmpName:Ljava/lang/String;
    .end local v1           #isRotateEnabled:Z
    :cond_2
    iget-object v2, p0, Lcom/android/launcher2/Launcher$30;->this$0:Lcom/android/launcher2/Launcher;

    #setter for: Lcom/android/launcher2/Launcher;->mLastOrientation:I
    invoke-static {v2, p1}, Lcom/android/launcher2/Launcher;->access$3202(Lcom/android/launcher2/Launcher;I)I

    .line 4490
    :cond_3
    return-void

    .line 4477
    :cond_4
    const/4 v1, 0x0

    goto :goto_0
.end method
