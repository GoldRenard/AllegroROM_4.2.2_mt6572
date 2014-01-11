.class Lcom/mediatek/oobe/basic/gemini/SimManagement$6;
.super Ljava/lang/Object;
.source "SimManagement.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/oobe/basic/gemini/SimManagement;->onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V
    .locals 0
    .parameter

    .prologue
    .line 968
    iput-object p1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$6;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "dialog"

    .prologue
    .line 972
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$6;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateGprsSettings()V

    .line 973
    return-void
.end method
