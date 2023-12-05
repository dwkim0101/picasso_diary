import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import '../util/request.dart';

final List<String> _itemList = [
  "클로드 모네",
  "에드워드 호퍼",
  "마르크 샤갈",
  "장프랑수아 밀레",
  "빈센트 반 고흐",
];

class CreateDiary extends StatefulWidget {
  const CreateDiary({
    super.key,
    // required this.title,
  });

  // final String title;

  @override
  State<CreateDiary> createState() => _CreateDiaryState();
}

class _CreateDiaryState extends State<CreateDiary> {
  final diaryController = TextEditingController();
  bool loading = true;
  String onGoingText = "당신의 하루를 그려낼 준비 중이에요."; // 변환할 내용
  String _src = "";
  String dropdownValue = _itemList[0];

  Future<String> generateText(String prompt) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey'
      },
      body: jsonEncode({
        "model": "text-davinci-003",
        'prompt': prompt,
        'max_tokens': 1000,
        'temperature': 0,
        'top_p': 1,
        'frequency_penalty': 0,
        'presence_penalty': 0
      }),
    );

    Map<String, dynamic> newresponse =
        jsonDecode(utf8.decode(response.bodyBytes));

    return newresponse['choices'][0]['text'];
  }

  void dallEGenerater(String diary) async {
    setState(() {
      if (!loading) {
        _src = "";
        onGoingText = "ChatGpt에게 다시 만들어 달라고 부탁을 했어요 !";
      }
    });
    // String diary =
    //     "어제 엄마와 놀이동산에 갔다. 정말 신이 났지만, 차츰 비가 내리기 시작하더니 야외에 있는 놀이기구는 탈 수 없게 되었다. 그래도 엄마와 함께한다는 것이 정말 신났다.";
    String artist = dropdownValue;
    // print(dropdownValue);
    // String prompt =
    //     "지금부터 DALL·E에게 일기의 장면을 화가의 스타일에 맞게 만들기 위한 영어 명령어를 만들거야. 조건은 두 가지야. '$artist'의 화풍에서 영감을 받을 것. 장면은 \"$diary\" 에서 따올 것. 완성된 영어 명령어를 한 줄로 요약해서 보여줘. ";
    String prompt = "일기 '$diary' 를 요약하고 'draw like monet' 을 추가한 영어 명령어를 보여줘";

    setState(() {
      loading = false;
      onGoingText = "일기를 요약하는 중 ...";
      // "ChatGpt에게 요약해달라고 요청을 보냈어요 !";
    });

    print(prompt);
    Future<String> data = generateText(prompt);

    data.then((value) async {
      print(value);
      setState(() {
        onGoingText = "요약 완료 !\n$artist가 그림을 그리는 중이에요.\n잠시만 기다려주세요!";
        // "ChatGpt가 요약해준 내용을 바탕으로\nDALL·E 에게 그림을 그려달라고 부탁했어요.\n잠시만 기다려주세요!";
      });
      // var imagePath = await openAi.generateImage(value);
      var imagePath = await openAi.generateImage("lake. draw like monet");

      print(imagePath);
      setState(() {
        _src = imagePath;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        // title: const Text('Picasso Diary'),
        toolbarHeight: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        _src,
                        // fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              loading
                                  ? const Column()
                                  : const Column(
                                      children: [
                                        SpinKitChasingDots(
                                          color: Colors.black,
                                          // Theme.of(context).colorScheme.primary,
                                          size: 50.0,
                                        ),
                                        SizedBox(
                                          height: 30,
                                        )
                                      ],
                                    ),
                              Text(
                                onGoingText,
                                style: const TextStyle(
                                  fontFamily: 'Noto_Serif_KR',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ));
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownMenu<String>(
                        width: 150,
                        initialSelection: _itemList.first,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        dropdownMenuEntries: _itemList
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                      ElevatedButton(
                        onPressed: () => dallEGenerater(diaryController.text),
                        child: const Row(
                          children: [
                            Text(
                              "그리기  ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.brush_outlined),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 3,
                      cursorColor: const Color(0xFF3C4858),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: '오늘 하루는 어떤 일이 있었나요?',
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: diaryController,
                    // minLines: 5,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    cursorColor: const Color(0xFF3C4858),
                    decoration: const InputDecoration.collapsed(
                      hintText: '하루를 기록해주세요···',
                    ),
                  ),
                  // Text(
                  //   '$_counter',
                  //   style: Theme.of(context).textTheme.headlineMedium,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
      // floatingActionButton: const FloatingActionButton(
      //   onPressed: null,
      //   tooltip: 'Submit',
      //   child: Icon(Icons.check),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
