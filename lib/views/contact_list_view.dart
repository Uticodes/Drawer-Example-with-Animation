import 'dart:developer';

import '../data/contact_data.dart';
import '../views/contact_detail_view.dart';
import '../presenter/contact_list_presenter.dart';
import '../widgets/drawer.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  static const String routeName = '/contacts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("Contacts"),
        ),
        body: ContactList());
  }
}

///
///   Contact List
///

class ContactList extends StatefulWidget {
  ContactList({Key key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList>
    implements ContactListViewContract {
  ContactListPresenter _presenter;

  List<Contact> _contacts;

  bool _isSearching;

  _ContactListState() {
    _presenter = ContactListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isSearching = true;
    _presenter.loadContacts();
  }

  @override
  void onLoadContactsComplete(List<Contact> items) {
    setState(() {
      _contacts = items;
      _isSearching = false;
      print("finish loading: $_contacts");
    });
  }

  @override
  void onLoadContactsError() {
    // TODO: implement onLoadContactsError

    print("error loading: $_contacts");
  }

  @override
  Widget build(BuildContext context) {
    var widget;

    if (_isSearching) {
      widget = Center(
          child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: CircularProgressIndicator()));
      print("Searching loading: ");
    } else {
      widget = ListView(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          children: _buildContactList());
      print("Showing: ");
    }

    return widget;
  }

  List<_ContactListItem> _buildContactList() {
    return _contacts
        .map((contact) => new _ContactListItem(
            contact: contact,
            onTap: () {
              _showContactPage(context, contact);
            }))
        .toList();
  }

  void _showContactPage(BuildContext context, Contact contact) {
    Navigator.push(
        context,
        new MaterialPageRoute<Null>(
            settings: const RouteSettings(name: ContactPage.routeName),
            builder: (BuildContext context) => new ContactPage(contact)));
  }
}

///
///   Contact List Item
///

class _ContactListItem extends ListTile {
  _ContactListItem(
      {@required Contact contact, @required GestureTapCallback onTap})
      : super(
            title: Text(contact.fullName),
            subtitle: Text(contact.email),
            leading: CircleAvatar(child: Text(contact.fullName[0])),
            onTap: onTap);
}
