import 'package:flutter/material.dart';
import 'package:flutterPlayground/application/app.dart';
import 'package:flutterPlayground/ui/app_colors.dart';

class CodeSheet extends StatefulWidget {
  @override
  State<CodeSheet> createState() => _CodeSheetState();
}

class _CodeSheetState extends State<CodeSheet> {
  List<String> fileContent = [""];
  setFileContent(String rawFileContent) {
    setState(() {
      this.fileContent = rawFileContent.split("\n");
    });
  }

  _CodeSheetState() {
    DefaultAssetBundle.of(App.shared.context)
        .loadString("assets/mock_data/page.html")
        .then(setFileContent);
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = Theme.of(context).textTheme.bodyText1.fontSize;
    double lineNumberBoxSize =
        (fileContent.length.toString().length + 0.2) * fontSize;

    return ListView.builder(
      itemCount: fileContent.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: <Widget>[
            SizedBox(
              width: lineNumberBoxSize,
              child: Container(
                  margin: EdgeInsets.only(right: 6.0),
                  color: AppColors.theme.lightBackground,
                  child: Center(
                      child: Text(
                    index.toString(),
                    style: TextStyle(color: AppColors.theme.lightText),
                  ))),
            ),
            Expanded(
                child: Text(
              fileContent[index],
              style: TextStyle(fontFamily: 'RobotoMono'),
            ))
          ],
        );
      },
    );
  }
}
