#!/system/bin/sh
sqlite3 /data/data/com.android.providers.settings/databases/settings.db 'insert into secure(name,value) values("developer_options",1)'
