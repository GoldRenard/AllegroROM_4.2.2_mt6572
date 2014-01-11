.class Lcom/mediatek/settings/VTAdvancedSetting$4;
.super Ljava/lang/Object;
.source "VTAdvancedSetting.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/settings/VTAdvancedSetting;->showDialogMyPic(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/VTAdvancedSetting;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/VTAdvancedSetting;)V
    .locals 0
    .parameter

    .prologue
    .line 342
    iput-object p1, p0, Lcom/mediatek/settings/VTAdvancedSetting$4;->this$0:Lcom/mediatek/settings/VTAdvancedSetting;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 349
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.GET_CONTENT"

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 353
    .local v1, intent:Landroid/content/Intent;
    const-string v2, "image/*"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 354
    const-string v2, "crop"

    const-string v3, "true"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 355
    const-string v2, "aspectX"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 356
    const-string v2, "aspectY"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 357
    const-string v2, "outputX"

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSetting$4;->this$0:Lcom/mediatek/settings/VTAdvancedSetting;

    invoke-virtual {v3}, Lcom/mediatek/settings/VTAdvancedSetting;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0b0004

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 360
    const-string v2, "outputY"

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSetting$4;->this$0:Lcom/mediatek/settings/VTAdvancedSetting;

    invoke-virtual {v3}, Lcom/mediatek/settings/VTAdvancedSetting;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0b0005

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 363
    const-string v2, "return-data"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 366
    const-string v2, "scaleUpIfNeeded"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 368
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSetting$4;->this$0:Lcom/mediatek/settings/VTAdvancedSetting;

    const/16 v3, 0xbcd

    invoke-virtual {v2, v1, v3}, Lcom/mediatek/settings/VTAdvancedSetting;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 376
    .end local v1           #intent:Landroid/content/Intent;
    :goto_0
    return-void

    .line 371
    :catch_0
    move-exception v0

    .line 373
    .local v0, e:Landroid/content/ActivityNotFoundException;
    const-string v2, "Pictrue not found , Gallery ActivityNotFoundException !"

    #calls: Lcom/mediatek/settings/VTAdvancedSetting;->log(Ljava/lang/String;)V
    invoke-static {v2}, Lcom/mediatek/settings/VTAdvancedSetting;->access$200(Ljava/lang/String;)V

    goto :goto_0
.end method
