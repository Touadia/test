import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_model.dart';
import 'second.dart';

class Tutopage extends StatefulWidget {
  const Tutopage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Tutopage> createState() => _TutopageState();
}

class _TutopageState extends State<Tutopage> {
  final MainModel _model = MainModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _model,
      child: Consumer<MainModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${model.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ok(
                          model: _model,
                        ),
                      ),
                    );
                  },
                  child: const Text('Go to second page'),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => model.counter++,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}


// class Tutopage extends StatefulWidget {
//   const Tutopage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<Tutopage> createState() => _TutopageState();
// }

// class _TutopageState extends State<Tutopage> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => MainModel(),
//       child: Consumer<MainModel>(
//         builder: (context, model, child) => Scaffold(
//           appBar: AppBar(
//             title: Text(widget.title),
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'You have pushed the button this many times:',
//                 ),
//                 Text(
//                   '${model.counter}',
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SecondPage(),
//                       ),
//                     );
//                   },
//                   child: const Text('Go to Second Page'),
//                 ),
//               ],
//             ),
//           ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: () => model.counter++,
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//         ),
//       ),
//     );
//   }
// }
