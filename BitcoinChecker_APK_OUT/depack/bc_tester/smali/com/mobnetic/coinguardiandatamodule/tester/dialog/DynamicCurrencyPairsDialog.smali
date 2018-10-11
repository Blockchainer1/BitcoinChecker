.class public abstract Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;
.super Landroid/app/AlertDialog;
.source "DynamicCurrencyPairsDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field private currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

.field private errorView:Landroid/widget/TextView;

.field private final market:Lcom/mobnetic/coinguardian/model/Market;

.field private refreshImageView:Landroid/view/View;

.field private final requestQueue:Lcom/android/volley/RequestQueue;

.field private statusView:Landroid/widget/TextView;


# direct methods
.method protected constructor <init>(Landroid/content/Context;Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "market"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p3, "currencyPairsMapHelper"    # Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .prologue
    const/4 v1, 0x0

    .line 38
    invoke-direct {p0, p1}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;)V

    .line 39
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->setInverseBackgroundForced(Z)V

    .line 41
    invoke-static {p1}, Lcom/mobnetic/coinguardiandatamodule/tester/util/HttpsHelper;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object v0

    iput-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->requestQueue:Lcom/android/volley/RequestQueue;

    .line 42
    iput-object p2, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->market:Lcom/mobnetic/coinguardian/model/Market;

    .line 43
    iput-object p3, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .line 45
    const v0, 0x7f05000d

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->setTitle(I)V

    .line 46
    invoke-virtual {p0, p0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 47
    const/4 v2, -0x3

    const v0, 0x104000a

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object v0, v1

    check-cast v0, Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p0, v2, v3, v0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 49
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/high16 v2, 0x7f030000

    invoke-virtual {v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v7

    .line 50
    .local v7, "view":Landroid/view/View;
    const/high16 v0, 0x7f060000

    invoke-virtual {v7, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->refreshImageView:Landroid/view/View;

    .line 51
    const v0, 0x7f060001

    invoke-virtual {v7, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->statusView:Landroid/widget/TextView;

    .line 52
    const v0, 0x7f060002

    invoke-virtual {v7, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->errorView:Landroid/widget/TextView;

    .line 53
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->refreshImageView:Landroid/view/View;

    new-instance v2, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$1;

    invoke-direct {v2, p0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$1;-><init>(Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move-object v0, p0

    move-object v2, v1

    move-object v3, v1

    move-object v4, v1

    move-object v5, v1

    move-object v6, v1

    .line 58
    invoke-direct/range {v0 .. v6}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->refreshStatusView(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/String;Lcom/android/volley/VolleyError;)V

    .line 60
    invoke-virtual {p0, v7}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->setView(Landroid/view/View;)V

    .line 61
    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->startRefreshing()V

    return-void
.end method

.method static synthetic access$102(Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;
    .param p1, "x1"    # Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    return-object p1
.end method

.method static synthetic access$200(Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/String;Lcom/android/volley/VolleyError;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/util/Map;
    .param p3, "x3"    # Lcom/android/volley/NetworkResponse;
    .param p4, "x4"    # Ljava/lang/String;
    .param p5, "x5"    # Ljava/lang/String;
    .param p6, "x6"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 27
    invoke-direct/range {p0 .. p6}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->refreshStatusView(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/String;Lcom/android/volley/VolleyError;)V

    return-void
.end method

.method static synthetic access$300(Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;)Lcom/mobnetic/coinguardian/model/Market;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->market:Lcom/mobnetic/coinguardian/model/Market;

    return-object v0
.end method

.method private refreshStatusView(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/String;Lcom/android/volley/VolleyError;)V
    .locals 9
    .param p1, "url"    # Ljava/lang/String;
    .param p3, "networkResponse"    # Lcom/android/volley/NetworkResponse;
    .param p4, "responseString"    # Ljava/lang/String;
    .param p5, "errorMsg"    # Ljava/lang/String;
    .param p6, "error"    # Lcom/android/volley/VolleyError;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    .line 96
    .local p2, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->getDate()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_2

    .line 97
    invoke-virtual {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->getDate()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/mobnetic/coinguardian/util/FormatUtilsBase;->formatSameDayTimeOrDate(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v7

    .line 101
    .local v7, "dateString":Ljava/lang/String;
    :goto_0
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->statusView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f050009

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v7, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->getPairsCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 103
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->statusView:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f05000b

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v8, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {v8}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->getPairsCount()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v6

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    .line 105
    :cond_0
    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 107
    .local v1, "ssb":Landroid/text/SpannableStringBuilder;
    if-eqz p5, :cond_1

    .line 108
    const-string v0, "\n"

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 109
    invoke-virtual {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    const v2, 0x7f050001

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p5, v3, v4

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 112
    :cond_1
    invoke-virtual {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p6

    invoke-static/range {v0 .. v6}, Lcom/mobnetic/coinguardiandatamodule/tester/util/CheckErrorsUtils;->formatResponseDebug(Landroid/content/Context;Landroid/text/SpannableStringBuilder;Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/Exception;)Landroid/text/SpannableStringBuilder;

    .line 113
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->errorView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    return-void

    .line 99
    .end local v1    # "ssb":Landroid/text/SpannableStringBuilder;
    .end local v7    # "dateString":Ljava/lang/String;
    :cond_2
    invoke-virtual {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    const v2, 0x7f05000a

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    .restart local v7    # "dateString":Ljava/lang/String;
    goto/16 :goto_0
.end method

.method private startRefreshing()V
    .locals 5

    .prologue
    .line 70
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->setCancelable(Z)V

    .line 71
    invoke-virtual {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->startRefreshingAnim()V

    .line 72
    new-instance v0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyMainRequest;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->market:Lcom/mobnetic/coinguardian/model/Market;

    new-instance v3, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$2;

    invoke-direct {v3, p0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$2;-><init>(Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;)V

    new-instance v4, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$3;

    invoke-direct {v4, p0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$3;-><init>(Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;)V

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyMainRequest;-><init>(Landroid/content/Context;Lcom/mobnetic/coinguardian/model/Market;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 90
    .local v0, "request":Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyMainRequest;
    invoke-virtual {v0, p0}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyMainRequest;->setTag(Ljava/lang/Object;)Lcom/android/volley/Request;

    .line 91
    iget-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->requestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v1, v0}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 92
    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->requestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v0, p0}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .line 67
    return-void
.end method

.method public abstract onPairsUpdated(Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V
.end method

.method public startRefreshingAnim()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 117
    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->setCancelable(Z)V

    .line 118
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->refreshImageView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 119
    return-void
.end method

.method public stopRefreshingAnim()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 122
    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->setCancelable(Z)V

    .line 123
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->refreshImageView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 124
    return-void
.end method
