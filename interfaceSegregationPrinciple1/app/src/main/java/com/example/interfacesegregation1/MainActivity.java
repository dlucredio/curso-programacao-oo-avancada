package com.example.interfacesegregation1;

import android.os.Bundle;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity { //implements ITheSimpsonsQuotesDataSet {
//    List<TheSimpsonsQuote> theSimpsonsQuotesList;
//
//    public void addTheSimpsonsQuote(TheSimpsonsQuote sq) {
//        theSimpsonsQuotesList.add(sq);
//    }
//    public void removeTheSimpsonsQuote(int position) {
//        theSimpsonsQuotesList.remove(position);
//    }
//    public TheSimpsonsQuote getTheSimpsonsQuote(int position) { return theSimpsonsQuotesList.get(position); }
//    public int getTheSimpsonsQuotesListSize() { return theSimpsonsQuotesList.size(); }
    ITheSimpsonsQuotesDataSet theSimpsonsQuotesDataSet;

    RecyclerView recyclerView;
    TheSimpsonsQuotesRecyclerViewAdapter mAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

//        theSimpsonsQuotesList = new ArrayList<>();
        theSimpsonsQuotesDataSet = new TheSimpsonsQuotesDataSet(this);
        recyclerView = findViewById(R.id.recyclerViewSimpsonQuotes);
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(layoutManager);

        mAdapter = new TheSimpsonsQuotesRecyclerViewAdapter(theSimpsonsQuotesDataSet, this);
        recyclerView.setAdapter(mAdapter);
    }

    public void onAddClicked(View button) {
        RequestQueue queue = Volley.newRequestQueue(this);
        String url ="https://thesimpsonsquoteapi.glitch.me/quotes";

        JsonArrayRequest jsonArrayRequest = new JsonArrayRequest
                (Request.Method.GET, url, null, responseArray -> {
                    try {
                        JSONObject response = responseArray.getJSONObject(0);
                        TheSimpsonsQuote tsq = new TheSimpsonsQuote();
                        tsq.quote = response.getString("quote");
                        tsq.character = response.getString("character");
                        tsq.characterDirection = response.getString("characterDirection");
                        tsq.image = response.getString("image");
                        //addTheSimpsonsQuote(tsq);
                        theSimpsonsQuotesDataSet.addTheSimpsonsQuote(tsq);
                        mAdapter.notifyDataSetChanged();
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }, Throwable::printStackTrace);

        queue.add(jsonArrayRequest);
    }
//
//    public void onDeleteClicked(int position) {
//        removeTheSimpsonsQuote(position);
//        mAdapter.notifyDataSetChanged();
//    }
}