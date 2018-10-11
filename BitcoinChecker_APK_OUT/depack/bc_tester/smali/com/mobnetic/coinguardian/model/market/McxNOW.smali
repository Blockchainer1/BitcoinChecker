.class public Lcom/mobnetic/coinguardian/model/market/McxNOW;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "McxNOW.java"


# static fields
.field private static final NAME:Ljava/lang/String; = "McxNOW"

.field private static final TTS_NAME:Ljava/lang/String; = "MCX now"

.field private static final URL:Ljava/lang/String; = "https://mcxnow.com/orders?cur=%1$s"

.field private static final URL_CURRENCY_PAIRS:Ljava/lang/String; = "https://mcxnow.com/current"


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 32
    const-string v0, "McxNOW"

    const-string v1, "MCX now"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 33
    return-void
.end method

.method private getFirstPriceFromOrder(Lorg/w3c/dom/Document;Ljava/lang/String;)D
    .locals 6
    .param p1, "doc"    # Lorg/w3c/dom/Document;
    .param p2, "arrayName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 56
    invoke-static {p1, p2}, Lcom/mobnetic/coinguardian/util/XmlParserUtils;->getFirstElementByTagName(Lorg/w3c/dom/Document;Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 57
    .local v0, "arrayNode":Lorg/w3c/dom/Node;
    if-eqz v0, :cond_0

    .line 58
    check-cast v0, Lorg/w3c/dom/Element;

    .end local v0    # "arrayNode":Lorg/w3c/dom/Node;
    const-string v4, "o"

    invoke-interface {v0, v4}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 59
    .local v2, "orderNodes":Lorg/w3c/dom/NodeList;
    if-eqz v2, :cond_0

    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-le v4, v5, :cond_0

    .line 60
    invoke-interface {v2, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 61
    .local v1, "orderNode":Lorg/w3c/dom/Node;
    if-eqz v1, :cond_0

    instance-of v4, v1, Lorg/w3c/dom/Element;

    if-eqz v4, :cond_0

    .line 62
    check-cast v1, Lorg/w3c/dom/Element;

    .end local v1    # "orderNode":Lorg/w3c/dom/Node;
    const-string v4, "p"

    invoke-interface {v1, v4}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 63
    .local v3, "priceNodes":Lorg/w3c/dom/NodeList;
    if-eqz v3, :cond_0

    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-lez v4, :cond_0

    .line 64
    const/4 v4, 0x0

    invoke-interface {v3, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-static {v4}, Lcom/mobnetic/coinguardian/util/XmlParserUtils;->getDoubleNodeValue(Lorg/w3c/dom/Node;)D

    move-result-wide v4

    .line 69
    .end local v2    # "orderNodes":Lorg/w3c/dom/NodeList;
    .end local v3    # "priceNodes":Lorg/w3c/dom/NodeList;
    :goto_0
    return-wide v4

    :cond_0
    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    goto :goto_0
.end method


# virtual methods
.method public getCurrencyPairsUrl(I)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I

    .prologue
    .line 77
    const-string v0, "https://mcxnow.com/current"

    return-object v0
.end method

.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 4
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 37
    const-string v0, "https://mcxnow.com/orders?cur=%1$s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected parseCurrencyPairs(ILjava/lang/String;Ljava/util/List;)V
    .locals 10
    .param p1, "requestId"    # I
    .param p2, "responseString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 82
    .local p3, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v7

    invoke-virtual {v7}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v1

    .line 83
    .local v1, "db":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v4, Lorg/xml/sax/InputSource;

    invoke-direct {v4}, Lorg/xml/sax/InputSource;-><init>()V

    .line 84
    .local v4, "is":Lorg/xml/sax/InputSource;
    new-instance v7, Ljava/io/StringReader;

    invoke-direct {v7, p2}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v7}, Lorg/xml/sax/InputSource;->setCharacterStream(Ljava/io/Reader;)V

    .line 85
    invoke-virtual {v1, v4}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v2

    .line 88
    .local v2, "doc":Lorg/w3c/dom/Document;
    const-string v7, "cur"

    invoke-interface {v2, v7}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v6

    .line 89
    .local v6, "nodes":Lorg/w3c/dom/NodeList;
    const/4 v5, 0x0

    .line 90
    .local v5, "node":Lorg/w3c/dom/Element;
    if-eqz v6, :cond_1

    .line 91
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v6}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7

    if-ge v3, v7, :cond_1

    .line 92
    invoke-interface {v6, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    .end local v5    # "node":Lorg/w3c/dom/Element;
    check-cast v5, Lorg/w3c/dom/Element;

    .line 93
    .restart local v5    # "node":Lorg/w3c/dom/Element;
    if-eqz v5, :cond_0

    .line 94
    const-string v7, "tla"

    invoke-interface {v5, v7}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, "currency":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    const-string v7, "BTC"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 96
    new-instance v7, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;

    const-string v8, "BTC"

    const/4 v9, 0x0

    invoke-direct {v7, v0, v8, v9}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    .end local v0    # "currency":Ljava/lang/String;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 100
    .end local v3    # "i":I
    :cond_1
    return-void
.end method

.method protected parseTicker(ILjava/lang/String;Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/CheckerInfo;)V
    .locals 6
    .param p1, "requestId"    # I
    .param p2, "responseString"    # Ljava/lang/String;
    .param p3, "ticker"    # Lcom/mobnetic/coinguardian/model/Ticker;
    .param p4, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 42
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 43
    .local v0, "db":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v2, Lorg/xml/sax/InputSource;

    invoke-direct {v2}, Lorg/xml/sax/InputSource;-><init>()V

    .line 44
    .local v2, "is":Lorg/xml/sax/InputSource;
    new-instance v3, Ljava/io/StringReader;

    invoke-direct {v3, p2}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lorg/xml/sax/InputSource;->setCharacterStream(Ljava/io/Reader;)V

    .line 45
    invoke-virtual {v0, v2}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v1

    .line 47
    .local v1, "doc":Lorg/w3c/dom/Document;
    const-string v3, "buy"

    invoke-direct {p0, v1, v3}, Lcom/mobnetic/coinguardian/model/market/McxNOW;->getFirstPriceFromOrder(Lorg/w3c/dom/Document;Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 48
    const-string v3, "sell"

    invoke-direct {p0, v1, v3}, Lcom/mobnetic/coinguardian/model/market/McxNOW;->getFirstPriceFromOrder(Lorg/w3c/dom/Document;Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 49
    const-string v3, "curvol"

    invoke-static {v1, v3}, Lcom/mobnetic/coinguardian/util/XmlParserUtils;->getFirstElementByTagName(Lorg/w3c/dom/Document;Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v3

    invoke-static {v3}, Lcom/mobnetic/coinguardian/util/XmlParserUtils;->getDoubleNodeValue(Lorg/w3c/dom/Node;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 50
    const-string v3, "priceh"

    invoke-static {v1, v3}, Lcom/mobnetic/coinguardian/util/XmlParserUtils;->getFirstElementByTagName(Lorg/w3c/dom/Document;Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v3

    invoke-static {v3}, Lcom/mobnetic/coinguardian/util/XmlParserUtils;->getDoubleNodeValue(Lorg/w3c/dom/Node;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 51
    const-string v3, "pricel"

    invoke-static {v1, v3}, Lcom/mobnetic/coinguardian/util/XmlParserUtils;->getFirstElementByTagName(Lorg/w3c/dom/Document;Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v3

    invoke-static {v3}, Lcom/mobnetic/coinguardian/util/XmlParserUtils;->getDoubleNodeValue(Lorg/w3c/dom/Node;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 52
    const-string v3, "lprice"

    invoke-static {v1, v3}, Lcom/mobnetic/coinguardian/util/XmlParserUtils;->getFirstElementByTagName(Lorg/w3c/dom/Document;Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v3

    invoke-static {v3}, Lcom/mobnetic/coinguardian/util/XmlParserUtils;->getDoubleNodeValue(Lorg/w3c/dom/Node;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 53
    return-void
.end method
