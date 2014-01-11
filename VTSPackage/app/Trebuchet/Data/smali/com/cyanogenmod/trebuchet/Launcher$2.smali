.class Lcom/cyanogenmod/trebuchet/Launcher$2;
.super Landroid/os/AsyncTask;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->checkForLocaleChange()V
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
        "Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;)V
    .locals 0
    .parameter

    .prologue
    .line 499
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$2;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;
    .locals 2
    .parameter "unused"

    .prologue
    .line 502
    new-instance v0, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;-><init>(Lcom/cyanogenmod/trebuchet/Launcher$1;)V

    .line 503
    .local v0, localeConfiguration:Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$2;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #calls: Lcom/cyanogenmod/trebuchet/Launcher;->readConfiguration(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;)V
    invoke-static {v1, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$300(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;)V

    .line 504
    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 499
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher$2;->doInBackground([Ljava/lang/Void;)Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;)V
    .locals 1
    .parameter "result"

    .prologue
    .line 509
    invoke-static {p1}, Lcom/cyanogenmod/trebuchet/Launcher;->access$402(Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;)Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;

    .line 510
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$2;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #calls: Lcom/cyanogenmod/trebuchet/Launcher;->checkForLocaleChange()V
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$500(Lcom/cyanogenmod/trebuchet/Launcher;)V

    .line 511
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 499
    check-cast p1, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher$2;->onPostExecute(Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;)V

    return-void
.end method
