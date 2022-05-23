using ModelParameters
using Test
import Base.@kwdef

@testset "Get Properties" begin
    x1 = Parameter(1.0, "x1")
    x2 = BoundedParameter(1.0, 0.0, 10.0, "x2")

    x3 = Parameter(1, "x3")
    x4 = BoundedParameter(1, 0, 10, "x4")

    @kwdef struct Params <: ParameterGroup
        y1::Parameter{Float64,String} = x1
        y2::BoundedParameter{Float64,String} = x2

        y3::Parameter{Int64,String} = x3
        y4::BoundedParameter{Int64,String} = x4
    end

    z1 = x1.value
    @test z1 ≈ 1.0
    z2 = x2.value
    @test z2 ≈ 1.0
    z3 = x3.value
    @test z3 == 1
    z4 = x2.value
    @test z4 == 1

    T = Params()

    z1 = T.y1
    @test z1 ≈ 1.0
    z2 = T.y2
    @test z2 ≈ 1.0
    z3 = T.y3
    @test z3 == 1
    z4 = T.y4
    @test z4 == 1
end

@testset "Set Properties" begin

    x1 = Parameter(1.0, "x1")
    x2 = BoundedParameter(1.0, 0.0, 10.0, "x2")

    x3 = Parameter(1, "x3")
    x4 = BoundedParameter(1, 0, 10, "x4")

    @kwdef struct Params <: ParameterGroup
        y1::Parameter{Float64,String} = x1
        y2::BoundedParameter{Float64,String} = x2

        y3::Parameter{Int64,String} = x3
        y4::BoundedParameter{Int64,String} = x4
    end
    T = Params()
    T = set(T, :y1, 0.3)
    @test T.y1 ≈ 0.3
    T = T ← ((:y1, 0.2), (:y3, 0))
    @test T.y1 ≈ 0.2
    @test T.y3 == 0

end

@testset "Get Bounds" begin
    x1 = Parameter(1.0, "x1")
    x2 = BoundedParameter(1.0, 0.0, 10.0, "x2")

    x3 = Parameter(1, "x3")
    x4 = BoundedParameter(1, 0, 10, "x4")

    @kwdef struct Params <: ParameterGroup
        y1::Parameter{Float64,String} = x1
        y2::BoundedParameter{Float64,String} = x2

        y3::Parameter{Int64,String} = x3
        y4::BoundedParameter{Int64,String} = x4
    end

    @kwdef struct InitialGuess <: ParameterGroup
        y2::BoundedParameter{Float64,String} = x2
        y4::BoundedParameter{Int64,String} = x4
    end

    T = Params()
    IG = InitialGuess()

    initial_guess = get_initial_guess([x2, x4])
    @test initial_guess == [1.0, 1]

    bounds = get_bounds(T, :y2)
    @test bounds == (0.0, 10.0)

    lower_bounds = get_lower_bounds([x2, x4])
    @test lower_bounds == [0.0, 0]

    upper_bounds = get_upper_bounds([x2, x4])
    @test upper_bounds == [10.0, 10]

    descr = description(T, :y1)
    @test descr == "x1"

    lb, ub = get_bounds(IG)
    @test lb == [0.0, 0.0]
    @test ub == [10.0, 10.0]

end


