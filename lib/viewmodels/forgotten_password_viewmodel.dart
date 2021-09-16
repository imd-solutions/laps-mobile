import '../../../config/config.dart';
import '../../../models/models.dart';
import '../../../services/services.dart';
import '../../../viewmodels/base_viewmodel.dart';

class ForgottenPasswordViewModel extends BaseViewModel {
  UserApi userApi = locator<UserApi>();

  Future<Message> getForgottenPassword(String email) async {
    Message response = await userApi.forgottenPassword(email);

    notifyListeners();

    return response;
  }
}
