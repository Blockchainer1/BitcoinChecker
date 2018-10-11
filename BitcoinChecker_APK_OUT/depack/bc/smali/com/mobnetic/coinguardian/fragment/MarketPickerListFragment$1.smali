.class Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment$1;
.super Ljava/lang/Object;
.source "MarketPickerListFragment.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->getNewList(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/mobnetic/coinguardian/model/Market;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment$1;->this$0:Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/model/Market;)I
    .locals 2
    .param p1, "lhs"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p2, "rhs"    # Lcom/mobnetic/coinguardian/model/Market;

    .prologue
    .line 79
    iget-object v0, p1, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    if-eqz v0, :cond_0

    if-nez p2, :cond_1

    .line 80
    :cond_0
    const/4 v0, 0x0

    .line 81
    :goto_0
    return v0

    :cond_1
    iget-object v0, p1, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    iget-object v1, p2, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 77
    check-cast p1, Lcom/mobnetic/coinguardian/model/Market;

    check-cast p2, Lcom/mobnetic/coinguardian/model/Market;

    invoke-virtual {p0, p1, p2}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment$1;->compare(Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/model/Market;)I

    move-result v0

    return v0
.end method
