
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data_controller.dart';
import 'model.dart';

final userDataProvider = FutureProvider<List<Data>>((ref) async{
  return ref.watch(dataProvider).fetchTenantsItems();
});