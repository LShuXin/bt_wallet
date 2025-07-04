import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart' as g;
import 'package:mockito/mockito.dart';
import 'package:optional/optional.dart';
import 'package:bt_wallet/common/http/http_client.dart';
import 'package:bt_wallet/models/contract.dart';
import 'package:bt_wallet/models/transaction.dart';
import 'package:bt_wallet/models/tw_balance.dart';
import 'package:bt_wallet/service/api_provider.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  g.Get.put<HttpClient>(MockHttpClient());

  final HttpClient _httpClient = g.Get.find();
  final ApiProvider _apiProvider = ApiProvider();
  const address = '0xed9d02e382b34818e88B88a309c7fe71E65f419d';

  test('Return a Contract Instance', () async {
    const _contractName = 'test-name';
    when(
      _httpClient.get(
        '/v1/contracts/$_contractName',
        loading: false,
        throwError: true,
      ),
    ).thenAnswer(
      (_) async => Optional.of(
        Response(
          statusCode: 200,
          data: {
            'code': 200,
            'msg': 'OK',
            'result': {
              'name': _contractName,
              'address': 'address',
              'abi': 'abi'
            }
          },
          requestOptions: RequestOptions(path: ''),
        ),
      ),
    );

    expect(
      await _apiProvider.fetchContractAbiV1(contractName: _contractName),
      isA<Optional<Contract>>(),
    );
  });

  test('Return a TwBalance Instance', () async {
    const url = '/v1/token/$address';
    when(_httpClient.get(url, loading: false)).thenAnswer(
      (_) async => Optional.of(
        Response(
          statusCode: 200,
          data: {
            'code': 200,
            'msg': 'SUCCESS',
            'result': {
              'balance': '10000000000000000000000',
              'twpoint': {
                'name': 'TWPointERC20Token',
                'symbol': 'TWP',
                'decimal': 18
              }
            }
          },
          requestOptions: RequestOptions(path: ''),
        ),
      ),
    );

    expect(
      await _apiProvider.fetchPointV1(address: address, withLoading: false),
      isA<Optional<TwBalance>>(),
    );
  });

  test('Return a List Of Transactions Instances', () async {
    const url = '/v1/transactions?from_addr=$address';
    when(_httpClient.get(url, throwError: true)).thenAnswer(
      (_) async => Optional.of(
        Response(
          statusCode: 200,
          data: {
            'code': 200,
            'msg': 'SUCCESS',
            'result': [
              {
                "hash":
                    "0x454971ef7eb2377ce00ca2686ab4f6c752e1a437ecf6edb363fff0ca0471ca92",
                "tx_type": "Transfer",
                "amount": "2000000000000000000",
                "create_time": "2020-04-24 06:47:18",
                "from_address": "0x55e9f09e71e33adce530c888f3e1f303bc257248",
                "to_address": "0xc2583ac729840311e32fac95f0fc9076b302f94f",
              }
            ]
          },
          requestOptions: RequestOptions(path: ''),
        ),
      ),
    );

    expect(
      await _apiProvider.fetchTxList(address),
      isA<Optional<List<Transaction>>>(),
    );
  });

  test('Return a Transactions Instance', () async {
    const txHash =
        '0x13232ba90547279d00b30511ba4ca6c6f4ad08f27c22d75872d60c16fabd6ee5';
    const url = '/v1/transactions/$txHash';
    when(_httpClient.get(url)).thenAnswer(
      (_) async => Optional.of(
        Response(
          statusCode: 200,
          data: {
            'code': 200,
            'msg': 'SUCCESS',
            'result': {
              "hash":
                  "0x454971ef7eb2377ce00ca2686ab4f6c752e1a437ecf6edb363fff0ca0471ca92",
              "tx_type": "Transfer",
              "amount": "2000000000000000000",
              "create_time": "2020-04-24 06:47:18",
              "from_address": "0x55e9f09e71e33adce530c888f3e1f303bc257248",
              "to_address": "0xc2583ac729840311e32fac95f0fc9076b302f94f",
            }
          },
          requestOptions: RequestOptions(path: ''),
        ),
      ),
    );

    expect(
      await _apiProvider.fetchTxDetails(txHash: txHash),
      isA<Optional<Transaction>>(),
    );
  });

  test(
      'When send a health certificate request, should be return a HealthCertification instance',
      () async {
    const String phone = '13888888888';
    const String did = '123456789';
    const double temperature = 37.1;
    const String contact = 'Yes';
    const String symptoms = 'No';

    when(
      _httpClient.post('/v1/health-certifications', {
        'did': did,
        'phone': phone,
        'temperature': temperature,
        'contact': contact,
        "symptoms": symptoms
      }),
    ).thenAnswer(
      (_) async => Optional.of(
        Response(
          statusCode: 200,
          data: {
            'code': 200,
            'msg': 'SUCCESS',
            'result': {
              'token':
                  'eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IkRJRDpUVzoybVBYaFAyQVY3MkM0NE1jcUN6djg1R05HTnJFUXVDc0F5a3pkRHZTIiwidmVyIjoiMC4xIiwiaXNzIjoiRElEOlRXOmNBODQzNTY5ZTM0MjcxNDRjRWFkNWU0ZDU5OTlhM0QwY0NGOTJCOGUiLCJpYXQiOjE1OTAwNDU4NjksImV4cCI6MTU5MDA0NjE2OSwidHlwIjpbIkhlYWx0aHlDcmVkZW50aWFsIl0sInN1YiI6eyJpZCI6IkRJRDpUVzo3MjY3NjJlNTM5OGJjOTgzMjYzYTQ5RUNkMTM4MjI1RjIyOTFjNTBDIiwicGhvbmUiOiIxMzgwMDAwMDAwMSIsInRlbXBlcmF0dXJlIjozNy4wLCJjb250YWN0IjoiTk8iLCJzeW1wdG9tcyI6Ik5PIiwiaGVhbHRoeVN0YXR1cyI6eyJ0eXAiOiJIZWFsdGh5U3RhdHVzIiwidmFsIjoiaGVhbHRoeSJ9fSwiQGNvbnRleHQiOlsiaHR0cHM6Ly9ibG9ja2NoYWluLnRob3VnaHR3b3Jrcy5jbi9jcmVkZW50aWFscy92MS8iXX0=.MDFjNTE0MTBhMWRhMTViNTM1ZDE2ZGY3NDEzZDJlMjY5ODM5N2VlN2Q5NTcxNjBjYTk1MGZjMjY4YTkwYzgxNzI3MmE4MDUyN2Y5YTc2Yjg1OTY3ZDM4ZjYzY2Y3ZGNmYjExNmQyOTdjNjc5Yzk2MGRhMjRiYWZlYmQ5YTBkOWVlYQ=='
            }
          },
          requestOptions: RequestOptions(path: ''),
        ),
      ),
    );

  });
}
