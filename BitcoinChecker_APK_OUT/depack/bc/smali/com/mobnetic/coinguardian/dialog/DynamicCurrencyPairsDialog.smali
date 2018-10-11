.class public abstract Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;
.super Landroid/app/AlertDialog;
.source "DynamicCurrencyPairsDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field private currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

.field private dynamicCurrencyPairsVolleyAsyncTask:Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;

.field private final market:Lcom/mobnetic/coinguardian/model/Market;

.field refreshImageView:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0082
    .end annotation
.end field

.field refreshImageWrapper:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0081
    .end annotation
.end field

.field private final requestQueue:Lcom/android/volley/RequestQueue;

.field private rotateAnim:Lcom/nineoldandroids/animation/ValueAnimator;

.field statusView:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0083
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Landroid/content/Context;Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "market"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p3, "currencyPairsMapHelper"    # Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 45
    invoke-direct {p0, p1}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;)V

    .line 46
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->setInverseBackgroundForced(Z)V

    .line 48
    invoke-static {p1}, Lcom/mobnetic/coinguardian/util/HttpsHelper;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->requestQueue:Lcom/android/volley/RequestQueue;

    .line 49
    iput-object p2, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->market:Lcom/mobnetic/coinguardian/model/Market;

    .line 50
    iput-object p3, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .line 52
    const v1, 0x7f07004a

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->setTitle(I)V

    .line 53
    invoke-virtual {p0, p0}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 54
    const/4 v3, -0x3

    const v1, 0x104000a

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object v1, v2

    check-cast v1, Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p0, v3, v4, v1}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 56
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v3, 0x7f030023

    invoke-virtual {v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 57
    .local v0, "view":Landroid/view/View;
    invoke-static {p0, v0}, Lbutterknife/ButterKnife;->inject(Ljava/lang/Object;Landroid/view/View;)V

    .line 58
    iget-object v1, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->refreshImageWrapper:Landroid/view/View;

    new-instance v3, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$1;

    invoke-direct {v3, p0}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$1;-><init>(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 63
    invoke-direct {p0, v2}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->refreshStatusView(Ljava/lang/String;)V

    .line 65
    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->setView(Landroid/view/View;)V

    .line 66
    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->startRefreshing()V

    return-void
.end method

.method static synthetic access$102(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;)Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;
    .param p1, "x1"    # Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->dynamicCurrencyPairsVolleyAsyncTask:Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;

    return-object p1
.end method

.method static synthetic access$202(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;
    .param p1, "x1"    # Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    return-object p1
.end method

.method static synthetic access$300(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->refreshStatusView(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;)Lcom/mobnetic/coinguardian/model/Market;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->market:Lcom/mobnetic/coinguardian/model/Market;

    return-object v0
.end method

.method private refreshStatusView(Ljava/lang/String;)V
    .locals 8
    .param p1, "errorMsg"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 103
    iget-object v1, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->getDate()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_2

    .line 104
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->getDate()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatSameDayTimeOrDate(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    .line 109
    .local v0, "dateString":Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->statusView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f070047

    new-array v4, v6, [Ljava/lang/Object;

    aput-object v0, v4, v7

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    iget-object v1, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->getPairsCount()I

    move-result v1

    if-lez v1, :cond_0

    .line 111
    iget-object v1, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->statusView:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f070049

    new-array v5, v6, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {v6}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->getPairsCount()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    .line 112
    :cond_0
    if-eqz p1, :cond_1

    .line 113
    iget-object v1, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->statusView:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, p1}, Lcom/mobnetic/coinguardian/util/CheckErrorsUtils;->formatError(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    .line 114
    :cond_1
    return-void

    .line 106
    .end local v0    # "dateString":Ljava/lang/String;
    :cond_2
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f070048

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "dateString":Ljava/lang/String;
    goto :goto_0
.end method

.method private startRefreshing()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 77
    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->setCancelable(Z)V

    .line 78
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->startRefreshingAnim()V

    .line 79
    new-instance v0, Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->requestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->market:Lcom/mobnetic/coinguardian/model/Market;

    new-instance v4, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$2;

    invoke-direct {v4, p0}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$2;-><init>(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;)V

    new-instance v5, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$3;

    invoke-direct {v5, p0}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$3;-><init>(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;)V

    invoke-direct/range {v0 .. v5}, Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;-><init>(Lcom/android/volley/RequestQueue;Landroid/content/Context;Lcom/mobnetic/coinguardian/model/Market;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    iput-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->dynamicCurrencyPairsVolleyAsyncTask:Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;

    .line 98
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->dynamicCurrencyPairsVolleyAsyncTask:Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;

    new-array v1, v6, [Ljava/lang/Void;

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/util/AsyncTaskCompat;->execute(Landroid/os/AsyncTask;[Ljava/lang/Object;)V

    .line 99
    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->requestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v0, p0}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 71
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->dynamicCurrencyPairsVolleyAsyncTask:Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;

    if-eqz v0, :cond_0

    .line 72
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->dynamicCurrencyPairsVolleyAsyncTask:Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;->cancel(Z)Z

    .line 73
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .line 74
    return-void
.end method

.method public abstract onPairsUpdated(Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V
.end method

.method public startRefreshingAnim()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 117
    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->setCancelable(Z)V

    .line 118
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->refreshImageWrapper:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 119
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->refreshImageView:Landroid/view/View;

    const-string v1, "rotation"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    invoke-static {v0, v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->rotateAnim:Lcom/nineoldandroids/animation/ValueAnimator;

    .line 120
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->rotateAnim:Lcom/nineoldandroids/animation/ValueAnimator;

    const-wide/16 v2, 0x2ee

    invoke-virtual {v0, v2, v3}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    .line 121
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->rotateAnim:Lcom/nineoldandroids/animation/ValueAnimator;

    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 122
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->rotateAnim:Lcom/nineoldandroids/animation/ValueAnimator;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setRepeatCount(I)V

    .line 123
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->rotateAnim:Lcom/nineoldandroids/animation/ValueAnimator;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setRepeatMode(I)V

    .line 124
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->rotateAnim:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    .line 125
    return-void

    .line 119
    :array_0
    .array-data 4
        0x0
        0x43b40000    # 360.0f
    .end array-data
.end method

.method public stopRefreshingAnim()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 128
    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->setCancelable(Z)V

    .line 129
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->refreshImageWrapper:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 130
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->rotateAnim:Lcom/nineoldandroids/animation/ValueAnimator;

    if-eqz v0, :cond_0

    .line 131
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->rotateAnim:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ValueAnimator;->cancel()V

    .line 132
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->rotateAnim:Lcom/nineoldandroids/animation/ValueAnimator;

    .line 133
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->refreshImageView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/nineoldandroids/view/ViewHelper;->setRotation(Landroid/view/View;F)V

    .line 135
    :cond_0
    return-void
.end method
