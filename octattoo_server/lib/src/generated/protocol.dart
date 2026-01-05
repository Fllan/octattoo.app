/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i3;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i4;
import 'features/availability/availability.dart' as _i5;
import 'features/availability/availability_type.dart' as _i6;
import 'features/availability/recurring_pattern.dart' as _i7;
import 'features/availability/recurring_type.dart' as _i8;
import 'features/tattoo_artist/tattoo_artist.dart' as _i9;
import 'features/user/user.dart' as _i10;
import 'features/workplace/workplace.dart' as _i11;
import 'features/base_class.dart' as _i12;
import 'features/tattoo_artist/exceptions/artist_name_taken.dart' as _i13;
import 'greetings/greeting.dart' as _i14;
export 'features/availability/availability.dart';
export 'features/availability/availability_type.dart';
export 'features/availability/recurring_pattern.dart';
export 'features/availability/recurring_type.dart';
export 'features/tattoo_artist/tattoo_artist.dart';
export 'features/user/user.dart';
export 'features/workplace/workplace.dart';
export 'features/base_class.dart';
export 'features/tattoo_artist/exceptions/artist_name_taken.dart';
export 'greetings/greeting.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'availability',
      dartName: 'Availability',
      schema: 'public',
      module: 'octattoo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'tattooArtistId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'workplaceId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'startDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'endDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:AvailabilityType',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'availability_fk_0',
          columns: ['tattooArtistId'],
          referenceTable: 'tattoo_artist',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'availability_fk_1',
          columns: ['workplaceId'],
          referenceTable: 'workplace',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'availability_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'availability_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'tattooArtistId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'workplaceId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'startDate',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'endDate',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'recurring_pattern',
      dartName: 'RecurringPattern',
      schema: 'public',
      module: 'octattoo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'recurring_pattern_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'availabilityId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'recurringType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:RecurringType',
        ),
        _i2.ColumnDefinition(
          name: 'separationCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'dayOfWeek',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'weekOfMonth',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'dayOfMonth',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'monthOfYear',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'recurring_pattern_fk_0',
          columns: ['availabilityId'],
          referenceTable: 'availability',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'recurring_pattern_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'tattoo_artist',
      dartName: 'TattooArtist',
      schema: 'public',
      module: 'octattoo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'artistName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'bio',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'pictureUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'bannerUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'\'::text',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'tattoo_artist_fk_0',
          columns: ['userId'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'tattoo_artist_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'artistName_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artistName',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user',
      dartName: 'User',
      schema: 'public',
      module: 'octattoo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'authUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'firstName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'lastName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'pronoun',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'isOnboarded',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'user_fk_0',
          columns: ['authUserId'],
          referenceTable: 'serverpod_auth_core_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'auth_user_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'workplace',
      dartName: 'Workplace',
      schema: 'public',
      module: 'octattoo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'address',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'workplace_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i4.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i5.Availability) {
      return _i5.Availability.fromJson(data) as T;
    }
    if (t == _i6.AvailabilityType) {
      return _i6.AvailabilityType.fromJson(data) as T;
    }
    if (t == _i7.RecurringPattern) {
      return _i7.RecurringPattern.fromJson(data) as T;
    }
    if (t == _i8.RecurringType) {
      return _i8.RecurringType.fromJson(data) as T;
    }
    if (t == _i9.TattooArtist) {
      return _i9.TattooArtist.fromJson(data) as T;
    }
    if (t == _i10.User) {
      return _i10.User.fromJson(data) as T;
    }
    if (t == _i11.Workplace) {
      return _i11.Workplace.fromJson(data) as T;
    }
    if (t == _i12.BaseClass) {
      return _i12.BaseClass.fromJson(data) as T;
    }
    if (t == _i13.ArtistNameTakenException) {
      return _i13.ArtistNameTakenException.fromJson(data) as T;
    }
    if (t == _i14.Greeting) {
      return _i14.Greeting.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.Availability?>()) {
      return (data != null ? _i5.Availability.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AvailabilityType?>()) {
      return (data != null ? _i6.AvailabilityType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.RecurringPattern?>()) {
      return (data != null ? _i7.RecurringPattern.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.RecurringType?>()) {
      return (data != null ? _i8.RecurringType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.TattooArtist?>()) {
      return (data != null ? _i9.TattooArtist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.User?>()) {
      return (data != null ? _i10.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Workplace?>()) {
      return (data != null ? _i11.Workplace.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.BaseClass?>()) {
      return (data != null ? _i12.BaseClass.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.ArtistNameTakenException?>()) {
      return (data != null
              ? _i13.ArtistNameTakenException.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i14.Greeting?>()) {
      return (data != null ? _i14.Greeting.fromJson(data) : null) as T;
    }
    if (t == List<_i7.RecurringPattern>) {
      return (data as List)
              .map((e) => deserialize<_i7.RecurringPattern>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i7.RecurringPattern>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i7.RecurringPattern>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i5.Availability>) {
      return (data as List)
              .map((e) => deserialize<_i5.Availability>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i5.Availability>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i5.Availability>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i9.TattooArtist>) {
      return (data as List)
              .map((e) => deserialize<_i9.TattooArtist>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i9.TattooArtist>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i9.TattooArtist>(e))
                    .toList()
              : null)
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i5.Availability => 'Availability',
      _i6.AvailabilityType => 'AvailabilityType',
      _i7.RecurringPattern => 'RecurringPattern',
      _i8.RecurringType => 'RecurringType',
      _i9.TattooArtist => 'TattooArtist',
      _i10.User => 'User',
      _i11.Workplace => 'Workplace',
      _i12.BaseClass => 'BaseClass',
      _i13.ArtistNameTakenException => 'ArtistNameTakenException',
      _i14.Greeting => 'Greeting',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('octattoo.', '');
    }

    switch (data) {
      case _i5.Availability():
        return 'Availability';
      case _i6.AvailabilityType():
        return 'AvailabilityType';
      case _i7.RecurringPattern():
        return 'RecurringPattern';
      case _i8.RecurringType():
        return 'RecurringType';
      case _i9.TattooArtist():
        return 'TattooArtist';
      case _i10.User():
        return 'User';
      case _i11.Workplace():
        return 'Workplace';
      case _i12.BaseClass():
        return 'BaseClass';
      case _i13.ArtistNameTakenException():
        return 'ArtistNameTakenException';
      case _i14.Greeting():
        return 'Greeting';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Availability') {
      return deserialize<_i5.Availability>(data['data']);
    }
    if (dataClassName == 'AvailabilityType') {
      return deserialize<_i6.AvailabilityType>(data['data']);
    }
    if (dataClassName == 'RecurringPattern') {
      return deserialize<_i7.RecurringPattern>(data['data']);
    }
    if (dataClassName == 'RecurringType') {
      return deserialize<_i8.RecurringType>(data['data']);
    }
    if (dataClassName == 'TattooArtist') {
      return deserialize<_i9.TattooArtist>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i10.User>(data['data']);
    }
    if (dataClassName == 'Workplace') {
      return deserialize<_i11.Workplace>(data['data']);
    }
    if (dataClassName == 'BaseClass') {
      return deserialize<_i12.BaseClass>(data['data']);
    }
    if (dataClassName == 'ArtistNameTakenException') {
      return deserialize<_i13.ArtistNameTakenException>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i14.Greeting>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i4.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.Availability:
        return _i5.Availability.t;
      case _i7.RecurringPattern:
        return _i7.RecurringPattern.t;
      case _i9.TattooArtist:
        return _i9.TattooArtist.t;
      case _i10.User:
        return _i10.User.t;
      case _i11.Workplace:
        return _i11.Workplace.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'octattoo';
}
