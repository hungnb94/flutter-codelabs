import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationControls extends StatelessWidget {
  const NavigationControls({required this.controller, super.key});

  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            final messenger = ScaffoldMessenger.of(context);
            if (await controller.canGoBack()) {
              await controller.goBack();
            } else {
              messenger.showSnackBar(
                SnackBar(content: Text('No back history item')),
              );
              return;
            }
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        IconButton(
          onPressed: () async {
            final messenger = ScaffoldMessenger.of(context);
            if (await controller.canGoForward()) {
              await controller.goForward();
            } else {
              messenger.showSnackBar(
                SnackBar(content: Text('No forward history item')),
              );
              return;
            }
          },
          icon: Icon(Icons.arrow_forward_ios),
        ),
        IconButton(
          onPressed: () async {
            await controller.reload();
          },
          icon: Icon(Icons.replay),
        ),
      ],
    );
  }
}
