.class public Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;
.super Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;
.source "CheckersListFragment.java"

# interfaces
.implements Landroid/support/v4/app/LoaderManager$LoaderCallbacks;
.implements Luk/co/senab/actionbarpulltorefresh/library/listeners/OnRefreshListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment",
        "<",
        "Landroid/database/Cursor;",
        ">;",
        "Landroid/support/v4/app/LoaderManager$LoaderCallbacks",
        "<",
        "Landroid/database/Cursor;",
        ">;",
        "Luk/co/senab/actionbarpulltorefresh/library/listeners/OnRefreshListener;"
    }
.end annotation


# static fields
.field private static final REFRESH_ALL_HINT_DURATION:I = 0x7d0

.field public static final SORT_MODE_CURRENCY:I = 0x1

.field public static final SORT_MODE_EXCHANGE:I = 0x2

.field public static final SORT_MODE_MANUALLY:I


# instance fields
.field private adapter:Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;

.field private dragAndDropUpateTask:Landroid/os/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mPullToRefreshLayout:Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;

.field private refreshAllCompleteRunnable:Ljava/lang/Runnable;

.field private sortByManuallyItem:Landroid/view/MenuItem;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;-><init>()V

    .line 101
    new-instance v0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$2;

    invoke-direct {v0, p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$2;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;)V

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->refreshAllCompleteRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;II)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->onDrop(II)V

    return-void
.end method

.method static synthetic access$100(Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;)Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->mPullToRefreshLayout:Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;)Landroid/view/MenuItem;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->sortByManuallyItem:Landroid/view/MenuItem;

    return-object v0
.end method

