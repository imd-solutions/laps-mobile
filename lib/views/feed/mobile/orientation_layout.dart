import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../enum/enum.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';

class FeedViewMobilePortrait extends BaseModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel data) {
    return data.state == ViewStateType.Busy
        ? FullBusyOverlay(
            show: data.state == ViewStateType.Busy,
            child: const Text(''),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Palette.primaryColour),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Text("Your Feed"),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ListView.builder(
                          itemCount: data.feed.length,
                          itemBuilder: (context, i) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (data.feed[i].type == "events") EventFeed(context, data.feed[i], data),
                              if (data.feed[i].type == "job") JobFeed(context, data.feed[i], data),
                              if (data.feed[i].type == "post") PostFeed(context, data.feed[i], data),
                              if (data.feed[i].type == "videos") VideoFeed(context, data.feed[i], data),
                              if (data.feed[i].type == "ad") AdFeed(context, data.feed[i]),
                              if (data.feed[i].type == "haveYouThoughtAbout") YourThoughtsFeed(context, data.feed[i], data),
                              if (data.feed[i].type == "community") CommunityFeed(context, data.feed[i], data),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
