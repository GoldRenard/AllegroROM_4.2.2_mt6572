.class public Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;
.super Landroid/app/TabActivity;
.source "BluetoothShareMgmtActivity.java"


# static fields
.field static inComingTabActivity:Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;

.field static outGoingTabActivity:Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;


# instance fields
.field CurrentTab:Ljava/lang/String;

.field private tabHost:Landroid/widget/TabHost;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 58
    invoke-direct {p0}, Landroid/app/TabActivity;-><init>()V

    .line 60
    const-string v0, "Incoming"

    iput-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->CurrentTab:Ljava/lang/String;

    return-void
.end method

.method public static registerTabActivity(ZLcom/mediatek/bluetooth/share/BluetoothShareTabActivity;)V
    .locals 0
    .parameter "isOutGoing"
    .parameter "mTabActivity"

    .prologue
    .line 149
    if-eqz p0, :cond_0

    .line 150
    sput-object p1, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->outGoingTabActivity:Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;

    .line 156
    :goto_0
    return-void

    .line 153
    :cond_0
    sput-object p1, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->inComingTabActivity:Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    .line 68
    const-string v1, "BluetoothShareMgmtActivity.onCreate()[+]"

    invoke-static {v1}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 70
    invoke-super {p0, p1}, Landroid/app/TabActivity;->onCreate(Landroid/os/Bundle;)V

    .line 73
    const v1, 0x7f030003

    invoke-virtual {p0, v1}, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->setContentView(I)V

    .line 74
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->getTabHost()Landroid/widget/TabHost;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->tabHost:Landroid/widget/TabHost;

    .line 77
    iget-object v1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->tabHost:Landroid/widget/TabHost;

    const-string v2, "Incoming"

    invoke-virtual {v1, v2}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    const v2, 0x7f05007c

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f020007

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/widget/TabHost$TabSpec;->setIndicator(Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p0, v2}, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;->getIntent(Landroid/content/Context;Z)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    .line 81
    .local v0, spec:Landroid/widget/TabHost$TabSpec;
    iget-object v1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->tabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 84
    iget-object v1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->tabHost:Landroid/widget/TabHost;

    const-string v2, "Outgoing"

    invoke-virtual {v1, v2}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    const v2, 0x7f05007d

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f02000a

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/widget/TabHost$TabSpec;->setIndicator(Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {p0, v2}, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;->getIntent(Landroid/content/Context;Z)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    .line 87
    iget-object v1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->tabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 89
    iget-object v1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->tabHost:Landroid/widget/TabHost;

    new-instance v2, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity$1;

    invoke-direct {v2, p0}, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity$1;-><init>(Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/TabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    .line 99
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 108
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f07

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 109
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 133
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f08000e

    if-ne v0, v1, :cond_2

    .line 134
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->CurrentTab:Ljava/lang/String;

    const-string v1, "Outgoing"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 135
    sget-object v0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->outGoingTabActivity:Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;->clearAllTasks()V

    .line 141
    :cond_0
    :goto_0
    const/4 v0, 0x1

    .line 143
    :goto_1
    return v0

    .line 137
    :cond_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->CurrentTab:Ljava/lang/String;

    const-string v1, "Incoming"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 138
    sget-object v0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->inComingTabActivity:Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;->clearAllTasks()V

    goto :goto_0

    .line 143
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 5
    .parameter "menu"

    .prologue
    const v4, 0x7f08000e

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 116
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onPrepareOptionsMenu(), CurrentTab = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->CurrentTab:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 117
    iget-object v2, p0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->CurrentTab:Ljava/lang/String;

    const-string v3, "Outgoing"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 118
    invoke-interface {p1, v4}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    sget-object v3, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->outGoingTabActivity:Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;->getCursor()Landroid/database/Cursor;

    move-result-object v3

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-lez v3, :cond_0

    move v0, v1

    :cond_0
    invoke-interface {v2, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 126
    :goto_0
    return v1

    .line 120
    :cond_1
    iget-object v2, p0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->CurrentTab:Ljava/lang/String;

    const-string v3, "Incoming"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 121
    invoke-interface {p1, v4}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    sget-object v3, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->inComingTabActivity:Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;->getCursor()Landroid/database/Cursor;

    move-result-object v3

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-lez v3, :cond_2

    move v0, v1

    :cond_2
    invoke-interface {v2, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_0

    .line 124
    :cond_3
    const-string v0, "[ERR] onPrepareOptionsMenu(), no available Tab String!"

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    goto :goto_0
.end method
