import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';
import './../../../config/config.dart';
import './../../../enum/enum.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';

class PostViewMobilePortrait extends BaseModelWidget<PostViewModel> {
  @override
  Widget build(BuildContext context, PostViewModel data) {
    var unescape = HtmlUnescape();

    _getPostImage() {
      if (data.post.acf?.bannerImage.url == null) {
        return SizedBox(
          height: 10,
        );
      } else {
        return Image.network(data.post.acf!.bannerImage.url);
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
