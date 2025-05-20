import 'package:mysql1/mysql1.dart';

class DatabaseService {
  static Future<MySqlConnection> connect() async {
    final settings = ConnectionSettings(
      host: '10.228.1.73', // Example: '127.0.0.1'
      port: 3306,
      user: 'dev_flutter', // Example: 'root'
      password: 'Dev_flutter@12321',
      db: 'fluttertestwbl',
    );
    return await MySqlConnection.connect(settings);
  }
}
