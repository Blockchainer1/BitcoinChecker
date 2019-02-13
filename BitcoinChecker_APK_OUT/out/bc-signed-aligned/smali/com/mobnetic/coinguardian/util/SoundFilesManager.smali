.class public Lcom/mobnetic/coinguardian/util/SoundFilesManager;
.super Ljava/lang/Object;
.source "SoundFilesManager.java"


# static fields
.field public static final BITCOIN_CHECKER_DOWN_ALERT_FILENAME:Ljava/lang/String; = "bitcoin_checker_down_alert"

.field public static final BITCOIN_CHECKER_UP_CHEERS_FILENAME:Ljava/lang/String; = "bitcoin_checker_up_cheers"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static checkRingtoneUri(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "contentUri"    # Landroid/net/Uri;
    .param p2, "filePath"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/4 v8, 0x0

    .line 121
    const/4 v7, 0x0

    .line 122
    .local v7, "uri":Landroid/net/Uri;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v2, v8

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_data=\'"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "\'"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v1, p1

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 126
    .local v6, "cursor":Landroid/database/Cursor;
    if-eqz v6, :cond_1

    .line 127
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 128
    invoke-interface {v6, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    .line 129
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 131
    :cond_1
    return-object v7
.end method

.method private static copyRingtoneFromResources(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    .locals 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    const/4 v11, 0x0

    .line 53
    const/4 v3, 0x0

    .line 54
    .local v3, "fis":Ljava/io/InputStream;
    const/4 v4, 0x0

    .line 56
    .local v4, "fos":Ljava/io/OutputStream;
    :try_start_0
    invoke-static {}, Lcom/mobnetic/coinguardian/util/SoundFilesManager;->getRingtonesDir()Ljava/io/File;

    move-result-object v9

    .line 57
    .local v9, "path":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v12

    if-nez v12, :cond_0

    .line 58
    invoke-virtual {v9}, Ljava/io/File;->mkdirs()Z

    .line 60
    :cond_0
    invoke-static {v9, p1}, Lcom/mobnetic/coinguardian/util/SoundFilesManager;->getRingtonePath(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 61
    .local v2, "f":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_b
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v12

    if-eqz v12, :cond_3

    .line 83
    if-eqz v4, :cond_1

    .line 85
    :try_start_1
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 90
    :cond_1
    :goto_0
    if-eqz v3, :cond_2

    .line 92
    :try_start_2
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 98
    .end local v2    # "f":Ljava/io/File;
    .end local v9    # "path":Ljava/io/File;
    :cond_2
    :goto_1
    return-object v2

    .line 86
    .restart local v2    # "f":Ljava/io/File;
    .restart local v9    # "path":Ljava/io/File;
    :catch_0
    move-exception v1

    .line 87
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 93
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 94
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 64
    .end local v1    # "e":Ljava/io/IOException;
    :cond_3
    :try_start_3
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "android.resource://"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/raw/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    .line 65
    .local v8, "mUri":Landroid/net/Uri;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    .line 66
    .local v7, "mCr":Landroid/content/ContentResolver;
    const-string v12, "r"

    invoke-virtual {v7, v8, v12}, Landroid/content/ContentResolver;->openAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v10

    .line 67
    .local v10, "soundFile":Landroid/content/res/AssetFileDescriptor;
    invoke-virtual {v10}, Landroid/content/res/AssetFileDescriptor;->createInputStream()Ljava/io/FileInputStream;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_b
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v3

    .line 69
    if-nez v3, :cond_6

    .line 83
    if-eqz v4, :cond_4

    .line 85
    :try_start_4
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 90
    :cond_4
    :goto_2
    if-eqz v3, :cond_5

    .line 92
    :try_start_5
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    :cond_5
    :goto_3
    move-object v2, v11

    .line 70
    goto :goto_1

    .line 86
    :catch_2
    move-exception v1

    .line 87
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 93
    .end local v1    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v1

    .line 94
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    .line 73
    .end local v1    # "e":Ljava/io/IOException;
    :cond_6
    :try_start_6
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_b
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 74
    .end local v4    # "fos":Ljava/io/OutputStream;
    .local v5, "fos":Ljava/io/OutputStream;
    const/16 v12, 0x400

    :try_start_7
    new-array v0, v12, [B

    .line 76
    .local v0, "buf":[B
    :goto_4
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v6

    .local v6, "len":I
    if-lez v6, :cond_9

    .line 77
    const/4 v12, 0x0

    invoke-virtual {v5, v0, v12, v6}, Ljava/io/OutputStream;->write([BII)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_4

    .line 80
    .end local v0    # "buf":[B
    .end local v6    # "len":I
    :catch_4
    move-exception v1

    move-object v4, v5

    .line 81
    .end local v2    # "f":Ljava/io/File;
    .end local v5    # "fos":Ljava/io/OutputStream;
    .end local v7    # "mCr":Landroid/content/ContentResolver;
    .end local v8    # "mUri":Landroid/net/Uri;
    .end local v9    # "path":Ljava/io/File;
    .end local v10    # "soundFile":Landroid/content/res/AssetFileDescriptor;
    .local v1, "e":Ljava/lang/Exception;
    .restart local v4    # "fos":Ljava/io/OutputStream;
    :goto_5
    :try_start_8
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 83
    if-eqz v4, :cond_7

    .line 85
    :try_start_9
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_7

    .line 90
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_7
    :goto_6
    if-eqz v3, :cond_8

    .line 92
    :try_start_a
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_8

    :cond_8
    :goto_7
    move-object v2, v11

    .line 98
    goto :goto_1

    .line 83
    .end local v4    # "fos":Ljava/io/OutputStream;
    .restart local v0    # "buf":[B
    .restart local v2    # "f":Ljava/io/File;
    .restart local v5    # "fos":Ljava/io/OutputStream;
    .restart local v6    # "len":I
    .restart local v7    # "mCr":Landroid/content/ContentResolver;
    .restart local v8    # "mUri":Landroid/net/Uri;
    .restart local v9    # "path":Ljava/io/File;
    .restart local v10    # "soundFile":Landroid/content/res/AssetFileDescriptor;
    :cond_9
    if-eqz v5, :cond_a

    .line 85
    :try_start_b
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_5

    .line 90
    :cond_a
    :goto_8
    if-eqz v3, :cond_b

    .line 92
    :try_start_c
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_6

    :cond_b
    :goto_9
    move-object v4, v5

    .line 79
    .end local v5    # "fos":Ljava/io/OutputStream;
    .restart local v4    # "fos":Ljava/io/OutputStream;
    goto/16 :goto_1

    .line 86
    .end local v4    # "fos":Ljava/io/OutputStream;
    .restart local v5    # "fos":Ljava/io/OutputStream;
    :catch_5
    move-exception v1

    .line 87
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_8

    .line 93
    .end local v1    # "e":Ljava/io/IOException;
    :catch_6
    move-exception v1

    .line 94
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_9

    .line 86
    .end local v0    # "buf":[B
    .end local v2    # "f":Ljava/io/File;
    .end local v5    # "fos":Ljava/io/OutputStream;
    .end local v6    # "len":I
    .end local v7    # "mCr":Landroid/content/ContentResolver;
    .end local v8    # "mUri":Landroid/net/Uri;
    .end local v9    # "path":Ljava/io/File;
    .end local v10    # "soundFile":Landroid/content/res/AssetFileDescriptor;
    .local v1, "e":Ljava/lang/Exception;
    .restart local v4    # "fos":Ljava/io/OutputStream;
    :catch_7
    move-exception v1

    .line 87
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_6

    .line 93
    .end local v1    # "e":Ljava/io/IOException;
    :catch_8
    move-exception v1

    .line 94
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_7

    .line 83
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v11

    :goto_a
    if-eqz v4, :cond_c

    .line 85
    :try_start_d
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_9

    .line 90
    :cond_c
    :goto_b
    if-eqz v3, :cond_d

    .line 92
    :try_start_e
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_a

    .line 95
    :cond_d
    :goto_c
    throw v11

    .line 86
    :catch_9
    move-exception v1

    .line 87
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_b

    .line 93
    .end local v1    # "e":Ljava/io/IOException;
    :catch_a
    move-exception v1

    .line 94
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_c

    .line 83
    .end local v1    # "e":Ljava/io/IOException;
    .end local v4    # "fos":Ljava/io/OutputStream;
    .restart local v2    # "f":Ljava/io/File;
    .restart local v5    # "fos":Ljava/io/OutputStream;
    .restart local v7    # "mCr":Landroid/content/ContentResolver;
    .restart local v8    # "mUri":Landroid/net/Uri;
    .restart local v9    # "path":Ljava/io/File;
    .restart local v10    # "soundFile":Landroid/content/res/AssetFileDescriptor;
    :catchall_1
    move-exception v11

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/OutputStream;
    .restart local v4    # "fos":Ljava/io/OutputStream;
    goto :goto_a

    .line 80
    .end local v2    # "f":Ljava/io/File;
    .end local v7    # "mCr":Landroid/content/ContentResolver;
    .end local v8    # "mUri":Landroid/net/Uri;
    .end local v9    # "path":Ljava/io/File;
    .end local v10    # "soundFile":Landroid/content/res/AssetFileDescriptor;
    :catch_b
    move-exception v1

    goto :goto_5
.end method

.method private static createRingtoneDatabaseEntry(Ljava/io/File;Ljava/lang/String;)Landroid/content/ContentValues;
    .locals 5
    .param p0, "f"    # Ljava/io/File;
    .param p1, "ringtoneTitle"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 102
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 103
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "_data"

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    const-string v1, "title"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    const-string v1, "_size"

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 106
    const-string v1, "mime_type"

    const-string v2, "audio/mp3"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    const-string v1, "is_ringtone"

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 108
    const-string v1, "is_notification"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 109
    const-string v1, "is_alarm"

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 110
    const-string v1, "is_music"

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 111
    return-object v0
.end method

.method private static getRingtonePath(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .locals 3
    .param p0, "ringtonesDir"    # Ljava/io/File;
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 49
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".mp3"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private static getRingtonesDir()Ljava/io/File;
    .locals 3

    .prologue
    .line 45
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/media/audio/notifications"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static getUriForRingtone(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 115
    invoke-static {}, Lcom/mobnetic/coinguardian/util/SoundFilesManager;->getRingtonesDir()Ljava/io/File;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/mobnetic/coinguardian/util/SoundFilesManager;->getRingtonePath(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v1

    .line 116
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/provider/MediaStore$Audio$Media;->getContentUriForPath(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 117
    .local v0, "contentUri":Landroid/net/Uri;
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v0, v2}, Lcom/mobnetic/coinguardian/util/SoundFilesManager;->checkRingtoneUri(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    return-object v2
.end method

.method private static installRingtoneFileIfNeeded(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "ringtoneTitle"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-static {p0, p1}, Lcom/mobnetic/coinguardian/util/SoundFilesManager;->copyRingtoneFromResources(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 30
    .local v2, "file":Ljava/io/File;
    if-eqz v2, :cond_0

    .line 31
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/provider/MediaStore$Audio$Media;->getContentUriForPath(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 32
    .local v0, "contentUri":Landroid/net/Uri;
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v0, v4}, Lcom/mobnetic/coinguardian/util/SoundFilesManager;->checkRingtoneUri(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    if-nez v4, :cond_0

    .line 34
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .line 35
    .local v3, "mediaStoreContentProvider":Landroid/content/ContentResolver;
    invoke-static {v2, p2}, Lcom/mobnetic/coinguardian/util/SoundFilesManager;->createRingtoneDatabaseEntry(Ljava/io/File;Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .end local v0    # "contentUri":Landroid/net/Uri;
    .end local v3    # "mediaStoreContentProvider":Landroid/content/ContentResolver;
    :cond_0
    :goto_0
    return-void

    .line 36
    .restart local v0    # "contentUri":Landroid/net/Uri;
    :catch_0
    move-exception v1

    .line 37
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static installRingtonesIfNeeded(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    const-string v0, "bitcoin_checker_up_cheers"

    const-string v1, "Bitcoin Checker Up Cheers"

    invoke-static {p0, v0, v1}, Lcom/mobnetic/coinguardian/util/SoundFilesManager;->installRingtoneFileIfNeeded(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    const-string v0, "bitcoin_checker_down_alert"

    const-string v1, "Bitcoin Checker Down Alert"

    invoke-static {p0, v0, v1}, Lcom/mobnetic/coinguardian/util/SoundFilesManager;->installRingtoneFileIfNeeded(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    return-void
.end method
