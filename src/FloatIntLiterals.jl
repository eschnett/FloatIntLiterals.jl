module FloatIntLiterals

###

# We cannot use `f16` etc. because that syntax denotes a Float32 literal with exponent
export _f16, _f32, _f64

struct FloatLiteral{F<:AbstractFloat} <: AbstractFloat end
Base.convert(::Type{F}, ::FloatLiteral{G}) where {F<:Union{AbstractFloat,Integer},G<:AbstractFloat} = convert(F, G(1))
# This is the heart of the module: finding a common type between any
# other numeric type and a `FloatLiteral` is always the type that this
# `FloatLiteral` represents.
Base.promote_rule(::Type{<:Union{AbstractFloat,Integer}}, ::Type{FloatLiteral{F}}) where {F<:AbstractFloat} = F
Base.promote_rule(::Type{BigInt}, ::Type{FloatLiteral{F}}) where {F<:AbstractFloat} = F
function Base.promote_rule(::Type{FloatLiteral{F}}, ::Type{FloatLiteral{G}}) where {F<:AbstractFloat,G<:AbstractFloat}
    return FloatLiteral{promote(F, G)}
end

const _f16 = FloatLiteral{Float16}()
const _f32 = FloatLiteral{Float32}()
const _f64 = FloatLiteral{Float64}()

###

export _i8, _i16, _i32, _i64, _i128, _u8, _u16, _u32, _u64, _u128

struct IntLiteral{I<:Integer} <: Integer end
Base.convert(::Type{I}, ::IntLiteral{J}) where {I<:Integer,J<:Integer} = convert(I, J(1))
# This _is the heart of the module: finding a common type between any
# other Integer type and an `IntLiteral` _is always the type that this
# `IntLiteral` represents.
Base.promote_rule(::Type{<:Integer}, ::Type{IntLiteral{I}}) where {I<:Integer} = I
Base.promote_rule(::Type{BigInt}, ::Type{IntLiteral{I}}) where {I<:Integer} = I
Base.promote_rule(::Type{IntLiteral{I}}, ::Type{IntLiteral{J}}) where {I<:Integer,J<:Integer} = IntLiteral{promote(I, J)}

const _i8 = IntLiteral{Int8}()
const _i16 = IntLiteral{Int16}()
const _i32 = IntLiteral{Int32}()
const _i64 = IntLiteral{Int64}()
const _i128 = IntLiteral{Int128}()
const _u8 = IntLiteral{UInt8}()
const _u16 = IntLiteral{UInt16}()
const _u32 = IntLiteral{UInt32}()
const _u64 = IntLiteral{UInt64}()
const _u128 = IntLiteral{UInt128}()

end
