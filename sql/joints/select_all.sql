SELECT 
    id, 
    name, 
    j1, 
    j2, 
    j3, 
    j4, 
    j5, 
    j6, 
    dx,
    dy,
    dz,
    drx,
    dry,
    drz,
    config,
    created_at
FROM joint
ORDER BY id DESC;
