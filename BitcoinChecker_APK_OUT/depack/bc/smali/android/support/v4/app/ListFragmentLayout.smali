.class public Landroid/support/v4/app/ListFragmentLayout;
.super Ljava/lang/Object;
.source "ListFragmentLayout.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setupIds(Landroid/view/View;)V
    .locals 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 10
    const v0, 0x7f0e0076

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0xff0001

    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    .line 11
    const v0, 0x7f0e0074

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0xff0002

    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    .line 12
    const v0, 0x7f0e0075

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0xff0003

    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    .line 13
    return-void
.end method
