import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' show Client;
import 'package:optional/optional.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

import 'package:bt_wallet/common/application.dart';
import 'package:bt_wallet/service/api_provider.dart';
import 'package:bt_wallet/service/blockchain_service.dart';

/// Defines a maximum gas limit for Ethereum-compatible blockchain transactions
const int maxGas = 300000;

const List<String> contractsOnChain = ['BTToken', 'DIDRegistry', 'BTNFT'];

/// This class acts as a service layer for accessing specific smart contracts by name
class ContractService {
  const ContractService(this.contracts);

  final Map<String, Contract?> contracts;

  Contract? get tokenContract => contracts[contractsOnChain[0]];

  Contract? get identitiesContract => contracts[contractsOnChain[1]];

  Contract? get nftTokenContract => contracts[contractsOnChain[2]];

  /// Loads contract data asynchronously from an API or bundle
  static Future<ContractService> init({ bool fromApi = false}) async {
    final Map<String, Contract> contracts = {};
    final runner = fromApi ? Contract.fromApi : Contract.fromBundle;
    for (final name in contractsOnChain) {
      (await runner(name)).ifPresent((contract) => contracts[name] = contract);
    }
    return ContractService(contracts);
  }
}

class Contract {
  Contract(this.contract);

  final DeployedContract contract;

  final Web3Client web3Client = Web3Client(Application.globalEnv.web3RpcGatewayUrl, Client());

