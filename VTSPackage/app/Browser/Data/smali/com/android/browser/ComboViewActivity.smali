.class public Lcom/android/browser/ComboViewActivity;
.super Landroid/app/Activity;
.source "ComboViewActivity.java"

# interfaces
.implements Lcom/android/browser/CombinedBookmarksCallbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/ComboViewActivity$1;,
        Lcom/android/browser/ComboViewActivity$TabsAdapter;
    }
.end annotation


# static fields
.field public static final EXTRA_COMBO_ARGS:Ljava/lang/String; = "combo_args"

.field public static final EXTRA_CURRENT_URL:Ljava/lang/String; = "url"

.field public static final EXTRA_INITIAL_VIEW:Ljava/lang/String; = "initial_view"

.field public static final EXTRA_OPEN_ALL:Ljava/lang/String; = "open_all"

.field public static final EXTRA_OPEN_SNAPSHOT:Ljava/lang/String; = "snapshot_id"

.field private static final LOGTAG:Ljava/lang/String; = "browser"

.field private static final STATE_SELECTED_TAB:Ljava/lang/String; = "tab"


# instance fields
.field private mSearchMenu:Landroid/view/MenuItem;

.field private mSearchView:Landroid/widget/SearchView;

.field private mTabsAdapter:Lcom/android/browser/ComboViewActivity$TabsAdapter;

.field private mViewPager:Landroid/support/v4/view/ViewPager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 192
    return-void
.end method

