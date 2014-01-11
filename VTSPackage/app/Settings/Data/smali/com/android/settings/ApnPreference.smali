.class public Lcom/android/settings/ApnPreference;
.super Landroid/preference/Preference;
.source "ApnPreference.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Landroid/view/View$OnClickListener;


# static fields
.field static final TAG:Ljava/lang/String; = "ApnPreference"

.field private static sCurrentChecked:Landroid/widget/CompoundButton;

.field private static sIsCU:Z

.field private static sSelectedKey:Ljava/lang/String;


# instance fields
.field private mEditable:Z

.field private mProtectFromCheckedChange:Z

.field private mSelectable:Z

.field private mSimId:I

.field private mSourceType:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 68
    sput-object v0, Lcom/android/settings/ApnPreference;->sSelectedKey:Ljava/lang/String;

    .line 69
    sput-object v0, Lcom/android/settings/ApnPreference;->sCurrentChecked:Landroid/widget/CompoundButton;

    .line 75
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/settings/ApnPreference;->sIsCU:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 64
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 70
    iput-boolean v1, p0, Lcom/android/settings/ApnPreference;->mProtectFromCheckedChange:Z

    .line 71
    iput-boolean v2, p0, Lcom/android/settings/ApnPreference;->mSelectable:Z

    .line 73
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/settings/ApnPreference;->mSourceType:I

    .line 74
    iput v1, p0, Lcom/android/settings/ApnPreference;->mSimId:I

    .line 76
    iput-boolean v2, p0, Lcom/android/settings/ApnPreference;->mEditable:Z

    .line 65
    invoke-direct {p0}, Lcom/android/settings/ApnPreference;->init()V

    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 56
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 70
    iput-boolean v1, p0, Lcom/android/settings/ApnPreference;->mProtectFromCheckedChange:Z

    .line 71
    iput-boolean v2, p0, Lcom/android/settings/ApnPreference;->mSelectable:Z

    .line 73
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/settings/ApnPreference;->mSourceType:I

    .line 74
    iput v1, p0, Lcom/android/settings/ApnPreference;->mSimId:I

    .line 76
    iput-boolean v2, p0, Lcom/android/settings/ApnPreference;->mEditable:Z

    .line 57
    invoke-direct {p0}, Lcom/android/settings/ApnPreference;->init()V

    .line 58
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 47
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 70
    iput-boolean v1, p0, Lcom/android/settings/ApnPreference;->mProtectFromCheckedChange:Z

    .line 71
    iput-boolean v2, p0, Lcom/android/settings/ApnPreference;->mSelectable:Z

    .line 73
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/settings/ApnPreference;->mSourceType:I

    .line 74
    iput v1, p0, Lcom/android/settings/ApnPreference;->mSimId:I

    .line 76
    iput-boolean v2, p0, Lcom/android/settings/ApnPreference;->mEditable:Z

    .line 48
    invoke-direct {p0}, Lcom/android/settings/ApnPreference;->init()V

    .line 49
    return-void
.end method

.method private init()V
    .locals 1

    .prologue
    .line 111
    const v0, 0x7f040006

    invoke-virtual {p0, v0}, Lcom/android/settings/ApnPreference;->setLayoutResource(I)V

    .line 112
    return-void
.end method


# virtual methods
.method public getSelectable()Z
    .locals 1

    .prologue
    .line 186
    iget-boolean v0, p0, Lcom/android/settings/ApnPreference;->mSelectable:Z

    return v0
.end method

.method public getSourceType()I
    .locals 1

    .prologue
    .line 198
    iget v0, p0, Lcom/android/settings/ApnPreference;->mSourceType:I

    return v0
.end method

