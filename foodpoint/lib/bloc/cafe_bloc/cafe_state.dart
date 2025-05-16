abstract class CafeState {}

class CafeInitial extends CafeState {}

class CafeLoading extends CafeState {}

class CafeLoaded extends CafeState {
  final List<String> cafes;
  CafeLoaded(this.cafes);
}

class CafeError extends CafeState {
  final String message;
  CafeError(this.message);
}
