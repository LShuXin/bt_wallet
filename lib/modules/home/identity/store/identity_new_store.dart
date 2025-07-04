import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
import 'package:validators/validators.dart';

import 'package:bt_wallet/common/util/format.dart';
import 'package:bt_wallet/models/identity/decentralized_identity.dart';
import 'package:bt_wallet/store/identity_store.dart';
import 'package:bt_wallet/store/mnemonics.dart';
import '../../home/helper.dart';

part 'identity_new_store.g.dart';

class NewIdentityStoreStore = _NewIdentityStoreStore with _$NewIdentityStoreStore;

abstract class _NewIdentityStoreStore with Store {
  final FormErrorState error = FormErrorState();
  final IdentityStore _identityStore = Get.find();

  @observable
  String name = '';

  @observable
  String phone = '';

  @observable
  String email = '';

  @observable
  String birthday = '';

  List<ReactionDisposer>? _disposers;

  void setErrorResetDispatchers() {
    _disposers = [
      reaction((_) => name, resetNameError),
      reaction((_) => phone, resetPhoneError),
      reaction((_) => email, resetEmailError),
      reaction((_) => birthday, resetBirthdayError),
    ];
  }

  void dispose() {
    for (final d in _disposers!) {
      d();
    }
  }

  void validateAll() {
    validateUsername(name);
    validatePhone(phone);
    validateEmail(email);
    validateBirthday(birthday);
  }

  @action
  void clearError() {
    error.username = null;
    error.phone = null;
    error.email = null;
    error.birthday = null;
  }

  @action
  void resetNameError(String value) {
    error.username = null;
  }

  @action
  void resetPhoneError(String value) {
    error.phone = null;
  }

  @action
  void resetEmailError(String value) {
    error.email = null;
  }

  @action
  void resetBirthdayError(String value) {
    error.birthday = null;
  }

  void validateUsername(String value) {
    if (isNull(value) || value.isEmpty) {
      error.username = '不能为空';
    } else if (_identityStore.identities
        .any((identity) => identity.profileInfo.name == value)) {
      error.username = '此名称已存在';
    } else {
      error.username = null;
    }
  }

  void validatePhone(String value) {
    error.phone = value.isNotEmpty
        ? Util.isValidPhone(phone)
            ? null
            : '不是有效的手机号'
        : null;
  }

  void validateEmail(String value) {
    error.email = value.isNotEmpty
        ? isEmail(value)
            ? null
            : '不是有效的电子邮件'
        : null;
  }

  void validateBirthday(String value) {
    error.birthday = value.isNotEmpty
        ? isValidDate(value)
            ? null
            : '不是有效的日期'
        : null;
  }

  @action
  Future<dynamic> addIdentity() async {
    final MnemonicsStore store = Get.find();

    if (!error.hasErrors) {
      return store.generateKeys(
        (index, keys) => Future.value(
          DecentralizedIdentity(
            (identity) => identity
              ..id = const Uuid().v1()
              ..profileInfo.name = name
              ..accountInfo.index = index
              ..accountInfo.pubKey = keys.item1
              ..accountInfo.priKey = keys.item2
              ..profileInfo.phone = phone
              ..profileInfo.email = email
              ..profileInfo.birthday = birthday,
          ),
        ).then((identity) {
          return identity.register();
        }),
      );
    }
    return false;
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? username;

  @observable
  String? phone;

  @observable
  String? email;

  @observable
  String? birthday;

  @computed
  bool get hasErrors =>
      username != null || phone != null || email != null || birthday != null;
}
