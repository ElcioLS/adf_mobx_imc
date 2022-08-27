import 'package:mobx/mobx.dart';

part 'future_controller.g.dart';

class FutureController = FutureControllerBase with _$FutureController;

abstract class FutureControllerBase with Store {
  @observable
  // ObsevableFuture nomeFuture = ObservableFuture(Future.value()); //jeito incorreto
  var nomeFuture = Future.value('').asObservable();

  Future<void> buscarNome() async {
    nomeFuture = Future.delayed(const Duration(seconds: 2), () => 'Elcinho')
        .asObservable();
    // return 'Elcinho';
  }
}
