from peewee import *
import uuid

db = SqliteDatabase('database/product.db')

class Product(Model):
    id        = UUIDField(primary_key=True) #Autogenerated key, required for Peewee
    productid = CharField(unique=True)
    name      = CharField()
    desc      = TextField()
    price     = FloatField()
    image     = CharField()

    class Meta:
        database = db

def create():
    db.connect()
    db.create_tables([Product])
    db.close()


def addProduct():
    db.connect()
    id = input("Product ID : ")
    name = input("Product Name : ")
    desc = input("Product Desc : ")
    price = float(input("Product Price : "))
    image = input("Image name : ")
    product = Product(id=uuid.uuid4(), productid=id,name=name,desc=desc, price=price,image=image)
    product.save(force_insert=True)
    db.close()


def delProduct(pid):
    db.connect()
    product = Product.get(Product.productid == pid)
    product.delete_instance()
    db.close()

def new_db():
    create()
    for i in range(3):
        addProduct()

def list_item():
    results = Product.select().dicts()

    for r in list(results):
        print(r)

if __name__ == "__main__":
    new_db()
    list_item()
    # addProduct()
    # delProduct("001")