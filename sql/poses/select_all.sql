SELECT 
    id, 
    name, 
    x, 
    y, 
    z, 
    rx, 
    ry, 
    rz, 
    dx,
    dy,
    dz,
    drx,
    dry,
    drz,
    config,
    created_at
FROM tcp
ORDER BY id DESC;