.method private deleteCheckerRecord(Landroid/database/Cursor;Z)V
    .locals 2
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "refresh"    # Z

    .prologue
    .line 128
    invoke-static {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->fromCursor(Landroid/database/Cursor;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v0

    .line 129
    .local v0, "checkerRecord":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/mobnetic/coinguardian/util/CheckerRecordHelper;->doBeforeDelete(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    .line 130
    invoke-static {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->fromCursor(Landroid/database/Cursor;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->delete(Z)Z

    .line 131
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/mobnetic/coinguardian/util/CheckerRecordHelper;->doAfterDelete(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    .line 132
    return-void
.end method

.method private editCheckerRecord(Landroid/database/Cursor;)V
    .locals 2
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 124
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->fromCursor(Landroid/database/Cursor;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/activity/CheckerAddActivity;->startCheckerAddActivity(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    .line 125
    return-void
.end method

.method public static getSortOrderString(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 310
    invoke-static {p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getCheckersListSortMode(Landroid/content/Context;)I

    move-result v0

    .line 311
    .local v0, "checkersListSortMode":I
    packed-switch v0, :pswitch_data_0

    .line 314
    const-string v1, "sortOrder ASC"

    .line 318
    :goto_0
    return-object v1

    .line 316
    :pswitch_0
    const-string v1, "currencySrc ASC, currencyDst ASC, marketKey ASC"

    goto :goto_0

    .line 318
    :pswitch_1
    const-string v1, "marketKey ASC, currencySrc ASC, currencyDst ASC"

    goto :goto_0

    .line 311
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private onDrop(II)V
    .locals 13
    .param p1, "from"    # I
    .param p2, "to"    # I

    .prologue
    .line 136
    if-ne p1, p2, :cond_0

    .line 177
    :goto_0
    return-void

    .line 140
    :cond_0
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v10

    invoke-virtual {v10}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 141
    .local v0, "appContext":Landroid/content/Context;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 142
    .local v5, "ops":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    iget-object v10, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->adapter:Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;

    invoke-virtual {v10}, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    .line 143
    .local v1, "cursor":Landroid/database/Cursor;
    if-eqz v1, :cond_1

    .line 144
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_1
    invoke-interface {v1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v10

    if-nez v10, :cond_1

    .line 145
    invoke-interface {v1}, Landroid/database/Cursor;->getPosition()I

    move-result v6

    .line 146
    .local v6, "position":I
    iget-object v10, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->adapter:Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;

    invoke-virtual {v10, v6}, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;->getListPosition(I)I

    move-result v10

    int-to-long v8, v10

    .line 147
    .local v8, "sortOrder":J
    const/4 v10, 0x0

    invoke-interface {v1, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    .line 148
    .local v2, "checkerRecordId":J
    sget-object v10, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v10}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v10

    .line 149
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v10

    const-string v11, "mechdb_notify"

    const/4 v12, 0x0

    .line 150
    invoke-static {v12}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v10

    invoke-virtual {v10}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v7

    .line 151
    .local v7, "uri":Landroid/net/Uri;
    invoke-static {v7}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v10

    const-string v11, "sortOrder"

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v10

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_1

    .line 155
    .end local v2    # "checkerRecordId":J
    .end local v6    # "position":I
    .end local v7    # "uri":Landroid/net/Uri;
    .end local v8    # "sortOrder":J
    :cond_1
    iget-object v10, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->dragAndDropUpateTask:Landroid/os/AsyncTask;

    if-eqz v10, :cond_2

    .line 156
    iget-object v10, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->dragAndDropUpateTask:Landroid/os/AsyncTask;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/os/AsyncTask;->cancel(Z)Z

    .line 157
    :cond_2
    new-instance v10, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$3;

    invoke-direct {v10, p0, v0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$3;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;Landroid/content/Context;)V

    iput-object v10, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->dragAndDropUpateTask:Landroid/os/AsyncTask;

    .line 173
    :try_start_0
    iget-object v10, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->dragAndDropUpateTask:Landroid/os/AsyncTask;

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/util/ArrayList;

    const/4 v12, 0x0

    aput-object v5, v11, v12

    invoke-static {v10, v11}, Lcom/mobnetic/coinguardian/util/AsyncTaskCompat;->execute(Landroid/os/AsyncTask;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 174
    :catch_0
    move-exception v4

    .line 175
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method

.method private setNewList(Landroid/database/Cursor;)V
    .locals 1
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 282
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_1

    .line 288
    :cond_0
    :goto_0
    return-void

    .line 285
    :cond_1
    if-eqz p1, :cond_2

    .line 286
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->adapter:Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;

    invoke-virtual {v0, p1}, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    .line 287
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->setListShown(Z)V

    goto :goto_0
.end method


# virtual methods
.method protected getActionModeOrContextMenuResId()I
    .locals 1

    .prologue
    .line 249
    const v0, 0x7f100004

    return v0
.end method

.method protected onActionModeActive(Z)V
    .locals 1
    .param p1, "active"    # Z

    .prologue
    .line 274
    invoke-super {p0, p1}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->onActionModeActive(Z)V

    .line 275
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->adapter:Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;

    invoke-virtual {v0, p1}, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;->setActionModeActive(Z)V

    .line 276
    return-void
.end method

.method protected onActionModeItemsCheckedCountChanged(Landroid/view/ActionMode;I)V
    .locals 3
    .param p1, "mode"    # Landroid/view/ActionMode;
    .param p2, "checkedItemCount"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 255
    invoke-virtual {p1}, Landroid/view/ActionMode;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const v2, 0x7f0e00ab

    invoke-interface {v1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    if-ne p2, v0, :cond_0

    :goto_0
    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 256
    invoke-super {p0, p1, p2}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->onActionModeItemsCheckedCountChanged(Landroid/view/ActionMode;I)V

    .line 257
    return-void

    .line 255
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onActionModeOrContextMenuItemClicked(ILandroid/database/Cursor;IIZ)Z
    .locals 1
    .param p1, "menuItemId"    # I
    .param p2, "checkedItem"    # Landroid/database/Cursor;
    .param p3, "listItemPosition"    # I
    .param p4, "checkedItemsCount"    # I
    .param p5, "isForLastItem"    # Z

    .prologue
    const/4 v0, 0x1

    .line 261
    sparse-switch p1, :sswitch_data_0

    .line 269
    invoke-super/range {p0 .. p5}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->onActionModeOrContextMenuItemClicked(ILjava/lang/Object;IIZ)Z

    move-result v0

    :goto_0
    return v0

    .line 263
    :sswitch_0
    invoke-direct {p0, p2}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->editCheckerRecord(Landroid/database/Cursor;)V

    goto :goto_0

    .line 266
    :sswitch_1
    invoke-direct {p0, p2, p5}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->deleteCheckerRecord(Landroid/database/Cursor;Z)V

    goto :goto_0

    .line 261
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0e00a3 -> :sswitch_1
        0x7f0e00ab -> :sswitch_0
    .end sparse-switch
.end method

.method protected bridge synthetic onActionModeOrContextMenuItemClicked(ILjava/lang/Object;IIZ)Z
    .locals 6

    .prologue
    .line 44
    move-object v2, p2

    check-cast v2, Landroid/database/Cursor;

    move-object v0, p0

    move v1, p1

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->onActionModeOrContextMenuItemClicked(ILandroid/database/Cursor;IIZ)Z

    move-result v0

    return v0
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .locals 7
    .param p1, "arg0"    # I
    .param p2, "arg1"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 293
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget-object v2, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-static {v5}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getSortOrderString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    move-object v5, v4

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 4
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 184
    const v2, 0x7f100003

    invoke-virtual {p2, v2, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 186
    const v2, 0x7f0e00a7

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    iput-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->sortByManuallyItem:Landroid/view/MenuItem;

    .line 187
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getCheckersListSortMode(Landroid/content/Context;)I

    move-result v1

    .line 189
    .local v1, "checkersListSortMode":I
    packed-switch v1, :pswitch_data_0

    .line 192
    const v0, 0x7f0e00a7

    .line 201
    .local v0, "checkedSortMenuItem":I
    :goto_0
    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 203
    invoke-super {p0, p1, p2}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 204
    return-void

    .line 195
    .end local v0    # "checkedSortMenuItem":I
    :pswitch_0
    const v0, 0x7f0e00a8

    .line 196
    .restart local v0    # "checkedSortMenuItem":I
    goto :goto_0

    .line 198
    .end local v0    # "checkedSortMenuItem":I
    :pswitch_1
    const v0, 0x7f0e00a9

    .restart local v0    # "checkedSortMenuItem":I
    goto :goto_0

    .line 189
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 59
    const v1, 0x7f030020

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 60
    .local v0, "view":Landroid/view/View;
    invoke-static {v0}, Landroid/support/v4/app/ListFragmentLayout;->setupIds(Landroid/view/View;)V

    .line 61
    return-object v0
.end method

.method public onDestroyView()V
    .locals 2

    .prologue
    .line 112
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->mPullToRefreshLayout:Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->refreshAllCompleteRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 113
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->mPullToRefreshLayout:Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;

    .line 115
    invoke-super {p0}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->onDestroyView()V

    .line 116
    return-void
.end method

.method public onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 1
    .param p1, "l"    # Landroid/widget/ListView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 120
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->adapter:Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;

    invoke-virtual {v0, p3}, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    invoke-direct {p0, v0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->editCheckerRecord(Landroid/database/Cursor;)V

    .line 121
    return-void
.end method

.method public onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V
    .locals 0
    .param p2, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .prologue
    .line 298
    .local p1, "arg0":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    invoke-direct {p0, p2}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->setNewList(Landroid/database/Cursor;)V

    .line 299
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 44
    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p0, p1, p2}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onLoaderReset(Landroid/support/v4/content/Loader;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 303
    .local p1, "arg0":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->setNewList(Landroid/database/Cursor;)V

    .line 304
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 5
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v0, 0x1

    .line 208
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0e00a5

    if-ne v1, v2, :cond_0

    .line 209
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, v3}, Lcom/mobnetic/coinguardian/activity/CheckerAddActivity;->startCheckerAddActivity(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    .line 232
    :goto_0
    return v0

    .line 211
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0e00a7

    if-ne v1, v2, :cond_2

    .line 212
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, v4}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->setCheckersListSortMode(Landroid/content/Context;I)V

    .line 213
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 214
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, v4, v3, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 215
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobnetic/coinguardian/appwidget/WidgetProvider;->refreshWidget(Landroid/content/Context;)V

    .line 232
    :cond_1
    :goto_1
    invoke-super {p0, p1}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0

    .line 216
    :cond_2
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0e00a8

    if-ne v1, v2, :cond_3

    .line 217
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->setCheckersListSortMode(Landroid/content/Context;I)V

    .line 218
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 219
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, v4, v3, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 220
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobnetic/coinguardian/appwidget/WidgetProvider;->refreshWidget(Landroid/content/Context;)V

    goto :goto_1

    .line 221
    :cond_3
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0e00a9

    if-ne v1, v2, :cond_4

    .line 222
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const/4 v2, 0x2

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->setCheckersListSortMode(Landroid/content/Context;I)V

    .line 223
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 224
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, v4, v3, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 225
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobnetic/coinguardian/appwidget/WidgetProvider;->refreshWidget(Landroid/content/Context;)V

    goto :goto_1

    .line 226
    :cond_4
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0e00aa

    if-ne v1, v2, :cond_1

    .line 227
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->mPullToRefreshLayout:Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;

    invoke-virtual {v1, v0}, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;->setRefreshing(Z)V

    .line 228
    invoke-virtual {p0, v3}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->onRefreshStarted(Landroid/view/View;)V

    goto :goto_0
.end method

.method public onRefreshStarted(Landroid/view/View;)V
    .locals 4
    .param p1, "unused"    # Landroid/view/View;

    .prologue
    .line 236
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->mPullToRefreshLayout:Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_1

    .line 241
    :cond_0
    :goto_0
    return-void

    .line 239
    :cond_1
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->refreshAllEnabledCheckerRecords(Landroid/content/Context;)V

    .line 240
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->mPullToRefreshLayout:Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->refreshAllCompleteRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 66
    invoke-super {p0, p1, p2}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 68
    invoke-virtual {p0, v3}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->setHasOptionsMenu(Z)V

    move-object v0, p1

    .line 71
    check-cast v0, Landroid/view/ViewGroup;

    .line 72
    .local v0, "viewGroup":Landroid/view/ViewGroup;
    new-instance v1, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->mPullToRefreshLayout:Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;

    .line 75
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh;->from(Landroid/app/Activity;)Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh$SetupWizard;

    move-result-object v1

    .line 77
    invoke-virtual {v1, v0}, Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh$SetupWizard;->insertLayoutInto(Landroid/view/ViewGroup;)Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh$SetupWizard;

    move-result-object v1

    new-array v2, v3, [I

    .line 78
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/ListView;->getId()I

    move-result v3

    aput v3, v2, v4

    invoke-virtual {v1, v2}, Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh$SetupWizard;->theseChildrenArePullable([I)Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh$SetupWizard;

    move-result-object v1

    .line 79
    invoke-virtual {v1, p0}, Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh$SetupWizard;->listener(Luk/co/senab/actionbarpulltorefresh/library/listeners/OnRefreshListener;)Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh$SetupWizard;

    move-result-object v1

    .line 80
    invoke-static {}, Luk/co/senab/actionbarpulltorefresh/library/Options;->create()Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;

    move-result-object v2

    const/16 v3, 0x7d0

    invoke-virtual {v2, v3}, Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;->minimize(I)Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;

    move-result-object v2

    invoke-virtual {v2}, Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;->build()Luk/co/senab/actionbarpulltorefresh/library/Options;

    move-result-object v2

    invoke-virtual {v1, v2}, Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh$SetupWizard;->options(Luk/co/senab/actionbarpulltorefresh/library/Options;)Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh$SetupWizard;

    move-result-object v1

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->mPullToRefreshLayout:Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;

    .line 81
    invoke-virtual {v1, v2}, Luk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh$SetupWizard;->setup(Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout;)V

    .line 83
    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$1;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$1;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->adapter:Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;

    .line 90
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->adapter:Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 91
    invoke-virtual {p0, v4}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->setListShownNoAnimation(Z)V

    .line 92
    const v1, 0x7f07005a

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->setEmptyText(Ljava/lang/CharSequence;)V

    .line 93
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 94
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 95
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v1

    const v2, 0x106000d

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setSelector(I)V

    .line 96
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->enableActionModeOrContextMenu()V

    .line 98
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    invoke-virtual {v1, v4, v5, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 99
    return-void
.end method
