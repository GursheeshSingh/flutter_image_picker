import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

typedef Future<bool> OnDeleteClicked();

class DeleteWidget extends StatefulWidget {
  final OnDeleteClicked onDeleteClicked;

  DeleteWidget(this.onDeleteClicked);

  @override
  _DeleteWidgetState createState() => _DeleteWidgetState();
}

class _DeleteWidgetState extends State<DeleteWidget> {
  bool isDeleting = false;

  void stopDeleting() {
    setState(() {
      isDeleting = false;
    });
  }

  void startDeleting() {
    setState(() {
      isDeleting = true;
    });
  }

  _onDeleteWidgetClicked() async {
    print('DELETING');
    startDeleting();

    bool isDeleted = await widget.onDeleteClicked();

    stopDeleting();
    print('DELETED');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onDeleteWidgetClicked,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Visibility(
            visible: isDeleting,
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.redAccent),
                strokeWidth: 4.0,
              ),
            ),
          ),
          Visibility(
            visible: isDeleting == false,
            child: Icon(
              MaterialCommunityIcons.delete,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
