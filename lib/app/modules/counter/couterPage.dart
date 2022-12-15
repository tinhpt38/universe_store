import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:universe_store/app/modules/counter/counterSteamStore.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key, required this.title});
  final String title;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final store = CounterStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScopedBuilder<CounterStore, Exception, int>(
        store: store,
        onState: (context, state) {
          return Center(
              child: Text(
            ' $state',
            style: const TextStyle(fontSize: 24),
          ));
        },
        onError: (context, error) => Center(child: Text(error.toString())),
        onLoading: (context) =>
            const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
