import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';
import './../../../config/config.dart';
import './../../../enum/enum.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';

class RoleViewMobilePortrait extends BaseModelWidget<RoleViewModel> {
  @override
  Widget build(BuildContext context, RoleViewModel data) {
    var unescape = HtmlUnescape();

    return data.state == ViewStateType.Busy
        ? FullBusyOverlay(
            show: data.state == ViewStateType.Busy,
            child: const Text(''),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                unescape.convert(data.post[0].title.rendered),
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
                    // General Overview
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'General Overview:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: Font.primaryFont,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        data.showMoreGeneral == true
                            ? Container(
                                height: 50.0,
                                child: Html(
                                  data: data.post[0].acf.generalOverview,
                                ),
                              )
                            : Html(data: data.post[0].acf.generalOverview),
                        SizedBox(
                          height: 5.0,
                        ),
                        GestureDetector(
                          onTap: () => data.updateGeneral(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              data.generalString,
                              style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.bold,
                                color: Palette.primaryColour,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                    //  Suitability
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Suitability:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: Font.primaryFont,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        data.showMoreSuitability == true
                            ? Container(
                                height: 50.0,
                                child: Html(
                                  data: data.post[0].acf.suitability,
                                ),
                              )
                            : Html(data: data.post[0].acf.suitability),
                        SizedBox(
                          height: 5.0,
                        ),
                        GestureDetector(
                          onTap: () => data.updateSuitability(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              data.suitabilityString,
                              style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.bold,
                                color: Palette.primaryColour,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                    // Qualifications Needed
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Qualifications Needed:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: Font.primaryFont,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        data.showMoreQualification == true
                            ? Container(
                                height: 50.0,
                                child: Html(
                                  data: data.post[0].acf.qualificationsNeeded,
                                ),
                              )
                            : Html(data: data.post[0].acf.qualificationsNeeded),
                        SizedBox(
                          height: 5.0,
                        ),
                        GestureDetector(
                          onTap: () => data.updateQualification(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              data.qualificationString,
                              style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.bold,
                                color: Palette.primaryColour,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                    // Pay Range
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Pay Range:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: Font.primaryFont,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        data.showMorePayRange == true
                            ? Container(
                                height: 50.0,
                                child: Html(
                                  data: data.post[0].acf.payRange,
                                ),
                              )
                            : Html(data: data.post[0].acf.payRange),
                        SizedBox(
                          height: 5.0,
                        ),
                        GestureDetector(
                          onTap: () => data.updatePayRange(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              data.payRangeString,
                              style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.bold,
                                color: Palette.primaryColour,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                    if (data.post[0].acf.tips.length > 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Top Tips:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: Font.primaryFont,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.post[0].acf.tips.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.post[0].acf.tips[i].tip,
                                      style: TextStyle(color: Palette.accentColour),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    // Support Links
                    if (data.post[0].acf.supportLinks.length > 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Support Links:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: Font.primaryFont,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.post[0].acf.supportLinks.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () => _navigateToUrl(data.post[0].acf.supportLinks[i].link),
                                      child: Text(
                                        data.post[0].acf.supportLinks[i].description,
                                        style: TextStyle(color: Palette.primaryColour),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    // Course Links
                    if (data.post[0].acf.courseLinks.length > 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Course Links:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: Font.primaryFont,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.post[0].acf.courseLinks.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () => _navigateToUrl(data.post[0].acf.courseLinks[i].link),
                                      child: Text(
                                        data.post[0].acf.courseLinks[i].description,
                                        style: TextStyle(color: Palette.primaryColour),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    // Similar Roles
                    if (data.post[0].acf.similarRoles.length > 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Similar Roles:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: Font.primaryFont,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.post[0].acf.similarRoles.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () => _navigateToRole(context, data.post[0].acf.similarRoles[i].postName),
                                      child: Text(
                                        data.post[0].acf.similarRoles[i].postTitle,
                                        style: TextStyle(color: Palette.primaryColour),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ),
          );
  }
}

void _navigateToUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _navigateToRole(BuildContext context, String slug) async {
  dynamic items = {"slug": slug, "post": "roles"};
  Navigator.pushNamed(context, RoleViewRoute, arguments: items);
}
