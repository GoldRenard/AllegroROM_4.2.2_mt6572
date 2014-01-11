.class public final Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;
.super Ljava/lang/Object;
.source "PreferencesProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Application;,
        Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface;
    }
.end annotation


# static fields
.field public static final PREFERENCES_CHANGED:Ljava/lang/String; = "preferences_changed"

.field public static final PREFERENCES_KEY:Ljava/lang/String; = "com.cyanogenmod.trebuchet_preferences"

.field private static sKeyValues:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 237
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    invoke-static {p0, p1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method static synthetic access$100(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    invoke-static {p0, p1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Ljava/lang/String;Z)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    invoke-static {p0, p1}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 28
    invoke-static {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->setBoolean(Landroid/content/Context;Ljava/lang/String;Z)V

    return-void
.end method

.method private static getBoolean(Ljava/lang/String;Z)Z
    .locals 1
    .parameter "key"
    .parameter "def"

    .prologue
    .line 47
    sget-object v0, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->sKeyValues:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->sKeyValues:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->sKeyValues:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    .end local p1
    :cond_0
    return p1
.end method

.method private static getInt(Ljava/lang/String;I)I
    .locals 1
    .parameter "key"
    .parameter "def"

    .prologue
    .line 42
    sget-object v0, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->sKeyValues:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->sKeyValues:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->sKeyValues:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .end local p1
    :cond_0
    return p1
.end method

.method private static getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "key"
    .parameter "def"

    .prologue
    .line 60
    sget-object v0, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->sKeyValues:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->sKeyValues:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->sKeyValues:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    move-object v0, p1

    goto :goto_0
.end method

.method public static load(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 37
    const-string v1, "com.cyanogenmod.trebuchet_preferences"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 38
    .local v0, preferences:Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v1

    sput-object v1, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->sKeyValues:Ljava/util/Map;

    .line 39
    return-void
.end method

.method private static setBoolean(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 4
    .parameter "ctx"
    .parameter "key"
    .parameter "value"

    .prologue
    .line 52
    const-string v2, "com.cyanogenmod.trebuchet_preferences"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 53
    .local v1, preferences:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 54
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 55
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 56
    sget-object v2, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->sKeyValues:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v2, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    return-void
.end method
