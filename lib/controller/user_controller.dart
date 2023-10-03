import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jazeera_paints/data/model/user_info_model.dart';

class UserController extends GetxController {

  late UserInfoModel _userInfoModel;
  late XFile _pickedFile;

  UserInfoModel get userInfoModel => _userInfoModel;
  XFile get pickedFile => _pickedFile;

  void pickImage() async {
    _pickedFile = (await ImagePicker().pickImage(source: ImageSource.gallery))!;
    update();
  }


}