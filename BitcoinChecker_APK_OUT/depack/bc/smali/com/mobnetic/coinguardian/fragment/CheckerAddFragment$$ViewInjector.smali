.class public Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$$ViewInjector;
.super Ljava/lang/Object;
.source "CheckerAddFragment$$ViewInjector.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static inject(Lbutterknife/ButterKnife$Finder;Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Ljava/lang/Object;)V
    .locals 3
    .param p0, "finder"    # Lbutterknife/ButterKnife$Finder;
    .param p1, "target"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 10
    const v1, 0x7f0e005c

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 11
    .local v0, "view":Landroid/view/View;
    if-nez v0, :cond_0

    .line 12
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624028\' for field \'scrollView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 14
    :cond_0
    check-cast v0, Landroid/widget/ScrollView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->scrollView:Landroid/widget/ScrollView;

    .line 15
    const v1, 0x7f0e005d

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 16
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_1

    .line 17
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624029\' for field \'enabledView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 19
    :cond_1
    check-cast v0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->enabledView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .line 20
    const v1, 0x7f0e005e

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 21
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_2

    .line 22
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624030\' for field \'marketSpinner\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 24
    :cond_2
    check-cast v0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->marketSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewPreference;

    .line 25
    const v1, 0x7f0e005f

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 26
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_3

    .line 27
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624031\' for field \'marketCautionView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 29
    :cond_3
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->marketCautionView:Landroid/widget/TextView;

    .line 30
    const v1, 0x7f0e0060

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 31
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_4

    .line 32
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624032\' for field \'currencySpinnersAndDynamicPairsWrapper\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 34
    :cond_4
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySpinnersAndDynamicPairsWrapper:Landroid/view/View;

    .line 35
    const v1, 0x7f0e0064

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 36
    if-nez v0, :cond_5

    .line 37
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624036\' for field \'dynamicCurrencyPairsWarningView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 39
    :cond_5
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->dynamicCurrencyPairsWarningView:Landroid/view/View;

    .line 40
    const v1, 0x7f0e0065

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 41
    if-nez v0, :cond_6

    .line 42
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624037\' for field \'dynamicCurrencyPairsInfoView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 44
    :cond_6
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->dynamicCurrencyPairsInfoView:Landroid/view/View;

    .line 45
    const v1, 0x7f0e0066

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 46
    if-nez v0, :cond_7

    .line 47
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624038\' for field \'dynamicCurrencyPairsNoSyncYetView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 49
    :cond_7
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->dynamicCurrencyPairsNoSyncYetView:Landroid/view/View;

    .line 50
    const v1, 0x7f0e0061

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 51
    if-nez v0, :cond_8

    .line 52
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624033\' for field \'currencySpinnersWrapper\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 54
    :cond_8
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySpinnersWrapper:Landroid/view/View;

    .line 55
    const v1, 0x7f0e0067

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 56
    if-nez v0, :cond_9

    .line 57
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624039\' for field \'checkSectionWrapper\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 59
    :cond_9
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkSectionWrapper:Landroid/view/View;

    .line 60
    const v1, 0x7f0e0062

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 61
    if-nez v0, :cond_a

    .line 62
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624034\' for field \'currencySrcSpinner\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 64
    :cond_a
    check-cast v0, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySrcSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    .line 65
    const v1, 0x7f0e0063

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 66
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_b

    .line 67
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624035\' for field \'currencyDstSpinner\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 69
    :cond_b
    check-cast v0, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyDstSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    .line 70
    const v1, 0x7f0e0068

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 71
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_c

    .line 72
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624040\' for field \'futuresContractTypeSpinner\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 74
    :cond_c
    check-cast v0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->futuresContractTypeSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    .line 75
    const v1, 0x7f0e0069

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 76
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_d

    .line 77
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624041\' for field \'currencySrcSubunitSpinner\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 79
    :cond_d
    check-cast v0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySrcSubunitSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    .line 80
    const v1, 0x7f0e006a

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 81
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_e

    .line 82
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624042\' for field \'currencyDstSubunitSpinner\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 84
    :cond_e
    check-cast v0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyDstSubunitSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    .line 85
    const v1, 0x7f0e006b

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 86
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_f

    .line 87
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624043\' for field \'frequencySpinner\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 89
    :cond_f
    check-cast v0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->frequencySpinner:Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;

    .line 90
    const v1, 0x7f0e006c

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 91
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_10

    .line 92
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624044\' for field \'notificationPriorityView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 94
    :cond_10
    check-cast v0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->notificationPriorityView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .line 95
    const v1, 0x7f0e006d

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 96
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_11

    .line 97
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624045\' for field \'checkTTSView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 99
    :cond_11
    check-cast v0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkTTSView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .line 100
    const v1, 0x7f0e006e

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 101
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_12

    .line 102
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624046\' for field \'alarmSectionWrapper\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 104
    :cond_12
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmSectionWrapper:Landroid/view/View;

    .line 105
    const v1, 0x7f0e006f

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 106
    if-nez v0, :cond_13

    .line 107
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624047\' for field \'alarmSectionHeader\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 109
    :cond_13
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmSectionHeader:Landroid/widget/TextView;

    .line 110
    const v1, 0x7f0e0070

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 111
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_14

    .line 112
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624048\' for field \'checkerAddAlarmFragmentWrapper\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 114
    :cond_14
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerAddAlarmFragmentWrapper:Landroid/view/View;

    .line 115
    const v1, 0x7f0e0072

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 116
    if-nez v0, :cond_15

    .line 117
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624050\' for field \'alarmsListView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 119
    :cond_15
    check-cast v0, Lcom/linearlistview/LinearListView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmsListView:Lcom/linearlistview/LinearListView;

    .line 120
    return-void
.end method

.method public static reset(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V
    .locals 1
    .param p0, "target"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .prologue
    const/4 v0, 0x0

    .line 123
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->scrollView:Landroid/widget/ScrollView;

    .line 124
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->enabledView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .line 125
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->marketSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewPreference;

    .line 126
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->marketCautionView:Landroid/widget/TextView;

    .line 127
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySpinnersAndDynamicPairsWrapper:Landroid/view/View;

    .line 128
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->dynamicCurrencyPairsWarningView:Landroid/view/View;

    .line 129
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->dynamicCurrencyPairsInfoView:Landroid/view/View;

    .line 130
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->dynamicCurrencyPairsNoSyncYetView:Landroid/view/View;

    .line 131
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySpinnersWrapper:Landroid/view/View;

    .line 132
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkSectionWrapper:Landroid/view/View;

    .line 133
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySrcSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    .line 134
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyDstSpinner:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    .line 135
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->futuresContractTypeSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    .line 136
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencySrcSubunitSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    .line 137
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->currencyDstSubunitSpinner:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    .line 138
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->frequencySpinner:Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;

    .line 139
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->notificationPriorityView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .line 140
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkTTSView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .line 141
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmSectionWrapper:Landroid/view/View;

    .line 142
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmSectionHeader:Landroid/widget/TextView;

    .line 143
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->checkerAddAlarmFragmentWrapper:Landroid/view/View;

    .line 144
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmsListView:Lcom/linearlistview/LinearListView;

    .line 145
    return-void
.end method
