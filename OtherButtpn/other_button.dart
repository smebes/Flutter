import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final FocusNode _focusNode;
  bool _textFieldHasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() => _textFieldHasFocus = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const itemsSize = 70.0;
    const animationDurationInMs = Duration(milliseconds: 250);
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: animationDurationInMs,
            child: _textFieldHasFocus
                ? null
                : Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: itemsSize,
                          height: itemsSize,
                          decoration: const BoxDecoration(
                            color: Color(0xff6a81f9),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              '50',
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: itemsSize,
                          height: itemsSize,
                          decoration: const BoxDecoration(
                            color: Color(0xff6a81f9),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              '100',
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: itemsSize,
                          height: itemsSize,
                          decoration: const BoxDecoration(
                            color: Color(0xff6a81f9),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              '150',
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: itemsSize,
                          height: itemsSize,
                        ),
                      ],
                    ),
                  ),
          ),
          Center(
            child: LayoutBuilder(builder: (context, constraints) {
              final spaceBetween =
                  (constraints.biggest.width - 4 * itemsSize) / 5;
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: animationDurationInMs,
                    width: _textFieldHasFocus
                        ? constraints.biggest.width - 2 * spaceBetween
                        : itemsSize,
                    height: itemsSize,
                    child: Center(
                      child: TextField(
                        focusNode: _focusNode,
                        maxLines: 10,
                        decoration: const InputDecoration(
                            hintText: 'Other',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)))),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: spaceBetween,
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

