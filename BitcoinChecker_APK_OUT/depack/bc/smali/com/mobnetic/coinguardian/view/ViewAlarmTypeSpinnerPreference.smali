.class public Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;
.super Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;
.source "ViewAlarmTypeSpinnerPreference.java"


# instance fields
.field private alarmTypeHints:[Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;-><init>(Landroid/content/Context;)V

    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 21
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 26
    invoke-direct {p0, p1, p2, p3}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 27
    return-void
.end method


# virtual methods
.method public getEntry()Ljava/lang/CharSequence;
    .locals 3

    .prologue
    .line 39
    const/4 v0, 0x0

    .line 40
    .local v0, "alarmTypeHint":Ljava/lang/CharSequence;
    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;->alarmTypeHints:[Ljava/lang/CharSequence;

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;->getSelection()I

    move-result v1

    if-ltz v1, :cond_0

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;->getSelection()I

    move-result v1

    iget-object v2, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;->alarmTypeHints:[Ljava/lang/CharSequence;

    array-length v2, v2

    if-ge v1, v2, :cond_0

    .line 41
    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;->alarmTypeHints:[Ljava/lang/CharSequence;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;->getSelection()I

    move-result v2

    aget-object v0, v1, v2

    .line 43
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 44
    invoke-super {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v1

    .line 46
    :goto_0
    return-object v1

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 31
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c0001

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;->alarmTypeHints:[Ljava/lang/CharSequence;

    .line 32
    invoke-super {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0c0002

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 35
    return-void
.end method
