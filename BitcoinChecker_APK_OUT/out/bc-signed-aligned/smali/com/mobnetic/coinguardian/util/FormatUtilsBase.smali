.class public Lcom/mobnetic/coinguardian/util/FormatUtilsBase;
.super Ljava/lang/Object;
.source "FormatUtilsBase.java"


# static fields
.field private static final FORMAT_EIGHT_SIGNIFICANT_AT_MOST:Ljava/text/DecimalFormat;

.field private static final FORMAT_THREE_SIGNIFICANT_AT_MOST:Ljava/text/DecimalFormat;

.field private static final FORMAT_TWO_DECIMAL:Ljava/text/DecimalFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 17
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "0.00"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->FORMAT_TWO_DECIMAL:Ljava/text/DecimalFormat;

    .line 18
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "@##"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->FORMAT_THREE_SIGNIFICANT_AT_MOST:Ljava/text/DecimalFormat;

    .line 19
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "@#######"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->FORMAT_EIGHT_SIGNIFICANT_AT_MOST:Ljava/text/DecimalFormat;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static formatDateTime(Landroid/content/Context;J)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "time"    # J

    .prologue
    .line 94
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    .line 95
    .local v0, "date":Ljava/util/Date;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Landroid/text/format/DateFormat;->getTimeFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p0}, Landroid/text/format/DateFormat;->getDateFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static formatDouble(DZ)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # D
    .param p2, "isPrice"    # Z

    .prologue
    .line 25
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    cmpg-double v0, p0, v0

    if-gez v0, :cond_0

    sget-object v0, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->FORMAT_THREE_SIGNIFICANT_AT_MOST:Ljava/text/DecimalFormat;

    :goto_0
    invoke-static {v0, p0, p1}, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->formatDouble(Ljava/text/DecimalFormat;D)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    sget-object v0, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->FORMAT_TWO_DECIMAL:Ljava/text/DecimalFormat;

    goto :goto_0
.end method

.method protected static final formatDouble(Ljava/text/DecimalFormat;D)Ljava/lang/String;
    .locals 3
    .param p0, "decimalFormat"    # Ljava/text/DecimalFormat;
    .param p1, "value"    # D

    .prologue
    .line 37
    monitor-enter p0

    .line 39
    :try_start_0
    invoke-virtual {p0, p1, p2}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    :try_start_1
    monitor-exit p0

    .line 44
    :goto_0
    return-object v1

    .line 40
    :catch_0
    move-exception v0

    .line 41
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 44
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    monitor-exit p0

    goto :goto_0

    .line 45
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method protected static formatDoubleWithEightMax(D)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # D

    .prologue
    .line 33
    sget-object v0, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->FORMAT_EIGHT_SIGNIFICANT_AT_MOST:Ljava/text/DecimalFormat;

    invoke-static {v0, p0, p1}, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->formatDouble(Ljava/text/DecimalFormat;D)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatDoubleWithThreeMax(D)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # D

    .prologue
    .line 29
    sget-object v0, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->FORMAT_THREE_SIGNIFICANT_AT_MOST:Ljava/text/DecimalFormat;

    invoke-static {v0, p0, p1}, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->formatDouble(Ljava/text/DecimalFormat;D)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatPriceValueForSubunit(DLcom/mobnetic/coinguardian/model/CurrencySubunit;ZZ)Ljava/lang/String;
    .locals 2
    .param p0, "price"    # D
    .param p2, "subunitDst"    # Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    .param p3, "forceInteger"    # Z
    .param p4, "skipNoSignificantDecimal"    # Z

    .prologue
    .line 73
    iget-wide v0, p2, Lcom/mobnetic/coinguardian/model/CurrencySubunit;->subunitToUnit:J

    long-to-double v0, v0

    mul-double/2addr p0, v0

    .line 74
    iget-boolean v0, p2, Lcom/mobnetic/coinguardian/model/CurrencySubunit;->allowDecimal:Z

    if-eqz v0, :cond_0

    if-eqz p3, :cond_1

    .line 75
    :cond_0
    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    add-double/2addr v0, p0

    double-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    .line 79
    :goto_0
    return-object v0

    .line 76
    :cond_1
    if-eqz p4, :cond_2

    .line 77
    invoke-static {p0, p1}, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->formatDoubleWithEightMax(D)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 79
    :cond_2
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->formatDouble(DZ)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;
    .locals 2
    .param p0, "price"    # D
    .param p2, "subunitDst"    # Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    .prologue
    .line 52
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected static formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;Z)Ljava/lang/String;
    .locals 2
    .param p0, "price"    # D
    .param p2, "subunitDst"    # Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    .param p3, "showCurrencyDst"    # Z

    .prologue
    const/4 v1, 0x0

    .line 56
    invoke-static {p0, p1, p2, v1, v1}, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->formatPriceValueForSubunit(DLcom/mobnetic/coinguardian/model/CurrencySubunit;ZZ)Ljava/lang/String;

    move-result-object v0

    .line 57
    .local v0, "priceString":Ljava/lang/String;
    if-eqz p3, :cond_0

    .line 58
    iget-object v1, p2, Lcom/mobnetic/coinguardian/model/CurrencySubunit;->name:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->formatPriceWithCurrency(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 61
    :cond_0
    return-object v0
.end method

.method public static formatPriceWithCurrency(DLjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # D
    .param p2, "currency"    # Ljava/lang/String;

    .prologue
    .line 65
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->formatDouble(DZ)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->formatPriceWithCurrency(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatPriceWithCurrency(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "priceString"    # Ljava/lang/String;
    .param p1, "currency"    # Ljava/lang/String;

    .prologue
    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcom/mobnetic/coinguardian/util/CurrencyUtils;->getCurrencySymbol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatSameDayTimeOrDate(Landroid/content/Context;J)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "time"    # J

    .prologue
    .line 86
    invoke-static {p1, p2}, Landroid/text/format/DateUtils;->isToday(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 87
    invoke-static {p0}, Landroid/text/format/DateFormat;->getTimeFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v0

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 89
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Landroid/text/format/DateFormat;->getDateFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v0

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
