# Flap4x

This is a high level overview of the game structure.


1 unit = 1 light year

Galaxy [v]
    Cluster (perlin noise)
        Stars [v]
            All star types with no accompanying planets or bodies, i.e. black holes.
        Bodies [v]
            All body types with no parent star.
        Systems [v]
            Star
                The systems star(s).
            Bodies
                The systems bodies, this includes planets and other smaller bodies like asteroids.

[v] Has a view
