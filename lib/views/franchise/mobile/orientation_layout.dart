import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import './../../../config/config.dart';
import './../../../enum/enum.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';

class FranchiseViewMobilePortrait extends BaseModelWidget<FranchiseViewModel> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context, FranchiseViewModel data) {
    var unescape = HtmlUnescape();

    _getPostImage() {
      if (data.post.acf.logo.url == null) {
        return SizedBox(
          height: 10,
        );
      } else {
        return Image.network(data.post.acf.logo.url);
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
                      data: data.post.acf.content,
                    ),
                    if (data.post.acf.bottomYoutubeLink != '')
                      YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: convertYouTubeID(data.post.acf.bottomYoutubeLink), //Add videoID.
                          flags: YoutubePlayerFlags(
                            hideControls: false,
                            controlsVisibleAtStart: true,
                            autoPlay: false,
                            mute: false,
                          ),
                        ),
                        showVideoProgressIndicator: false,
                        // progressIndicatorColor: Palette.primaryColour,
                      ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      margin: EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                        boxShadow: [BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.2), offset: Offset(0, 10), blurRadius: 20)],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 20.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text("Request Information"),
                          ),
                          SizedBox(height: 10.0),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        width: 300.0,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 3.0),
                                          child: InputText(
                                            borderRadius: 2.5,
                                            initialValue: data.telephone,
                                            icon: Icons.phone,
                                            hintText: 'Telephone number',
                                            validator: (String? value) {
                                              // if (value.isEmpty) {
                                              //   return 'Enter firstname.';
                                              // }
                                              // return null;
                                            },
                                            onChanged: (String value) {
                                              data.updateTelephoneNumber(value);
                                            },
                                            onSaved: (String? value) {
                                              // profile.firstname = value;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (data.employment.length > 0)
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 5.0),
                                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 15.0),
                                          child: GestureDetector(
                                            onTap: () => print("TEST"),
                                            child: Dropdown(
                                              padding: true,
                                              selectedTitle: 'Employment Status',
                                              selected: data.employmentDropdown,
                                              data: data.employment,
                                              updateSelected: (val) {
                                                data.updateEmploymentNumber(val);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    if (data.startup.length > 0)
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 5.0),
                                          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                          child: GestureDetector(
                                            onTap: () => print("TEST"),
                                            child: Dropdown(
                                              padding: true,
                                              selectedTitle: 'Startup Timeframe',
                                              selected: data.startupDropdown,
                                              data: data.startup,
                                              updateSelected: (val) {
                                                data.updateStartupNumber(val);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (data.funding.length > 0)
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 5.0),
                                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 15.0),
                                          child: GestureDetector(
                                            onTap: () => print("TEST"),
                                            child: Dropdown(
                                              padding: true,
                                              selectedTitle: 'Available Funding',
                                              selected: data.fundingDropdown,
                                              data: data.funding,
                                              updateSelected: (val) {
                                                data.updateFundingNumber(val);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                                  child: TextField(
                                    controller: _controller,
                                    onChanged: (text) => data.updateCommentsQuestions(text),
                                    autofocus: true,
                                    cursorColor: Palette.primaryColour,
                                    style: TextStyle(height: 1.0),
                                    cursorWidth: 2.0,
                                    maxLines: 5,
                                    minLines: 3,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      filled: true,
                                      fillColor: Palette.greyColour,
                                      hintText: "Comments or Questions",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    height: 80.0,
                                    width: double.infinity,
                                    padding: EdgeInsets.all(15.0),
                                    child: ElevatedButton(
                                      child: data.state == ViewStateType.Processing
                                          ? SizedBox(
                                              height: 15.0,
                                              width: 15.0,
                                              child: CircularProgressIndicator(
                                                key: const ValueKey("siteProgressIndicator"),
                                                strokeWidth: 2.0,
                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                  Palette.whiteColour,
                                                ),
                                              ),
                                            )
                                          : Text(
                                              'Submit Request',
                                              key: const ValueKey("viewPostBtn"),
                                              style: TextStyle(
                                                color: Palette.primaryColour,
                                                fontFamily: Font.secondaryFont,
                                                fontSize: 13.5,
                                              ),
                                            ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Palette.accentSecondColour,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(0.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        int postId = data.post.id;
                                        data.postDataToContactForm(postId).then((result) {
                                          var resp = result as Map;

                                          if (resp["status"] == 'mail_sent') {
                                            Flushbar(
                                              title: "Success",
                                              message: resp['message'],
                                              backgroundColor: Palette.successColour,
                                              duration: Duration(seconds: resp['status'] != 'mail_sent' ? 7 : 3),
                                            )..show(context);
                                          } else {
                                            Flushbar(
                                              title: "Error",
                                              message: "Something has gone wrong. Please try again",
                                              backgroundColor: Palette.successColour,
                                              duration: Duration(seconds: resp['status'] != 'mail_sent' ? 7 : 3),
                                            )..show(context);
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
