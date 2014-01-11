.class Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$2;
.super Ljava/lang/Object;
.source "HiddenAppsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->refreshApps()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;

.field final synthetic val$apps:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;Ljava/util/List;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 165
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$2;->this$0:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$2;->val$apps:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 168
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$2;->this$0:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;

    #getter for: Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mAppsAdapter:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->access$200(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;)Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;->clear()V

    .line 169
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$2;->this$0:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;

    #getter for: Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mAppsAdapter:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->access$200(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;)Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$2;->val$apps:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;->addAll(Ljava/util/Collection;)V

    .line 170
    return-void
.end method
