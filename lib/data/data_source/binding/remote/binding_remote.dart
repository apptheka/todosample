

import '../../../network/app_api.dart';
import '../../../network/network_info.dart';
import '../../binding/binding_datasource.dart';

abstract class BindingRemote implements BindingDataSource {
  Future<bool> isConnected();
}

// (
//       @Field("transactionId") String transactionId,
//       @Field("dateOfTransaction") int dateOfTransaction,
//       @Field("transactionAmount") num transactionAmount,
//       @Field("transactionDetails") String transactionDetails);
class BindingRemoteImpl implements BindingRemote {
  final AppServiceClient _appServiceClient;
  final NetworkInfo _networkInfo;
  BindingRemoteImpl(this._appServiceClient, this._networkInfo);

  @override
  Future<bool> isConnected() async {
    return await _networkInfo.isConnected;
  }
}
