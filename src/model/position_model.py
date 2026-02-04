from dataclasses import dataclass, asdict
from typing import Optional, Any

@dataclass
class PositionModel:
    id: Optional[int] = None
    name: Optional[Any] = None
    x: float = 0
    y: float = 0
    z: float = 0
    rx: float = 0
    ry: float = 0
    rz: float = 0
    dx: float = 0
    dy: float = 0
    dz: float = 0
    drx: float = 0
    dry: float = 0
    drz: float = 0
    config: int = -1
    created_at: Optional[str] = None 

    def as_dict(self) -> dict:
        return asdict(self)