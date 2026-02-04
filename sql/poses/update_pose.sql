UPDATE tcp
SET 
    name = :name,
    x = :x,
    y = :y,
    z = :z,
    rx = :rx,
    ry = :ry,
    rz = :rz,
    config = :config
WHERE name = :actualName
