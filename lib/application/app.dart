import 'package:flutter/widgets.dart';
import 'package:flutterPlayground/application/models/user.dart';

abstract class AppInitListener {
  void onUserFetched(User user);
}

class App {
  BuildContext context;
  User user;
  List<AppInitListener> listeners = [];

  static App shared = App();
  init(BuildContext context) {
    this.context = context;
    fetchUser();
  }

  subscribe(AppInitListener listener) => listeners.add(listener);

  Future<void> fetchUser() async {
    String json = await DefaultAssetBundle.of(context)
        .loadString("assets/mock_data/user.json");
    User user = User.fromJson(json);

    listeners.forEach((listener) => listener.onUserFetched(user));

    this.user = user;
  }
}
