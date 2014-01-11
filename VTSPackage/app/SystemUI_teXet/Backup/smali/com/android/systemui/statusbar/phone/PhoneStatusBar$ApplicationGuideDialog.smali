.class Lcom/android/systemui/statusbar/phone/PhoneStatusBar$ApplicationGuideDialog;
.super Landroid/app/Dialog;
.source "PhoneStatusBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/phone/PhoneStatusBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ApplicationGuideDialog"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;


# direct methods
.method public constructor <init>(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;Landroid/content/Context;I)V
    .registers 4
    .parameter
    .parameter "context"
    .parameter "theme"

    .prologue
    .line 3319
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$ApplicationGuideDialog;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    .line 3320
    invoke-direct {p0, p2, p3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 3321
    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .registers 2

    .prologue
    .line 3341
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$ApplicationGuideDialog;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    invoke-static {v0}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->access$3300(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 3342
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$ApplicationGuideDialog;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->animateCollapsePanels()V

    .line 3343
    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    .line 3344
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 8
    .parameter "savedInstanceState"

    .prologue
    .line 3325
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 3326
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$ApplicationGuideDialog;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    iget-object v3, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$ApplicationGuideDialog;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    iget-object v3, v3, Lcom/android/systemui/SystemUI;->mContext:Landroid/content/Context;

    const/high16 v4, 0x7f04

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->access$4702(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;Landroid/view/View;)Landroid/view/View;

    .line 3327
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$ApplicationGuideDialog;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    invoke-static {v2}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->access$4700(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$ApplicationGuideDialog;->setContentView(Landroid/view/View;)V

    .line 3329
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$ApplicationGuideDialog;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    iget-object v2, v2, Lcom/android/systemui/SystemUI;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getThemeMainColor()I

    move-result v1

    .line 3330
    .local v1, themeMainColor:I
    if-eqz v1, :cond_3c

    .line 3331
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$ApplicationGuideDialog;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    invoke-static {v2}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->access$4700(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;)Landroid/view/View;

    move-result-object v2

    const v3, 0x7f080006

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 3332
    .local v0, applicationGuideTitle:Landroid/widget/TextView;
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3335
    .end local v0           #applicationGuideTitle:Landroid/widget/TextView;
    :cond_3c
    iget-object v3, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$ApplicationGuideDialog;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$ApplicationGuideDialog;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    invoke-static {v2}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->access$4700(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;)Landroid/view/View;

    move-result-object v2

    const v4, 0x7f080007

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    invoke-static {v3, v2}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->access$4802(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;Landroid/widget/Button;)Landroid/widget/Button;

    .line 3336
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$ApplicationGuideDialog;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    invoke-static {v2}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->access$4800(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;)Landroid/widget/Button;

    move-result-object v2

    iget-object v3, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar$ApplicationGuideDialog;->this$0:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    invoke-static {v3}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->access$4900(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 3337
    return-void
.end method