.method public getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 80
    invoke-super {p0, p1, p2}, Landroid/preference/Preference;->getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 82
    .local v3, view:Landroid/view/View;
    const v5, 0x1010001

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 83
    .local v4, widget:Landroid/view/View;
    if-eqz v4, :cond_1

    instance-of v5, v4, Landroid/widget/RadioButton;

    if-eqz v5, :cond_1

    move-object v1, v4

    .line 84
    check-cast v1, Landroid/widget/RadioButton;

    .line 85
    .local v1, rb:Landroid/widget/RadioButton;
    iget-boolean v5, p0, Lcom/android/settings/ApnPreference;->mSelectable:Z

    if-eqz v5, :cond_3

    .line 86
    invoke-virtual {v1, p0}, Landroid/widget/RadioButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 88
    invoke-virtual {p0}, Lcom/android/settings/ApnPreference;->getKey()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/android/settings/ApnPreference;->sSelectedKey:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 89
    .local v0, isChecked:Z
    if-eqz v0, :cond_0

    .line 90
    sput-object v1, Lcom/android/settings/ApnPreference;->sCurrentChecked:Landroid/widget/CompoundButton;

    .line 91
    invoke-virtual {p0}, Lcom/android/settings/ApnPreference;->getKey()Ljava/lang/String;

    move-result-object v5

    sput-object v5, Lcom/android/settings/ApnPreference;->sSelectedKey:Ljava/lang/String;

    .line 94
    :cond_0
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/android/settings/ApnPreference;->mProtectFromCheckedChange:Z

    .line 95
    invoke-virtual {v1, v0}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 96
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/android/settings/ApnPreference;->mProtectFromCheckedChange:Z

    .line 102
    .end local v0           #isChecked:Z
    .end local v1           #rb:Landroid/widget/RadioButton;
    :cond_1
    :goto_0
    const/high16 v5, 0x101

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 103
    .local v2, textLayout:Landroid/view/View;
    if-eqz v2, :cond_2

    instance-of v5, v2, Landroid/widget/RelativeLayout;

    if-eqz v5, :cond_2

    .line 104
    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 107
    :cond_2
    return-object v3

    .line 98
    .end local v2           #textLayout:Landroid/view/View;
    .restart local v1       #rb:Landroid/widget/RadioButton;
    :cond_3
    const/16 v5, 0x8

    invoke-virtual {v1, v5}, Landroid/widget/RadioButton;->setVisibility(I)V

    goto :goto_0
.end method

