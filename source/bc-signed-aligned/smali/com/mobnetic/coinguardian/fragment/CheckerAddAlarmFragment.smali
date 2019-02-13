.class public Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;
.super Landroid/support/v4/app/Fragment;
.source "CheckerAddAlarmFragment.java"


# static fields
.field private static final EXTRA_SHOULD_SAVE_STATE:Ljava/lang/String; = "should_save_state"

.field private static final EXTRA_UNSAVED_CHANGES:Ljava/lang/String; = "unsaved_changes"


# instance fields
.field alarmCheckPointView:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0053
    .end annotation
.end field

.field alarmEnabledView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0050
    .end annotation
.end field

.field alarmLedView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0056
    .end annotation
.end field

.field private alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

.field alarmSoundView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0054
    .end annotation
.end field

.field alarmTTSView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0057
    .end annotation
.end field

.field alarmTypeView:Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0051
    .end annotation
.end field

.field alarmValueView:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0052
    .end annotation
.end field

.field alarmVibrateView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0055
    .end annotation
.end field

.field private checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

.field private unsavedChanges:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    return-object v0
.end method

.method static synthetic access$102(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 29
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->unsavedChanges:Z

    return p1
.end method

.method static synthetic access$200(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->refreshAlarmToggles(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->refreshAlarmValueView()V

    return-void
.end method

.method static synthetic access$400(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->refreshLastCheckPointVisibility()V

    return-void
.end method

.method public static final newInstance(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;
    .locals 4
    .param p0, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p1, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .prologue
    .line 48
    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    invoke-direct {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;-><init>()V

    .line 49
    .local v1, "fragment":Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 50
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "checker_record"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 51
    const-string v2, "alarm_record"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 52
    const-string v2, "should_save_state"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 53
    invoke-virtual {v1, v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->setArguments(Landroid/os/Bundle;)V

    .line 54
    return-object v1
.end method

.method private refreshAlarmToggles(Z)V
    .locals 1
    .param p1, "isAlarmEnabled"    # Z

    .prologue
    .line 250
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmTypeView:Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;

    invoke-virtual {v0, p1}, Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;->setEnabled(Z)V

    .line 251
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmValueView:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    invoke-virtual {v0, p1}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->setEnabled(Z)V

    .line 252
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmCheckPointView:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    invoke-virtual {v0, p1}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->setEnabled(Z)V

    .line 253
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmSoundView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    invoke-virtual {v0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setEnabled(Z)V

    .line 254
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmVibrateView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    invoke-virtual {v0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setEnabled(Z)V

    .line 255
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmLedView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    invoke-virtual {v0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setEnabled(Z)V

    .line 256
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmTTSView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    invoke-virtual {v0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setEnabled(Z)V

    .line 257
    return-void
.end method

.method private refreshAlarmValueView()V
    .locals 4

    .prologue
    .line 260
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmValueView:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->getPrefixForAlarmType(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->setPrefix(Ljava/lang/String;)V

    .line 261
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmValueView:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->getSufixForAlarmType(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->setSufix(Ljava/lang/String;)V

    .line 262
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmValueView:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getValue()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->setValue(D)V

    .line 263
    return-void
.end method

.method private refreshLastCheckPoint()V
    .locals 4

    .prologue
    .line 239
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySubunitDst()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/mobnetic/coinguardian/util/CurrencyUtils;->getCurrencySubunit(Ljava/lang/String;J)Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    move-result-object v1

    iget-object v0, v1, Lcom/mobnetic/coinguardian/model/CurrencySubunit;->name:Ljava/lang/String;

    .line 240
    .local v0, "currency":Ljava/lang/String;
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmCheckPointView:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/util/CurrencyUtils;->getCurrencySymbol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->setSufix(Ljava/lang/String;)V

    .line 241
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmCheckPointView:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    iget-object v3, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v1, v2, v3}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->setCheckerAndAlarmRecord(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)V

    .line 242
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->refreshLastCheckPointVisibility()V

    .line 243
    return-void
.end method

.method private refreshLastCheckPointVisibility()V
    .locals 2

    .prologue
    .line 246
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmCheckPointView:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->isCheckPointAvailableForAlarmType(Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->setVisibility(I)V

    .line 247
    return-void

    .line 246
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method private refreshUI()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 102
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getEnabled()Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->refreshAlarmToggles(Z)V

    .line 103
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmEnabledView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    invoke-virtual {v0, v3}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setOnCheckChangedListener(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;)V

    .line 104
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmEnabledView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setChecked(Z)V

    .line 105
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmEnabledView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$1;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$1;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setOnCheckChangedListener(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;)V

    .line 114
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmTypeView:Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;

    invoke-virtual {v0, v3}, Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;->setOnItemSelectedListener(Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$OnItemSelectedListener;)V

    .line 115
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmTypeView:Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->getPositionForAlarmType(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;->setSelection(I)V

    .line 116
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmTypeView:Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$2;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$2;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;->setOnItemSelectedListener(Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$OnItemSelectedListener;)V

    .line 126
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmValueView:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    invoke-virtual {v0, v3}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->setOnValueChangedListener(Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$OnValueChangedListener;)V

    .line 127
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmValueView:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v0, v1, v2}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->setCheckerAndAlarmRecord(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)V

    .line 128
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->refreshAlarmValueView()V

    .line 129
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmValueView:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$3;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$3;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->setOnValueChangedListener(Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$OnValueChangedListener;)V

    .line 137
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmCheckPointView:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    invoke-virtual {v0, v3}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->setOnCheckpointChangedListener(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$OnCheckpointChangedListener;)V

    .line 138
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->refreshLastCheckPoint()V

    .line 139
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmCheckPointView:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$4;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$4;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->setOnCheckpointChangedListener(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$OnCheckpointChangedListener;)V

    .line 167
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmSoundView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    invoke-virtual {v0, v3}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setOnCheckChangedListener(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;)V

    .line 168
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmSoundView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getSound()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setChecked(Z)V

    .line 169
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmSoundView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$5;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$5;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setOnCheckChangedListener(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;)V

    .line 176
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmVibrateView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    invoke-virtual {v0, v3}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setOnCheckChangedListener(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;)V

    .line 177
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmVibrateView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getVibrate()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setChecked(Z)V

    .line 178
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmVibrateView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$6;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$6;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setOnCheckChangedListener(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;)V

    .line 185
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmLedView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    invoke-virtual {v0, v3}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setOnCheckChangedListener(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;)V

    .line 186
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmLedView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getLed()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setChecked(Z)V

    .line 187
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmLedView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$7;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$7;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setOnCheckChangedListener(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;)V

    .line 194
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmTTSView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    invoke-virtual {v0, v3}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setOnCheckChangedListener(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;)V

    .line 195
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmTTSView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getTtsEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setChecked(Z)V

    .line 196
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmTTSView:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$8;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$8;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setOnCheckChangedListener(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;)V

    .line 203
    return-void
.end method

.method private shouldSaveState()Z
    .locals 2

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "should_save_state"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getAlarmRecord()Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .locals 1

    .prologue
    .line 221
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    return-object v0
.end method

.method public getUnsavedChanges()Z
    .locals 1

    .prologue
    .line 225
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->unsavedChanges:Z

    return v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 59
    const v1, 0x7f03001c

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 60
    .local v0, "view":Landroid/view/View;
    invoke-static {p0, v0}, Lbutterknife/ButterKnife;->inject(Ljava/lang/Object;Landroid/view/View;)V

    .line 61
    return-object v0
.end method

.method public onDestroyView()V
    .locals 0

    .prologue
    .line 216
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroyView()V

    .line 217
    invoke-static {p0}, Lbutterknife/ButterKnife;->reset(Ljava/lang/Object;)V

    .line 218
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 207
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->shouldSaveState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 208
    const-string v0, "alarm_record"

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 210
    :cond_0
    const-string v0, "unsaved_changes"

    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->unsavedChanges:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 211
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 212
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 66
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 68
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->shouldSaveState()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 69
    if-eqz p2, :cond_2

    .line 70
    const-string v0, "alarm_record"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .line 71
    const-string v0, "unsaved_changes"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->unsavedChanges:Z

    .line 78
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 79
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "checker_record"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .line 85
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {p0, v0, v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->setCheckerAndAlarmRecord(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)V

    .line 86
    return-void

    .line 72
    :cond_2
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 73
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "alarm_record"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    goto :goto_0

    .line 80
    :cond_3
    if-eqz p2, :cond_1

    .line 81
    const-string v0, "unsaved_changes"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->unsavedChanges:Z

    goto :goto_1
.end method

.method public setCheckerAndAlarmRecord(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)V
    .locals 0
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p2, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .prologue
    .line 89
    if-eqz p2, :cond_0

    if-nez p1, :cond_1

    .line 95
    :cond_0
    :goto_0
    return-void

    .line 92
    :cond_1
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .line 93
    iput-object p2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .line 94
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->refreshUI()V

    goto :goto_0
.end method
