.class public Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$$ViewInjector;
.super Ljava/lang/Object;
.source "CheckerAddAlarmFragment$$ViewInjector.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static inject(Lbutterknife/ButterKnife$Finder;Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;Ljava/lang/Object;)V
    .locals 3
    .param p0, "finder"    # Lbutterknife/ButterKnife$Finder;
    .param p1, "target"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 10
    const v1, 0x7f0e0050

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 11
    .local v0, "view":Landroid/view/View;
    if-nez v0, :cond_0

    .line 12
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624016\' for field \'alarmEnabledView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 14
    :cond_0
    check-cast v0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmEnabledView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .line 15
    const v1, 0x7f0e0051

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 16
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_1

    .line 17
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624017\' for field \'alarmTypeView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 19
    :cond_1
    check-cast v0, Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmTypeView:Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;

    .line 20
    const v1, 0x7f0e0052

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 21
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_2

    .line 22
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624018\' for field \'alarmValueView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 24
    :cond_2
    check-cast v0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmValueView:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    .line 25
    const v1, 0x7f0e0053

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 26
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_3

    .line 27
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624019\' for field \'alarmCheckPointView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 29
    :cond_3
    check-cast v0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmCheckPointView:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    .line 30
    const v1, 0x7f0e0054

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 31
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_4

    .line 32
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624020\' for field \'alarmSoundView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 34
    :cond_4
    check-cast v0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmSoundView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .line 35
    const v1, 0x7f0e0055

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 36
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_5

    .line 37
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624021\' for field \'alarmVibrateView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 39
    :cond_5
    check-cast v0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmVibrateView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .line 40
    const v1, 0x7f0e0056

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 41
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_6

    .line 42
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624022\' for field \'alarmLedView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 44
    :cond_6
    check-cast v0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmLedView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .line 45
    const v1, 0x7f0e0057

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 46
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_7

    .line 47
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624023\' for field \'alarmTTSView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 49
    :cond_7
    check-cast v0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmTTSView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .line 50
    return-void
.end method

.method public static reset(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)V
    .locals 1
    .param p0, "target"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    .prologue
    const/4 v0, 0x0

    .line 53
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmEnabledView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .line 54
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmTypeView:Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;

    .line 55
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmValueView:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    .line 56
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmCheckPointView:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    .line 57
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmSoundView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .line 58
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmVibrateView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .line 59
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmLedView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .line 60
    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmTTSView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .line 61
    return-void
.end method
