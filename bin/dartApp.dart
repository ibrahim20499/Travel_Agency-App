import 'dart:core';
import 'dart:io';
import 'package:dartApp/dartApp.dart' as dartApp;


class addTrip {
  int Id;
  String Location;
  int passengerLimit;
  String date;
  int price;
  int passengerID;
  String name;
  int number;
  int nationalID;
  String email;


  addTrip(this.Id, this.Location, this.passengerLimit, this.date, this.price);

  @override
  String showpassengerDetails() {
    return ' $passengerID     $name        $number             $nationalID       $email ';
  }
  String toString() {
    return 'Id:  $Id       Location: $Location        passengerLimit: $passengerLimit       date: $date        price: $price';
  }

  String showDate() {
    return ' $date     $Location        $passengerLimit             $price       $Id ';
  }


  List<addTrip> trips = new List();

  addTrip userInput() {
    bool again = true;
    do {
      print("                 *********************");
      print("                 Add a New Travel Trip");
      print("                 *********************");
      stdout.write("=> ID: ");
      int Id = int.parse(stdin.readLineSync());
      stdout.write("=> Location: ");
      String Location = stdin.readLineSync();
      stdout.write("=> passengerLimit: ");
      int passengerLimit = int.parse(stdin.readLineSync());
      stdout.write("=> Date: ");
      String date = stdin.readLineSync();
      stdout.write("=> Price: ");
      int price = int.parse(stdin.readLineSync());
      again = false;
      return addTrip(Id, Location, passengerLimit, date, price);
    } while (again == true);

  }
  addTrip pasengerInput() {
    bool again = true;
    do {
      print("                 **********");
      print("                 Book Trip");
      print("                 **********");
      stdout.write("=> Passenger_ID: ");
      int passengerID = int.parse(stdin.readLineSync());
      stdout.write("=> Name: ");
      String name = stdin.readLineSync();
      stdout.write("=> Number: ");
      int number = int.parse(stdin.readLineSync());
      stdout.write("=> E-mail: ");
      String email = stdin.readLineSync();
      stdout.write("=> National ID: ");
      int nationalID = int.parse(stdin.readLineSync());
      again = false;
      return addTrip(passengerID, name, number, email, nationalID);
    } while (again == true);
  }
  void disp() {
    var new_Trip = userInput();
    trips.add(new_Trip);
    print("        adding a new trip succeed..");
  }

  void view_Tripsl() {
    trips.forEach((element) {
      print("   Date      location     passengerLimit     price      id ");
      print(element.showDate());
    });
  }

  void deleteTrip() {
    stdout.write('=> Enter Trip ID  ');
    var id = int.parse(stdin.readLineSync());
    for (int i = 0; i < trips.length; i++) {
      if (trips[i].Id == id) {
        trips.removeAt(i);
        print("       .....Trip Deleted....");
      }
    }
  }

  void edit_Trip() {
    print(trips);
    stdout.write('=> Enter Trip ID: ');
    int id = int.parse(stdin.readLineSync());
    bool edit = false;
    int i = 0;

    print('      1. id        ');
    print('      2. location ');
    print('      3. passenger Limt      ');
    print('      4. date ');
    print('      5. price      ');
    int editNum;
    void ed(int Num) {
      switch (Num) {
        case 1:
          {
            stdout.write("=> ID: ");
            int Id = int.parse(stdin.readLineSync());
            trips[i].Id = Id;
          }
          break;
        case 2:
          {
            stdout.write("=> Location: ");
            String Location = stdin.readLineSync();
            trips[i].Location = Location;
          }
          break;
        case 3:
          {
            stdout.write("=> passengerLimit: ");
            int passengerLimit = int.parse(stdin.readLineSync());
            trips[i].passengerLimit = passengerLimit;
          }
          break;
        case 4:
          {
            stdout.write("=> Date: ");
            String date = stdin.readLineSync();
            trips[i].date = date;
          }
          break;
        case 5:
          {
            stdout.write("=> Price: ");
            int price = int.parse(stdin.readLineSync());
            trips[i].price = price;
          }
          break;
      }
    }

    for (i; i < trips.length; i++) {
      if (trips[i].Id == id) {
        stdout.write('=> choose number to edit');
        editNum = int.parse(stdin.readLineSync());
        edit =true;
        break;
      }
    }
    ed(editNum);

  }


