.class public Lcom/mobnetic/coinguardian/appwidget/WidgetProvider;
.super Landroid/appwidget/AppWidgetProvider;
.source "WidgetProvider.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/appwidget/AppWidgetProvider;-><init>()V

    .line 23
    return-void
.end method

.method private static getWidgetBackgroundForAlpha(ZI)I
    .locals 2
    .param p0, "isDarkTheme"    # Z
    .param p1, "alphaPercent"    # I

    .prologue
    const v0, 0x7f020059

    .line 131
    const/16 v1, 0x64

    if-ne p1, v1, :cond_1

    .line 132
    if-eqz p0, :cond_0

    const v0, 0x7f02005e

    .line 144
    :cond_0
    :goto_0
    return v0

    .line 133
    :cond_1
    const/16 v1, 0x5a

    if-lt p1, v1, :cond_3

    .line 134
    if-eqz p0, :cond_2

    const v0, 0x7f020062

    goto :goto_0

    :cond_2
    const v0, 0x7f02005d

    goto :goto_0

    .line 135
    :cond_3
    const/16 v1, 0x4b

    if-lt p1, v1, :cond_5

    .line 136
    if-eqz p0, :cond_4

    const v0, 0x7f020061

    goto :goto_0

    :cond_4
    const v0, 0x7f02005c

    goto :goto_0

    .line 137
    :cond_5
    const/16 v1, 0x32

    if-lt p1, v1, :cond_7

    .line 138
    if-eqz p0, :cond_6

    const v0, 0x7f020060

    goto :goto_0

    :cond_6
    const v0, 0x7f02005b

    goto :goto_0

    .line 139
    :cond_7
    const/16 v1, 0x19

    if-lt p1, v1, :cond_9

    .line 140
    if-eqz p0, :cond_8

    const v0, 0x7f02005f

    goto :goto_0

    :cond_8
    const v0, 0x7f02005a

    goto :goto_0

    .line 141
    :cond_9
    if-ltz p1, :cond_0

    .line 142
    const v0, 0x7f0200b0

    goto :goto_0
.end method

