import 'package:bottom_navigaton_bar/datasoursec/local_datasoursec.dart';
import 'package:bottom_navigaton_bar/model/app_model.dart';

class AppService {
  static final AppService _instance = AppService._internal();

  factory AppService() => _instance;
  AppService._internal();

  final LocalDatasoursec _local = LocalDatasoursec();

  AppModel _model = AppModel(
    indexScreen: 0,
    darkMode: false,
    imageeUrl: "https://avatars.githubusercontent.com/u/194600411?v=4&size=64",
    fullName: "Mahmudov Nurmuhammad \nFarhod O'gli",
    telephoneNumber: "+998 88 111 78 72",
    email: "nurmuhammadmahmudov268@gmail.com",
  );

  AppModel get model => _model;

  // malumot  olish uchun
  Future<void> loadSettings() async {
    final updatedModel = await _local.getData();
    if (updatedModel != null) {
      _model = updatedModel;
    }
  }

  // yangilash uchun
  Future<void> update(AppModel newModel) async {
    _model = newModel;
    await _local.saveData(_model);
  }

  // darkmodeni ozgartish uchun
  Future<void> toggleDarkMode() async {
    final updated = _model.copyWith(darkModeN: !_model.darkMode);
    await update(updated);
  }


  // Ism familiyani ozgartish uchun
  Future<void> updateFullName(String fullName) async {
    final updated = _model.copyWith(fullNameN: fullName);
    await update(updated);
  }

  // Telephone number ozgartishihs uchun
  Future<void> updateTelephoneNumber(String number) async {
    final updated = _model.copyWith(telephoneNumberN: number);
    await update(updated);
  }

  // inedxni yangilash uchun
  Future<void> updateIndex(int index) async {
    final updated = _model.copyWith(indexScreenN:index);
    await update(updated);
  }
  
    Future<void> updateEmail(String email) async {
    final updated = _model.copyWith(emailN:email);
    await update(updated);
  }


    Future<void> updateImage(String imageeUrl) async {
    final updated = _model.copyWith(imageeUrlN:imageeUrl);
    await update(updated);
  }
  
}
