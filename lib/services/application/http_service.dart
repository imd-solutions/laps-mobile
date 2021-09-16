
import './../../services/services.dart';
import '../../models/models.dart';

class ApplicationService implements ApplicationApi {
  // Get a list of applications from the site.
  @override
  Future<Application> getApplication() async {

    Application application = Application(
      name: "",
      version: "",
      environment: "",
      year: "",
    );

    return application;
  }
}
