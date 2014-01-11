.class public Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;
.super Landroid/app/ListActivity;
.source "HiddenAppsActivity.java"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;
    }
.end annotation


# static fields
.field private static final MENU_DELETE:I


# instance fields
.field private mAppsAdapter:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;

.field private mPackageManager:Landroid/content/pm/PackageManager;

.field private mSaved:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    .line 184
    return-void
.end method

.method static synthetic access$000(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->restore()V

    return-void
.end method

.method static synthetic access$100(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->refreshApps()V

    return-void
.end method

.method static synthetic access$200(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;)Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mAppsAdapter:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;

    return-object v0
.end method

.method static synthetic access$300(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;)Landroid/content/pm/PackageManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mPackageManager:Landroid/content/pm/PackageManager;

    return-object v0
.end method

.method static synthetic access$402(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mSaved:Z

    return p1
.end method

.method private delete()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 152
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ListView;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 153
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {v1, v0, v2}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 152
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 156
    :cond_0
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mSaved:Z

    .line 157
    return-void
.end method

.method private refreshApps()V
    .locals 4

    .prologue
    .line 160
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.MAIN"

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 161
    .local v1, mainIntent:Landroid/content/Intent;
    const-string v2, "android.intent.category.LAUNCHER"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 162
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mPackageManager:Landroid/content/pm/PackageManager;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 163
    .local v0, apps:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    new-instance v2, Landroid/content/pm/ResolveInfo$DisplayNameComparator;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-direct {v2, v3}, Landroid/content/pm/ResolveInfo$DisplayNameComparator;-><init>(Landroid/content/pm/PackageManager;)V

    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 165
    new-instance v2, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$2;

    invoke-direct {v2, p0, v0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$2;-><init>(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;Ljava/util/List;)V

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 172
    return-void
.end method

.method private restore()V
    .locals 12

    .prologue
    const/4 v11, 0x1

    .line 113
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 114
    .local v0, apps:Ljava/util/List;,"Ljava/util/List<Landroid/content/ComponentName;>;"
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v8

    const-string v9, "ui_drawer_hidden_apps"

    const-string v10, ""

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "\\|"

    invoke-virtual {v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 116
    .local v3, flattened:[Ljava/lang/String;
    move-object v1, v3

    .local v1, arr$:[Ljava/lang/String;
    array-length v7, v1

    .local v7, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_0
    if-ge v5, v7, :cond_0

    aget-object v2, v1, v5

    .line 117
    .local v2, flat:Ljava/lang/String;
    invoke-static {v2}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v8

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 120
    .end local v2           #flat:Ljava/lang/String;
    :cond_0
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->getListAdapter()Landroid/widget/ListAdapter;

    move-result-object v8

    invoke-interface {v8}, Landroid/widget/ListAdapter;->getCount()I

    move-result v8

    if-ge v4, v8, :cond_2

    .line 121
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->getListAdapter()Landroid/widget/ListAdapter;

    move-result-object v8

    invoke-interface {v8, v4}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/pm/ResolveInfo;

    .line 122
    .local v6, info:Landroid/content/pm/ResolveInfo;
    new-instance v8, Landroid/content/ComponentName;

    iget-object v9, v6, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v9, v9, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v10, v6, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v10, v10, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v8, v9, v10}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 123
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->getListView()Landroid/widget/ListView;

    move-result-object v8

    invoke-virtual {v8, v4, v11}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 120
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 127
    .end local v6           #info:Landroid/content/pm/ResolveInfo;
    :cond_2
    iput-boolean v11, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mSaved:Z

    .line 129
    return-void
.end method

.method private save()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    .line 89
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mSaved:Z

    if-nez v5, :cond_3

    .line 90
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, ""

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .local v4, string:Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->getListView()Landroid/widget/ListView;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/ListView;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v1

    .line 94
    .local v1, checked:Landroid/util/SparseBooleanArray;
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    invoke-virtual {v1}, Landroid/util/SparseBooleanArray;->size()I

    move-result v5

    if-ge v3, v5, :cond_2

    .line 95
    invoke-virtual {v1, v3}, Landroid/util/SparseBooleanArray;->valueAt(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 96
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->getListView()Landroid/widget/ListView;

    move-result-object v5

    invoke-virtual {v1, v3}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    .line 97
    .local v0, app:Landroid/content/pm/ResolveInfo;
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_0

    const-string v5, "|"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    :cond_0
    new-instance v5, Landroid/content/ComponentName;

    iget-object v6, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v6, v6, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v7, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v7, v7, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v5, v6, v7}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .end local v0           #app:Landroid/content/pm/ResolveInfo;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 103
    :cond_2
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 104
    .local v2, editor:Landroid/content/SharedPreferences$Editor;
    const-string v5, "ui_drawer_hidden_apps"

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 105
    const-string v5, "preferences_changed"

    invoke-interface {v2, v5, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 106
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 108
    iput-boolean v8, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mSaved:Z

    .line 110
    .end local v1           #checked:Landroid/util/SparseBooleanArray;
    .end local v2           #editor:Landroid/content/SharedPreferences$Editor;
    .end local v3           #i:I
    .end local v4           #string:Ljava/lang/StringBuilder;
    :cond_3
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 47
    const/4 v1, 0x5

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->requestWindowFeature(I)Z

    .line 48
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 50
    const v1, 0x7f09000f

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->setTitle(I)V

    .line 51
    const v1, 0x7f040010

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->setContentView(I)V

    .line 53
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 54
    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->setProgressBarIndeterminateVisibility(Z)V

    .line 55
    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->setProgressBarIndeterminate(Z)V

    .line 57
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 58
    new-instance v1, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;

    const v2, 0x7f040011

    invoke-direct {v1, p0, p0, v2}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;-><init>(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;Landroid/content/Context;I)V

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mAppsAdapter:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;

    .line 59
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mAppsAdapter:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;

    invoke-virtual {v1, v3}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;->setNotifyOnChange(Z)V

    .line 61
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->mAppsAdapter:Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$AppsAdapter;

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 63
    new-instance v0, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$1;

    invoke-direct {v0, p0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity$1;-><init>(Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;)V

    .line 79
    .local v0, refreshAppsTask:Landroid/os/AsyncTask;,"Landroid/os/AsyncTask<Ljava/lang/Void;Ljava/lang/Void;Ljava/lang/Void;>;"
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Void;

    const/4 v2, 0x0

    aput-object v4, v1, v2

    aput-object v4, v1, v3

    const/4 v2, 0x2

    aput-object v4, v1, v2

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 80
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    const/4 v1, 0x0

    .line 134
    const v0, 0x7f09000c

    invoke-interface {p1, v1, v1, v1, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    move-result-object v0

    const/4 v1, 0x5

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsActionFlags(I)Landroid/view/MenuItem;

    .line 138
    const/4 v0, 0x1

    return v0
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 143
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 148
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 145
    :pswitch_0
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->delete()V

    .line 146
    const/4 v0, 0x1

    goto :goto_0

    .line 143
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 3
    .parameter "featureId"
    .parameter "item"

    .prologue
    .line 176
    invoke-super {p0, p1, p2}, Landroid/app/ListActivity;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result v0

    .line 177
    .local v0, result:Z
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x102002c

    if-ne v1, v2, :cond_0

    .line 178
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->finish()V

    .line 179
    const/4 v0, 0x1

    .line 181
    .end local v0           #result:Z
    :cond_0
    return v0
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 84
    invoke-super {p0}, Landroid/app/ListActivity;->onPause()V

    .line 85
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/preference/HiddenAppsActivity;->save()V

    .line 86
    return-void
.end method
