.class public Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;
.super Ljava/lang/Object;
.source "Options.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Luk/co/senab/actionbarpulltorefresh/library/Options;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field final mOptions:Luk/co/senab/actionbarpulltorefresh/library/Options;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Luk/co/senab/actionbarpulltorefresh/library/Options;

    invoke-direct {v0}, Luk/co/senab/actionbarpulltorefresh/library/Options;-><init>()V

    iput-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;->mOptions:Luk/co/senab/actionbarpulltorefresh/library/Options;

    return-void
.end method


# virtual methods
.method public build()Luk/co/senab/actionbarpulltorefresh/library/Options;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;->mOptions:Luk/co/senab/actionbarpulltorefresh/library/Options;

    return-object v0
.end method

.method public environmentDelegate(Luk/co/senab/actionbarpulltorefresh/library/EnvironmentDelegate;)Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;
    .locals 1
    .param p1, "environmentDelegate"    # Luk/co/senab/actionbarpulltorefresh/library/EnvironmentDelegate;

    .prologue
    .line 62
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;->mOptions:Luk/co/senab/actionbarpulltorefresh/library/Options;

    iput-object p1, v0, Luk/co/senab/actionbarpulltorefresh/library/Options;->environmentDelegate:Luk/co/senab/actionbarpulltorefresh/library/EnvironmentDelegate;

    .line 63
    return-object p0
.end method

.method public headerLayout(I)Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;
    .locals 1
    .param p1, "headerLayoutId"    # I

    .prologue
    .line 71
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;->mOptions:Luk/co/senab/actionbarpulltorefresh/library/Options;

    iput p1, v0, Luk/co/senab/actionbarpulltorefresh/library/Options;->headerLayout:I

    .line 72
    return-object p0
.end method

.method public headerTransformer(Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;)Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;
    .locals 1
    .param p1, "headerTransformer"    # Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

    .prologue
    .line 80
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;->mOptions:Luk/co/senab/actionbarpulltorefresh/library/Options;

    iput-object p1, v0, Luk/co/senab/actionbarpulltorefresh/library/Options;->headerTransformer:Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

    .line 81
    return-object p0
.end method

.method public minimize()Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;
    .locals 1

    .prologue
    .line 116
    const/16 v0, 0x3e8

    invoke-virtual {p0, v0}, Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;->minimize(I)Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;

    move-result-object v0

    return-object v0
.end method

.method public minimize(I)Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;
    .locals 2
    .param p1, "delay"    # I

    .prologue
    .line 123
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;->mOptions:Luk/co/senab/actionbarpulltorefresh/library/Options;

    iput p1, v0, Luk/co/senab/actionbarpulltorefresh/library/Options;->refreshMinimizeDelay:I

    .line 124
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;->mOptions:Luk/co/senab/actionbarpulltorefresh/library/Options;

    const/4 v1, 0x1

    iput-boolean v1, v0, Luk/co/senab/actionbarpulltorefresh/library/Options;->refreshMinimize:Z

    .line 125
    return-object p0
.end method

.method public noMinimize()Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;
    .locals 2

    .prologue
    .line 107
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;->mOptions:Luk/co/senab/actionbarpulltorefresh/library/Options;

    const/4 v1, 0x0

    iput-boolean v1, v0, Luk/co/senab/actionbarpulltorefresh/library/Options;->refreshMinimize:Z

    .line 108
    return-object p0
.end method

.method public refreshOnUp(Z)Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 98
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;->mOptions:Luk/co/senab/actionbarpulltorefresh/library/Options;

    iput-boolean p1, v0, Luk/co/senab/actionbarpulltorefresh/library/Options;->refreshOnUp:Z

    .line 99
    return-object p0
.end method

.method public scrollDistance(F)Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;
    .locals 1
    .param p1, "refreshScrollDistance"    # F

    .prologue
    .line 89
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;->mOptions:Luk/co/senab/actionbarpulltorefresh/library/Options;

    iput p1, v0, Luk/co/senab/actionbarpulltorefresh/library/Options;->refreshScrollDistance:F

    .line 90
    return-object p0
.end method
