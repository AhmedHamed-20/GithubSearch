import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gethubsearch/core/const/const.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReposWebViewScreen extends StatefulWidget {
  const ReposWebViewScreen({super.key, required this.repoUrl});
  final String repoUrl;
  @override
  State<ReposWebViewScreen> createState() => _ReposWebViewScreenState();
}

class _ReposWebViewScreenState extends State<ReposWebViewScreen> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'Repository More Information',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: WebView(
        onWebResourceError: (error) {
          flutterToast(
              msg: error.description,
              backgroundColor: AppColors.toastError,
              textColor: AppColors.white);
        },
        initialUrl: widget.repoUrl,
        onProgress: (progress) {
          if (progress != 100 && counter == 0) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                });
            counter++;
          } else if (progress == 100 && counter == 1) {
            Navigator.pop(context);
            counter--;
          }
        },
      ),
    );
  }
}
