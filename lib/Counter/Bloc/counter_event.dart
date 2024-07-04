sealed class CounterEvent{}  //abstract class can be used

final class CounterIncremented extends CounterEvent{}
final class CounterDecremented extends CounterEvent{}