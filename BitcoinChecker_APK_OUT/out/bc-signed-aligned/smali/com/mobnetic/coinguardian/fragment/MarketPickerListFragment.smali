.class public Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;
.super Landroid/support/v4/app/ListFragment;
.source "MarketPickerListFragment.java"

# interfaces
.implements Landroid/support/v7/widget/SearchView$OnQueryTextListener;


# static fields
.field public static final SORT_MODE_ALPHABETICALLY:I = 0x0

.field public static final SORT_MODE_NEWEST_FIRST:I = 0x1


# instance fields
.field private adapter:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

.field private searchQuery:Ljava/lang/String;

.field private searchView:Landroid/support/v7/widget/SearchView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/support/v4/app/ListFragment;-><init>()V

    return-void
.end method

.method private getNewList()V
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 66
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getMarketPickerListSortMode(Landroid/content/Context;)I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    invoke-direct {p0, v0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->getNewList(Z)V

    .line 67
    return-void

    .line 66
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getNewList(Z)V
    .locals 5
    .param p1, "newestFirst"    # Z

    .prologue
    .line 70
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 71
    .local v0, "items":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/Market;>;"
    sget-object v3, Lcom/mobnetic/coinguardian/config/MarketsConfig;->MARKETS:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    .line 72
    .local v2, "marketsList":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/mobnetic/coinguardian/model/Market;>;"
    if-eqz p1, :cond_0

    .line 73
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mobnetic/coinguardian/model/Market;

    .line 74
    .local v1, "market":Lcom/mobnetic/coinguardian/model/Market;
    const/4 v4, 0x0

    invoke-interface {v0, v4, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_0

    .line 76
    .end local v1    # "market":Lcom/mobnetic/coinguardian/model/Market;
    :cond_0
    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 77
    new-instance v3, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment$1;

    invoke-direct {v3, p0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment$1;-><init>(Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;)V

    invoke-static {v0, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 86
    :cond_1
    invoke-direct {p0, v0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->setNewList(Ljava/util/List;)V

    .line 87
    return-void
.end method

.method private onSuggestMoreExchangesClicked()V
    .locals 1

    .prologue
    .line 114
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;->startSettingsMainActivity(Landroid/content/Context;)V

    .line 115
    return-void
.end method

.method private setNewList(Ljava/util/List;)V
    .locals 2
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
    .line 90
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/Market;>;"
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->adapter:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    invoke-virtual {v0, p1}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->swapItems(Ljava/util/List;)V

    .line 91
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->adapter:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->getFilter()Landroid/widget/Filter;

    move-result-object v0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->searchQuery:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    .line 92
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->adapter:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 93
    return-void
.end method


# virtual methods
.method public onBackPressed()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 121
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->searchView:Landroid/support/v7/widget/SearchView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->searchView:Landroid/support/v7/widget/SearchView;

    invoke-virtual {v1}, Landroid/support/v7/widget/SearchView;->isIconified()Z

    move-result v1

    if-nez v1, :cond_0

    .line 122
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->searchView:Landroid/support/v7/widget/SearchView;

    const-string v2, ""

    invoke-virtual {v1, v2, v0}, Landroid/support/v7/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    .line 123
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->searchView:Landroid/support/v7/widget/SearchView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/SearchView;->setIconified(Z)V

    .line 126
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 5
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v4, 0x0

    .line 134
    const v2, 0x7f100005

    invoke-virtual {p2, v2, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 136
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getMarketPickerListSortMode(Landroid/content/Context;)I

    move-result v1

    .line 138
    .local v1, "marketPickerListSortMode":I
    packed-switch v1, :pswitch_data_0

    .line 141
    const v0, 0x7f0e00ad

    .line 147
    .local v0, "checkedSortMenuItem":I
    :goto_0
    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 149
    const v2, 0x7f0e00ac

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v4/view/MenuItemCompat;->getActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/SearchView;

    iput-object v2, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->searchView:Landroid/support/v7/widget/SearchView;

    .line 150
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->searchView:Landroid/support/v7/widget/SearchView;

    invoke-virtual {v2, p0}, Landroid/support/v7/widget/SearchView;->setOnQueryTextListener(Landroid/support/v7/widget/SearchView$OnQueryTextListener;)V

    .line 151
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->searchView:Landroid/support/v7/widget/SearchView;

    iget-object v3, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->searchQuery:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/support/v7/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    .line 152
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->searchQuery:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 153
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->searchView:Landroid/support/v7/widget/SearchView;

    invoke-virtual {v2, v4}, Landroid/support/v7/widget/SearchView;->setIconified(Z)V

    .line 155
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/ListFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 156
    return-void

    .line 144
    .end local v0    # "checkedSortMenuItem":I
    :pswitch_0
    const v0, 0x7f0e00ae

    .restart local v0    # "checkedSortMenuItem":I
    goto :goto_0

    .line 138
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 61
    invoke-super {p0}, Landroid/support/v4/app/ListFragment;->onDestroyView()V

    .line 62
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->adapter:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    .line 63
    return-void
.end method

.method public onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 4
    .param p1, "l"    # Landroid/widget/ListView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 100
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->adapter:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    if-eqz v2, :cond_0

    .line 101
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->adapter:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    invoke-virtual {v2, p3}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->getItem(I)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v1

    .line 102
    .local v1, "market":Lcom/mobnetic/coinguardian/model/Market;
    if-nez v1, :cond_1

    .line 103
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->onSuggestMoreExchangesClicked()V

    .line 111
    .end local v1    # "market":Lcom/mobnetic/coinguardian/model/Market;
    :cond_0
    :goto_0
    return-void

    .line 105
    .restart local v1    # "market":Lcom/mobnetic/coinguardian/model/Market;
    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 106
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "market_key"

    iget-object v3, v1, Lcom/mobnetic/coinguardian/model/Market;->key:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 107
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const/4 v3, -0x1

    invoke-virtual {v2, v3, v0}, Landroid/support/v4/app/FragmentActivity;->setResult(ILandroid/content/Intent;)V

    .line 108
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->finish()V

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v3, 0x0

    const/4 v0, 0x1

    .line 160
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0e00ad

    if-ne v1, v2, :cond_0

    .line 161
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, v3}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->setMarketPickerListSortMode(Landroid/content/Context;I)V

    .line 162
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 163
    invoke-direct {p0, v3}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->getNewList(Z)V

    .line 172
    :goto_0
    return v0

    .line 165
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0e00ae

    if-ne v1, v2, :cond_1

    .line 166
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->setMarketPickerListSortMode(Landroid/content/Context;I)V

    .line 167
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 168
    invoke-direct {p0, v0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->getNewList(Z)V

    goto :goto_0

    .line 172
    :cond_1
    invoke-super {p0, p1}, Landroid/support/v4/app/ListFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method public onQueryTextChange(Ljava/lang/String;)Z
    .locals 1
    .param p1, "searchQuery"    # Ljava/lang/String;

    .prologue
    .line 180
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->searchQuery:Ljava/lang/String;

    .line 181
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->adapter:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;->getFilter()Landroid/widget/Filter;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    .line 182
    const/4 v0, 0x1

    return v0
.end method

.method public onQueryTextSubmit(Ljava/lang/String;)Z
    .locals 2
    .param p1, "searchQuery"    # Ljava/lang/String;

    .prologue
    .line 187
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->searchView:Landroid/support/v7/widget/SearchView;

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/util/Utils;->hideKeyboard(Landroid/content/Context;Landroid/view/View;)V

    .line 188
    const/4 v0, 0x1

    return v0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 55
    const-string v0, "searchQuery"

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->searchQuery:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    invoke-super {p0, p1}, Landroid/support/v4/app/ListFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 57
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 43
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/ListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 45
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "market_key"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 46
    .local v0, "selectedarketKey":Ljava/lang/String;
    new-instance v1, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->adapter:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    .line 47
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v1

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->adapter:Lcom/mobnetic/coinguardian/adapter/MarketPickerListAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 48
    if-eqz p2, :cond_0

    const-string v1, "searchQuery"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    iput-object v1, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->searchQuery:Ljava/lang/String;

    .line 49
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->setHasOptionsMenu(Z)V

    .line 50
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->getNewList()V

    .line 51
    return-void

    .line 48
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
