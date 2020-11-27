package com.example.interfacesegregation1;

import android.content.Context;

import androidx.room.Database;
import androidx.room.Room;
import androidx.room.RoomDatabase;

@Database(entities = {TheSimpsonsQuote.class}, version = 1)
public abstract class TheSimpsonsQuotesDatabase extends RoomDatabase {
    private static final String DB_NAME = "theSimpsonsQuotesDatabase.db";
    private static volatile TheSimpsonsQuotesDatabase instance;

    static synchronized TheSimpsonsQuotesDatabase getInstance(Context context) {
        if (instance == null) {
            instance = create(context);
        }
        return instance;
    }

    private static TheSimpsonsQuotesDatabase create(final Context context) {
        return Room.databaseBuilder(
                context,
                TheSimpsonsQuotesDatabase.class,
                DB_NAME).allowMainThreadQueries().build();
    }

    public abstract TheSimpsonsQuotesDAO theSimpsonsQuotesDAO();
}
