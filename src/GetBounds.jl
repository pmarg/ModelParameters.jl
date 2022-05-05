function get_initial_guess(variables)
    initial_guess = zeros(size(variables,1))
    for i ∈ 1:size(variables,1)
        initial_guess[i] = variables[i].value
    end
    return initial_guess
end


function get_lower_bounds(variables)
    lower_bound = zeros(size(variables,1))
    for i ∈ 1:size(variables,1)
        lower_bound[i] = variables[i].lb
    end
    return lower_bound
end

function get_upper_bounds(variables)
    upper_bound = zeros(size(variables,1))
    for i ∈ 1:size(variables,1)
        upper_bound[i] = variables[i].ub
    end
    return upper_bound
end

function get_bounds(name::ParameterGroup,val::Symbol)
    if typeof(getfield(name,val))<:BoundedParameter
        return getfield(getfield(name,val),:lb), getfield(getfield(name,val),:ub)
    else
        @warn "No bounds defined"
        return nothing
    end
end
