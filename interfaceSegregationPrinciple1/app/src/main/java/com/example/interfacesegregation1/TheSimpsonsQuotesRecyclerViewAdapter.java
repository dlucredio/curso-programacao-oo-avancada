package com.example.interfacesegregation1;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;

public class TheSimpsonsQuotesRecyclerViewAdapter extends RecyclerView.Adapter<TheSimpsonsQuotesRecyclerViewAdapter.MyViewHolder> {
    //private final MainActivity mainActivity;
    private final ITheSimpsonsQuotesDataSet theSimpsonsQuoteDataSet;
    private final Context context;

    public static class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView textViewQuote, textViewCharacterLeft, textViewCharacterRight;
        public ImageView imageViewLeft, imageViewRight;
        public ImageButton imageButtonDelete;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            textViewQuote = itemView.findViewById(R.id.textViewQuote);
            textViewCharacterLeft = itemView.findViewById(R.id.textViewCharacterLeft);
            textViewCharacterRight = itemView.findViewById(R.id.textViewCharacterRight);
            imageViewLeft = itemView.findViewById(R.id.imageViewLeft);
            imageViewRight = itemView.findViewById(R.id.imageViewRight);
            imageButtonDelete = itemView.findViewById(R.id.imageButtonDelete);
        }
    }

//    public TheSimpsonsQuotesRecyclerViewAdapter(MainActivity mainActivity) {
//        this.mainActivity = mainActivity;
//    }
    public TheSimpsonsQuotesRecyclerViewAdapter(ITheSimpsonsQuotesDataSet theSimpsonsQuoteDataSet, Context context) {
        this.theSimpsonsQuoteDataSet = theSimpsonsQuoteDataSet;
        this.context = context;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new MyViewHolder(LayoutInflater.from(parent.getContext())
                .inflate(R.layout.simpson_quote, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        TheSimpsonsQuote tsq = theSimpsonsQuoteDataSet.getTheSimpsonsQuote(position);
        holder.textViewQuote.setText(tsq.quote);
        holder.imageButtonDelete.setOnClickListener(view -> {
            // mainActivity.removeTheSimpsonsQuote(position);
            theSimpsonsQuoteDataSet.removeTheSimpsonsQuote(position);
            notifyDataSetChanged();
            // Não deveria ser possível fazer isso!
            // mainActivity.findViewById(R.id.imageButtonAddQuote).setVisibility(View.GONE);
        });
        if (tsq.characterDirection.equals("Left")) {
            holder.imageViewRight.setVisibility(View.GONE);
            holder.textViewCharacterRight.setVisibility(View.GONE);
            holder.imageViewLeft.setVisibility(View.VISIBLE);
            holder.textViewCharacterLeft.setVisibility(View.VISIBLE);
            Glide.with(context).load(tsq.image).into(holder.imageViewLeft);
            holder.textViewCharacterLeft.setText(tsq.character);
        } else {
            holder.imageViewLeft.setVisibility(View.GONE);
            holder.textViewCharacterLeft.setVisibility(View.GONE);
            holder.imageViewRight.setVisibility(View.VISIBLE);
            holder.textViewCharacterRight.setVisibility(View.VISIBLE);
            Glide.with(context).load(tsq.image).into(holder.imageViewRight);
            holder.textViewCharacterRight.setText(tsq.character);
        }
    }

    @Override
    public int getItemCount() {
        //return mainActivity.getTheSimpsonsQuotesListSize();
        return theSimpsonsQuoteDataSet.getTheSimpsonsQuotesListSize();
    }
}
