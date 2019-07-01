import 'package:bloc/bloc.dart';
import 'package:bloc_test/domains/contact/event.dart';
import 'package:bloc_test/domains/contact/service.dart';
import 'package:bloc_test/domains/contact/state.dart';
import 'package:bloc_test/domains/friend/model/friend_model.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {

  ContactBloc();

  @override
  ContactState get initialState => ContactUninitialized();

  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is FetchContactList) {
      ContactService client = ContactService();

      try {
        if (currentState is ContactUninitialized) {
          List<Person> contacts = await client.fetchContacts();

          yield ContactLoaded(friends: contacts);
        }
      } catch(e) {
        print(e);
        yield ContactLoadError();
      }
    }
  }

}