.class public Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;
.super Lcom/mobnetic/coinguardian/fragment/generic/TTSAwareFragment;
.source "SettingsMainFragment.java"


# instance fields
.field private settingsMainActivity:Lcom/mobnetic/coinguardian/activity/SettingsMainActivity;

.field private ttsCategoryPreference:Landroid/preference/Preference;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/generic/TTSAwareFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;)Lcom/mobnetic/coinguardian/activity/SettingsMainActivity;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->settingsMainActivity:Lcom/mobnetic/coinguardian/activity/SettingsMainActivity;

    return-object v0
.end method

.method public static startShareIntent(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const v3, 0x7f07000d

    .line 180
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 181
    .local v0, "shareIntent":Landroid/content/Intent;
    const-string v1, "android.intent.extra.TITLE"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 182
    const-string v1, "android.intent.extra.SUBJECT"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 183
    const-string v1, "android.intent.extra.TEXT"

    const-string v2, "https://play.google.com/store/apps/details?id=com.mobnetic.coinguardian"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 184
    const-string v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 185
    const v1, 0x7f0700bc

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 186
    return-void
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/mobnetic/coinguardian/fragment/generic/TTSAwareFragment;->onAttach(Landroid/app/Activity;)V

    .line 38
    instance-of v0, p1, Lcom/mobnetic/coinguardian/activity/SettingsMainActivity;

    if-eqz v0, :cond_0

    .line 39
    check-cast p1, Lcom/mobnetic/coinguardian/activity/SettingsMainActivity;

    .end local p1    # "activity":Landroid/app/Activity;
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->settingsMainActivity:Lcom/mobnetic/coinguardian/activity/SettingsMainActivity;

    .line 40
    :cond_0
    return-void
.end method

.method public onCreateBeforeInitTTS(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 44
    invoke-super {p0, p1}, Lcom/mobnetic/coinguardian/fragment/generic/TTSAwareFragment;->onCreateBeforeInitTTS(Landroid/os/Bundle;)V

    .line 46
    const v6, 0x7f050001

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->addPreferencesFromResource(I)V

    .line 48
    const v6, 0x7f0700d1

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    .line 49
    .local v3, "notificationsCategoryPreference":Landroid/preference/Preference;
    new-instance v6, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$1;

    invoke-direct {v6, p0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$1;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;)V

    invoke-virtual {v3, v6}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 56
    const v6, 0x7f0700c4

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;

    .line 57
    .local v1, "checkGlobalFrequencyPreference":Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;
    new-instance v6, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$2;

    invoke-direct {v6, p0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$2;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;)V

    invoke-virtual {v1, v6}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 66
    const v6, 0x7f0700dc

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v5

    .line 67
    .local v5, "soundsCategoryPreference":Landroid/preference/Preference;
    new-instance v6, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$3;

    invoke-direct {v6, p0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$3;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;)V

    invoke-virtual {v5, v6}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 74
    const v6, 0x7f0700e4

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    iput-object v6, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->ttsCategoryPreference:Landroid/preference/Preference;

    .line 76
    iget-object v6, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->ttsCategoryPreference:Landroid/preference/Preference;

    new-instance v7, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$4;

    invoke-direct {v7, p0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$4;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;)V

    invoke-virtual {v6, v7}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 91
    const v6, 0x7f0700b7

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    new-instance v7, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$5;

    invoke-direct {v7, p0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$5;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;)V

    invoke-virtual {v6, v7}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 98
    const v6, 0x7f0700b1

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    new-instance v7, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$6;

    invoke-direct {v7, p0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$6;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;)V

    invoke-virtual {v6, v7}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 105
    const v6, 0x7f0700a6

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    new-instance v7, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$7;

    invoke-direct {v7, p0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$7;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;)V

    invoke-virtual {v6, v7}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 113
    const v6, 0x7f0700ba

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    new-instance v7, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$8;

    invoke-direct {v7, p0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$8;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;)V

    invoke-virtual {v6, v7}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 120
    const v6, 0x7f0700b4

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    new-instance v7, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$9;

    invoke-direct {v7, p0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$9;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;)V

    invoke-virtual {v6, v7}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 127
    const v6, 0x7f0700a1

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    new-instance v7, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$10;

    invoke-direct {v7, p0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$10;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;)V

    invoke-virtual {v6, v7}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 134
    const v6, 0x7f0700c0

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 136
    .local v0, "aboutVersionPreference":Landroid/preference/Preference;
    :try_start_0
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/app/FragmentActivity;->getPackageName()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    .line 137
    .local v4, "pInfo":Landroid/content/pm/PackageInfo;
    const v6, 0x7f0700c2

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const v9, 0x7f07000d

    invoke-virtual {p0, v9}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    iget-object v9, v4, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    aput-object v9, v7, v8

    invoke-virtual {p0, v6, v7}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    .end local v4    # "pInfo":Landroid/content/pm/PackageInfo;
    :goto_0
    new-instance v6, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11;

    invoke-direct {v6, p0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;)V

    invoke-virtual {v0, v6}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 159
    return-void

    .line 138
    :catch_0
    move-exception v2

    .line 139
    .local v2, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v2}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method protected onTTSAvailable(Z)V
    .locals 1
    .param p1, "available"    # Z

    .prologue
    .line 166
    invoke-super {p0, p1}, Lcom/mobnetic/coinguardian/fragment/generic/TTSAwareFragment;->onTTSAvailable(Z)V

    .line 168
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_0

    .line 174
    :cond_0
    return-void
.end method
