.class Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$4;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 117
    iput-object p1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$4;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 119
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$4;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    invoke-static {v0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->access$500(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;)V

    .line 120
    return-void
.end method
