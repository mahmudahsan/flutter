import 'dart:async';
import 'dart:math' as Math;

class RandomNumber {
  final StreamController _controller = StreamController<int>();
  int _count = Math.Random().nextInt(100);
  int times = 0;

  RandomNumber() {
    Timer.periodic(Duration(seconds: 1), (timer){
      _controller.sink.add(_count);
      _count = Math.Random().nextInt(100);
      times += 1;

      if (times > 5) {
        timer.cancel();
        _controller.sink.close();
      }
    });
  }

  Stream<int> get stream => _controller.stream;
}


void main() {
  final randomNumStream = RandomNumber().stream;

  final subscription = randomNumStream.listen(
    (data){
      print('Data: $data');
    },
    onError: (err) {
      print('Error: $err');
    },
    cancelOnError: false,
    onDone: (){
      print('Done');
    }
  );

  final broadCastRandomNumStream = RandomNumber().stream.asBroadcastStream();

  final sub1 = broadCastRandomNumStream.listen(printData);
  final sub2 = broadCastRandomNumStream.listen(printData);
}

void printData(data){
  print('Data: $data');
}