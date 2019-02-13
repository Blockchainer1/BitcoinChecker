.class public Lcom/robotoworks/mechanoid/Mechanoid;
.super Ljava/lang/Object;
.source "Mechanoid.java"


# static fields
.field private static sInstance:Lcom/robotoworks/mechanoid/Mechanoid;


# instance fields
.field mApplicationContext:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/Mechanoid;->mApplicationContext:Landroid/content/Context;

    .line 55
    return-void
.end method

.method public static get()Lcom/robotoworks/mechanoid/Mechanoid;
    .locals 1

    .prologue
    .line 47
    sget-object v0, Lcom/robotoworks/mechanoid/Mechanoid;->sInstance:Lcom/robotoworks/mechanoid/Mechanoid;

    if-nez v0, :cond_0

    .line 48
    new-instance v0, Lcom/robotoworks/mechanoid/MechanoidNotInitializedException;

    invoke-direct {v0}, Lcom/robotoworks/mechanoid/MechanoidNotInitializedException;-><init>()V

    throw v0

    .line 50
    :cond_0
    sget-object v0, Lcom/robotoworks/mechanoid/Mechanoid;->sInstance:Lcom/robotoworks/mechanoid/Mechanoid;

    return-object v0
.end method

.method public static getApplicationContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 33
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->get()Lcom/robotoworks/mechanoid/Mechanoid;

    move-result-object v0

    iget-object v0, v0, Lcom/robotoworks/mechanoid/Mechanoid;->mApplicationContext:Landroid/content/Context;

    return-object v0
.end method

.method public static getContentResolver()Landroid/content/ContentResolver;
    .locals 1

    .prologue
    .line 36
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->get()Lcom/robotoworks/mechanoid/Mechanoid;

    move-result-object v0

    iget-object v0, v0, Lcom/robotoworks/mechanoid/Mechanoid;->mApplicationContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    return-object v0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 64
    sget-object v0, Lcom/robotoworks/mechanoid/Mechanoid;->sInstance:Lcom/robotoworks/mechanoid/Mechanoid;

    if-nez v0, :cond_0

    .line 65
    new-instance v0, Lcom/robotoworks/mechanoid/Mechanoid;

    invoke-direct {v0, p0}, Lcom/robotoworks/mechanoid/Mechanoid;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/robotoworks/mechanoid/Mechanoid;->sInstance:Lcom/robotoworks/mechanoid/Mechanoid;

    .line 67
    invoke-static {}, Lcom/robotoworks/mechanoid/ops/OpsInitializer;->init()V

    .line 69
    :cond_0
    return-void
.end method

.method public static startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    .locals 1
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 40
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->get()Lcom/robotoworks/mechanoid/Mechanoid;

    move-result-object v0

    iget-object v0, v0, Lcom/robotoworks/mechanoid/Mechanoid;->mApplicationContext:Landroid/content/Context;

    invoke-virtual {v0, p0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v0

    return-object v0
.end method
