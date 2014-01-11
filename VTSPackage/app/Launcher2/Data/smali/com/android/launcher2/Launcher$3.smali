.class Lcom/android/launcher2/Launcher$3;
.super Ljava/lang/Thread;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Launcher;->checkForLocaleChange()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Launcher;

.field final synthetic val$localeConfiguration:Lcom/android/launcher2/Launcher$LocaleConfiguration;


# direct methods
.method constructor <init>(Lcom/android/launcher2/Launcher;Ljava/lang/String;Lcom/android/launcher2/Launcher$LocaleConfiguration;)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter

    .prologue
    .line 577
    iput-object p1, p0, Lcom/android/launcher2/Launcher$3;->this$0:Lcom/android/launcher2/Launcher;

    iput-object p3, p0, Lcom/android/launcher2/Launcher$3;->val$localeConfiguration:Lcom/android/launcher2/Launcher$LocaleConfiguration;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 580
    iget-object v0, p0, Lcom/android/launcher2/Launcher$3;->this$0:Lcom/android/launcher2/Launcher;

    iget-object v1, p0, Lcom/android/launcher2/Launcher$3;->val$localeConfiguration:Lcom/android/launcher2/Launcher$LocaleConfiguration;

    #calls: Lcom/android/launcher2/Launcher;->writeConfiguration(Landroid/content/Context;Lcom/android/launcher2/Launcher$LocaleConfiguration;)V
    invoke-static {v0, v1}, Lcom/android/launcher2/Launcher;->access$600(Landroid/content/Context;Lcom/android/launcher2/Launcher$LocaleConfiguration;)V

    .line 581
    return-void
.end method
