import 'package:todolist/data/data_source/binding/local/binding_local.dart';

import 'binding/remote/binding_remote.dart';
import '../data_source/common/base_datasource_factory.dart';

import 'binding/binding_datasource.dart';

class BindingDataSourceFactory
    extends BaseDataSourceFactory<BindingDataSource?> {
  BindingDataSourceFactory({
    required BindingRemote bindingRemote,
    required BindingLocal bindingLocal,
  })  : _bindingRemote = bindingRemote,
        _bindingLocal = bindingLocal;

  final BindingRemote _bindingRemote;
  final BindingLocal _bindingLocal;

  @override
  BindingDataSource createData(DataSourceState dataSourceState) {
    switch (dataSourceState) {
      case DataSourceState.network:
        return _bindingRemote;
      case DataSourceState.local:
        return _bindingLocal;
      default:
        return _bindingRemote;
    }
  }
}
