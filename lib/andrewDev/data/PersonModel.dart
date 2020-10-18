import 'package:floor/floor.dart';

@Entity(tableName: 'person')
class Person {
  @PrimaryKey(autoGenerate: true)
  int id;
  final String ssn;
  final String name;
  @ColumnInfo(name: 'committee_number', nullable: false)
  String committeeNumber;
  @ColumnInfo(name: 'committee_address', nullable: false)
  String committeeAddress;
  @ColumnInfo(name: 'committee_details', nullable: false)
  String committeeDetail;

  Person(this.ssn, this.name, this.committeeNumber, this.committeeAddress,
      this.committeeDetail);
}