  void search_Trip() {
    var cond = true;
    int price;
    do {
      stdout.write('=> Price: ');
      price = int.parse(stdin.readLineSync());
      for (int i = 0; i < trips.length; i++) {
        if (trips[i].price == price) {
          print(trips[i]);
        }
      }
      cond = false;
    } while (cond == true);



  }

  void reverse_Trip() {
    print(trips);
    bool cdt = true;
    int id;
    do {
      try {
        stdout.write('=> Enter ID of Trip ');
        id = int.parse(stdin.readLineSync());
        cdt = false;
      } catch (e) {
        print('There is no Trip with this Id');
      }
    } while (cdt == true);

      show();

    bool reserve = false;
    int i = 0;
    for (i; i < trips.length; i++) {
      if (trips[i].Id == id) {
        print(trips[i]);
        reserve = true;
        break;
      }
    }
    if (reserve) {
      if (trips[i].passengerLimit < 20) {
        trips[i].passengerLimit = trips[i].passengerLimit + 1;
        print('....Booking Succeed....');
        passengerLimit--;
        trips[i].price = trip_Discount(trips[i]) ;
      }
    }

  }

  void view_Passenger() {
    print("-------------------------------------------------------------");
    print(trips);
    print("-------------------------------------------------------------");
    bool cdt = true;
    var id;
    do {
        stdout.write('=> enter Trip ID: ');
        id = stdin.readLineSync();
        for (int i = 0; i < trips.length; i++) {
          if (trips[i].Id == id) {
            //view_pass();
          }
      }
        cdt = false;
    } while (cdt == true);
  }

  int show() {
    var pass = pasengerInput();
    trips.add(pass);
  }

  void view_pass() {
    trips.forEach((element) {
      print("     E-mail       Name      Number     National_ID      Passenger-ID ");
      print(element.showDate());
    });
  }

  int trip_Discount(addTrip tripDiscount) {
    if (tripDiscount.price > 10000) {
      double x =tripDiscount.price - tripDiscount.price * (20 / 100);
      int y=x.toInt();
      int newPrice = (y);
      return newPrice;
    } else {
      return tripDiscount.price ;
    }
  }
  void latest_Trips() {
      for (int i = trips.length ; i > trips.length -10; i--) {
        print(trips[i]);
      }
  }

}

Future<void> main(List<String> arguments) async {
  addTrip add = new addTrip(1, "dd", 5, "55", 56);
  void fir(){
  print('      --------------------------------------------');
  stdout.write('      1. Add Trip        ');
  print('       2. Edit Trip ');
  stdout.write('      3. Delete Trip      ');
  print('      4. View Trip() ');
  stdout.write('      5. Search Trip      ');
  print('      6. Reverse ');
  stdout.write('      7. Latest Trip      ');
  print('      8. View Passenger ');
  print('      --------------------------------------------');
  }
  void disp(int funNum) {
    if (funNum == 1) {
      add.disp();
      stdout.write("=> Do you want to add another Trip y/n: ");
    } else if (funNum == 2) {
      add.edit_Trip();
      stdout.write("Do you want to edit another Trip y/n: ");
    } else if (funNum == 3) {
      add.deleteTrip();
      stdout.write("Do you want to delete another Trip y/n: ");
    } else if (funNum == 4) {
      add.view_Tripsl();
      stdout.write("Do you want to view another Trip y/n: ");
    } else if (funNum == 5) {
      add.search_Trip();
      stdout.write("Do you want to search about another Trip y/n: ");
    } else if (funNum == 6) {
      add.reverse_Trip();
      stdout.write("Do you want to reverse another Trip y/n: ");
    }else if (funNum == 7) {
      add.latest_Trips();
      stdout.write("Do you want to view another latest Trips y/n: ");
    } else if (funNum == 8) {
      add.view_Passenger();
      add.view_pass();
      stdout.write("do you want to show another passenger y/n: ");
    }
  }
  void cont(int co){
    for(int i=1; i<20;i++){
      String c = stdin.readLineSync();
    if (c == "y") {
      add.disp();
    }else {
      fir() ;
      stdout.write("=> choose an option: ");
      int num = int.parse(stdin.readLineSync());
      disp(num);
    }
      }
  }
  var again=true;
  int num;
  fir();
  while (again==true){
    stdout.write('=> Choose an option ');
    num = int.parse(stdin.readLineSync());
    again = false;
  }
  disp(num);
  again=true;
  cont(num);
}
