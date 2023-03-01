import 'package:flutter/material.dart';
import 'package:quran_app_graduation_project/quran_brain.dart';
import 'package:quran_app_graduation_project/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Al Qura\'n',

      home: //SplashScreen()
          const SplashScreen()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  QuranBrain qb = QuranBrain();
  final _myController = TextEditingController();

  late int numberOfPages =  qb.getQuraanPages() as int;
  PageController _controller = PageController();

  Future<List<String>> getQuraanTextsBrain(String page) async {
    final int ayahs = await qb.getAyahsNumberperPage(page);
    List<String> texts = [];
    for (int i = 0; i < ayahs - 1; i++) {
      texts.add(await qb.getAyahsTextsPerPage(i + 1, page));
      setState(() {});
    }
    //print(texts);
    return (texts);
  }
  @override
  void dispose() {
    _myController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0X0ff87986a),
          title: Center(child: Text(widget.title)),
        ),
        body: SafeArea(
          child: FutureBuilder(
              future: qb.getSurahsNameOfQuraan(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List items = snapshot.data as List;
                  return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: SizedBox(
                            width: 27,
                            height: 35,
                            child: Stack(children: [
                              const Image(
                                  color: Color(0xE2195E59),
                                  image: AssetImage("assets/surahnum.png")
                              ),
                              Center(
                                child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      "${index + 1}",
                                      style: const TextStyle(
                                          color: Color(0xE2195E59)),
                                    )),
                              )
                            ]),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_left,
                            color: Color(0xE2195E59),
                          ),
                          onTap: () {
                            print('tapp');

                          },
                          title: Text('${items[index]['name']}'),
                        );
                      });
                } else {
                  return const Center(child: CircularProgressIndicator(
                    color: Color(0xE2195E59),
                  ));
                }
              }),
        )),
    );
      // This trailing comma makes auto-formatting nicer for build methods.

  }
}
