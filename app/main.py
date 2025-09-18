from fastapi import FastAPI

from app.api.v1.routes import router as api_router
from app.core.config import settings


def create_application() -> FastAPI:
    """Instantiate the FastAPI application and register routers."""

    application = FastAPI(title=settings.project_name)
    application.include_router(api_router, prefix=settings.api_prefix)
    return application


app = create_application()
