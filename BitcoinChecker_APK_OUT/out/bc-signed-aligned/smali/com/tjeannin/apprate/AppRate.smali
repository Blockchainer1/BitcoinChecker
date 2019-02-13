.class public Lcom/tjeannin/apprate/AppRate;
.super Ljava/lang/Object;
.source "AppRate.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/content/DialogInterface$OnCancelListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "AppRater"


# instance fields
.field private clickListener:Landroid/content/DialogInterface$OnClickListener;

.field private dialogBuilder:Landroid/app/AlertDialog$Builder;

.field private hostActivity:Landroid/app/Activity;

.field private minDaysUntilPrompt:J

.field private minLaunchesUntilPrompt:J

.field private preferences:Landroid/content/SharedPreferences;

.field private showIfHasCrashed:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 4
    .param p1, "hostActivity"    # Landroid/app/Activity;

    .prologue
    const-wide/16 v2, 0x0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/tjeannin/apprate/AppRate;->dialogBuilder:Landroid/app/AlertDialog$Builder;

    .line 32
    iput-wide v2, p0, Lcom/tjeannin/apprate/AppRate;->minLaunchesUntilPrompt:J

    .line 33
    iput-wide v2, p0, Lcom/tjeannin/apprate/AppRate;->minDaysUntilPrompt:J

    .line 35
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tjeannin/apprate/AppRate;->showIfHasCrashed:Z

    .line 39
    iput-object p1, p0, Lcom/tjeannin/apprate/AppRate;->hostActivity:Landroid/app/Activity;

    .line 40
    const-string v0, "apprate_prefs"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/tjeannin/apprate/AppRate;->preferences:Landroid/content/SharedPreferences;

    .line 41
    return-void
.end method

