.class public Lcom/mediatek/bluetooth/share/BluetoothShareTabAdapter;
.super Landroid/widget/ResourceCursorAdapter;
.source "BluetoothShareTabAdapter.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;ILandroid/database/Cursor;)V
    .locals 0
    .parameter "context"
    .parameter "layout"
    .parameter "c"

    .prologue
    .line 59
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ResourceCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;)V

    .line 60
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 11
    .parameter "view"
    .parameter "context"
    .parameter "cursor"

    .prologue
    const v7, 0x7f020004

    const/16 v10, 0x8

    .line 66
    new-instance v5, Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-direct {v5, p3}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;-><init>(Landroid/database/Cursor;)V

    .line 69
    .local v5, task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    const v8, 0x7f080007

    invoke-virtual {p1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 70
    .local v3, icon:Landroid/widget/ImageView;
    invoke-virtual {v5}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getDirection()Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    move-result-object v8

    sget-object v9, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->in:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    if-ne v8, v9, :cond_3

    .line 72
    invoke-virtual {v5}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v8

    if-ne v8, v10, :cond_0

    const v7, 0x7f020005

    :cond_0
    invoke-virtual {v3, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 86
    :goto_0
    const v7, 0x7f080008

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 87
    .local v6, textView:Landroid/widget/TextView;
    invoke-virtual {v5}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getData()Ljava/lang/String;

    move-result-object v2

    .line 88
    .local v2, filename:Ljava/lang/String;
    if-nez v2, :cond_1

    const-string v2, ""

    .line 89
    :cond_1
    invoke-virtual {v6, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    const v7, 0x7f080009

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .end local v6           #textView:Landroid/widget/TextView;
    check-cast v6, Landroid/widget/TextView;

    .line 93
    .restart local v6       #textView:Landroid/widget/TextView;
    invoke-virtual {v5}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPeerName()Ljava/lang/String;

    move-result-object v1

    .line 94
    .local v1, deviceName:Ljava/lang/String;
    if-nez v1, :cond_2

    const-string v1, ""

    .line 95
    :cond_2
    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    const v7, 0x7f08000a

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .end local v6           #textView:Landroid/widget/TextView;
    check-cast v6, Landroid/widget/TextView;

    .line 99
    .restart local v6       #textView:Landroid/widget/TextView;
    new-instance v0, Ljava/util/Date;

    invoke-virtual {v5}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getModifiedDate()J

    move-result-wide v7

    invoke-direct {v0, v7, v8}, Ljava/util/Date;-><init>(J)V

    .line 100
    .local v0, d:Ljava/util/Date;
    invoke-virtual {v5}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getModifiedDate()J

    move-result-wide v7

    invoke-static {v7, v8}, Landroid/text/format/DateUtils;->isToday(J)Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-static {p2}, Landroid/text/format/DateFormat;->getTimeFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    .line 102
    .local v4, modifiedDate:Ljava/lang/CharSequence;
    :goto_1
    invoke-virtual {v6, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    const v7, 0x7f08000b

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .end local v6           #textView:Landroid/widget/TextView;
    check-cast v6, Landroid/widget/TextView;

    .line 106
    .restart local v6       #textView:Landroid/widget/TextView;
    invoke-virtual {v5}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getTotalBytes()J

    move-result-wide v7

    invoke-static {p2, v7, v8}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    return-void

    .line 77
    .end local v0           #d:Ljava/util/Date;
    .end local v1           #deviceName:Ljava/lang/String;
    .end local v2           #filename:Ljava/lang/String;
    .end local v4           #modifiedDate:Ljava/lang/CharSequence;
    .end local v6           #textView:Landroid/widget/TextView;
    :cond_3
    invoke-virtual {v5}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v8

    if-ne v8, v10, :cond_4

    const v7, 0x7f020006

    :cond_4
    invoke-virtual {v3, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 100
    .restart local v0       #d:Ljava/util/Date;
    .restart local v1       #deviceName:Ljava/lang/String;
    .restart local v2       #filename:Ljava/lang/String;
    .restart local v6       #textView:Landroid/widget/TextView;
    :cond_5
    invoke-static {p2}, Landroid/text/format/DateFormat;->getDateFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    goto :goto_1
.end method
