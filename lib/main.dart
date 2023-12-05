import '/widgets/show_recs.dart';
import '/widgets/cool_drop_down.dart';
import 'package:flutter/material.dart';

import 'calculate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "A rectangle",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: "A rectangle"),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKeyA = new GlobalKey<FormState>();
  final formKeyB = new GlobalKey<FormState>();
  final formKeyH = new GlobalKey<FormState>();
  final List<String> _categories = [
    'Square',
    "A right rectangle",
    'Parallelogram',
    'Rhombus'
  ];
  final textA = TextEditingController();
  final textB = TextEditingController();
  final textH = TextEditingController();
  final String defaultC = 'Square';
  late String res = '';
  late int _selectedCategory = 0;
  late String result = '';
  final List<bool> _isSelected = [true, false];
  late String selectedForm = 'mm';

  void _onToggled(int indexSelection) {
    setState(() {
      for (var i = 0; i < _isSelected.length; i++) {
        _isSelected[i] = indexSelection == i;
      }

      final _selectedIndex = _isSelected.indexWhere((element) => element);

      if (_selectedIndex == 0) {
        selectedForm = 'mm';
      } else {
        selectedForm = 'sm';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff140093),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CoolDropDownButton(
            initialValue: defaultC,
            items: _categories.toList(),
            onChanged: (String newValue) {
              setState(() {
                if (newValue == _categories[0]) {
                  _selectedCategory = 0;
                }
                if (newValue == _categories[1]) {
                  _selectedCategory = 1;
                }
                if (newValue == _categories[2]) {
                  _selectedCategory = 2;
                }
                if (newValue == _categories[3]) {
                  _selectedCategory = 3;
                }
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: Text(
                    "Select the unit of measurement (default value is 'mm')",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                ToggleButtons(
                  onPressed: _onToggled,
                  isSelected: _isSelected,
                  fillColor: const Color(0xff140093),
                  selectedColor: Colors.white,
                  color: Colors.grey,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  borderRadius: BorderRadius.circular(10),
                  children: const [
                    Text('mm'),
                    Text('sm'),
                  ],
                ),
              ],
            ),
          ),
          Form(
            key: formKeyA,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: TextFormField(
                controller: textA,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a!';
                  }
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "enter a",
                    focusColor: Colors.blueAccent),
                keyboardType: TextInputType.number,
                cursorColor: Colors.blueAccent,
              ),
            ),
          ),
          if (_selectedCategory > 0)
            Form(
              key: formKeyB,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: TextFormField(
                  controller: textB,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter b!!';
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "enter b",
                      focusColor: Colors.blueAccent),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.blueAccent,
                ),
              ),
            ),
          if (_selectedCategory > 1)
            Form(
              key: formKeyH,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: TextFormField(
                  controller: textH,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the height!';
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "enter the height",
                      focusColor: Colors.blueAccent),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.blueAccent,
                ),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OutlinedButton(
                onPressed: () {
                  if (_selectedCategory == 0
                      ? !formKeyA.currentState!.validate()
                      : !formKeyA.currentState!.validate() ||
                          !formKeyB.currentState!.validate()) {
                    setState(() {
                      res = "Fill in the inputs";
                      result = 'ERROR';
                    });
                    return;
                  } else {
                    setState(() {
                      res = 'Perimeter';
                    });
                    late double inputA = double.tryParse(textA.text) ?? 0;
                    late double inputB = double.tryParse(textB.text) ?? 0;
                    late double inputH = double.tryParse(textH.text) ?? 0;

                    switch (_selectedCategory) {
                      case 0:
                        setState(() {
                          result =
                              CalculateSquare().periCal(inputA).toString();
                        });
                        break;
                      case 1:
                        setState(() {
                          result = CalculateRRectangle()
                              .periCal(inputA, inputB)
                              .toString();
                        });
                        break;
                      case 2:
                        setState(() {
                          result = CalculateParallelogram()
                              .periCal(inputA, inputB, inputH ?? 0)
                              .toString();
                        });
                        break;
                      case 3:
                        setState(() {
                          result = CalculateRhombus()
                              .periCal(inputA, inputB, inputH)
                              .toString();
                        });
                        break;
                      default:
                        print('ERROR');
                    }
                  }
                },
                child: const Text('Perimeter'),
              ),
              OutlinedButton(
                onPressed: () {
                  if (_selectedCategory == 0
                      ? !formKeyA.currentState!.validate()
                      : _selectedCategory == 1
                          ? !formKeyA.currentState!.validate() ||
                              !formKeyB.currentState!.validate()
                          : !formKeyH.currentState!.validate() ||
                              !formKeyA.currentState!.validate() ||
                              !formKeyB.currentState!.validate()) {
                    setState(() {
                      res = "Fill in the inputs";
                      result = 'ERROR';
                    });
                    return;
                  }
                  setState(() {
                    res = 'Surface area';
                  });
                  late double inputA = double.tryParse(textA.text) ?? 0;
                  late double inputB = double.tryParse(textB.text) ?? 0;
                  late double inputH = double.tryParse(textH.text) ?? 0;
                  switch (_selectedCategory) {
                    case 0:
                      setState(() {
                        result = CalculateSquare().surfaceCal(inputA).toString();
                      });
                      break;
                    case 1:
                      setState(() {
                        result = CalculateRRectangle()
                            .surfaceCal(inputA, inputB)
                            .toString();
                      });
                      break;
                    case 2:
                      setState(() {
                        result = CalculateParallelogram()
                            .surfaceCal(inputA, inputB, inputH)
                            .toString();
                      });
                      break;
                    case 3:
                      setState(() {
                        result = CalculateRhombus()
                            .surfaceCal(inputA, inputB, inputH)
                            .toString();
                      });
                      break;
                    default:
                      print('ERROR');
                  }
                },
                child: const Text('Surface area'),
              ),
              OutlinedButton(
                onPressed: () {
                  if (_selectedCategory == 0
                      ? !formKeyA.currentState!.validate()
                      : !formKeyA.currentState!.validate() ||
                          !formKeyB.currentState!.validate()) {
                    setState(() {
                      res = "Fill in the inputs";
                      result = 'ERROR';
                    });
                    return;
                  }
                  setState(() {
                    res = 'Diagonal';
                  });
                  late double inputA = double.tryParse(textA.text) ?? 0;
                  late double inputB = double.tryParse(textB.text) ?? 0;
                  late double inputH = double.tryParse(textH.text) ?? 0;

                  switch (_selectedCategory) {
                    case 0:
                      setState(() {
                        result = CalculateSquare().diagCal(inputA).toString();
                      });
                      break;
                    case 1:
                      setState(() {
                        result = CalculateRRectangle()
                            .diagCal(inputA, inputB)
                            .toString();
                      });
                      break;
                    case 2:
                      setState(() {
                        result = CalculateParallelogram()
                            .diagCal(inputA, inputB, inputH)
                            .toString();
                      });
                      break;
                    case 3:
                      setState(() {
                        result = CalculateRhombus()
                            .diagCal(inputA, inputB, inputH)
                            .toString();
                      });
                      break;
                    default:
                      print('ERROR');
                  }
                },
                child: const Text('Diagonal'),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: res != ''
                  ? Text(
                      "$res = $result $selectedForm",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  : null,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //ParallelogramContainer(width: double.tryParse(textA.text) ?? 20, height: double.tryParse(textB.text) ?? 20,),
          if (double.tryParse(textA.text) != null)
            ShowRecs(
              form: selectedForm,
              selectedCaty: _selectedCategory,
              width: double.tryParse(textA.text) ?? 20,
              height: double.tryParse(textB.text) ?? 20,
            ),
        ],
      ),
    );
  }
}
