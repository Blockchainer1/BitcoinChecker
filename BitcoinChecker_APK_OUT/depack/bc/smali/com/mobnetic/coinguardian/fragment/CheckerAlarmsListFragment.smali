.class public Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;
.super Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;
.source "CheckerAlarmsListFragment.java"

# interfaces
.implements Landroid/support/v4/app/LoaderManager$LoaderCallbacks;


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
        ">;"
    }
.end annotation


# instance fields
.field private adapter:Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;-><init>()V

    return-void
.end method

.method private deleteCheckerAlarmRecord(Landroid/database/Cursor;Z)V
    .locals 1
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "refresh"    # Z

    .prologue
    .line 52
    invoke-static {p1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->fromCursor(Landroid/database/Cursor;)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->delete(Z)Z

    .line 53
    return-void
.end method

.method private setNewList(Landroid/database/Cursor;)V
    .locals 1
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_1

    .line 83
    :cond_0
    :goto_0
    return-void

    .line 82
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->setListShown(Z)V

    goto :goto_0
.end method


# virtual methods
.method protected getActionModeOrContextMenuResId()I
    .locals 1

    .prologue
    .line 60
    const v0, 0x7f100001

    return v0
.end method

.method protected onActionModeOrContextMenuItemClicked(ILandroid/database/Cursor;IIZ)Z
    .locals 1
    .param p1, "menuItemId"    # I
    .param p2, "checkedItem"    # Landroid/database/Cursor;
    .param p3, "listItemPosition"    # I
    .param p4, "checkedItemsCount"    # I
    .param p5, "isForLastItem"    # Z

    .prologue
    .line 65
    packed-switch p1, :pswitch_data_0

    .line 70
    invoke-super/range {p0 .. p5}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->onActionModeOrContextMenuItemClicked(ILjava/lang/Object;IIZ)Z

    move-result v0

    :goto_0
    return v0

    .line 67
    :pswitch_0
    invoke-direct {p0, p2, p5}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->deleteCheckerAlarmRecord(Landroid/database/Cursor;Z)V

    .line 68
    const/4 v0, 0x1

    goto :goto_0

    .line 65
    nop

    :pswitch_data_0
    .packed-switch 0x7f0e00a3
        :pswitch_0
    .end packed-switch
.end method

.method protected bridge synthetic onActionModeOrContextMenuItemClicked(ILjava/lang/Object;IIZ)Z
    .locals 6

    .prologue
    .line 17
    move-object v2, p2

    check-cast v2, Landroid/database/Cursor;

    move-object v0, p0

    move v1, p1

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->onActionModeOrContextMenuItemClicked(ILandroid/database/Cursor;IIZ)Z

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

    .line 87
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget-object v2, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->PROJECTION:[Ljava/lang/String;

    move-object v5, v4

    move-object v6, v4

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 0
    .param p1, "l"    # Landroid/widget/ListView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 43
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
    .line 92
    .local p1, "arg0":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    invoke-direct {p0, p2}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->setNewList(Landroid/database/Cursor;)V

    .line 93
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 17
    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p0, p1, p2}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

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
    .line 97
    .local p1, "arg0":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->setNewList(Landroid/database/Cursor;)V

    .line 98
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 23
    invoke-super {p0, p1, p2}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 25
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->setHasOptionsMenu(Z)V

    .line 28
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->adapter:Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 29
    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->setListShownNoAnimation(Z)V

    .line 30
    const v0, 0x7f070058

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->setEmptyText(Ljava/lang/CharSequence;)V

    .line 31
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 32
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 33
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v0

    const v1, 0x106000d

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelector(I)V

    .line 34
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->enableActionModeOrContextMenu()V

    .line 36
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, v2, v3, p0}, Landroid/support/v4/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 37
    return-void
.end method
