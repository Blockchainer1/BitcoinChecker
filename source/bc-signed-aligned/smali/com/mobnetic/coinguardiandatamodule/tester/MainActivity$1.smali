.class Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$1;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "arg2"    # I
    .param p4, "arg3"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 87
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$1;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    invoke-static {v1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->access$000(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v0

    .line 88
    .local v0, "selectedMarket":Lcom/mobnetic/coinguardian/model/Market;
    iget-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$1;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    new-instance v2, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    iget-object v3, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$1;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    iget-object v4, v0, Lcom/mobnetic/coinguardian/model/Market;->key:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/mobnetic/coinguardiandatamodule/tester/util/MarketCurrencyPairsStore;->getPairsForMarket(Landroid/content/Context;Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;-><init>(Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;)V

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->access$102(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .line 89
    iget-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$1;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    invoke-static {v1, v0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->access$200(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;Lcom/mobnetic/coinguardian/model/Market;)V

    .line 90
    iget-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$1;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    invoke-static {v1, v0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->access$300(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;Lcom/mobnetic/coinguardian/model/Market;)V

    .line 91
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 94
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method
