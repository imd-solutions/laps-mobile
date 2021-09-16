import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';
import './../../../config/config.dart';
import './../../../enum/enum.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';

class EventViewMobilePortrait extends BaseModelWidget<EventViewModel> {
  @override
  Widget build(BuildContext context, EventViewModel data) {
    var unescape = HtmlUnescape();

    _getPostImage() {
      if (data.post.acf.listImage.url == null) {
        return SizedBox(
          height: 10,
        );
      } else {
        return Image.network(data.post.acf.listImage.url);
      }
    }

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
            body: Container(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: ListView(
                  children: <Widget>[
                    Text(
                      unescape.convert(data.post.title.rendered),
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    _getPostImage(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("Date and Time"),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text("${data.post.acf.startTime} - ${data.post.acf.endTime}"),
                    SizedBox(
                      height: 10.0,
                    ),
                    Html(
                      data: data.post.acf.address,
                    ),
                    Html(
                      data: data.post.content.rendered,
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
