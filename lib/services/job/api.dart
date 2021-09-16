
import './../../models/models.dart';

abstract class JobApi {

  Future<List<Vacancy>> searchForOpportunities(String basicAuth, String userID, int salary, double lat, double long, int miles, List<String> empType, List<String> workHours, String keywords);

}