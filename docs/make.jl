# Generate documentation with this command:
# (cd docs && julia make.jl)

push!(LOAD_PATH, "..")

using Documenter
using FloatIntLiterals

makedocs(; sitename="FloatIntLiterals", format=Documenter.HTML(), modules=[FloatIntLiterals])

deploydocs(; repo="github.com/eschnett/FloatIntLiterals.jl.git", devbranch="main", push_preview=true)
