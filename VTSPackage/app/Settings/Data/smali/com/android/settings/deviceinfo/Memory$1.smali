.class Lcom/android/settings/deviceinfo/Memory$1;
.super Landroid/content/BroadcastReceiver;
.source "Memory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/deviceinfo/Memory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/deviceinfo/Memory;


# direct methods
.method constructor <init>(Lcom/android/settings/deviceinfo/Memory;)V
    .locals 0
    .parameter

    .prologue
    .line 143
    iput-object p1, p0, Lcom/android/settings/deviceinfo/Memory$1;->this$0:Lcom/android/settings/deviceinfo/Memory;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 12
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 146
    const-string v10, "MemorySettings"

    const-string v11, "Receive dynamic sd swap broadcast"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    iget-object v10, p0, Lcom/android/settings/deviceinfo/Memory$1;->this$0:Lcom/android/settings/deviceinfo/Memory;

    #getter for: Lcom/android/settings/deviceinfo/Memory;->mStorageManager:Landroid/os/storage/StorageManager;
    invoke-static {v10}, Lcom/android/settings/deviceinfo/Memory;->access$000(Lcom/android/settings/deviceinfo/Memory;)Landroid/os/storage/StorageManager;

    move-result-object v10

    invoke-virtual {v10}, Landroid/os/storage/StorageManager;->getVolumeList()[Landroid/os/storage/StorageVolume;

    move-result-object v7

    .line 149
    .local v7, newVolumes:[Landroid/os/storage/StorageVolume;
    move-object v0, v7

    .local v0, arr$:[Landroid/os/storage/StorageVolume;
    array-length v5, v0

    .local v5, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    move v4, v3

    .end local v0           #arr$:[Landroid/os/storage/StorageVolume;
    .end local v3           #i$:I
    .end local v5           #len$:I
    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_4

    aget-object v9, v0, v4

    .line 151
    .local v9, volume:Landroid/os/storage/StorageVolume;
    iget-object v10, p0, Lcom/android/settings/deviceinfo/Memory$1;->this$0:Lcom/android/settings/deviceinfo/Memory;

    #getter for: Lcom/android/settings/deviceinfo/Memory;->mCategories:Ljava/util/ArrayList;
    invoke-static {v10}, Lcom/android/settings/deviceinfo/Memory;->access$100(Lcom/android/settings/deviceinfo/Memory;)Ljava/util/ArrayList;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .end local v4           #i$:I
    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;

    .line 152
    .local v2, category:Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;
    if-eqz v9, :cond_0

    invoke-virtual {v2}, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;->getStorageVolume()Landroid/os/storage/StorageVolume;

    move-result-object v10

    if-eqz v10, :cond_0

    .line 153
    invoke-virtual {v9}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v2}, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;->getStorageVolume()Landroid/os/storage/StorageVolume;

    move-result-object v11

    invoke-virtual {v11}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 155
    invoke-virtual {v2, v9}, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;->setStorageVolume(Landroid/os/storage/StorageVolume;)V

    .line 156
    invoke-virtual {v2}, Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;->updateStorageVolumePrefCategory()V

    goto :goto_1

    .line 162
    .end local v2           #category:Lcom/android/settings/deviceinfo/StorageVolumePreferenceCategory;
    :cond_1
    iget-object v10, p0, Lcom/android/settings/deviceinfo/Memory$1;->this$0:Lcom/android/settings/deviceinfo/Memory;

    #getter for: Lcom/android/settings/deviceinfo/Memory;->mStorageWritePathGroup:[Lcom/android/settings/deviceinfo/RadioButtonPreference;
    invoke-static {v10}, Lcom/android/settings/deviceinfo/Memory;->access$200(Lcom/android/settings/deviceinfo/Memory;)[Lcom/android/settings/deviceinfo/RadioButtonPreference;

    move-result-object v1

    .local v1, arr$:[Lcom/android/settings/deviceinfo/RadioButtonPreference;
    array-length v6, v1

    .local v6, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_2
    if-ge v3, v6, :cond_3

    aget-object v8, v1, v3

    .line 163
    .local v8, pref:Lcom/android/settings/deviceinfo/RadioButtonPreference;
    invoke-virtual {v9}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->getPath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 164
    iget-object v10, p0, Lcom/android/settings/deviceinfo/Memory$1;->this$0:Lcom/android/settings/deviceinfo/Memory;

    invoke-virtual {v10}, Lcom/android/settings/deviceinfo/Memory;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Lcom/android/settings/deviceinfo/RadioButtonPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 162
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 149
    .end local v8           #pref:Lcom/android/settings/deviceinfo/RadioButtonPreference;
    :cond_3
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    .end local v3           #i$:I
    .restart local v4       #i$:I
    goto :goto_0

    .line 169
    .end local v1           #arr$:[Lcom/android/settings/deviceinfo/RadioButtonPreference;
    .end local v6           #len$:I
    .end local v9           #volume:Landroid/os/storage/StorageVolume;
    :cond_4
    iget-object v10, p0, Lcom/android/settings/deviceinfo/Memory$1;->this$0:Lcom/android/settings/deviceinfo/Memory;

    #calls: Lcom/android/settings/deviceinfo/Memory;->dynamicShowDefaultWriteCategory()V
    invoke-static {v10}, Lcom/android/settings/deviceinfo/Memory;->access$300(Lcom/android/settings/deviceinfo/Memory;)V

    .line 172
    iget-object v10, p0, Lcom/android/settings/deviceinfo/Memory$1;->this$0:Lcom/android/settings/deviceinfo/Memory;

    #calls: Lcom/android/settings/deviceinfo/Memory;->resetInstallLocation(Landroid/content/Intent;[Landroid/os/storage/StorageVolume;)V
    invoke-static {v10, p2, v7}, Lcom/android/settings/deviceinfo/Memory;->access$400(Lcom/android/settings/deviceinfo/Memory;Landroid/content/Intent;[Landroid/os/storage/StorageVolume;)V

    .line 173
    return-void
.end method
