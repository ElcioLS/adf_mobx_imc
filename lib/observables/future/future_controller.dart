import 'package:mobx/mobx.dart';

part 'future_controller.g.dart';

class FutureController = FutureControllerBase with _$FutureController;

abstract class FutureControllerBase with Store {
  @observable
  // ObsevableFuture nomeFuture = ObservableFuture(Future.value()); //jeito incorreto
  // var nomeFuture = Future.value('').asObservable();
  var nomeFuture = ObservableFuture.value('');

  Future<void> buscarNome() async {
    final buscaNomeFuture =
        Future.delayed(const Duration(seconds: 2), () => 'Elcinho');
    // nomeFuture = buscaNomeFuture.asObservable(); //pode ser assim
    nomeFuture = ObservableFuture(buscaNomeFuture); //assim fica mais simples
  }
}
