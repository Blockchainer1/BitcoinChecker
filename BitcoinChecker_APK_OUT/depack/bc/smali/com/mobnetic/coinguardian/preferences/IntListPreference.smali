.class public Lcom/mobnetic/coinguardian/preferences/IntListPreference;
.super Landroid/preference/ListPreference;
.source "IntListPreference.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 9
    invoke-direct {p0, p1}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;)V

    .line 11
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/preferences/IntListPreference;->init()V

    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 15
    invoke-direct {p0, p1, p2}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 17
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/preferences/IntListPreference;->init()V

    .line 18
    return-void
.end method

.method private init()V
    .locals 0

    .prologue
    .line 21
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/preferences/IntListPreference;->setDefaultEntryValues()V

    .line 22
    return-void
.end method


# virtual methods
.method protected getPersistedString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "defaultReturnValue"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/preferences/IntListPreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/preferences/IntListPreference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 48
    .end local p1    # "defaultReturnValue":Ljava/lang/String;
    :goto_0
    return-object p1

    .restart local p1    # "defaultReturnValue":Ljava/lang/String;
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/preferences/IntListPreference;->getPersistedInt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method protected persistString(Ljava/lang/String;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 37
    if-nez p1, :cond_0

    .line 38
    const/4 v0, 0x0

    .line 40
    :goto_0
    return v0

    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/preferences/IntListPreference;->persistInt(I)Z

    move-result v0

    goto :goto_0
.end method

.method public setDefaultEntryValues()V
    .locals 4

    .prologue
    .line 25
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/preferences/IntListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v3

    if-nez v3, :cond_1

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/preferences/IntListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 26
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/preferences/IntListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v3

    array-length v0, v3

    .line 27
    .local v0, "count":I
    new-array v1, v0, [Ljava/lang/String;

    .line 28
    .local v1, "entryValues":[Ljava/lang/CharSequence;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 29
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 28
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/preferences/IntListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 33
    .end local v0    # "count":I
    .end local v1    # "entryValues":[Ljava/lang/CharSequence;
    .end local v2    # "i":I
    :cond_1
    return-void
.end method
