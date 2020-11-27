package com.example.interfacesegregation1;

import androidx.annotation.NonNull;
import androidx.room.Entity;
import androidx.room.PrimaryKey;

@Entity
public class TheSimpsonsQuote {
    // https://thesimpsonsquoteapi.glitch.me/quotes

    @PrimaryKey @NonNull
    public String uid;

    public String quote;
    public String character;
    public String image;
    public String characterDirection;
}
