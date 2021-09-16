import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:laps/models/community_model.dart';
import './../../../config/config.dart';
import './../../../enum/enum.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';

class ForumViewMobilePortrait extends BaseModelWidget<CommunityViewModel> {
  @override
  Widget build(BuildContext context, CommunityViewModel data) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _controller = new TextEditingController();
    return data.state == ViewStateType.Busy
        ? FullBusyOverlay(
            show: data.state == ViewStateType.Busy,
            child: const Text(''),
          )
        : SingleChildScrollView(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Palette.primaryColour,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 40.0),
                      child: Html(data: data.community.title),
                    ),
                  ),
                ),
                FormWidget(data.community, data),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.community.replies!.length,
                  itemBuilder: (context, i) =>
                      FormWidget(data.community.replies![i], data),
                ),
                ElevatedButton(
                  child: Text(
                    'Reply',
                    key: const ValueKey("replyThreadBtn"),
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
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      enableDrag: true,
                      isDismissible: true,
                      useRootNavigator: true,
                      context: context,
                      builder: (context) {
                        CommunityViewModel communityData =
                            locator<CommunityViewModel>();

                        void processReply() {
                          print("Process this");
                          communityData.initialise(data.community.id);
                          Navigator.pop(context);
                        }

                        return SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(height: 25),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          "Reply",
                                          style: TextStyle(fontSize: 30.0),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, right: 15.0),
                                        child: TextField(
                                          controller: _controller,
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
                                            hintText: "Reply Content",
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            ElevatedButton(
                                              child: data.state ==
                                                      ViewStateType.Processing
                                                  ? SizedBox(
                                                      height: 15.0,
                                                      width: 15.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        key: const ValueKey(
                                                            "siteProgressIndicator"),
                                                        strokeWidth: 2.0,
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          Palette.whiteColour,
                                                        ),
                                                      ),
                                                    )
                                                  : Text(
                                                      'Submit',
                                                      key: const ValueKey(
                                                          "communitySubmitBtn"),
                                                      style: TextStyle(
                                                        color: Palette
                                                            .accentSecondColour,
                                                        fontFamily:
                                                            Font.secondaryFont,
                                                        fontSize: 13.5,
                                                      ),
                                                    ),
                                              style: ElevatedButton.styleFrom(
                                                primary: Palette.primaryColour,
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          0.0),
                                                ),
                                              ),
                                              onPressed: () {
                                                communityData
                                                    .replyToThread(
                                                        data.community.id,
                                                        _controller.text)
                                                    .then((info) =>
                                                        processReply());
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 50.0),
                Text(
                    "Follow this thread to be notified by email of any replies."),
                SizedBox(height: 5.0),
                ElevatedButton(
                  child: Text(
                    'Follow',
                    key: const ValueKey("followThreadBtn"),
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
                    CommunityViewModel communityData =
                        locator<CommunityViewModel>();
                    communityData.followThread(data.community.id);
                  },
                ),
                SizedBox(height: 10.0),
              ],
            ),
          );
  }
}

FormWidget(data, CommunityViewModel dataVM) {
  return dataVM.state == ViewStateType.Busy
      ? Text("LOADING")
      : Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Palette.greyColour),
                    left: BorderSide(color: Palette.greyColour),
                    right: BorderSide(color: Palette.greyColour),
                  ),
                  color: Palette.lightGreyColour,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    children: [
                      data.image != null
                          ? Container(
                              width: 65.0,
                              height: 65.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(data.image!),
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 65.0,
                              width: 65.0, // fixed width and height
                              child:
                                  Image.asset('assets/images/user/no-user.png'),
                            ),
                      Text(data.name!),
                      Text("Member Since"),
                      Text("June 2021"),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Palette.greyColour),
                    right: BorderSide(color: Palette.greyColour),
                    bottom: BorderSide(color: Palette.greyColour),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Html(data: data.content!),
                ),
              ),
            ),
            Container(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Palette.greyColour),
                    right: BorderSide(color: Palette.greyColour),
                    bottom: BorderSide(color: Palette.greyColour),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    children: [
                      Text(data.date!),
                      SizedBox(width: 5.0),
                      GestureDetector(
                          onTap: () => dataVM.likeThread(data.id),
                          child: dataVM.likeBtn == true
                              ? Icon(
                                  Icons.thumb_up,
                                  size: 20.0,
                                  color: Palette.primaryColour,
                                )
                              : Icon(
                                  Icons.thumb_up_alt_outlined,
                                  size: 20.0,
                                )),
                      SizedBox(width: 5.0),
                      if (data.likes! > 0) Text(data.likes.toString()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
}
