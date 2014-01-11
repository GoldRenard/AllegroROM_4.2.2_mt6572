.class Lcom/mediatek/lbs/CustomSwitchPreference$Listener;
.super Ljava/lang/Object;
.source "CustomSwitchPreference.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/lbs/CustomSwitchPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Listener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/lbs/CustomSwitchPreference;


# direct methods
.method private constructor <init>(Lcom/mediatek/lbs/CustomSwitchPreference;)V
    .locals 0
    .parameter

    .prologue
    .line 54
    iput-object p1, p0, Lcom/mediatek/lbs/CustomSwitchPreference$Listener;->this$0:Lcom/mediatek/lbs/CustomSwitchPreference;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/lbs/CustomSwitchPreference;Lcom/mediatek/lbs/CustomSwitchPreference$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/mediatek/lbs/CustomSwitchPreference$Listener;-><init>(Lcom/mediatek/lbs/CustomSwitchPreference;)V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 57
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "gps"

    invoke-static {v0, v1, p2}, Landroid/provider/Settings$Secure;->setLocationProviderEnabled(Landroid/content/ContentResolver;Ljava/lang/String;Z)V

    .line 59
    iget-object v0, p0, Lcom/mediatek/lbs/CustomSwitchPreference$Listener;->this$0:Lcom/mediatek/lbs/CustomSwitchPreference;

    invoke-virtual {v0, p2}, Lcom/mediatek/lbs/CustomSwitchPreference;->setChecked(Z)V

    .line 60
    return-void
.end method
