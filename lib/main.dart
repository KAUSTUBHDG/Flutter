import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/counter_bloc.dart';

void main() {
  BlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final CounterInitial count = CounterInitial();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.blueGrey,
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final CounterBloc _bloc = BlocProvider.of<CounterBloc>(context);
    return SafeArea(
      child: BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
        if (state is CounterUpdate) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${state.count}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    _bloc.add(DecrementEvent(state.count));
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    _bloc.add(ResetEvent(state.count));
                  },
                  tooltip: 'Reset',
                  child: Icon(Icons.loop),
                ),
                FloatingActionButton(
                  onPressed: () {
                    _bloc.add(IncrementEvent(state.count));
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
          );
        }
        return Text('$state');
      }),
    );
  }
}
