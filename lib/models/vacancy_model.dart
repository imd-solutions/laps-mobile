import 'dart:convert';

Vacancy vacancyFromJson(String str) => Vacancy.fromJson(json.decode(str));

String vacancyToJson(Vacancy data) => json.encode(data.toJson());

class Vacancy {
  Vacancy({
    required this.id,
    required this.jobTitle,
    required this.jobSummary,
    this.salaryCurrency,
    this.salaryFrom,
    this.salaryTo,
    this.salaryDescription,
    this.jobLocation,
    required this.employmentType,
    required this.workingHours,
    required this.clientId,
  });

  int id;
  String jobTitle;
  String jobSummary;
  String? salaryCurrency;
  String? salaryFrom;
  String? salaryTo;
  String? salaryDescription;
  String? jobLocation;
  List<String>? employmentType;
  List<String>? workingHours;
  int clientId;

  factory Vacancy.fromJson(Map<String, dynamic> json) => Vacancy(
    id: json["Id"],
    jobTitle: json["JobTitle"],
    jobSummary: json["JobSummary"],
    salaryCurrency: json["SalaryCurrency"] == null ? "" : json["SalaryCurrency"],
    salaryFrom: json["SalaryFrom"] == null ? "" : json["SalaryFrom"],
    salaryTo: json["SalaryTo"] == null ? "" : json["SalaryTo"],
    salaryDescription: json["SalaryDescription"] == null ? "" : json["SalaryDescription"],
    jobLocation: json["JobLocation"] == null ? "" : json["JobLocation"],
    employmentType: json["EmploymentType"] == null ? [] : List<String>.from(json["EmploymentType"].map((x) => x)),
    workingHours: json["WorkingHours"] == null ? [] : List<String>.from(json["WorkingHours"].map((x) => x)),
    clientId: json["ClientId"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "JobTitle": jobTitle,
    "JobSummary": jobSummary,
    "SalaryCurrency": salaryCurrency == null ? null : salaryCurrency,
    "SalaryFrom": salaryFrom == null ? null : salaryFrom,
    "SalaryTo": salaryTo == null ? null : salaryTo,
    "SalaryDescription": salaryDescription == null ? null : salaryDescription,
    "JobLocation": jobLocation == null ? null : jobLocation,
    "EmploymentType": employmentType == null ? [] : List<dynamic>.from(employmentType!.map((x) => x)),
    "WorkingHours": workingHours == null ? [] : List<dynamic>.from(workingHours!.map((x) => x)),
    "ClientId": clientId,
  };
}
