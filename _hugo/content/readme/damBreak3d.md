---
title: "damBreak3d"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---

# damBreak3d

El objeto de este caso es apreciar el movimiento en el espacio. Para ello, teniendo como referencia las explicaciones de Calum Douglas se toma el ejemplo de damBreak para convertirlo a 3D. 

## damBreak3d/constant

- polyMesh/blockMeshDict

Comenzando por el modelo, se procede a modificar los puntos que delimintan su anchura, para ello, el término z de los vértices de la cara frontal de valor 0.1 se susituye por 2 que corresponde a la misma distancia en x hasta el obstáculo (y cuya medida convertida será de 0.292 m). 

Adicionalmente, se debe aumentar el número de divisiones de cada bloque en z, porque de lo contrario a la hora de definir el volumen del agua más estrecho, como se explica en el apartado siguiente de `setFieldsDict`, el programa daria error, no pudiendo determinar las celdas que tienen agua de las que no.

Finalmente, se añade la frontera de `frontback` para definirla como pared, ya que para que OpenFoam resuelva en 2D, las caras frontal y posterior estaban definidas como `empty` evitando así cálcular en el eje z.

```
convertToMeters 0.146;

vertices
(
    (0 0 0)
    (2 0 0)
    (2.16438 0 0)
    (4 0 0)
    (0 0.32876 0)
    (2 0.32876 0)
    (2.16438 0.32876 0)
    (4 0.32876 0)
    (0 4 0)
    (2 4 0)
    (2.16438 4 0)
    (4 4 0)
    (0 0 2)
    (2 0 2)
    (2.16438 0 2)
    (4 0 2)
    (0 0.32876 2)
    (2 0.32876 2)
    (2.16438 0.32876 2)
    (4 0.32876 2)
    (0 4 2)
    (2 4 2)
    (2.16438 4 2)
    (4 4 2)
);

blocks
(
    hex (0 1 5 4 12 13 17 16) (23 8 8) simpleGrading (1 1 1)
    hex (2 3 7 6 14 15 19 18) (19 8 8) simpleGrading (1 1 1)
    hex (4 5 9 8 16 17 21 20) (23 42 8) simpleGrading (1 1 1)
    hex (5 6 10 9 17 18 22 21) (4 42 8) simpleGrading (1 1 1)
    hex (6 7 11 10 18 19 23 22) (19 42 8) simpleGrading (1 1 1)
);

edges
(
);

boundary
(
    leftWall
    {
        type wall;
        faces
        (
            (0 12 16 4)
            (4 16 20 8)
        );
    }
    rightWall
    {
        type wall;
        faces
        (
            (7 19 15 3)
            (11 23 19 7)
        );
    }
    lowerWall
    {
        type wall;
        faces
        (
            (0 1 13 12)
            (1 5 17 13)
            (5 6 18 17)
            (2 14 18 6)
            (2 3 15 14)
        );
    }
    atmosphere
    {
        type patch;
        faces
        (
            (8 20 21 9)
            (9 21 22 10)
            (10 22 23 11)
        );
    }
    frontback
    {
	type wall;
        faces
        (
	    (0 1 5 4)
	    (4 5 9 8)
	    (5 6 10 9)
	    (2 3 7 6)
	    (6 7 11 10) 
	    //front:
	    (12 13 17 16)
	    (16 17 21 20)
	    (17 18 22 21)
	    (14 15 19 18)
	    (18 19 23 22)
	);
    }
);

mergePatchPairs
(
);


```

## system

- setFieldsDict

Es el fichero donde se delimita el volumen de agua, a diferencia del blockMeshDict en este caso la disposición inicial del fluido se define mediante dos puntos, XYZ mínimo y máximo, que formarán la diagonal del bloque hexagonal. El comando utilizado para ello es `boxToCell`, el cual especifica sobre el modelo la designación de 1 a las celdas en las cuales habrá agua y 0 para las restantes (aire). 

Asimismo, para conseguir un resultado más interesante y visual se opta por variar la anchura del volumen del agua en z. Para ello, aparte de tener en cuenta que no se requiere una conversión de unidades, los puntos no sobrepasarán los límites de las fronteras en ninguno de los ejes, con lo que del primer punto se intercambia el -1 por 0 y el segundo, por ejemplo, con una profundidad de 0.15 < 0.292 m. 

´´´
defaultFieldValues
(
    volScalarFieldValue alpha.water 0
);

regions
(
    boxToCell
    {
        box (0 0 0) (0.1461 0.292 0.15);
        fieldValues
        (
            volScalarFieldValue alpha.water 1
        );
    }
);

´´´

 

