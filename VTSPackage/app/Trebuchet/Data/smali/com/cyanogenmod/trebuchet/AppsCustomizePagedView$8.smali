.class synthetic Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;
.super Ljava/lang/Object;
.source "AppsCustomizePagedView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$ContentType:[I

.field static final synthetic $SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 2156
    invoke-static {}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->values()[Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    :try_start_0
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->Standard:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_11

    :goto_0
    :try_start_1
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->Tablet:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_10

    :goto_1
    :try_start_2
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ZoomIn:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_f

    :goto_2
    :try_start_3
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ZoomOut:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_e

    :goto_3
    :try_start_4
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->RotateUp:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_d

    :goto_4
    :try_start_5
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->RotateDown:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_c

    :goto_5
    :try_start_6
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->Spin:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_b

    :goto_6
    :try_start_7
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->Flip:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_a

    :goto_7
    :try_start_8
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->CubeIn:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_9

    :goto_8
    :try_start_9
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->CubeOut:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_8

    :goto_9
    :try_start_a
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->Stack:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_7

    :goto_a
    :try_start_b
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->Accordion:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_6

    :goto_b
    :try_start_c
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->CylinderIn:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_5

    :goto_c
    :try_start_d
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->CylinderOut:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ordinal()I

    move-result v1

    const/16 v2, 0xe

    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_4

    :goto_d
    :try_start_e
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->CarouselLeft:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ordinal()I

    move-result v1

    const/16 v2, 0xf

    aput v2, v0, v1
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_3

    :goto_e
    :try_start_f
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$TransitionEffect:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->CarouselRight:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$TransitionEffect;->ordinal()I

    move-result v1

    const/16 v2, 0x10

    aput v2, v0, v1
    :try_end_f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f .. :try_end_f} :catch_2

    .line 469
    :goto_f
    invoke-static {}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->values()[Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$ContentType:[I

    :try_start_10
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$ContentType:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Applications:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_10 .. :try_end_10} :catch_1

    :goto_10
    :try_start_11
    sget-object v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$8;->$SwitchMap$com$cyanogenmod$trebuchet$AppsCustomizePagedView$ContentType:[I

    sget-object v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->Widgets:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_11
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_11} :catch_0

    :goto_11
    return-void

    :catch_0
    move-exception v0

    goto :goto_11

    :catch_1
    move-exception v0

    goto :goto_10

    .line 2156
    :catch_2
    move-exception v0

    goto :goto_f

    :catch_3
    move-exception v0

    goto :goto_e

    :catch_4
    move-exception v0

    goto :goto_d

    :catch_5
    move-exception v0

    goto :goto_c

    :catch_6
    move-exception v0

    goto :goto_b

    :catch_7
    move-exception v0

    goto :goto_a

    :catch_8
    move-exception v0

    goto :goto_9

    :catch_9
    move-exception v0

    goto/16 :goto_8

    :catch_a
    move-exception v0

    goto/16 :goto_7

    :catch_b
    move-exception v0

    goto/16 :goto_6

    :catch_c
    move-exception v0

    goto/16 :goto_5

    :catch_d
    move-exception v0

    goto/16 :goto_4

    :catch_e
    move-exception v0

    goto/16 :goto_3

    :catch_f
    move-exception v0

    goto/16 :goto_2

    :catch_10
    move-exception v0

    goto/16 :goto_1

    :catch_11
    move-exception v0

    goto/16 :goto_0
.end method
