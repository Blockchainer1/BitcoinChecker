.class public Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureActivity;
.super Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;
.source "WidgetConfigureActivity.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity",
        "<",
        "Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;",
        ">;"
    }
.end annotation


# instance fields
.field private appWidgetId:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;-><init>()V

    .line 12
    const/4 v0, 0x0

    iput v0, p0, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureActivity;->appWidgetId:I

    return-void
.end method


# virtual methods
.method protected bridge synthetic createChildFragment()Landroid/support/v4/app/Fragment;
    .locals 1

    .prologue
    .line 9
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureActivity;->createChildFragment()Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;

    move-result-object v0

    return-object v0
.end method

.method protected createChildFragment()Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;
    .locals 1

    .prologue
    .line 34
    iget v0, p0, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureActivity;->appWidgetId:I

    invoke-static {v0}, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;->newInstance(I)Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureFragment;

    move-result-object v0

    return-object v0
.end method

.method public finish()V
    .locals 2

    .prologue
    .line 39
    invoke-static {p0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v0

    iget v1, p0, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureActivity;->appWidgetId:I

    invoke-static {p0, v0, v1}, Lcom/mobnetic/coinguardian/appwidget/WidgetProvider;->updateWdgetWithId(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;I)V

    .line 40
    invoke-super {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;->finish()V

    .line 41
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 16
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 17
    .local v2, "intent":Landroid/content/Intent;
    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 18
    .local v1, "extras":Landroid/os/Bundle;
    if-eqz v1, :cond_0

    .line 19
    const-string v4, "appWidgetId"

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v4

    iput v4, p0, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureActivity;->appWidgetId:I

    .line 22
    :cond_0
    invoke-super {p0, p1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;->onCreate(Landroid/os/Bundle;)V

    .line 24
    invoke-static {p0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v0

    .line 25
    .local v0, "appWidgetManager":Landroid/appwidget/AppWidgetManager;
    iget v4, p0, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureActivity;->appWidgetId:I

    invoke-static {p0, v0, v4}, Lcom/mobnetic/coinguardian/appwidget/WidgetProvider;->updateWdgetWithId(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;I)V

    .line 27
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 28
    .local v3, "resultValue":Landroid/content/Intent;
    const-string v4, "appWidgetId"

    iget v5, p0, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureActivity;->appWidgetId:I

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 29
    const/4 v4, -0x1

    invoke-virtual {p0, v4, v3}, Lcom/mobnetic/coinguardian/appwidget/WidgetConfigureActivity;->setResult(ILandroid/content/Intent;)V

    .line 30
    return-void
.end method
