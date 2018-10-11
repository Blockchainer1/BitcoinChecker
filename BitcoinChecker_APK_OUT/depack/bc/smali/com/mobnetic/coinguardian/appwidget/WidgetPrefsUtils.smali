.class public Lcom/mobnetic/coinguardian/appwidget/WidgetPrefsUtils;
.super Ljava/lang/Object;
.source "WidgetPrefsUtils.java"


# static fields
.field private static final PREFS_NAME:Ljava/lang/String; = "widget_prefs_"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAlphaPercent(Landroid/content/Context;I)I
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "appWidgetId"    # I

    .prologue
    .line 29
    invoke-static {p0, p1}, Lcom/mobnetic/coinguardian/appwidget/WidgetPrefsUtils;->getSharedPreferencesForWidget(Landroid/content/Context;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const v1, 0x7f070116

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x64

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getCompactMode(Landroid/content/Context;I)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "appWidgetId"    # I

    .prologue
    .line 25
    invoke-static {p0, p1}, Lcom/mobnetic/coinguardian/appwidget/WidgetPrefsUtils;->getSharedPreferencesForWidget(Landroid/content/Context;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const v1, 0x7f070118

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getDarkTheme(Landroid/content/Context;I)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "appWidgetId"    # I

    .prologue
    .line 33
    invoke-static {p0, p1}, Lcom/mobnetic/coinguardian/appwidget/WidgetPrefsUtils;->getSharedPreferencesForWidget(Landroid/content/Context;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const v1, 0x7f07011b

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private static getSharedPreferencesForWidget(Landroid/content/Context;I)Landroid/content/SharedPreferences;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "appWidgetId"    # I

    .prologue
    .line 13
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {p1}, Lcom/mobnetic/coinguardian/appwidget/WidgetPrefsUtils;->getSharedPreferencesName(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method public static getSharedPreferencesName(I)Ljava/lang/String;
    .locals 2
    .param p0, "appWidgetId"    # I

    .prologue
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "widget_prefs_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getShowActionBar(Landroid/content/Context;I)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "appWidgetId"    # I

    .prologue
    .line 21
    invoke-static {p0, p1}, Lcom/mobnetic/coinguardian/appwidget/WidgetPrefsUtils;->getSharedPreferencesForWidget(Landroid/content/Context;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const v1, 0x7f07011f

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method
