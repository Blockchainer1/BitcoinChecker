.class public abstract Lcom/robotoworks/mechanoid/net/EntityEnclosedServiceRequest;
.super Lcom/robotoworks/mechanoid/net/ServiceRequest;
.source "EntityEnclosedServiceRequest.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/net/ServiceRequest;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract writeBody(Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;Ljava/io/OutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
