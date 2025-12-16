SELECT 
    id, 
    name, 
    x, 
    y, 
    z, 
    rx, 
    ry, 
    rz, 
    config,
    created_at
FROM cartesian_pose
ORDER BY id DESC;
