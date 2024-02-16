import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petaraa_vender/model/usermodel.dart';

String baseurl = 'http://172.105.33.114:2023/api';

//temp
StateProvider<TextEditingController> optProvider =
    StateProvider((ref) => TextEditingController());

StateProvider<bool> useretypeProvider = StateProvider((ref) => false);

StateProvider<UserDetails> userdetailsProvider =
    StateProvider((ref) => UserDetails());
