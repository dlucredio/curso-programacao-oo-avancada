package com.example.interfacesegregation1;

import android.content.Context;

import java.util.List;
import java.util.UUID;

public class TheSimpsonsQuotesDataSet implements ITheSimpsonsQuotesDataSet {
    final Context context;
    private List<TheSimpsonsQuote> theSimpsonsQuoteList;

    public TheSimpsonsQuotesDataSet(Context context) {
        this.context = context;
        updateList();
    }

    @Override
    public void addTheSimpsonsQuote(TheSimpsonsQuote sq) {
        sq.uid = UUID.randomUUID().toString();
        TheSimpsonsQuotesDatabase.getInstance(context).theSimpsonsQuotesDAO().insert(sq);
        updateList();
    }

    @Override
    public void removeTheSimpsonsQuote(int position) {
        TheSimpsonsQuote tsq = theSimpsonsQuoteList.get(position);
        TheSimpsonsQuotesDatabase.getInstance(context).theSimpsonsQuotesDAO().delete(tsq);
        updateList();
    }

    @Override
    public TheSimpsonsQuote getTheSimpsonsQuote(int position) {
        return theSimpsonsQuoteList.get(position);
    }

    @Override
    public int getTheSimpsonsQuotesListSize() {
        return theSimpsonsQuoteList.size();
    }

    private void updateList() {
        theSimpsonsQuoteList = TheSimpsonsQuotesDatabase.getInstance(context).theSimpsonsQuotesDAO().getAll();
    }
}
