.class Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$1;
.super Landroid/os/AsyncTask;
.source "HiddenAppsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 63
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$1;->this$0:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$1;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 1
    .parameter "params"

    .prologue
    .line 75
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$1;->this$0:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;

    #calls: Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->refreshApps()V
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->access$100(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;)V

    .line 76
    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 63
    check-cast p1, Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$1;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 2
    .parameter "result"

    .prologue
    const/4 v1, 0x0

    .line 67
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$1;->this$0:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;

    #calls: Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->restore()V
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->access$000(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;)V

    .line 68
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$1;->this$0:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->setProgressBarIndeterminateVisibility(Z)V

    .line 69
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$1;->this$0:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->setProgressBarIndeterminate(Z)V

    .line 70
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 71
    return-void
.end method
