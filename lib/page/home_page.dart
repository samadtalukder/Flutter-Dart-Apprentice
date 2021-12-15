import 'package:flutter/material.dart';
import 'package:flutter_dart_apprentice/page/scaffolds/scaffold_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Flutter Apprentice",
        ),
      ),
      body: bodyLayout(context),
    );
  }

  bodyLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            Card(
              child: ListTile(
                title: const Text("Scaffold"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScaffoldWidget(),
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Theme"),
              ),
            )
          ],
        ).toList(),
      ),
    );
  }
}
