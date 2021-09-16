import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

// Navigate to url function.
void navigateToUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

// Navigate to the page.
updateNavigationIndex(int index, data, String section) {
  data.updateSection(section);
  data.updateBottomNavIndex(index);
}

// Navigate to the page and pop off.
updateNavigationIndexPop(int index, context, data, String section) {
  Navigator.pop(context);
  data.updateSection(section);
  data.updateBottomNavIndex(index);
}

//Youtube ID converter
convertYouTubeID(String youtubeLink) {
  try {
    String? videoID = YoutubePlayer.convertUrlToId(youtubeLink);
    return videoID;
  } on Exception catch (exception) {
    print(exception);
  } catch (error) {
    print(error);
  }
}

//Youtube ID converter
getYouTubeID(String youtubeLink) {
  try {
    final original = youtubeLink;
    final find = "https://youtu.be/";
    final replaceWith = "";
    String? videoID = original.replaceAll(find, replaceWith);
    ;
    return videoID;
  } on Exception catch (exception) {
    print(exception);
  } catch (error) {
    print(error);
  }
}
