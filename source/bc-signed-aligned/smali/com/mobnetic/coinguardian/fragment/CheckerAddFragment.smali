.class public Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;
.super Landroid/support/v4/app/Fragment;
.source "CheckerAddFragment.java"


# static fields
.field private static final EXTRA_ALARM_RECORDS:Ljava/lang/String; = "alarm_records"

.field private static final EXTRA_REMOVED_ALARM_RECORD_IDS:Ljava/lang/String; = "removed_alarm_record_ids"

.field private static final EXTRA_UNSAVED_CHANGES:Ljava/lang/String; = "unsaved_changes"

.field private static final REQ_EDIT_ALARM:I = 0xc8

.field private static final REQ_MARKET_PICKER:I = 0xc7


# instance fields
.field private alarmRecords:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mobnetic/coinguardian/db/content/AlarmRecord;",
            ">;"
        }
    .end annotation
.end field

.field alarmSectionHeader:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e006f
    .end annotation
.end field

.field alarmSectionWrapper:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e006e
    .end annotation
.end field

.field private alarmsAdapter:Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

.field alarmsListView:Lcom/linearlistview/LinearListView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0072
    .end annotation
.end field

.field checkSectionWrapper:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0067
    .end annotation
.end field

.field checkTTSView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e006d
    .end annotation
.end field

.field private checkerAddAlarmFragment:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

.field checkerAddAlarmFragmentWrapper:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0070
    .end annotation
.end field

.field private checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

.field currencyDstSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0063
    .end annotation
.end field

.field currencyDstSubunitSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e006a
    .end annotation
.end field

.field private currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

.field currencySpinnersAndDynamicPairsWrapper:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0060
    .end annotation
.end field

.field currencySpinnersWrapper:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0061
    .end annotation
.end field

.field currencySrcSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0062
    .end annotation
.end field

.field currencySrcSubunitSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0069
    .end annotation
.end field

.field dynamicCurrencyPairsInfoView:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0065
    .end annotation
.end field

.field dynamicCurrencyPairsNoSyncYetView:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0066
    .end annotation
.end field

.field dynamicCurrencyPairsWarningView:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0064
    .end annotation
.end field

.field enabledView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e005d
    .end annotation
.end field

.field frequencySpinner:Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e006b
    .end annotation
.end field

.field futuresContractTypeSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0068
    .end annotation
.end field

.field marketCautionView:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e005f
    .end annotation
.end field

.field marketSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewPreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e005e
    .end annotation
.end field

.field notificationPriorityView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e006c
    .end annotation
.end field

.field private removedAlarmRecordIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field scrollView:Landroid/widget/ScrollView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e005c
    .end annotation
.end field

.field private unsavedChanges:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 69
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 105
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->unsavedChanges:Z

    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->removedAlarmRecordIds:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->clearLastAndPreviousCheck()V

    return-void
.end method

