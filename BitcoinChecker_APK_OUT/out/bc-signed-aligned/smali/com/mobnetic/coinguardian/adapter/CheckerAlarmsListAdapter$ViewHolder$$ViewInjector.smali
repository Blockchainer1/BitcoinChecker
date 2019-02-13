.class public Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder$$ViewInjector;
.super Ljava/lang/Object;
.source "CheckerAlarmsListAdapter$ViewHolder$$ViewInjector.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static inject(Lbutterknife/ButterKnife$Finder;Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;Ljava/lang/Object;)V
    .locals 3
    .param p0, "finder"    # Lbutterknife/ButterKnife$Finder;
    .param p1, "target"    # Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 10
    const v1, 0x7f0e0058

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 11
    .local v0, "view":Landroid/view/View;
    if-nez v0, :cond_0

    .line 12
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624024\' for field \'alarmView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 14
    :cond_0
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->alarmView:Landroid/widget/TextView;

    .line 15
    const v1, 0x7f0e005a

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 16
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_1

    .line 17
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624026\' for field \'checkBoxWrapper\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 19
    :cond_1
    check-cast v0, Landroid/widget/FrameLayout;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->checkBoxWrapper:Landroid/widget/FrameLayout;

    .line 20
    const v1, 0x7f0e0054

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 21
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_2

    .line 22
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624020\' for field \'alarmSoundView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 24
    :cond_2
    iput-object v0, p1, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->alarmSoundView:Landroid/view/View;

    .line 25
    const v1, 0x7f0e0055

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 26
    if-nez v0, :cond_3

    .line 27
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624021\' for field \'alarmVibrateView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 29
    :cond_3
    iput-object v0, p1, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->alarmVibrateView:Landroid/view/View;

    .line 30
    const v1, 0x7f0e0056

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 31
    if-nez v0, :cond_4

    .line 32
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624022\' for field \'alarmLedView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 34
    :cond_4
    iput-object v0, p1, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->alarmLedView:Landroid/view/View;

    .line 35
    const v1, 0x7f0e0059

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 36
    if-nez v0, :cond_5

    .line 37
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624025\' for field \'alarmTtsView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 39
    :cond_5
    iput-object v0, p1, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->alarmTtsView:Landroid/view/View;

    .line 40
    const v1, 0x7f0e005b

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 41
    if-nez v0, :cond_6

    .line 42
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624027\' for field \'checkBox\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 44
    :cond_6
    check-cast v0, Landroid/widget/CompoundButton;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->checkBox:Landroid/widget/CompoundButton;

    .line 45
    return-void
.end method

.method public static reset(Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;)V
    .locals 1
    .param p0, "target"    # Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;

    .prologue
    const/4 v0, 0x0

    .line 48
    iput-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->alarmView:Landroid/widget/TextView;

    .line 49
    iput-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->checkBoxWrapper:Landroid/widget/FrameLayout;

    .line 50
    iput-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->alarmSoundView:Landroid/view/View;

    .line 51
    iput-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->alarmVibrateView:Landroid/view/View;

    .line 52
    iput-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->alarmLedView:Landroid/view/View;

    .line 53
    iput-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->alarmTtsView:Landroid/view/View;

    .line 54
    iput-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->checkBox:Landroid/widget/CompoundButton;

    .line 55
    return-void
.end method
