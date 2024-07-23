import 'dart:convert';
import 'package:active_app/core/services/services.dart';
import 'package:active_app/data/models/account_model.dart';
import 'package:get/get.dart';

class JsonManager {
  static const String _accountsKey = 'accounts';

  MyServices services = Get.find();
  // Save accounts to shared pr eferences
   Future<void> saveAccounts(List<Account> accounts) async {
    final String encodedData = jsonEncode(accounts.map((e) => e.toJson()).toList());
    await services.sharedPreferences.setString(_accountsKey, encodedData);
  }

  // Retrieve accounts from shared preferences
   Future<List<Account>> getAccounts() async {
    final String? encodedData = services.sharedPreferences.getString(_accountsKey);
    if (encodedData != null) {
      final List<dynamic> decodedData = jsonDecode(encodedData);
      return decodedData.map((e) => Account.fromJson(e)).toList();
    }
    return [];
  }

  // Add a new account to shared preferences
   Future<void> addAccount(Account account) async {
    List<Account> accounts = await getAccounts();
    accounts.add(account);
    await saveAccounts(accounts);
  }

  // Remove an account from shared preferences
   Future<void> removeAccount(String id) async {
    List<Account> accounts = await getAccounts();
    accounts.removeWhere((account) => account.id == id);
    await saveAccounts(accounts);
  }
}