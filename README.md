# ModelParameters

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://pmarg.github.io/ModelParameters.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://pmarg.github.io/ModelParameters.jl/dev)
[![Build Status](https://github.com/pmarg/ModelParameters.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/pmarg/ModelParameters.jl/actions/workflows/CI.yml?query=branch%3Amaster)
[![Coverage](https://codecov.io/gh/pmarg/ModelParameters.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/pmarg/ModelParameters.jl)

This package provides wrappers for parameters that hold the parameter value, a description, and parameter bounds.

```julia
struct Parameter{T,S<:String} <: AbstractParameter
    value::T
    description::S
end

struct BoundedParameter{T,S<:String} <: AbstractParameter
    value::T
    lb::T
    ub::T
    description::S
end
```

## The parameter wrapper

```julia
using Pkg; Pgk.add("https://github.com/pmarg/ModelParameters.jl")
using ModelParameters
x1 = Parameter(1.0, "x1")
x2 = BoundedParameter(1.0, 0.0, 10.0, "x2")
```
## Parameter groups and parameter space

For convenience, calling an `AbstractParameter` within a `ParameterGroup` return the value of the parameter instead of the `AbstractParameter` itself. Use `description(ParameterGroup, Parameter)` to get the description.

### ParameterGroup
```julia
import Base.@kwdef

@kwdef struct Params1 <: ParameterGroup
    y1::Parameter{Float64,String} = Parameter(1.0, "x1")
    y2::BoundedParameter{Float64,String} = BoundedParameter(1.0, 0.0, 10.0, "x2")
end

P1 = Params1()

z1 = P1.y1 # z1 = 1.0
desc = description(P1,:y1) # desc = "x1"
```

### ParameterSpace
```julia
import Base.@kwdef

@kwdef struct Params2 <: ParameterGroup
    y1::Parameter{Float64,String} = Parameter(1.0, "x1")
    y2::BoundedParameter{Float64,String} = BoundedParameter(1.0, 0.0, 10.0, "x2")
end

@kwdef struct Parameters <: ParameterSpace
  P1 = Params1()
  P2 = Params2()
end

z1 = P.y1 # z1 = 1.0
desc = description(P,:y1) # desc = "x1"
```

### Printing
```julia
julia> P1 = Params1()

Variable   | Description | Value
------------------------
y1         | x1 | 1.0
y2         | x2 | 1.0
```
```julia
julia> P = Parameters()

Parameters for Params1:
Variable   | Description | Value
------------------------
y1         | x1 | 1.0
y2         | x2 | 1.0

Parameters for Params2:
Variable   | Description | Value
------------------------
y1         | x1 | 1.0
y2         | x2 | 1.0
```




