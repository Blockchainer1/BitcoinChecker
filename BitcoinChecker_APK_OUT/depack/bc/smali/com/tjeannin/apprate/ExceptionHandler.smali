.class public Lcom/tjeannin/apprate/ExceptionHandler;
.super Ljava/lang/Object;
.source "ExceptionHandler.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# instance fields
.field private defaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

.field preferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Ljava/lang/Thread$UncaughtExceptionHandler;Landroid/content/Context;)V
    .locals 2
    .param p1, "uncaughtExceptionHandler"    # Ljava/lang/Thread$UncaughtExceptionHandler;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const-string v0, "apprate_prefs"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/tjeannin/apprate/ExceptionHandler;->preferences:Landroid/content/SharedPreferences;

    .line 17
    iput-object p1, p0, Lcom/tjeannin/apprate/ExceptionHandler;->defaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 18
    return-void
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "thread"    # Ljava/lang/Thread;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/tjeannin/apprate/ExceptionHandler;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "pref_app_has_crashed"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 25
    iget-object v0, p0, Lcom/tjeannin/apprate/ExceptionHandler;->defaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 26
    return-void
.end method
