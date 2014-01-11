.class Lcom/android/providers/settings/SettingsProvider$CachePrefetchThread;
.super Ljava/lang/Thread;
.source "SettingsProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/providers/settings/SettingsProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CachePrefetchThread"
.end annotation


# instance fields
.field private mUserHandle:I

.field final synthetic this$0:Lcom/android/providers/settings/SettingsProvider;


# direct methods
.method constructor <init>(Lcom/android/providers/settings/SettingsProvider;I)V
    .locals 1
    .parameter
    .parameter "userHandle"

    .prologue
    .line 421
    iput-object p1, p0, Lcom/android/providers/settings/SettingsProvider$CachePrefetchThread;->this$0:Lcom/android/providers/settings/SettingsProvider;

    .line 422
    const-string v0, "populate-settings-caches"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 423
    iput p2, p0, Lcom/android/providers/settings/SettingsProvider$CachePrefetchThread;->mUserHandle:I

    .line 424
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 428
    iget-object v0, p0, Lcom/android/providers/settings/SettingsProvider$CachePrefetchThread;->this$0:Lcom/android/providers/settings/SettingsProvider;

    iget v1, p0, Lcom/android/providers/settings/SettingsProvider$CachePrefetchThread;->mUserHandle:I

    #calls: Lcom/android/providers/settings/SettingsProvider;->fullyPopulateCaches(I)V
    invoke-static {v0, v1}, Lcom/android/providers/settings/SettingsProvider;->access$100(Lcom/android/providers/settings/SettingsProvider;I)V

    .line 429
    return-void
.end method