  /// Loads contract ABI and deployment details from a local JSON asset and constructs a [Contract] object.
  ///
  /// This static method reads the contract information from a JSON file located in the app’s assets
  /// folder (`assets/abi/{contractName}.json`), parses the ABI and metadata, and creates a deployed contract instance.
  /// If the contract is the primary one on the chain, it updates the global application environment accordingly.
  ///
  /// Parameters:
  /// - [contractName]: The name of the contract to load from the local asset.
  ///
  /// Returns:
  /// - A [Future] that completes with an [Optional<Contract>] containing the constructed contract object.
  ///
  /// Side effects:
  /// - Updates `Application.globalEnv` with token name, symbol, and precision if the contract matches the first in `contractsOnChain`.
  static Future<Optional<Contract>> fromBundle(String contractName) async {
    // TODO:
    return Optional.empty();
    final String jsonContent = await rootBundle.loadString('assets/abi/$contractName.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonContent);

    final String abi = json.encode(jsonMap['abi']);
    final String address = jsonMap['address'];
    final String? symbol = jsonMap['symbol'];
    final String? name = jsonMap['name'];
    final int? decimal = jsonMap['decimal'];

    if (contractName == contractsOnChain[0]) {
      Application.globalEnv.rebuild((builder) {
        builder.tokenName = name;
        if (symbol != null) {
          builder.tokenSymbol = symbol;
        }
        if (decimal != null) {
          builder.tokenPrecision = decimal;
        }
        Application.globalEnv = builder.build();
      });
    }

    final contract = DeployedContract(
      ContractAbi.fromJson(abi, contractName),
      EthereumAddress.fromHex(address),
    );

    return Optional.of(Contract(contract));
  }

  /// Fetches contract ABI and deployment information from a remote API and constructs a [Contract] object.
  ///
  /// This static method queries the API provider for contract details (ABI, address, metadata)
  /// based on the given contract name. If the contract is the primary one on the chain,
  /// it updates the global application environment with token details.
  ///
  /// Parameters:
  /// - [contractName]: The name of the contract to fetch.
  ///
  /// Returns:
  /// - A [Future] that completes with an [Optional<Contract>] containing the constructed contract object
  ///   if the API returns valid data; otherwise, an empty optional.
  ///
  /// Side effects:
  /// - Updates `Application.globalEnv` with token name, symbol, and precision if the contract is the first in `contractsOnChain`.
  static Future<Optional<Contract>> fromApi(String contractName) async {
    return Get.find<ApiProvider>()
      .fetchContractAbiV1(contractName: contractName)
      .then((res) {
        res.ifPresent((contract) {
          if (contractName == contractsOnChain[0]) {
            Application.globalEnv.rebuild((builder) {
              builder.tokenName = contract.name;
              if (null != contract.symbol) {
                builder.tokenSymbol = contract.symbol;
              }
              if (null != contract.decimal) {
                builder.tokenPrecision = contract.decimal;
              }
              Application.globalEnv = builder.build();
            });
          }
        });

        return res.map(
          (contract) => Contract(DeployedContract(
            ContractAbi.fromJson(contract.abi, contractName),
            EthereumAddress.fromHex(contract.address),
          ),),
        );
      });
  }

  /// Retrieves the current transaction count (nonce) for the specified Ethereum address.
  ///
  /// This method queries the blockchain to get the number of transactions sent from the given
  /// address, including pending transactions.
  ///
  /// Parameters:
  /// - [address]: The Ethereum address for which to fetch the transaction count.
  ///
  /// Returns:
  /// - A [Future] that completes with the transaction count (nonce) as an integer.
  ///
  /// Note:
  /// - Uses `BlockNum.pending()` to include both confirmed and pending transactions in the count.
  Future<int> getTransactionCount(EthereumAddress address) async {
    return web3Client.getTransactionCount(
      address,
      atBlock: BlockNum.pending()
    );
  }

  /// Decodes the parameters of a contract function call from the provided raw data.
  ///
  /// Given a function name and the raw transaction data (including the function selector),
  /// this method extracts and decodes the function parameters according to the contract's ABI.
  ///
  /// Parameters:
  /// - [funcName]: The name of the contract function whose parameters are to be decoded.
  /// - [data]: The raw transaction data as a [Uint8List], including the 4-byte function selector prefix.
  ///
  /// Returns:
  /// - A list of decoded parameter values as dynamic objects, in the order defined by the function ABI.
  ///
  /// Note:
  /// - The decoding skips the first 4 bytes (function selector) and decodes the rest according to the function's parameter types.
  List<dynamic> decodeParameters(String funcName, Uint8List data) {
    return TupleType(
    contract
      .function(funcName)
      .parameters
      .map((param) => param.type)
      .toList(),
    ).decode(data.buffer, 4).data;
  }

  /// Creates a contract call transaction for a specified function with given parameters.
  ///
  /// This method constructs a [Transaction] object that calls a contract function
  /// with the provided parameters. The transaction includes optional customization
  /// such as specifying a nonce, setting gas price to zero, and applying a maximum gas limit.
  ///
  /// Parameters:
  /// - [functionName]: The name of the contract function to invoke.
  /// - [parameters]: A list of arguments to pass to the function.
  /// - [nonce] (optional): The transaction nonce; if not provided, it will be assigned by the client.
  ///
  /// Returns:
  /// - A [Transaction] object ready to be signed and sent.
  ///
  /// Note:
  /// - Gas price is explicitly set to zero in this transaction.
  /// - The maximum gas limit is set via the [maxGas] variable.
  Transaction makeTransaction(String functionName, List<dynamic> parameters, {int? nonce}) {
    return Transaction.callContract(
      contract: contract,
      function: contract.function(functionName),
      parameters: parameters,
      gasPrice: EtherAmount.zero(),
      maxGas: maxGas,
      nonce: nonce,
    );
  }

  /// Subscribes to blockchain events emitted by the contract and invokes a callback on each event.
  ///
  /// This method listens for occurrences of the specified event emitted by the contract.
  /// When the event is detected, the event data is decoded and passed as a list of decoded parameters
  /// to the provided [onListen] callback function.
  ///
  /// Parameters:
  /// - [eventName]: The name of the contract event to listen for.
  /// - [onListen]: A callback function that receives a list of decoded event parameters whenever the event occurs.
  ///
  /// Note:
  /// - The subscription remains active and streams events until canceled externally.
  void eventStream(String eventName, Function(List<dynamic>) onListen) {
    final listenedEvent = contract.event(eventName);
    web3Client
      .events(
        FilterOptions.events(
          contract: contract,
          event: listenedEvent,
        ),
      )
      .listen((event) =>
        onListen(listenedEvent.decodeResults(event.topics!, event.data!)),);
  }

  /// Calls a read-only contract function and returns its result.
  ///
  /// This method performs a call (no transaction sent) to the specified contract function
  /// with the given parameters, using the sender address derived from the provided public key.
  ///
  /// Parameters:
  /// - [publicKey]: The public key as a hexadecimal string (with "0x" prefix),
  ///   which will be converted to an Ethereum address for the sender.
  /// - [functionName]: The name of the contract function to call.
  /// - [parameters]: Optional list of parameters to pass to the contract function;
  ///   defaults to an empty list if null.
  ///
  /// Returns:
  /// - A [Future] that completes with a list of dynamic results returned by the contract call.
  ///
  /// Note:
  /// - This is a read-only call that does not modify blockchain state and does not require gas.
  Future<List<dynamic>> callFunction(String publicKey, String functionName, List<dynamic>? parameters) async {
    return web3Client.call(
      sender: EthereumAddress.fromHex(
        BlockChainService.publicKeyToAddress(publicKey.substring(2)),
      ),
      contract: contract,
      function: contract.function(functionName),
      params: parameters ?? [],
    )
    .then((res) {
      return res;
    });
  }

  /// Sends a transaction calling a contract function using the provided private key.
  ///
  /// This function signs and sends a transaction to invoke the specified contract function with given parameters.
  /// It then waits for the transaction receipt by polling the blockchain (currently only waits once with a 2-second delay).
  ///
  /// Parameters:
  /// - [privateKey]: The sender's private key in hexadecimal string format.
  /// - [functionName]: The name of the contract function to call.
  /// - [parameters]: A list of parameters to pass to the contract function.
  ///
  /// Returns:
  /// - A [Future] that resolves to a boolean indicating whether the transaction was successful (`true` if status is success).
  ///
  /// Note:
  /// - The polling logic currently waits only once after a 2-second delay to fetch the receipt.
  ///   For robust confirmation, repeated polling until receipt is available is recommended.
  Future<bool> sendTransaction(String privateKey, String functionName, List<dynamic> parameters) async {
    TransactionReceipt? receipt;

    final credentials = EthPrivateKey.fromHex(privateKey);

    final String txHash = await web3Client.sendTransaction(
      credentials,
      makeTransaction(functionName, parameters),
      chainId: null,
      fetchChainIdFromNetworkId: true,
    );

    while (true) {
      await Future.delayed(const Duration(seconds: 2)).then((_) async {
        receipt = (await web3Client.getTransactionReceipt(txHash))!;
      });

      break;
    }

    return receipt!.status!;
  }

  /// Signs a smart contract function call using the given private key.
  ///
  /// This method locally signs a transaction that calls a contract function,
  /// returning the raw signed transaction as a hexadecimal string (prefixed with "0x").
  ///
  /// This is useful for offline signing, cold wallets, or manual transaction broadcasting.
  ///
  /// Parameters:
  /// - [privateKey]: The sender's private key as a hex string (with or without "0x" prefix).
  /// - [functionName]: The name of the contract function to be called.
  /// - [parameters]: The list of arguments to be passed to the contract function.
  /// - [nonce] (optional): The transaction nonce. If null, the client may fetch or estimate it.
  ///
  /// Returns:
  /// - A [Future] that completes with the raw signed transaction data in hex format.
  ///
  /// Example usage:
  /// ```dart
  /// final rawTx = await signContractCall(
  ///   '0xabc123...',
  ///   'transfer',
  ///   [EthereumAddress.fromHex('0x...'), BigInt.from(1000)],
  ///   nonce: 5,
  /// );
  /// print(rawTx); // '0x...'
  /// ```

  Future<String> signContractCall(String privateKey, String functionName, List<dynamic> parameters, {int? nonce}) async {
    final credentials = EthPrivateKey.fromHex(privateKey);
    return web3Client.signTransaction(
      credentials,
      makeTransaction(functionName, parameters, nonce: nonce),
      chainId: 10,
    ).then((rawTx) => '0x${bytesToHex(rawTx)}');
  }
}
