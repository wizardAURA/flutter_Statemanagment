import 'package:blockstate/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final counterCubit = CounterCubit();

  @override

  Widget build(BuildContext context) {


        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder(
                  bloc: counterCubit,
                  builder: (context,Counter) {
                    return Text(
                      '$Counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              counterCubit.increment();

            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
  }
}
