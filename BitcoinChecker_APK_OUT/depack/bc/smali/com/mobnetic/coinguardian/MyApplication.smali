.class public Lcom/mobnetic/coinguardian/MyApplication;
.super Landroid/app/Application;
.source "MyApplication.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 1

    .prologue
    .line 14
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 16
    const-string v0, "8grbc7eab79imc2r9co6fb0q5"

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/SwissCex;->API_KEY:Ljava/lang/String;

    .line 17
    invoke-static {p0}, Lcom/robotoworks/mechanoid/Mechanoid;->init(Landroid/content/Context;)V

    .line 18
    invoke-static {p0}, Lcom/mobnetic/coinguardian/util/SoundFilesManager;->installRingtonesIfNeeded(Landroid/content/Context;)V

    .line 20
    invoke-static {p0}, Lcom/mobnetic/coinguardian/volley/UserCountryDetectionAsyncTask;->setupUserCountry(Landroid/content/Context;)V

    .line 21
    return-void
.end method
