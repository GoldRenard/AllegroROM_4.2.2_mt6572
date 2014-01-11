.class public final Landroid/app/ANRAppManager;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Landroid/app/ANRAppManager;

.field private static b:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const/4 v0, 0x0

    sput-object v0, Landroid/app/ANRAppManager;->a:Landroid/app/ANRAppManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public static dumpMessageHistory()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    invoke-static {}, Landroid/os/MessageLogger;->dump()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getDefault()Landroid/app/ANRAppManager;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Landroid/app/ANRAppManager;->a:Landroid/app/ANRAppManager;

    if-nez v0, :cond_0

    .line 26
    new-instance v0, Landroid/app/ANRAppManager;

    invoke-direct {v0}, Landroid/app/ANRAppManager;-><init>()V

    sput-object v0, Landroid/app/ANRAppManager;->a:Landroid/app/ANRAppManager;

    .line 27
    :cond_0
    sget-object v0, Landroid/app/ANRAppManager;->a:Landroid/app/ANRAppManager;

    return-object v0
.end method


# virtual methods
.method public newMessageLogger(Z)Landroid/util/Printer;
    .locals 1
    .parameter

    .prologue
    .line 33
    sput-boolean p1, Landroid/app/ANRAppManager;->b:Z

    .line 34
    new-instance v0, Landroid/os/MessageLogger;

    invoke-direct {v0}, Landroid/os/MessageLogger;-><init>()V

    return-object v0
.end method
