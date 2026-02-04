UPDATE tcp
SET
    dx = :dx,
    dy = :dy,
    dz = :dz,
    drx = :drx,
    dry = :dry,
    drz = :drz
WHERE name = :actualName;
