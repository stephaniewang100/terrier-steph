// Sanity check test for execution parameters.
// Just output parameters of all types.

struct Output {
  int_col : Integer
  real_col : Real
  date_col : Date
  string_col : StringVal
}

fun main(execCtx: *ExecutionContext) -> int {
  for (var i : int = 0; i < 37; i = i + 1) {
    var out =  @ptrCast(*Output, @resultBufferAllocRow(execCtx))
    out.int_col = @getParamInt(execCtx, 0)
    out.real_col = @getParamReal(execCtx, 1)
    out.date_col = @getParamDate(execCtx, 2)
    out.string_col = @getParamString(execCtx, 3)
  }
  @resultBufferFinalize(execCtx)
  return 37
}