from fastapi import APIRouter

router = APIRouter(prefix="/health", tags=["health"])


@router.get("", summary="Service health check")
async def health_check() -> dict[str, str]:
    """Return a simple heartbeat payload to verify service availability."""

    return {"status": "ok"}
