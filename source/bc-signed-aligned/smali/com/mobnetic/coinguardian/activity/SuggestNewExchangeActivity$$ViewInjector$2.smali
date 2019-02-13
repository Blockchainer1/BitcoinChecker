.class final Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity$$ViewInjector$2;
.super Ljava/lang/Object;
.source "SuggestNewExchangeActivity$$ViewInjector.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity$$ViewInjector;->inject(Lbutterknife/ButterKnife$Finder;Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$target:Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;)V
    .locals 0

    .prologue
    .line 33
    iput-object p1, p0, Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity$$ViewInjector$2;->val$target:Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "p0"    # Landroid/view/View;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity$$ViewInjector$2;->val$target:Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;->onDonateButtonClicked()V

    .line 38
    return-void
.end method
