import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import './../../../enum/enum.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';

class JobViewMobilePortrait extends BaseModelWidget<JobViewModel> {
  final TextEditingController nameController = TextEditingController();
  final String UserName = '';
  @override
  Widget build(BuildContext context, JobViewModel data) {
    return data.state == ViewStateType.Busy
        ? FullBusyOverlay(
            show: data.state == ViewStateType.Busy,
            child: const Text(''),
          )
        : Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (data.vacancies.length < 1) OpportunityForm(data),
                  if (data.vacancies.length > 0) OpportunityResults(data),
                ],
              ),
            ),
          );
  }
}

Widget OpportunityForm(JobViewModel data) {
  return Column(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Keyword(s):",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 5.0),
            child: InputText(
              borderRadius: 2.5,
              initialValue: "",
              icon: Icons.search,
              hintText: '',
              validator: (String? value) {
                // if (value.isEmpty) {
                //   return 'Enter firstname.';
                // }
                // return null;
              },
              onChanged: (String value) {},
              onSaved: (String? value) {
                // profile.firstname = value;
              },
            ),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Location:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
              left: 10.0,
              right: 15.0,
            ),
            child: GestureDetector(
              onTap: () => print("TEST"),
              child: Dropdown(
                padding: true,
                selectedTitle: 'Please select...',
                selected: 0,
                data: [],
                updateSelected: (val) {},
              ),
            ),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Within:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
              left: 10.0,
              right: 15.0,
            ),
            child: Dropdown(
              padding: true,
              selectedTitle: 'Please select...',
              selected: data.withinDropdown,
              data: data.within,
              updateSelected: (val) {
                data.updateWithinNumber(val);
              },
            ),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Salary:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
              left: 10.0,
              right: 15.0,
            ),
            child: Dropdown(
              padding: true,
              selectedTitle: 'Please select...',
              selected: data.salaryDropdown,
              data: data.salary,
              updateSelected: (val) {
                data.updateSalaryNumber(val);
              },
            ),
          ),
        ],
      ),
      SizedBox(
        height: 15.0,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(
          "Employment Type",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Divider(),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Checkbox(
                    checkColor: Colors.yellowAccent, // color of tick Mark
                    activeColor: Colors.grey,
                    value: data.permanent,
                    onChanged: (bool? value) => data.updateCheckboxData('permanent', value),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Text("Permanent"),
                )
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Checkbox(
                    checkColor: Colors.yellowAccent, // color of tick Mark
                    activeColor: Colors.grey,
                    value: data.temporary,
                    onChanged: (bool? value) => data.updateCheckboxData('temporary', value),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Text("Temporary"),
                )
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Checkbox(
                    checkColor: Colors.yellowAccent, // color of tick Mark
                    activeColor: Colors.grey,
                    value: data.contract,
                    onChanged: (bool? value) => data.updateCheckboxData('contract', value),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Text("Contract"),
                )
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Checkbox(
                    checkColor: Colors.yellowAccent, // color of tick Mark
                    activeColor: Colors.grey,
                    value: data.placement,
                    onChanged: (bool? value) => data.updateCheckboxData('placement', value),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Text("Placement"),
                )
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(
          "Working hours",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Divider(),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Checkbox(
                    checkColor: Colors.yellowAccent, // color of tick Mark
                    activeColor: Colors.grey,
                    value: data.fullTime,
                    onChanged: (bool? value) => data.updateCheckboxData('fullTime', value),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Text("Full time"),
                )
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Checkbox(
                    checkColor: Colors.yellowAccent, // color of tick Mark
                    activeColor: Colors.grey,
                    value: data.partTime,
                    onChanged: (bool? value) => data.updateCheckboxData('partTime', value),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Text("Part time"),
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
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
                  'Search',
                  key: const ValueKey("viewPostBtn"),
                  style: TextStyle(
                    color: Palette.accentColour,
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
            data.searchForOpportunity();
          },
        ),
      ),
    ],
  );
}

Widget OpportunityResults(JobViewModel data) {
  return Column(
    children: [
      ElevatedButton(
        child: Text(
          'Reset',
          key: const ValueKey("viewPostBtn"),
          style: TextStyle(
            color: Palette.accentColour,
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
          data.resetVacancySearch();
        },
      ),
      SizedBox(
        height: 10.0,
      ),
      Text("Results:"),
      SizedBox(
        height: 10.0,
      ),
      Container(
        height: 600.0,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: data.vacancies.length,
            itemBuilder: (context, i) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.vacancies[i].jobTitle,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Text(data.vacancies[i].jobLocation!),
                for (var index = 0; index < data.vacancies[i].employmentType!.length; index++) Text(data.vacancies[i].employmentType![index]),
                Text('£${data.vacancies[i].salaryFrom} to £${data.vacancies[i].salaryTo}'),
                Html(
                  data: data.vacancies[i].jobSummary,
                ),
                // Container(
                //   height: 50.0,
                //   decoration: BoxDecoration(
                //     color: Palette.primaryColour,
                //   ),
                //   alignment: Alignment.center,
                //   child: GestureDetector(
                //     onTap: () {},
                //     child: ,
                //   ),
                // ),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
