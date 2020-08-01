// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:ferry/ferry.dart' as _i1;
import 'package:example_bug/graphql/jobs.data.gql.dart' as _i2;
import 'package:example_bug/graphql/jobs.var.gql.dart' as _i3;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:example_bug/graphql/jobs.op.gql.dart' as _i5;

class AllJobs extends _i1.QueryRequest<_i2.$AllJobs> {
  factory AllJobs(
          {_i3.AllJobsVarBuilder Function(_i3.AllJobsVarBuilder) buildVars,
          String queryId,
          _i2.$AllJobs Function(_i2.$AllJobs, _i2.$AllJobs) updateResult,
          Map<String, dynamic> optimisticResponse,
          updateCacheHandlerKey,
          _i4.Context context,
          _i1.FetchPolicy fetchPolicy}) =>
      AllJobs._(
          operation: _i5.AllJobs,
          variables: buildVars != null
              ? buildVars(_i3.AllJobsVarBuilder()).variables
              : const {},
          context: context != null ? context : const _i4.Context(),
          queryId: queryId,
          updateResult: updateResult,
          optimisticResponse: optimisticResponse,
          updateCacheHandlerKey: updateCacheHandlerKey,
          fetchPolicy: fetchPolicy);

  AllJobs._(
      {_i4.Operation operation,
      Map<String, dynamic> variables,
      _i4.Context context,
      String queryId,
      _i2.$AllJobs Function(_i2.$AllJobs, _i2.$AllJobs) updateResult,
      Map<String, dynamic> optimisticResponse,
      String updateCacheHandlerKey,
      _i1.FetchPolicy fetchPolicy})
      : super(
            operation: operation,
            variables: variables,
            context: context,
            queryId: queryId,
            updateResult: updateResult,
            optimisticResponse: optimisticResponse,
            updateCacheHandlerKey: updateCacheHandlerKey,
            fetchPolicy: fetchPolicy);

  @override
  _i2.$AllJobs parseData(Map<String, dynamic> json) => _i2.$AllJobs(json);
  @override
  AllJobs copyWith(
          {_i4.Operation operation,
          Map<String, dynamic> variables,
          _i4.Context context,
          String queryId,
          _i2.$AllJobs Function(_i2.$AllJobs, _i2.$AllJobs) updateResult,
          Map<String, dynamic> optimisticResponse,
          String updateCacheHandlerKey,
          _i1.FetchPolicy fetchPolicy}) =>
      AllJobs._(
          operation: operation ?? this.operation,
          variables: variables ?? this.variables,
          context: context ?? this.context,
          queryId: queryId ?? this.queryId,
          updateResult: updateResult ?? this.updateResult,
          optimisticResponse: optimisticResponse ?? this.optimisticResponse,
          updateCacheHandlerKey:
              updateCacheHandlerKey ?? this.updateCacheHandlerKey,
          fetchPolicy: fetchPolicy ?? this.fetchPolicy);
}