.method private static makeFragmentName(II)Ljava/lang/String;
    .locals 2
    .parameter "viewId"
    .parameter "index"

    .prologue
    .line 274
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "android:switcher:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 128
    invoke-virtual {p0}, Lcom/android/browser/ComboViewActivity;->finish()V

    .line 129
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 11
    .parameter "savedInstanceState"

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 56
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 57
    invoke-virtual {p0, v8}, Lcom/android/browser/ComboViewActivity;->setResult(I)V

    .line 58
    invoke-virtual {p0}, Lcom/android/browser/ComboViewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    .line 59
    .local v2, extras:Landroid/os/Bundle;
    const-string v5, "combo_args"

    invoke-virtual {v2, v5}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 60
    .local v0, args:Landroid/os/Bundle;
    const-string v5, "initial_view"

    const/4 v6, 0x0

    invoke-virtual {v2, v5, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 61
    .local v4, svStr:Ljava/lang/String;
    if-eqz v4, :cond_0

    invoke-static {v4}, Lcom/android/browser/UI$ComboViews;->valueOf(Ljava/lang/String;)Lcom/android/browser/UI$ComboViews;

    move-result-object v3

    .line 64
    .local v3, startingView:Lcom/android/browser/UI$ComboViews;
    :goto_0
    new-instance v5, Landroid/support/v4/view/ViewPager;

    invoke-direct {v5, p0}, Landroid/support/v4/view/ViewPager;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/android/browser/ComboViewActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 65
    iget-object v5, p0, Lcom/android/browser/ComboViewActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    const v6, 0x7f0d0003

    invoke-virtual {v5, v6}, Landroid/support/v4/view/ViewPager;->setId(I)V

    .line 66
    iget-object v5, p0, Lcom/android/browser/ComboViewActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {p0, v5}, Lcom/android/browser/ComboViewActivity;->setContentView(Landroid/view/View;)V

    .line 68
    invoke-virtual {p0}, Lcom/android/browser/ComboViewActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    .line 69
    .local v1, bar:Landroid/app/ActionBar;
    invoke-virtual {v1, v10}, Landroid/app/ActionBar;->setNavigationMode(I)V

    .line 70
    invoke-static {p0}, Lcom/android/browser/BrowserActivity;->isTablet(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 71
    const/4 v5, 0x3

    invoke-virtual {v1, v5}, Landroid/app/ActionBar;->setDisplayOptions(I)V

    .line 73
    invoke-virtual {v1, v9}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 78
    :goto_1
    new-instance v5, Lcom/android/browser/ComboViewActivity$TabsAdapter;

    iget-object v6, p0, Lcom/android/browser/ComboViewActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-direct {v5, p0, v6}, Lcom/android/browser/ComboViewActivity$TabsAdapter;-><init>(Landroid/app/Activity;Landroid/support/v4/view/ViewPager;)V

    iput-object v5, p0, Lcom/android/browser/ComboViewActivity;->mTabsAdapter:Lcom/android/browser/ComboViewActivity$TabsAdapter;

    .line 79
    iget-object v5, p0, Lcom/android/browser/ComboViewActivity;->mTabsAdapter:Lcom/android/browser/ComboViewActivity$TabsAdapter;

    invoke-virtual {v1}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v6

    const v7, 0x7f0c004c

    invoke-virtual {v6, v7}, Landroid/app/ActionBar$Tab;->setText(I)Landroid/app/ActionBar$Tab;

    move-result-object v6

    const-class v7, Lcom/android/browser/BrowserBookmarksPage;

    invoke-virtual {v5, v6, v7, v0}, Lcom/android/browser/ComboViewActivity$TabsAdapter;->addTab(Landroid/app/ActionBar$Tab;Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 81
    iget-object v5, p0, Lcom/android/browser/ComboViewActivity;->mTabsAdapter:Lcom/android/browser/ComboViewActivity$TabsAdapter;

    invoke-virtual {v1}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v6

    const v7, 0x7f0c004e

    invoke-virtual {v6, v7}, Landroid/app/ActionBar$Tab;->setText(I)Landroid/app/ActionBar$Tab;

    move-result-object v6

    const-class v7, Lcom/android/browser/BrowserHistoryPage;

    invoke-virtual {v5, v6, v7, v0}, Lcom/android/browser/ComboViewActivity$TabsAdapter;->addTab(Landroid/app/ActionBar$Tab;Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 83
    iget-object v5, p0, Lcom/android/browser/ComboViewActivity;->mTabsAdapter:Lcom/android/browser/ComboViewActivity$TabsAdapter;

    invoke-virtual {v1}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v6

    const v7, 0x7f0c004f

    invoke-virtual {v6, v7}, Landroid/app/ActionBar$Tab;->setText(I)Landroid/app/ActionBar$Tab;

    move-result-object v6

    const-class v7, Lcom/android/browser/BrowserSnapshotPage;

    invoke-virtual {v5, v6, v7, v0}, Lcom/android/browser/ComboViewActivity$TabsAdapter;->addTab(Landroid/app/ActionBar$Tab;Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 86
    if-eqz p1, :cond_2

    .line 87
    const-string v5, "tab"

    invoke-virtual {p1, v5, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    invoke-virtual {v1, v5}, Landroid/app/ActionBar;->setSelectedNavigationItem(I)V

    .line 102
    :goto_2
    return-void

    .line 61
    .end local v1           #bar:Landroid/app/ActionBar;
    .end local v3           #startingView:Lcom/android/browser/UI$ComboViews;
    :cond_0
    sget-object v3, Lcom/android/browser/UI$ComboViews;->Bookmarks:Lcom/android/browser/UI$ComboViews;

    goto :goto_0

    .line 75
    .restart local v1       #bar:Landroid/app/ActionBar;
    .restart local v3       #startingView:Lcom/android/browser/UI$ComboViews;
    :cond_1
    invoke-virtual {v1, v8}, Landroid/app/ActionBar;->setDisplayOptions(I)V

    goto :goto_1

    .line 90
    :cond_2
    sget-object v5, Lcom/android/browser/ComboViewActivity$1;->$SwitchMap$com$android$browser$UI$ComboViews:[I

    invoke-virtual {v3}, Lcom/android/browser/UI$ComboViews;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    goto :goto_2

    .line 92
    :pswitch_0
    iget-object v5, p0, Lcom/android/browser/ComboViewActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v5, v8}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    goto :goto_2

    .line 95
    :pswitch_1
    iget-object v5, p0, Lcom/android/browser/ComboViewActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v5, v9}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    goto :goto_2

    .line 98
    :pswitch_2
    iget-object v5, p0, Lcom/android/browser/ComboViewActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v5, v10}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    goto :goto_2

    .line 90
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 5
    .parameter "menu"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 141
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 143
    invoke-virtual {p0}, Lcom/android/browser/ComboViewActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    const v2, 0x7f100005

    invoke-virtual {v1, v2, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 144
    const v1, 0x7f0d00f1

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/ComboViewActivity;->mSearchMenu:Landroid/view/MenuItem;

    .line 146
    iget-object v1, p0, Lcom/android/browser/ComboViewActivity;->mSearchMenu:Landroid/view/MenuItem;

    invoke-interface {v1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/SearchView;

    iput-object v1, p0, Lcom/android/browser/ComboViewActivity;->mSearchView:Landroid/widget/SearchView;

    .line 147
    const-string v1, "search"

    invoke-virtual {p0, v1}, Lcom/android/browser/ComboViewActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/SearchManager;

    .line 148
    .local v0, searchManager:Landroid/app/SearchManager;
    iget-object v1, p0, Lcom/android/browser/ComboViewActivity;->mSearchView:Landroid/widget/SearchView;

    invoke-virtual {p0}, Lcom/android/browser/ComboViewActivity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/SearchManager;->getSearchableInfo(Landroid/content/ComponentName;)Landroid/app/SearchableInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/SearchView;->setSearchableInfo(Landroid/app/SearchableInfo;)V

    .line 149
    iget-object v1, p0, Lcom/android/browser/ComboViewActivity;->mSearchView:Landroid/widget/SearchView;

    invoke-virtual {v1, v4}, Landroid/widget/SearchView;->setQueryRefinementEnabled(Z)V

    .line 151
    iget-object v1, p0, Lcom/android/browser/ComboViewActivity;->mSearchMenu:Landroid/view/MenuItem;

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 152
    iget-object v1, p0, Lcom/android/browser/ComboViewActivity;->mSearchMenu:Landroid/view/MenuItem;

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 154
    return v4
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 5
    .parameter "item"

    .prologue
    const/4 v2, 0x1

    .line 160
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v4, 0x102002c

    if-ne v3, v4, :cond_0

    .line 161
    invoke-virtual {p0}, Lcom/android/browser/ComboViewActivity;->finish()V

    .line 170
    :goto_0
    return v2

    .line 163
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v4, 0x7f0d00bb

    if-ne v3, v4, :cond_1

    .line 164
    invoke-virtual {p0}, Lcom/android/browser/ComboViewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "url"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 165
    .local v1, url:Ljava/lang/String;
    new-instance v0, Landroid/content/Intent;

    const-class v3, Lcom/android/browser/BrowserPreferencesPage;

    invoke-direct {v0, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 166
    .local v0, intent:Landroid/content/Intent;
    const-string v3, "currentPage"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 167
    const/4 v3, 0x3

    invoke-virtual {p0, v0, v3}, Lcom/android/browser/ComboViewActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 170
    .end local v0           #intent:Landroid/content/Intent;
    .end local v1           #url:Ljava/lang/String;
    :cond_1
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 106
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 107
    const-string v0, "tab"

    invoke-virtual {p0}, Lcom/android/browser/ComboViewActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ActionBar;->getSelectedNavigationIndex()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 109
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lcom/android/browser/ComboViewActivity;->mSearchMenu:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    .line 176
    iget-object v0, p0, Lcom/android/browser/ComboViewActivity;->mSearchMenu:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->expandActionView()Z

    .line 178
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public varargs openInNewTab([Ljava/lang/String;)V
    .locals 2
    .parameter "urls"

    .prologue
    .line 120
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 121
    .local v0, i:Landroid/content/Intent;
    const-string v1, "open_all"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 122
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/android/browser/ComboViewActivity;->setResult(ILandroid/content/Intent;)V

    .line 123
    invoke-virtual {p0}, Lcom/android/browser/ComboViewActivity;->finish()V

    .line 124
    return-void
.end method

.method public openSnapshot(J)V
    .locals 2
    .parameter "id"

    .prologue
    .line 133
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 134
    .local v0, i:Landroid/content/Intent;
    const-string v1, "snapshot_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 135
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/android/browser/ComboViewActivity;->setResult(ILandroid/content/Intent;)V

    .line 136
    invoke-virtual {p0}, Lcom/android/browser/ComboViewActivity;->finish()V

    .line 137
    return-void
.end method

.method public openUrl(Ljava/lang/String;)V
    .locals 3
    .parameter "url"

    .prologue
    .line 113
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 114
    .local v0, i:Landroid/content/Intent;
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/android/browser/ComboViewActivity;->setResult(ILandroid/content/Intent;)V

    .line 115
    invoke-virtual {p0}, Lcom/android/browser/ComboViewActivity;->finish()V

    .line 116
    return-void
.end method
