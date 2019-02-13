.class public Lcom/mobnetic/coinguardian/util/SpannableUtils;
.super Ljava/lang/Object;
.source "SpannableUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static formatWithSpans(Ljava/lang/String;Ljava/lang/String;Landroid/text/style/CharacterStyle;)Ljava/lang/CharSequence;
    .locals 3
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "span1text"    # Ljava/lang/String;
    .param p2, "span1"    # Landroid/text/style/CharacterStyle;

    .prologue
    .line 17
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;

    const/4 v1, 0x0

    new-instance v2, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;

    invoke-direct {v2, p1, p2}, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;-><init>(Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    aput-object v2, v0, v1

    invoke-static {p0, v0}, Lcom/mobnetic/coinguardian/util/SpannableUtils;->formatWithSpans(Ljava/lang/String;[Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static formatWithSpans(Ljava/lang/String;Ljava/lang/String;Landroid/text/style/CharacterStyle;Ljava/lang/String;Landroid/text/style/CharacterStyle;)Ljava/lang/CharSequence;
    .locals 3
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "span1text"    # Ljava/lang/String;
    .param p2, "span1"    # Landroid/text/style/CharacterStyle;
    .param p3, "span2text"    # Ljava/lang/String;
    .param p4, "span2"    # Landroid/text/style/CharacterStyle;

    .prologue
    .line 21
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;

    const/4 v1, 0x0

    new-instance v2, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;

    invoke-direct {v2, p1, p2}, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;-><init>(Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;

    invoke-direct {v2, p3, p4}, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;-><init>(Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    aput-object v2, v0, v1

    invoke-static {p0, v0}, Lcom/mobnetic/coinguardian/util/SpannableUtils;->formatWithSpans(Ljava/lang/String;[Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static formatWithSpans(Ljava/lang/String;Ljava/lang/String;Landroid/text/style/CharacterStyle;Ljava/lang/String;Landroid/text/style/CharacterStyle;Ljava/lang/String;Landroid/text/style/CharacterStyle;)Ljava/lang/CharSequence;
    .locals 3
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "span1text"    # Ljava/lang/String;
    .param p2, "span1"    # Landroid/text/style/CharacterStyle;
    .param p3, "span2text"    # Ljava/lang/String;
    .param p4, "span2"    # Landroid/text/style/CharacterStyle;
    .param p5, "span3text"    # Ljava/lang/String;
    .param p6, "span3"    # Landroid/text/style/CharacterStyle;

    .prologue
    .line 25
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;

    const/4 v1, 0x0

    new-instance v2, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;

    invoke-direct {v2, p1, p2}, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;-><init>(Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;

    invoke-direct {v2, p3, p4}, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;-><init>(Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    new-instance v2, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;

    invoke-direct {v2, p5, p6}, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;-><init>(Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    aput-object v2, v0, v1

    invoke-static {p0, v0}, Lcom/mobnetic/coinguardian/util/SpannableUtils;->formatWithSpans(Ljava/lang/String;[Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static formatWithSpans(Ljava/lang/String;Ljava/lang/String;Landroid/text/style/CharacterStyle;Ljava/lang/String;Landroid/text/style/CharacterStyle;Ljava/lang/String;Landroid/text/style/CharacterStyle;Ljava/lang/String;Landroid/text/style/CharacterStyle;)Ljava/lang/CharSequence;
    .locals 3
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "span1text"    # Ljava/lang/String;
    .param p2, "span1"    # Landroid/text/style/CharacterStyle;
    .param p3, "span2text"    # Ljava/lang/String;
    .param p4, "span2"    # Landroid/text/style/CharacterStyle;
    .param p5, "span3text"    # Ljava/lang/String;
    .param p6, "span3"    # Landroid/text/style/CharacterStyle;
    .param p7, "span4text"    # Ljava/lang/String;
    .param p8, "span4"    # Landroid/text/style/CharacterStyle;

    .prologue
    .line 29
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;

    const/4 v1, 0x0

    new-instance v2, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;

    invoke-direct {v2, p1, p2}, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;-><init>(Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;

    invoke-direct {v2, p3, p4}, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;-><init>(Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    new-instance v2, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;

    invoke-direct {v2, p5, p6}, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;-><init>(Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    new-instance v2, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;

    invoke-direct {v2, p7, p8}, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;-><init>(Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    aput-object v2, v0, v1

    invoke-static {p0, v0}, Lcom/mobnetic/coinguardian/util/SpannableUtils;->formatWithSpans(Ljava/lang/String;[Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static varargs formatWithSpans(Ljava/lang/String;[Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;)Ljava/lang/CharSequence;
    .locals 11
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "args"    # [Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;

    .prologue
    const/16 v10, 0x9

    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 39
    array-length v4, p1

    new-array v0, v4, [I

    .line 40
    .local v0, "argsStartPoints":[I
    new-instance v2, Landroid/text/SpannableStringBuilder;

    invoke-direct {v2, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 42
    .local v2, "ssb":Landroid/text/SpannableStringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v4, p1

    if-ge v1, v4, :cond_2

    .line 43
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "%"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v7, v1, 0x1

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, "$s"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    aput v4, v0, v1

    .line 44
    aget v4, v0, v1

    if-ltz v4, :cond_0

    .line 45
    if-ge v1, v10, :cond_1

    move v4, v5

    :goto_1
    add-int/lit8 v3, v4, 0x3

    .line 46
    .local v3, "tokenLength":I
    aget-object v4, p1, v1

    iget-object v4, v4, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;->second:Ljava/lang/Object;

    aget v7, v0, v1

    aget v8, v0, v1

    add-int/2addr v8, v3

    const/16 v9, 0x21

    invoke-virtual {v2, v4, v7, v8, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 42
    .end local v3    # "tokenLength":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    move v4, v6

    .line 45
    goto :goto_1

    .line 50
    :cond_2
    array-length v4, p1

    add-int/lit8 v1, v4, -0x1

    :goto_2
    if-ltz v1, :cond_5

    .line 51
    aget v4, v0, v1

    if-ltz v4, :cond_3

    .line 52
    if-ge v1, v10, :cond_4

    move v4, v5

    :goto_3
    add-int/lit8 v3, v4, 0x3

    .line 53
    .restart local v3    # "tokenLength":I
    aget v7, v0, v1

    aget v4, v0, v1

    add-int v8, v4, v3

    aget-object v4, p1, v1

    iget-object v4, v4, Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/CharSequence;

    invoke-virtual {v2, v7, v8, v4}, Landroid/text/SpannableStringBuilder;->replace(IILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 50
    .end local v3    # "tokenLength":I
    :cond_3
    add-int/lit8 v1, v1, -0x1

    goto :goto_2

    :cond_4
    move v4, v6

    .line 52
    goto :goto_3

    .line 56
    :cond_5
    return-object v2
.end method
