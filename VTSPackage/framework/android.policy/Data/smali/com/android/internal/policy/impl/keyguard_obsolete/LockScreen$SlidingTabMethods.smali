.class Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;
.super Ljava/lang/Object;
.source "LockScreen.java"

# interfaces
.implements Lcom/android/internal/widget/SlidingTab$OnTriggerListener;
.implements Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$UnlockWidgetCommonMethods;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SlidingTabMethods"
.end annotation


# instance fields
.field private final mSlidingTab:Lcom/android/internal/widget/SlidingTab;

.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;Lcom/android/internal/widget/SlidingTab;)V
    .locals 0
    .parameter
    .parameter "slidingTab"

    .prologue
    .line 137
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    iput-object p2, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->mSlidingTab:Lcom/android/internal/widget/SlidingTab;

    .line 139
    return-void
.end method


# virtual methods
.method public cleanUp()V
    .locals 2

    .prologue
    .line 202
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->mSlidingTab:Lcom/android/internal/widget/SlidingTab;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/SlidingTab;->setOnTriggerListener(Lcom/android/internal/widget/SlidingTab$OnTriggerListener;)V

    .line 203
    return-void
.end method

.method public getTargetPosition(I)I
    .locals 1
    .parameter "resourceId"

    .prologue
    .line 198
    const/4 v0, -0x1

    return v0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->mSlidingTab:Lcom/android/internal/widget/SlidingTab;

    return-object v0
.end method

.method public onGrabbedStateChange(Landroid/view/View;I)V
    .locals 2
    .parameter "v"
    .parameter "grabbedState"

    .prologue
    .line 169
    const/4 v0, 0x2

    if-ne p2, v0, :cond_0

    .line 170
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->isSilentMode()Z
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->access$600(Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;)Z

    move-result v1

    #setter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->mSilentMode:Z
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->access$002(Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;Z)Z

    .line 171
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->mSlidingTab:Lcom/android/internal/widget/SlidingTab;

    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->mSilentMode:Z
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->access$000(Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;)Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x1040318

    :goto_0
    invoke-virtual {v1, v0}, Lcom/android/internal/widget/SlidingTab;->setRightHintText(I)V

    .line 177
    :cond_0
    if-eqz p2, :cond_1

    .line 178
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->mCallback:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->access$400(Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;)Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;->pokeWakelock()V

    .line 180
    :cond_1
    return-void

    .line 171
    :cond_2
    const v0, 0x1040319

    goto :goto_0
.end method

.method public onTrigger(Landroid/view/View;I)V
    .locals 1
    .parameter "v"
    .parameter "whichHandle"

    .prologue
    .line 159
    const/4 v0, 0x1

    if-ne p2, v0, :cond_1

    .line 160
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->mCallback:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->access$400(Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;)Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;->goToUnlockScreen()V

    .line 165
    :cond_0
    :goto_0
    return-void

    .line 161
    :cond_1
    const/4 v0, 0x2

    if-ne p2, v0, :cond_0

    .line 162
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->toggleRingMode()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->access$500(Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;)V

    .line 163
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->mCallback:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->access$400(Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;)Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;->pokeWakelock()V

    goto :goto_0
.end method

.method public ping()V
    .locals 0

    .prologue
    .line 191
    return-void
.end method

.method public reset(Z)V
    .locals 1
    .parameter "animate"

    .prologue
    .line 187
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->mSlidingTab:Lcom/android/internal/widget/SlidingTab;

    invoke-virtual {v0, p1}, Lcom/android/internal/widget/SlidingTab;->reset(Z)V

    .line 188
    return-void
.end method

.method public setEnabled(IZ)V
    .locals 0
    .parameter "resourceId"
    .parameter "enabled"

    .prologue
    .line 195
    return-void
.end method

.method public updateResources()V
    .locals 6

    .prologue
    const/4 v0, 0x1

    .line 142
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->mSilentMode:Z
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->access$000(Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->access$300(Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;)Landroid/media/AudioManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v1

    if-ne v1, v0, :cond_0

    .line 145
    .local v0, vibe:Z
    :goto_0
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->mSlidingTab:Lcom/android/internal/widget/SlidingTab;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->mSilentMode:Z
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->access$000(Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;)Z

    move-result v1

    if-eqz v1, :cond_2

    if-eqz v0, :cond_1

    const v1, 0x10802d8

    :goto_1
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->mSilentMode:Z
    invoke-static {v2}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->access$000(Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;)Z

    move-result v2

    if-eqz v2, :cond_3

    const v2, 0x10803b2

    :goto_2
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->mSilentMode:Z
    invoke-static {v3}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->access$000(Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;)Z

    move-result v3

    if-eqz v3, :cond_4

    const v3, 0x108039b

    :goto_3
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$SlidingTabMethods;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->mSilentMode:Z
    invoke-static {v4}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->access$000(Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;)Z

    move-result v4

    if-eqz v4, :cond_5

    const v4, 0x10803ae

    :goto_4
    invoke-virtual {v5, v1, v2, v3, v4}, Lcom/android/internal/widget/SlidingTab;->setRightTabResources(IIII)V

    .line 155
    return-void

    .line 142
    .end local v0           #vibe:Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 145
    .restart local v0       #vibe:Z
    :cond_1
    const v1, 0x10802d5

    goto :goto_1

    :cond_2
    const v1, 0x10802d6

    goto :goto_1

    :cond_3
    const v2, 0x10803af

    goto :goto_2

    :cond_4
    const v3, 0x108039a

    goto :goto_3

    :cond_5
    const v4, 0x10803ad

    goto :goto_4
.end method
