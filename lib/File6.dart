import 'package:flutter/material.dart';

class File6 extends StatefulWidget {
  const File6({super.key});

  @override
  State<File6> createState() => _File6State();
}

class _File6State extends State<File6> {
  TextEditingController ctrl = TextEditingController();

  List<int> numbers = [];

  air() {
    numbers.sort();
    print(numbers);
    showDialog(context: context,
        builder: (context)
    {
      return AlertDialog(
        content: Text('Ascending Order is :$numbers'),
      );
    });
  }



  qwe() {
    List<int> descending = [...numbers]..sort((a, b) => b - a);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Descending Order"),
          content: Text('Descending Order is: $descending'),
        );
      },
    );
  }

  void _showDialog (String title, String message) {
    showDialog(context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(onPressed: () =>
              Navigator.pop(context),
                child: Text("Ok"),
            ),
          ],
        ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        title: Center(child: Text("Home")),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text("Enter a number"),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Center(
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: (){
                    if(ctrl.text.isNotEmpty) {
                      setState(() {
                        numbers.add(int.parse(ctrl.text));
                        ctrl.clear();
                      });
                    }
                  },
                      child: Text("OK"),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (numbers.isNotEmpty) {
                        int minValue =
                        numbers.reduce((a, b) => a < b ? a : b);
                        _showDialog("Minimum Value",
                            "The minimum value is: $minValue");
                      }
                    },
                    child: const Text("Mini"),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (numbers.isNotEmpty) {
                        int maxValue =
                        numbers.reduce((a, b) => a > b ? a : b);
                        _showDialog("Maximum Value",
                            "The maximum value is: $maxValue");
                      }
                    },
                    child: const Text("Max"),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(onPressed: (){
                    air();
                  },
                      child: Text("ascending"),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(onPressed: (){
                    qwe();
                  },
                      child: Text("Descending"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(numbers[index].toString(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

