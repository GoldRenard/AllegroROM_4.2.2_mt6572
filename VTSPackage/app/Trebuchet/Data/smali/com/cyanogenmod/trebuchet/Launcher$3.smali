.class Lcom/cyanogenmod/trebuchet/Launcher$3;
.super Ljava/lang/Thread;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->checkForLocaleChange()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;

.field final synthetic val$localeConfiguration:Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;Ljava/lang/String;Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter

    .prologue
    .line 537
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$3;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/Launcher$3;->val$localeConfiguration:Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 540
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$3;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$3;->val$localeConfiguration:Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;

    #calls: Lcom/cyanogenmod/trebuchet/Launcher;->writeConfiguration(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;)V
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->access$600(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;)V

    .line 541
    return-void
.end method
