import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:todoapp/chatbot/message_widget.dart';

class Chatroom extends StatefulWidget {
  const Chatroom({super.key, required AppBar appBar});

  @override
  State<Chatroom> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Chatroom> {

  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  bool isloading = false;

  late final GenerativeModel _model;
  late final ChatSession _chatSession;
  static const String _apiKey = String.fromEnvironment('API_KEY');

  @override
  void initState(){
    super.initState();
    print(_apiKey);
    _model = GenerativeModel(model: "gemini-pro" , apiKey: _apiKey);
    _chatSession = _model.startChat();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Expanded(
         child: ListView.builder(
          itemBuilder: ((context, index){
            final content = _chatSession.history.toList()[index];
            final text = content.parts
            .whereType<TextPart>()
            .map((part) => part.text)
            .join();
          return MessageWidget(
            message: text,
          isUserMessage: content.role == 'users',
          );
        }), 
        itemCount: _chatSession.history.length,
        controller:_scrollController,
        ),
      ),
      if (isloading) const LinearProgressIndicator(),
         Row(
           children: [
             Expanded(
               child: TextField( 
                controller: _textController,
                focusNode: _focusNode,
                onSubmitted: (value){
                  if(!isloading){
                   _sendMessage(value);
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Type a message',
                ),
                       ),
             ),
               IconButton(
                onPressed: isloading? null: (){
                  if(!isloading){
                    _sendMessage(_textController.text);
                  }
                },
                icon: const Icon(Icons.send),
               )      
           ],
         )
      ],
    );
  }

  void _scrollToBottom(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOutCirc,
    );
   });
  }

    Future<void> _sendMessage(String value) async{
      if(value.isEmpty){
        return;
      }
     setState(() {
        isloading = true;
      _textController.clear();
    });
    _scrollToBottom();
     
     final response = await _chatSession.sendMessage(Content.text(value));
    
     setState((){
      isloading = false;
    });
     _scrollToBottom();
     _focusNode.requestFocus();
  }
}