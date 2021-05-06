import 'package:get_it/get_it.dart';

import 'core/viewmodels/add_model.dart';
import 'core/viewmodels/base_model.dart';
import 'core/viewmodels/home_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => AddTodoModel());
  locator.registerFactory(() => BaseModel());
  locator.registerFactory(() => HomeModel());
}
