.class public Lcom/mobnetic/coinguardian/util/FormatUtils;
.super Lcom/mobnetic/coinguardian/util/FormatUtilsBase;
.source "FormatUtils.java"


# static fields
.field private static final CONTRACT_TYPE_NAMES:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 136
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/mobnetic/coinguardian/util/FormatUtils;->CONTRACT_TYPE_NAMES:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x7f07006c
        0x7f070069
        0x7f07006a
        0x7f070068
        0x7f07006b
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;-><init>()V

    return-void
.end method

.method public static fixSatoshi(D)Ljava/math/BigDecimal;
    .locals 4
    .param p0, "value"    # D

    .prologue
    .line 19
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p0, p1}, Ljava/math/BigDecimal;-><init>(D)V

    const/16 v1, 0x8

    sget-object v2, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    invoke-virtual {v0, v1, v2}, Ljava/math/BigDecimal;->setScale(ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0
.end method

.method public static formatPrice(DLcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)Ljava/lang/String;
    .locals 4
    .param p0, "price"    # D
    .param p2, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p3, "showCurrencyDst"    # Z

    .prologue
    .line 50
    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySubunitDst()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/mobnetic/coinguardian/util/CurrencyUtils;->getCurrencySubunit(Ljava/lang/String;J)Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    move-result-object v0

    .line 52
    .local v0, "subunitDst":Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    invoke-static {p0, p1, v0, p3}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;Z)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static formatPriceWithCurrency(DLcom/mobnetic/coinguardian/db/content/CheckerRecord;)Ljava/lang/String;
    .locals 2
    .param p0, "price"    # D
    .param p2, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .prologue
    .line 45
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPrice(DLcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatRelativeTime(Landroid/content/Context;JJZ)Ljava/lang/String;
    .locals 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "time"    # J
    .param p3, "now"    # J
    .param p5, "useShortNames"    # Z

    .prologue
    .line 88
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 89
    .local v5, "res":Landroid/content/res/Resources;
    sub-long v2, p1, p3

    .line 92
    .local v2, "ms":J
    const/4 v0, 0x0

    .line 95
    .local v0, "isInPast":Z
    const-wide/16 v8, 0x0

    cmp-long v7, v2, v8

    if-gez v7, :cond_0

    .line 96
    const/4 v0, 0x1

    .line 97
    neg-long v2, v2

    .line 100
    :cond_0
    const-wide/32 v8, 0xea60

    cmp-long v7, v2, v8

    if-gez v7, :cond_2

    .line 101
    long-to-float v7, v2

    const/high16 v8, 0x447a0000    # 1000.0f

    div-float/2addr v7, v8

    float-to-int v6, v7

    .line 102
    .local v6, "timeValue":I
    if-eqz p5, :cond_1

    const v1, 0x7f07010c

    .line 120
    .local v1, "pluralsResId":I
    :goto_0
    if-eqz p5, :cond_c

    .line 121
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 125
    .local v4, "relativeDate":Ljava/lang/String;
    :goto_1
    if-eqz v0, :cond_d

    .line 126
    const v7, 0x7f070103

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    invoke-virtual {v5, v7, v8}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 130
    :goto_2
    return-object v4

    .line 102
    .end local v1    # "pluralsResId":I
    .end local v4    # "relativeDate":Ljava/lang/String;
    :cond_1
    const v1, 0x7f0f0004

    goto :goto_0

    .line 103
    .end local v6    # "timeValue":I
    :cond_2
    const-wide/32 v8, 0x36ee80

    cmp-long v7, v2, v8

    if-gez v7, :cond_4

    .line 104
    long-to-float v7, v2

    const v8, 0x476a6000    # 60000.0f

    div-float/2addr v7, v8

    float-to-int v6, v7

    .line 105
    .restart local v6    # "timeValue":I
    if-eqz p5, :cond_3

    const v1, 0x7f070109

    .restart local v1    # "pluralsResId":I
    :goto_3
    goto :goto_0

    .end local v1    # "pluralsResId":I
    :cond_3
    const v1, 0x7f0f0002

    goto :goto_3

    .line 106
    .end local v6    # "timeValue":I
    :cond_4
    const-wide/32 v8, 0x5265c00

    cmp-long v7, v2, v8

    if-gez v7, :cond_6

    .line 107
    long-to-float v7, v2

    const v8, 0x4a5bba00    # 3600000.0f

    div-float/2addr v7, v8

    float-to-int v6, v7

    .line 108
    .restart local v6    # "timeValue":I
    if-eqz p5, :cond_5

    const v1, 0x7f070106

    .restart local v1    # "pluralsResId":I
    :goto_4
    goto :goto_0

    .end local v1    # "pluralsResId":I
    :cond_5
    const v1, 0x7f0f0001

    goto :goto_4

    .line 109
    .end local v6    # "timeValue":I
    :cond_6
    const-wide v8, 0x98c75400L

    cmp-long v7, v2, v8

    if-gez v7, :cond_8

    .line 110
    long-to-float v7, v2

    const v8, 0x4ca4cb80    # 8.64E7f

    div-float/2addr v7, v8

    float-to-int v6, v7

    .line 111
    .restart local v6    # "timeValue":I
    if-eqz p5, :cond_7

    const v1, 0x7f070104

    .restart local v1    # "pluralsResId":I
    :goto_5
    goto :goto_0

    .end local v1    # "pluralsResId":I
    :cond_7
    const/high16 v1, 0x7f0f0000

    goto :goto_5

    .line 112
    .end local v6    # "timeValue":I
    :cond_8
    const-wide v8, 0x72957f000L

    cmp-long v7, v2, v8

    if-gez v7, :cond_a

    .line 113
    long-to-float v7, v2

    const v8, 0x4f18c754    # 2.5632E9f

    div-float/2addr v7, v8

    float-to-int v6, v7

    .line 114
    .restart local v6    # "timeValue":I
    if-eqz p5, :cond_9

    const v1, 0x7f07010b

    .restart local v1    # "pluralsResId":I
    :goto_6
    goto/16 :goto_0

    .end local v1    # "pluralsResId":I
    :cond_9
    const v1, 0x7f0f0003

    goto :goto_6

    .line 116
    .end local v6    # "timeValue":I
    :cond_a
    long-to-float v7, v2

    const v8, 0x50e52afe    # 3.07584E10f

    div-float/2addr v7, v8

    float-to-int v6, v7

    .line 117
    .restart local v6    # "timeValue":I
    if-eqz p5, :cond_b

    const v1, 0x7f07010e

    .restart local v1    # "pluralsResId":I
    :goto_7
    goto/16 :goto_0

    .end local v1    # "pluralsResId":I
    :cond_b
    const v1, 0x7f0f0005

    goto :goto_7

    .line 123
    .restart local v1    # "pluralsResId":I
    :cond_c
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v5, v1, v6, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .restart local v4    # "relativeDate":Ljava/lang/String;
    goto/16 :goto_1

    .line 128
    :cond_d
    const v7, 0x7f070108

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    invoke-virtual {v5, v7, v8}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_2
.end method

.method public static formatTextForTTS(Landroid/content/Context;DLcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/model/CurrencySubunit;Lcom/mobnetic/coinguardian/model/Market;)Ljava/lang/String;
    .locals 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "value"    # D
    .param p3, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p4, "subunitDst"    # Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    .param p5, "market"    # Lcom/mobnetic/coinguardian/model/Market;

    .prologue
    const/4 v5, 0x0

    .line 61
    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v6, p4

    move v7, v5

    move-object/from16 v8, p5

    move v9, v5

    invoke-static/range {v1 .. v9}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatTextForTTS(Landroid/content/Context;DLcom/mobnetic/coinguardian/db/content/CheckerRecord;ZLcom/mobnetic/coinguardian/model/CurrencySubunit;ZLcom/mobnetic/coinguardian/model/Market;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatTextForTTS(Landroid/content/Context;DLcom/mobnetic/coinguardian/db/content/CheckerRecord;ZLcom/mobnetic/coinguardian/model/CurrencySubunit;ZLcom/mobnetic/coinguardian/model/Market;Z)Ljava/lang/String;
    .locals 15
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "value"    # D
    .param p3, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p4, "skipCurrencySrc"    # Z
    .param p5, "subunitDst"    # Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    .param p6, "skipCurrencyDst"    # Z
    .param p7, "market"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p8, "skipExchangeName"    # Z

    .prologue
    .line 64
    invoke-virtual/range {p3 .. p3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p3 .. p3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getContractType()J

    move-result-wide v2

    long-to-int v7, v2

    move-object/from16 v0, p7

    iget-object v12, v0, Lcom/mobnetic/coinguardian/model/Market;->ttsName:Ljava/lang/String;

    move-object v3, p0

    move-wide/from16 v4, p1

    move/from16 v8, p4

    move-object/from16 v9, p5

    move/from16 v10, p6

    move-object/from16 v11, p7

    move/from16 v13, p8

    invoke-static/range {v3 .. v13}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatTextForTTS(Landroid/content/Context;DLjava/lang/String;IZLcom/mobnetic/coinguardian/model/CurrencySubunit;ZLcom/mobnetic/coinguardian/model/Market;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static formatTextForTTS(Landroid/content/Context;DLjava/lang/String;IZLcom/mobnetic/coinguardian/model/CurrencySubunit;ZLcom/mobnetic/coinguardian/model/Market;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "value"    # D
    .param p3, "currencySrc"    # Ljava/lang/String;
    .param p4, "contractType"    # I
    .param p5, "skipCurrencySrc"    # Z
    .param p6, "subunitDst"    # Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    .param p7, "skipCurrencyDst"    # Z
    .param p8, "market"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p9, "exchangeName"    # Ljava/lang/String;
    .param p10, "skipExchangeName"    # Z

    .prologue
    .line 67
    invoke-static {p0, p1, p2, p6}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatValueForTTS(Landroid/content/Context;DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;

    move-result-object v0

    .line 68
    .local v0, "spokenString":Ljava/lang/String;
    if-nez p5, :cond_0

    invoke-static {p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getTTSFormatSpeakBaseCurrency(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 69
    const v1, 0x7f07010f

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0, p3, p8, p4}, Lcom/mobnetic/coinguardian/util/FormatUtils;->getCurrencySrcWithContractTypeForTTS(Landroid/content/Context;Ljava/lang/String;Lcom/mobnetic/coinguardian/model/Market;I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object v0, v2, v3

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 70
    :cond_0
    if-nez p7, :cond_1

    invoke-static {p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getTTSFormatSpeakCounterCurrency(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 71
    const v1, 0x7f070110

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v3, 0x1

    iget-object v4, p6, Lcom/mobnetic/coinguardian/model/CurrencySubunit;->name:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 72
    :cond_1
    if-nez p10, :cond_2

    invoke-static {p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getTTSFormatSpeakExchange(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 73
    const v1, 0x7f070111

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v3, 0x1

    aput-object p9, v2, v3

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 74
    :cond_2
    return-object v0
.end method

.method private static formatValueForTTS(Landroid/content/Context;DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "value"    # D
    .param p3, "subunitDst"    # Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    .prologue
    const/4 v1, 0x1

    .line 56
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    cmpl-double v2, p1, v2

    if-ltz v2, :cond_0

    invoke-static {p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getTTSFormatIntegerOnly(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v0, v1

    .line 57
    .local v0, "speakIntegersOnly":Z
    :goto_0
    invoke-static {p1, p2, p3, v0, v1}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceValueForSubunit(DLcom/mobnetic/coinguardian/model/CurrencySubunit;ZZ)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 56
    .end local v0    # "speakIntegersOnly":Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getContractTypeName(Landroid/content/Context;I)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "contractType"    # I

    .prologue
    .line 145
    if-ltz p1, :cond_0

    sget-object v0, Lcom/mobnetic/coinguardian/util/FormatUtils;->CONTRACT_TYPE_NAMES:[I

    array-length v0, v0

    if-ge p1, v0, :cond_0

    .line 146
    sget-object v0, Lcom/mobnetic/coinguardian/util/FormatUtils;->CONTRACT_TYPE_NAMES:[I

    aget v0, v0, p1

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 148
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p1}, Lcom/mobnetic/coinguardian/model/Futures;->getContractTypeShortName(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getCurrencySrcWithContractType(Ljava/lang/String;Lcom/mobnetic/coinguardian/model/Market;I)Ljava/lang/String;
    .locals 2
    .param p0, "currencySrc"    # Ljava/lang/String;
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p2, "contractType"    # I

    .prologue
    .line 23
    instance-of v1, p1, Lcom/mobnetic/coinguardian/model/FuturesMarket;

    if-eqz v1, :cond_0

    .line 24
    invoke-static {p2}, Lcom/mobnetic/coinguardian/model/Futures;->getContractTypeShortName(I)Ljava/lang/String;

    move-result-object v0

    .line 25
    .local v0, "contractTypeShortName":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 29
    .end local v0    # "contractTypeShortName":Ljava/lang/String;
    .end local p0    # "currencySrc":Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method public static getCurrencySrcWithContractTypeForTTS(Landroid/content/Context;Ljava/lang/String;Lcom/mobnetic/coinguardian/model/Market;I)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "currencySrc"    # Ljava/lang/String;
    .param p2, "market"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p3, "contractType"    # I

    .prologue
    .line 32
    instance-of v1, p2, Lcom/mobnetic/coinguardian/model/FuturesMarket;

    if-eqz v1, :cond_0

    .line 33
    invoke-static {p0, p3}, Lcom/mobnetic/coinguardian/util/FormatUtils;->getContractTypeName(Landroid/content/Context;I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 34
    .local v0, "contractTypeName":Ljava/lang/CharSequence;
    if-eqz v0, :cond_0

    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 38
    .end local v0    # "contractTypeName":Ljava/lang/CharSequence;
    .end local p1    # "currencySrc":Ljava/lang/String;
    :cond_0
    return-object p1
.end method
