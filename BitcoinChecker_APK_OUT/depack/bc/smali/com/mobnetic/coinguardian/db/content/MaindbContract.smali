.class public Lcom/mobnetic/coinguardian/db/content/MaindbContract;
.super Ljava/lang/Object;
.source "MaindbContract.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;,
        Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm;,
        Lcom/mobnetic/coinguardian/db/content/MaindbContract$CheckerColumns;,
        Lcom/mobnetic/coinguardian/db/content/MaindbContract$AlarmColumns;
    }
.end annotation


# static fields
.field private static final BASE_CONTENT_URI:Landroid/net/Uri;

.field public static final CONTENT_AUTHORITY:Ljava/lang/String;

.field static REFERENCING_VIEWS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Landroid/net/Uri;",
            "Ljava/util/Set",
            "<",
            "Landroid/net/Uri;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 18
    invoke-static {}, Lcom/mobnetic/coinguardian/db/content/MaindbContract;->initAuthority()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/mobnetic/coinguardian/db/content/MaindbContract;->CONTENT_AUTHORITY:Ljava/lang/String;

    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "content://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/mobnetic/coinguardian/db/content/MaindbContract;->CONTENT_AUTHORITY:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    sput-object v1, Lcom/mobnetic/coinguardian/db/content/MaindbContract;->BASE_CONTENT_URI:Landroid/net/Uri;

    .line 315
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 317
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Landroid/net/Uri;Ljava/util/Set<Landroid/net/Uri;>;>;"
    sget-object v1, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm;->VIEW_URIS:Ljava/util/Set;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    sget-object v1, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->VIEW_URIS:Ljava/util/Set;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    sput-object v1, Lcom/mobnetic/coinguardian/db/content/MaindbContract;->REFERENCING_VIEWS:Ljava/util/Map;

    .line 322
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 324
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 17
    sget-object v0, Lcom/mobnetic/coinguardian/db/content/MaindbContract;->BASE_CONTENT_URI:Landroid/net/Uri;

    return-object v0
.end method

.method public static deleteAll()V
    .locals 0

    .prologue
    .line 330
    invoke-static {}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm;->delete()I

    .line 331
    invoke-static {}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->delete()I

    .line 332
    return-void
.end method

.method private static initAuthority()Ljava/lang/String;
    .locals 5

    .prologue
    .line 21
    const-string v0, "com.mobnetic.coinguardian.db.content.maindb"

    .line 25
    .local v0, "authority":Ljava/lang/String;
    :try_start_0
    const-class v4, Lcom/mobnetic/coinguardian/db/content/MaindbContract;

    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    .line 27
    .local v3, "loader":Ljava/lang/ClassLoader;
    const-string v4, "com.mobnetic.coinguardian.db.content.MaindbContentProviderAuthority"

    invoke-virtual {v3, v4}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 28
    .local v1, "clz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "CONTENT_AUTHORITY"

    invoke-virtual {v1, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 30
    .local v2, "declaredField":Ljava/lang/reflect/Field;
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 37
    .end local v1    # "clz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "declaredField":Ljava/lang/reflect/Field;
    .end local v3    # "loader":Ljava/lang/ClassLoader;
    :goto_0
    return-object v0

    .line 34
    :catch_0
    move-exception v4

    goto :goto_0

    .line 33
    :catch_1
    move-exception v4

    goto :goto_0

    .line 32
    :catch_2
    move-exception v4

    goto :goto_0

    .line 31
    :catch_3
    move-exception v4

    goto :goto_0
.end method
