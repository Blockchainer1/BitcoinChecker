.class Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$12;
.super Ljava/lang/Object;
.source "CheckerAddFragment.java"

# interfaces
.implements Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$OnFrequencySelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .prologue
    .line 364
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$12;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFrequencySelected(Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;J)Z
    .locals 2
    .param p1, "viewSpinnerPreference"    # Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;
    .param p2, "frequency"    # J

    .prologue
    const/4 v1, 0x1

    .line 366
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$12;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setFrequency(J)V

    .line 367
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$12;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$202(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Z)Z

    .line 368
    return v1
.end method
