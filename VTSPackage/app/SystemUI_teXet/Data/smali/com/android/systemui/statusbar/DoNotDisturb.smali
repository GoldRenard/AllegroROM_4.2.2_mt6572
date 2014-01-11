.class public Lcom/android/systemui/statusbar/DoNotDisturb;
.super Ljava/lang/Object;
.source "DoNotDisturb.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDoNotDisturb:Z

.field mPrefs:Landroid/content/SharedPreferences;

.field private mStatusBar:Landroid/app/StatusBarManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .parameter "context"

    .prologue
    .line 35
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/android/systemui/statusbar/DoNotDisturb;->mContext:Landroid/content/Context;

    .line 37
    const-string v0, "statusbar"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/StatusBarManager;

    iput-object v0, p0, Lcom/android/systemui/statusbar/DoNotDisturb;->mStatusBar:Landroid/app/StatusBarManager;

    .line 38
    invoke-static {p1}, Lcom/android/systemui/statusbar/policy/Prefs;->read(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/DoNotDisturb;->mPrefs:Landroid/content/SharedPreferences;

    .line 39
    iget-object v0, p0, Lcom/android/systemui/statusbar/DoNotDisturb;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 40
    iget-object v0, p0, Lcom/android/systemui/statusbar/DoNotDisturb;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "do_not_disturb"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/DoNotDisturb;->mDoNotDisturb:Z

    .line 41
    invoke-direct {p0}, Lcom/android/systemui/statusbar/DoNotDisturb;->updateDisableRecord()V

    .line 42
    return-void
.end method

.method private updateDisableRecord()V
    .registers 4

    .prologue
    .line 54
    const/high16 v0, 0xe

    .line 57
    .local v0, disabled:I
    iget-object v2, p0, Lcom/android/systemui/statusbar/DoNotDisturb;->mStatusBar:Landroid/app/StatusBarManager;

    iget-boolean v1, p0, Lcom/android/systemui/statusbar/DoNotDisturb;->mDoNotDisturb:Z

    if-eqz v1, :cond_e

    const/high16 v1, 0xe

    :goto_a
    invoke-virtual {v2, v1}, Landroid/app/StatusBarManager;->disable(I)V

    .line 58
    return-void

    .line 57
    :cond_e
    const/4 v1, 0x0

    goto :goto_a
.end method


# virtual methods
.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 6
    .parameter "prefs"
    .parameter "key"

    .prologue
    .line 45
    const-string v1, "do_not_disturb"

    const/4 v2, 0x0

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 47
    .local v0, val:Z
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/DoNotDisturb;->mDoNotDisturb:Z

    if-eq v0, v1, :cond_10

    .line 48
    iput-boolean v0, p0, Lcom/android/systemui/statusbar/DoNotDisturb;->mDoNotDisturb:Z

    .line 49
    invoke-direct {p0}, Lcom/android/systemui/statusbar/DoNotDisturb;->updateDisableRecord()V

    .line 51
    :cond_10
    return-void
.end method
