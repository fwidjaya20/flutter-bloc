import 'package:bloc/bloc.dart';
import 'package:bloc_test/domains/friend/model/friend_model.dart';
import 'package:bloc_test/domains/request/event.dart';
import 'package:bloc_test/domains/request/service.dart';
import 'package:bloc_test/domains/request/state.dart';

class FriendRequestBloc extends Bloc<FriendRequestEvent, FriendRequestState> {

  FriendRequestBloc();

  @override
  FriendRequestState get initialState => FriendRequestUninitialized();

  @override
  Stream<FriendRequestState> mapEventToState(FriendRequestEvent event) async* {
    if (event is FetchFriendRequestedList) {
      RequestService _service = RequestService();

      try {
        if (currentState is FriendRequestUninitialized) {
          List<Person> persons = await _service.fetchFriendRequests();

          yield FriendRequestLoaded(requests: persons);
        }
      } catch(e) {
        print(e);
        yield FriendRequestLoadError();
      }
    }
  }

}