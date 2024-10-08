import 'package:uppgift_1/screens/person_sceen.dart';

List<MenuItem> menu = [
  MenuItem('Personer', subMenu: [
    MenuItem('Skapa ny person', displayFunction: displayAddPerson),
    MenuItem('Visa alla personer', displayFunction: displayShowAllPersons),
    MenuItem('Uppdatera person'),
    MenuItem('Ta bort person'),
    MenuItem('Gå tillbaka till huvudmenyn', doBack: true),
  ]),
  MenuItem('Fordon', subMenu: [
    MenuItem('Skapa nytt fordon'),
    MenuItem('Visa alla fordon'),
    MenuItem('Uppdatera fordon'),
    MenuItem('Ta bort fordon'),
    MenuItem('Gå tillbaka till huvudmenyn', doBack: true),
  ]),
  MenuItem('Parkeringsplatser', subMenu: [
    MenuItem('Skapa ny parkeringsplats'),
    MenuItem('Visa alla parkeringsplatser'),
    MenuItem('Uppdatera parkeringsplats'),
    MenuItem('Ta bort parkeringsplats'),
    MenuItem('Gå tillbaka till huvudmenyn', doBack: true),
  ]),
  MenuItem('Parkeringar', subMenu: [
    MenuItem('Skapa ny parkering'),
    MenuItem('Visa alla parkeringar'),
    MenuItem('Uppdatera parkering'),
    MenuItem('Ta bort parkering'),
    MenuItem('Gå tillbaka till huvudmenyn', doBack: true),
  ]),
  MenuItem('Avsluta', doExit: true),
];

class MenuItem {
  String name;
  Function? displayFunction;
  List<MenuItem>? subMenu;
  bool doExit;
  bool doBack;

  MenuItem(this.name,
      {this.displayFunction,
      this.subMenu,
      this.doExit = false,
      this.doBack = false});
}
