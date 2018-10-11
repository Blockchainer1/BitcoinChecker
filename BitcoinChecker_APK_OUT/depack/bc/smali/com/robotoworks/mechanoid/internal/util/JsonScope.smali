.class final enum Lcom/robotoworks/mechanoid/internal/util/JsonScope;
.super Ljava/lang/Enum;
.source "JsonScope.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/robotoworks/mechanoid/internal/util/JsonScope;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/robotoworks/mechanoid/internal/util/JsonScope;

.field public static final enum CLOSED:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

.field public static final enum DANGLING_NAME:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

.field public static final enum EMPTY_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

.field public static final enum EMPTY_DOCUMENT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

.field public static final enum EMPTY_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

.field public static final enum NONEMPTY_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

.field public static final enum NONEMPTY_DOCUMENT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

.field public static final enum NONEMPTY_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 32
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    const-string v1, "EMPTY_ARRAY"

    invoke-direct {v0, v1, v3}, Lcom/robotoworks/mechanoid/internal/util/JsonScope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->EMPTY_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    .line 38
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    const-string v1, "NONEMPTY_ARRAY"

    invoke-direct {v0, v1, v4}, Lcom/robotoworks/mechanoid/internal/util/JsonScope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->NONEMPTY_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    .line 44
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    const-string v1, "EMPTY_OBJECT"

    invoke-direct {v0, v1, v5}, Lcom/robotoworks/mechanoid/internal/util/JsonScope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->EMPTY_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    .line 50
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    const-string v1, "DANGLING_NAME"

    invoke-direct {v0, v1, v6}, Lcom/robotoworks/mechanoid/internal/util/JsonScope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->DANGLING_NAME:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    .line 56
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    const-string v1, "NONEMPTY_OBJECT"

    invoke-direct {v0, v1, v7}, Lcom/robotoworks/mechanoid/internal/util/JsonScope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->NONEMPTY_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    .line 61
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    const-string v1, "EMPTY_DOCUMENT"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/robotoworks/mechanoid/internal/util/JsonScope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->EMPTY_DOCUMENT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    .line 66
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    const-string v1, "NONEMPTY_DOCUMENT"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/robotoworks/mechanoid/internal/util/JsonScope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->NONEMPTY_DOCUMENT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    .line 71
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    const-string v1, "CLOSED"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/robotoworks/mechanoid/internal/util/JsonScope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->CLOSED:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    .line 26
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->EMPTY_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    aput-object v1, v0, v3

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->NONEMPTY_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    aput-object v1, v0, v4

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->EMPTY_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    aput-object v1, v0, v5

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->DANGLING_NAME:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    aput-object v1, v0, v6

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->NONEMPTY_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->EMPTY_DOCUMENT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->NONEMPTY_DOCUMENT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->CLOSED:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    aput-object v2, v0, v1

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->$VALUES:[Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 26
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/robotoworks/mechanoid/internal/util/JsonScope;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 26
    const-class v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    return-object v0
.end method

.method public static values()[Lcom/robotoworks/mechanoid/internal/util/JsonScope;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->$VALUES:[Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    invoke-virtual {v0}, [Lcom/robotoworks/mechanoid/internal/util/JsonScope;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    return-object v0
.end method
