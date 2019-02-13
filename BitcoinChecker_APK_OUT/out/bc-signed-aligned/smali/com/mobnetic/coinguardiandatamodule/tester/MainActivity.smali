.class public Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# instance fields
.field private currencyBaseSpinner:Landroid/widget/Spinner;

.field private currencyCounterSpinner:Landroid/widget/Spinner;

.field private currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

.field private currencySpinnersWrapper:Landroid/view/View;

.field private dynamicCurrencyPairsInfoView:Landroid/view/View;

.field private dynamicCurrencyPairsWarningView:Landroid/view/View;

.field private futuresContractTypeSpinner:Landroid/widget/Spinner;

.field private getResultButton:Landroid/view/View;

.field private marketSpinner:Landroid/widget/Spinner;

.field private progressBar:Landroid/widget/ProgressBar;

.field private requestQueue:Lcom/android/volley/RequestQueue;

.field private resultView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;)Lcom/mobnetic/coinguardian/model/Market;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getSelectedMarket()Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;)Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    return-object v0
.end method

.method static synthetic access$102(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;
    .param p1, "x1"    # Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    return-object p1
.end method

.method static synthetic access$200(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;Lcom/mobnetic/coinguardian/model/Market;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;
    .param p1, "x1"    # Lcom/mobnetic/coinguardian/model/Market;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->refreshCurrencySpinners(Lcom/mobnetic/coinguardian/model/Market;)V

    return-void
.end method

.method static synthetic access$300(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;Lcom/mobnetic/coinguardian/model/Market;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;
    .param p1, "x1"    # Lcom/mobnetic/coinguardian/model/Market;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->refreshFuturesContractTypeSpinner(Lcom/mobnetic/coinguardian/model/Market;)V

    return-void
.end method

.method static synthetic access$400(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;Lcom/mobnetic/coinguardian/model/Market;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;
    .param p1, "x1"    # Lcom/mobnetic/coinguardian/model/Market;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->refreshCurrencyCounterSpinner(Lcom/mobnetic/coinguardian/model/Market;)V

    return-void
.end method

.method static synthetic access$500(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getNewResult()V

    return-void
.end method

.method static synthetic access$600(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;Lcom/mobnetic/coinguardian/model/CheckerInfo;Lcom/mobnetic/coinguardian/model/Ticker;Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/String;Lcom/android/volley/VolleyError;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;
    .param p1, "x1"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;
    .param p2, "x2"    # Lcom/mobnetic/coinguardian/model/Ticker;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Ljava/util/Map;
    .param p5, "x5"    # Lcom/android/volley/NetworkResponse;
    .param p6, "x6"    # Ljava/lang/String;
    .param p7, "x7"    # Ljava/lang/String;
    .param p8, "x8"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 43
    invoke-direct/range {p0 .. p8}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->handleNewResult(Lcom/mobnetic/coinguardian/model/CheckerInfo;Lcom/mobnetic/coinguardian/model/Ticker;Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/String;Lcom/android/volley/VolleyError;)V

    return-void
.end method

.method private createNewPriceLineIfNeeded(IDLjava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "textResId"    # I
    .param p2, "price"    # D
    .param p4, "currency"    # Ljava/lang/String;

    .prologue
    .line 294
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    cmpg-double v0, p2, v0

    if-gtz v0, :cond_0

    .line 295
    const-string v0, ""

    .line 297
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p2, p3, p4}, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->formatPriceWithCurrency(DLjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {p0, p1, v1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getNewResult()V
    .locals 9

    .prologue
    .line 241
    invoke-direct {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getSelectedMarket()Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v4

    .line 242
    .local v4, "market":Lcom/mobnetic/coinguardian/model/Market;
    invoke-direct {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getSelectedCurrencyBase()Ljava/lang/String;

    move-result-object v2

    .line 243
    .local v2, "currencyBase":Ljava/lang/String;
    invoke-direct {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getSelectedCurrencyCounter()Ljava/lang/String;

    move-result-object v3

    .line 244
    .local v3, "currencyCounter":Ljava/lang/String;
    iget-object v7, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    if-eqz v7, :cond_0

    iget-object v7, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {v7, v2, v3}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->getCurrencyPairId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 245
    .local v5, "pairId":Ljava/lang/String;
    :goto_0
    invoke-direct {p0, v4}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getSelectedContractType(Lcom/mobnetic/coinguardian/model/Market;)I

    move-result v1

    .line 246
    .local v1, "contractType":I
    new-instance v0, Lcom/mobnetic/coinguardian/model/CheckerInfo;

    invoke-direct {v0, v2, v3, v5, v1}, Lcom/mobnetic/coinguardian/model/CheckerInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 247
    .local v0, "checkerInfo":Lcom/mobnetic/coinguardian/model/CheckerInfo;
    new-instance v6, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;

    new-instance v7, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$5;

    invoke-direct {v7, p0, v0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$5;-><init>(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;Lcom/mobnetic/coinguardian/model/CheckerInfo;)V

    new-instance v8, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$6;

    invoke-direct {v8, p0, v0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$6;-><init>(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;Lcom/mobnetic/coinguardian/model/CheckerInfo;)V

    invoke-direct {v6, v4, v0, v7, v8}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;-><init>(Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/model/CheckerInfo;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 268
    .local v6, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    iget-object v7, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->requestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v7, v6}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 269
    const/4 v7, 0x0

    invoke-direct {p0, v7}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->showResultView(Z)V

    .line 270
    return-void

    .line 244
    .end local v0    # "checkerInfo":Lcom/mobnetic/coinguardian/model/CheckerInfo;
    .end local v1    # "contractType":I
    .end local v5    # "pairId":Ljava/lang/String;
    .end local v6    # "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    :cond_0
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private getProperCurrencyPairs(Lcom/mobnetic/coinguardian/model/Market;)Ljava/util/HashMap;
    .locals 1
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mobnetic/coinguardian/model/Market;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation

    .prologue
    .line 231
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->getCurrencyPairs()Ljava/util/HashMap;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->getCurrencyPairs()Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 232
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->getCurrencyPairs()Ljava/util/HashMap;

    move-result-object v0

    .line 234
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p1, Lcom/mobnetic/coinguardian/model/Market;->currencyPairs:Ljava/util/HashMap;

    goto :goto_0
.end method

.method private getSelectedContractType(Lcom/mobnetic/coinguardian/model/Market;)I
    .locals 3
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;

    .prologue
    .line 147
    instance-of v2, p1, Lcom/mobnetic/coinguardian/model/FuturesMarket;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 148
    check-cast v0, Lcom/mobnetic/coinguardian/model/FuturesMarket;

    .line 149
    .local v0, "futuresMarket":Lcom/mobnetic/coinguardian/model/FuturesMarket;
    iget-object v2, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->futuresContractTypeSpinner:Landroid/widget/Spinner;

    invoke-virtual {v2}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    .line 150
    .local v1, "selection":I
    iget-object v2, v0, Lcom/mobnetic/coinguardian/model/FuturesMarket;->contractTypes:[I

    aget v2, v2, v1

    .line 152
    .end local v0    # "futuresMarket":Lcom/mobnetic/coinguardian/model/FuturesMarket;
    .end local v1    # "selection":I
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private getSelectedCurrencyBase()Ljava/lang/String;
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyBaseSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v0

    if-nez v0, :cond_0

    .line 136
    const/4 v0, 0x0

    .line 137
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyBaseSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getSelectedCurrencyCounter()Ljava/lang/String;
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyCounterSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v0

    if-nez v0, :cond_0

    .line 142
    const/4 v0, 0x0

    .line 143
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyCounterSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getSelectedMarket()Lcom/mobnetic/coinguardian/model/Market;
    .locals 4

    .prologue
    .line 129
    sget-object v2, Lcom/mobnetic/coinguardian/config/MarketsConfig;->MARKETS:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v1

    .line 130
    .local v1, "size":I
    add-int/lit8 v2, v1, -0x1

    iget-object v3, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->marketSpinner:Landroid/widget/Spinner;

    invoke-virtual {v3}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v3

    sub-int v0, v2, v3

    .line 131
    .local v0, "idx":I
    invoke-static {v0}, Lcom/mobnetic/coinguardian/util/MarketsConfigUtils;->getMarketById(I)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v2

    return-object v2
.end method

.method private handleNewResult(Lcom/mobnetic/coinguardian/model/CheckerInfo;Lcom/mobnetic/coinguardian/model/Ticker;Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/String;Lcom/android/volley/VolleyError;)V
    .locals 8
    .param p1, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;
    .param p2, "ticker"    # Lcom/mobnetic/coinguardian/model/Ticker;
    .param p3, "url"    # Ljava/lang/String;
    .param p5, "networkResponse"    # Lcom/android/volley/NetworkResponse;
    .param p6, "rawResponse"    # Ljava/lang/String;
    .param p7, "errorMsg"    # Ljava/lang/String;
    .param p8, "error"    # Lcom/android/volley/VolleyError;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mobnetic/coinguardian/model/CheckerInfo;",
            "Lcom/mobnetic/coinguardian/model/Ticker;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/android/volley/NetworkResponse;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/android/volley/VolleyError;",
            ")V"
        }
    .end annotation

    .prologue
    .line 273
    .local p4, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->showResultView(Z)V

    .line 274
    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 276
    .local v1, "ssb":Landroid/text/SpannableStringBuilder;
    if-eqz p2, :cond_0

    .line 277
    const v0, 0x7f050015

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-wide v4, p2, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounter()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->formatPriceWithCurrency(DLjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v0, v2}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 278
    const v0, 0x7f050014

    iget-wide v2, p2, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounter()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v0, v2, v3, v4}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->createNewPriceLineIfNeeded(IDLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 279
    const v0, 0x7f050016

    iget-wide v2, p2, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounter()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v0, v2, v3, v4}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->createNewPriceLineIfNeeded(IDLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 280
    const v0, 0x7f050013

    iget-wide v2, p2, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounter()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v0, v2, v3, v4}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->createNewPriceLineIfNeeded(IDLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 281
    const v0, 0x7f050012

    iget-wide v2, p2, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounter()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v0, v2, v3, v4}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->createNewPriceLineIfNeeded(IDLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 282
    const v0, 0x7f05001e

    iget-wide v2, p2, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v0, v2, v3, v4}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->createNewPriceLineIfNeeded(IDLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 283
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const v2, 0x7f05001d

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-wide v6, p2, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    invoke-static {p0, v6, v7}, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->formatSameDayTimeOrDate(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {p0, v2, v3}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .end local p7    # "errorMsg":Ljava/lang/String;
    :goto_0
    move-object v0, p0

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    move-object/from16 v6, p8

    .line 288
    invoke-static/range {v0 .. v6}, Lcom/mobnetic/coinguardiandatamodule/tester/util/CheckErrorsUtils;->formatResponseDebug(Landroid/content/Context;Landroid/text/SpannableStringBuilder;Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/Exception;)Landroid/text/SpannableStringBuilder;

    .line 290
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->resultView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 291
    return-void

    .line 285
    .restart local p7    # "errorMsg":Ljava/lang/String;
    :cond_0
    const v0, 0x7f050001

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    if-eqz p7, :cond_1

    .end local p7    # "errorMsg":Ljava/lang/String;
    :goto_1
    aput-object p7, v2, v3

    invoke-virtual {p0, v0, v2}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_0

    .restart local p7    # "errorMsg":Ljava/lang/String;
    :cond_1
    const-string p7, "UNKNOWN"

    goto :goto_1
.end method

.method private refreshCurrencyBaseSpinner(Lcom/mobnetic/coinguardian/model/Market;)V
    .locals 8
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;

    .prologue
    .line 185
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getProperCurrencyPairs(Lcom/mobnetic/coinguardian/model/Market;)Ljava/util/HashMap;

    move-result-object v1

    .line 186
    .local v1, "currencyPairs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/CharSequence;>;"
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v5

    if-lez v5, :cond_1

    .line 187
    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v5

    new-array v2, v5, [Ljava/lang/CharSequence;

    .line 188
    .local v2, "entries":[Ljava/lang/CharSequence;
    const/4 v3, 0x0

    .line 189
    .local v3, "i":I
    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 190
    .local v0, "currency":Ljava/lang/String;
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "i":I
    .local v4, "i":I
    aput-object v0, v2, v3

    move v3, v4

    .line 191
    .end local v4    # "i":I
    .restart local v3    # "i":I
    goto :goto_0

    .line 192
    .end local v0    # "currency":Ljava/lang/String;
    :cond_0
    iget-object v5, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyBaseSpinner:Landroid/widget/Spinner;

    new-instance v6, Landroid/widget/ArrayAdapter;

    const v7, 0x1090009

    invoke-direct {v6, p0, v7, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    invoke-virtual {v5, v6}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 196
    .end local v2    # "entries":[Ljava/lang/CharSequence;
    .end local v3    # "i":I
    :goto_1
    return-void

    .line 194
    :cond_1
    iget-object v5, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyBaseSpinner:Landroid/widget/Spinner;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    goto :goto_1
.end method

.method private refreshCurrencyCounterSpinner(Lcom/mobnetic/coinguardian/model/Market;)V
    .locals 6
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;

    .prologue
    .line 199
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getProperCurrencyPairs(Lcom/mobnetic/coinguardian/model/Market;)Ljava/util/HashMap;

    move-result-object v0

    .line 200
    .local v0, "currencyPairs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/CharSequence;>;"
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 201
    invoke-direct {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getSelectedCurrencyBase()Ljava/lang/String;

    move-result-object v2

    .line 202
    .local v2, "selectedCurrencyBase":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/CharSequence;

    invoke-virtual {v3}, [Ljava/lang/CharSequence;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/CharSequence;

    .line 203
    .local v1, "entries":[Ljava/lang/CharSequence;
    iget-object v3, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyCounterSpinner:Landroid/widget/Spinner;

    new-instance v4, Landroid/widget/ArrayAdapter;

    const v5, 0x1090009

    invoke-direct {v4, p0, v5, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 207
    .end local v1    # "entries":[Ljava/lang/CharSequence;
    .end local v2    # "selectedCurrencyBase":Ljava/lang/String;
    :goto_0
    return-void

    .line 205
    :cond_0
    iget-object v3, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyCounterSpinner:Landroid/widget/Spinner;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    goto :goto_0
.end method

.method private refreshCurrencySpinners(Lcom/mobnetic/coinguardian/model/Market;)V
    .locals 5
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;

    .prologue
    const/16 v3, 0x8

    const/4 v1, 0x0

    .line 170
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->refreshCurrencyBaseSpinner(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 171
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->refreshCurrencyCounterSpinner(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 172
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->refreshDynamicCurrencyPairsView(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 174
    invoke-direct {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getSelectedCurrencyBase()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-direct {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getSelectedCurrencyCounter()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 175
    .local v0, "isCurrencyEmpty":Z
    :goto_0
    iget-object v4, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencySpinnersWrapper:Landroid/view/View;

    if-eqz v0, :cond_2

    move v2, v3

    :goto_1
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 176
    iget-object v4, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->dynamicCurrencyPairsWarningView:Landroid/view/View;

    if-eqz v0, :cond_3

    move v2, v1

    :goto_2
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 177
    iget-object v2, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getResultButton:Landroid/view/View;

    if-eqz v0, :cond_4

    :goto_3
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 178
    return-void

    .end local v0    # "isCurrencyEmpty":Z
    :cond_1
    move v0, v1

    .line 174
    goto :goto_0

    .restart local v0    # "isCurrencyEmpty":Z
    :cond_2
    move v2, v1

    .line 175
    goto :goto_1

    :cond_3
    move v2, v3

    .line 176
    goto :goto_2

    :cond_4
    move v3, v1

    .line 177
    goto :goto_3
.end method

.method private refreshDynamicCurrencyPairsView(Lcom/mobnetic/coinguardian/model/Market;)V
    .locals 3
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;

    .prologue
    const/4 v0, 0x0

    .line 181
    iget-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->dynamicCurrencyPairsInfoView:Landroid/view/View;

    invoke-virtual {p1, v0}, Lcom/mobnetic/coinguardian/model/Market;->getCurrencyPairsUrl(I)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 182
    return-void

    .line 181
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method private refreshFuturesContractTypeSpinner(Lcom/mobnetic/coinguardian/model/Market;)V
    .locals 7
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;

    .prologue
    .line 210
    const/4 v4, 0x0

    .line 211
    .local v4, "spinnerAdapter":Landroid/widget/SpinnerAdapter;
    instance-of v5, p1, Lcom/mobnetic/coinguardian/model/FuturesMarket;

    if-eqz v5, :cond_1

    move-object v2, p1

    .line 212
    check-cast v2, Lcom/mobnetic/coinguardian/model/FuturesMarket;

    .line 213
    .local v2, "futuresMarket":Lcom/mobnetic/coinguardian/model/FuturesMarket;
    iget-object v5, v2, Lcom/mobnetic/coinguardian/model/FuturesMarket;->contractTypes:[I

    array-length v5, v5

    new-array v1, v5, [Ljava/lang/CharSequence;

    .line 214
    .local v1, "entries":[Ljava/lang/CharSequence;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v5, v2, Lcom/mobnetic/coinguardian/model/FuturesMarket;->contractTypes:[I

    array-length v5, v5

    if-ge v3, v5, :cond_0

    .line 215
    iget-object v5, v2, Lcom/mobnetic/coinguardian/model/FuturesMarket;->contractTypes:[I

    aget v0, v5, v3

    .line 216
    .local v0, "contractType":I
    invoke-static {v0}, Lcom/mobnetic/coinguardian/model/Futures;->getContractTypeShortName(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v1, v3

    .line 214
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 218
    .end local v0    # "contractType":I
    :cond_0
    new-instance v4, Landroid/widget/ArrayAdapter;

    .end local v4    # "spinnerAdapter":Landroid/widget/SpinnerAdapter;
    const v5, 0x1090009

    invoke-direct {v4, p0, v5, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 220
    .end local v1    # "entries":[Ljava/lang/CharSequence;
    .end local v2    # "futuresMarket":Lcom/mobnetic/coinguardian/model/FuturesMarket;
    .end local v3    # "i":I
    .restart local v4    # "spinnerAdapter":Landroid/widget/SpinnerAdapter;
    :cond_1
    iget-object v5, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->futuresContractTypeSpinner:Landroid/widget/Spinner;

    invoke-virtual {v5, v4}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 221
    iget-object v6, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->futuresContractTypeSpinner:Landroid/widget/Spinner;

    if-eqz v4, :cond_2

    const/4 v5, 0x0

    :goto_1
    invoke-virtual {v6, v5}, Landroid/widget/Spinner;->setVisibility(I)V

    .line 222
    return-void

    .line 221
    :cond_2
    const/16 v5, 0x8

    goto :goto_1
.end method

.method private refreshMarketSpinner()V
    .locals 7

    .prologue
    .line 160
    sget-object v4, Lcom/mobnetic/coinguardian/config/MarketsConfig;->MARKETS:Ljava/util/LinkedHashMap;

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->size()I

    move-result v4

    new-array v0, v4, [Ljava/lang/String;

    .line 161
    .local v0, "entries":[Ljava/lang/CharSequence;
    array-length v4, v0

    add-int/lit8 v1, v4, -0x1

    .line 162
    .local v1, "i":I
    sget-object v4, Lcom/mobnetic/coinguardian/config/MarketsConfig;->MARKETS:Ljava/util/LinkedHashMap;

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mobnetic/coinguardian/model/Market;

    .line 163
    .local v3, "market":Lcom/mobnetic/coinguardian/model/Market;
    add-int/lit8 v2, v1, -0x1

    .end local v1    # "i":I
    .local v2, "i":I
    iget-object v5, v3, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    aput-object v5, v0, v1

    move v1, v2

    .line 164
    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_0

    .line 166
    .end local v3    # "market":Lcom/mobnetic/coinguardian/model/Market;
    :cond_0
    iget-object v4, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->marketSpinner:Landroid/widget/Spinner;

    new-instance v5, Landroid/widget/ArrayAdapter;

    const v6, 0x1090009

    invoke-direct {v5, p0, v6, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    invoke-virtual {v4, v5}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 167
    return-void
.end method

.method private showResultView(Z)V
    .locals 4
    .param p1, "showResultView"    # Z

    .prologue
    const/16 v1, 0x8

    const/4 v2, 0x0

    .line 225
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getResultButton:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 226
    iget-object v3, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->progressBar:Landroid/widget/ProgressBar;

    if-eqz p1, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 227
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->resultView:Landroid/widget/TextView;

    if-eqz p1, :cond_1

    :goto_1
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 228
    return-void

    :cond_0
    move v0, v2

    .line 226
    goto :goto_0

    :cond_1
    move v2, v1

    .line 227
    goto :goto_1
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 61
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 63
    invoke-static {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/util/HttpsHelper;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->requestQueue:Lcom/android/volley/RequestQueue;

    .line 65
    const v1, 0x7f030001

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->setContentView(I)V

    .line 67
    const v1, 0x7f060003

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    iput-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->marketSpinner:Landroid/widget/Spinner;

    .line 68
    const v1, 0x7f060004

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencySpinnersWrapper:Landroid/view/View;

    .line 69
    const v1, 0x7f060007

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->dynamicCurrencyPairsWarningView:Landroid/view/View;

    .line 70
    const v1, 0x7f060008

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->dynamicCurrencyPairsInfoView:Landroid/view/View;

    .line 71
    const v1, 0x7f060005

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    iput-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyBaseSpinner:Landroid/widget/Spinner;

    .line 72
    const v1, 0x7f060006

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    iput-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyCounterSpinner:Landroid/widget/Spinner;

    .line 73
    const v1, 0x7f060009

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    iput-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->futuresContractTypeSpinner:Landroid/widget/Spinner;

    .line 74
    const v1, 0x7f06000a

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getResultButton:Landroid/view/View;

    .line 75
    const v1, 0x7f06000b

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->progressBar:Landroid/widget/ProgressBar;

    .line 76
    const v1, 0x7f06000c

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->resultView:Landroid/widget/TextView;

    .line 78
    invoke-direct {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->refreshMarketSpinner()V

    .line 79
    invoke-direct {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getSelectedMarket()Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v0

    .line 80
    .local v0, "market":Lcom/mobnetic/coinguardian/model/Market;
    new-instance v1, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-direct {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getSelectedMarket()Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v2

    iget-object v2, v2, Lcom/mobnetic/coinguardian/model/Market;->key:Ljava/lang/String;

    invoke-static {p0, v2}, Lcom/mobnetic/coinguardiandatamodule/tester/util/MarketCurrencyPairsStore;->getPairsForMarket(Landroid/content/Context;Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;-><init>(Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;)V

    iput-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .line 81
    invoke-direct {p0, v0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->refreshCurrencySpinners(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 82
    invoke-direct {p0, v0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->refreshFuturesContractTypeSpinner(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 83
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->showResultView(Z)V

    .line 85
    iget-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->marketSpinner:Landroid/widget/Spinner;

    new-instance v2, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$1;

    invoke-direct {v2, p0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$1;-><init>(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 97
    iget-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->dynamicCurrencyPairsInfoView:Landroid/view/View;

    new-instance v2, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2;

    invoke-direct {v2, p0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2;-><init>(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    iget-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->currencyBaseSpinner:Landroid/widget/Spinner;

    new-instance v2, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$3;

    invoke-direct {v2, p0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$3;-><init>(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 117
    iget-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getResultButton:Landroid/view/View;

    new-instance v2, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$4;

    invoke-direct {v2, p0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$4;-><init>(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    return-void
.end method
