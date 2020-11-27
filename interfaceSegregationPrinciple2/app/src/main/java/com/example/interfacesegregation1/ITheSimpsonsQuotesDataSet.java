package com.example.interfacesegregation1;

public interface ITheSimpsonsQuotesDataSet {
    void addTheSimpsonsQuote(TheSimpsonsQuote sq);
    void removeTheSimpsonsQuote(int position);
    TheSimpsonsQuote getTheSimpsonsQuote(int position);
    int getTheSimpsonsQuotesListSize();
}
