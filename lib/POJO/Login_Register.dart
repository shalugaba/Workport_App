
class Login_Register{

  late String sess_id;
  late int Otp;
  late int statusCode;
  late List<Data>data;

  Login_Register(

      this.sess_id,
      this.Otp,
      this.statusCode,
      this.data

      );

}

class Data {

  String? id;
  String? first_name;
  String? last_name;
  String? email;
  String? profile_pic;
  String? country_code;
  String? mobile_number;
  String? home_street;
  String? home_city;
  String? home_state;
  String? home_country;
  String? home_zipcode;
  String? office_street;
  String? office_city;
  String? office_state;
  String? office_country;
  String? office_zipcode;
  String? other_street;
  String? other_city;
  String? other_state;
  String? other_country;
  String? other_zipcode;

  Data(
      this.id,
      this.first_name,
      this.last_name,
      this.email,
      this.profile_pic,
      this.country_code,
      this.mobile_number,
      this.home_street,
      this.home_city,
      this.home_state,
      this.home_country,
      this.home_zipcode,
      this.office_street,
      this.office_city,
      this.office_state,
      this.office_country,
      this.office_zipcode,
      this.other_street,
      this.other_city,
      this.other_state,
      this.other_country,
      this.other_zipcode);

}