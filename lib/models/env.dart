import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:crypton/crypton.dart';

part 'env.g.dart';

abstract class Env extends Object implements Built<Env, EnvBuilder> {
  static Serializer<Env> get serializer => _$envSerializer;

  /// The base URL of the API gateway that the app will communicate with. This is the entry point for RESTful API calls.
  String get apiGatewayBaseUrl;

  /// Timeout (in milliseconds) for connecting to the API gateway. For example, 30 * 1000 means a 30-second timeout.
  int get apiGatewayConnectTimeout;

  /// The RPC (Remote Procedure Call) endpoint of a Web3-compatible blockchain node. Used for interacting with the blockchain.
  String get web3RpcGatewayUrl;

  /// The prefix used when generating or resolving DIDs (Decentralized Identifiers), e.g., did:tw:.
  String get didPrefix;

  /// The human-readable name of the token, e.g., TW Point.
  String get tokenName;

  /// The symbol or shorthand representation of the token, such as ￥.
  String get tokenSymbol;

  /// The number of decimal places the token uses for internal calculations. For example, 2 means the smallest unit is 0.01.
  int get tokenPrecision;

  /// The number of decimal places shown to users, which may differ from tokenPrecision for display purposes.
  int get tokenHumanReadablePrecision;

  /// The blockchain network ID (Chain ID). This is used to distinguish between different networks like mainnet, testnet, etc.
  int get chainId;

  /// The RSA public key of a trusted authority (such as a central bank). It may be used for verifying digital signatures or encrypting sensitive data.
  RSAPublicKey get centralBankPublicKey;

  factory Env([void Function(EnvBuilder) updates]) = _$Env;

  factory Env.fromDefault() {
    return Env(
      (EnvBuilder builder) => builder
        ..apiGatewayBaseUrl = 'https://wallet.cn.blockchain.thoughtworks.cn/'
        ..apiGatewayConnectTimeout = 30 * 1000
        ..web3RpcGatewayUrl = 'http://node1.quorum.cn.blockchain.thoughtworks.cn'
        ..didPrefix = 'did:tw:'
        ..tokenName = 'TW Point'
        ..tokenSymbol = '￥'
        ..tokenPrecision = 2
        ..tokenHumanReadablePrecision = 2
        ..chainId = 10
        ..centralBankPublicKey = RSAPublicKey.fromString('MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAI5SXpw1SSsM3FN43JVKn4gb+oGXfjL7rCDluqydAyHZ8vV7ySqi8oM1CoHRC9U2ST7IldydsQ+4cjC9xfzexxcCAwEAAQ==',
        ),
    );
  }

  Env._();
}
