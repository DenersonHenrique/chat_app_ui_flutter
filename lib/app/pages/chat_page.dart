import 'package:flutter/material.dart';
import '../data/messages_data.dart';
import '../constants/app_string.dart';
import '../models/message_model.dart';
import '../widgets/message_bubble_widget.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final Color backgroundColor = Colors.white;
  final List<MessageModel> messages = messagesData;

  List<Widget> _buildMessageBox() {
    final List<Widget> children = <Widget>[];
    for (var element in messages) {
      children.add(
        Stack(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                backgroundColor,
                element.sendByMe ? BlendMode.srcOut : BlendMode.dstATop,
              ),
              child: MessageBubbleWidget(
                element.text,
                myMessage: element.sendByMe,
              ),
            ),
            MessageBubbleWidget(
              element.text,
              myMessage: element.sendByMe,
              show: true,
            ),
          ],
        ),
      );
    }
    return children
      ..add(Expanded(child: Container(color: backgroundColor)))
      ..insert(0, Container(height: 8, color: backgroundColor));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          AppString.appTitleAppBar,
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.pinkAccent,
                  Colors.purpleAccent,
                  Colors.blue,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          LayoutBuilder(
            builder: (
              BuildContext context,
              BoxConstraints viewportConstraints,
            ) {
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: _buildMessageBox(),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
