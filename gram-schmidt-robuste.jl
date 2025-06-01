using LinearAlgebra

function gramschmidtrobust(us)  # us is a vector of vectors
    vs = Vector{typeof(us[1])}()
    eps = 1e-18

    for i in 1:length(us)
        v = copy(us[i])
        for j in 1:length(vs)
            v .-= dot(us[i], vs[j]) * vs[j]
        end

        nrm = norm(v)
        if nrm > eps
            push!(vs, v / nrm)
        end
    end

    return vs
end
