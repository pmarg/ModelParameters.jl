module ModelParameters

import Base.show
import Base.getproperty

include("Types.jl")
include("Set.jl")
include("GetBounds.jl")
include("Show.jl")

export AbstractParameter,
    AbstractParameterSet,
    ParameterGroup,
    ParameterSpace,
    Parameter,
    BoundedParameter,
    getproperty,
    description,
    get_bounds,
    get_initial_guess,
    get_lower_bounds,
    get_upper_bounds,
    set,
    ←,
    show

end
