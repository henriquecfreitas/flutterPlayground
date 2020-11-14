import 'package:flutter/widgets.dart';
import 'package:flutterPlayground/application/models/user.dart';
import 'package:flutterPlayground/application/models/space.dart';

abstract class AppInitListener {
  void onUserFetched(User user);
}

abstract class DataUpdateListener {
  void onSpaceSelected(Space space);
}

class App {
  BuildContext context;
  User user;
  Space space;
  List<AppInitListener> appInitListeners = [];
  List<DataUpdateListener> dataListeners = [];

  static App shared = App();
  init(BuildContext context) {
    this.context = context;
    fetchUser();
  }

  subscribeAppInit(AppInitListener listener) => appInitListeners.add(listener);
  subscribeDataUpdate(DataUpdateListener listener) =>
      dataListeners.add(listener);

  Future<void> fetchUser() async {
    String json = await DefaultAssetBundle.of(context)
        .loadString("assets/mock_data/user.json");
    User user = User.fromJson(json);

    appInitListeners.forEach((listener) => listener.onUserFetched(user));
    this.user = user;

    Space space = user.spaces.length > 0 ? user.spaces.first : null;
    selectSpace(space);
  }

  selectSpace(Space space) {
    dataListeners.forEach((listener) => listener.onSpaceSelected(space));
    this.space = space;
  }
}
