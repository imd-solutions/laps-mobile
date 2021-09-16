
import './../../../models/models.dart';

class TitleViewModel extends BaseModel {
  WpData _title;

  TitleViewModel({required  WpData title}) : _title = title;

  WpData get info {
    return WpData(
      id: _title.id,
      name: _title.name,
    );
  }
}
