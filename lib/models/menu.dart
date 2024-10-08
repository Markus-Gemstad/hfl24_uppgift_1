import 'package:uppgift_1/screens/person_sceen.dart';
import 'package:uppgift_1/screens/vehicle_sceen.dart';

List<MenuItem> menu = [
  MenuItem('Personer', subMenu: [
    MenuItem('Skapa ny person', screenFunction: screenAddPerson),
    MenuItem('Visa alla personer', screenFunction: screenShowAllPersons),
    MenuItem('Uppdatera person', screenFunction: screenUpdatePerson),
    MenuItem('Ta bort person', screenFunction: screenDeletePerson),
    MenuItem('Gå tillbaka till huvudmenyn', doBack: true),
  ]),
  MenuItem('Fordon', subMenu: [
    MenuItem('Skapa nytt fordon', screenFunction: screenAddVehicle),
    MenuItem('Visa alla fordon', screenFunction: screenShowAllVehicles),
    MenuItem('Uppdatera fordon', screenFunction: screenUpdateVehicle),
    MenuItem('Ta bort fordon', screenFunction: screenDeleteVehicle),
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
  Function? screenFunction;
  List<MenuItem>? subMenu;
  bool doExit;
  bool doBack;

  MenuItem(this.name,
      {this.screenFunction,
      this.subMenu,
      this.doExit = false,
      this.doBack = false});
}
