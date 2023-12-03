import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_prakash/flutter_prakash.dart';
import 'package:flutter_prakash/flutter_prakash_platform_interface.dart';
import 'package:flutter_prakash/flutter_prakash_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPrakashPlatform
    with MockPlatformInterfaceMixin
    implements FlutterPrakashPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterPrakashPlatform initialPlatform = FlutterPrakashPlatform.instance;

  test('$MethodChannelFlutterPrakash is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPrakash>());
  });

  test('getPlatformVersion', () async {
    FlutterPrakash flutterPrakashPlugin = FlutterPrakash();
    MockFlutterPrakashPlatform fakePlatform = MockFlutterPrakashPlatform();
    FlutterPrakashPlatform.instance = fakePlatform;

    expect(await flutterPrakashPlugin.getPlatformVersion(), '42');
  });
}
