.class public Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;
.super Landroid/support/v4/preference/PreferenceFragment;
.source "WidgetConfigureFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Landroid/support/v4/preference/PreferenceFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;Landroid/preference/ListPreference;Ljava/lang/CharSequence;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;
    .param p1, "x1"    # Landroid/preference/ListPreference;
    .param p2, "x2"    # Ljava/lang/CharSequence;

    .prologue
    .line 12
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;->setAlphaPercentPreferenceSummary(Landroid/preference/ListPreference;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static newInstance(I)Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;
    .locals 3
    .param p0, "appWidgetId"    # I

    .prologue
    .line 15
    new-instance v1, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;

    invoke-direct {v1}, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;-><init>()V

    .line 16
    .local v1, "fragment":Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 17
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "appWidgetId"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 18
    invoke-virtual {v1, v0}, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;->setArguments(Landroid/os/Bundle;)V

    .line 19
    return-object v1
.end method

.method private setAlphaPercentPreferenceSummary(Landroid/preference/ListPreference;Ljava/lang/CharSequence;)V
    .locals 3
    .param p1, "alphaPercentPreference"    # Landroid/preference/ListPreference;
    .param p2, "newSummary"    # Ljava/lang/CharSequence;

    .prologue
    .line 53
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "%"

    const-string v2, "%%"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 54
    invoke-virtual {p1, p2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 55
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "paramBundle"    # Landroid/os/Bundle;

    .prologue
    .line 24
    invoke-super {p0, p1}, Landroid/support/v4/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 26
    const/4 v1, 0x0

    .line 27
    .local v1, "appWidgetId":I
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 28
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "appWidgetId"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 30
    :cond_0
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v2

    invoke-static {v1}, Lcom/mobnetic/coinguardian/appwidget/WidgetPrefsUtils;->getSharedPreferencesName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceManager;->setSharedPreferencesName(Ljava/lang/String;)V

    .line 31
    const v2, 0x7f050006

    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;->addPreferencesFromResource(I)V

    .line 33
    const v2, 0x7f070116

    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/ListPreference;

    .line 34
    .local v0, "alphaPercentPreference":Landroid/preference/ListPreference;
    invoke-virtual {v0}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-direct {p0, v0, v2}, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;->setAlphaPercentPreferenceSummary(Landroid/preference/ListPreference;Ljava/lang/CharSequence;)V

    .line 35
    new-instance v2, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment$1;

    invoke-direct {v2, p0, v0}, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment$1;-><init>(Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;Landroid/preference/ListPreference;)V

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 50
    return-void
.end method
