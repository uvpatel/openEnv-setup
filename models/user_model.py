from pydantic import BaseModel , Field

class User(BaseModel):
    id: int = Field(..., description="User ID")
    name: str = Field(..., description="User name")
    email: str = Field(..., description="User email")


uv = User(id=1, name="John Doe", email="john.doe@example.com")

print(uv)

