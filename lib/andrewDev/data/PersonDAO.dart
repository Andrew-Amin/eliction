import 'package:elections/andrewDev/data/PersonModel.dart';
import 'package:floor/floor.dart';

@dao
abstract class PersonDao {
  @Query('select * from person where ssn = :ssn')
  Future<Person> getUserBySsn(String ssn);

  @Query('select * from person where ssn = :name')
  Future<Person> getUserByName(String name);

  @Query('select * from person')
  Future<List<Person>> getAll();

  @insert
  Future<void> insertPerson(Person person);
}