.method public static refreshWidget(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 123
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_0

    .line 124
    invoke-static {p0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v1

    .line 125
    .local v1, "appWidgetManager":Landroid/appwidget/AppWidgetManager;
    new-instance v2, Landroid/content/ComponentName;

    const-class v3, Lcom/mobnetic/coinguardian/appwidget/WidgetProvider;

    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2}, Landroid/appwidget/AppWidgetManager;->getAppWidgetIds(Landroid/content/ComponentName;)[I

    move-result-object v0

    .line 126
    .local v0, "appWidgetIds":[I
    const v2, 0x7f0e009d

    invoke-virtual {v1, v0, v2}, Landroid/appwidget/AppWidgetManager;->notifyAppWidgetViewDataChanged([II)V

    .line 128
    .end local v0    # "appWidgetIds":[I
    .end local v1    # "appWidgetManager":Landroid/appwidget/AppWidgetManager;
    :cond_0
    return-void
.end method

.method public static final updateWdgetWithId(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;I)V
    .locals 16
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "appWidgetManager"    # Landroid/appwidget/AppWidgetManager;
    .param p2, "appWidgetId"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 49
    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v14, 0xb

    if-lt v13, v14, :cond_0

    .line 50
    new-instance v9, Landroid/widget/RemoteViews;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v13

    const v14, 0x7f03002f

    invoke-direct {v9, v13, v14}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 52
    .local v9, "remoteViews":Landroid/widget/RemoteViews;
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/appwidget/WidgetPrefsUtils;->getDarkTheme(Landroid/content/Context;I)Z

    move-result v3

    .line 53
    .local v3, "isDarkTheme":Z
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    if-eqz v3, :cond_1

    const v13, 0x7f0d0013

    :goto_0
    invoke-virtual {v14, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v11

    .line 54
    .local v11, "textColorPrimary":I
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/appwidget/WidgetPrefsUtils;->getAlphaPercent(Landroid/content/Context;I)I

    move-result v13

    invoke-static {v3, v13}, Lcom/mobnetic/coinguardian/appwidget/WidgetProvider;->getWidgetBackgroundForAlpha(ZI)I

    move-result v12

    .line 56
    .local v12, "widgetBackgroundResId":I
    const v13, 0x7f0e0099

    const-string v14, "setBackgroundResource"

    invoke-virtual {v9, v13, v14, v12}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 57
    const v14, 0x7f0e009a

    const-string v15, "setBackgroundResource"

    if-eqz v3, :cond_2

    const v13, 0x7f0200ac

    :goto_1
    invoke-virtual {v9, v14, v15, v13}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 58
    const v14, 0x7f0e009b

    const-string v15, "setBackgroundResource"

    if-eqz v3, :cond_3

    const v13, 0x7f0200aa

    :goto_2
    invoke-virtual {v9, v14, v15, v13}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 60
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/appwidget/WidgetPrefsUtils;->getShowActionBar(Landroid/content/Context;I)Z

    move-result v13

    if-eqz v13, :cond_4

    const/4 v2, 0x0

    .line 61
    .local v2, "actionBarVisibility":I
    :goto_3
    const v13, 0x7f0e000c

    invoke-virtual {v9, v13, v11}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 62
    const v13, 0x7f0e009a

    invoke-virtual {v9, v13, v2}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 63
    const v14, 0x7f0e009c

    if-eqz v3, :cond_5

    const v13, 0x7f0d000e

    :goto_4
    invoke-virtual {v9, v14, v13}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 64
    const v13, 0x7f0e009c

    invoke-virtual {v9, v13, v2}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 65
    const v14, 0x7f0e009e

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    if-eqz v3, :cond_6

    const v13, 0x7f0d0011

    :goto_5
    invoke-virtual {v15, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v13

    invoke-virtual {v9, v14, v13}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 69
    new-instance v10, Landroid/content/Intent;

    const-class v13, Lcom/mobnetic/coinguardian/appwidget/WidgetService;

    move-object/from16 v0, p0

    invoke-direct {v10, v0, v13}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 70
    .local v10, "serviceIntent":Landroid/content/Intent;
    const-string v13, "appWidgetId"

    move/from16 v0, p2

    invoke-virtual {v10, v13, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 72
    const/4 v13, 0x1

    invoke-virtual {v10, v13}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    invoke-virtual {v10, v13}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 75
    const v13, 0x7f0e009d

    move/from16 v0, p2

    invoke-virtual {v9, v0, v13, v10}, Landroid/widget/RemoteViews;->setRemoteAdapter(IILandroid/content/Intent;)V

    .line 77
    const v13, 0x7f0e009d

    const v14, 0x7f0e009e

    invoke-virtual {v9, v13, v14}, Landroid/widget/RemoteViews;->setEmptyView(II)V

    .line 78
    const v13, 0x7f0e009e

    const v14, 0x7f070113

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v13, v14}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 80
    invoke-static/range {p0 .. p0}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->createMainActivityPendingIntent(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v4

    .line 81
    .local v4, "mainActivityPendingIntent":Landroid/app/PendingIntent;
    const v13, 0x7f0e009a

    invoke-virtual {v9, v13, v4}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 82
    const v13, 0x7f0e009e

    invoke-virtual {v9, v13, v4}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 84
    const v14, 0x7f0e009b

    if-eqz v3, :cond_7

    const v13, 0x7f02006f

    :goto_6
    invoke-virtual {v9, v14, v13}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 85
    new-instance v5, Landroid/content/Intent;

    const-string v13, "com.mobnetic.coinguardian.receiver.action.notification_refresh_all"

    const/4 v14, 0x0

    const-class v15, Lcom/mobnetic/coinguardian/receiver/NotificationAndWidgetReceiver;

    move-object/from16 v0, p0

    invoke-direct {v5, v13, v14, v0, v15}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    .line 86
    .local v5, "refreshAllIntent":Landroid/content/Intent;
    const/4 v13, 0x0

    const/high16 v14, 0x8000000

    move-object/from16 v0, p0

    invoke-static {v0, v13, v5, v14}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    .line 87
    .local v6, "refreshAllPendingIntent":Landroid/app/PendingIntent;
    const v13, 0x7f0e009b

    invoke-virtual {v9, v13, v6}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 93
    new-instance v7, Landroid/content/Intent;

    const-string v13, "com.mobnetic.coinguardian.receiver.action.notification_refresh"

    const/4 v14, 0x0

    const-class v15, Lcom/mobnetic/coinguardian/receiver/NotificationAndWidgetReceiver;

    move-object/from16 v0, p0

    invoke-direct {v7, v13, v14, v0, v15}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    .line 94
    .local v7, "refreshIntent":Landroid/content/Intent;
    const/4 v13, 0x1

    invoke-virtual {v7, v13}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    invoke-virtual {v7, v13}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 95
    const/4 v13, 0x0

    const/high16 v14, 0x8000000

    move-object/from16 v0, p0

    invoke-static {v0, v13, v7, v14}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v8

    .line 96
    .local v8, "refreshPendingIntent":Landroid/app/PendingIntent;
    const v13, 0x7f0e009d

    invoke-virtual {v9, v13, v8}, Landroid/widget/RemoteViews;->setPendingIntentTemplate(ILandroid/app/PendingIntent;)V

    .line 98
    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v0, v1, v9}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(ILandroid/widget/RemoteViews;)V

    .line 100
    .end local v2    # "actionBarVisibility":I
    .end local v3    # "isDarkTheme":Z
    .end local v4    # "mainActivityPendingIntent":Landroid/app/PendingIntent;
    .end local v5    # "refreshAllIntent":Landroid/content/Intent;
    .end local v6    # "refreshAllPendingIntent":Landroid/app/PendingIntent;
    .end local v7    # "refreshIntent":Landroid/content/Intent;
    .end local v8    # "refreshPendingIntent":Landroid/app/PendingIntent;
    .end local v9    # "remoteViews":Landroid/widget/RemoteViews;
    .end local v10    # "serviceIntent":Landroid/content/Intent;
    .end local v11    # "textColorPrimary":I
    .end local v12    # "widgetBackgroundResId":I
    :cond_0
    return-void

    .line 53
    .restart local v3    # "isDarkTheme":Z
    .restart local v9    # "remoteViews":Landroid/widget/RemoteViews;
    :cond_1
    const v13, 0x7f0d0014

    goto/16 :goto_0

    .line 57
    .restart local v11    # "textColorPrimary":I
    .restart local v12    # "widgetBackgroundResId":I
    :cond_2
    const v13, 0x7f0200ad

    goto/16 :goto_1

    .line 58
    :cond_3
    const v13, 0x7f0200ab

    goto/16 :goto_2

    .line 60
    :cond_4
    const/16 v2, 0x8

    goto/16 :goto_3

    .line 63
    .restart local v2    # "actionBarVisibility":I
    :cond_5
    const v13, 0x7f0d000f

    goto/16 :goto_4

    .line 65
    :cond_6
    const v13, 0x7f0d0012

    goto/16 :goto_5

    .line 84
    .restart local v4    # "mainActivityPendingIntent":Landroid/app/PendingIntent;
    .restart local v10    # "serviceIntent":Landroid/content/Intent;
    :cond_7
    const v13, 0x7f02006e

    goto :goto_6
.end method


# virtual methods
.method public onDeleted(Landroid/content/Context;[I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "appWidgetIds"    # [I

    .prologue
    .line 114
    invoke-super {p0, p1, p2}, Landroid/appwidget/AppWidgetProvider;->onDeleted(Landroid/content/Context;[I)V

    .line 115
    return-void
.end method

.method public onDisabled(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetProvider;->onDisabled(Landroid/content/Context;)V

    .line 33
    return-void
.end method

.method public onEnabled(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 27
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetProvider;->onEnabled(Landroid/content/Context;)V

    .line 28
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 118
    invoke-super {p0, p1, p2}, Landroid/appwidget/AppWidgetProvider;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    .line 119
    return-void
.end method

.method public onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "appWidgetManager"    # Landroid/appwidget/AppWidgetManager;
    .param p3, "appWidgetIds"    # [I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 38
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_1

    .line 39
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p3

    if-ge v0, v1, :cond_0

    .line 40
    aget v1, p3, v0

    invoke-static {p1, p2, v1}, Lcom/mobnetic/coinguardian/appwidget/WidgetProvider;->updateWdgetWithId(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;I)V

    .line 39
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 41
    :cond_0
    const v1, 0x7f0e009d

    invoke-virtual {p2, p3, v1}, Landroid/appwidget/AppWidgetManager;->notifyAppWidgetViewDataChanged([II)V

    .line 43
    .end local v0    # "i":I
    :cond_1
    invoke-super {p0, p1, p2, p3}, Landroid/appwidget/AppWidgetProvider;->onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V

    .line 44
    return-void
.end method
