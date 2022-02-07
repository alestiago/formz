// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/widgets.dart';
import 'package:flutter_contacts/bootstrap.dart';
import 'package:local_storage_contacts_api/local_storage_contacts_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final contactsApi = LocalStorageContactsApi(
    plugin: await SharedPreferences.getInstance(),
  );

  await bootstrap(contactsApi: contactsApi);
}
