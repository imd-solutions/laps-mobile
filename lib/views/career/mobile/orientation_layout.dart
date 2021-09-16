import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import './../../../config/config.dart';
import './../../../enum/enum.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';

class CareerViewMobilePortrait extends BaseModelWidget<CareerViewModel> {
  @override
  Widget build(BuildContext context, CareerViewModel data) {

    return data.state == ViewStateType.Busy
        ? FullBusyOverlay(
            show: data.state == ViewStateType.Busy,
            child: const Text(''),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Careers",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Palette.primaryColour),
            ),
            body: Container(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: data.posts.length,
                  itemBuilder: (context, i) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.network(
                          "https://laps-app.phase4web.com/wp-content/uploads/2016/06/LAPS-Accountancy-400x260.jpg",
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Palette.primaryColour,
                        ),
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            dynamic items = {"slug": data.posts[i].slug, "post": "roles"};
                            Navigator.pushNamed(context, RoleViewRoute, arguments: items);
                          },
                          child: Html(data: data.posts[i].name),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
