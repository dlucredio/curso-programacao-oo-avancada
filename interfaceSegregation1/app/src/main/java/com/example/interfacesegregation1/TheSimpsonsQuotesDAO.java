package com.example.interfacesegregation1;

import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Insert;
import androidx.room.Query;

import java.util.List;

@Dao
public interface TheSimpsonsQuotesDAO {
    @Query("SELECT * FROM TheSimpsonsQuote")
    List<TheSimpsonsQuote> getAll();

    @Insert
    void insert(TheSimpsonsQuote quote);

    @Delete
    void delete(TheSimpsonsQuote quote);
}
