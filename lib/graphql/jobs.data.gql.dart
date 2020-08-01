// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:example_bug/graphql/schema.schema.gql.dart' as _i1;

class $AllJobs {
  const $AllJobs(this.data);

  final Map<String, dynamic> data;

  List<$AllJobs$jobs> get jobs => data['jobs'] == null
      ? null
      : (data['jobs'] as List)
          .map((dynamic e) => $AllJobs$jobs((e as Map<String, dynamic>)))
          .toList();
}

class $AllJobs$jobs {
  const $AllJobs$jobs(this.data);

  final Map<String, dynamic> data;

  _i1.DateTime get postedAt => _i1.DateTime((data['postedAt'] as String));
  String get userEmail => (data['userEmail'] as String);
}
