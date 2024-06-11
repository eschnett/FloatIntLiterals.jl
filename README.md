# FloatIntLiterals.jl

A convenient notation for floating point and integer literals with a
specific precision, e.g. `4_f16` or `1_i32`. This is particular useful
when programming accelerators since performance there is often much
higher when using fewer bits.

* [Documentation](https://eschnett.github.io/FloatIntLiterals.jl/dev/)
* [![GitHub
  CI](https://github.com/eschnett/FloatIntLiterals.jl/workflows/CI/badge.svg)](https://github.com/eschnett/FloatIntLiterals.jl/actions)
* [![codecov](https://codecov.io/gh/eschnett/FloatIntLiterals.jl/branch/main/graph/badge.svg?token=75FT03ULHD)](https://codecov.io/gh/eschnett/FloatIntLiterals.jl)

## Description

These suffixes are supported:
```Julia
julia> using FloatIntLiterals

julia> 1_i8
1

julia> 1_i16
1

julia> 1_i32
1

julia> 1_i64
1

julia> 1_i128
1

julia> 1_u8
0x01

julia> 1_u16
0x0001

julia> 1_u32
0x00000001

julia> 1_u64
0x0000000000000001

julia> 1_u128
0x00000000000000000000000000000001

julia> 1_f16
Float16(1.0)

julia> 1_f32
1.0f0

julia> 1_f64
1.0

julia> 1.1_f16
Float16(1.1)

julia> 1.1_f32
1.1f0

julia> 1.1_f64
1.1

julia> 1.1e-4_f16
Float16(0.00011)

julia> 1.1e-4_f32
0.00011f0

julia> 1.1e-4_f64
0.00011
```
