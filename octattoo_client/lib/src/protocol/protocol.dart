/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'features/appointment/models/appointment.dart' as _i2;
import 'features/availability/models/availability.dart' as _i3;
import 'features/availability/models/availability_type.dart' as _i4;
import 'features/availability/models/recurring_pattern.dart' as _i5;
import 'features/availability/models/recurring_type.dart' as _i6;
import 'features/customer/models/customer.dart' as _i7;
import 'features/customer/models/customer_tag.dart' as _i8;
import 'features/finance/models/invoice.dart' as _i9;
import 'features/finance/models/quotation.dart' as _i10;
import 'features/flash/models/flash.dart' as _i11;
import 'features/picture_album/models/picture.dart' as _i12;
import 'features/picture_album/models/picture_album.dart' as _i13;
import 'features/shared/models/address.dart' as _i14;
import 'features/shared/models/workflow_status.dart' as _i15;
import 'features/tattoo_artist/models/company.dart' as _i16;
import 'features/tattoo_artist/models/tattoo_artist.dart' as _i17;
import 'features/tattoo_project/models/tattoo_project.dart' as _i18;
import 'features/user/models/user.dart' as _i19;
import 'features/workplace/models/workplace.dart' as _i20;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i21;
export 'features/appointment/models/appointment.dart';
export 'features/availability/models/availability.dart';
export 'features/availability/models/availability_type.dart';
export 'features/availability/models/recurring_pattern.dart';
export 'features/availability/models/recurring_type.dart';
export 'features/customer/models/customer.dart';
export 'features/customer/models/customer_tag.dart';
export 'features/finance/models/invoice.dart';
export 'features/finance/models/quotation.dart';
export 'features/flash/models/flash.dart';
export 'features/picture_album/models/picture.dart';
export 'features/picture_album/models/picture_album.dart';
export 'features/shared/models/address.dart';
export 'features/shared/models/workflow_status.dart';
export 'features/tattoo_artist/models/company.dart';
export 'features/tattoo_artist/models/tattoo_artist.dart';
export 'features/tattoo_project/models/tattoo_project.dart';
export 'features/user/models/user.dart';
export 'features/workplace/models/workplace.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Appointment) {
      return _i2.Appointment.fromJson(data) as T;
    }
    if (t == _i3.Availability) {
      return _i3.Availability.fromJson(data) as T;
    }
    if (t == _i4.AvailabilityType) {
      return _i4.AvailabilityType.fromJson(data) as T;
    }
    if (t == _i5.RecurringPattern) {
      return _i5.RecurringPattern.fromJson(data) as T;
    }
    if (t == _i6.RecurringType) {
      return _i6.RecurringType.fromJson(data) as T;
    }
    if (t == _i7.Customer) {
      return _i7.Customer.fromJson(data) as T;
    }
    if (t == _i8.CustomerTag) {
      return _i8.CustomerTag.fromJson(data) as T;
    }
    if (t == _i9.Invoice) {
      return _i9.Invoice.fromJson(data) as T;
    }
    if (t == _i10.Quotation) {
      return _i10.Quotation.fromJson(data) as T;
    }
    if (t == _i11.Flash) {
      return _i11.Flash.fromJson(data) as T;
    }
    if (t == _i12.Picture) {
      return _i12.Picture.fromJson(data) as T;
    }
    if (t == _i13.PictureAlbum) {
      return _i13.PictureAlbum.fromJson(data) as T;
    }
    if (t == _i14.Address) {
      return _i14.Address.fromJson(data) as T;
    }
    if (t == _i15.WorkflowStatus) {
      return _i15.WorkflowStatus.fromJson(data) as T;
    }
    if (t == _i16.Company) {
      return _i16.Company.fromJson(data) as T;
    }
    if (t == _i17.TattooArtist) {
      return _i17.TattooArtist.fromJson(data) as T;
    }
    if (t == _i18.TattooProject) {
      return _i18.TattooProject.fromJson(data) as T;
    }
    if (t == _i19.User) {
      return _i19.User.fromJson(data) as T;
    }
    if (t == _i20.Workplace) {
      return _i20.Workplace.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Appointment?>()) {
      return (data != null ? _i2.Appointment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Availability?>()) {
      return (data != null ? _i3.Availability.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.AvailabilityType?>()) {
      return (data != null ? _i4.AvailabilityType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.RecurringPattern?>()) {
      return (data != null ? _i5.RecurringPattern.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.RecurringType?>()) {
      return (data != null ? _i6.RecurringType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Customer?>()) {
      return (data != null ? _i7.Customer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.CustomerTag?>()) {
      return (data != null ? _i8.CustomerTag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Invoice?>()) {
      return (data != null ? _i9.Invoice.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Quotation?>()) {
      return (data != null ? _i10.Quotation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Flash?>()) {
      return (data != null ? _i11.Flash.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Picture?>()) {
      return (data != null ? _i12.Picture.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.PictureAlbum?>()) {
      return (data != null ? _i13.PictureAlbum.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Address?>()) {
      return (data != null ? _i14.Address.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.WorkflowStatus?>()) {
      return (data != null ? _i15.WorkflowStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Company?>()) {
      return (data != null ? _i16.Company.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.TattooArtist?>()) {
      return (data != null ? _i17.TattooArtist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.TattooProject?>()) {
      return (data != null ? _i18.TattooProject.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.User?>()) {
      return (data != null ? _i19.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Workplace?>()) {
      return (data != null ? _i20.Workplace.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i8.CustomerTag>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i8.CustomerTag>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i12.Picture>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.Picture>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i17.TattooArtist>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i17.TattooArtist>(e))
              .toList()
          : null) as T;
    }
    try {
      return _i21.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Appointment) {
      return 'Appointment';
    }
    if (data is _i3.Availability) {
      return 'Availability';
    }
    if (data is _i4.AvailabilityType) {
      return 'AvailabilityType';
    }
    if (data is _i5.RecurringPattern) {
      return 'RecurringPattern';
    }
    if (data is _i6.RecurringType) {
      return 'RecurringType';
    }
    if (data is _i7.Customer) {
      return 'Customer';
    }
    if (data is _i8.CustomerTag) {
      return 'CustomerTag';
    }
    if (data is _i9.Invoice) {
      return 'Invoice';
    }
    if (data is _i10.Quotation) {
      return 'Quotation';
    }
    if (data is _i11.Flash) {
      return 'Flash';
    }
    if (data is _i12.Picture) {
      return 'Picture';
    }
    if (data is _i13.PictureAlbum) {
      return 'PictureAlbum';
    }
    if (data is _i14.Address) {
      return 'Address';
    }
    if (data is _i15.WorkflowStatus) {
      return 'WorkflowStatus';
    }
    if (data is _i16.Company) {
      return 'Company';
    }
    if (data is _i17.TattooArtist) {
      return 'TattooArtist';
    }
    if (data is _i18.TattooProject) {
      return 'TattooProject';
    }
    if (data is _i19.User) {
      return 'User';
    }
    if (data is _i20.Workplace) {
      return 'Workplace';
    }
    className = _i21.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Appointment') {
      return deserialize<_i2.Appointment>(data['data']);
    }
    if (dataClassName == 'Availability') {
      return deserialize<_i3.Availability>(data['data']);
    }
    if (dataClassName == 'AvailabilityType') {
      return deserialize<_i4.AvailabilityType>(data['data']);
    }
    if (dataClassName == 'RecurringPattern') {
      return deserialize<_i5.RecurringPattern>(data['data']);
    }
    if (dataClassName == 'RecurringType') {
      return deserialize<_i6.RecurringType>(data['data']);
    }
    if (dataClassName == 'Customer') {
      return deserialize<_i7.Customer>(data['data']);
    }
    if (dataClassName == 'CustomerTag') {
      return deserialize<_i8.CustomerTag>(data['data']);
    }
    if (dataClassName == 'Invoice') {
      return deserialize<_i9.Invoice>(data['data']);
    }
    if (dataClassName == 'Quotation') {
      return deserialize<_i10.Quotation>(data['data']);
    }
    if (dataClassName == 'Flash') {
      return deserialize<_i11.Flash>(data['data']);
    }
    if (dataClassName == 'Picture') {
      return deserialize<_i12.Picture>(data['data']);
    }
    if (dataClassName == 'PictureAlbum') {
      return deserialize<_i13.PictureAlbum>(data['data']);
    }
    if (dataClassName == 'Address') {
      return deserialize<_i14.Address>(data['data']);
    }
    if (dataClassName == 'WorkflowStatus') {
      return deserialize<_i15.WorkflowStatus>(data['data']);
    }
    if (dataClassName == 'Company') {
      return deserialize<_i16.Company>(data['data']);
    }
    if (dataClassName == 'TattooArtist') {
      return deserialize<_i17.TattooArtist>(data['data']);
    }
    if (dataClassName == 'TattooProject') {
      return deserialize<_i18.TattooProject>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i19.User>(data['data']);
    }
    if (dataClassName == 'Workplace') {
      return deserialize<_i20.Workplace>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i21.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
