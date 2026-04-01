from pydantic import BaseModel , Field

class User(BaseModel):
    id: int = Field(..., description="User ID")
    name: str = Field(..., description="User name")
    email: str = Field(..., description="User email")

darshan = User(id=1, name="Darshan", email="d7ajudiya@gmail.com")
print(darshan)