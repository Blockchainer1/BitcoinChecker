.class public Lcom/robotoworks/mechanoid/ops/SupportOperationManager;
.super Lcom/robotoworks/mechanoid/ops/OperationManagerBase;
.source "SupportOperationManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/robotoworks/mechanoid/ops/SupportOperationManager$PersistenceFragment;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "OperationManager"


# direct methods
.method private constructor <init>(Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;Z)V
    .locals 0
    .param p1, "callbacks"    # Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;
    .param p2, "enableLogging"    # Z

    .prologue
    .line 80
    invoke-direct {p0, p1, p2}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;-><init>(Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;Z)V

    .line 81
    return-void
.end method

.method public static create(Landroid/support/v4/app/FragmentActivity;Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;)Lcom/robotoworks/mechanoid/ops/SupportOperationManager;
    .locals 1
    .param p0, "activity"    # Landroid/support/v4/app/FragmentActivity;
    .param p1, "callbacks"    # Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;

    .prologue
    .line 76
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/robotoworks/mechanoid/ops/SupportOperationManager;->create(Landroid/support/v4/app/FragmentActivity;Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;Z)Lcom/robotoworks/mechanoid/ops/SupportOperationManager;

    move-result-object v0

    return-object v0
.end method

.method public static create(Landroid/support/v4/app/FragmentActivity;Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;Z)Lcom/robotoworks/mechanoid/ops/SupportOperationManager;
    .locals 9
    .param p0, "activity"    # Landroid/support/v4/app/FragmentActivity;
    .param p1, "callbacks"    # Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;
    .param p2, "enableLogging"    # Z

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 30
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Tags."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 32
    .local v3, "tag":Ljava/lang/String;
    const/4 v2, 0x0

    .line 34
    .local v2, "operationManager":Lcom/robotoworks/mechanoid/ops/SupportOperationManager;
    invoke-virtual {p0}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 36
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/robotoworks/mechanoid/ops/SupportOperationManager$PersistenceFragment;

    .line 38
    .local v1, "frag":Lcom/robotoworks/mechanoid/ops/SupportOperationManager$PersistenceFragment;
    if-nez v1, :cond_1

    .line 40
    if-eqz p2, :cond_0

    .line 41
    const-string v4, "OperationManager"

    const-string v5, "[Create Fragment] tag:%s"

    new-array v6, v8, [Ljava/lang/Object;

    aput-object v3, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    :cond_0
    new-instance v1, Lcom/robotoworks/mechanoid/ops/SupportOperationManager$PersistenceFragment;

    .end local v1    # "frag":Lcom/robotoworks/mechanoid/ops/SupportOperationManager$PersistenceFragment;
    invoke-direct {v1}, Lcom/robotoworks/mechanoid/ops/SupportOperationManager$PersistenceFragment;-><init>()V

    .line 45
    .restart local v1    # "frag":Lcom/robotoworks/mechanoid/ops/SupportOperationManager$PersistenceFragment;
    new-instance v2, Lcom/robotoworks/mechanoid/ops/SupportOperationManager;

    .end local v2    # "operationManager":Lcom/robotoworks/mechanoid/ops/SupportOperationManager;
    invoke-direct {v2, p1, p2}, Lcom/robotoworks/mechanoid/ops/SupportOperationManager;-><init>(Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;Z)V

    .line 46
    .restart local v2    # "operationManager":Lcom/robotoworks/mechanoid/ops/SupportOperationManager;
    invoke-virtual {v1, v2}, Lcom/robotoworks/mechanoid/ops/SupportOperationManager$PersistenceFragment;->setOperationManager(Lcom/robotoworks/mechanoid/ops/OperationManagerBase;)V

    .line 47
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v4

    invoke-virtual {v4, v1, v3}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 72
    :goto_0
    return-object v2

    .line 50
    :cond_1
    if-eqz p2, :cond_2

    .line 51
    const-string v4, "OperationManager"

    const-string v5, "[Recover Fragment] tag:%s"

    new-array v6, v8, [Ljava/lang/Object;

    aput-object v3, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    :cond_2
    invoke-virtual {v1}, Lcom/robotoworks/mechanoid/ops/SupportOperationManager$PersistenceFragment;->getOperationManager()Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

    move-result-object v2

    .end local v2    # "operationManager":Lcom/robotoworks/mechanoid/ops/SupportOperationManager;
    check-cast v2, Lcom/robotoworks/mechanoid/ops/SupportOperationManager;

    .line 56
    .restart local v2    # "operationManager":Lcom/robotoworks/mechanoid/ops/SupportOperationManager;
    if-nez v2, :cond_4

    .line 57
    if-eqz p2, :cond_3

    .line 58
    const-string v4, "OperationManager"

    const-string v5, "[Create Manager] tag:%s"

    new-array v6, v8, [Ljava/lang/Object;

    aput-object v3, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    :cond_3
    new-instance v2, Lcom/robotoworks/mechanoid/ops/SupportOperationManager;

    .end local v2    # "operationManager":Lcom/robotoworks/mechanoid/ops/SupportOperationManager;
    invoke-direct {v2, p1, p2}, Lcom/robotoworks/mechanoid/ops/SupportOperationManager;-><init>(Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;Z)V

    .line 62
    .restart local v2    # "operationManager":Lcom/robotoworks/mechanoid/ops/SupportOperationManager;
    invoke-virtual {v1, v2}, Lcom/robotoworks/mechanoid/ops/SupportOperationManager$PersistenceFragment;->setOperationManager(Lcom/robotoworks/mechanoid/ops/OperationManagerBase;)V

    goto :goto_0

    .line 64
    :cond_4
    if-eqz p2, :cond_5

    .line 65
    const-string v4, "OperationManager"

    const-string v5, "[Recover Manager] tag:%s"

    new-array v6, v8, [Ljava/lang/Object;

    aput-object v3, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    :cond_5
    iput-object p1, v2, Lcom/robotoworks/mechanoid/ops/SupportOperationManager;->mCallbacks:Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;

    goto :goto_0
.end method
