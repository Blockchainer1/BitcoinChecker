.class public Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;
.super Landroid/widget/BaseAdapter;
.source "MarketPickerListAdapter.java"

# interfaces
.implements Landroid/widget/Filterable;
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# instance fields
.field private final checkMarkDrawableResId:I

.field private final context:Landroid/content/Context;

.field private filteredItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mobnetic/coinguardian/model/Market;",
            ">;"
        }
    .end annotation
.end field

.field private items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mobnetic/coinguardian/model/Market;",
            ">;"
        }
    .end annotation
.end field

.field private marketDefault:Ljava/lang/String;

.field private searchQuery:Ljava/lang/String;

.field private final selectedMarketKey:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 4
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "selectedMarketKey"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 40
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 36
    iput-object v1, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->items:Ljava/util/List;

    .line 37
    iput-object v1, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->filteredItems:Ljava/util/List;

    .line 41
    iput-object p1, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->context:Landroid/content/Context;

    .line 42
    iput-object p2, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->selectedMarketKey:Ljava/lang/String;

    .line 43
    invoke-static {p1}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getMarketDefault(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->marketDefault:Ljava/lang/String;

    .line 45
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 46
    .local v0, "value":Landroid/util/TypedValue;
    invoke-virtual {p1}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x1010219

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 47
    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    iput v1, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->checkMarkDrawableResId:I

    .line 48
    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->searchQuery:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$002(Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->searchQuery:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100(Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->items:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$202(Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->filteredItems:Ljava/util/List;

    return-object p1
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->filteredItems:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->filteredItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getFilter()Landroid/widget/Filter;
    .locals 1

    .prologue
    .line 110
    new-instance v0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter$1;

    invoke-direct {v0, p0}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter$1;-><init>(Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;)V

    return-object v0
.end method

.method public getItem(I)Lcom/mobnetic/coinguardian/model/Market;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 68
    iget-object v0, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->filteredItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->filteredItems:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/model/Market;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->getItem(I)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 63
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/16 v9, 0x8

    const/4 v5, 0x0

    .line 73
    if-nez p2, :cond_0

    .line 74
    iget-object v6, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->context:Landroid/content/Context;

    invoke-static {v6}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v6

    const v7, 0x7f030026

    invoke-virtual {v6, v7, p3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 77
    :cond_0
    const v6, 0x7f0e0087

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 78
    .local v2, "marketNameView":Landroid/widget/TextView;
    const v6, 0x7f0e0088

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 79
    .local v0, "defaultView":Landroid/widget/TextView;
    const v6, 0x7f0e0089

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/CheckedTextView;

    .line 80
    .local v4, "singleCheckView":Landroid/widget/CheckedTextView;
    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->getItem(I)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v1

    .line 81
    .local v1, "market":Lcom/mobnetic/coinguardian/model/Market;
    if-eqz v1, :cond_4

    .line 83
    iget-object v6, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->searchQuery:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 84
    iget-object v6, v1, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "(?i)("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->searchQuery:Ljava/lang/String;

    invoke-static {v8}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "<b>$1</b>"

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    .line 90
    .local v3, "name":Ljava/lang/CharSequence;
    :goto_0
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    iget-object v6, v1, Lcom/mobnetic/coinguardian/model/Market;->key:Ljava/lang/String;

    iget-object v7, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->marketDefault:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 93
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 97
    :goto_1
    iget-object v6, v1, Lcom/mobnetic/coinguardian/model/Market;->key:Ljava/lang/String;

    if-eqz v6, :cond_1

    iget-object v6, v1, Lcom/mobnetic/coinguardian/model/Market;->key:Ljava/lang/String;

    iget-object v7, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->selectedMarketKey:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    const/4 v5, 0x1

    :cond_1
    invoke-virtual {v4, v5}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    .line 98
    iget v5, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->checkMarkDrawableResId:I

    invoke-virtual {v4, v5}, Landroid/widget/CheckedTextView;->setCheckMarkDrawable(I)V

    .line 105
    .end local v3    # "name":Ljava/lang/CharSequence;
    :goto_2
    return-object p2

    .line 86
    :cond_2
    iget-object v3, v1, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    .restart local v3    # "name":Ljava/lang/CharSequence;
    goto :goto_0

    .line 95
    :cond_3
    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    .line 100
    .end local v3    # "name":Ljava/lang/CharSequence;
    :cond_4
    const v6, 0x7f070040

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setText(I)V

    .line 101
    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 102
    invoke-virtual {v4, v5}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    .line 103
    invoke-virtual {v4, v5}, Landroid/widget/CheckedTextView;->setCheckMarkDrawable(I)V

    goto :goto_2
.end method

.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 3
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    .prologue
    .line 139
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p0, p3}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->getItem(I)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v0

    .line 140
    .local v0, "market":Lcom/mobnetic/coinguardian/model/Market;
    if-eqz v0, :cond_0

    .line 141
    invoke-virtual {p0, p3}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->getItem(I)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v1

    iget-object v1, v1, Lcom/mobnetic/coinguardian/model/Market;->key:Ljava/lang/String;

    iput-object v1, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->marketDefault:Ljava/lang/String;

    .line 142
    iget-object v1, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->marketDefault:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->setMarketDefault(Landroid/content/Context;Ljava/lang/String;)V

    .line 143
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->notifyDataSetChanged()V

    .line 144
    const/4 v1, 0x1

    .line 146
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public swapItems(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mobnetic/coinguardian/model/Market;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/Market;>;"
    iput-object p1, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->items:Ljava/util/List;

    .line 52
    iput-object p1, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->filteredItems:Ljava/util/List;

    .line 53
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->notifyDataSetChanged()V

    .line 54
    return-void
.end method
