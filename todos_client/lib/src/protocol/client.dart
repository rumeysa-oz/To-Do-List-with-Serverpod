/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:todos_client/src/protocol/todo.dart' as _i3;
import 'protocol.dart' as _i4;

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointTodo extends _i1.EndpointRef {
  EndpointTodo(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'todo';

  _i2.Future<void> create(_i3.Todo todo) => caller.callServerEndpoint<void>(
        'todo',
        'create',
        {'todo': todo},
      );

  _i2.Future<List<_i3.Todo>> readAll() =>
      caller.callServerEndpoint<List<_i3.Todo>>(
        'todo',
        'readAll',
        {},
      );

  _i2.Future<void> delete(_i3.Todo todo) => caller.callServerEndpoint<void>(
        'todo',
        'delete',
        {'todo': todo},
      );

  _i2.Future<void> update(_i3.Todo todo) => caller.callServerEndpoint<void>(
        'todo',
        'update',
        {'todo': todo},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i4.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    example = EndpointExample(this);
    todo = EndpointTodo(this);
  }

  late final EndpointExample example;

  late final EndpointTodo todo;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'todo': todo,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
