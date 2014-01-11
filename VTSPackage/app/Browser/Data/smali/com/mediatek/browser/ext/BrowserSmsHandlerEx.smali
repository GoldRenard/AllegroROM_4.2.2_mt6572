.class public Lcom/mediatek/browser/ext/BrowserSmsHandlerEx;
.super Ljava/lang/Object;
.source "BrowserSmsHandlerEx.java"

# interfaces
.implements Lcom/mediatek/browser/ext/IBrowserSmsHandlerEx;


# static fields
.field private static final TAG:Ljava/lang/String; = "BrowserPluginEx"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createSmsHandler(Landroid/app/Activity;)Lcom/mediatek/browser/ext/SmsHandler;
    .locals 2
    .parameter "mActivity"

    .prologue
    .line 11
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: createSmsHandler --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    const/4 v0, 0x0

    return-object v0
.end method