.method static synthetic access$1100(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->clearAlarmsLastCheckPoint()V

    return-void
.end method

.method static synthetic access$1200(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshCurrencySrcSubunits()V

    return-void
.end method

.method static synthetic access$1300(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Lcom/mobnetic/coinguardian/model/Market;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;
    .param p1, "x1"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p2, "x2"    # Z

    .prologue
    .line 69
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshCurrencyDstSpinnerForMarket(Lcom/mobnetic/coinguardian/model/Market;Z)V

    return-void
.end method

.method static synthetic access$1400(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshCurrencyDstSubunits()V

    return-void
.end method

.method static synthetic access$1500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->save()V

    return-void
.end method

.method static synthetic access$202(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 69
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->unsavedChanges:Z

    return p1
.end method

.method static synthetic access$300(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshAlarms()V

    return-void
.end method

.method static synthetic access$400(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmsAdapter:Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/model/Market;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getSelectedMarket()Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    return-object v0
.end method

.method static synthetic access$702(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;
    .param p1, "x1"    # Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    return-object p1
.end method

.method static synthetic access$800(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Lcom/mobnetic/coinguardian/model/Market;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;
    .param p1, "x1"    # Lcom/mobnetic/coinguardian/model/Market;

    .prologue
    .line 69
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshDynamicCurrencyPairsView(Lcom/mobnetic/coinguardian/model/Market;)V

    return-void
.end method

.method static synthetic access$900(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Lcom/mobnetic/coinguardian/model/Market;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;
    .param p1, "x1"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p2, "x2"    # Z

    .prologue
    .line 69
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshCurrencySpinnersForMarket(Lcom/mobnetic/coinguardian/model/Market;Z)V

    return-void
.end method

.method private clearAlarmsLastCheckPoint()V
    .locals 3

    .prologue
    .line 632
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .line 633
    .local v0, "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getLastCheckPointTicker()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 634
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->unsavedChanges:Z

    .line 635
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setLastCheckPointTicker(Ljava/lang/String;)V

    goto :goto_0

    .line 637
    .end local v0    # "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    :cond_1
    return-void
.end method

.method private clearLastAndPreviousCheck()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 625
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getLastCheckTicker()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getPreviousCheckTicker()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 626
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->unsavedChanges:Z

    .line 627
    :cond_1
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setLastCheckTicker(Ljava/lang/String;)V

    .line 628
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setPreviousCheckTicker(Ljava/lang/String;)V

    .line 629
    return-void
.end method

.method private delete()V
    .locals 6

    .prologue
    .line 733
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    .line 734
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardian/util/CheckerRecordHelper;->doBeforeDelete(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    .line 736
    :try_start_0
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->delete(Z)Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 740
    :goto_0
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardian/util/CheckerRecordHelper;->doAfterDelete(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    .line 742
    :cond_0
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->setResult(I)V

    .line 743
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->finish()V

    .line 744
    return-void

    .line 737
    :catch_0
    move-exception v0

    .line 738
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

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
    .line 482
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->getCurrencyPairs()Ljava/util/HashMap;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->getCurrencyPairs()Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 483
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->getCurrencyPairs()Ljava/util/HashMap;

    move-result-object v0

    .line 485
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p1, Lcom/mobnetic/coinguardian/model/Market;->currencyPairs:Ljava/util/HashMap;

    goto :goto_0
.end method

.method private getSelectedMarket()Lcom/mobnetic/coinguardian/model/Market;
    .locals 1

    .prologue
    .line 457
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getMarketKey()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mobnetic/coinguardian/util/MarketsConfigUtils;->getMarketByKey(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v0

    return-object v0
.end method

.method public static final newInstance(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;J)Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;
    .locals 3
    .param p0, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p1, "alarmRecordId"    # J

    .prologue
    .line 115
    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-direct {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;-><init>()V

    .line 116
    .local v1, "fragment":Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 117
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "checker_record"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 118
    const-string v2, "alarm_record_id"

    invoke-virtual {v0, v2, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 119
    invoke-virtual {v1, v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->setArguments(Landroid/os/Bundle;)V

    .line 120
    return-object v1
.end method

.method private onMarketChanged(Lcom/mobnetic/coinguardian/model/Market;)V
    .locals 5
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;

    .prologue
    const/4 v4, 0x1

    .line 433
    if-nez p1, :cond_0

    .line 447
    :goto_0
    return-void

    .line 436
    :cond_0
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->marketSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewPreference;

    iget-object v1, p1, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 437
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshMarketCautionView(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 438
    new-instance v0, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p1, Lcom/mobnetic/coinguardian/model/Market;->key:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardian/util/MarketCurrencyPairsStore;->getPairsForMarket(Landroid/content/Context;Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;-><init>(Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;)V

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .line 439
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    iget-object v1, p1, Lcom/mobnetic/coinguardian/model/Market;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setMarketKey(Ljava/lang/String;)V

    .line 440
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setContractType(J)V

    .line 441
    iput-boolean v4, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->unsavedChanges:Z

    .line 442
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->clearLastAndPreviousCheck()V

    .line 443
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->clearAlarmsLastCheckPoint()V

    .line 444
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshDynamicCurrencyPairsView(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 445
    invoke-direct {p0, p1, v4}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshCurrencySpinnersForMarket(Lcom/mobnetic/coinguardian/model/Market;Z)V

    .line 446
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshFuturesContractTypes(Lcom/mobnetic/coinguardian/model/Market;)V

    goto :goto_0
.end method

.method private refreshAlarms()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 640
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 641
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerAddAlarmFragment:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v1, v2, v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->setCheckerAndAlarmRecord(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)V

    .line 642
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerAddAlarmFragmentWrapper:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 646
    :goto_0
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmsAdapter:Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->notifyDataSetChanged()V

    .line 647
    return-void

    .line 644
    :cond_0
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerAddAlarmFragmentWrapper:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method private refreshCurrencyDstSpinnerForMarket(Lcom/mobnetic/coinguardian/model/Market;Z)V
    .locals 11
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p2, "considerAsChange"    # Z

    .prologue
    const/4 v8, 0x0

    .line 523
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getProperCurrencyPairs(Lcom/mobnetic/coinguardian/model/Market;)Ljava/util/HashMap;

    move-result-object v1

    .line 525
    .local v1, "currencyPairs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/CharSequence;>;"
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v7}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v5

    .line 526
    .local v5, "oldSelectedValue":Ljava/lang/String;
    const/4 v4, 0x0

    .line 528
    .local v4, "newCurrency":Ljava/lang/String;
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v7

    if-lez v7, :cond_3

    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v7}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_3

    .line 529
    const/4 v6, 0x0

    .line 530
    .local v6, "selection":I
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v7}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/CharSequence;

    array-length v7, v7

    new-array v2, v7, [Ljava/lang/CharSequence;

    .line 531
    .local v2, "dstEntries":[Ljava/lang/CharSequence;
    const/4 v3, 0x0

    .line 532
    .local v3, "i":I
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v7}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/CharSequence;

    array-length v9, v7

    :goto_0
    if-ge v8, v9, :cond_1

    aget-object v0, v7, v8

    .line 533
    .local v0, "currency":Ljava/lang/CharSequence;
    aput-object v0, v2, v3

    .line 534
    invoke-virtual {v0, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 535
    move v6, v3

    .line 536
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 532
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 538
    .end local v0    # "currency":Ljava/lang/CharSequence;
    :cond_1
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyDstSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    invoke-virtual {v7, v2, v6}, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->setEntriesAndSelection([Ljava/lang/CharSequence;I)V

    .line 539
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyDstSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    invoke-virtual {v7}, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 540
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyDstSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    invoke-virtual {v7}, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 541
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v7}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 542
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    const-wide/16 v8, 0x1

    invoke-virtual {v7, v8, v9}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencySubunitDst(J)V

    .line 543
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v7}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 544
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->unsavedChanges:Z

    .line 551
    .end local v2    # "dstEntries":[Ljava/lang/CharSequence;
    .end local v3    # "i":I
    .end local v6    # "selection":I
    :cond_2
    :goto_1
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v7, v4}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencyDst(Ljava/lang/String;)V

    .line 553
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshCurrencyDstSubunits()V

    .line 554
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshAlarms()V

    .line 555
    return-void

    .line 548
    :cond_3
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyDstSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    const/4 v9, 0x0

    invoke-virtual {v7, v9, v8}, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->setEntriesAndSelection([Ljava/lang/CharSequence;I)V

    goto :goto_1
.end method

.method private refreshCurrencyDstSubunits()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x1

    .line 586
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyDstSubunitSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySubunitDst()J

    move-result-wide v2

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshCurrencySubunits(Ljava/lang/String;Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;J)Z

    move-result v0

    if-nez v0, :cond_1

    .line 587
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySubunitDst()J

    move-result-wide v0

    cmp-long v0, v0, v4

    if-eqz v0, :cond_0

    .line 588
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->unsavedChanges:Z

    .line 589
    :cond_0
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v0, v4, v5}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencySubunitDst(J)V

    .line 591
    :cond_1
    return-void
.end method

.method private refreshCurrencySpinnersForMarket(Lcom/mobnetic/coinguardian/model/Market;Z)V
    .locals 5
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p2, "considerAsChange"    # Z

    .prologue
    const/16 v3, 0x8

    const/4 v1, 0x0

    .line 469
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshCurrencySrcSpinnerForMarket(Lcom/mobnetic/coinguardian/model/Market;Z)V

    .line 470
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshCurrencyDstSpinnerForMarket(Lcom/mobnetic/coinguardian/model/Market;Z)V

    .line 472
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 473
    .local v0, "isCurrencyEmpty":Z
    :goto_0
    iget-object v4, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->dynamicCurrencyPairsWarningView:Landroid/view/View;

    if-eqz v0, :cond_2

    move v2, v1

    :goto_1
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 474
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySpinnersAndDynamicPairsWrapper:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setClickable(Z)V

    .line 475
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySpinnersAndDynamicPairsWrapper:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setFocusable(Z)V

    .line 476
    iget-object v4, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySpinnersWrapper:Landroid/view/View;

    if-eqz v0, :cond_3

    move v2, v3

    :goto_2
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 477
    iget-object v4, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkSectionWrapper:Landroid/view/View;

    if-eqz v0, :cond_4

    move v2, v3

    :goto_3
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 478
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmSectionWrapper:Landroid/view/View;

    if-eqz v0, :cond_5

    :goto_4
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 479
    return-void

    .end local v0    # "isCurrencyEmpty":Z
    :cond_1
    move v0, v1

    .line 472
    goto :goto_0

    .restart local v0    # "isCurrencyEmpty":Z
    :cond_2
    move v2, v3

    .line 473
    goto :goto_1

    :cond_3
    move v2, v1

    .line 476
    goto :goto_2

    :cond_4
    move v2, v1

    .line 477
    goto :goto_3

    :cond_5
    move v3, v1

    .line 478
    goto :goto_4
.end method

.method private refreshCurrencySrcSpinnerForMarket(Lcom/mobnetic/coinguardian/model/Market;Z)V
    .locals 10
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p2, "considerAsChange"    # Z

    .prologue
    .line 489
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getProperCurrencyPairs(Lcom/mobnetic/coinguardian/model/Market;)Ljava/util/HashMap;

    move-result-object v1

    .line 491
    .local v1, "currencyPairs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/CharSequence;>;"
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v7}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v4

    .line 492
    .local v4, "oldSelectedValue":Ljava/lang/CharSequence;
    const/4 v3, 0x0

    .line 494
    .local v3, "newCurrency":Ljava/lang/String;
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v7

    if-lez v7, :cond_3

    .line 495
    const/4 v5, 0x0

    .line 496
    .local v5, "selection":I
    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v7

    new-array v6, v7, [Ljava/lang/CharSequence;

    .line 497
    .local v6, "srcEntries":[Ljava/lang/CharSequence;
    const/4 v2, 0x0

    .line 498
    .local v2, "i":I
    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 499
    .local v0, "currency":Ljava/lang/String;
    aput-object v0, v6, v2

    .line 500
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 501
    move v5, v2

    .line 502
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 503
    goto :goto_0

    .line 504
    .end local v0    # "currency":Ljava/lang/String;
    :cond_1
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySrcSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    invoke-virtual {v7, v6, v5}, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->setEntriesAndSelection([Ljava/lang/CharSequence;I)V

    .line 505
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySrcSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    invoke-virtual {v7}, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 506
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySrcSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    invoke-virtual {v7}, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 507
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v7}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 508
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    const-wide/16 v8, 0x1

    invoke-virtual {v7, v8, v9}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencySubunitSrc(J)V

    .line 509
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v7}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 510
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->unsavedChanges:Z

    .line 516
    .end local v2    # "i":I
    .end local v5    # "selection":I
    .end local v6    # "srcEntries":[Ljava/lang/CharSequence;
    :cond_2
    :goto_1
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v7, v3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencySrc(Ljava/lang/String;)V

    .line 518
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshCurrencySrcSubunits()V

    .line 519
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshAlarms()V

    .line 520
    return-void

    .line 514
    :cond_3
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySrcSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->setEntriesAndSelection([Ljava/lang/CharSequence;I)V

    goto :goto_1
.end method

.method private refreshCurrencySrcSubunits()V
    .locals 2

    .prologue
    .line 577
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySrcSubunitSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->setVisibility(I)V

    .line 583
    return-void
.end method

.method private refreshCurrencySubunits(Ljava/lang/String;Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;J)Z
    .locals 11
    .param p1, "currency"    # Ljava/lang/String;
    .param p2, "viewSpinnerPreference"    # Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;
    .param p3, "subunitToUnit"    # J

    .prologue
    const/4 v2, 0x1

    const/4 v6, 0x0

    .line 594
    const/4 v1, 0x0

    .line 597
    .local v1, "entries":[Ljava/lang/CharSequence;
    const/4 v4, 0x0

    .line 598
    .local v4, "selection":I
    sget-object v7, Lcom/mobnetic/coinguardian/model/currency/CurrenciesSubunits;->CURRENCIES_SUBUNITS:Ljava/util/HashMap;

    invoke-virtual {v7, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 599
    sget-object v7, Lcom/mobnetic/coinguardian/model/currency/CurrenciesSubunits;->CURRENCIES_SUBUNITS:Ljava/util/HashMap;

    invoke-virtual {v7, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/LinkedHashMap;

    .line 600
    .local v5, "subunits":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/Long;Lcom/mobnetic/coinguardian/model/CurrencySubunit;>;"
    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->size()I

    move-result v7

    new-array v1, v7, [Ljava/lang/CharSequence;

    .line 602
    const/4 v3, 0x0

    .line 603
    .local v3, "i":I
    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    .line 604
    .local v0, "currencySubunit":Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    iget-object v8, v0, Lcom/mobnetic/coinguardian/model/CurrencySubunit;->name:Ljava/lang/String;

    aput-object v8, v1, v3

    .line 605
    iget-wide v8, v0, Lcom/mobnetic/coinguardian/model/CurrencySubunit;->subunitToUnit:J

    cmp-long v8, v8, p3

    if-nez v8, :cond_0

    .line 606
    move v4, v3

    .line 607
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 608
    goto :goto_0

    .line 609
    .end local v0    # "currencySubunit":Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    :cond_1
    if-eqz v1, :cond_2

    array-length v7, v1

    if-lez v7, :cond_2

    .line 617
    .end local v3    # "i":I
    .end local v5    # "subunits":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/Long;Lcom/mobnetic/coinguardian/model/CurrencySubunit;>;"
    .local v2, "hasSubunits":Z
    :goto_1
    invoke-virtual {p2, v1, v4}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->setEntriesAndSelection([Ljava/lang/CharSequence;I)V

    .line 618
    if-eqz p1, :cond_4

    :goto_2
    invoke-virtual {p2, v6}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->setVisibility(I)V

    .line 619
    invoke-virtual {p2, v2}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->setEnabled(Z)V

    .line 621
    return v2

    .end local v2    # "hasSubunits":Z
    .restart local v3    # "i":I
    .restart local v5    # "subunits":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/Long;Lcom/mobnetic/coinguardian/model/CurrencySubunit;>;"
    :cond_2
    move v2, v6

    .line 609
    goto :goto_1

    .line 611
    .end local v3    # "i":I
    .end local v5    # "subunits":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/Long;Lcom/mobnetic/coinguardian/model/CurrencySubunit;>;"
    :cond_3
    new-array v1, v2, [Ljava/lang/CharSequence;

    .line 612
    aput-object p1, v1, v6

    .line 613
    const/4 v4, 0x0

    .line 614
    const/4 v2, 0x0

    .restart local v2    # "hasSubunits":Z
    goto :goto_1

    .line 618
    :cond_4
    const/16 v6, 0x8

    goto :goto_2
.end method

.method private refreshDynamicCurrencyPairsView(Lcom/mobnetic/coinguardian/model/Market;)V
    .locals 8
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;

    .prologue
    const/4 v1, 0x0

    .line 461
    invoke-virtual {p1, v1}, Lcom/mobnetic/coinguardian/model/Market;->getCurrencyPairsUrl(I)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    const/4 v0, 0x1

    .line 462
    .local v0, "dynamicPairsEnabled":Z
    :goto_0
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->dynamicCurrencyPairsInfoView:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 463
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->dynamicCurrencyPairsNoSyncYetView:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v3, p1, Lcom/mobnetic/coinguardian/model/Market;->currencyPairs:Ljava/util/HashMap;

    if-eqz v3, :cond_2

    iget-object v3, p1, Lcom/mobnetic/coinguardian/model/Market;->currencyPairs:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {v3}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->getDate()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-gtz v3, :cond_2

    :cond_0
    :goto_1
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 464
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySrcSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    invoke-virtual {v1, v0}, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->setShowSyncButton(Z)V

    .line 465
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyDstSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    invoke-virtual {v1, v0}, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->setShowSyncButton(Z)V

    .line 466
    return-void

    .end local v0    # "dynamicPairsEnabled":Z
    :cond_1
    move v0, v1

    .line 461
    goto :goto_0

    .line 463
    .restart local v0    # "dynamicPairsEnabled":Z
    :cond_2
    const/16 v1, 0x8

    goto :goto_1
.end method

.method private refreshFuturesContractTypes(Lcom/mobnetic/coinguardian/model/Market;)V
    .locals 8
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;

    .prologue
    .line 558
    const/4 v1, 0x0

    .line 559
    .local v1, "entries":[Ljava/lang/CharSequence;
    const/4 v5, 0x0

    .line 560
    .local v5, "selection":I
    instance-of v6, p1, Lcom/mobnetic/coinguardian/model/FuturesMarket;

    if-eqz v6, :cond_1

    .line 561
    iget-object v6, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v6}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getContractType()J

    move-result-wide v6

    long-to-int v4, v6

    .local v4, "oldContractType":I
    move-object v2, p1

    .line 562
    check-cast v2, Lcom/mobnetic/coinguardian/model/FuturesMarket;

    .line 563
    .local v2, "futuresMarket":Lcom/mobnetic/coinguardian/model/FuturesMarket;
    iget-object v6, v2, Lcom/mobnetic/coinguardian/model/FuturesMarket;->contractTypes:[I

    array-length v6, v6

    new-array v1, v6, [Ljava/lang/CharSequence;

    .line 564
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v6, v2, Lcom/mobnetic/coinguardian/model/FuturesMarket;->contractTypes:[I

    array-length v6, v6

    if-ge v3, v6, :cond_1

    .line 565
    iget-object v6, v2, Lcom/mobnetic/coinguardian/model/FuturesMarket;->contractTypes:[I

    aget v0, v6, v3

    .line 566
    .local v0, "contractType":I
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-static {v6, v0}, Lcom/mobnetic/coinguardian/util/FormatUtils;->getContractTypeName(Landroid/content/Context;I)Ljava/lang/CharSequence;

    move-result-object v6

    aput-object v6, v1, v3

    .line 567
    if-ne v4, v0, :cond_0

    .line 568
    move v5, v3

    .line 564
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 572
    .end local v0    # "contractType":I
    .end local v2    # "futuresMarket":Lcom/mobnetic/coinguardian/model/FuturesMarket;
    .end local v3    # "i":I
    .end local v4    # "oldContractType":I
    :cond_1
    iget-object v6, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->futuresContractTypeSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    invoke-virtual {v6, v1, v5}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->setEntriesAndSelection([Ljava/lang/CharSequence;I)V

    .line 573
    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->futuresContractTypeSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    if-eqz v1, :cond_2

    const/4 v6, 0x0

    :goto_1
    invoke-virtual {v7, v6}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->setVisibility(I)V

    .line 574
    return-void

    .line 573
    :cond_2
    const/16 v6, 0x8

    goto :goto_1
.end method

.method private refreshMarketCautionView(Lcom/mobnetic/coinguardian/model/Market;)V
    .locals 5
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;

    .prologue
    const/4 v2, 0x0

    .line 450
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/model/Market;->getCautionResId()I

    move-result v1

    .line 451
    .local v1, "textResId":I
    :goto_0
    if-lez v1, :cond_2

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 452
    .local v0, "cautionText":Ljava/lang/String;
    :goto_1
    iget-object v3, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->marketCautionView:Landroid/widget/TextView;

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 453
    iget-object v3, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->marketCautionView:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/16 v2, 0x8

    :cond_0
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 454
    return-void

    .end local v0    # "cautionText":Ljava/lang/String;
    .end local v1    # "textResId":I
    :cond_1
    move v1, v2

    .line 450
    goto :goto_0

    .line 451
    .restart local v1    # "textResId":I
    :cond_2
    const-string v0, ""

    goto :goto_1
.end method

.method private save()V
    .locals 12

    .prologue
    const/4 v11, 0x1

    const/4 v5, 0x0

    const/4 v10, 0x0

    .line 702
    iget-object v4, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    .line 703
    :cond_0
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    const v5, 0x7f070053

    invoke-static {v4, v5, v11}, Lcom/mobnetic/coinguardian/util/Utils;->showToast(Landroid/content/Context;IZ)V

    .line 730
    :goto_0
    return-void

    .line 707
    :cond_1
    iget-object v6, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    iget-object v4, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v7}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v8}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->getCurrencyPairId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_1
    invoke-virtual {v6, v4}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencyPairId(Ljava/lang/String;)V

    .line 710
    :try_start_0
    iget-object v4, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->save(Z)J
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 714
    :goto_2
    iget-object v4, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v4, v6, v8

    if-lez v4, :cond_4

    .line 715
    iget-object v4, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->removedAlarmRecordIds:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 716
    .local v2, "removedAlarmRecordId":J
    invoke-static {}, Lcom/robotoworks/mechanoid/db/SQuery;->newQuery()Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v4

    const-string v7, "_id"

    const-string v8, " = "

    invoke-virtual {v4, v7, v8, v2, v3}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;J)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v4

    sget-object v7, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v4, v7, v10}, Lcom/robotoworks/mechanoid/db/SQuery;->delete(Landroid/net/Uri;Z)I

    goto :goto_3

    .end local v2    # "removedAlarmRecordId":J
    :cond_2
    move-object v4, v5

    .line 707
    goto :goto_1

    .line 711
    :catch_0
    move-exception v1

    .line 712
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_2

    .line 718
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :cond_3
    iget-object v4, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .line 719
    .local v0, "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    iget-object v6, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v6}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setCheckerId(J)V

    .line 720
    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getEnabled()Z

    move-result v6

    invoke-virtual {v0, v6}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setEnabled(Z)V

    .line 721
    invoke-virtual {v0, v10}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->save(Z)J

    goto :goto_4

    .line 724
    .end local v0    # "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    :cond_4
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v6, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v4, v6, v5}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 725
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v6, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v4, v6, v5}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 726
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    iget-object v5, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-static {v4, v5, v11}, Lcom/mobnetic/coinguardian/util/CheckerRecordHelper;->doAfterEdit(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)V

    .line 728
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    const/4 v5, -0x1

    invoke-virtual {v4, v5}, Landroid/support/v4/app/FragmentActivity;->setResult(I)V

    .line 729
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentActivity;->finish()V

    goto/16 :goto_0
.end method


# virtual methods
.method public makeUnsavedChanges()V
    .locals 1

    .prologue
    .line 650
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->unsavedChanges:Z

    .line 651
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v4, -0x1

    .line 751
    if-ne p2, v4, :cond_2

    .line 752
    const/16 v3, 0xc8

    if-ne p1, v3, :cond_5

    .line 753
    const-string v3, "alarm_record_index"

    invoke-virtual {p3, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 754
    .local v1, "alarmRecordPosition":I
    const-string v3, "alarm_record"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .line 755
    .local v0, "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    if-ltz v1, :cond_0

    iget-object v3, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v1, v3, :cond_3

    .line 756
    :cond_0
    if-eqz v0, :cond_1

    .line 757
    iget-object v3, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 764
    :cond_1
    :goto_0
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->unsavedChanges:Z

    .line 765
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshAlarms()V

    .line 771
    .end local v0    # "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .end local v1    # "alarmRecordPosition":I
    :cond_2
    :goto_1
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 772
    return-void

    .line 759
    .restart local v0    # "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .restart local v1    # "alarmRecordPosition":I
    :cond_3
    if-eqz v0, :cond_4

    .line 760
    iget-object v3, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    invoke-virtual {v3, v1, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 762
    :cond_4
    iget-object v3, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 766
    .end local v0    # "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .end local v1    # "alarmRecordPosition":I
    :cond_5
    const/16 v3, 0xc7

    if-ne p1, v3, :cond_2

    .line 767
    const-string v3, "market_key"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mobnetic/coinguardian/util/MarketsConfigUtils;->getMarketByKey(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v2

    .line 768
    .local v2, "market":Lcom/mobnetic/coinguardian/model/Market;
    invoke-direct {p0, v2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->onMarketChanged(Lcom/mobnetic/coinguardian/model/Market;)V

    goto :goto_1
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 125
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 126
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->setHasOptionsMenu(Z)V

    .line 127
    return-void
.end method

.method public onBackPressed()Z
    .locals 3

    .prologue
    .line 657
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->unsavedChanges:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerAddAlarmFragment:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerAddAlarmFragment:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->getUnsavedChanges()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 658
    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f070057

    .line 659
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f070056

    .line 660
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f070073

    new-instance v2, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$17;

    invoke-direct {v2, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$17;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    .line 661
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    .line 666
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f070077

    new-instance v2, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$16;

    invoke-direct {v2, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$16;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    .line 667
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 672
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 673
    const/4 v0, 0x1

    .line 676
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 684
    const/high16 v0, 0x7f100000

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 685
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 686
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 131
    const v1, 0x7f03001e

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 132
    .local v0, "view":Landroid/view/View;
    invoke-static {p0, v0}, Lbutterknife/ButterKnife;->inject(Ljava/lang/Object;Landroid/view/View;)V

    .line 133
    return-object v0
.end method

.method public onDestroyView()V
    .locals 0

    .prologue
    .line 425
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroyView()V

    .line 426
    invoke-static {p0}, Lbutterknife/ButterKnife;->reset(Ljava/lang/Object;)V

    .line 427
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v0, 0x1

    .line 690
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0e00a2

    if-ne v1, v2, :cond_0

    .line 691
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->save()V

    .line 698
    :goto_0
    return v0

    .line 693
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0e00a3

    if-ne v1, v2, :cond_1

    .line 694
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->delete()V

    goto :goto_0

    .line 698
    :cond_1
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 416
    const-string v0, "checker_record"

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 417
    const-string v0, "alarm_records"

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 418
    const-string v0, "removed_alarm_record_ids"

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->removedAlarmRecordIds:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 419
    const-string v0, "unsaved_changes"

    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->unsavedChanges:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 420
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 421
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 13
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 139
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 141
    if-eqz p2, :cond_6

    .line 142
    const-string v0, "checker_record"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .line 143
    const-string v0, "alarm_records"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    .line 144
    .local v11, "savedAlarmRecords":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/db/content/AlarmRecord;>;"
    if-eqz v11, :cond_0

    .line 145
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v11}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    .line 146
    :cond_0
    const-string v0, "removed_alarm_record_ids"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->removedAlarmRecordIds:Ljava/util/ArrayList;

    .line 148
    const-string v0, "unsaved_changes"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->unsavedChanges:Z

    .line 153
    .end local v11    # "savedAlarmRecords":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/db/content/AlarmRecord;>;"
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    if-nez v0, :cond_7

    .line 154
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;-><init>()V

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .line 155
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setEnabled(Z)V

    .line 156
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getMarketDefault(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setMarketKey(Ljava/lang/String;)V

    .line 159
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    const-wide/16 v2, 0x1

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencySubunitSrc(J)V

    .line 160
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    const-wide/16 v2, 0x1

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencySubunitDst(J)V

    .line 161
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setFrequency(J)V

    .line 162
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    const-wide/16 v2, -0x2

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setNotificationPriority(J)V

    .line 163
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setTtsEnabled(Z)V

    .line 164
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    const-wide v2, 0x7fffffffffffffffL

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setSortOrder(J)V

    .line 165
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    .line 166
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->generateDefaultAlarmRecord(Z)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 170
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->clearAlarmNotificationForCheckerRecord(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    .line 172
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->removedAlarmRecordIds:Ljava/util/ArrayList;

    if-nez v0, :cond_3

    .line 173
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->removedAlarmRecordIds:Ljava/util/ArrayList;

    .line 175
    :cond_3
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v0}, Landroid/support/v7/app/ActionBarActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v1

    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_8

    const v0, 0x7f070054

    :goto_2
    invoke-virtual {v1, v0}, Landroid/support/v7/app/ActionBar;->setTitle(I)V

    .line 177
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f0e0071

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerAddAlarmFragment:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    .line 179
    new-instance v0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v4, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    iget-object v5, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    move-object v1, p0

    move-object v3, p0

    invoke-direct/range {v0 .. v5}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Landroid/content/Context;Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Ljava/util/List;)V

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmsAdapter:Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

    .line 196
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmsListView:Lcom/linearlistview/LinearListView;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmsAdapter:Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

    invoke-virtual {v0, v1}, Lcom/linearlistview/LinearListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 197
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmsListView:Lcom/linearlistview/LinearListView;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$2;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$2;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    invoke-virtual {v0, v1}, Lcom/linearlistview/LinearListView;->setOnItemClickListener(Lcom/linearlistview/LinearListView$OnItemClickListener;)V

    .line 211
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->enabledView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setChecked(Z)V

    .line 212
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->enabledView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$3;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$3;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setOnCheckChangedListener(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;)V

    .line 220
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getMarketKey()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mobnetic/coinguardian/util/MarketsConfigUtils;->getMarketByKey(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v12

    .line 221
    .local v12, "selectedMarket":Lcom/mobnetic/coinguardian/model/Market;
    instance-of v0, v12, Lcom/mobnetic/coinguardian/model/market/Unknown;

    if-eqz v0, :cond_9

    .line 222
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/mobnetic/coinguardian/util/MarketsConfigUtils;->getMarketById(I)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v12

    .line 223
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, v12, Lcom/mobnetic/coinguardian/model/Market;->key:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->setMarketDefault(Landroid/content/Context;Ljava/lang/String;)V

    .line 224
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    iget-object v1, v12, Lcom/mobnetic/coinguardian/model/Market;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setMarketKey(Ljava/lang/String;)V

    .line 225
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    .line 226
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f070052

    .line 227
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f070051

    .line 228
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x104000a

    const/4 v2, 0x0

    .line 229
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 230
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 243
    :cond_4
    :goto_3
    new-instance v0, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, v12, Lcom/mobnetic/coinguardian/model/Market;->key:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardian/util/MarketCurrencyPairsStore;->getPairsForMarket(Landroid/content/Context;Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;-><init>(Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;)V

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyPairsMapHelper:Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .line 244
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->marketSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewPreference;

    iget-object v1, v12, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 245
    invoke-direct {p0, v12}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshMarketCautionView(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 246
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->marketSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewPreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$5;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$5;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 252
    invoke-direct {p0, v12}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshDynamicCurrencyPairsView(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 253
    new-instance v7, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;

    invoke-direct {v7, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    .line 267
    .local v7, "dynamicCurrencyPairsOnClickListener":Landroid/view/View$OnClickListener;
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySpinnersAndDynamicPairsWrapper:Landroid/view/View;

    invoke-virtual {v0, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 268
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySpinnersAndDynamicPairsWrapper:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 269
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySpinnersAndDynamicPairsWrapper:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 270
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->dynamicCurrencyPairsInfoView:Landroid/view/View;

    invoke-virtual {v0, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 272
    const/4 v0, 0x0

    invoke-direct {p0, v12, v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshCurrencySpinnersForMarket(Lcom/mobnetic/coinguardian/model/Market;Z)V

    .line 273
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySrcSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$7;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$7;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->setOnItemSelectedListener(Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$OnItemSelectedListener;)V

    .line 288
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyDstSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$8;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$8;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->setOnItemSelectedListener(Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$OnItemSelectedListener;)V

    .line 303
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySrcSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    invoke-virtual {v0, v7}, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->setOnSyncClickedListener(Landroid/view/View$OnClickListener;)V

    .line 304
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyDstSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    invoke-virtual {v0, v7}, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->setOnSyncClickedListener(Landroid/view/View$OnClickListener;)V

    .line 306
    invoke-direct {p0, v12}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshFuturesContractTypes(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 307
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->futuresContractTypeSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$9;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$9;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->setOnItemSelectedListener(Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$OnItemSelectedListener;)V

    .line 323
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshCurrencySrcSubunits()V

    .line 324
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySrcSubunitSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$10;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$10;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->setOnItemSelectedListener(Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$OnItemSelectedListener;)V

    .line 343
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->refreshCurrencyDstSubunits()V

    .line 344
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyDstSubunitSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$11;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$11;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->setOnItemSelectedListener(Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$OnItemSelectedListener;)V

    .line 363
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->frequencySpinner:Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getFrequency()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->setFrequency(J)V

    .line 364
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->frequencySpinner:Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$12;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$12;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->setOnFrequencySelectedListener(Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$OnFrequencySelectedListener;)V

    .line 371
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->notificationPriorityView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getNotificationPriority()J

    move-result-wide v2

    const-wide/16 v4, -0x2

    cmp-long v0, v2, v4

    if-ltz v0, :cond_a

    const/4 v0, 0x1

    :goto_4
    invoke-virtual {v1, v0}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setChecked(Z)V

    .line 372
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->notificationPriorityView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$13;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$13;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setOnCheckChangedListener(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;)V

    .line 379
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkTTSView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getTtsEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setChecked(Z)V

    .line 380
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkTTSView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$14;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$14;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setOnCheckChangedListener(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;)V

    .line 388
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmSectionHeader:Landroid/widget/TextView;

    const v1, 0x7f070016

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 390
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_5

    if-nez p2, :cond_5

    .line 391
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "alarm_record_id"

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    .line 392
    .local v8, "alarmRecordId":J
    const-wide/16 v0, 0x0

    cmp-long v0, v8, v0

    if-lez v0, :cond_5

    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    if-eqz v0, :cond_5

    .line 394
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_5
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v10, v0, :cond_5

    .line 395
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .line 396
    .local v6, "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    if-eqz v6, :cond_c

    invoke-virtual {v6}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getId()J

    move-result-wide v0

    cmp-long v0, v0, v8

    if-nez v0, :cond_c

    .line 397
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "alarm_record_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 398
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_b

    .line 399
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->scrollView:Landroid/widget/ScrollView;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$15;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$15;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 412
    .end local v6    # "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .end local v8    # "alarmRecordId":J
    .end local v10    # "i":I
    :cond_5
    :goto_6
    return-void

    .line 149
    .end local v7    # "dynamicCurrencyPairsOnClickListener":Landroid/view/View$OnClickListener;
    .end local v12    # "selectedMarket":Lcom/mobnetic/coinguardian/model/Market;
    :cond_6
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 150
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "checker_record"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    goto/16 :goto_0

    .line 167
    :cond_7
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    if-nez v0, :cond_2

    .line 168
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardian/util/CheckerRecordHelper;->getAlarmsForCheckerRecord(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmRecords:Ljava/util/ArrayList;

    goto/16 :goto_1

    .line 175
    :cond_8
    const v0, 0x7f070055

    goto/16 :goto_2

    .line 231
    .restart local v12    # "selectedMarket":Lcom/mobnetic/coinguardian/model/Market;
    :cond_9
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->isExchangeTutorialDone(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-static {}, Lcom/robotoworks/mechanoid/db/SQuery;->newQuery()Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v0

    sget-object v1, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Lcom/robotoworks/mechanoid/db/SQuery;->count(Landroid/net/Uri;)I

    move-result v0

    if-nez v0, :cond_4

    .line 232
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    .line 233
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f070050

    .line 234
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f07004f

    .line 235
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x104000a

    new-instance v2, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$4;

    invoke-direct {v2, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$4;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    .line 236
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 241
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_3

    .line 371
    .restart local v7    # "dynamicCurrencyPairsOnClickListener":Landroid/view/View$OnClickListener;
    :cond_a
    const/4 v0, 0x0

    goto/16 :goto_4

    .line 405
    .restart local v6    # "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .restart local v8    # "alarmRecordId":J
    .restart local v10    # "i":I
    :cond_b
    const/16 v0, 0xc8

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-static {p0, v0, v1, v6, v10}, Lcom/mobnetic/coinguardian/activity/CheckerAddAlarmActivity;->startCheckerAddAlarmActivity(Landroid/support/v4/app/Fragment;ILcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;I)V

    goto :goto_6

    .line 394
    :cond_c
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_5
.end method
