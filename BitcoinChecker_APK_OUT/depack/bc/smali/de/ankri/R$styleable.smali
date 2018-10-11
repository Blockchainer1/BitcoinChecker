.class public final Lde/ankri/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/ankri/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final Switch:[I

.field public static final Switch_switchMinWidth:I = 0x6

.field public static final Switch_switchPadding:I = 0x7

.field public static final Switch_switchTextAppearance:I = 0x5

.field public static final Switch_textOff:I = 0x3

.field public static final Switch_textOn:I = 0x2

.field public static final Switch_thumb:I = 0x0

.field public static final Switch_thumbTextPadding:I = 0x4

.field public static final Switch_track:I = 0x1

.field public static final TextAppearanceSwitch:[I

.field public static final TextAppearanceSwitch_fontFamily:I = 0x4

.field public static final TextAppearanceSwitch_switchTextAllCaps:I = 0x8

.field public static final TextAppearanceSwitch_textColor:I = 0x0

.field public static final TextAppearanceSwitch_textColorHighlight:I = 0x5

.field public static final TextAppearanceSwitch_textColorHint:I = 0x6

.field public static final TextAppearanceSwitch_textColorLink:I = 0x7

.field public static final TextAppearanceSwitch_textSize:I = 0x1

.field public static final TextAppearanceSwitch_textStyle:I = 0x2

.field public static final TextAppearanceSwitch_typeface:I = 0x3


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 63
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lde/ankri/R$styleable;->Switch:[I

    .line 72
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lde/ankri/R$styleable;->TextAppearanceSwitch:[I

    return-void

    .line 63
    nop

    :array_0
    .array-data 4
        0x7f010093
        0x7f010094
        0x7f010095
        0x7f010096
        0x7f010097
        0x7f010098
        0x7f010099
        0x7f01009a
    .end array-data

    .line 72
    :array_1
    .array-data 4
        0x7f01009b
        0x7f01009c
        0x7f01009d
        0x7f01009e
        0x7f01009f
        0x7f0100a0
        0x7f0100a1
        0x7f0100a2
        0x7f0100a3
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
