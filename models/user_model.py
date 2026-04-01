from pydantic import BaseModel , Field

class User(BaseModel):
    id: int = Field(..., description="User ID")
    name: str = Field(..., description="User name")
    email: str = Field(..., description="User email")