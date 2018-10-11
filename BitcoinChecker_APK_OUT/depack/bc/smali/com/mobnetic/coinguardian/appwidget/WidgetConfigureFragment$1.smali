.class Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment$1;
.super Ljava/lang/Object;
.source "WidgetConfigureFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;

.field final synthetic val$alphaPercentPreference:Landroid/preference/ListPreference;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;Landroid/preference/ListPreference;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment$1;->this$0:Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment$1;->val$alphaPercentPreference:Landroid/preference/ListPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 6
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 38
    :try_start_0
    iget-object v3, p0, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment$1;->val$alphaPercentPreference:Landroid/preference/ListPreference;

    invoke-virtual {v3}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v1

    .line 39
    .local v1, "entries":[Ljava/lang/CharSequence;
    iget-object v3, p0, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment$1;->val$alphaPercentPreference:Landroid/preference/ListPreference;

    check-cast p2, Ljava/lang/String;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {v3, p2}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v2

    .line 40
    .local v2, "index":I
    if-ltz v2, :cond_0

    array-length v3, v1

    if-lt v2, v3, :cond_1

    .line 41
    :cond_0
    const/4 v2, 0x0

    .line 42
    :cond_1
    iget-object v3, p0, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment$1;->this$0:Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;

    iget-object v4, p0, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment$1;->val$alphaPercentPreference:Landroid/preference/ListPreference;

    iget-object v5, p0, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment$1;->val$alphaPercentPreference:Landroid/preference/ListPreference;

    invoke-virtual {v5}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v5

    aget-object v5, v5, v2

    invoke-static {v3, v4, v5}, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;->access$000(Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;Landroid/preference/ListPreference;Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    const/4 v3, 0x1

    .line 46
    .end local v1    # "entries":[Ljava/lang/CharSequence;
    .end local v2    # "index":I
    :goto_0
    return v3

    .line 44
    :catch_0
    move-exception v0

    .line 45
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 46
    const/4 v3, 0x0

    goto :goto_0
.end method
