import 'package:flutter/material.dart';

abstract class BasePageScreen extends StatefulWidget {
  // BasePageScreen({required Key key}) : super(key: key);
}

abstract class BasePageScreenState<Page extends BasePageScreen>
    extends State<Page> {
  BuildContext getContext();
  String appBarTitle();
}