.method public isChecked()Z
    .locals 2

    .prologue
    .line 115
    invoke-virtual {p0}, Lcom/android/settings/ApnPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/android/settings/ApnPreference;->sSelectedKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 4
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    const/4 v3, 0x0

    .line 123
    const-string v0, "ApnPreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/settings/ApnPreference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    iget-boolean v0, p0, Lcom/android/settings/ApnPreference;->mProtectFromCheckedChange:Z

    if-eqz v0, :cond_0

    .line 139
    :goto_0
    return-void

    .line 128
    :cond_0
    if-eqz p2, :cond_2

    .line 129
    sget-object v0, Lcom/android/settings/ApnPreference;->sCurrentChecked:Landroid/widget/CompoundButton;

    if-eqz v0, :cond_1

    .line 130
    sget-object v0, Lcom/android/settings/ApnPreference;->sCurrentChecked:Landroid/widget/CompoundButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 132
    :cond_1
    sput-object p1, Lcom/android/settings/ApnPreference;->sCurrentChecked:Landroid/widget/CompoundButton;

    .line 133
    invoke-virtual {p0}, Lcom/android/settings/ApnPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/settings/ApnPreference;->sSelectedKey:Ljava/lang/String;

    .line 134
    sget-object v0, Lcom/android/settings/ApnPreference;->sSelectedKey:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/android/settings/ApnPreference;->callChangeListener(Ljava/lang/Object;)Z

    goto :goto_0

    .line 136
    :cond_2
    sput-object v3, Lcom/android/settings/ApnPreference;->sCurrentChecked:Landroid/widget/CompoundButton;

    .line 137
    sput-object v3, Lcom/android/settings/ApnPreference;->sSelectedKey:Ljava/lang/String;

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 8
    .parameter "v"

    .prologue
    .line 142
    if-eqz p1, :cond_0

    const/high16 v5, 0x101

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v6

    if-ne v5, v6, :cond_0

    .line 143
    invoke-virtual {p0}, Lcom/android/settings/ApnPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 144
    .local v0, context:Landroid/content/Context;
    if-eqz v0, :cond_0

    .line 145
    invoke-virtual {p0}, Lcom/android/settings/ApnPreference;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 148
    .local v3, pos:I
    iget v5, p0, Lcom/android/settings/ApnPreference;->mSimId:I

    packed-switch v5, :pswitch_data_0

    .line 162
    const-string v5, "ApnPreference"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "error need to check mSimId = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lcom/android/settings/ApnPreference;->mSimId:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    sget-object v2, Landroid/provider/Telephony$Carriers$SIM1Carriers;->CONTENT_URI:Landroid/net/Uri;

    .line 171
    .local v2, orig:Landroid/net/Uri;
    :goto_0
    int-to-long v5, v3

    invoke-static {v2, v5, v6}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v4

    .line 173
    .local v4, url:Landroid/net/Uri;
    new-instance v1, Landroid/content/Intent;

    const-string v5, "android.intent.action.EDIT"

    invoke-direct {v1, v5, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 174
    .local v1, it:Landroid/content/Intent;
    const-string v5, "simId"

    iget v6, p0, Lcom/android/settings/ApnPreference;->mSimId:I

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 175
    const-string v6, "readOnly"

    iget-boolean v5, p0, Lcom/android/settings/ApnPreference;->mEditable:Z

    if-nez v5, :cond_1

    const/4 v5, 0x1

    :goto_1
    invoke-virtual {v1, v6, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 176
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 179
    .end local v0           #context:Landroid/content/Context;
    .end local v1           #it:Landroid/content/Intent;
    .end local v2           #orig:Landroid/net/Uri;
    .end local v3           #pos:I
    .end local v4           #url:Landroid/net/Uri;
    :cond_0
    return-void

    .line 150
    .restart local v0       #context:Landroid/content/Context;
    .restart local v3       #pos:I
    :pswitch_0
    sget-object v2, Landroid/provider/Telephony$Carriers$SIM1Carriers;->CONTENT_URI:Landroid/net/Uri;

    .line 151
    .restart local v2       #orig:Landroid/net/Uri;
    goto :goto_0

    .line 153
    .end local v2           #orig:Landroid/net/Uri;
    :pswitch_1
    sget-object v2, Landroid/provider/Telephony$Carriers$SIM2Carriers;->CONTENT_URI:Landroid/net/Uri;

    .line 154
    .restart local v2       #orig:Landroid/net/Uri;
    goto :goto_0

    .line 156
    .end local v2           #orig:Landroid/net/Uri;
    :pswitch_2
    sget-object v2, Landroid/provider/Telephony$Carriers$SIM3Carriers;->CONTENT_URI:Landroid/net/Uri;

    .line 157
    .restart local v2       #orig:Landroid/net/Uri;
    goto :goto_0

    .line 159
    .end local v2           #orig:Landroid/net/Uri;
    :pswitch_3
    sget-object v2, Landroid/provider/Telephony$Carriers$SIM4Carriers;->CONTENT_URI:Landroid/net/Uri;

    .line 160
    .restart local v2       #orig:Landroid/net/Uri;
    goto :goto_0

    .line 175
    .restart local v1       #it:Landroid/content/Intent;
    .restart local v4       #url:Landroid/net/Uri;
    :cond_1
    const/4 v5, 0x0

    goto :goto_1

    .line 148
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public setApnEditable(Z)V
    .locals 0
    .parameter "isEditable"

    .prologue
    .line 194
    iput-boolean p1, p0, Lcom/android/settings/ApnPreference;->mEditable:Z

    .line 195
    return-void
.end method

.method public setChecked()V
    .locals 1

    .prologue
    .line 119
    invoke-virtual {p0}, Lcom/android/settings/ApnPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/settings/ApnPreference;->sSelectedKey:Ljava/lang/String;

    .line 120
    return-void
.end method

.method public setSelectable(Z)V
    .locals 0
    .parameter "selectable"

    .prologue
    .line 182
    iput-boolean p1, p0, Lcom/android/settings/ApnPreference;->mSelectable:Z

    .line 183
    return-void
.end method

.method public setSimId(I)V
    .locals 0
    .parameter "simid"

    .prologue
    .line 190
    iput p1, p0, Lcom/android/settings/ApnPreference;->mSimId:I

    .line 191
    return-void
.end method

.method public setSourceType(I)V
    .locals 0
    .parameter "type"

    .prologue
    .line 202
    iput p1, p0, Lcom/android/settings/ApnPreference;->mSourceType:I

    .line 203
    return-void
.end method
