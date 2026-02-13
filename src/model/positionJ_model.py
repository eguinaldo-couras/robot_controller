from dataclasses import dataclass, asdict
from typing import Optional, Any

@dataclass
class PositionJModel:
    id: Optional[int] = None
    name: Optional[Any] = None
    j1: float = 0
    j2: float = 0
    j3: float = 0
    j4: float = 0
    j5: float = 0
    j6: float = 0
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