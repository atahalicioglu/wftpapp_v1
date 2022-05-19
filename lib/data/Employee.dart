class Employee {
  final String checkpoint;
  final String username;
  final String password;
  final String Name;
  final String Surname;
  final String Nationality;
  final String duty;
  final String BirthDate;
  final String BirthCity;
  final String PersonalNumber;
  final String WorkType;
  final String BSNnumber;
  final String CompanyName;
  final String TelNumber;
  final String Email;
  final bool DVP;
  final String DVPdate;
  final bool METRO;
  final bool TRAM;
  final String VCAnumber;
  final String VCAdate;
  final String GPI;
  final String GPIdate;
  final bool BHV;

  Employee(this.checkpoint,this.username, this.password, this.Name, this.Surname, this.Nationality, this.duty, this.BirthDate, this.BirthCity,
      this.PersonalNumber, this.WorkType, this.BSNnumber, this.CompanyName, this.TelNumber, this.Email, this.DVP,
      this.DVPdate, this.METRO, this.TRAM, this.VCAnumber, this.VCAdate, this.GPI, this.GPIdate, this.BHV);

  Employee.fromJson(Map<dynamic, dynamic> json):
        checkpoint =json["checkpoint"] as String,
        username = json['username'] as String,
        password = json['password'] as String,
        Name = json["Name"] as String,
        Surname = json["Surame"] as String,
        Nationality = json["Nationality"] as String,
        duty = json['duty'] as String,
        BirthDate = json["BirthDate"] as String,
        BirthCity = json["BirthCity"] as String,
        PersonalNumber = json['PersonalNumber'] as String,
        WorkType = json['WorkType'] as String,
        BSNnumber = json['BSNnumber'] as String,
        CompanyName = json['CompanyName'] as String,
        TelNumber = json['TelNumber'] as String,
        Email = json['Email'] as String,
        DVP = json['DVP'] as bool,
        DVPdate = json['DVPdate'] as String,
        METRO = json['METRO'] as bool,
        TRAM = json['TRAM'] as bool,
        VCAnumber = json['VCAnumber'] as String,
        VCAdate = json['VCAdate'] as String,
        GPI = json['GPI'] as String,
        GPIdate = json['GPIdate'] as String,
        BHV = json['BHV'] as bool;


  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'checkpoint' : checkpoint,
    'password' : password,
    'username': username,
    'Name' : Name,
    'Surname' : Surname,
    'Nationality' : Nationality,
    'duty' : duty,
    'BirthDate' : BirthDate,
    'BirthCity' : BirthCity,
    'PersonalNumber' : PersonalNumber,
    'WorkType' : WorkType,
    'BSNnumber' : BSNnumber,
    'CompanyName' : CompanyName,
    'TelNumber' : TelNumber,
    'Email' : Email,
    'DVP' : DVP,
    'DVPdate' : DVPdate,
    'METRO' : METRO,
    'TRAM' : TRAM,
    'VCAnumber' : VCAnumber,
    'VCAdate' : VCAdate,
    'GPI' : GPI,
    'GPIdate' : GPIdate,
    'BHV' : BHV,
  };

  String getUsername(){
    return this.username;
  }

}