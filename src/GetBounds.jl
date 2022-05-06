"""
    get_initial_guess(parameters::Array{Float64})

Returns the values of parameter vector. Useful for initial guess for optimization.
"""
function get_initial_guess(parameters::Array{Float64})
    initial_guess = zeros(size(parameters, 1))
    for i ∈ 1:size(parameters, 1)
        initial_guess[i] = parameters[i].value
    end
    return initial_guess
end
"""
    get_lower_bounds(parameters::Array{Float64)

Returns the lower bounds of parameter vector. Useful for constrained optimization.
"""
function get_lower_bounds(parameters::Array{Float64})
    lower_bound = zeros(size(parameters, 1))
    for i ∈ 1:size(parameters, 1)
        lower_bound[i] = parameters[i].lb
    end
    return lower_bound
end
"""
    get_upper_bounds(parameters::Array{Float64)

Returns the upper bounds of parameter vector. Useful for constrained optimization.
"""
function get_upper_bounds(parameters::Array{Float64})
    upper_bound = zeros(size(parameters, 1))
    for i ∈ 1:size(parameters, 1)
        upper_bound[i] = parameters[i].ub
    end
    return upper_bound
end
"""
    get_bounds(name::ParameterGroup, val::Symbol)

Returns the lower and upper bound of a single parameter withing a `ParameterGroup`. Useful for constrained optimization.
"""
function get_bounds(name::ParameterGroup, val::Symbol)
    if typeof(getfield(name, val)) <: BoundedParameter
        return getfield(getfield(name, val), :lb), getfield(getfield(name, val, :ub))
    else
        @warn "No bounds defined"
        return nothing
    end
end
