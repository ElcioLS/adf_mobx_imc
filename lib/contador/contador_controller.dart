// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mobx/mobx.dart';

import '../model/full_name.dart';

class ContadorController {
  final _counter = Observable<int>(0, name: 'Counter Observable');

  final _fullName =
      Observable<FullName>(FullName(first: 'first', last: 'last'));

  late Action increment;
  late Computed _saudacaoComputed;

  ContadorController() {
    increment = Action(_incrementCounter);
    _saudacaoComputed =
        Computed(() => 'Olá ${_fullName.value.first}${_counter.value}');
  }

  int get counter => _counter.value;
  FullName get fullName => _fullName.value;

  String get saudacao => _saudacaoComputed.value;

  void _incrementCounter() {
    _counter.value++;

    print('antes');
    print(_fullName.value.hashCode);
    // Não fase deve fazer desse jeito:
    // _fullName.value.first = 'Elcio';
    // _fullName.value.last = 'Lopes';

    // Trocar isso
    // Opção 1 alterar por meio de ProtoType(copywith)
    // _fullName.value = FullName(first: 'Elcio', last: 'Lopes');
    //Por isso:
    _fullName.value = _fullName.value.copyWith(first: 'Elcio', last: 'Lopes');

    print(_fullName.value.hashCode);
  }
}
