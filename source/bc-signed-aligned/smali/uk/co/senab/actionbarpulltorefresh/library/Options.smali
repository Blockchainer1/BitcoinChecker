.class public final Luk/co/senab/actionbarpulltorefresh/library/Options;
.super Ljava/lang/Object;
.source "Options.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;
    }
.end annotation


# static fields
.field private static final DEFAULT_HEADER_LAYOUT:I

.field private static final DEFAULT_REFRESH_MINIMIZE:Z = true

.field private static final DEFAULT_REFRESH_MINIMIZED_DELAY:I = 0x3e8

.field private static final DEFAULT_REFRESH_ON_UP:Z = false

.field private static final DEFAULT_REFRESH_SCROLL_DISTANCE:F = 0.5f


# instance fields
.field environmentDelegate:Luk/co/senab/actionbarpulltorefresh/library/EnvironmentDelegate;

.field headerLayout:I

.field headerTransformer:Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

.field refreshMinimize:Z

.field refreshMinimizeDelay:I

.field refreshOnUp:Z

.field refreshScrollDistance:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    sget v0, Luk/co/senab/actionbarpulltorefresh/library/R$layout;->default_header:I

    sput v0, Luk/co/senab/actionbarpulltorefresh/library/Options;->DEFAULT_HEADER_LAYOUT:I

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/Options;->environmentDelegate:Luk/co/senab/actionbarpulltorefresh/library/EnvironmentDelegate;

    .line 38
    sget v0, Luk/co/senab/actionbarpulltorefresh/library/Options;->DEFAULT_HEADER_LAYOUT:I

    iput v0, p0, Luk/co/senab/actionbarpulltorefresh/library/Options;->headerLayout:I

    .line 39
    iput-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/Options;->headerTransformer:Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

    .line 40
    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p0, Luk/co/senab/actionbarpulltorefresh/library/Options;->refreshScrollDistance:F

    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/Options;->refreshOnUp:Z

    .line 42
    const/16 v0, 0x3e8

    iput v0, p0, Luk/co/senab/actionbarpulltorefresh/library/Options;->refreshMinimizeDelay:I

    .line 52
    const/4 v0, 0x1

    iput-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/Options;->refreshMinimize:Z

    .line 35
    return-void
.end method

.method public static create()Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;
    .locals 1

    .prologue
    .line 32
    new-instance v0, Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;

    invoke-direct {v0}, Luk/co/senab/actionbarpulltorefresh/library/Options$Builder;-><init>()V

    return-object v0
.end method
