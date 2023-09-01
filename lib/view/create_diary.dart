import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../util/request.dart';

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
  String _src = "";
  String colorString = "Yellow";
  String _result = "모네";
  final List<String> _itemList = [
    "살바도르 달리",
    "피카소",
    "Orange",
    "Yellow",
    "amber",
    "Blue",
    "Purple",
    "Black",
    "White"
  ];

  void dallEGenerater(String statement) async {
    var imagePath = await openAi.generateImage(
        "A painting of a happy family went to the coast in Monet style");
    print(imagePath);
    setState(() {
      _src = imagePath;
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
      body: SingleChildScrollView(
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
                        return const Center(
                            child: Text(
                          "당신의 하루를 그려낼 준비 중이에요.",
                          style: TextStyle(fontFamily: 'Noto_Serif_KR'),
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
                    // const Text(
                    //   '현재 선택된 화풍 : ',
                    // ),
                    CupertinoButton(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Text(
                        _result,
                        style: const TextStyle(fontFamily: 'Noto_Serif_KR'),
                      ),
                      onPressed: () async {
                        await showCupertinoModalPopup(
                          context: context,
                          builder: (context) => SizedBox(
                              height: 200.0,
                              child: CupertinoPicker(
                                itemExtent: 50.0,
                                scrollController:
                                    FixedExtentScrollController(initialItem: 0),
                                onSelectedItemChanged: (int index) {
                                  setState(() {
                                    _result = _itemList[index];
                                  });
                                },
                                children:
                                    _itemList.map((e) => Text(e)).toList(),
                              )),
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () => dallEGenerater("아무값"), //TODO:
                      child: const Row(
                        children: [
                          Text(
                            "그리기  ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.brush_outlined),
                        ],
                      ),
                    )
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
                  // minLines: 5,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  cursorColor: const Color(0xFF3C4858),
                  decoration: const InputDecoration.collapsed(
                      hintText: '하루를 기록해주세요···'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Submit',
        child: const Icon(Icons.check),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
