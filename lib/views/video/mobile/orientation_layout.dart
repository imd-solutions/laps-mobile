import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:intl/intl.dart';
import './../../../config/config.dart';
import './../../../enum/enum.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';

class VideoViewMobilePortrait extends BaseModelWidget<VideoViewModel> {
  final DateFormat WpDate = DateFormat('EEEE dd MMM yyyy');
  final DateFormat WpTime = DateFormat('jm');

  @override
  Widget build(BuildContext context, VideoViewModel data) {
    var unescape = HtmlUnescape();

    _getImageLink() {
      if (data.postImg == null) {
        return SizedBox(
          height: 10,
        );
      } else {
        return Image.network(data.postImg);
      }
    }

    return data.state == ViewStateType.Busy
        ? FullBusyOverlay(
            show: data.state == ViewStateType.Busy,
            child: const Text(''),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                unescape.convert(data.post.title.rendered),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Palette.primaryColour),
            ),
            body: Container(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    _getImageLink(),
                    Html(
                      data: data.post.acf.overview,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(WpDate.format(data.post.date)),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          child: Text(
                            'View Interview',
                            key: const ValueKey("viewInterviewBtn"),
                            style: TextStyle(
                              color: Palette.blackColour,
                              fontFamily: Font.secondaryFont,
                              fontSize: 13.5,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Palette.primaryColour,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(0.0),
                            ),
                          ),
                          onPressed: () {
                            navigateToUrl(data.post.acf.embedLink!);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
