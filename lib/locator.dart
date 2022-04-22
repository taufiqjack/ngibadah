import 'package:get_it/get_it.dart';
import 'package:monggo_sholat/core/viewmodel/home_viewmodel.dart';
import 'package:monggo_sholat/repository/menu_repository.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => MenuRepo());
  locator.registerFactory(() => HomeViewModel());
}
