// load credentials, etc

import 'package:english_words/english_words.dart';
import 'events.dart';

// We now have a function just to deal with subscriptions
// for word pair selection/removal related to social media
void subscribeToEvents(DomainEvents<WordPair> wordPairSelected,
    DomainEvents<WordPair> wordPairRemoved) {
  // Maybe we could load the following setup from
  // a config file? Or the database? Ou user preferences?
  var socialMedia = {"Facebook"};

  if (socialMedia.contains("Facebook")) {
    wordPairSelected.register((pair) => shareFacebook(
        "OMG, $pair just became one one of my favorite word pairs!"));
    wordPairRemoved.register((pair) => shareFacebook(
        "Hello everyone, $pair is no longer one of my favorite word pairs!"));
  }

  if (socialMedia.contains("Whatsapp")) {
    wordPairSelected
        .register((pair) => shareWhatsapp("Hey, how cool is $pair?"));
    wordPairRemoved.register((pair) => shareWhatsapp(
        "Hey, $pair is no longer one of my favorite word pairs!"));
  }

  if (socialMedia.contains("Twitter")) {
    wordPairSelected.register((pair) =>
        shareTwitter("Just saying... $pair is one of my favorite word pairs!"));

    wordPairRemoved.register((pair) => shareTwitter(
        "Just saying... $pair is no longer one of my favorite word pairs!"));
  }
}

void shareTwitter(String story) {
  print("Hey, I just tweeted this: $story");
}

void shareFacebook(String story) {
  print("Hey, I just facebooked this: $story");
}

void shareWhatsapp(String story) {
  print("Hey, I just whatsapped this: $story");
}
