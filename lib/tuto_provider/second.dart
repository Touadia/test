import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_model.dart';

// class SecondPage extends StatelessWidget {
//   const SecondPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => MainModel(),
//       child: Consumer<MainModel>(
//         builder: (context, model, child) => Scaffold(
//           appBar: AppBar(
//             title: const Text('Second Page'),
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 const Text(
//                   'You are on the second page and the counter is:',
//                 ),
//                 Text(
//                   '${model.counter}',
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Consumer<MainModel>(
          builder: (context, model, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You are on the second page and the counter is:',
              ),
              Text(
                '${model.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Consumer<MainModel>(
        builder: (context, model, child) => FloatingActionButton(
          onPressed: () => model.counter--,
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
      ),
    );
  }
}

class Ok extends StatelessWidget {
  final MainModel model;

  const Ok({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You are on the second page and the counter is:',
            ),
            Text(
              '${model.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => model.counter--,
        tooltip: 'Increment',
        child: const Icon(Icons.remove),
      ),
    );
  }
}
