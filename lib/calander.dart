import 'package:chateo/utils/extension/sized_box_extensions/sized_box_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  final controller = TextEditingController();
  List<Map<String,dynamic>> msg = <Map<String,dynamic>>[];
  final ScrollController _scrollController = ScrollController();
  var dateAndTime = DateTime.now();

  // Function to add a new message
  void addMessage() {
    String message = controller.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        msg.add({
          "msg":message,
          "dateAndTime":dateAndTime.add(Duration(days: 1)),
        });
      });
      controller.clear();
      _scrollToBottom();
    }
  }

  // Function to remove a message
  void removeMessage(int index) {
    setState(() {
      msg.removeAt(index);
    });
  }

  // Function to add current time
  String dateFormatter() {
  return DateFormat('hh:mm a').format(DateTime.now());
  }

  // Function to scroll to the bottom
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar", style: TextStyle(fontSize: 24)),
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: msg.isEmpty
                ? Center(
              child: Text(
                "No messages yet",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade600,
                ),
              ),
            )
                : ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: msg.length,
              itemBuilder: (_, index) {
                var data = msg[index];
                var today = index==0||data['dateAndTime'].day != msg[index - 1]['dateAndTime'].day;
                return Column(
                  children: [
                    Visibility(
                      visible: today,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child:  Text(identifyCurrentDate(data['dateAndTime'].toString())),
                      ),
                    ),

                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['msg'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  dateFormatter(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                          60.width,
                          InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () => removeMessage(index),
                            child: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: addMessage,
                  child: const Icon(Icons.send),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.blueGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.blueGrey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String identifyCurrentDate(String date){
    var currentDate = DateTime.parse(date);
    if(DateTime.now().day==currentDate.day){
      return "today";
    }
    else if(DateTime.now().subtract(Duration(days: 1)).day==currentDate.day){
      return "yesterday";
    }else{
      return date;
    }

  }

}
