.class public Lcom/mobnetic/coinguardian/activity/CheckersListActivity;
.super Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;
.source "CheckersListActivity.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity",
        "<",
        "Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;",
        ">;"
    }
.end annotation


# static fields
.field private static final CURRENT_NEWS_ID:I = 0x3


# instance fields
.field donateBar:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0073
    .end annotation
.end field

.field private wasDialogShown:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;-><init>()V

    return-void
.end method

.method static synthetic access$002(Lcom/mobnetic/coinguardian/activity/CheckersListActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/activity/CheckersListActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 22
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/activity/CheckersListActivity;->wasDialogShown:Z

    return p1
.end method


# virtual methods
.method protected bridge synthetic createChildFragment()Landroid/support/v4/app/Fragment;
    .locals 1

    .prologue
    .line 22
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/CheckersListActivity;->createChildFragment()Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;

    move-result-object v0

    return-object v0
.end method

.method protected createChildFragment()Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;
    .locals 1

    .prologue
    .line 107
    new-instance v0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;-><init>()V

    return-object v0
.end method

.method protected getContentViewResId()I
    .locals 1

    .prologue
    .line 102
    const v0, 0x7f03001f

    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x0

    .line 32
    invoke-super {p0, p1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 34
    const v2, 0x7f07000d

    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/activity/CheckersListActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 35
    .local v0, "appName":Ljava/lang/String;
    new-instance v2, Lcom/tjeannin/apprate/AppRate;

    invoke-direct {v2, p0}, Lcom/tjeannin/apprate/AppRate;-><init>(Landroid/app/Activity;)V

    .line 36
    invoke-virtual {v2, v3}, Lcom/tjeannin/apprate/AppRate;->setShowIfAppHasCrashed(Z)Lcom/tjeannin/apprate/AppRate;

    move-result-object v2

    const-wide/16 v4, 0x4

    .line 37
    invoke-virtual {v2, v4, v5}, Lcom/tjeannin/apprate/AppRate;->setMinDaysUntilPrompt(J)Lcom/tjeannin/apprate/AppRate;

    move-result-object v2

    const-wide/16 v4, 0xa

    .line 38
    invoke-virtual {v2, v4, v5}, Lcom/tjeannin/apprate/AppRate;->setMinLaunchesUntilPrompt(J)Lcom/tjeannin/apprate/AppRate;

    move-result-object v1

    .line 39
    .local v1, "appRate":Lcom/tjeannin/apprate/AppRate;
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f07009e

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v3

    .line 40
    invoke-virtual {p0, v4, v5}, Lcom/mobnetic/coinguardian/activity/CheckersListActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 41
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/CheckersListActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f07009d

    invoke-virtual {v4, v5, v0}, Landroid/content/res/Resources;->getText(ILjava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v4, 0x7f07009c

    .line 42
    invoke-virtual {v2, v4, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v4, 0x7f07009b

    .line 43
    invoke-virtual {v2, v4, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v4, 0x7f07009a

    .line 44
    invoke-virtual {v2, v4, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 45
    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 39
    invoke-virtual {v1, v2}, Lcom/tjeannin/apprate/AppRate;->setCustomDialog(Landroid/app/AlertDialog$Builder;)Lcom/tjeannin/apprate/AppRate;

    .line 46
    invoke-virtual {v1}, Lcom/tjeannin/apprate/AppRate;->init()V

    .line 48
    if-nez p1, :cond_0

    .line 49
    invoke-static {p0}, Lcom/mobnetic/coinguardian/appwidget/WidgetProvider;->refreshWidget(Landroid/content/Context;)V

    .line 50
    invoke-static {p0}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->checkIfAlarmsAreSet(Landroid/content/Context;)V

    .line 53
    :cond_0
    if-eqz p1, :cond_2

    const-string v2, "wasDialogShown"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    :goto_0
    iput-boolean v2, p0, Lcom/mobnetic/coinguardian/activity/CheckersListActivity;->wasDialogShown:Z

    .line 54
    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/activity/CheckersListActivity;->wasDialogShown:Z

    if-nez v2, :cond_1

    .line 55
    invoke-static {p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->isDefaultItemAdded(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 56
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 57
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f07005c

    .line 58
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f07005b

    .line 59
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f070059

    new-instance v4, Lcom/mobnetic/coinguardian/activity/CheckersListActivity$1;

    invoke-direct {v4, p0}, Lcom/mobnetic/coinguardian/activity/CheckersListActivity$1;-><init>(Lcom/mobnetic/coinguardian/activity/CheckersListActivity;)V

    .line 60
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 67
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 90
    :cond_1
    :goto_1
    invoke-static {p0}, Lbutterknife/ButterKnife;->inject(Landroid/app/Activity;)V

    .line 91
    return-void

    :cond_2
    move v2, v3

    .line 53
    goto :goto_0

    .line 68
    :cond_3
    const/4 v2, 0x3

    invoke-static {p0, v2}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->wasNewsShown(Landroid/content/Context;I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 69
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 70
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f07004e

    .line 71
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f07004d

    .line 72
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x104000a

    new-instance v4, Lcom/mobnetic/coinguardian/activity/CheckersListActivity$3;

    invoke-direct {v4, p0}, Lcom/mobnetic/coinguardian/activity/CheckersListActivity$3;-><init>(Lcom/mobnetic/coinguardian/activity/CheckersListActivity;)V

    .line 73
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f070063

    new-instance v4, Lcom/mobnetic/coinguardian/activity/CheckersListActivity$2;

    invoke-direct {v4, p0}, Lcom/mobnetic/coinguardian/activity/CheckersListActivity$2;-><init>(Lcom/mobnetic/coinguardian/activity/CheckersListActivity;)V

    .line 79
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 86
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_1
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 128
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/CheckersListActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f100002

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 129
    invoke-super {p0, p1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onDonateClicked(Landroid/view/View;)V
    .locals 1
    .param p1, "target"    # Landroid/view/View;

    .prologue
    .line 120
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/mobnetic/coinguardian/activity/SettingsMainActivity;->startSettingsMainActivity(Landroid/content/Context;Z)V

    .line 121
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 134
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0e00a4

    if-ne v0, v1, :cond_0

    .line 135
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/mobnetic/coinguardian/activity/SettingsMainActivity;->startSettingsMainActivity(Landroid/content/Context;Z)V

    .line 136
    const/4 v0, 0x1

    .line 138
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 112
    const-string v0, "wasDialogShown"

    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/activity/CheckersListActivity;->wasDialogShown:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 113
    invoke-super {p0, p1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 114
    return-void
.end method

.method protected onStart()V
    .locals 2

    .prologue
    .line 95
    invoke-super {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->onStart()V

    .line 97
    iget-object v1, p0, Lcom/mobnetic/coinguardian/activity/CheckersListActivity;->donateBar:Landroid/view/View;

    invoke-static {p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getDonationMade(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x8

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 98
    return-void

    .line 97
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
