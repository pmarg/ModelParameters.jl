using ModelParameters
using Documenter

DocMeta.setdocmeta!(ModelParameters, :DocTestSetup, :(using ModelParameters); recursive=true)

makedocs(;
    modules=[ModelParameters],
    authors="Panos Margaris",
    repo="https://github.com/pmarg/ModelParameters.jl/blob/{commit}{path}#{line}",
    sitename="ModelParameters.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://pmarg.github.io/ModelParameters.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/pmarg/ModelParameters.jl",
    devbranch="master",
)
