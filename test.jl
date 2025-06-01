using Test

include("gram-schmidt.jl")
include("gram-schmidt-robuste.jl")


us = [ [-1.0, 1, -1, 1], [-1.0, 3, -1, 3], [1.0, 3, 5, 7] ]
us1 = [ [-1.0, 1, -1, 1], [-1.0, 3, -1, 3], [-1.0, 3, -1, 3] ]

vs  = gramschmidtrobust(us)
vs1 = gramschmidtrobust(us1)

@test length(vs) == 3    # test sur le nombre de vecteur indépendant
@test length(vs1) == 2   # test sur le nombre de vecteur indépendant

@test norm(vs1[1]) == 1  # test sur la norme des vecteurs
@test norm(vs1[2]) == 1  # test sur la norme des vecteurs

@test dot(vs1[1], vs1[2])  == 0  # test sur l'orthogonalité

