.class Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter$1;
.super Landroid/widget/Filter;
.source "MarketPickerListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->getFilter()Landroid/widget/Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    .prologue
    .line 110
    iput-object p1, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter$1;->this$0:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    invoke-direct {p0}, Landroid/widget/Filter;-><init>()V

    return-void
.end method


# virtual methods
.method protected performFiltering(Ljava/lang/CharSequence;)Landroid/widget/Filter$FilterResults;
    .locals 7
    .param p1, "newSearchQuery"    # Ljava/lang/CharSequence;

    .prologue
    .line 113
    iget-object v3, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter$1;->this$0:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    check-cast p1, Ljava/lang/String;

    .end local p1    # "newSearchQuery":Ljava/lang/CharSequence;
    invoke-static {v3, p1}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->access$002(Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;Ljava/lang/String;)Ljava/lang/String;

    .line 114
    new-instance v0, Landroid/widget/Filter$FilterResults;

    invoke-direct {v0}, Landroid/widget/Filter$FilterResults;-><init>()V

    .line 115
    .local v0, "filterResults":Landroid/widget/Filter$FilterResults;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 116
    .local v2, "markets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mobnetic/coinguardian/model/Market;>;"
    iget-object v3, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter$1;->this$0:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    invoke-static {v3}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->access$000(Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 117
    iget-object v3, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter$1;->this$0:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    invoke-static {v3}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->access$100(Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 124
    :cond_0
    iput-object v2, v0, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    .line 125
    return-object v0

    .line 118
    :cond_1
    iget-object v3, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter$1;->this$0:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    invoke-virtual {v3}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 119
    iget-object v3, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter$1;->this$0:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    invoke-static {v3}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->access$100(Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mobnetic/coinguardian/model/Market;

    .line 120
    .local v1, "market":Lcom/mobnetic/coinguardian/model/Market;
    iget-object v4, v1, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter$1;->this$0:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    invoke-static {v5}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->access$000(Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;)Ljava/lang/String;

    move-result-object v5

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 121
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method protected publishResults(Ljava/lang/CharSequence;Landroid/widget/Filter$FilterResults;)V
    .locals 2
    .param p1, "newSearchQuery"    # Ljava/lang/CharSequence;
    .param p2, "results"    # Landroid/widget/Filter$FilterResults;

    .prologue
    .line 131
    iget-object v1, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter$1;->this$0:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    iget-object v0, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-static {v1, v0}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->access$202(Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;Ljava/util/List;)Ljava/util/List;

    .line 132
    iget-object v0, p0, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter$1;->this$0:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->notifyDataSetChanged()V

    .line 133
    return-void
.end method