.method private static final getApplicationName(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 265
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 268
    .local v2, "packageManager":Landroid/content/pm/PackageManager;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 272
    .local v0, "applicationInfo":Landroid/content/pm/ApplicationInfo;
    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {v2, v0}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v3

    :goto_1
    check-cast v3, Ljava/lang/String;

    check-cast v3, Ljava/lang/String;

    return-object v3

    .line 269
    .end local v0    # "applicationInfo":Landroid/content/pm/ApplicationInfo;
    :catch_0
    move-exception v1

    .line 270
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v0, 0x0

    .restart local v0    # "applicationInfo":Landroid/content/pm/ApplicationInfo;
    goto :goto_0

    .line 272
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_0
    const-string v3, "(unknown)"

    goto :goto_1
.end method

.method private initExceptionHandler()V
    .locals 3

    .prologue
    .line 147
    const-string v1, "AppRater"

    const-string v2, "Init AppRate ExceptionHandler"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    .line 152
    .local v0, "currentHandler":Ljava/lang/Thread$UncaughtExceptionHandler;
    instance-of v1, v0, Lcom/tjeannin/apprate/ExceptionHandler;

    if-nez v1, :cond_0

    .line 155
    new-instance v1, Lcom/tjeannin/apprate/ExceptionHandler;

    iget-object v2, p0, Lcom/tjeannin/apprate/AppRate;->hostActivity:Landroid/app/Activity;

    invoke-direct {v1, v0, v2}, Lcom/tjeannin/apprate/ExceptionHandler;-><init>(Ljava/lang/Thread$UncaughtExceptionHandler;Landroid/content/Context;)V

    invoke-static {v1}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 157
    :cond_0
    return-void
.end method

.method public static reset(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 94
    const-string v0, "apprate_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 95
    const-string v0, "AppRater"

    const-string v1, "Cleared AppRate shared preferences."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    return-void
.end method

.method private showDefaultDialog()V
    .locals 7

    .prologue
    .line 165
    const-string v5, "AppRater"

    const-string v6, "Create default dialog."

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Rate "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/tjeannin/apprate/AppRate;->hostActivity:Landroid/app/Activity;

    invoke-virtual {v6}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/tjeannin/apprate/AppRate;->getApplicationName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 168
    .local v4, "title":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "If you enjoy using "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/tjeannin/apprate/AppRate;->hostActivity:Landroid/app/Activity;

    invoke-virtual {v6}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/tjeannin/apprate/AppRate;->getApplicationName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", please take a moment to rate it. Thanks for your support!"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 169
    .local v1, "message":Ljava/lang/String;
    const-string v2, "Rate it !"

    .line 170
    .local v2, "rate":Ljava/lang/String;
    const-string v3, "Remind me later"

    .line 171
    .local v3, "remindLater":Ljava/lang/String;
    const-string v0, "No thanks"

    .line 173
    .local v0, "dismiss":Ljava/lang/String;
    new-instance v5, Landroid/app/AlertDialog$Builder;

    iget-object v6, p0, Lcom/tjeannin/apprate/AppRate;->hostActivity:Landroid/app/Activity;

    invoke-direct {v5, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 174
    invoke-virtual {v5, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 175
    invoke-virtual {v5, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 176
    invoke-virtual {v5, v2, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 177
    invoke-virtual {v5, v0, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 178
    invoke-virtual {v5, v3, p0}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 179
    invoke-virtual {v5, p0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 180
    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/AlertDialog;->show()V

    .line 181
    return-void
.end method

.method private showDialog(Landroid/app/AlertDialog$Builder;)V
    .locals 9
    .param p1, "builder"    # Landroid/app/AlertDialog$Builder;

    .prologue
    const/4 v8, -0x1

    const/4 v7, -0x2

    const/4 v6, -0x3

    .line 189
    const-string v4, "AppRater"

    const-string v5, "Create custom dialog."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 192
    .local v0, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 194
    invoke-virtual {v0, v8}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 195
    .local v2, "rate":Ljava/lang/String;
    invoke-virtual {v0, v6}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 196
    .local v3, "remindLater":Ljava/lang/String;
    invoke-virtual {v0, v7}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 198
    .local v1, "dismiss":Ljava/lang/String;
    invoke-virtual {v0, v8, v2, p0}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 199
    invoke-virtual {v0, v6, v3, p0}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 200
    invoke-virtual {v0, v7, v1, p0}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 202
    invoke-virtual {v0, p0}, Landroid/app/AlertDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 203
    return-void
.end method


# virtual methods
.method public init()V
    .locals 12

    .prologue
    const/4 v6, 0x0

    const-wide/16 v8, 0x0

    .line 103
    const-string v4, "AppRater"

    const-string v5, "Init AppRate"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    iget-object v4, p0, Lcom/tjeannin/apprate/AppRate;->preferences:Landroid/content/SharedPreferences;

    const-string v5, "dont_show_again"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/tjeannin/apprate/AppRate;->preferences:Landroid/content/SharedPreferences;

    const-string v5, "pref_app_has_crashed"

    .line 106
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-boolean v4, p0, Lcom/tjeannin/apprate/AppRate;->showIfHasCrashed:Z

    if-nez v4, :cond_1

    .line 140
    :cond_0
    :goto_0
    return-void

    .line 110
    :cond_1
    iget-boolean v4, p0, Lcom/tjeannin/apprate/AppRate;->showIfHasCrashed:Z

    if-nez v4, :cond_2

    .line 111
    invoke-direct {p0}, Lcom/tjeannin/apprate/AppRate;->initExceptionHandler()V

    .line 114
    :cond_2
    iget-object v4, p0, Lcom/tjeannin/apprate/AppRate;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 117
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    iget-object v4, p0, Lcom/tjeannin/apprate/AppRate;->preferences:Landroid/content/SharedPreferences;

    const-string v5, "launch_count"

    invoke-interface {v4, v5, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    const-wide/16 v6, 0x1

    add-long v2, v4, v6

    .line 118
    .local v2, "launch_count":J
    const-string v4, "launch_count"

    invoke-interface {v1, v4, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 121
    iget-object v4, p0, Lcom/tjeannin/apprate/AppRate;->preferences:Landroid/content/SharedPreferences;

    const-string v5, "date_firstlaunch"

    invoke-interface {v4, v5, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 122
    .local v0, "date_firstLaunch":Ljava/lang/Long;
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    cmp-long v4, v4, v8

    if-nez v4, :cond_3

    .line 123
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 124
    const-string v4, "date_firstlaunch"

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-interface {v1, v4, v6, v7}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 128
    :cond_3
    iget-wide v4, p0, Lcom/tjeannin/apprate/AppRate;->minLaunchesUntilPrompt:J

    cmp-long v4, v2, v4

    if-ltz v4, :cond_4

    .line 129
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/tjeannin/apprate/AppRate;->minDaysUntilPrompt:J

    const-wide/32 v10, 0x5265c00

    mul-long/2addr v8, v10

    add-long/2addr v6, v8

    cmp-long v4, v4, v6

    if-ltz v4, :cond_4

    .line 131
    iget-object v4, p0, Lcom/tjeannin/apprate/AppRate;->dialogBuilder:Landroid/app/AlertDialog$Builder;

    if-eqz v4, :cond_5

    .line 132
    iget-object v4, p0, Lcom/tjeannin/apprate/AppRate;->dialogBuilder:Landroid/app/AlertDialog$Builder;

    invoke-direct {p0, v4}, Lcom/tjeannin/apprate/AppRate;->showDialog(Landroid/app/AlertDialog$Builder;)V

    .line 139
    :cond_4
    :goto_1
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0

    .line 134
    :cond_5
    invoke-direct {p0}, Lcom/tjeannin/apprate/AppRate;->showDefaultDialog()V

    goto :goto_1
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 208
    iget-object v1, p0, Lcom/tjeannin/apprate/AppRate;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 209
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v1, "date_firstlaunch"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 210
    const-string v1, "launch_count"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 211
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 212
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 8
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v7, 0x1

    .line 226
    iget-object v2, p0, Lcom/tjeannin/apprate/AppRate;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 228
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    packed-switch p2, :pswitch_data_0

    .line 252
    :goto_0
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 253
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 255
    iget-object v2, p0, Lcom/tjeannin/apprate/AppRate;->clickListener:Landroid/content/DialogInterface$OnClickListener;

    if-eqz v2, :cond_0

    .line 256
    iget-object v2, p0, Lcom/tjeannin/apprate/AppRate;->clickListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-interface {v2, p1, p2}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    .line 258
    :cond_0
    return-void

    .line 232
    :pswitch_0
    :try_start_0
    iget-object v2, p0, Lcom/tjeannin/apprate/AppRate;->hostActivity:Landroid/app/Activity;

    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "market://details?id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/tjeannin/apprate/AppRate;->hostActivity:Landroid/app/Activity;

    invoke-virtual {v6}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 236
    :goto_1
    const-string v2, "dont_show_again"

    invoke-interface {v1, v2, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 233
    :catch_0
    move-exception v0

    .line 234
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    iget-object v2, p0, Lcom/tjeannin/apprate/AppRate;->hostActivity:Landroid/app/Activity;

    const-string v3, "No Play Store installed on device"

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 240
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    :pswitch_1
    const-string v2, "dont_show_again"

    invoke-interface {v1, v2, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 244
    :pswitch_2
    const-string v2, "date_firstlaunch"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-interface {v1, v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 245
    const-string v2, "launch_count"

    const-wide/16 v4, 0x0

    invoke-interface {v1, v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 228
    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setCustomDialog(Landroid/app/AlertDialog$Builder;)Lcom/tjeannin/apprate/AppRate;
    .locals 0
    .param p1, "customBuilder"    # Landroid/app/AlertDialog$Builder;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/tjeannin/apprate/AppRate;->dialogBuilder:Landroid/app/AlertDialog$Builder;

    .line 86
    return-object p0
.end method

.method public setMinDaysUntilPrompt(J)Lcom/tjeannin/apprate/AppRate;
    .locals 1
    .param p1, "minDaysUntilPrompt"    # J

    .prologue
    .line 59
    iput-wide p1, p0, Lcom/tjeannin/apprate/AppRate;->minDaysUntilPrompt:J

    .line 60
    return-object p0
.end method

.method public setMinLaunchesUntilPrompt(J)Lcom/tjeannin/apprate/AppRate;
    .locals 1
    .param p1, "minLaunchesUntilPrompt"    # J

    .prologue
    .line 49
    iput-wide p1, p0, Lcom/tjeannin/apprate/AppRate;->minLaunchesUntilPrompt:J

    .line 50
    return-object p0
.end method

.method public setOnClickListener(Landroid/content/DialogInterface$OnClickListener;)Lcom/tjeannin/apprate/AppRate;
    .locals 0
    .param p1, "onClickListener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 219
    iput-object p1, p0, Lcom/tjeannin/apprate/AppRate;->clickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 220
    return-object p0
.end method

.method public setShowIfAppHasCrashed(Z)Lcom/tjeannin/apprate/AppRate;
    .locals 0
    .param p1, "showIfCrash"    # Z

    .prologue
    .line 69
    iput-boolean p1, p0, Lcom/tjeannin/apprate/AppRate;->showIfHasCrashed:Z

    .line 70
    return-object p0
.end method
