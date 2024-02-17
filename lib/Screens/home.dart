import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Sky { messages, viridian, cerulean }

Map<Sky, Color> skyColors = <Sky, Color>{
  Sky.messages: const Color.fromARGB(255, 140, 51, 255),
  Sky.viridian: const Color.fromARGB(255, 140, 51, 255),
  Sky.cerulean: const Color.fromARGB(255, 140, 51, 255),
};

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

Sky _selectedSegment = Sky.messages;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Bubble',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoTextField(
                placeholder: 'Search Messages',
                style: GoogleFonts.redHatDisplay(
                  textStyle: const TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 17,
                  ),
                ),
                suffix: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.line_horizontal_3_decrease,
                      color: CupertinoColors.systemPurple,
                    )),
                prefix: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.search,
                      color: CupertinoColors.systemPurple,
                    )),
              ),
            ),
            CupertinoSlidingSegmentedControl<Sky>(
              backgroundColor: const Color.fromARGB(255, 247, 247, 247),
              thumbColor: skyColors[_selectedSegment]!,

              // This represents the currently selected segmented control.
              groupValue: _selectedSegment,
              // Callback that sets the selected segmented control.
              onValueChanged: (Sky? value) {
                if (value != null) {
                  setState(() {
                    _selectedSegment = value;
                  });
                }
              },
              children: <Sky, Widget>{
                Sky.messages: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Messages',
                    style: TextStyle(
                      color: _selectedSegment == Sky.messages
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                    ),
                  ),
                ),
                Sky.viridian: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Groups',
                    style: TextStyle(
                      color: _selectedSegment == Sky.viridian
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                    ),
                  ),
                ),
                Sky.cerulean: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Request',
                    style: TextStyle(
                      color: _selectedSegment == Sky.cerulean
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                    ),
                  ),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
