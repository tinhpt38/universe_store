import 'package:flutter_triple/flutter_triple.dart';

class CounterStore extends StreamStore<Exception, int> {
  CounterStore() : super(0);


  Future increment() async{
     setLoading(true);

    await Future.delayed(const Duration(milliseconds: 300));

    update(state + 1);

    setLoading(false);
    setError(Exception('Some things went wrong'));
  }
}

