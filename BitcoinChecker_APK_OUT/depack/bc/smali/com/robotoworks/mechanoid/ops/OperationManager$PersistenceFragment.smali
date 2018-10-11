.class public Lcom/robotoworks/mechanoid/ops/OperationManager$PersistenceFragment;
.super Landroid/app/Fragment;
.source "OperationManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/robotoworks/mechanoid/ops/OperationManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PersistenceFragment"
.end annotation


# instance fields
.field private mOperationManager:Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

.field private mSavedState:Landroid/os/Bundle;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 83
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method

.method private removeSelf()V
    .locals 1

    .prologue
    .line 154
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/ops/OperationManager$PersistenceFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 155
    return-void
.end method


# virtual methods
.method public getOperationManager()Lcom/robotoworks/mechanoid/ops/OperationManagerBase;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManager$PersistenceFragment;->mOperationManager:Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 102
    invoke-super {p0, p1}, Landroid/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 104
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/ops/OperationManager$PersistenceFragment;->getOperationManager()Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

    move-result-object v0

    .line 106
    .local v0, "operationManager":Lcom/robotoworks/mechanoid/ops/OperationManagerBase;
    if-nez v0, :cond_0

    .line 107
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationManager$PersistenceFragment;->mSavedState:Landroid/os/Bundle;

    .line 111
    :goto_0
    return-void

    .line 109
    :cond_0
    invoke-virtual {v0, p1}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->restoreState(Landroid/os/Bundle;)V

    goto :goto_0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 115
    invoke-super {p0, p1}, Landroid/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 117
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/ops/OperationManager$PersistenceFragment;->getOperationManager()Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

    move-result-object v0

    .line 119
    .local v0, "operationManager":Lcom/robotoworks/mechanoid/ops/OperationManagerBase;
    if-eqz v0, :cond_0

    .line 120
    invoke-virtual {v0, p1}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->saveState(Landroid/os/Bundle;)V

    .line 124
    :goto_0
    return-void

    .line 122
    :cond_0
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/ops/OperationManager$PersistenceFragment;->removeSelf()V

    goto :goto_0
.end method

.method public onStart()V
    .locals 1

    .prologue
    .line 129
    invoke-super {p0}, Landroid/app/Fragment;->onStart()V

    .line 131
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/ops/OperationManager$PersistenceFragment;->getOperationManager()Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

    move-result-object v0

    .line 133
    .local v0, "operationManager":Lcom/robotoworks/mechanoid/ops/OperationManagerBase;
    if-eqz v0, :cond_0

    .line 134
    invoke-virtual {v0}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->start()V

    .line 138
    :goto_0
    return-void

    .line 136
    :cond_0
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/ops/OperationManager$PersistenceFragment;->removeSelf()V

    goto :goto_0
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 142
    invoke-super {p0}, Landroid/app/Fragment;->onStop()V

    .line 144
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/ops/OperationManager$PersistenceFragment;->getOperationManager()Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

    move-result-object v0

    .line 146
    .local v0, "operationManager":Lcom/robotoworks/mechanoid/ops/OperationManagerBase;
    if-eqz v0, :cond_0

    .line 147
    invoke-virtual {v0}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->stop()V

    .line 151
    :goto_0
    return-void

    .line 149
    :cond_0
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/ops/OperationManager$PersistenceFragment;->removeSelf()V

    goto :goto_0
.end method

.method public setOperationManager(Lcom/robotoworks/mechanoid/ops/OperationManagerBase;)V
    .locals 2
    .param p1, "operationManager"    # Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationManager$PersistenceFragment;->mOperationManager:Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

    .line 90
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManager$PersistenceFragment;->mSavedState:Landroid/os/Bundle;

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManager$PersistenceFragment;->mOperationManager:Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationManager$PersistenceFragment;->mSavedState:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->restoreState(Landroid/os/Bundle;)V

    .line 92
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManager$PersistenceFragment;->mOperationManager:Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

    invoke-virtual {v0}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->start()V

    .line 94
    :cond_0
    return-void
.end method
