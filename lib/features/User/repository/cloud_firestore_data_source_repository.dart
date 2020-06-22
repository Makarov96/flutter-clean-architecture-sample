import 'package:clean_architecture_example/features/User/data/datasource/cloud_firestore_data_source.dart';
import 'package:clean_architecture_example/features/User/data/model/user.dart';

class CloudFireStoreRepository  {
  
  final _cloudfireStoreAPI = CloudFirestoreDataSource();
  void updateUserDataFirestore(User user) => _cloudfireStoreAPI.updateUserData(user);

}