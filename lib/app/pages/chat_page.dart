import 'package:flutter/material.dart';
import 'package:chat_app_ui_flutter/app/constants/app_string.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final Color backgroundColor = Colors.white;

  final List<MessagesModel> messages = [
    MessagesModel(text: 'Ah lapoda', sendByMe: false),
    MessagesModel(text: 'Tala ki ma tol li na', sendByMe: false),
    MessagesModel(text: 'Ah', sendByMe: true),
    MessagesModel(text: 'Laba dee po chi la no cha', sendByMe: false),
    MessagesModel(text: 'Wu blana ki liji fupapu se la nanee', sendByMe: false),
    MessagesModel(text: 'Underwear', sendByMe: true),
    MessagesModel(text: 'La ka re li rei wee gil lih bya', sendByMe: true),
    MessagesModel(text: 'La ko reh', sendByMe: true),
    MessagesModel(text: 'Underwear', sendByMe: false),
    MessagesModel(text: 'La pa kreh le gua ri de la keh', sendByMe: false),
    MessagesModel(text: 'Lapeile', sendByMe: false),
    MessagesModel(text: 'Underwear', sendByMe: true),
    MessagesModel(text: 'La ga di libe da eligwa', sendByMe: false),
    MessagesModel(text: 'La gua reh', sendByMe: false),
    MessagesModel(text: 'Le sho li eh tu', sendByMe: true),
    MessagesModel(text: 'A ke li i tu', sendByMe: true),
    MessagesModel(text: 'Le aho li du le ga so le ala', sendByMe: false),
    MessagesModel(text: 'Underwear', sendByMe: true),
    MessagesModel(text: 'Ladu', sendByMe: true),
    MessagesModel(text: 'La amo dee underwear', sendByMe: false),
    MessagesModel(text: 'Underwear', sendByMe: true),
    MessagesModel(text: 'Underwear La amo dee underwear', sendByMe: true),
    MessagesModel(text: 'La pa kreh le gua ri de la keh', sendByMe: true),
    MessagesModel(text: 'Underwear', sendByMe: false),
  ];

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
              child: _buildMessageBoxView(
                element.text,
                myMessage: element.sendByMe,
              ),
            ),
            _buildMessageBoxView(
              element.text,
              myMessage: element.sendByMe,
              show: true,
            ),
          ],
        ),
      );
    }
    return children
      ..add(
        Expanded(
          child: Container(
            color: backgroundColor,
          ),
        ),
      )
      ..insert(
        0,
        Container(
          height: 8,
          color: backgroundColor,
        ),
      );
  }

  Widget _buildMessageBoxView(
    String message, {
    bool myMessage = false,
    bool show = false,
  }) {
    return Container(
      width: double.infinity,
      color: show ? null : Colors.transparent,
      alignment: myMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 250),
        margin: const EdgeInsets.fromLTRB(12, 0, 12, 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: show ? null : const Color(0xff2b2540),
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            message,
            style: TextStyle(
              color: show ? Colors.white : Colors.transparent,
            ),
          ),
        ),
      ),
    );
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

class MessagesModel {
  String text;
  bool sendByMe;

  MessagesModel({required this.text, required this.sendByMe});
}
